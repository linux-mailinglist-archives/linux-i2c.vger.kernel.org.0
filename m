Return-Path: <linux-i2c+bounces-13688-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 133FFBF2F7C
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 20:39:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7E85E4F8E21
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 18:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D322C327C;
	Mon, 20 Oct 2025 18:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L5a5tW1P"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770692620F5
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 18:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760985546; cv=none; b=OkTuMrbKD2IHrFxfnEvabb6NGavafclUSyYPQtuCg2xUG0Htm+5+X4azfEQIKsSkAYgEBtBxV1kaBZTqn/dQlWtaMej4pwi2u3TvhlTxkrfBXH/6pe51ciKhKBrpk1Bj0I8I5Vyb77M66BmluRiXwJP/hWI0qSxjdkdmOFJAtJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760985546; c=relaxed/simple;
	bh=yulSoibBDiWX6jmpP3Ns1uXrdkIcA9BOI6Zi04OhpfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PTLmseWTSWyGocHMfQv6UNk8ODTArJGfmoylv2qGPqM/byXcRZPUKfA5qUhk5whRHZ411yc3FPGRa08X7RV9I2ljXjhOGXKbQ9aZlkoSYH7waWDhqoLsiG4xjm63fYxRcClciKDLoumGtZY6RGFq5XTInyh3MdcrxY6ggULk4KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L5a5tW1P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KIZtpq030949
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 18:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fcmR2kO0kprkS+hm2HYcnN1OE+DeFwRjnQPZTNVK23s=; b=L5a5tW1PBrgMDnbQ
	86ykVpx576xBLHDMIL1J2G1cas1zjehYpfvjWU0c5sbhTqajZXcaFfopgW4KqmM8
	A/Q7gf228qOx0umNVcSmWhaxW/golnCh69NgO5mlEIW8LpSPz+vLI6G/B9sOXTYE
	oPAWDEAw2wNHJzJW1i2X7h4FIsfXfT61oKTn15naaxjGQnI2AUPosw6hpag+2f+O
	nBoNHODh7MnLVM0R1Yq0dKqAY1hXCSkVbX3Q3i3Jyf4DMszQg07tIfVBW+3p2nlA
	dMKoqqwC02rAvFzRnzD/f88bSCEmjx3rRR9XrftMyBuTreLelMfHHwY+89o19reb
	HjXKkw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49wtger0ac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 18:39:03 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-78108268ea3so5307804b3a.1
        for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 11:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760985542; x=1761590342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fcmR2kO0kprkS+hm2HYcnN1OE+DeFwRjnQPZTNVK23s=;
        b=bOEVWh0buQ1tUociYe3EsNo1iOpm34Z5RQ7Z+M19kFmNOVqAYkAZ5Y2pln/W2rAL5D
         G+5vxF+t4X4yjByIGrEN2ss0OQGiIuwT60YhWOq4qmKtdOkrXZPcjzsftGEzrU4IcW6x
         xuX8tXCIZr9ZmC9psZinKvfrYwjKUuz2uyvg9DQSuzo2Dzmtl526YVhYUEqmz7AjBBM+
         5c5PwBPcQhQHmaPomPSh7FlX878/kkJcc6AxjkPPwhSEQgydidysRTKVPY8p/LgYvf6j
         +EsPH7b95u+Nf0kCNbtWMWojZySvCDOqP0um2ZVrf0RitXMBuyLHXvkjZSN6MXywXYDO
         TYwA==
X-Gm-Message-State: AOJu0YxEwimuwHZx8LwtfC4a+KQyzh8LpSJVscTbSvvEY3E14i8ENG32
	odz9E/3YwcUWrkLc8nKX+mFjAw8TfN0KMdwm0MKr4tBtoRkJJ6HYDupNUMhrlSo9M+JRJbjWTci
	oIQJkcIHTOTvOJ3f7UdXTCYBMpC9PayHezKdAuLx9Cyf/0A5J3g2q5E4xZz1HVW4=
