Return-Path: <linux-i2c+bounces-3226-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD77C8B3B04
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 17:19:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 922F928145D
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 15:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1275168B08;
	Fri, 26 Apr 2024 15:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="DBQ7FmBM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D201E157460;
	Fri, 26 Apr 2024 15:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714144450; cv=none; b=Of8VZC3CWa9qLMFqqcCIg+nKYfFBh3NF8/fPNfmH3uQRjN5jR+rNqMtLhTOxcPpG4btt41SHN5+IRXtXLisy4VtO95pqS4ie4cpgfz9sah+IowtDT1ZH4+2bvmqyxCyZW66ZmdlkKdDml/zBtbzJ0mk6ULjeLayPEIVZHrynvUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714144450; c=relaxed/simple;
	bh=PxYiQVChcGu6Cg9Cv4EGtSRaXxFMnID1zYd6tbfGmU4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Xn4U4vLwqMf02DvKYC2E4+nvZgyICbfHWqW9i4IOgyabpFNHCgj1G2xvfbOXx7OyIL/iKqmweKq1RufjDFjr9E2E5DpkfMTRGcPIen0rvYLwqfQ6P6itM2Ym1yWu879hMx2g6cWdIyiVERpw+pFAQCoiKF8ohxmhNfVUcze4CDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=DBQ7FmBM; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43QFDHrq012308;
	Fri, 26 Apr 2024 15:13:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=knjPt7riiWcL2lgPDZ/MfxzG+WgZ7apnrjPl9JzlbjA=;
 b=DBQ7FmBMnBkj858btshj3s5o1eocMSgMw9AVvaZYk4emnjXsEua2K+yhUw0wiFUMhQLk
 r/AsJWVsnFqV6yohNuR4xI4jgoa3BTiXmGiDH8bfvl1DFKIKbmPxtPCnbsHn/fRaPeLe
 iqCzmcl2PTOhr8ttq4odEwCi7GVNJJGKUY+qjysyCmNDfPyxShoqx0iFowmNmLQOyQyR
 unMl3S1LOTWoRja4f+4N05A5HBfchLQJ7neqYr18qO6eiZaeRdo8p/xtTDism0BnatbM
 6jP8dxs6wQIgxZCvOQIcd0TD/oKO9gKqIj43YG931CZJX/c3xuHbWSYJzt0zIxFJA9/V VQ== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xreq4001t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 15:13:56 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43QC4WwH023050;
	Fri, 26 Apr 2024 15:13:56 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xms1pgdby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 15:13:56 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43QFDrAs39584150
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Apr 2024 15:13:55 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 629455805E;
	Fri, 26 Apr 2024 15:13:53 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 18D705805D;
	Fri, 26 Apr 2024 15:13:53 +0000 (GMT)
Received: from [9.61.156.17] (unknown [9.61.156.17])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 26 Apr 2024 15:13:53 +0000 (GMT)
Message-ID: <24e7644e-f9ff-4a4b-8883-33b2f69b36cf@linux.ibm.com>
Date: Fri, 26 Apr 2024 10:13:52 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/14] dt-bindings: fsi: ast2600-fsi-master: Switch to
 yaml format
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-aspeed@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsi@lists.ozlabs.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
        andrew@codeconstruct.com.au
References: <20240425213701.655540-1-eajames@linux.ibm.com>
 <20240425213701.655540-9-eajames@linux.ibm.com>
 <5822e000-01d3-442c-bb52-04fab87cb3da@kernel.org>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <5822e000-01d3-442c-bb52-04fab87cb3da@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: I_6OW_C7AvfZQfQhOl_hEsM8Rt2yt3s_
X-Proofpoint-GUID: I_6OW_C7AvfZQfQhOl_hEsM8Rt2yt3s_
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_12,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404260102


On 4/26/24 01:25, Krzysztof Kozlowski wrote:
> On 25/04/2024 23:36, Eddie James wrote:
>> Switch to yaml for the AST2600 FSI master documentation.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   .../fsi/aspeed,ast2600-fsi-master.yaml        | 72 +++++++++++++++++++
>>   .../bindings/fsi/fsi-master-aspeed.txt        | 36 ----------
>>   2 files changed, 72 insertions(+), 36 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml
>>   delete mode 100644 Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt
>>
>> diff --git a/Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml b/Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml
>> new file mode 100644
>> index 000000000000..f053e3e1d259
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml
>> @@ -0,0 +1,72 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Aspeed FSI master
>> +
>> +maintainers:
>> +  - Eddie James <eajames@linux.ibm.com>
>> +
>> +description:
>> +  The AST2600 and later contain two identical FSI masters. They share a
>> +  clock and have a separate interrupt line and output pins.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - "aspeed,ast2600-fsi-master"
>> +      - "aspeed,ast2700-fsi-master"
> This wasn't tested. No quotes. Do you see any other example like this?


Strangely this passes make dt_binding_check for me... And Rob's bot 
didn't seem to catch it either. Just an oversight, I'll fix it.


>
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  cfam-reset-gpios:
>> +    maxItems: 1
>> +    description:
>> +      Output GPIO pin for CFAM reset
>> +
>> +  fsi-routing-gpios:
>> +    maxItems: 1
>> +    description:
>> +      Output GPIO pin for setting the FSI mux (internal or cabled)
>> +
>> +  fsi-mux-gpios:
>> +    maxItems: 1
>> +    description:
>> +      Input GPIO pin for detecting the desired FSI mux state
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +allOf:
>> +  - $ref: fsi-controller.yaml#
> This goes after required:


Ack.


>
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - interrupts
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/ast2600-clock.h>
>> +    #include <dt-bindings/gpio/aspeed-gpio.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    fsi-master@1e79b000 {
>> +        compatible = "aspeed,ast2600-fsi-master";
>> +        reg = <0x1e79b000 0x94>;
>> +        interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&pinctrl_fsi1_default>;
>> +        clocks = <&syscon ASPEED_CLK_GATE_FSICLK>;
>> +        fsi-routing-gpios = <&gpio0 ASPEED_GPIO(Q, 7) GPIO_ACTIVE_HIGH>;
>> +        fsi-mux-gpios = <&gpio0 ASPEED_GPIO(B, 0) GPIO_ACTIVE_HIGH>;
>> +        cfam-reset-gpios = <&gpio0 ASPEED_GPIO(Q, 0) GPIO_ACTIVE_LOW>;
> No children?


Ack, I'll add one.


>
>
> Best regards,
> Krzysztof
>

