class SegmentLR extends Model {
  
  SegmentLR(ControlPoint cp1, ControlPoint cp2) {
    AddControlPoint(cp1);
    AddControlPoint(cp2);
  }
  
   public void Draw() {
     if (m_controlPoints.size() == 2) {
       ControlPoint cp1 = m_controlPoints.get(0);
       ControlPoint cp2 = m_controlPoints.get(1);
       
       int xTop, yTop, xBottom, yBottom;
       
       if (cp1.GetPos().y < cp2.GetPos().y) {
         xBottom = (int)cp1.GetPos().x;
         yBottom = (int)cp1.GetPos().y;
         xTop = (int)cp2.GetPos().x;
         yTop = (int)cp2.GetPos().y;
       } else {
         xBottom = (int)cp2.GetPos().x;
         yBottom = (int)cp2.GetPos().y;
         xTop = (int)cp1.GetPos().x;
         yTop = (int)cp1.GetPos().y;
       }
       
       // Segment Left
       int y;
       int x = xBottom;
       int num = xTop - xBottom;
       int den = yTop - yBottom;
       int increment = den - 1;
       int Q;
       for (y = yBottom ; y < yTop ; y++){
         DrawPixel(x, y, color(255,0,0));
         increment += num;
         Q = increment / den;
         x += Q;
         increment -= Q * den;
       }
       
       if (cp1.GetPos().x < cp2.GetPos().x) {
         xBottom = (int)cp1.GetPos().x;
         yBottom = (int)cp1.GetPos().y;
         xTop = (int)cp2.GetPos().x;
         yTop = (int)cp2.GetPos().y;
       } else {
         xBottom = (int)cp2.GetPos().x;
         yBottom = (int)cp2.GetPos().y;
         xTop = (int)cp1.GetPos().x;
         yTop = (int)cp1.GetPos().y;
       }
       
       //Segment Right
       y = yBottom;
       num = yTop - yBottom;
       den = xTop - xBottom;
       increment = den - 1;
       for (x = xBottom ; x < xTop ; x++){
         DrawPixel(x, y, color(0,255,0));
         increment += num;
         Q = increment / den;
         y += Q;
         increment -= Q * den;
       }
     }
     super.Draw();
   }
}
