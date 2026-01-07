Return-Path: <linux-i2c+bounces-14953-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B400CFC8DD
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 09:17:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B280E3007C39
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 08:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525CF28B415;
	Wed,  7 Jan 2026 08:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aul2oRo7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ey14xgLU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE48327281E
	for <linux-i2c@vger.kernel.org>; Wed,  7 Jan 2026 08:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767773836; cv=none; b=czfw0bJsivMqeMcd1q+0+Oig0CM9vywR6XyZKCJUlnwnrZAA1OhQX5hn21SCzOXrGhytz+5p8ftUXFIt8NVSm1FfEJjONs4lQ3SfYDu/Zo7Pytmu1cO1pRsBVWD3LNfExbQcp7y8OcTmva2iqiY1ywsUt5g1d2G7rS8+1dVXxfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767773836; c=relaxed/simple;
	bh=ldXPkGLNn3RJg18xZxfZG7HSQHf0UxCv71TUKV6kLoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ndXfViqjqlgQlRpl+eMW55qdVTpsHNUvdooj1yCCObe4undCLx2YK/lcjNYmoPhc74LoRvTK74jL1T+2N58rGWD9K1HUTfXws2L4boSFHlpKwwxAtZ/aGvosdZPbH7pLryPfk9ESCUX0M4EruHApyGsg8oJTc6E+ofKQbZKiJqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aul2oRo7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ey14xgLU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6072W2DR4136988
	for <linux-i2c@vger.kernel.org>; Wed, 7 Jan 2026 08:17:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U2iE+15PNQebJJTmVX478oR3/nqce794ugguGlPvuY4=; b=Aul2oRo7WPYlZIMS
	rgkpkGBuC54TiaQM3AFEU/gzPpcRCPfeWtC+NSdej51HsExYTlUvx6KLrmvi9/H7
	FtTKTD2WhSaZed3PaiywkECAyVRFah1alXzdWzHLBkxM7fOIc0ng4aiipcWhqCIf
	qJtuF+QQP5zylpYiSmSmLtPfERWSdcJVsRxKZMDIcufL/p76uhxHqOTfchRHR4VD
	mlpPddY20c6N4Mb4T9Jb8vMQdBUHVq4Lj9PJ5vbJ4iVloWa47aYN5+5mebVaKJao
	tRXd6jEV2ajXxS6oFe+naK7q01cwn1YJBRaIf7EAdaegmb1HGultSznYJYbNnuaY
	sP992A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh66e2gag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Wed, 07 Jan 2026 08:17:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a360b8096so48700086d6.0
        for <linux-i2c@vger.kernel.org>; Wed, 07 Jan 2026 00:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767773833; x=1768378633; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U2iE+15PNQebJJTmVX478oR3/nqce794ugguGlPvuY4=;
        b=Ey14xgLUa5ryI+wNAY+urR8dZhfmaYAVdl5adVhaleZEIZD4+GgXrEJUvBgO8RnDJX
         sx7FQw7SStn/c+33Ql+Fishs9wZCT7bqB99PT/94Gs5yIOyMAKU2AnelOLsfEahXIbXB
         U8MRwUeOCBm+hjt51bmg4Poopza/uhzEs0JOq0tTTLVwO1VFiTiy0g8CHHdBzbWyqaLV
         OKd0iNCLohgZ4ILD4RySvU07aV+86qJMNHxuhnzo04ZmIR9Rn/b9qjjTYVXv1FfG9OiE
         pE5JeOpm7k6CSotSctqPrpwLpN1lphS6JErwRpp0zBTsH6IZXLpktxfRi+VwmtbvDLzJ
         31nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767773833; x=1768378633;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U2iE+15PNQebJJTmVX478oR3/nqce794ugguGlPvuY4=;
        b=pl9Z3DWJ/VlJMZTxWfwcGL65tCILULkv77+Xw5yoIlmhpouZYlk7O8BrNUsZASbD10
         63lHi+0mDPHwLZRyAdIgBi19FCPyyQj6NaRvSP4XXmS7CocceU1w8ve1/YVaFVzonEmQ
         y+iVy+WhGLxEaCUQ2QWQsuqhSqvf9VYJLGqhy1eViXTaro7a9+A8yvsjam3pLow/mIx6
         1PRJFp62+eC0JwWGXR2J7w9fntr5ynr3JAx2DoLQlGYSgVDVUN4Jf+jdti+0/xj8Qbcl
         9RK3I1GBX+Amg5qVz+RXTu25k9vC7n8i5d5NVoewS4vzUXEvrBB9qtL6Rzolq5lDowAH
         JHxw==
