Return-Path: <linux-i2c+bounces-3359-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B678B8D94
	for <lists+linux-i2c@lfdr.de>; Wed,  1 May 2024 18:00:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76D561C223CD
	for <lists+linux-i2c@lfdr.de>; Wed,  1 May 2024 16:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 102C312FB16;
	Wed,  1 May 2024 16:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Nb25n8mJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D4212F395;
	Wed,  1 May 2024 16:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714579219; cv=none; b=mEU7mfkG4JY+nEkGDGKbx64JAWixAaxYnJqdwl3rS3QskcS9H+4upK0VeLOmrNu8xqr3zCc3i0dpOoL7fnjDgwucnBrWyDrw4eVLLBlz9HwLB9czrjo3GQJzTjbenCWkBJDXZ/hnbo/ll6ll3U2UPuzD7b237DE3Rd9FzwODcwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714579219; c=relaxed/simple;
	bh=0FvJEKNyoL4+WVAUbCEUE5NNfk6krBIm/bTVbgXAx+8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=los/e11yBJbx5ifQQ6Vor0E7kIJJFj87hKEykwbbuFu7tPan34qZw0w9PP2m9ZHoAl3pRq1mTjpH/witJd+yKFPxYpC5r8Js2IWG7DwvAU3JW6biL2C9Ld6Ht3v+1q3xH98sXb4yBoPNZ0O3+ZhWZWPdUNmzKEZkgiCVoKFwaNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Nb25n8mJ; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 441FQFkn013979;
	Wed, 1 May 2024 15:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=uYHsTZws7Y+ZIooWWy97bE9FTUukDpYcGKov8WVR2eM=;
 b=Nb25n8mJHCEBML3dOGEfYbulveaRbuYgqLJp5fSGuNe28G4Zr0hY5duYU2zSQhiamOis
 5aPBBvVpBG8SXo9gFuU1AAw41LcRixqCRLBZLmra32o7/UhjZmV+DTFLOsOIwROkOrpl
 f34v4asfv3Us5OlEQz7sQPvsp0ZsfovvkvENbZ+8+xz+iHC/MLSQ3HRbXgCPPP+6bXdS
 PbEzuuX1d3ISf9nZ7/VFbt9fNOMjZ9L42/VSCKU61HvKFD31tmkR1IIYsWoPA7I9/1PY
 QnlsBwZEWEOZEFHoqaj7qF+nv7q9akdKpOSbekflDSQwB9iD4FhtQIAur4eD2ux516gh ZQ== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xurcd0225-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 May 2024 15:59:59 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 441FtW1R001464;
	Wed, 1 May 2024 15:59:58 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xsbpu3fm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 May 2024 15:59:58 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 441Fxtcd40764114
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 May 2024 15:59:57 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E4B258064;
	Wed,  1 May 2024 15:59:55 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D536658061;
	Wed,  1 May 2024 15:59:54 +0000 (GMT)
Received: from [9.61.151.254] (unknown [9.61.151.254])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 May 2024 15:59:54 +0000 (GMT)
Message-ID: <e3601656-84d3-47e1-9cbd-d2cb0dde5f51@linux.ibm.com>
Date: Wed, 1 May 2024 10:59:54 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/17] dt-bindings: fsi: p9-occ: Convert to json-schema
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-aspeed@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsi@lists.ozlabs.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
        andrew@codeconstruct.com.au, andi.shyti@kernel.org
References: <20240429210131.373487-1-eajames@linux.ibm.com>
 <20240429210131.373487-5-eajames@linux.ibm.com>
 <0fcadbe6-7615-498e-89c0-e3b072c4828c@kernel.org>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <0fcadbe6-7615-498e-89c0-e3b072c4828c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GKMmqTHj5LTt7ttpRRWNmEvJAUezIuHR
X-Proofpoint-ORIG-GUID: GKMmqTHj5LTt7ttpRRWNmEvJAUezIuHR
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
 definitions=2024-05-01_15,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 clxscore=1015 phishscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2405010112


On 4/30/24 01:53, Krzysztof Kozlowski wrote:
> On 29/04/2024 23:01, Eddie James wrote:
>> Conver to json-schema for the OCC documentation. Also document the fact
>> that the OCC "bridge" device will often have the hwmon node as a
>> child.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>> Changes since v3:
>>   - Move required below other properties
>>   - Drop "occ-" in child node
>>   - Drop hwmon unit address
>>   - Complete example
>>   - Change commit message to match similar commits
>>
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
>> index 000000000000..3ab2582cb8a0
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
>> +patternProperties:
>> +  "^hwmon":
> And now it raises questions:
> 1. Other devices on FSI bus have unit addresses, so why this does not?
> 2. This suggest only one hwmon, so ^hwmon$, which is then not a
> patternProperty but property.
> 3. But the true problem why do you even need two empty nodes? These
> should be combined into one node.


1. This is not truly on the FSI bus. It is on the SBEFIFO "bus"

2. True enough, I'll change it to property.

3. If this binding was being designed now, I'd agree with you, but the 
two nodes (occ and occ-hwmon) are already documented, I'm just changing 
to yaml here... Changing that would require a lot of changes and would 
break the two drivers.


>
>> +    type: object
>> +    $ref: /schemas/hwmon/ibm,occ-hwmon.yaml
>> +
>> +required:
>> +  - compatible
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    occ {
>> +        compatible = "ibm,p9-occ";
>> +
>> +        hwmon {
>> +            compatible = "ibm,p9-occ-hwmon";
>> +        };
>> +    };
> Best regards,
> Krzysztof
>

