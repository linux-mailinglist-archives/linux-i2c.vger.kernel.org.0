Return-Path: <linux-i2c+bounces-14670-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 957ACCD5450
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Dec 2025 10:14:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D45F4301C3F2
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Dec 2025 09:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E1F30E839;
	Mon, 22 Dec 2025 09:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NNXk8MHW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bmiVTqqn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577D930C37B
	for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 09:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766394813; cv=none; b=Q4rbFukqWH1wnQsSJjtLNVB5H3a+ghUhu1VO4ie5TNl6L3+pjMAGXtXHCw+ey+acsKE0nLyRik2JOdNP0oD4l3eIISA48xXKO45xCHL3gdkGmUqdkyavTgQQRYGcah7D/JXbJb4CnIfqRFA7WP2VKkDwX2jhp5N5L/tvC2W4BmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766394813; c=relaxed/simple;
	bh=BJeOqXkJ+gmd4ey7vsHhoKygIOlUYG3FMgsO3Hglj5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hE3LAscsDhDHiX+dQqPvpuf+/Qa0uI3SOyDbD4p4DqWVzJ6ERzaDxcxg6i/xBATG44PPMnzOvRq10uf4nnMZ8MaZCWahb1jFT7IKm/QkScxmoyAEiSjaN77spMkUifYxKI+wCk3hD19KVMl7WhTJf8YgEwLm5KXA8bLopUJ2Y1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NNXk8MHW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bmiVTqqn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM81Xd04116971
	for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 09:13:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IqF0tpex94rpEoICa6Aj75C9O9nCknYNwHd+NudJrug=; b=NNXk8MHWCtebpRqC
	M8Zghky+FRh469zAi+tkykKpj6fgrx3H17BU+MsyNGF5S/Tws0hPA73FygFTZ6nW
	URmKNvV3/yEDYiIXgBfVD5L8DYRPBG5HJY8hZNHcPRs6MdMsZ9jbTI1MXIa2Yhqq
	L/3UDzfedTj0no+0xurYBeIjWYqzYG4XxdErZfvLq2JD14kYN7mE7T/mQ0QNE/xh
	9t/JD0GXX9FPnW6v8v4/fjDNYcY/Wy4N6RpgKKMdd7p8OHunJ970AYZBNtIKxOad
	bmg+yc5ONttLC2sotabDwiZ/CO6NXTFOy5UK1eUhgno+qkarH0Uat8tpGJp4jhF3
	WdRSjA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mux4ekk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 09:13:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b24a25cff5so1095930485a.2
        for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 01:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766394810; x=1766999610; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IqF0tpex94rpEoICa6Aj75C9O9nCknYNwHd+NudJrug=;
        b=bmiVTqqnVdfP1ObpOluOScGYkJBSxvqsi5LY7K5I3n1HLEqTdf+MpsiQcZdEM4MI4Z
         bRLX5+lPw1kzBiCYZ5IBJvVa9RXL4+4H8OEpDevY4YwO9i7F5M5CZEGl1ueZA6JDw3cR
         QVlDMx7E7RixkjDSAi/iYmW820tOF8Pj/bUxwyzzsTxC42qiCQOomkWnBWIQucMSiszY
         gv/HoTg4CosZplEjM1z6N/XKkN68oGOcNNHNIHVE6yn7T5NSpFrdMaVZfT98HMyX6JYr
         2ImE8Bs+fO/6T1H3N4X6ew+JUr3mm2YK+wjHZUqWwTK/uDD/gZ/cQoLUZc6oXZzOprI0
         897w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766394810; x=1766999610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IqF0tpex94rpEoICa6Aj75C9O9nCknYNwHd+NudJrug=;
        b=KikKye0I1Hqvn4jHKZsMgRCGtruL7tSHrV+zKURkcgHVADrEi36nkSPsNosa0SNfE9
         9IPWj1qPs/gOvUyLuztQpzrf4UHxDYTca1raZHzETXJ8FoCN12opb8MntaYRe4pOIC8f
         mLvh2OZ3Vh4SCKV+v33weZUtpcjWxvGwg19gdCHmk6L+ViJcQ8aYRwtbWBxOYlf4Ge9T
         nG/4J+E9KvsRRzh3n0CJE2Y36iN0oNCKQ/tLlU5L4mXLqwBw/OQ66npXAMy2/ctt1yVj
         P7q5CzLdF64VT3WOLPPimTCYthqc9BJFILl0u+x4b7bz1I/mPQZNIJxaoZQA1uaT0ypS
         C5RQ==
X-Forwarded-Encrypted: i=1; AJvYcCW47lXeuYFWK5kNF9I2OepTKPI3u0WaSBggkzgfBl+Ejw6mXzDFnlsbpKq5JRK22CieH86pzSncYQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeDSbEUf2mLu2omUQ+3on8S12UDXv/9rgWsf6mkl3X/6Vza4zU
	JmT+HvHgSSOUDF/mc/CeZaFZHIn9KglbGHe16T7eyrLoyVadO0bf1KL1b2wMTv2RlVOJiyIPt44
	az0NdBCoHTr1MJ6iGbunWe3O55AI+efcNgRXm94GdLRDAsKp0R/s1ZJ9q3ipQidA=