X-Forwarded-Encrypted: i=1; AJvYcCWA3kt2DHYT5q5wHX2kf3VHIXhsiVUEG7UlnV4CfMEbG2MJiyVwJ304O3e4KCGuBGC0uQa4mOWrVE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC8KnliXZBFiyFHoJ2REPjOM1j+IAbB0sCo2jNgT5RIPQLJVLY
	0q8iskdvQhYkortQunqbC50OE8RRKYkh1wlGmcRZnxbzOCFxIT+lN7D/VDlMKD1mtkRWXu22La3
	i0GT0xHttXBlEDGpd3yGk4zWEC0WcXic4z0XxD/hRpNAW2lgJ/FhY8Eq9miBA7JE=
X-Gm-Gg: AY/fxX6TFRFA3fmvmhRts1Fg1XjxuNIKZat9+DcGJntaIn83ELRc0eiYkL0/AAcgsQk
	9mM3rdhSoAz2Qwoxo45tWV0FDoUM9lueuIu6uUmqs7rH+no3EXy6kOPIZGxJkx2vLCtbdqRW9Je
	KjOse6DV7rd34S4kkomvofXEZgyr/rLFH8Gi0O83H6hEJdzqafOlq3zyaTry5t0FhkThMjwVeDw
	fvQZW6JXu1i0YEVT1p8iCgP4WyurYLnWCJPOnynk/Vap5kpuvtGgkPGpKwfYEpmGx6M/lSXQkDd
	r/eJWK/O7pxsXKtx7IcHvLyJn6J1hU8ZwqNdEptbJs2Rr7HkiobHgn21OO8RfgS2hGHloTUWREr
	VLlXv/PHenMinIXQbyurpMT5acH4pZfK8eSIFAhjzsuLlpNKMW41ak/SIsb/fJPf4jPxIZTtq
X-Received: by 2002:a05:6214:5906:b0:880:4dd2:1d15 with SMTP id 6a1803df08f44-89084234e9fmr20476226d6.44.1767773833010;
        Wed, 07 Jan 2026 00:17:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgI2M46l1hZz0zobajaGBNbSLWEqTTf+RNOEJNRuWYa5RNpyEqJHelvJSG2u3yIkeg2cdpxQ==
X-Received: by 2002:a05:6214:5906:b0:880:4dd2:1d15 with SMTP id 6a1803df08f44-89084234e9fmr20476096d6.44.1767773832565;
        Wed, 07 Jan 2026 00:17:12 -0800 (PST)
Received: from [10.38.247.225] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077268016sm28921426d6.46.2026.01.07.00.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 00:17:12 -0800 (PST)
Message-ID: <6a74e675-b011-4e1d-860c-4c3232beb2a2@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 16:17:04 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
 <20260106-sm6150_evk-v2-1-bb112cb83d74@oss.qualcomm.com>
 <20260107-tungsten-barracuda-of-management-5edb0b@quoll>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260107-tungsten-barracuda-of-management-5edb0b@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA2NiBTYWx0ZWRfXzRJhu0QVtIaD
 ufTIYUIaLtK1xPGuCiHwIVFslEn4r43q/Hcl74Ns22mzT4l2fmzOi4iBSBGjUApp07a70+yIbhe
 O5558Kz0FtfTOd/a94aNWH1afETGKKoQcPHhKlzXXijprdO+sY9nTGEQTc6dzjt9aHntLq1uhUm
 rypX2AQY0nLjnI6lYMBdaqkm/iNDHuxYgD8oSRYScYV1fV4lDrs9kIghprQZxIqIjUwUXYZT3Qu
 tGNEBvKtKREIV4qyF/fUc28mqRGzD7BFu2eyyNE8ENf1y5HZI6oBpddNRsIGXb92Qnc5RJQG8GE
 u2wlxZfIzeNhRtvwe7dF7O1iJ/EPaqML19tSvXJwM6Hj42kqYnT1RU0fNMosZ9lhDqeQGaFNDfd
 7gY+1+oRPtEgbBScH8ljQovXibpPL118HZdsFynpHgl8E9HZQ3ANZn0Y0H7lVM3y2afnjNTdGXo
 o/oW0v4iPuL4wgAUP+g==
X-Proofpoint-GUID: vspjUgtGKJnoTdHVbccS7kv6F5VHKmQd
X-Proofpoint-ORIG-GUID: vspjUgtGKJnoTdHVbccS7kv6F5VHKmQd
X-Authority-Analysis: v=2.4 cv=evHSD4pX c=1 sm=1 tr=0 ts=695e168a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=BatDUjzfUMZcbphu-t4A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070066



On 1/7/2026 4:00 PM, Krzysztof Kozlowski wrote:
> On Tue, Jan 06, 2026 at 05:39:53PM +0800, Wenmeng Liu wrote:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,sm6150-cci
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 3
>> +          maxItems: 3
>> +        clock-names:
>> +          items:
>> +            - const: soc_ahb
> 
> Same question as before. I did not see any resolution of this in
> changelog or commit msg.
> 
Will update commit msg in next version:

For this platform, it uses soc_ahb instead of camnoc_axi.



How about this?

Thanks,
Wenmeng



