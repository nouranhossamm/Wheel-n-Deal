package com.graduationproject.controllers;

import com.graduationproject.DTOs.optDTOs.OtpRequest;
import com.graduationproject.DTOs.optDTOs.OtpResponseDto;
import com.graduationproject.DTOs.optDTOs.OtpValidationRequest;
import com.graduationproject.services.impl.SmsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin
@RequestMapping("api/v1/OTP")
public class OTPController {

    @Autowired
    private SmsServiceImpl smsService;

    @PostMapping("/send-otp")
    public OtpResponseDto sendOtp(@RequestBody OtpRequest otpRequest) {
        return smsService.sendSMS(otpRequest);
    }

    @PostMapping("/validate-otp")
    public String validateOtp(@RequestBody OtpValidationRequest otpValidationRequest) {
        return smsService.validateOtp(otpValidationRequest);
    }
}
