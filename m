Return-Path: <linux-i2c+bounces-14251-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B58C834E1
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Nov 2025 05:03:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 599C54E1E50
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Nov 2025 04:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B793427FD4B;
	Tue, 25 Nov 2025 04:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iTOjykQM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BMA44kIB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BDE223DD6
	for <linux-i2c@vger.kernel.org>; Tue, 25 Nov 2025 04:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764043422; cv=none; b=AEpXjs/0pwrzfaAN0WskSHhdu9ua8zvx6Ezx/LP+50fTxLDlw/N6yU2IRRYnSaz1YaTMG7PwwgTow29W8catxT+XQAM2u6hzfm8kMjwAVHT9YyfIuo+CX/PtuOQIQhd9x8FVv5uj9n+W0ce+NMY4m+tLJMKHglnMUSLJCRnhOlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764043422; c=relaxed/simple;
	bh=k2GS4P5SjOGTn2hwGSYALJoFfEQ0BxzyyK0D8wDyZv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i1+2EjqVgoDHIT1d26ts9T4AnD3ktqBPCSfevlfQYVG/sNGdkEsVbZ/mm1UwYPHiiNfuCkKEx+y0/GhWr23CeqNuRh752wbhS7SOXLCodBnEIhZvlsfuj6w+WP/Wa4S1dRc9xUgLFu4kZA6Vn3WQJFLtFAaJfN518Fl6Giev5+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iTOjykQM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BMA44kIB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP2gceP1232119
	for <linux-i2c@vger.kernel.org>; Tue, 25 Nov 2025 04:03:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iJAan29NfWgHaIXPs2LbrGAwitqmKY5u7Inpq94wzsg=; b=iTOjykQMRLRilt7N
	UKJCyh8hJwNEfSrRgfe4WmmIwvLn1+jbFFd58QNJocyM/JjqQyTd64mgy4widJyJ
	vAnKKi4OK7ahfFNl2cyMUvExBZd7Cvgam8vOgIutvNJZ1xaTSyK96VvhX8rK+v63
	ppKD2MRHFKZOmdeF4T6TjiKAob15X/38nVc3kV+b2ILXUF8xyZ2GKvqflXXfFiXx
	Yxq6L09XQ8yggiOU0VrLQRwVdLiEIYyyVFDPnUZZv9ppTH5PMIdkqxZr6zToP4ff
	VcIolwpn6ggcoP4imSC4otiSaTgh2xdicqG1fgzkeVuHVUMjy2TFSSvHc7bCO4EQ
	bLYI8g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an0xygmsw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 25 Nov 2025 04:03:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2982dec5ccbso109434865ad.3
        for <linux-i2c@vger.kernel.org>; Mon, 24 Nov 2025 20:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764043419; x=1764648219; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iJAan29NfWgHaIXPs2LbrGAwitqmKY5u7Inpq94wzsg=;
        b=BMA44kIBvb8mJTQHZauSJFkaX1Fc3gO5QNHqySjCke2zCLKa1RCwD5ROKcYm9tVbNL
         RX2On7PPWbL38uxCbr8fXs3DnqTd5vyQqeNuakeiSqir4NycjI5cWi+6UVFpvK0kGruc
         14Hl+c18T06evoqTntQVn6IVwvEm/HVcfQhnpSvQ45H+Wk4ipP6Ee/Vv86X5cuiIfqwI
         iVvkT2rAjcA6Nee+DkfBYPp7HO1Hh3zL/2XZCk3vJYofWcyIsHmWu9teCVj3Wjw4KWfj
         ImkeF4vvG6itjRTofND86xpom5Ijm/b6FA2AMLxQx9b0n/kVB08aF+THpWGd1eStDJuQ
         uC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764043419; x=1764648219;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iJAan29NfWgHaIXPs2LbrGAwitqmKY5u7Inpq94wzsg=;
        b=m9tHthPVgwsZoxgcdybDkfAy55GI1XKVz0X4+2pMNhE3CxDpG8hNOA4rBD9rRxcQ3E
         /UyAfe4fhMHqf1U79wLikrTW4rgAAGHTl9nE/04SalLpyiAbtBROijUQf8Sbq+v9zekc
         cNdrWPhqRGy87UU3SGvZLOGHI8YxGnEqnZCdSkqn4C4SLIeQCNV82ht/26M+YSVK1ib8
         lF1HrZKCF9nT7XMRf/XqGwLfR3MJoKZ/gX6ot8JGD/tTW91vq/gwjbGPQQrZHLcvlDry
         XNoIcl6FSR8tP9R6ObdWqgjynRGQSy1LbA86q0DItzHoOZ/WVJ3fp/8MGxP+EtKp5lL1
         VDug==
X-Forwarded-Encrypted: i=1; AJvYcCUMklJV5qOH2/ge5H8XiKRDb6ZPRc0BEmCGuus8RXxRlr+I/PnjYufN+gPtOuLF7vsAvcWkVCNANFM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjOPNQnNFTmK00vpGhS5LfoeOw/Iutud5nKv20zXX+zJEWrLBF
	uUi/6mQdfYP/cTLN1zcnTp2hww/MHApby9qyt2T9tITqpcUevk48tb2Z0hp4GD0BaIAydQJ81JG
	SgwG9tmRxVJUxTbJM+py1/FBgIDPpLNdjLS9qBXNX2AkziUCaiScCZA57lrfcjWU=
