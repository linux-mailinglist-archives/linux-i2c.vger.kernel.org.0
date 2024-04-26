Return-Path: <linux-i2c+bounces-3221-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BB88B3A63
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 16:49:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7EFDFB24CFF
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 14:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6471214882E;
	Fri, 26 Apr 2024 14:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="j2gtIC2r"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46173610A;
	Fri, 26 Apr 2024 14:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714142987; cv=none; b=SzfH9Zr3JWn9vLlsB3F15MFV0cZGeT6TJgrJxQQ1F3FTyTSSZs+SkY+wlw/qm/xB4HGsrc2FSNri5NUD91j17Zl16Ih1vlDEdY0bnHCvUTq6M+YVw6A75A3wrOTCG+xeC75gP8uHpXBnkrTZKyogbh/HH1+6EE61oViOf/lESmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714142987; c=relaxed/simple;
	bh=nKwWji5nlEK8ia8SrQahrumjx4dp1LCCpfuNn2NHs8E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ShkBH6sa3tejhj/tvn/X/dZWbBZSKaW5inAJlPCzo9aAcr6pFq4SgcJk9Xs3V3nf1QXAX68zHtcgIt1AjXfhiJElwiKdfGhkDaY7/mdxCFQm3V4oHHdbkysI80CFyRmoET5fJrU71/29ikaODe2kbBIIg9acGQU2jqPHGPwkNk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=j2gtIC2r; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43QEgQK5009060;
	Fri, 26 Apr 2024 14:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=0D97D6dvdOnAFJYpvyHmXiXE4CxOnc/rwEu/3nEji9w=;
 b=j2gtIC2roT7WYDm9+55wWV1uHMiC0guYFmm/WsCtJjZEzhTuC6bgDOoIo6nAJ6PFvrvY
 6fFjgnfZCoDADcEcYVb21AQFffAGcPcq6G2wfdqiSYr05X4/cRpG5luCnlabgKKznEQi
 H38ME/srmN67uDkzdaLGQhGZi53joouNgqt1qcE3JgizWrfM7xYvhPGWXQRL2rdplZBt
 jxz9IWQLy0G/+/5pFhCKVPn4AekIIir5pcn9WtRDy4GSrszpbajxNYzecNMjT6x54IYR
 l7sQJ8HsEG1pCW8XbnkZm4imw277ITBWR+GwWBtmFB4lqsdwfGZP6Mv2S/vQWjeMZKL7 Uw== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xre90g0f2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 14:49:31 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43QE5aPr028319;
	Fri, 26 Apr 2024 14:49:30 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xmtr2ytm8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 14:49:30 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43QEnRbE45941412
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Apr 2024 14:49:29 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BDE015805E;
	Fri, 26 Apr 2024 14:49:27 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7735858055;
	Fri, 26 Apr 2024 14:49:27 +0000 (GMT)
Received: from [9.61.156.17] (unknown [9.61.156.17])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 26 Apr 2024 14:49:27 +0000 (GMT)
Message-ID: <f1c3947c-e1c8-4dac-bbf7-e9c0dc9c27e9@linux.ibm.com>
Date: Fri, 26 Apr 2024 09:49:27 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/14] dt-bindings: spi: Document the IBM Power SPI
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-aspeed@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsi@lists.ozlabs.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
        andrew@codeconstruct.com.au
References: <20240425213701.655540-1-eajames@linux.ibm.com>
 <20240425213701.655540-2-eajames@linux.ibm.com>
 <e2b52bfb-0742-4baf-8269-86075b5cc54e@kernel.org>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <e2b52bfb-0742-4baf-8269-86075b5cc54e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gpMXEoHosCbBa5Bhpd174zAYOLaPHlnx
X-Proofpoint-ORIG-GUID: gpMXEoHosCbBa5Bhpd174zAYOLaPHlnx
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
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404260099


On 4/26/24 01:15, Krzysztof Kozlowski wrote:
> On 25/04/2024 23:36, Eddie James wrote:
>> The IBM Power chips have a basic SPI controller. Document it.
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching.


Isn't spi the right subsystem here?


>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   .../devicetree/bindings/spi/ibm,p10-spi.yaml  | 56 +++++++++++++++++++
>>   1 file changed, 56 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/spi/ibm,p10-spi.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/spi/ibm,p10-spi.yaml b/Documentation/devicetree/bindings/spi/ibm,p10-spi.yaml
>> new file mode 100644
>> index 000000000000..9bf57b621c1f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/spi/ibm,p10-spi.yaml
>> @@ -0,0 +1,56 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/spi/ibm,p10-spi.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: IBM SPI Controller
> IBM P10 SPI Controller


Ack.


>
>> +
>> +maintainers:
>> +  - Eddie James <eajames@linux.ibm.com>
>> +
>> +description:
>> +  A basic SPI controller found on IBM Power chips, accessed over FSI. This
>> +  node will always be a child node of an ibm,fsi2spi node.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - ibm,p10-spi
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +allOf:
>> +  - $ref: spi-controller.yaml#
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    fsi2spi@1c00 {
>> +        compatible = "ibm,fsi2spi";
>> +        reg = <0x1c00 0x400>;
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
> Use rather some simple wrapper instead of node causing warnings, e.g.
> fsi {} with only address/size cells.


Will do, thanks.


>
>
>
> Best regards,
> Krzysztof
>

