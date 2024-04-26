Return-Path: <linux-i2c+bounces-3223-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA598B3A91
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 17:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 239D31F23842
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 15:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16806148857;
	Fri, 26 Apr 2024 15:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="nmqhAV/P"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BCB148846;
	Fri, 26 Apr 2024 15:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714143974; cv=none; b=Th9JizdCbyoObRlxpCJvdnotk0evw5ur1SN04L5sjvxu7BtyKmlXy3kTIgLdhs7cY7sLC5fVm7pL1GXmvtbtOvbynAwf04fhjXftBbIeTOw+K2oKZZyfTlMuOXomMEYW5Dx6vCmM1dzaRY+RCyuTtvIebsRsSVx/ONi6XJEYvB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714143974; c=relaxed/simple;
	bh=HzXlS2pDevMlkBifIMOUn/klI2ghDTtiBdzLNt1RqX0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=efMRQTbqsSHnWAvTUe2ZViqeTvw3edOCedpMWHZzC2oY6gYYg6W6MQqurpRdosGZeTKWjLdcPSbV9bR8CRz+hetFDDubVjXcWGvVmmkwZsCofQko0zMmWMsMwpOfTJFrGH+uzxyt0tmu63PEQNuV29b7YjI8XjX0brMtjEVzI88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=nmqhAV/P; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43QEXWnw016777;
	Fri, 26 Apr 2024 15:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=WnUX2Z5Q2AQL2X6jPId7AFgMZYeR6hgmEY/9JkQ7CVg=;
 b=nmqhAV/PHcXwEy+h5lMiVaj1kItNRcDFJmmsGrUoUbw1sqR0LUKyKzHIZGYHYuH+qAIf
 z08LHU5ZlohqnVZPfmuQ5B/j/9M4rhl2qb0POAK8bxGyO+prWoCCNgtXc9A07qc6GIEP
 FtGKDuJQ6HByp0TKjhdiW2edr6uR0rYqvMfM1uMTNIk1TlhcDvy+KcnXom8eqk0cC+Oo
 htDIfIz5+44QoaQc35MO3Xz1DBvM2s8PtNlanF1OdTTL/HsYofNvwJs5ovRmJz6+6cki
 3F4ewwPuR90pxOSlWvn+XcgcLf48f5POBn5xjY0nCzfznD5MTqQiELmd3KfIMquSzT+g lg== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xre4n02jx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 15:05:53 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43QDXZrQ015302;
	Fri, 26 Apr 2024 15:05:53 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xmshmr7sj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 15:05:53 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43QF5ouO24576714
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Apr 2024 15:05:52 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 81EFD58063;
	Fri, 26 Apr 2024 15:05:50 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3CD6558059;
	Fri, 26 Apr 2024 15:05:50 +0000 (GMT)
Received: from [9.61.156.17] (unknown [9.61.156.17])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 26 Apr 2024 15:05:50 +0000 (GMT)
Message-ID: <9a480ab1-242f-4577-bb86-4fe5f4434c26@linux.ibm.com>
Date: Fri, 26 Apr 2024 10:05:50 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/14] dt-bindings: fsi: p9-occ: Switch to yaml format
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-aspeed@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsi@lists.ozlabs.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
        andrew@codeconstruct.com.au
References: <20240425213701.655540-1-eajames@linux.ibm.com>
 <20240425213701.655540-5-eajames@linux.ibm.com>
 <d5e79c40-d961-43a9-ad4c-ebed17dfe814@kernel.org>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <d5e79c40-d961-43a9-ad4c-ebed17dfe814@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VcgvxGfqkhkUcQqZ1JVD4bk_DpaK8QVQ
X-Proofpoint-ORIG-GUID: VcgvxGfqkhkUcQqZ1JVD4bk_DpaK8QVQ
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
 suspectscore=0 impostorscore=0 mlxlogscore=999 priorityscore=1501
 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404260101


On 4/26/24 01:19, Krzysztof Kozlowski wrote:
> On 25/04/2024 23:36, Eddie James wrote:
>> Switch to yaml for the OCC documentation. Also document the fact
>> that the OCC "bridge" device will often have the hwmon node as a
>> child.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   .../devicetree/bindings/fsi/ibm,p9-occ.txt    | 16 --------
>>   .../devicetree/bindings/fsi/ibm,p9-occ.yaml   | 41 +++++++++++++++++++
>>   2 files changed, 41 insertions(+), 16 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
>>   create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
>> deleted file mode 100644
>> index e73358075a90..000000000000
>> --- a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
>> +++ /dev/null
>> @@ -1,16 +0,0 @@
>> -Device-tree bindings for FSI-attached POWER9/POWER10 On-Chip Controller (OCC)
>> ------------------------------------------------------------------------------
>> -
>> -This is the binding for the P9 or P10 On-Chip Controller accessed over FSI from
>> -a service processor. See fsi.txt for details on bindings for FSI slave and CFAM
>> -nodes. The OCC is not an FSI slave device itself, rather it is accessed
>> -through the SBE FIFO.
>> -
>> -Required properties:
>> - - compatible = "ibm,p9-occ" or "ibm,p10-occ"
>> -
>> -Examples:
>> -
>> -    occ {
>> -        compatible = "ibm,p9-occ";
>> -    };
>> diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.yaml b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.yaml
>> new file mode 100644
>> index 000000000000..1fa87d452489
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.yaml
>> @@ -0,0 +1,41 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/fsi/ibm,p9-occ.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: IBM FSI-attached On-Chip Controller (OCC)
>> +
>> +maintainers:
>> +  - Eddie James <eajames@linux.ibm.com>
>> +
>> +description:
>> +  The POWER processor On-Chip Controller (OCC) helps manage power and
>> +  thermals for the system, accessed through the FSI-attached SBEFIFO
>> +  from a service processor.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - ibm,p9-occ
>> +      - ibm,p10-occ
>> +
>> +  reg:
>> +    items:
>> +      - description: Processor index
>> +
>> +required:
>> +  - compatible
> required goes after all properties, so below.


Ack.


>
>> +
>> +patternProperties:
>> +  "^occ-hwmon(@.*)?":
>> +    type: object
>> +    $ref: /schemas/hwmon/ibm,occ-hwmon.yaml
> Drop occ, not relevant. Why unit address is optional? This is supposed
> to be specific. Use proper regex as well for hex numbers.


Well, there isn't really any concept of address here, it's a 1-to-1 
relationship. I should just drop the unit address.


>
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    occ {
>> +        compatible = "ibm,p9-occ";
> Not complete.


Ack.


>
>
> Best regards,
> Krzysztof
>

