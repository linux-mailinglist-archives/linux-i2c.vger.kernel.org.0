Return-Path: <linux-i2c+bounces-13653-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E507BEF398
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 06:13:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 436EB4E9EF4
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 04:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 998722BE655;
	Mon, 20 Oct 2025 04:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RdZhdHyj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D639642A9D
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 04:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760933603; cv=none; b=A15QsfwgHUsBUB99hImvKjoZCAVkIYi9kyBuS9O6qDwQ3Ag1HhtwMfY8W/AD+rCyy8XxvObLQXRRtdx92k7ZiWWfs3JVKHdwXbefV8fmzCgGrXMWfg+M94jzQdICgkLSkj8QTgGwPG4mHt/cgnfxoJQsoWaTLOvJFQaNgzekCUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760933603; c=relaxed/simple;
	bh=BZTPncny134Q64moVMUylo+dy5nEYkxcYrHjEvoeM6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G2ggTsZQGjUvRPn6hmZuG+kBrEIesu+54Z71EBt6Yho2R4OZp7hBe/80InAypnCPSX86N+3NG7yDYBqBWTnxJKl79Jdv5AIBxyTKjY1ryIP38dtXqEVLQgks3HMvSwcykvRh+rfTUvq2RQQCtTi5c8zxg0Ie8LFfVsJ7GT7wjVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RdZhdHyj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JNsqev031986
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 04:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WvyGniKNyOGzB9jIWHr/l9yFjxDzJbHTBKbIHX8e61I=; b=RdZhdHyjGyKL7zPm
	3gTUpNGkwXhUDC58bfICpE2BFyZa/iUrGL+9bUXNnDv/7sVbyw4MEVpID805UbCR
	hl2K11gMmrPqsX+6tYpGkMommvclZIHEHBCEwXnY+Z9SiMSDR/xcV8vSdP5w1PKd
	jLZ1a05GAm1+O97hHAWclGldqD2RNhbK9MyG50SrhicHgvujssUL1KJu7Ao6tLoZ
	3aE89EPub5bKB7gL/5vnqi6BpLPAABsS6K9Ced/0cRJDrSFYtQBSPm31KH/bpnkB
	h5Ry5uLHCXlvKw1WCDR+dFUZsu8rNRYoe1du2Q++BgQ+Jisf2jxodFGBXhCYXnWH
	VOd62A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42k3fpu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 04:13:21 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-336b646768eso4408982a91.1
        for <linux-i2c@vger.kernel.org>; Sun, 19 Oct 2025 21:13:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760933600; x=1761538400;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WvyGniKNyOGzB9jIWHr/l9yFjxDzJbHTBKbIHX8e61I=;
        b=w7zIP0bjrh2YmQJgJWUAJAvfq8WUS4qq8oBzIZs834DwQR9z68QUT2XrM4yj+oeRKu
         tO9nLx22EUOaAeq2nFXKebompj1HQTZA8EtQqEkHmqzA6iTOOfwcxKZmZuSUpjscMwmg
         F+YeYUMdoxexinDDJP5zRYqMc1f0W2mzrH03g6gePbalXaeLCTc5uJRhMDFavoLz2PcK
         bkwA24eixSxjoQvBlq+Pa6OeF5KubfRU3ruY2BCAa0EGRyHdtOdPu1+MKcQ/D5xV06Xx
         dI1DEqHcEQdxQ/5uTlJuOLFWar6ToSRV5AaOzsD8ejck53bdH7cgNeRYazepyKvLKnE+
         rq7A==
X-Gm-Message-State: AOJu0YzOtkuO7TFsZEBiQwW/hqHxijbO99/QdwPBpiDjkQAizYVTi04f
	5saaAJ3P23ui6ZXHRpThDnnU98ym0OIuvoCeVop50G8NuzYVdsCBkyjkaUlEd01YB90k7MBkgOA
	RPE8TCV9+w7NyD4zWTbUwLvHjre79/guqWU4/5qEdyD2K1XwpOKfj3IK+6tL15P0=
X-Gm-Gg: ASbGncthe0dcCAQSQrqZvrHv1VsJLaEjr3QT2FCuR8ZU/mgChUJEqHo1/CB/+5i+9Fl
	ur0hanRanwDsu9zV8uangKSLBPwmVAKmtoPhcc7XQGwHPobKqUoRDRjUZnjexpeQeKiaL1gfvP8
	IWizUwPy66AIOZAReB+SeoWMeqHC3ag+HF5JG2BFNVqH0EtPMKvzCkUvajSeNsY/g8YovQg9jeK
	2wRn35G3o1A5+kFnXB05hw0UJS5xmP66Ao5+yfhx7UmxgBJ0+wb+viuXxq8GxElvjp/Kq3aL5Mb
	Xg+JWdiFeZUhz9gtIQfqOfg0QkV8KWxBpHSK2Ww+crrEv80deyRnkuoINAK8RIzGTnk05JlvmDb
	qkXqOgRi48fbATdZxlD0alGkJ2VsL85arOH55MTkl1hXGKa8/hInZIz2eaem+kx3XR/g8Og==
X-Received: by 2002:a17:90b:4a50:b0:33b:938c:570a with SMTP id 98e67ed59e1d1-33bcf90e727mr17568036a91.33.1760933599986;
        Sun, 19 Oct 2025 21:13:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXrnkvCs+Vl2DFziMrRjV64jYus5Jn/mKHf0OBSgXeMnBzTDn3+nAHRsTlgYulMJ+HlW8Tag==