X-Gm-Gg: AY/fxX5uqyjHtOvNilgfQFQ/4Ha5H9KmU4zDcaW87ZG10gFiFXQDiAvhSyUXNjCD5A1
	4O1kQnHjQ0nNnH+/AGcmPOWTw2R1K+m2JJ88RnhjTmQuptB0M2K8RqZfAzhezm95RFI4PEj85u+
	5Imx5fBVd/UEURRiX2yxk/W6VfWF+AasPB9B+qIg4u2Ew8fezLEoownVW+FzrOkkrzWWD1QRC9c
	kBCh5Yj/+R6YFvRDyE/hPmstuVbHvblM0f/Hbz2a2tfvJGVS9vnKqz5MQlz9X2aJ+nYe5oNBvBf
	GiJCUF7271A1BwnPE9HRJYoDVr6pP2MDph/swstgWWKpximPbqmgYJdmbyoB0phkaa8j8mNhXPO
	1pL90i1P2Q0PP1MDJvNyTAnDUPqUOx+fpT4ogLmEjT7AGa159MFsIjEAym7+yTZU1/MiGxQCJ
X-Received: by 2002:a05:620a:488d:b0:8b2:e8c8:671d with SMTP id af79cd13be357-8c08fab8c1fmr1561110885a.60.1766394810485;
        Mon, 22 Dec 2025 01:13:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAJFOrhua+PwEuHCg/SaU/Wr+jBLNxn41/9mdZDkJu/5KHT1a6R2NUsCuFMyeB3zWinmh0jQ==
X-Received: by 2002:a05:620a:488d:b0:8b2:e8c8:671d with SMTP id af79cd13be357-8c08fab8c1fmr1561109085a.60.1766394810076;
        Mon, 22 Dec 2025 01:13:30 -0800 (PST)
Received: from [10.38.247.176] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c09678afa6sm802747285a.2.2025.12.22.01.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 01:13:29 -0800 (PST)
Message-ID: <68dffe33-fe4a-4c4b-890e-87e0229d84bf@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 17:13:21 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20251222-sm6150_evk-v1-0-4d260a31c00d@oss.qualcomm.com>
 <20251222-sm6150_evk-v1-1-4d260a31c00d@oss.qualcomm.com>
 <43efa6fd-53c3-4680-8aca-7b37089ca295@kernel.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <43efa6fd-53c3-4680-8aca-7b37089ca295@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Dr2uGtlUXpNllCDbPyCJUiwSQzxLkDi7
X-Authority-Analysis: v=2.4 cv=EvnfbCcA c=1 sm=1 tr=0 ts=69490bbb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3ub0lqJSln3tGTLoGTkA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Dr2uGtlUXpNllCDbPyCJUiwSQzxLkDi7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4MyBTYWx0ZWRfXznId6yvP7Hwy
 qDq7asCslILP7lXM62Uj+iOCf9b6+E53v3qTsYYf/WfExcOLa7YFFr6eYDMs+xaYqtsdfQRwEEw
 4LMuJndc3llt+hJ/mvhSCuEVDxVa+8d6JilC5UahvPQSwj3LxM1xzkE2pq19iltncN1xngRNgvh
 pMKFXymM/rnyeH/7CyrNEAflek3Gdu5CBCgTlgkDaykSynHgCLxUzcopLc9UL4ipwmVd+GuKwPp
 Pr50N0CpbTNIyp5rJKACa1srORLlLpMsvJ4TMAePCUXTgfb9YBBIux2piMFZmr1yMz5FUnpACHI
 T+h0jWp70TH7ms4fqmfRZPGEFiTSIPdWeSvoEGFi1FTqzHJ8hEDVOpAcSrWHzEESsFLAePxJ2DV
 M1+UpVWbCFoZDp4/oU2iTQyE8E1bevTksNk1XemJEifN9lw4nIq0gfshO/VTo4u1DYVqhPRkPG5
 vSCM9A3OlZBsAwWBqcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220083



On 12/22/2025 4:58 PM, Krzysztof Kozlowski wrote:
> On 22/12/2025 09:44, Wenmeng Liu wrote:
>> Add the sm6150 CCI device string compatible.
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> index a3fe1eea6aece9685674feaa5ec53765c1ce23d8..cb5e6fd5b2ad1de79a9b29d54869d093c952d778 100644
>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> @@ -33,6 +33,7 @@ properties:
>>                 - qcom,sc8280xp-cci
>>                 - qcom,sdm670-cci
>>                 - qcom,sdm845-cci
>> +              - qcom,sm6150-cci
>>                 - qcom,sm6350-cci
>>                 - qcom,sm8250-cci
>>                 - qcom,sm8450-cci
>> @@ -263,6 +264,23 @@ allOf:
>>               - const: cpas_ahb
>>               - const: cci
>>   
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
> 
> Isn't this just camnoc_axi for this device (pay attention: to this device)?
> 

On this SOC, both soc_ahb and camnoc_axi exist.
Is it suggested that I use the existing ones below?
  - if:
       properties:
         compatible:
           contains:
             enum:
               - qcom,sdm670-cci
     then:
       properties:
         clocks:
           minItems: 4
           maxItems: 4
         clock-names:
           items:
             - const: camnoc_axi
             - const: soc_ahb
             - const: cpas_ahb
             - const: cci


Thanks,
Wenmeng


