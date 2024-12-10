Return-Path: <linux-i2c+bounces-8386-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DD59EA73C
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 05:44:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45A091889EE1
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 04:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E23491D8E09;
	Tue, 10 Dec 2024 04:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JXNc1HOT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0449F469D;
	Tue, 10 Dec 2024 04:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733805834; cv=none; b=h3h9QieZGeeNVAL5trguUfCYabg5aNa/gLHlE1x21aEKjf6mGmmVM3WxTGC/5C50m41VwM/z+BicLfGYY6Kse6Ac9K5VptzAmlicSOr75iaTP2NdVkMWJhSWH1/VZRuSI7oo0Bq4P5CsXVfLftYyBfXRutkyydffV4HyQp4GlBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733805834; c=relaxed/simple;
	bh=BFre1Q/RZBsHPJEt+3yr2HTkn+7tOU95wCZviqIYog4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DF/I11jM3D83gyhTLxnLmwuQt0fC1ro8PS7v1dnRAYcnNNwf6uk1qB8EVczBxCrseV8ViG2QDstrvGdO7OvulbLzcn6RfT0LW5mdzAuxdIbkf0lAuN+Rzadw2bMCCbzKoVDQSj4xR+3Sqe0JR91rq5gapBCxGBRv+W9Ve0lBA8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JXNc1HOT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BA43Cw0019361;
	Tue, 10 Dec 2024 04:43:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ng2RFeyU4jQDif/mpf1Cnnoo9al34JrXPX2txI15hs0=; b=JXNc1HOTWknDkrse
	TMpVHu/P64zlJiwf0x3Gd27YXSB77dQcI1vNPQbKE2jj2Y+CsuI4tS9915VVuAsP
	iDe4cVh8b67UNH8mbSYS/jUYtCKGTyTtFhOkVCgS8nv4lgpMITL1328nKu7C0RFo
	BYFByOCeb64kSDGlsWYWZnAlwSEkY2EKKjZA8cu/tZkJcDZdKTV19DwstqHo8jFL
	q44D9rsLEADbpoYJiCO/qMJpB8xubNnwVpLJv1F+Y6+PupAIM7hkAPBHOJ1bEpSb
	x9Qy/lHAh49j6zD3lAqk57trhNtb6gbgNHFqukqFarwgcMlu+jPF9b1eMjuAFPPz
	UVeedg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43e3419tx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 04:43:47 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BA4hkx1023756
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 04:43:46 GMT
Received: from [10.216.2.81] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Dec 2024
 20:43:40 -0800
Message-ID: <2d615fdb-a661-4fb5-bde7-46f4690ecdce@quicinc.com>
Date: Tue, 10 Dec 2024 10:13:37 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/7] dt-bindings: i2c: qcom,i2c-geni: Document DT
 properties for QUP firmware loading
To: Krzysztof Kozlowski <krzk@kernel.org>, <andi.shyti@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
        <broonie@kernel.or>, <andersson@kernel.org>, <konradybcio@kernel.org>,
        <johan+linaro@kernel.org>, <dianders@chromium.org>,
        <agross@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        <linux-spi@vger.kernel.org>
CC: <quic_anupkulk@quicinc.com>,
        Mukesh Kumar Savaliya
	<quic_msavaliy@quicinc.com>
References: <20241204150326.1470749-1-quic_vdadhani@quicinc.com>
 <20241204150326.1470749-2-quic_vdadhani@quicinc.com>
 <dacfdaf0-329f-4580-94e0-7c3e26b52776@kernel.org>
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <dacfdaf0-329f-4580-94e0-7c3e26b52776@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BPKHs58NCM6xbtkgf3v-goBHtplJZA9K
X-Proofpoint-ORIG-GUID: BPKHs58NCM6xbtkgf3v-goBHtplJZA9K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100033

Thanks Krzysztof for the review and helpful comments.

On 12/4/2024 8:36 PM, Krzysztof Kozlowski wrote:
> On 04/12/2024 16:03, Viken Dadhaniya wrote:
>> Document the 'qcom,load-firmware' and 'qcom,xfer-mode' properties to
>> support SE(Serial Engine) firmware loading from the protocol driver and to
>> select the data transfer mode, either GPI DMA (Generic Packet Interface)
>> or non-GPI mode (PIO/CPU DMA).
> 
> 
> You described the desired Linux feature or behavior, not the actual
> hardware. The bindings are about the latter, so instead you need to
> rephrase the property and its description to match actual hardware
> capabilities/features/configuration etc.
Sure, IIUC, i should explain the need of FW loading. Agree that binding 
is for the hardware. This feature needs to have some intelligence to 
know that Software driver needs to load Firmware or not ?

Let me add description about the actual hardware capabilities, its 
features. Hope this can be better from my side on V2.
> 
> I don't quite get why firmware-name is not suitable here, what is
> "protocol driver" in this context and how firmware is loaded from it?
> 
yes, as per Dmitry's comment, i should replace with 
/soc/sc7180/firmware.  This would be become "firmware-name" property 
instead of qcom,load-firmware.

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
> 
> 
> Please wrap code according to coding style (checkpatch is not a coding
> style description, but only a tool).
Actually i have ran dt-schema for yaml validation. I couldn't get if you 
have any comment for description statement OR it's related to code ? 
Could you please be more descriptive so i can adopt the suggestions.
> 
> 
>> +
>> +  qcom,xfer-mode:
>> +    description: Value 1,2 and 3 represents FIFO, CPU DMA and GSI DMA mode respectively.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [1, 2, 3]
> 
> 
> Use string but anyway this would need some changes and explanation why
> lack of DMA cannot be used to determine that. CPU DMA and GSI DMA also
> need some background.
Sure, i got it.
I need to add enum strings and shall provide explanation abut modes in use.
As per Doug's comment, we plan to keep GSI and non-GSI mode. It would be 
more clear in next patch.
> 
> 
> 
> Best regards,
> Krzysztof

