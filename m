Return-Path: <linux-i2c+bounces-8438-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 084919EC448
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 06:27:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BBCD1679D0
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 05:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C949E1C1F10;
	Wed, 11 Dec 2024 05:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jBewYOYH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586531BEF73;
	Wed, 11 Dec 2024 05:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733894866; cv=none; b=X6SkAzGkNUfkkHbxZsAFSiWvUAKAIwxz2ZA+lWQrA+YkBOSokUjCPf+/LU3Jcv+cMsS8SZpWmAkPRXLjTfuWV5OfH4uO5PRdG6e46L3RwK79daqVP2Z8zAsZODgEx8jatLFANFZEM4fO44Rtx8r/dO1uJHo3lcz161Q8Wj3orH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733894866; c=relaxed/simple;
	bh=CR1sceDa6LPIOpOgAokwOE+7p00aID1oasLlVDEAPlQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SQ4pEwjAjLz7TBbBHb4qW2GahcewyRPjzqbmdh/SRMA4RPNlnCvPOcWy/KffDCCErrdf655IOVEqZFfyoKJO+6Q35G2Z5Orv2brFsQYECFlVe0QYkKNQJJ2SCaC6cKeD7iTrGiTKjb+2oqFsOJCdYYjQyZpBl1iT2SA4FSHC61k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jBewYOYH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BB2OtTC001578;
	Wed, 11 Dec 2024 05:27:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H6jGWQlPUhtP6l2Yl+TvyR7O656Mg63ihDLu0J4DEUU=; b=jBewYOYHd+46uger
	Txfy+Dsf3Rub5Uif80TYiPD9Bh1X9H+QK5jUzQK9o7K0fjcaHTvlNixudc8MrHWN
	prLEkdxMNkaV3rRr0ODpNKZs70UzNL1KQEy1pwSmyCfvLTWAPgcq30rBTrViedwv
	9YNYoEaVZIwfAZSJLc+RV+tuZF8n11xU/rHgj2yXXjdW6/k9xxLeLum54mT+ebIP
	D2T7FNuzXar7q2BdjP5w7qvjeG4TBF/n+HLwP7U2PXgjUBvEVDW+KSIKjfdb2jxO
	UeLFec6NPOJqcziAbhVLUCwZ/epWGIxc6kFf/vm1d+kbr4LgZkIBdg2lYExRCIVT
	Qg+Wyw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f1xd0e86-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 05:27:38 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BB5RbLf030150
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 05:27:37 GMT
Received: from [10.216.2.81] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Dec
 2024 21:27:31 -0800
Message-ID: <65ded632-963a-4bfd-906c-1b09e916b5e0@quicinc.com>
Date: Wed, 11 Dec 2024 10:57:28 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/7] dt-bindings: i2c: qcom,i2c-geni: Document DT
 properties for QUP firmware loading
To: Doug Anderson <dianders@chromium.org>
CC: <andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <gregkh@linuxfoundation.org>,
        <jirislaby@kernel.org>, <broonie@kernel.or>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <johan+linaro@kernel.org>,
        <agross@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <quic_anupkulk@quicinc.com>,
        Mukesh Kumar Savaliya
	<quic_msavaliy@quicinc.com>
References: <20241204150326.1470749-1-quic_vdadhani@quicinc.com>
 <20241204150326.1470749-2-quic_vdadhani@quicinc.com>
 <CAD=FV=XF+9wxZ5xNtO3Uy8QW9UY4tb+KR46jkondvBeQuVLsrA@mail.gmail.com>
 <6736db20-127b-45c3-ac90-3e3e359c343b@quicinc.com>
 <CAD=FV=VReNQ3nw+wfZizL7JjxEX9z=GwDEJAFzheNkW7rSrB5Q@mail.gmail.com>
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <CAD=FV=VReNQ3nw+wfZizL7JjxEX9z=GwDEJAFzheNkW7rSrB5Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3yR7epxOKHRHJXs3-QOTloAvUC6iMB4k
X-Proofpoint-GUID: 3yR7epxOKHRHJXs3-QOTloAvUC6iMB4k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 clxscore=1015 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110039



On 12/10/2024 11:12 PM, Doug Anderson wrote:
> Hi,
> 
> On Mon, Dec 9, 2024 at 9:28 PM Viken Dadhaniya
> <quic_vdadhani@quicinc.com> wrote:
>>
>> On 12/4/2024 10:55 PM, Doug Anderson wrote:
>>> Hi,
>>>
>>> On Wed, Dec 4, 2024 at 7:03 AM Viken Dadhaniya
>>> <quic_vdadhani@quicinc.com> wrote:
>>>>
>>>> Document the 'qcom,load-firmware' and 'qcom,xfer-mode' properties to
>>>> support SE(Serial Engine) firmware loading from the protocol driver and to
>>>> select the data transfer mode, either GPI DMA (Generic Packet Interface)
>>>> or non-GPI mode (PIO/CPU DMA).
>>>>
>>>> I2C controller can operate in one of two modes based on the
>>>> 'qcom,xfer-mode' property, and the firmware is loaded accordingly.
>>>>
>>>> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>>>> ---
>>>>    .../devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml   | 11 +++++++++++
>>>>    1 file changed, 11 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>>>> index 9f66a3bb1f80..a26f34fce1bb 100644
>>>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>>>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>>>> @@ -66,6 +66,15 @@ properties:
>>>>      required-opps:
>>>>        maxItems: 1
>>>>
>>>> +  qcom,load-firmware:
>>>> +    type: boolean
>>>> +    description: Optional property to load SE (serial engine) Firmware from protocol driver.
>>>> +
>>>> +  qcom,xfer-mode:
>>>> +    description: Value 1,2 and 3 represents FIFO, CPU DMA and GSI DMA mode respectively.
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    enum: [1, 2, 3]
>>>
>>> I'm a little confused about this. I'll admit I haven't fully analyzed
>>> your patch with actual code in it, but in the past "CPU DMA" mode and
>>> "FIFO" mode were compatible with each other and then it was up to the
>>> driver to decide which of the two modes made sense in any given
>>> situation. For instance, last I looked at the i2c driver it tried to
>>> use DMA for large transfers and FIFO for small transfers. The SPI
>>> driver also has some cases where it will use DMA mode and then
>>> fallback to FIFO mode.
>>>
>>> ...so what exactly is the point of differentiating between "FIFO" and
>>> "CPU DMA" mode here?
>>
>> Yes, correct, Will update in V2.
>> I plan to add 2 modes, GSI and non-GSI(PIO or DMA based on length).
>>
>>>
>>> Then when it comes to "GSI DMA" mode, my understanding is that the
>>> firmware for "GSI DMA" mode is always loaded by Trustzone because the
>>> whole point is that the GSI mode arbitrates between multiple clients.
>>> Presumably if the firmware already loaded the GSI firmware then the
>>> code would just detect that case. ...so there shouldn't need to be any
>>> reason to specify GSI mode here either, right?
>>>
>>> -Doug
>>
>> GSI firmware is loaded from TZ per QUP, but to use GSI mode,
>> we need to configure the SE to use GSI mode by writing into SE register
>> QUPV3_SE_GENI_DMA_MODE_EN and SE_GSI_EVENT_EN. This register is
>> used to configure data transfer mode for Serial Engine.
> 
> Can't you detect it's in GSI mode without any device tree property
> like the code does today?
> 
> -Doug

No, we can't detect GSI mode in the current design. The GSI firmware is 
loaded from the TZ side, while mode selection occurs on the APPS side 
based on the Device Tree property.



