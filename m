Return-Path: <linux-i2c+bounces-3302-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFA58B5BA2
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 16:43:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40EF31C21ED5
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 14:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1C67EEF2;
	Mon, 29 Apr 2024 14:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="STnWuWUU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BED2745C5;
	Mon, 29 Apr 2024 14:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714401776; cv=none; b=lc/+6yDyIANr6/h/UTLFTpt4MExLe3xQ8Raw0AqGkJPYVGloiaIXxKhcbOBskL0mJYaRhJyBlmG9wWUcPtjuvWxUR1FZu8N9wZWQn0zwz3djLEZNNaVR9fS6ZHu0fgBIu4jdObUwoN5toR9PmopTONccObtVSERWSF7d8t68rDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714401776; c=relaxed/simple;
	bh=ax/F1io3R3oaq2efhlNyN5CqkPcDnJEGfu9Nt1MSnlw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lqX2/zGPF+UU4EttAm+yEO4YXS6GdF84n8M/Vg6Xnb7Un6bJfLwBMW9HVZccFC1hMdsuXFY6LMWEzbGPYiHHTM4wsw3Qx4gfuVJTuWB+zqYlqZcKhrfFBrVu0nxPtUJWsh6/UGSVvJMjp/0eDWpwq/wni83zHPSPnO/6XXujRkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=STnWuWUU; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43TEYbr9017709;
	Mon, 29 Apr 2024 14:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=KsgaaWZjUoPvRT7MHUei3sSgzKUYUw0c2nrME3+cT3U=;
 b=STnWuWUUPf0WzfcsznuMgr5RlsfijUfQGZtsBA7DDNg/l8HfQwJDrmN8Q1nFgl0xCELx
 +aluLamydwQc7H6W6hXr/WNJVuzsG3GReWJ3w1uY2kf6LL+pQC7onfHbKD142j3p2M1v
 xLjBDz1sfIKcqLoYwvciqApFgfMFJHeqovUsxTenVRjud6TZmCNGw6PbYlPo7y2xZ8xh
 2U+xxfenNwoLRyjuy+P8GZ1rGBgHOp6wyO7u5h+UoTSP2AZEqidW4tWfqrIyHYGsPb50
 nn1CLkE65M6PRw9nNXmMsKlF3Y4bHop84JP91gGLd1UkAQI46V4Kf9mqvtOSIm0GW2RX MA== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xtd9s82eb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 14:42:35 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43TBxD7W003000;
	Mon, 29 Apr 2024 14:42:35 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xscpp7tb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 14:42:35 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43TEgWNU21168868
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Apr 2024 14:42:34 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D2ACB5806A;
	Mon, 29 Apr 2024 14:42:32 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2ACF35805F;
	Mon, 29 Apr 2024 14:42:32 +0000 (GMT)
Received: from [9.61.151.254] (unknown [9.61.151.254])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 29 Apr 2024 14:42:32 +0000 (GMT)
Message-ID: <f1fcb3d6-fa7e-46fa-b606-dbbcda713202@linux.ibm.com>
Date: Mon, 29 Apr 2024 09:42:31 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/14] dt-bindings: fsi: Document the FSI2PIB engine
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-aspeed@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsi@lists.ozlabs.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
        andrew@codeconstruct.com.au
References: <20240425213701.655540-1-eajames@linux.ibm.com>
 <20240425213701.655540-4-eajames@linux.ibm.com>
 <3f822b56-8e6a-43e4-afb0-15c964f9474e@kernel.org>
 <b89d39d2-ec54-4a88-aee5-7b5c95b3fca7@linux.ibm.com>
 <5ef318a3-7fc9-47e8-9944-07365c9e377f@kernel.org>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <5ef318a3-7fc9-47e8-9944-07365c9e377f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KGTh5c-dVKitJrYzjKOHBaxWJR5cNBf4
X-Proofpoint-ORIG-GUID: KGTh5c-dVKitJrYzjKOHBaxWJR5cNBf4
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
 definitions=2024-04-29_12,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404290092


On 4/28/24 11:41, Krzysztof Kozlowski wrote:
> On 26/04/2024 17:00, Eddie James wrote:
>> On 4/26/24 01:18, Krzysztof Kozlowski wrote:
>>> On 25/04/2024 23:36, Eddie James wrote:
>>>> The FSI2PIB or SCOM engine provides an interface to the POWER processor
>>>> PIB (Pervasive Interconnect Bus).
>>>>
>>>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>>>> ---
>>>>    .../devicetree/bindings/fsi/ibm,fsi2pib.yaml  | 38 +++++++++++++++++++
>>>>    1 file changed, 38 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/fsi/ibm,fsi2pib.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/fsi/ibm,fsi2pib.yaml b/Documentation/devicetree/bindings/fsi/ibm,fsi2pib.yaml
>>>> new file mode 100644
>>>> index 000000000000..4d557150c2e3
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/fsi/ibm,fsi2pib.yaml
>>>> @@ -0,0 +1,38 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/fsi/ibm,fsi2pib.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: IBM FSI-attached SCOM engine
>>>> +
>>>> +maintainers:
>>>> +  - Eddie James <eajames@linux.ibm.com>
>>>> +
>>>> +description:
>>>> +  The SCOM engine is an interface to the POWER processor PIB (Pervasive
>>>> +  Interconnect Bus). This node will always be a child of an FSI CFAM node;
>>>> +  see fsi.txt for details on FSI slave and CFAM nodes.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - ibm,fsi2pib
>>>> +      - ibm,i2cr-scom
>>> Sometimes you call these p9, sometimes p10... what is the system or SoC
>>> here? Aren't you adding some generic compatibles? writing-bindings and
>>> numerous guides are clear on that.
>>
>> Open source FSI support started with P9 chips so we initially added
>> p9-sbefifo, p9-occ, etc. P10 has all of the same engines as P9 plus the
>> SPI controller, so that's why SPI is p10-spi. P11 has the same engines
>> as P10. For scom/fsi2pib we could call it p9-scom I suppose... This
>> series isn't just documentation for a new system, I'm adding
>> documentation that should have been added for P9. Anyway I'm not sure
>> what you mean about generic compatibles? You mean just add a "scom" or
>> "fsi2pib" compatible? writing-bindings says "DO make 'compatible'
>> properties specific"
> Usually it means that parts of SoC must have the name of the SoC, as
> first component of the name. Your boards are a bit different here,
> because I suppose no one will ever make a product except you, but still
> code could follow same set of rules.


OK, this wasn't mentioned when fsi2spi binding was merged, and I thought 
to make fsi2pib the same. I can switch to p9-scom or something.


Thanks,

Eddie



>
> Best regards,
> Krzysztof
>

