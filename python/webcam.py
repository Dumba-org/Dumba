import cv2
from fastapi import FastAPI
from fastapi.responses import StreamingResponse, HTMLResponse

app = FastAPI()

vc = cv2.VideoCapture(0)

@app.get('/')
def index():
    with open('index.html') as f:
        html = f.read()
    return HTMLResponse(html)

@app.get('/video_feed')
def video_feed():
    return StreamingResponse(webcam(), media_type="multipart/x-mixed-replace;boundary=frame")


def webcam():
    if vc.isOpened(): # try to get the first frame
        rval, frame = vc.read()
    else:
        rval = False

    while rval:
        rval, frame = vc.read()

        _, frame = cv2.imencode('.jpg', frame)
        image = frame.tobytes()
        yield (b'--frame\r\n'
               b'Content-Type: image/jpeg\r\n\r\n' + image + b'\r\n\r\n')
        key = cv2.waitKey(20)
        if key == 27: # exit on ESC
            break

    vc.release()