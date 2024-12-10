Return-Path: <linux-i2c+bounces-8387-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCB09EA744
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 05:45:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4BBC2852C8
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 04:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10482248A1;
	Tue, 10 Dec 2024 04:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="f7MYXmpZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01ED079F2;
	Tue, 10 Dec 2024 04:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733805901; cv=none; b=a1FPl/XVBn7LBdvm7kUaCM0hCGFfAX+icKizzFXGxwJbRz4h3JCWpT6yilmoodWsArNL6UkXXc2ZwElaDT39P7OeYqzp/6HWVsB1Sf2NEI6xAJ/UH40A2otVuPt8U23Dtx/v2bvteTBEZa37Lo0s/NCiSVUaLppy78lPq/lfscA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733805901; c=relaxed/simple;
	bh=4xorTCmoQaUwf9wNldgdbfQp3yDsWT5ge8HO1QmNNJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kQbOda8f8Ev3VA6zmdYcQe6ECMNubjd5NOd7n9EyraBqzaXtgA51UcVZ960XeJimmlQJ2bgyA8xAr+2qbuFJSH1zxsagtpnNn7Qo4vUuwoPnw5OAZzkbgJLn3ZX0UDG8DcMoH1qr6YiScST0QcQOy8p+xIWJcvv064gCJpEYvJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=f7MYXmpZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9HLRmN032550;
	Tue, 10 Dec 2024 04:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2i5LBMrd1LcO4x4EjXCFjrTpXj5w2VS3umTLQqMZlIA=; b=f7MYXmpZpJBFBIen
	GKO8h381GrG7OxswCeAGVbW5sb0E43l90rwiTkx/hCFQFJs8XAe9ToEVqCnbzSvM
	nF4YGgO6HVusz0k9dhei1WHs+/qP5ApCM6KCOYWZOSiM3Rd5L5ijC2li79wEenI6
	kcB2z3eG7dRxB/zy4l3flzoT7r6pxrBI6NNEA21fEe41Njlzs6NbjkCAWBm+1oCH
	uiLNwe5Nq2rU4fSaGNEY5bnPiDHk4il8U7XyTFfw0qejcEpaJBnt9uSV7TMJ9KsK
	YRS3lhWyXLcs0Xx9TRLLUXngd2f8qaynN9t0lLe7g4+W7euwYsHVhfNx156SDL9d
	7x0Huw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cdxxf3ff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 04:44:54 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BA4ir72024831
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 04:44:53 GMT
Received: from [10.216.2.81] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Dec 2024
 20:44:46 -0800
Message-ID: <423742db-5a27-48fd-9b79-4e6f8f211084@quicinc.com>
Date: Tue, 10 Dec 2024 10:14:43 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/7] dt-bindings: i2c: qcom,i2c-geni: Document DT
 properties for QUP firmware loading
To: <neil.armstrong@linaro.org>, <andi.shyti@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
        <broonie@kernel.or>, <andersson@kernel.org>, <konradybcio@kernel.org>,
        <johan+linaro@kernel.org>, <dianders@chromium.org>,
        <agross@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        <linux-spi@vger.kernel.org>
CC: <=quic_msavaliy@quicinc.com>, <quic_anupkulk@quicinc.com>,
        "Mukesh Kumar
 Savaliya" <quic_msavaliy@quicinc.com>
References: <20241204150326.1470749-1-quic_vdadhani@quicinc.com>
 <20241204150326.1470749-2-quic_vdadhani@quicinc.com>
 <0a85859a-9487-48fd-b1cb-a4a4195a8e63@linaro.org>
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <0a85859a-9487-48fd-b1cb-a4a4195a8e63@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ce8-t8NoPUGFXUiM5eaf7JYNlePiXBEm
X-Proofpoint-GUID: Ce8-t8NoPUGFXUiM5eaf7JYNlePiXBEm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1011
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100033



On 12/4/2024 8:55 PM, neil.armstrong@linaro.org wrote:
> On 04/12/2024 16:03, Viken Dadhaniya wrote:
>> Document the 'qcom,load-firmware' and 'qcom,xfer-mode' properties to
>> support SE(Serial Engine) firmware loading from the protocol driver 
>> and to
>> select the data transfer mode, either GPI DMA (Generic Packet Interface)
>> or non-GPI mode (PIO/CPU DMA).
>>
>> I2C controller can operate in one of two modes based on the
>> 'qcom,xfer-mode' property, and the firmware is loaded accordingly.
>>
>> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>> ---
>>   .../devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml   | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml 
>> b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>> index 9f66a3bb1f80..a26f34fce1bb 100644
>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>> @@ -66,6 +66,15 @@ properties:
>>     required-opps:
>>       maxItems: 1
>> +  qcom,load-firmware:
>> +    type: boolean
>> +    description: Optional property to load SE (serial engine) 
>> Firmware from protocol driver.
>> +
>> +  qcom,xfer-mode:
>> +    description: Value 1,2 and 3 represents FIFO, CPU DMA and GSI DMA 
>> mode respectively.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [1, 2, 3]
> 
> In the code, FIFO mode is default if not specified, please precise it in 
> the
> bindings aswell.
> 
> Thanks,
> Neil

Sure will update in next patch.

> 
>> +
>>   required:
>>     - compatible
>>     - interrupts
>> @@ -142,5 +151,7 @@ examples:
>>           interconnect-names = "qup-core", "qup-config", "qup-memory";
>>           power-domains = <&rpmhpd SC7180_CX>;
>>           required-opps = <&rpmhpd_opp_low_svs>;
>> +        qcom,load-firmware;
>> +        qcom,xfer-mode = <1>;
>>       };
>>   ...
> 

