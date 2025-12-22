Return-Path: <linux-i2c+bounces-14680-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E52FDCD5F0C
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Dec 2025 13:12:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 614DE3010C54
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Dec 2025 12:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDB7C27BF7C;
	Mon, 22 Dec 2025 12:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bu8l7sgq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ObJ6O55C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B17023EA90
	for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 12:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766405543; cv=none; b=EnQQUl395UT8h1npUsM5VdCzpjuzpj4FqGxNX9avrM75Mql7LEkjH24ZW9ZGqcLnk92W0K2TdeUh4kFB/jPWyWJ8zF1ynlW9LKcKSR8SwL+afrLJoBmNuaj2EGWhwxzeNq5Id8WKWTW68fcClmxiloNEAYTiKmQSZ4vNJd9M3JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766405543; c=relaxed/simple;
	bh=AA/H1AwMu0/+HGYb42u80iYLOfuHJUzLVpfiRBlUCl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YIWb3Hk1lOARhJlcPZeuovTS/+uOtgDB8st7GLQBS40shBrMuF6TNkffrMpXIKQ9bu8LpouomtJJ5ItApX2944gHmbgItPucqFUIUC2/EznM/E2+fUq3bAQwv9fohn1yyahanKeQAhdC3q7yhQpt6QewcsMC4yQmsC+sZc4aT3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bu8l7sgq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ObJ6O55C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM8HfPM024605
	for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 12:12:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w9A2rpTt2uE3PjipyspjAkGmTHHrWLfeNYFHtdiCOzY=; b=Bu8l7sgqGSTJp37b
	6auUGnrwa5A71zvgLn9RENLm5UTQKAnt80WFqnU4AZjZvnb4m6rw1vOEl2e24Y2z
	SmNgU6KhbAtwR0p4mr5IWsXzIWOvmQwCK/s/Tjx+DoVEBQqS8WsD6RVi+VyqW84X
	OZvwh+vYMUFOGl8TfnK/e3i8hw+TogjBWt0YdJGluPVfr2UYkmgTRrx1xmnArrCn
	Yiq6GZ1lo+6NPqmCyBOFrV8BegGeiPEJdKoHeLOJEdu9TkuBWEIH0njZki1Pr/Xv
	3VZqXEG9P+6wgMMH1lSVo9rQ+EbsOXNhRp5FkNfihMtgQL2F6pxoAIip7kvYpOO6
	ka9DeQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mracwwv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 12:12:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee1b7293e7so137021301cf.0
        for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 04:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766405540; x=1767010340; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w9A2rpTt2uE3PjipyspjAkGmTHHrWLfeNYFHtdiCOzY=;
        b=ObJ6O55CZ9EwT0BqmmkFgfMO+IM1ECVErvneqx1prSRBOgMPM/XJDoYio0sOII6UD1
         1vppv/Q1Flq2DFhMaZwAgMDQH4ePP+FaOtB9ofluWKudlMO1mwPHFNl3s9+k6+moz0MZ
         LVmWFpJ+wY5Yb+J9RJk1ItRuRtcyzoYu4YJvk0Ha0Npw+rH0TDTFyMZxTJ3cZU1L1BMn
         fGEoRysq1Ndhs7e/XMo55v1LikU87vDGmvSz73zpoZVG4lUbA0JBZLaG8zB2/PqVMVGM
         SVi3Ll9FEzRyohj9kL0jm8jJeF9f9pqNnpYa0FgwwdSHQWcuttNL99Pkq5iLJeiNFKDI
         xL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766405540; x=1767010340;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w9A2rpTt2uE3PjipyspjAkGmTHHrWLfeNYFHtdiCOzY=;
        b=GPPgadVip+CD6nU+FAfGVrkwV0Fbl1rjDKtsS3ep6vBbkL29sEgX+4LLx83eyo79pR
         T36w/P1ONphZBbPZA7k897kdQj7quFlDss7Lx/phg+vz2DOkjIsOUWYcfeyDCq9q9U3s
         4YOX+eaXpH6+FMOJyGXi4IvxVTIx71kRXDLeYUJpwjvEIZ3mRLhVKfc4wHM9wt7k7i7H
         GUTYo9QXhkRx9d1jVvgy++cDKKw33DIVqHno6JbmktbyQ7vfSlevRhnOwRo1TzDgGEJn
         NeU55hGJq8VATXi4ZKNMVxx4xR82kpdn7TIFQ/11SfpTTCUy7yWXX/X+M8ACvB1rwuW9
         4I7A==
X-Forwarded-Encrypted: i=1; AJvYcCXbWF9XEvtb56PtiuGQgTB3GZbBd3d6ecgGcGCkmo7GYRJV0iOslfF7hCUyS3NR6OO+O6chTdSBhXw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl4ov11+GlM4B3uG5rVESfSbtP5T6FefVqUGIpW2RXoiUp9g+1
	cixkz1/E5jV6gVVW0qD32itblYSNwLfDjH5WgHCcpz+c/rIBwgfJ57GkT09/fpCnzkqsS7k82AT
	4PLoYSEKH2IrixOx0RzM0TZeei85tjEJl8PySF6Tlw3sbeWkkO7h2QS0iy+rTKW8=