X-Gm-Gg: ASbGncvDtsWAOhVPoinQ7RWSdpxMBFD5a6WxTL/gAapWiYn6w4ad8e7ios8pnhh+hSA
	/afKicGmfEDF8pDLEa0/4IeXNB2TBzwP4ZMVjUOusaxAfM/mnwcpfKfU+GC1RRF4ooLlLQg78qr
	yIx9nlGDNZavc9H3tqrQLUCasrr/n+fFjV4FkxLGtjPoQu/psf1rvuRBXlR4N6VgGQS/QmVbnEY
	PTmDqhdf02hSHhb1MMluMWlTIBCY1i1QLM/fEFtMzGCyGxjY+rfhjSuWztTlRgV/DjbtThEF388
	OFybvih1Bm9bYab7IxzUFh4ozHYqBjZ2le1KzYXVuAVh2fObp0ANWtJ6T46XggQ+rrJianoOKyS
	NoJZjSmZ3HjkwhuQhXPXYpR5JI+lczNSwuce18b74YE9O7oBOfUKHGw==
X-Received: by 2002:a05:6a00:1ad1:b0:783:44b9:cbc9 with SMTP id d2e1a72fcca58-7a210f59a7dmr21228043b3a.9.1760985541772;
        Mon, 20 Oct 2025 11:39:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGd531l029AZFQSWcfW9dfoCX2M4tkX+bVgsI6Qgj1PP+Mt6uKXHJbY5qWihEk2UM8XaRvFog==
X-Received: by 2002:a05:6a00:1ad1:b0:783:44b9:cbc9 with SMTP id d2e1a72fcca58-7a210f59a7dmr21228013b3a.9.1760985541129;
        Mon, 20 Oct 2025 11:39:01 -0700 (PDT)
Received: from [10.62.37.19] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff1599dsm9006920b3a.4.2025.10.20.11.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 11:39:00 -0700 (PDT)
Message-ID: <9d6b7e9d-1656-408d-ae8b-4b3dc95ba905@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 11:38:58 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: i2c: qcom-cci: Document Kaanapali
 compatible
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
 <20251014-add-support-for-camss-on-kaanapali-v2-1-f5745ba2dff9@oss.qualcomm.com>
 <e2c43a8c-a9cc-46a1-9ddd-5d6dfc7e917b@linaro.org>
 <49eaf7ec-ac71-4bf3-9a4e-25fa633d815e@oss.qualcomm.com>
 <abc9d825-1e98-4838-9e9c-ca18ba191e11@oss.qualcomm.com>
 <22d47da0-4912-4880-8a42-f6d4e61e094c@oss.qualcomm.com>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <22d47da0-4912-4880-8a42-f6d4e61e094c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1BukSpfhp3uBE9kpcS-RqZmldeNiQkcl
X-Authority-Analysis: v=2.4 cv=JeaxbEKV c=1 sm=1 tr=0 ts=68f681c7 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=xzpADP0L3AAWVpYwfikA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 1BukSpfhp3uBE9kpcS-RqZmldeNiQkcl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDE1NCBTYWx0ZWRfX9JEuqlhCccCx
 zuzSMh6tZ8xP2IHBJcMHOZbbWnncdKHyKHy079ZvHVBgkym1K5suXtwTzHqLXv9NuOwRNJBO9+k
 CL/omLdVV0BsG+zT/mINRkHHGoeHHpHcpRFw3AObSTAXsHqZEXjYWpschfrbG3V18CxGvN36nnr
 lGN4nZfSNDfq90fc05/Y45BcyF5/zFDrJhbE3sAenXuEoyT77uyic9bjX5tAFBAKLaJQoKNB49i
 aoFXCqJLClEqYdYUiwJjBmH/eR7knNng2fcHjPHFBU7rlUK2u/d9/zaaPqh80CjevwF7bR+BiXQ
 7LSvMu4HdP1B3ogbts4JIkOjLUVGqJQlAjeRHaPio50gJDq6SCNJeJH+/fXD9vHFhKksCVNzYvo
 HYNlaXus4644Q8/lt9OsEXcT38QcVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510200154