X-Gm-Gg: ASbGncs/SDtQfwUTaRhxxGI021YLtwlM1+YyTo832KT0FcpbgTVV0aqMZIBx79Wgrb2
	kt0GTi5xThRxTDLOU6ncEDgFb31SQaTREJ02Jmqcs/vSvB0AeLl34yFDInxwRYpMZx8YWozv7F7
	G42KVSuU7qi2fx9xcvduHKSmqMS1qqV/y9jIVOHdBPViHrQ5LC6cJDifVGQ/IHB/zkCKkxiuMSc
	jZqAYnM3z5bLlS4a9hGnqyqHkteJKoQLf5FM0Ezjax3jh0w2NHS293J+z2PwXTMgHF1SXfjYz0B
	OPgd8VFB8X3T9CGQ6J6LiuHLlikjd7q13dflsIdVpTQCk3yFuGz0OIhLT60r4AWrvI8tpVHJGW0
	1xdM3U8Pl1gonBYAE4M/Moy0PLiWNrFdPSiczZfWLzw==
X-Received: by 2002:a17:903:19d0:b0:295:2276:6704 with SMTP id d9443c01a7336-29b6c6cdf6cmr129665415ad.51.1764043419308;
        Mon, 24 Nov 2025 20:03:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEd/OVAmEmn14OXrHOQkPdPyyGneeaBeJEM4duM1dJGYj7jDrXbUvk8iKDwsZaTE0sXS7pOg==
X-Received: by 2002:a17:903:19d0:b0:295:2276:6704 with SMTP id d9443c01a7336-29b6c6cdf6cmr129665135ad.51.1764043418737;
        Mon, 24 Nov 2025 20:03:38 -0800 (PST)
Received: from [10.218.32.171] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b111acfsm152248715ad.19.2025.11.24.20.03.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 20:03:37 -0800 (PST)
Message-ID: <98c74c0e-2ca3-4139-a906-620c061dac5a@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 09:33:30 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/12] dt-bindings: i2c: Describe SA8255p
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, psodagud@quicinc.com, djaggi@quicinc.com,
        quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
        quic_arandive@quicinc.com, quic_shazhuss@quicinc.com,
        Nikunj Kela <quic_nkela@quicinc.com>
References: <20251122050018.283669-1-praveen.talari@oss.qualcomm.com>
 <20251122050018.283669-8-praveen.talari@oss.qualcomm.com>
 <20251122-rich-imported-buzzard-b7aae7@kuoka>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <20251122-rich-imported-buzzard-b7aae7@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=S+bUAYsP c=1 sm=1 tr=0 ts=69252a9c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=HWnqrvMQCMn6R42oSBoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDAzMCBTYWx0ZWRfX3MXy6QSDcmSC
 t2TZLDBfO7YFzfEyoifYrbL4gyVDMBhomg8y20RpPKMZI52sEMfxzXL781Jahu8wAQG5ZpSRFcA
 Pb42/wQoCbio5iI5opxjv39fT9f+TMgysvKoR/0Wh1ata3dufydAYXdaJjkpX6SiFu8EizHkF0C
 Drl7J/t1hir0NLb+k+JQ9LBV17dQlmBvzgqe7xfAeS7PU4vgDpo15NgI2i43y8g8mK2+wnBHA+Q
 s9mqN4j1Y28UXqwBL3bg+Fd4j4IGwAZsRtFLLPdwxwzM8zjb1+YwEwCcwTfdS3AEPAxR3fiY4oj
 a4b3Xk1lOfn5a2YtQOxpD3OlYZt+endLt33DLyo4zY4Vpuy+7MsoBclHCNaMX7r3FD3jCIlFmrB
 AupTCh9XFnYvhvl3kOrQJ527YYtV+A==
X-Proofpoint-ORIG-GUID: Wrop_AsNkgf0SQQyM6iHjvNcoVLn2mRT
X-Proofpoint-GUID: Wrop_AsNkgf0SQQyM6iHjvNcoVLn2mRT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250030

Hi Krzysztof,

Thank you for review.

On 11/22/2025 5:10 PM, Krzysztof Kozlowski wrote:
> On Sat, Nov 22, 2025 at 10:30:13AM +0530, Praveen Talari wrote:
>> +  dmas:
>> +    maxItems: 2
>> +
>> +  dma-names:
>> +    items:
>> +      - const: tx
>> +      - const: rx
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    minItems: 2
> 
> Drop

sure, will do it in next version.

> 
>> +    maxItems: 2
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: power
>> +      - const: perf
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - power-domains
>> +
>> +allOf:
> 
> So common SE properties are not applicable? If so explain why in the
> commit msg.

Are you referring to clocks, ICC paths, and pin control?
Please let me know if I’m mistaken.

> 
>> +  - $ref: /schemas/i2c/i2c-controller.yaml#
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    i2c@a90000 {
>> +        compatible = "qcom,sa8255p-geni-i2c";
>> +        reg = <0xa90000 0x4000>;
>> +        interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
>> +        power-domains = <&scmi0_pd 0>, <&scmi0_dvfs 0>;
>> +        power-domain-names = "power", "perf";
> 
> dmas and dma-names

sure.

Thanks,
Praveen

> 
> Best regards,
> Krzysztof
> 