X-Gm-Gg: AY/fxX7nhHi7+u15qrJIK20M8IEZ0wftjhedTZ0It2Ar5v5Q37/9l0McsTf73DF/OBU
	AvbwUlLR94ndMFRoJGSMh3ssySeKju8hQYXotcC32Z9Nm+pe47HhXlUJGvAE9Y4hqnX1JkwjS/g
	HVkV1otSnoELR3w3V8blTL6Wgqau65Mgl3XjEpyUw3YA7KPgeMT9MXT6MBxoER3VJPf9oLPdbmP
	wws3Gd1lcgL1TVZgL/q2xTrQLQhdS+dfZ8fGQ0VoNn5U3aZLKpx7uxK7IpA6tJDOZYmEhISWlBv
	+8qjjQGL0LL8bmrwx5ZA+YHc+icKeHCKSixEy5BuqR4t8dK9t/F5FNDJb/7u1irffpI6GxqOqHo
	JmHxNIvvJ8OshwiFWQj0etPkn3tEJewp73Vy93fJmtPqWxJBMWv66KO6jJ4GOxyprjMAt1A1/
X-Received: by 2002:a05:622a:1c0a:b0:4f0:2378:59a1 with SMTP id d75a77b69052e-4f4abdba1e1mr143600841cf.72.1766405540140;
        Mon, 22 Dec 2025 04:12:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEetvXA37qUNAKlm0YVtJ0qQ13Cm52fDVIhm0qqQAfEAJpzxHGDJOG+J/9gsIp6zMV8sNDsAQ==
X-Received: by 2002:a05:622a:1c0a:b0:4f0:2378:59a1 with SMTP id d75a77b69052e-4f4abdba1e1mr143600481cf.72.1766405539785;
        Mon, 22 Dec 2025 04:12:19 -0800 (PST)
Received: from [10.38.247.176] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d997aeebesm79120156d6.35.2025.12.22.04.12.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 04:12:19 -0800 (PST)
Message-ID: <8b265a82-4470-4f13-9959-0dec32cd99c9@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 20:12:12 +0800
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
 <68dffe33-fe4a-4c4b-890e-87e0229d84bf@oss.qualcomm.com>
 <196d6884-4ad2-4b74-8aee-01ba252072c2@kernel.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <196d6884-4ad2-4b74-8aee-01ba252072c2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XWsZ4DZtWc5MrIhONKi3hP1gDPVN7rSg
X-Proofpoint-GUID: XWsZ4DZtWc5MrIhONKi3hP1gDPVN7rSg
X-Authority-Analysis: v=2.4 cv=e9wLiKp/ c=1 sm=1 tr=0 ts=694935a4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_QOpqvZ3r_VspIhoNjUA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDExMCBTYWx0ZWRfX3XXSjSKnow/F
 ihkSHntQCcPjg98hfioMIfcBpBsxlyeleo+ZTLgTrGZfCooXqNZG864qnZ+8O9lrEkev2ZhccZe
 M74LJ/T/kSWEbw421Ukok/wC6UDoyQVdKmxdeSZC/1Y6HMmvtz/Gw5/K36H7hlCOjzIzeO2PrGT
 DlnI+2raYHwpEEOFL/TGhwqcYTCfW9LyrlPbIy0Qi1DkTIjuqUkbQyeRAkt5eSiT1npwDpmtxGN
 0SKJCsYjnk74zfWEVxsx8EbQGfOabXk73elKs6QcLcuZWVIHK4Z7jkHwZyP3cgVyTsb/Ucg0sPT
 bTDlLct3iakLqG2aY6ywXEBG+4antHnJhH0CJivfZdbv6rtjionWuVxWsTRI+XRiRYIV3oPCMFP
 b2xWYeT59PorHYwB80D5/+QXotMYh/fHGUmp8R9BLRZsIKCag2fYBPvZ1aXztCZXVoTgNHPCFWd
 CEGx4J5a6HHD2x5crAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220110



On 12/22/2025 7:58 PM, Krzysztof Kozlowski wrote:
> On 22/12/2025 10:13, Wenmeng Liu wrote:
>>
>>
>> On 12/22/2025 4:58 PM, Krzysztof Kozlowski wrote:
>>> On 22/12/2025 09:44, Wenmeng Liu wrote:
>>>> Add the sm6150 CCI device string compatible.
>>>>
>>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>>> ---
>>>>    .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 ++++++++++++++++++
>>>>    1 file changed, 18 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>>> index a3fe1eea6aece9685674feaa5ec53765c1ce23d8..cb5e6fd5b2ad1de79a9b29d54869d093c952d778 100644
>>>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>>> @@ -33,6 +33,7 @@ properties:
>>>>                  - qcom,sc8280xp-cci
>>>>                  - qcom,sdm670-cci
>>>>                  - qcom,sdm845-cci
>>>> +              - qcom,sm6150-cci
>>>>                  - qcom,sm6350-cci
>>>>                  - qcom,sm8250-cci
>>>>                  - qcom,sm8450-cci
>>>> @@ -263,6 +264,23 @@ allOf:
>>>>                - const: cpas_ahb
>>>>                - const: cci
>>>>    
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            enum:
>>>> +              - qcom,sm6150-cci
>>>> +    then:
>>>> +      properties:
>>>> +        clocks:
>>>> +          minItems: 3
>>>> +          maxItems: 3
>>>> +        clock-names:
>>>> +          items:
>>>> +            - const: soc_ahb
>>>
>>>
>>> Isn't this just camnoc_axi for this device (pay attention: to this device)?
>>>
>>
>> On this SOC, both soc_ahb and camnoc_axi exist.
> 
> Hm? That's not the question. Pay attention to the part called "pay
> attention". I emphasized it on purpose and you just ignored it.

--- Isn't this just camnoc_axi for this device (pay attention: to this 
device)?

For this, yes, I think so.
Also tested replacing soc_ahb with camnoc_axi for the CCI device, but 
the hardware did not function correctly with that configuration.


Thanks
Wenmeng



