Return-Path: <linux-i2c+bounces-7615-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE199B24AB
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 06:51:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F06C8281857
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 05:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3650718DF77;
	Mon, 28 Oct 2024 05:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Y5PhFGdk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE58A18C92D;
	Mon, 28 Oct 2024 05:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730094672; cv=none; b=SDAQJfAgIzkf/38dan6E6qLGmKiX1LjseFZ27QQgGIPEA2YfosUoJXknFv8+GZd1aBw/xvb/vgeeO0pgGHua7r0SiY1W1NVvvz2SDuVzdbZhzOf5fd6/O4qdedYqbfH4mdo9lxbCpt0G2Nlx0RPaycsnAOchLe8LW20Lt75Budw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730094672; c=relaxed/simple;
	bh=1T0Tr9mZQEGQqImwT6yGFd02N18Tv3ShbpHI+DOXh6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fuBAclkOVSITgXVBKNuMN2J2Dv4qL+eKj2xUAh98H420BiDedDxMOlvyZxQcL85fqYxW4teGhyyMT5vBH9FIYxzCdL4O9OZ7r68JUwppx9SV/dQICyjfYvD0DsSfMQFelTT+wwF3+qK1G2Ue1mYIFJmli26ytVw3KBZVne40cfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Y5PhFGdk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49RMr3js008480;
	Mon, 28 Oct 2024 05:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3G2BDM3URpd2ddqyA/ruuzoqDHBYGIvb5Qk/rkeCHkw=; b=Y5PhFGdkkw52PswR
	o2mJHdicYY6vgg/HkAClzfv/lXT9TJQ/mBZv1dyLdNDwqcw5fyf2bDRh/4mnNL/V
	X4s/TlighKM5YHA1KMzuWfcGQ3onod4JmPepz9WXUpqwMAmqZVkAL+BZTVHyQJT1
	1JsqxR787FIaVuElcxx6ClqZE7ar65bgSBgm+Ma8Hdg4MGz69NZ2fpY985VjOAPE
	hLpl/KYxP/mMACPww+QG/AupP2sfxssSJ+wReoVvAScDMUgryz1x+xcJOXHPhwDK
	68sZRyNTvsBS+RAKkuCMFnVBxKJqqMYvvYYDQ7804Pb89bEQW7QWdjPmYW8UIhvH
	C78zJw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gqrgksf8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 05:51:00 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49S5oxju027661
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 05:50:59 GMT
Received: from [10.217.219.62] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 27 Oct
 2024 22:50:53 -0700
Message-ID: <0051c8b8-f7dc-4da1-8c9a-8d8c07db5d31@quicinc.com>
Date: Mon, 28 Oct 2024 11:20:50 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] dt-bindings: dmaengine: qcom: gpi: Add additional
 arg to dma-cell property
To: Vinod Koul <vkoul@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?=
	<christian.koenig@amd.com>,
        <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, <quic_msavaliy@quicinc.com>,
        <quic_vtanuku@quicinc.com>
References: <20241015120750.21217-1-quic_jseerapu@quicinc.com>
 <20241015120750.21217-2-quic_jseerapu@quicinc.com> <Zw9HHRyvfd66Qn4a@vaman>
Content-Language: en-US
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
In-Reply-To: <Zw9HHRyvfd66Qn4a@vaman>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: a5NXBK4gM358xuIV7LZTtlc8kglh-J7H
X-Proofpoint-GUID: a5NXBK4gM358xuIV7LZTtlc8kglh-J7H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280048



On 10/16/2024 10:24 AM, Vinod Koul wrote:
> On 15-10-24, 17:37, Jyothi Kumar Seerapu wrote:
>> When high performance with multiple i2c messages in a single transfer
>> is required, employ Block Event Interrupt (BEI) to trigger interrupts
>> after specific messages transfer and the last message transfer,
>> thereby reducing interrupts.
>>
>> For each i2c message transfer, a series of Transfer Request Elements(TREs)
>> must be programmed, including config tre for frequency configuration,
>> go tre for holding i2c address and dma tre for holding dma buffer address,
>> length as per the hardware programming guide. For transfer using BEI,
>> multiple I2C messages may necessitate the preparation of config, go,
>> and tx DMA TREs. However, a channel TRE size of 64 is often insufficient,
>> potentially leading to failures due to inadequate memory space.
>>
>> Add additional argument to dma-cell property for channel TRE size.
>> With this, adjust the channel TRE size via the device tree.
>> The default size is 64, but clients can modify this value based on
>> their specific requirements.
>>
>> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
>> index 4df4e61895d2..002495921643 100644
>> --- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
>> +++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
>> @@ -54,14 +54,16 @@ properties:
>>       maxItems: 13
>>   
>>     "#dma-cells":
>> -    const: 3
>> +    minItems: 3
>> +    maxItems: 4
>>       description: >
>>         DMA clients must use the format described in dma.txt, giving a phandle
>> -      to the DMA controller plus the following 3 integer cells:
>> +      to the DMA controller plus the following 4 integer cells:
>>         - channel: if set to 0xffffffff, any available channel will be allocated
>>           for the client. Otherwise, the exact channel specified will be used.
>>         - seid: serial id of the client as defined in the SoC documentation.
>>         - client: type of the client as defined in dt-bindings/dma/qcom-gpi.h
>> +      - channel-tre-size: size of the channel TRE (transfer ring element)
> 
> This is a firmware /software property, why should this be in hardware
> description?
> 
Hi, Yes, this is a software property and added as a 4th argument of 
"dma-cells" for configuring channel tre size, so added the description 
for dma-cells.
In V2 patch, i reverted the changes and will handle with the default 
channel tre size present in the GPI driver.

Regards,
JyothiKumar

