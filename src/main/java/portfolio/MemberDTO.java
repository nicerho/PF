package portfolio;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberDTO {
/*
 * madd 1 : 우편번호
 * madd 2 : 도로명주소
 * madd 3 : 상세주소
 * mmarket1 : 이메일
 * mmarket2 : 전화
 * mmarket3 : 우편물
 * mmarket4 : SMS(문자메세지)
 * */
private String mno,mname,mid,mpw,mtel,memail,madd1,madd2,madd3,mmarket1,mmarket2,mmarket3,mmarket4,mdate;
}
