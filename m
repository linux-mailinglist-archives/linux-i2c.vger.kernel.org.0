Return-Path: <linux-i2c+bounces-8388-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DB39EA74B
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 05:48:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AEDE28761C
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 04:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79462224AEC;
	Tue, 10 Dec 2024 04:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NO5QwH9x"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4774AEE2;
	Tue, 10 Dec 2024 04:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733806108; cv=none; b=nGIW1abJu5jM9ZS/WDvR3qMopIhZWG/Fk4ilM+FkykvSPgbIGwL9bla9aJ+L/ODOObikHq/1/rEBh3h+LEY/6lRJwyV0xQCiJSUl1/09K1NhbdSkrv3Ux2NqQhpCugEUZEszZ4u1bRsuYFJJTWYZcqeIDDZc1vEgrR4J3Sut2Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733806108; c=relaxed/simple;
	bh=3U6JcCeKNUWGnPNiljOaGIIMA78S3QZFZl5NyP1P5wc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=heNnmCPf7gP1yvF2KJssHxgcITeeXZQ2kt+oXivGUkdOMVl2sV96HKbSU7GUXEkbyOWKQo5ZCIKR0wUAqOs9HRaiMW2BZr8AEJaOEoJkUrI+SKwJR07U7PTRadv04MUhDtX9orkxhgPR+XpSL8VoCK6fdiYwNGhyyNBjwO+daeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NO5QwH9x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BA3SXde014031;
	Tue, 10 Dec 2024 04:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o1t/zfcp5xm0iq9g1wA52EzvM9hljEHIRdsWCAsl5W8=; b=NO5QwH9x62NUzPZO
	H9AAVBgxnbq+NKno1qxft38UnlcJr5ypGQHCOur7DfptY8JhNt3BfNUKQslw/otu
	RVkqRr3gB3Z4UbwMFnOq9I/7rWpo86tH3h5NB0mph0rH28bkW/rZH1jFqpsaSC4B
	LkrNC1zhL5u2ZiggRI+kSrSBLfDbrfhB1JdJxaCaDsXo2rDuQLb5ldWKknZ6yGmd
	YMcLSJ8MaTmeV+idPVKG6SSFyP4GhlE08ccnkmAUPV3O19Wu4Vpwy6Q/lH0yGtTd
	hFDqbUqGqjGvCmtQiLHbG7CIwphVQFcEyJg8Q0QsCKqFWdpr7hVuqfDwwX2wYdSj
	wUBpVw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43dvyakb7c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 04:48:18 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BA4mH4e029910
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 04:48:17 GMT
Received: from [10.216.2.81] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Dec 2024
 20:48:11 -0800
Message-ID: <183ec6e2-b78d-47f3-843c-b15dd3e7838d@quicinc.com>
Date: Tue, 10 Dec 2024 10:18:08 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/7] dt-bindings: i2c: qcom,i2c-geni: Document DT
 properties for QUP firmware loading
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <gregkh@linuxfoundation.org>,
        <jirislaby@kernel.org>, <broonie@kernel.or>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <johan+linaro@kernel.org>,
        <dianders@chromium.org>, <agross@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <quic_anupkulk@quicinc.com>,
        Mukesh Kumar Savaliya
	<quic_msavaliy@quicinc.com>
References: <20241204150326.1470749-1-quic_vdadhani@quicinc.com>
 <20241204150326.1470749-2-quic_vdadhani@quicinc.com>
 <garuc5au5464xpmj3exlull4o2763xrkqubplde56xmyfhfhmn@cpd4bbt4dfyr>
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <garuc5au5464xpmj3exlull4o2763xrkqubplde56xmyfhfhmn@cpd4bbt4dfyr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cR1DaSoAvTnCAWOx6wIMIDUALLorzzAo
X-Proofpoint-ORIG-GUID: cR1DaSoAvTnCAWOx6wIMIDUALLorzzAo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412100033



On 12/5/2024 4:06 AM, Dmitry Baryshkov wrote:
> On Wed, Dec 04, 2024 at 08:33:20PM +0530, Viken Dadhaniya wrote:
>> Document the 'qcom,load-firmware' and 'qcom,xfer-mode' properties to
>> support SE(Serial Engine) firmware loading from the protocol driver and to
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
>>   .../devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml   | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>> index 9f66a3bb1f80..a26f34fce1bb 100644
>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>> @@ -66,6 +66,15 @@ properties:
>>     required-opps:
>>       maxItems: 1
>>   
>> +  qcom,load-firmware:
>> +    type: boolean
>> +    description: Optional property to load SE (serial engine) Firmware from protocol driver.
>> +
>> +  qcom,xfer-mode:
>> +    description: Value 1,2 and 3 represents FIFO, CPU DMA and GSI DMA mode respectively.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [1, 2, 3]
>> +
>>   required:
>>     - compatible
>>     - interrupts
>> @@ -142,5 +151,7 @@ examples:
>>           interconnect-names = "qup-core", "qup-config", "qup-memory";
>>           power-domains = <&rpmhpd SC7180_CX>;
>>           required-opps = <&rpmhpd_opp_low_svs>;
>> +        qcom,load-firmware;
> 
> please use instead:
> firmware-name = "qcom/sc7180/qupv3.elf"

Agreed, will be adopted in next patch.

> 
>> +        qcom,xfer-mode = <1>;
>>       };
>>   ...
>> -- 
>> 2.34.1
>>
> 

