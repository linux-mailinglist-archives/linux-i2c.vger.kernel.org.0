Return-Path: <linux-i2c+bounces-3362-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B3E8B8DCF
	for <lists+linux-i2c@lfdr.de>; Wed,  1 May 2024 18:13:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47750287736
	for <lists+linux-i2c@lfdr.de>; Wed,  1 May 2024 16:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC0A12FF86;
	Wed,  1 May 2024 16:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="buYNGvH8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3924214012;
	Wed,  1 May 2024 16:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714579977; cv=none; b=blf+af1XvjOcLPJ+0d5kziB1ZqfpnQikGSHEcF1uAPjSU+fJMgpYUyKK8umH+esvjf0FYPKtFGomasKmaJaPaMGpGgL5hKyjUut5Ws9tu9TJmC4SOkXq4vBClVl85a7t+fmm4GuOZN/UhgVl/A4SopmTsGzShR7ZiBRaDe1eKR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714579977; c=relaxed/simple;
	bh=14sKNXn+brzb9C+o7JQHqc5qa1LapLYMZXn5YARcRmo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rP6P3yEjTYq3RzdEpfUkJo2Tvxu6v8K6Nb245lcv/rs/vs46gXoRh5JPytbQeL9QfWrGXLdeHBDOUo5xoIbBQPcK2eGbVnEQpNBCw992T75xozM6nGTBky1O1tF3biT2rT5nensKh2lNvbcnDWPUfsV1J0RBfo5DdICvuzBE0y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=buYNGvH8; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 441G0gmZ030606;
	Wed, 1 May 2024 16:12:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=5bbPujTRIF5gJfZHM8woOcETPm+Qgby910G7hWefVgY=;
 b=buYNGvH86cHbjGXx72X5Um2OA+E/rbMSUhXBnCKHz9n1+HvKwIGPqxLhi6cON61rFLnT
 4sz5Kndy6D80+2ajyDwN2FrQd5L5/XD+hYiOSkmyPs6sr1dzyv67plFATD4XYYw/hgqi
 HFn3wqKCk0nooP1FqC8aieoWfyaP78zmv511gO1jX82StaPW6RNkaMWmzsBixVE4MMTt
 MauEHxKkJjUSYKyFetPZNPpe0Pt99ltHY+TKqs7BbO2z73dll9QqE8p5BQn5YoRbY/fh
 2kTszAFsYJYJEN8RrFFGg1W9ZNuxnbRU/FWgd9PfwuH5ZfTJfEpH8LLCGt3cqI5AS2S0 4g== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xurcwr2ps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 May 2024 16:12:44 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 441EPZb6015603;
	Wed, 1 May 2024 16:12:43 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xsed32v4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 May 2024 16:12:43 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 441GCftx40305048
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 May 2024 16:12:43 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 48CD958059;
	Wed,  1 May 2024 16:12:41 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B048A58058;
	Wed,  1 May 2024 16:12:40 +0000 (GMT)
Received: from [9.61.151.254] (unknown [9.61.151.254])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 May 2024 16:12:40 +0000 (GMT)
Message-ID: <a7ca71c0-971c-49ab-b9f3-f6e6b32e9567@linux.ibm.com>
Date: Wed, 1 May 2024 11:12:40 -0500
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
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <af51132f-e4a3-4f45-b066-24b8c348eb28@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yRs-bhhRMfv4oUulsmZlFk-y7Yt3MXP8
X-Proofpoint-ORIG-GUID: yRs-bhhRMfv4oUulsmZlFk-y7Yt3MXP8
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
 definitions=2024-05-01_16,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2405010115


On 4/30/24 02:04, Krzysztof Kozlowski wrote:
> On 29/04/2024 23:01, Eddie James wrote:
>> Convert to json-schema for the AST2600 FSI master documentation.
> Please mention all the changes from pure conversion.


Sure.


>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>> Changes since v3:
>>   - Remove quotes around compatible strings
>>   - Re-order allOf to below required
>>   - Add child node in the example
>>   - Change commit message to match similar commits
>>
>>   .../fsi/aspeed,ast2600-fsi-master.yaml        | 81 +++++++++++++++++++
>>   .../bindings/fsi/fsi-master-aspeed.txt        | 36 ---------
>>   2 files changed, 81 insertions(+), 36 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml
>>   delete mode 100644 Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt
>>
>> diff --git a/Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml b/Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml
>> new file mode 100644
>> index 000000000000..fcf7c4b93b78
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml
>> @@ -0,0 +1,81 @@
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
>> +      - aspeed,ast2600-fsi-master
>> +      - aspeed,ast2700-fsi-master
> There was no such compatible before.
>
> How does this even validate? Where is fsi-master? You dropped a
> compatible without any explanation.


I can make it a separate change to add ast2700.


I suppose I don't understand having two compatibles... Aspeed master 
shouldn't use "fsi-master" as that is too generic, right? Why wouldn't 
it validate? Devicetrees using "fsi-master" also use 
"aspeed,ast2600-fsi-master" so they should be OK...


>
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>
> Best regards,
> Krzysztof
>

