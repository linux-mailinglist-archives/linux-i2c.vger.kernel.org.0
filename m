Return-Path: <linux-i2c+bounces-3227-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2B98B3B38
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 17:23:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7A711F2427D
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 15:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EFF315ECC7;
	Fri, 26 Apr 2024 15:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="sAX5Rpaa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CE514AD02;
	Fri, 26 Apr 2024 15:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714144812; cv=none; b=jiQnojQnM2aUlnl/LvLa2vPkI1PN2w0s7A7OSDVK+g85SGTPjRBDaYMqP9xaHlWWBI0WB5zkvNq03d2Rjoren4cWsrhRnV+/JPQVTZQD6Ac7REw3xXB4gwq2KaigZowjOrQ3m3IEwlxRTR73HB9h/SOyuuRrROV9yYlAiwfSZOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714144812; c=relaxed/simple;
	bh=bhFXMkPpW2MuEYm68FHLRT6ke7fFBzv9JlTsYVjL2OQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eYhdq/jgonk4Mem1y0XmFSgJjFds1yx66OQMuSDVpXC8Q/sqzQ9CoB2Vp+P3se2wW6uJNicGmc+o+ZBpcj4i1mTRtL+U5fQXoVuf2Fnh/WhfITOOjc5VpHoLR5GUXzl88Wau3M52Ib1TvrOaEn1UZDtunU2iEGKUnCpUA+Sf0MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=sAX5Rpaa; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43QEgQLJ009060;
	Fri, 26 Apr 2024 15:19:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=utQii5TuFLrp0kELhAiJGIrBnqewjCxQxZOgbabUCLI=;
 b=sAX5RpaaqtSj8wgzes85BYXLOnsRtLd9DtPQ54UpNlYU6p3tSiMCJjn/ncwlHBqD0mUw
 41t6x6sSiId5TurENEt8kxEhmAeoenBQnEBPEsKrWGzdpj2nPdMMeDJdJQfxdTq5NW6w
 kz9yLSFQNjMSVvcJ0pOGSxtF4WDQ1yWsbPjMb/unN3PDqBseSRNn8yo3Q/+v+QGnsWTe
 DVPzjgujVPdM+C8TgnDL307gIJUj3HyZmpQa+rMSBf0WlqUXxdG3zqySt7dZk71zUuW2
 pvZhER9XhglBTDFDxvmdB2VLkX5esuIz5r3143XinIeESuXY1uGpE0tZxvNqughD1vKA aw== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xre90g2nb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 15:19:58 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43QDXZvk015302;
	Fri, 26 Apr 2024 15:19:57 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xmshmr9q3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 15:19:57 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43QFJsL746727488
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Apr 2024 15:19:56 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AC17358061;
	Fri, 26 Apr 2024 15:19:54 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 61C3E58055;
	Fri, 26 Apr 2024 15:19:54 +0000 (GMT)
Received: from [9.61.156.17] (unknown [9.61.156.17])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 26 Apr 2024 15:19:54 +0000 (GMT)
Message-ID: <8d5cca29-2b4d-40a7-a7dd-c3eff625af95@linux.ibm.com>
Date: Fri, 26 Apr 2024 10:19:54 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/14] dt-bindings: fsi: Document the FSI Hub
 Controller
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-aspeed@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsi@lists.ozlabs.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
        andrew@codeconstruct.com.au
References: <20240425213701.655540-1-eajames@linux.ibm.com>
 <20240425213701.655540-10-eajames@linux.ibm.com>
 <91d5683b-17a2-466c-ab3d-baf216c97fa3@kernel.org>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <91d5683b-17a2-466c-ab3d-baf216c97fa3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: j3tQV2O3SV-XuNVzH1E2PY3aKEc1M6if
X-Proofpoint-ORIG-GUID: j3tQV2O3SV-XuNVzH1E2PY3aKEc1M6if
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
 engine=8.12.0-2404010000 definitions=main-2404260103


On 4/26/24 01:26, Krzysztof Kozlowski wrote:
> On 25/04/2024 23:36, Eddie James wrote:
>> Document the FSI Hub Controller CFAM engine.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   .../bindings/fsi/ibm,hub-fsi-controller.yaml  | 44 +++++++++++++++++++
>>   1 file changed, 44 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/fsi/ibm,hub-fsi-controller.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/fsi/ibm,hub-fsi-controller.yaml b/Documentation/devicetree/bindings/fsi/ibm,hub-fsi-controller.yaml
>> new file mode 100644
>> index 000000000000..d96d777d4d9f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/fsi/ibm,hub-fsi-controller.yaml
>> @@ -0,0 +1,44 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/fsi/ibm,hub-fsi-controller.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: IBM FSI-attached FSI Hub Controller
>> +
>> +maintainers:
>> +  - Eddie James <eajames@linux.ibm.com>
>> +
>> +description: |
> Do not need '|' unless you need to preserve formatting.


Ack.


>
>> +  The FSI Hub Controller is an FSI controller, providing a number of FSI links,
>> +  located on a CFAM. Therefore this node will always be a child of an FSI CFAM
>> +  node.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - ibm,hub-fsi-controller
> Again, is it for specific chip? SoC? Aren't you using generic
> compatibles (not allowed)?


This one is fairly universally supported on FSI (any POWER chip will 
have it) so I didn't add a specific chip... Should i? Do you mean 
generic compatibles are not allowed? How generic do you mean?


>
>
>
> Best regards,
> Krzysztof
>

