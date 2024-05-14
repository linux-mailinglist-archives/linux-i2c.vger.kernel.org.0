Return-Path: <linux-i2c+bounces-3490-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD508C58EB
	for <lists+linux-i2c@lfdr.de>; Tue, 14 May 2024 17:39:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A428C281D43
	for <lists+linux-i2c@lfdr.de>; Tue, 14 May 2024 15:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462A217EBB3;
	Tue, 14 May 2024 15:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ER4cPBLa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EF61E480;
	Tue, 14 May 2024 15:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715701159; cv=none; b=pxNzBwM7P3AnKjvvJHf6F8ZhPi2U18t/pk9S0+po8Q2+4/eON+pZ6H4ipwt8/EtW0Sl8RyyU7XEFSo3JkbHVVju76HTDJtsxkuihez3933TVSiPfs6WnmfdPrmL5dJVQi/1chtCVqfP8UZ01hdv1QIGLHTn8PGLsaJao1sMHmVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715701159; c=relaxed/simple;
	bh=TFIjicffkfSAiX7EWr4Uq8n9eqdo38oBcHIaWAKFAgE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=g1z9brJXU0iDJhQK8Fy9kb8TIo+wZ1qds6fpI695HOT2H+tGUpotJtvGKpjYPWc3BMvsFicUwvBDHLLL0iR4ajtW0jm+ubQHDZcQqld6HKdZs4I6VVzECFqkYrzcmwG3pvuir+PlJY/HmJNIXWnviix49nreKj8XeoKjFm1DBwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ER4cPBLa; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44EDaZ8m005782;
	Tue, 14 May 2024 15:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=QUu8bBw94LTXyX9BD3qDzghP2sdLwyB4xSVozL91ThY=;
 b=ER4cPBLauHTpdppQycxSKBvBBRVLfIWPWDKeDq7NNCH/nPJ4BASf2gwN5/ARyqP+6HXK
 oH/Ivp8fHZ1mm8vdhIn3F1o+J4yYspSdlIxK735RQ0vodUtfb013IFvChbh4OQivV/d3
 nx1GYPwvMw9qlOmjsY1yQeDkKNRkJMnsgUhaaDkAfGXoB9eWzXEG335mBouEwfPuHdD/
 9jGwfYdjs4KKg4VkxHzqBlqWBKclNHhb0RHYEYJUoKyhTdPe7NITP8w92zJm8aYrxORR
 zjGoFBOgoQpQw/3Dk/a2a6az8j7yH0Zn4OSL5vPENaNx6BdEcOfMXpXj5Px+Q+EWTkMf 4Q== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y48dngeqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 15:38:57 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44EFTFdl002273;
	Tue, 14 May 2024 15:38:56 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y2m0p66f2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 15:38:56 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44EFcrN448562508
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 May 2024 15:38:55 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 86A9D5805D;
	Tue, 14 May 2024 15:38:53 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C2ABC5805C;
	Tue, 14 May 2024 15:38:52 +0000 (GMT)
Received: from [9.61.107.19] (unknown [9.61.107.19])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 May 2024 15:38:52 +0000 (GMT)
Message-ID: <18011b0e-a479-4d93-947a-a71fe4efdcb5@linux.ibm.com>
Date: Tue, 14 May 2024 10:38:52 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/17] dt-bindings: fsi: ast2600-fsi-master: Convert to
 json-schema
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-aspeed@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsi@lists.ozlabs.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
        andrew@codeconstruct.com.au, andi.shyti@kernel.org
References: <20240429210131.373487-1-eajames@linux.ibm.com>
 <20240429210131.373487-9-eajames@linux.ibm.com>
 <af51132f-e4a3-4f45-b066-24b8c348eb28@kernel.org>
 <a7ca71c0-971c-49ab-b9f3-f6e6b32e9567@linux.ibm.com>
 <0a43b522-7c07-43a0-b4b0-155c3cf94177@kernel.org>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <0a43b522-7c07-43a0-b4b0-155c3cf94177@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0rbf2XRZiQi425DQQIeCERRgFQxutBWq
X-Proofpoint-GUID: 0rbf2XRZiQi425DQQIeCERRgFQxutBWq
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_08,2024-05-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405140110


On 5/4/24 06:55, Krzysztof Kozlowski wrote:
> On 01/05/2024 18:12, Eddie James wrote:
>> On 4/30/24 02:04, Krzysztof Kozlowski wrote:
>>> On 29/04/2024 23:01, Eddie James wrote:
>>>> Convert to json-schema for the AST2600 FSI master documentation.
>>> Please mention all the changes from pure conversion.
>>
>> Sure.
>>
>>
>>>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>>>> ---
>>>> Changes since v3:
>>>>    - Remove quotes around compatible strings
>>>>    - Re-order allOf to below required
>>>>    - Add child node in the example
>>>>    - Change commit message to match similar commits
>>>>
>>>>    .../fsi/aspeed,ast2600-fsi-master.yaml        | 81 +++++++++++++++++++
>>>>    .../bindings/fsi/fsi-master-aspeed.txt        | 36 ---------
>>>>    2 files changed, 81 insertions(+), 36 deletions(-)
>>>>    create mode 100644 Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml
>>>>    delete mode 100644 Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml b/Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml
>>>> new file mode 100644
>>>> index 000000000000..fcf7c4b93b78
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml
>>>> @@ -0,0 +1,81 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Aspeed FSI master
>>>> +
>>>> +maintainers:
>>>> +  - Eddie James <eajames@linux.ibm.com>
>>>> +
>>>> +description:
>>>> +  The AST2600 and later contain two identical FSI masters. They share a
>>>> +  clock and have a separate interrupt line and output pins.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - aspeed,ast2600-fsi-master
>>>> +      - aspeed,ast2700-fsi-master
>>> There was no such compatible before.
>>>
>>> How does this even validate? Where is fsi-master? You dropped a
>>> compatible without any explanation.
>>
>> I can make it a separate change to add ast2700.
>>
>>
>> I suppose I don't understand having two compatibles... Aspeed master
>> shouldn't use "fsi-master" as that is too generic, right? Why wouldn't
> Not necessarily, depends. Dropping it silently is confusing. What about
> other users? firmware, bootloaders, out-of-tree, other OS? Did you
> investigate all of them?


The old format file actually only used fsi-master in the example, not in 
the actual properties description. So I didn't really drop a compatible. 
Device trees using "fsi-master" are just buggy and should be fixed 
eventually, but I don't think it needs to be part of this series.


Thanks,

Eddie



>
>> it validate? Devicetrees using "fsi-master" also use
>> "aspeed,ast2600-fsi-master" so they should be OK...
> No, because the compatibles do not match. Run validation and you will
> see the errors.
>
> I am fine with dropping such compatible, which is not used by current
> kernel ABI, but first DTS must be fixed and second some explanation and
> justification is needed.
>
> Best regards,
> Krzysztof
>

