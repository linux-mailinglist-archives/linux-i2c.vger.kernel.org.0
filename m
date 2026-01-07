Return-Path: <linux-i2c+bounces-14939-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DDECBCFBCCE
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 04:07:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60F3230386A5
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 03:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92F26255F57;
	Wed,  7 Jan 2026 03:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDlxSXkt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SwQqZx5x"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7CB2459ED
	for <linux-i2c@vger.kernel.org>; Wed,  7 Jan 2026 03:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767755219; cv=none; b=TYqLdyJ/cKI3hw8XF5pezS1FLTP4FrnALgeUR39VH2XALpjGmG5NUGxaBtFoLyYYH+zlp+8rhyhyEyuXiV7bTcLdeZ9vXmd/TN+ygMOoMOU3Xe9EsHqVPvvpDTMlmfNxL5gJQl9yZH0qjsZE8dnNWveox0BM2gjon1UHqD9UcX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767755219; c=relaxed/simple;
	bh=wWG/+iM60aN6jRFY9oLk0sPaldjfqc6lbv5zT46e3dc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r2GCi0Xyhg64Ho7EcONPrZVcHOkwc5U9+O5RcusnCqhAysPAKXYOFTEt02StstPBp8O0shoQUrcUc/EJBYwqx9mi5W3yZKhC/wW6sSgPNDDHVNPZKVKUDZNrwdvgBpL4Se3rJfONMQ+8dti2YuS7fHEr90RbZK9DVXIbsnCLivU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDlxSXkt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SwQqZx5x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606NXQ5n322965
	for <linux-i2c@vger.kernel.org>; Wed, 7 Jan 2026 03:06:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6/WCZqC1dn94RJMZksnlRPZYt/+qztP8BiWgjfVsWxE=; b=lDlxSXktCe52+TSm
	74/LwSRaXLPkfz/SnuQdXf18csy3SARG2UyW1yOV7TSe7GJhKxN1eGObiaLn6BZS
	EVkzjA/0z/SABcylValnf3PInfPtxTk23hUA8N23w33Dn82d3+8YURQp4Ya3L7GU
	MgyyOxFBiIr0hjOdaFQx/r0PHRT/oZA9nEN/3EFtNBTvlXmBhzB9rBVX340bNzXL
	OvUodKBle4ouV+KyXhr9tyEZmpQ86sGZKEbK/28ZwIEPusRBziBqTjPlEvoM+8bk
	M7/WF9dXXbKJrmUC5gizvVsaxx3gDNgmtyGvaqiHocs/70mAeXAEAfQJg4V5EV/7
	UdQiPg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh4crhw1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Wed, 07 Jan 2026 03:06:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b51db8ebd9so556417185a.2
        for <linux-i2c@vger.kernel.org>; Tue, 06 Jan 2026 19:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767755216; x=1768360016; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6/WCZqC1dn94RJMZksnlRPZYt/+qztP8BiWgjfVsWxE=;
        b=SwQqZx5xAA+qzTlpaY6wH2k6GUqAW2Z6His81EaVTbGdFL6VqAGjdeJiIHqbtud4HX
         jIdHdTi3rzFFZf8kUWOUK9Pk4heejO2C3wYxCMmtpDhVhwk8diV/RgQttw7RlsQA/vPq
         uW72xBUt7LgAkvUcSwILmStH/6zyM8y9lPB61zBxyRMEVpJuj6Pj/e6+qUeBXI0DKZ69
         o13oEwFBk1x84D7YRkXNU3cMw6EdSK4TB0n6BJt92u+YYZ5nUAMxkvVqLtfLNpGhw+Px
         rXi6+Zm2xy/NNfuZHgyCOsXnEEVdtM4ctQw3KKMG6Z2Y2AjEhdYpJM0EkiiHXmTQHvz5
         9CXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767755216; x=1768360016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6/WCZqC1dn94RJMZksnlRPZYt/+qztP8BiWgjfVsWxE=;
        b=lyKLY2VAddTYAjm39xUETqxNRdCQ9IRBJbicBbfVEs1TYgRleWEnfOn8Yx9Nv5LLJ+
         vcuPztNLQV+xv8utKsIg432dfDACDbrHrXvLU9E3emDrG8cX3gHu5GeV320EN9QEsRo7
         O8Ayg5ZxdZSeoVedXi7iPLS9XYpFIVmPGArGrXcp/oDVMD4A2KrG5d45h1mAvboHzxtD
         wpWN0IMfaek4dBy8wZBhMhaGSvzSQ6QpO3G8uwRKLA12dVbnWZ3tUF5vGVRdWBbHsBw4
         PlHu4V1rXSe87CTK8TYu2X2L/8WxXm9DPX5wJICp5PGr5MnP4wzvxPRPzHWZdVzEDa8x
         cr/g==
X-Forwarded-Encrypted: i=1; AJvYcCUbZ/I6+AtX8Api0okLCff8I9py04rwPMvdnHCE3KIaSn4rdJX0i8WzjTni6OeI5sJESWV7WD158Es=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkT0wDajjgkpo1nqDHXCKbEQHAwl5S0p+KmLbslCFwFmNIbRvZ
	u5GrOkwc9I50pJXua5SlKCsajQwfbHBaGlKv8RPpJyNSU349vnh0QRb27sGRZvZrJIUw/V/3T7E
	dbsCuwleOSOjz1Ctx//1nk8KndmroUs0AYoDgYULj77AUWedx4s3eBejxhSgC7xc=