On 10/19/2025 9:13 PM, Hangxiang Ma wrote:
> On 10/16/2025 3:56 PM, Konrad Dybcio wrote:
>> On 10/16/25 3:56 AM, Hangxiang Ma wrote:
>>> On 10/16/2025 3:30 AM, Vladimir Zapolskiy wrote:
>>>
>>>> On 10/15/25 05:56, Hangxiang Ma wrote:
>>>>> Add Kaanapali compatible consistent with CAMSS CCI interfaces. The 
>>>>> list
>>>>> of clocks for Kaanapali requires its own compat string 'cam_top_ahb',
>>>>> aggregated into 'qcom,qcm2290-cci' node.
>>>>>
>>>>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>>>> ---
>>>>>    Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 6 +++++-
>>>>>    1 file changed, 5 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git 
>>>>> a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml 
>>>>> b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>>>> index 9bc99d736343..0140c423f6f4 100644
>>>>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>>>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>>>> @@ -25,6 +25,7 @@ properties:
>>>>>          - items:
>>>>>              - enum:
>>>>> +              - qcom,kaanapali-cci
>>>>>                  - qcom,qcm2290-cci
>>>>>                  - qcom,sa8775p-cci
>>>>>                  - qcom,sc7280-cci
>>>>> @@ -128,6 +129,7 @@ allOf:
>>>>>            compatible:
>>>>>              contains:
>>>>>                enum:
>>>>> +              - qcom,kaanapali-cci
>>>>>                  - qcom,qcm2290-cci
>>>>>        then:
>>>>>          properties:
>>>>> @@ -136,7 +138,9 @@ allOf:
>>>>>              maxItems: 2
>>>>>            clock-names:
>>>>>              items:
>>>>> -            - const: ahb
>>>>> +            - enum:
>>>>> +                - ahb
>>>>> +                - cam_top_ahb
>>>>
>>>> Why is not to give the clock "ahb" name like on QCM2290?
>>>>
>>>> On QCM2290 the macro in front of the vlaue is GCC_CAMSS_TOP_AHB_CLK,
>>>> and name "ahb" is good for both, I believe.
>>>>
>>>>>                - const: cci
>>>>>      - if:
>>>>>
>>>>
>>>
>>> On Kaanapali the macro has been changed to CAM_CC_CAM_TOP_AHB_CLK. 
>>> GCC clock domain doesn't manage the AHB clock but CAMCC does. I 
>>> think it's better to create a new and more complete clock name to 
>>> denote the differences between them.
>>
>> Are there any other "AHB" clocks going to this block?
>>
>> If not, then this is more confusing instead
>>
>> Konrad
>
> On 10/16/2025 6:40 PM, Krzysztof Kozlowski wrote:
>> On 16/10/2025 03:56, Hangxiang Ma wrote:
>>>>
>>>> On QCM2290 the macro in front of the vlaue is GCC_CAMSS_TOP_AHB_CLK,
>>>> and name "ahb" is good for both, I believe.
>>>>
>>>>>                - const: cci
>>>>>      - if:
>>>>>
>>>>
>>>
>>> On Kaanapali the macro has been changed to CAM_CC_CAM_TOP_AHB_CLK. GCC
>>
>>
>> It seems you do not see the difference between GCC output clock and
>> actual clock input so some other block.
>>
>>
>>
>> Best regards,
>> Krzysztof
>
> No more clocks will be added, at least for KNP. And I acknowledge the 
> substance of AHB clock doesn't change. I will update and keep AHB 
> clock name the same as QCM2290. Thanks for both of you. @Konrad 
> @Krzysztof
>
> ---
> Hangxiang
There are several AHB clocks into the Titan subsystem, TOP AHB, core 
(TFE, OFE, IPE, IFE Lit etc.)level AHBs and fast and / or slow AHB 
variants of some of those, AHBs to the firmwares etc. It should be 
similar for any architecture, if I am not wrong. So should we consider 
using "cam_top_ahb" for it to be clear commonly for both Kaanapali and 
2290? Thanks.
>
>

