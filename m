Return-Path: <linux-i2c+bounces-3222-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD218B3A82
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 17:01:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 881231F213BB
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 15:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7C2F148854;
	Fri, 26 Apr 2024 15:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="rqAdKPnn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4127824B3;
	Fri, 26 Apr 2024 15:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714143654; cv=none; b=fmjiYr3Rp08u3+xWk0w6etixV+26IQLAm8GU0TXkUTTdgAjcLsa8WUv9bBmwXKfuxWmtdn4HcaQit7MvcpnFl8QUOPAHH/KjTz+ZoSC+xlSjjkM+S2O5TQlcnhSqsxyqP52d1imw5R+5QbwBrpDHj20LdprJTFsnK+qUFrG+dxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714143654; c=relaxed/simple;
	bh=Krp0ixMO8Z7FJrpDXir2sn7ZJLY3AzyiosM0Mm20ZLU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pfNN1ARb0vrcOGshLtMnVvRCmxFoEKvcpPLheYxQzL5+hE6EWEcBD0VSbUasel7zJOWSiCe+Btsh7RSd06dvyeU7TcSBPPQRGLLzGeQ45YxrTVpV8y3tIZS/pukHaKECOsjX2BgNfitdyq97MKxIB7Tt9MSfHGFnqA/JDEdu9eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=rqAdKPnn; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43QEpvwN028494;
	Fri, 26 Apr 2024 15:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=qr+2iUUPDNYgObLxDLeS1JVLJzKYCjSVzJhiz1bDJ7Y=;
 b=rqAdKPnn8E+iUHckboXCI1403tWg3F+KFttV21ra8Ohy7COQG9D77t1qvyPMe26of9MW
 wiIlplwT+4/tI1Q0Ln6fXpdIuj1hdvq9Vi8VE7h5ZiCT+xfCunbTbtg5gZZxa6wYh/fH
 Bvno5jFKCbabEpWDJRb1vmuzQBnbufSIpWMgXmrEIqWphoBLSzMmKIc0QjxXvsAAxKIC
 g/s1QWn5iwTTOx37g7CmYX2cAC7nsJEbnxWZk5NAtsC+5HoprCyFI9pujUM0wJ1ffAJa
 /LSC5FJnRO//vZBzVBhUFPP0lR3vPBiMOS2xdAY9IuWVMjriRl0EnZFvdtpFuyL5qUJP FA== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xredf80vk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 15:00:38 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43QDe2ck015430;
	Fri, 26 Apr 2024 15:00:37 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xmshmr6t2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 15:00:37 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43QF0YZJ9044632
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Apr 2024 15:00:36 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 520E258069;
	Fri, 26 Apr 2024 15:00:32 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0AD7458060;
	Fri, 26 Apr 2024 15:00:32 +0000 (GMT)
Received: from [9.61.156.17] (unknown [9.61.156.17])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 26 Apr 2024 15:00:31 +0000 (GMT)
Message-ID: <b89d39d2-ec54-4a88-aee5-7b5c95b3fca7@linux.ibm.com>
Date: Fri, 26 Apr 2024 10:00:31 -0500
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
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <3f822b56-8e6a-43e4-afb0-15c964f9474e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -v8pjlEPK1p_sMN1TL5NRtVbH9UJS6rn
X-Proofpoint-GUID: -v8pjlEPK1p_sMN1TL5NRtVbH9UJS6rn
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
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 mlxscore=0 bulkscore=0 phishscore=0 mlxlogscore=990 suspectscore=0
 impostorscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2404010000 definitions=main-2404260100


On 4/26/24 01:18, Krzysztof Kozlowski wrote:
> On 25/04/2024 23:36, Eddie James wrote:
>> The FSI2PIB or SCOM engine provides an interface to the POWER processor
>> PIB (Pervasive Interconnect Bus).
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   .../devicetree/bindings/fsi/ibm,fsi2pib.yaml  | 38 +++++++++++++++++++
>>   1 file changed, 38 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/fsi/ibm,fsi2pib.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/fsi/ibm,fsi2pib.yaml b/Documentation/devicetree/bindings/fsi/ibm,fsi2pib.yaml
>> new file mode 100644
>> index 000000000000..4d557150c2e3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/fsi/ibm,fsi2pib.yaml
>> @@ -0,0 +1,38 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/fsi/ibm,fsi2pib.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: IBM FSI-attached SCOM engine
>> +
>> +maintainers:
>> +  - Eddie James <eajames@linux.ibm.com>
>> +
>> +description:
>> +  The SCOM engine is an interface to the POWER processor PIB (Pervasive
>> +  Interconnect Bus). This node will always be a child of an FSI CFAM node;
>> +  see fsi.txt for details on FSI slave and CFAM nodes.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - ibm,fsi2pib
>> +      - ibm,i2cr-scom
> Sometimes you call these p9, sometimes p10... what is the system or SoC
> here? Aren't you adding some generic compatibles? writing-bindings and
> numerous guides are clear on that.


Open source FSI support started with P9 chips so we initially added 
p9-sbefifo, p9-occ, etc. P10 has all of the same engines as P9 plus the 
SPI controller, so that's why SPI is p10-spi. P11 has the same engines 
as P10. For scom/fsi2pib we could call it p9-scom I suppose... This 
series isn't just documentation for a new system, I'm adding 
documentation that should have been added for P9. Anyway I'm not sure 
what you mean about generic compatibles? You mean just add a "scom" or 
"fsi2pib" compatible? writing-bindings says "DO make 'compatible' 
properties specific"


Thanks,

Eddie


>
> Best regards,
> Krzysztof
>

