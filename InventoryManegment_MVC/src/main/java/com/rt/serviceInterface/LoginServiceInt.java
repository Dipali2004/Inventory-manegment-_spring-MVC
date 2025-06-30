package com.rt.serviceInterface;

import com.rt.DTO.ReqLoginDTO;
import com.rt.DTO.RespLoginDTO;

public interface LoginServiceInt {

	RespLoginDTO login(ReqLoginDTO reqLoginDTO);

}