X-Received: by 2002:a17:90b:4a50:b0:33b:938c:570a with SMTP id 98e67ed59e1d1-33bcf90e727mr17568001a91.33.1760933599510;
        Sun, 19 Oct 2025 21:13:19 -0700 (PDT)
Received: from [10.133.33.77] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a7664a228sm6453081a12.4.2025.10.19.21.13.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Oct 2025 21:13:19 -0700 (PDT)
Message-ID: <22d47da0-4912-4880-8a42-f6d4e61e094c@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 12:13:13 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: i2c: qcom-cci: Document Kaanapali
 compatible
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <abc9d825-1e98-4838-9e9c-ca18ba191e11@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: lMFXYbnD3sylirURsTKkgISGbS4YjIk2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfX5ZUpYDe85Rkl
 cMIbjgbkxGl/1qX1EcjDjw6IokgVG6SW49+nDqTFZCE8dT66L23yuaYCxOVCmkD5g+KTUU4538K
 +OmL1BE5cyHraQY6z8N1sJ+YeciQg5nHU4MHjN99GXGvz1NYmtiGTU+9lyFvC3/pL1SlKQPfmVF
 aZ0CSRxS5PR3mp9WTmh70MoKWFQMiZf+h/kkzzKEZjUY3B+Y6UOEy8MbkUR7DChsP71G2cwBbQE
 jCfJllQ4/CACSwIzfDhcnpMmFLOnvXw9Q/KvtHhBKWFJR9SFHw8aNnb931Xo/deNewcLPGcFQtC
 6r3ODMmu2ouW/b+9WYxOHMLGoIL9lsgtHO5FxeqyORAYHwJjbBkUD69lWtQcED+Ty3O+ZM/ede4
 LpkyYNJ2wnt41H/j2NmvqaCUQ41Rwg==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f5b6e1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IZI-ILkc106kMjGbKFIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: lMFXYbnD3sylirURsTKkgISGbS4YjIk2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031

On 10/16/2025 3:56 PM, Konrad Dybcio wrote:
> On 10/16/25 3:56 AM, Hangxiang Ma wrote:
>> On 10/16/2025 3:30 AM, Vladimir Zapolskiy wrote:
>>
>>> On 10/15/25 05:56, Hangxiang Ma wrote:
>>>> Add Kaanapali compatible consistent with CAMSS CCI interfaces. The list
>>>> of clocks for Kaanapali requires its own compat string 'cam_top_ahb',
>>>> aggregated into 'qcom,qcm2290-cci' node.
>>>>
>>>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>>> ---
>>>>    Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 6 +++++-
>>>>    1 file changed, 5 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>>> index 9bc99d736343..0140c423f6f4 100644
>>>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>>> @@ -25,6 +25,7 @@ properties:
>>>>          - items:
>>>>              - enum:
>>>> +              - qcom,kaanapali-cci
>>>>                  - qcom,qcm2290-cci
>>>>                  - qcom,sa8775p-cci
>>>>                  - qcom,sc7280-cci
>>>> @@ -128,6 +129,7 @@ allOf:
>>>>            compatible:
>>>>              contains:
>>>>                enum:
>>>> +              - qcom,kaanapali-cci
>>>>                  - qcom,qcm2290-cci
>>>>        then:
>>>>          properties:
>>>> @@ -136,7 +138,9 @@ allOf:
>>>>              maxItems: 2
>>>>            clock-names:
>>>>              items:
>>>> -            - const: ahb
>>>> +            - enum:
>>>> +                - ahb
>>>> +                - cam_top_ahb
>>>
>>> Why is not to give the clock "ahb" name like on QCM2290?
>>>
>>> On QCM2290 the macro in front of the vlaue is GCC_CAMSS_TOP_AHB_CLK,
>>> and name "ahb" is good for both, I believe.
>>>
>>>>                - const: cci
>>>>      - if:
>>>>
>>>
>>
>> On Kaanapali the macro has been changed to CAM_CC_CAM_TOP_AHB_CLK. GCC clock domain doesn't manage the AHB clock but CAMCC does. I think it's better to create a new and more complete clock name to denote the differences between them.
> 
> Are there any other "AHB" clocks going to this block?
> 
> If not, then this is more confusing instead
> 
> Konrad

On 10/16/2025 6:40 PM, Krzysztof Kozlowski wrote:
> On 16/10/2025 03:56, Hangxiang Ma wrote:
>>>
>>> On QCM2290 the macro in front of the vlaue is GCC_CAMSS_TOP_AHB_CLK,
>>> and name "ahb" is good for both, I believe.
>>>
>>>>                - const: cci
>>>>      - if:
>>>>
>>>
>>
>> On Kaanapali the macro has been changed to CAM_CC_CAM_TOP_AHB_CLK. GCC
> 
> 
> It seems you do not see the difference between GCC output clock and
> actual clock input so some other block.
> 
> 
> 
> Best regards,
> Krzysztof

No more clocks will be added, at least for KNP. And I acknowledge the 
substance of AHB clock doesn't change. I will update and keep AHB clock 
name the same as QCM2290. Thanks for both of you. @Konrad @Krzysztof

---
Hangxiang