X-Gm-Gg: AY/fxX5kzytVCRP4DtI6rDbSftQ5ZsY1LtIGKu7Tc2DJyVN/Wf6k32s3Ni6UMjSb2sP
	Sun5O3YkZbHdDMK/vJtSZx7gUZzJ1Be3KZihyGX/gy4JaK4lkdExA44ZWAGJ1vbZOtWfvFG/nFd
	COnKevKEEE27ARUvIxFyGLDaDUBw0Mz5fpUp/9tKAcophPOuGSu4k8Fa1hpDGe/b0wNLpqJ9XR4
	I1jkeovN8B0M0x8kGwX16ePRVxWkQLTOtkp3S2SVKd9e0Y8ncw5k88fHW2CrXo/rOpKfoLo7ECI
	pEi/yaLukQXukNXQBxoyfsm3dXMUsLDVNOdTyw0/BEsEXYpxRcmdrZr7f3w+7bDHohoWT3fq79J
	s0E+d8X6s1e6qGhrMtBMzpuq6aftPhHCln2UM19P0wuwDBmQQJ/lzt4Fp4McOJpCMWJkKJ2HT
X-Received: by 2002:a05:620a:4145:b0:8b1:1585:2252 with SMTP id af79cd13be357-8c389379d10mr145745685a.1.1767755215990;
        Tue, 06 Jan 2026 19:06:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkrbOP3pew5z1yemj/keUd/L05CmKhUKWFQIvhbUiGyiMtZnJ4i3zNlrw2hEVMpdT9iDsqzA==
X-Received: by 2002:a05:620a:4145:b0:8b1:1585:2252 with SMTP id af79cd13be357-8c389379d10mr145743385a.1.1767755215591;
        Tue, 06 Jan 2026 19:06:55 -0800 (PST)
Received: from [10.38.247.225] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8907725ffc7sm25347946d6.44.2026.01.06.19.06.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 19:06:55 -0800 (PST)
Message-ID: <ac431daa-a9d1-4415-929b-87c1b9a08f0d@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 11:06:48 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Rob Herring <robh@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
 <20260106-sm6150_evk-v2-4-bb112cb83d74@oss.qualcomm.com>
 <20260106192609.GA2581379-robh@kernel.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260106192609.GA2581379-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V9FwEOni c=1 sm=1 tr=0 ts=695dcdd1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=vx6dLVQq4s5TLBKspagA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: YrYHLPNsUu5SVGaKbiWOYdgv_u4gGIyL
X-Proofpoint-GUID: YrYHLPNsUu5SVGaKbiWOYdgv_u4gGIyL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDAyNCBTYWx0ZWRfX8iyORlkY/Ry0
 i7xNySaTwDL6A45ANORKskz2ihZGfa/zrQKRyOubqrVnxUgZIw2nQhYSiG8syt7YVmG9fDIWb++
 uIX9Ggo7aVWRLwaWHoHxgKUr/6hPMGf1TAoFo1IFVlZa3u/hkJd2tETaZ1vmJ/NJ2Ae0V2BJhKz
 mFiMoIamqCxjMVh1wFgQeeoBdef9qDpJu/Jdku3rovBsoX7Dk5rqGJhbRPyuGt+lhUwzVRt2hNg
 1ot7//a1Pzc5t4YyBTSU3qQuY8F+D4HNhrk6zieddzR8b/0+C/yLXxX8/h2xOW95Rf1BAkh2UpY
 6lLz7PVwqI/EUfA+H9TJza6Rh86QWQKzxpzjNiPSFVD+Q+9vuuqqx809RMybZmeM9SXTpJUJURE
 jmptWtrfygQulNFto/z7EaFnBhxVGe0itqAttWFMAa9ArzOAxZm1AjiPx+bSxq6EdymgyVNK/q3
 5GAIpIYbysrbqPLTOTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070024



On 1/7/2026 3:26 AM, Rob Herring wrote:
> On Tue, Jan 06, 2026 at 05:39:56PM +0800, Wenmeng Liu wrote:
>> Enable IMX577 via CCI on Taloss EVK Core Kit.
>>
>> The Talos EVK board does not include a camera sensor
>> by default, this overlay reflects the possibility of
>> attaching an optional camera sensor.
>> For this reason, the camera sensor configuration is
>> placed in talos-evk-camera.dtso, rather than
>> modifying the base talos-evk.dts.
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile              |  2 +
>>   arch/arm64/boot/dts/qcom/talos-evk-camera.dtso | 63 ++++++++++++++++++++++++++
>>   2 files changed, 65 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 4258776b71bdba351de8cefa33eb29a0fe3ec6f3..bfaa0b47ab5cabc9aa1c6fba29faa3e6fd18f913 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -333,8 +333,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
>> +talos-evk-camera-dtbs	:= talos-evk.dtb talos-evk-camera.dtbo
> 
> You need to add talos-evk-camera.dtbo to dtb-y if you want it preserved
> and able to be installed (via dtbs_install). If you don't want that,
> then why is it a .dtbo?
> 
> Looks like other .dtbo's might have the same issue.

Will fix it in next version.

Thanks,
Wenmeng>
>>   talos-evk-lvds-auo,g133han01-dtbs	:= \
>>   	talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
>> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
>>   x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
>>   dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb


