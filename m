Return-Path: <linux-i2c+bounces-14352-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F605C99F92
	for <lists+linux-i2c@lfdr.de>; Tue, 02 Dec 2025 04:42:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 575B84E1349
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Dec 2025 03:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E24BF292B2E;
	Tue,  2 Dec 2025 03:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gWNa9c5W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ek04uEHo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424BA186E2E
	for <linux-i2c@vger.kernel.org>; Tue,  2 Dec 2025 03:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764646970; cv=none; b=pKZ1/ZrzFyETdQuDV7hEM7GTuIgO1vZtsLlWOT4X8Xrv9JrDSQKv7U7IrdP7SvAK7XhaJdjwOP72SoDYCXiQOQPVoBumbjf592stLG12DtHQrYxo+KQCWc6aFB7UOu5NqlIsPq+zAikIFibSwyZ7bIrZUyKXccGtwW9RBtkIkQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764646970; c=relaxed/simple;
	bh=20MCKhRIDA3MqviGHZIr+M67A64zsrfa0ornt8u732s=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=mBZg/92znEvWFLOnhmipedrUdGu/6C79AoT4T2GhyB82XBEMrUb+nZFl4EF19PlfrgBhAh9rC4NUlqXh9FQd74ll+iWKZJMSG+Wkt9CIbo7T6AonxH1oe7xxVZeG1lShEOVrc7En/ba935ZttE6tcUaOl0ia1BvJN4wPL10eQIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gWNa9c5W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ek04uEHo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1KXV6C1147219
	for <linux-i2c@vger.kernel.org>; Tue, 2 Dec 2025 03:42:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vj4LCJqXAabqFL3+uN/8LpuxoubzCJppWDmHN4am5rE=; b=gWNa9c5WnxgjIqiW
	QhPn+8K4xCs6EoNFxtP/XY9gY+awOgqoqxJBTgRBgBdwFIscEJJ1D7okGpV0FHf9
	U4djLj8Q8raXZNHHk2YhUBecWY6auSC6y4Gs55Bw1zQgy5HTAj0idCifTdLRysrb
	snWCvnJo2ckaPxcfXT9PpV/nJ+DlkfLWZPjxisPOgylHt7nIXyBvr5sz6c+ivoUZ
	Juibts0pTF0jDJ3T4qrQ4mokUVW/3EjWir+gBve4aItdm6nYqGHio+MEgklvDbTT
	l2sNuEXLupWijoLOChf9pv1Ot0cGugc5nliuhHeeGO14zNB6w03eQlYyGATkbh5/
	rODrmw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asj5e92x8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 02 Dec 2025 03:42:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-298535ef0ccso55088555ad.3
        for <linux-i2c@vger.kernel.org>; Mon, 01 Dec 2025 19:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764646967; x=1765251767; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vj4LCJqXAabqFL3+uN/8LpuxoubzCJppWDmHN4am5rE=;
        b=Ek04uEHouDZryfLOpWg/YpgzKFLJsvXOKLLOpO+2cvusG9c7I4a/GY/2JfQ3vfFZV5
         c47hAGzS/3EdyOHVh5mJ2StcRHW0w7mtd+h3C4W+EkjMq1fBmrJFpTmMpkhl/ITYPvWb
         r1qOLQs3PubR+Xneg2vjb1p/F2dlOnbOtYYRjb/9NBXuF8MoRumU0Kj2o44+OWjPm7uy
         xxOnAsuIXTjud3tK/v/xSSuGlGdpEFKJ6VaoZcjDwRXNKaOxztlx/2LqiXllzWvVt9ZG
         /tb8HO5L2e2pe2E1s8fwtCWZ8qjXSM04ZlzHKK4NbKiAKVgORELLRPKADjiVUoc7rYSJ
         P4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764646967; x=1765251767;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vj4LCJqXAabqFL3+uN/8LpuxoubzCJppWDmHN4am5rE=;
        b=nidDZycJYDmlSeBJ2Tkw7iZ5NuNNRyvQI06vy2YRq60Zg3TWc2VTfqx254NNpF78Qy
         z03xolGySe884y2WKIk7O2T42ZhYBschvUSPKHY3QGgyNsWGFCM2Hv33//Etep3s18sk
         Nwyd4flsIwuh1EodertxjKAhwFQyu6EJYU4gXera6eTMpfbToitxscz8WAOmit7OB4gJ
         7NwpEcV1xh/Tqtj5s/ZSV8rY2NctIINJ8DidgpLMWL3p0Ht3nAnTPsLIfrzicGML4hV7
         kpZZQu6awzyVhQiWE+tTvm+hqDG63wUp+AtOspZL30l7DjQGUHIF1wJjl2cohYdX06JA
         scwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkiUTylz3/s9IlWn/zkAoOIsVMzvNZuBPeNnM4w+cBdoBCAcp1xpBKXiTyhtdCW2zIIxOz2XXJMLY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXs4hs7SHQ0j3sdOBDki+Cnk3bK5v1I1tUUSSHm568eT4OKyWH
	f2XCMZFutJWIIAbHM1qcMuQU7ki1glhjsEEYu4OxakOEtbgZdrWIM1Mc2RMTNtbm4J6wSJx1JeM
	/zvgIYRfcGbMzISAuqunzFlVgUvn7oklNI5QGsFBhFmNbkYbsftltur53HdTiNeQ=
X-Gm-Gg: ASbGncsadXGhb5QZcWyjFmnYdBiQZnBw1tIZEs1ZZFCyRL3Jf+uc6eNAFE5fDsvKsDH
	LgO4kf4z2f2iU/4Y2OtNnSjZHE+1YeSV6L8Vj62YobsGbdjSb9mFGgQ5r7bFChp1R4GXAhTcHeJ
	RqSfum1H5llIBl08dVLpQwmzMaxNbAIQYaldMGZzN5x6r7/3+ahdZVFNXvzW12f9bzFOQAsgVhd
	jWsZceTE1gYh9ZCPWohbnE8Wy4FZPtHxxg50XcT7TXmOcAJKWVdg757Kg75EpLRTsnur3QG8wC9
	LHZqQ+a7yOWvjxGIgTtOqbW0CV4kzGVe1LS2P2Jukq3OANLs1XU7rYF2J4iqRMXY3qxqb4/i6H7
	NnMzoMADYysB0MHrpx38S5aleF6AUtyJTts/UfqhO3A==
X-Received: by 2002:a17:902:f54a:b0:295:6427:87d4 with SMTP id d9443c01a7336-29bab1db61fmr293824375ad.50.1764646966820;
        Mon, 01 Dec 2025 19:42:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUkEk5fa16R+t4fQFQmgXEisYRMig2zEboHSKD3Kc6ntvdOK48aTN5/1SkmOCysUqU2yqPFQ==
X-Received: by 2002:a17:902:f54a:b0:295:6427:87d4 with SMTP id d9443c01a7336-29bab1db61fmr293824035ad.50.1764646966234;
        Mon, 01 Dec 2025 19:42:46 -0800 (PST)
Received: from [10.218.32.171] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be508b06606sm13312958a12.18.2025.12.01.19.42.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 19:42:45 -0800 (PST)
Message-ID: <bc01a71c-2245-4c2d-a7d2-e79c61a6d3f3@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 09:12:39 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/12] dt-bindings: i2c: Describe SA8255p
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
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
 <60487c80-c5ea-4c71-8ba3-e638ae3035a2@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <60487c80-c5ea-4c71-8ba3-e638ae3035a2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: t3LJDQMFNNWSCjm-2npQMDopLUl7LWjU
X-Authority-Analysis: v=2.4 cv=GMsF0+NK c=1 sm=1 tr=0 ts=692e6037 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=cIyyWH6LjY5EaBPBr-EA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDAyNyBTYWx0ZWRfX7aaAIexV1cAP
 8bO/q+8uBYmzgqtIOevlgoiS9LMnF4wtN7LwzMziXAMgzEbno8vHDqheH4H9Bs8geck6sR+NId6
 D/CvsZuGMXCWGsQveMFCvMNMULi64T4sVHo9UniPW3DcxEEuOv2mlUls6lPDNNzIydeYOEOUGmy
 eUDetOPA+B37UE+G7Wb1kTvwM6zEWkU2vjr+8Z2enCpMzzlyh7Y6WCHNsOAx9CYntO7w+DRJibp
 rqL1rwXNHAtkG0uVyyeabhVGM2tpqJNHSxxxLlApKZtpHWRYX9qjZtNHRaVWyMj9UQ9cNv7H5og
 G0hwnZTzDsjhYvW7x+yizYv39BjbswoJuDcP0/s+2KWAjOD15G3c7zImFIFtTnO1uTRbCdmlVw8
 LZFeNpBeMJt9L8M8rUrtBS4JuzBFFg==
X-Proofpoint-ORIG-GUID: t3LJDQMFNNWSCjm-2npQMDopLUl7LWjU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512020027

Hi Krzysztof,

On 11/26/2025 10:32 AM, Praveen Talari wrote:
> Hi Krzysztof,
> 
> On 11/22/2025 5:10 PM, Krzysztof Kozlowski wrote:
>> On Sat, Nov 22, 2025 at 10:30:13AM +0530, Praveen Talari wrote:
>>> +  dmas:
>>> +    maxItems: 2
>>> +
>>> +  dma-names:
>>> +    items:
>>> +      - const: tx
>>> +      - const: rx
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  power-domains:
>>> +    minItems: 2
>>
>> Drop
>>
>>> +    maxItems: 2
>>> +
>>> +  power-domain-names:
>>> +    items:
>>> +      - const: power
>>> +      - const: perf
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - interrupts
>>> +  - power-domains
>>> +
>>> +allOf:
>>
>> So common SE properties are not applicable? If so explain why in the
>> commit msg.
>>
>>> +  - $ref: /schemas/i2c/i2c-controller.yaml#
>>> +
>>> +unevaluatedProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +
>>> +    i2c@a90000 {
>>> +        compatible = "qcom,sa8255p-geni-i2c";
>>> +        reg = <0xa90000 0x4000>;
>>> +        interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
>>> +        power-domains = <&scmi0_pd 0>, <&scmi0_dvfs 0>;
>>> +        power-domain-names = "power", "perf";
>>
>> dmas and dma-names
> 
> For this platform (all Auto targets), we primarily use FIFO/CPU_DMA mode 
> rather than GSI mode, and these are not defined in the Device Tree file 
> as well now. Should we still include the dmas and dma-names properties 
> in the example node?

Would you mind confirming this?

Thanks,
Praveen

> 
> Thanks,
> Praveen
> 
>>
>> Best regards,
>> Krzysztof
>>

