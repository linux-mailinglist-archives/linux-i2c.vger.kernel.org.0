Return-Path: <linux-i2c+bounces-3228-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5DF8B3B4D
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 17:25:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52BD1B24D6F
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 15:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F8AB154422;
	Fri, 26 Apr 2024 15:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="iOoM7OFA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274011494A7;
	Fri, 26 Apr 2024 15:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145027; cv=none; b=djUyXKiK6IBLC9RrwattSiLd4oS7JhDgecB4miRBI6mTXRfrrfvoAeDJ9iCPy0dAxwh75JlUGduxr9wYohdfMc2+m5TWyDa7nDobjvqlIc99Am4t8FKJfw+/ZR+3ICkN3jHCYGYvL6SjTdQbMb+ySwRwJQqWhgfaYKgIbq0GAIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145027; c=relaxed/simple;
	bh=cQokOok50FvSBH5f38xOh7Sn6Oft1X7gWWsl8fdB21Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kR0AJIt21RPfAO0GuZKHNsNDBsQc3ZslVta7oeg36JEaPE3Al3Y89oB6tBiKJFt1QcRETcv92xZp6mIVGjGRGAs7EhISKE2DRaTmEdSg4ny4op7S7FldHKQPysYK6Qr23FnTAfYOWzx0Pc3fRqDyCT7cIEPzUpPiWoX6REvBYf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=iOoM7OFA; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43QFMHT8016235;
	Fri, 26 Apr 2024 15:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=CViDKwrvpIv+cpI7v9ixPLgnbdWhkWZcrv5mb1eXGAg=;
 b=iOoM7OFA7Sckze2DMu6kLFQI/KSC236JyAMdQRD/jxA7fBFSMiEs6sokjWJuDIHp3Q+C
 hbYHvNnqOuzDWswN2T+i9hXI/tqP6sHp3g6in9Z8LRMSqK9fBqno5yVddiRTc4PMKTV5
 2gImlAcvTVZvo9I5s9G6kiyWROO4j4tZa4KF0kpNU7BT2TOIMyIiOwY6Ms3EnbiPVYrC
 P4Wazhs7XsVMVgKMYC6CbUc38bVe/MQERKHZRPK277rBRlhgiN8u/lOmNgnD7CHCNeYr
 o76nVriHSuB+NZ6HTzovKWM+iMm/B29EK1438FdtcnsTjpYvHdfQYf5zVhnxvhY56XzD Tg== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xreuj003j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 15:23:34 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43QCCfr9023065;
	Fri, 26 Apr 2024 15:23:33 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xms1pgemr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 15:23:33 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43QFNUgm34668922
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Apr 2024 15:23:32 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 93CAF58060;
	Fri, 26 Apr 2024 15:23:30 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4A11558059;
	Fri, 26 Apr 2024 15:23:30 +0000 (GMT)
Received: from [9.61.156.17] (unknown [9.61.156.17])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 26 Apr 2024 15:23:30 +0000 (GMT)
Message-ID: <bc58a063-9eaf-4bcb-b538-a95d8d03ea24@linux.ibm.com>
Date: Fri, 26 Apr 2024 10:23:30 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/14] dt-bindings: i2c: i2c-fsi: Switch to yaml format
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-aspeed@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsi@lists.ozlabs.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
        andrew@codeconstruct.com.au
References: <20240425213701.655540-1-eajames@linux.ibm.com>
 <20240425213701.655540-11-eajames@linux.ibm.com>
 <f84ddcdb-8f8a-4cf6-a851-243baa1745ac@kernel.org>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <f84ddcdb-8f8a-4cf6-a851-243baa1745ac@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QQf-aFXFgQZ_OsX9OStiFZp3OJntPtn8
X-Proofpoint-ORIG-GUID: QQf-aFXFgQZ_OsX9OStiFZp3OJntPtn8
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
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 mlxscore=0 adultscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404260103


On 4/26/24 01:29, Krzysztof Kozlowski wrote:
> On 25/04/2024 23:36, Eddie James wrote:
>> Switch to yaml for the FSI-attached I2C controller.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC (and consider --no-git-fallback argument). It might
> happen, that command when run on an older kernel, gives you outdated
> entries. Therefore please be sure you base your patches on recent Linux
> kernel.
>
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline), work on fork of kernel
> (don't, instead use mainline) or you ignore some maintainers (really
> don't). Just use b4 and everything should be fine, although remember
> about `b4 prep --auto-to-cc` if you added new patches to the patchset.
>
>> ---
>>   .../devicetree/bindings/i2c/i2c-fsi.txt       | 40 -------------
>>   .../devicetree/bindings/i2c/ibm,i2c-fsi.yaml  | 59 +++++++++++++++++++
>>   2 files changed, 59 insertions(+), 40 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-fsi.txt
>>   create mode 100644 Documentation/devicetree/bindings/i2c/ibm,i2c-fsi.yaml
>>
>
>> -    };
>> diff --git a/Documentation/devicetree/bindings/i2c/ibm,i2c-fsi.yaml b/Documentation/devicetree/bindings/i2c/ibm,i2c-fsi.yaml
>> new file mode 100644
>> index 000000000000..473a45de1b6c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/i2c/ibm,i2c-fsi.yaml
>> @@ -0,0 +1,59 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/i2c/ibm,i2c-fsi.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: IBM FSI-attached I2C controller
>> +
>> +maintainers:
>> +  - Eddie James <eajames@linux.ibm.com>
>> +
>> +description:
>> +  This I2C controller is an FSI CFAM engine, providing access to a number of
>> +  I2C busses. Therefore this node will always be a child of an FSI CFAM node;
>> +  see fsi.txt for details on FSI slave and CFAM nodes.
> Here and in all other schemas - remove reference to fsi.txt. You are
> going to drop this file once you convert everything, right?


Good point, yes.


>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - ibm,i2c-fsi
>> +
>> +  reg:
>> +    items:
>> +      - description: FSI slave address
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +allOf:
>> +  - $ref: /schemas/i2c/i2c-controller.yaml#
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    i2c@1800 {
> So no wrapper node is needed. Drop the wrapper node in previous patchset
> where you introduced one with warning.


The other one is actually a child node of the equivalent spi controller, 
so it does need some sort of wrapper (address-cells and size-cells don't 
match).


>
>
> Best regards,
> Krzysztof
>

