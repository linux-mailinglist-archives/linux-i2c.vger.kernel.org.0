Return-Path: <linux-i2c+bounces-3361-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 330DA8B8DB9
	for <lists+linux-i2c@lfdr.de>; Wed,  1 May 2024 18:07:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2D1D28671D
	for <lists+linux-i2c@lfdr.de>; Wed,  1 May 2024 16:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D24112FF76;
	Wed,  1 May 2024 16:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="mN6XUyB0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC2212F361;
	Wed,  1 May 2024 16:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714579584; cv=none; b=W+AfzYeXyP4rTgC1izrO0SNMQJPa3EkN6npHiKQoBQRuv6tWPQwEO5YwAIAaDE/drHAFvLEuuu/zI7Rv0JGR1SYDs4lShL0t2XYCQK85XYpsqj0IaubFcU+pJuizpDJ5hXi3r0jjqLKC5KBv0IPBhMbGc1PjVAILh21Sh9Hc46M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714579584; c=relaxed/simple;
	bh=ZcgzKDm/of9Wt+5rIopJ7QuvS112pELrgGHc232E0m8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b7fmiDVHnW0H7lGekSDobftbGR8nEPNl+r/Gl7N+d1X+vHZGPCym94BPIpswoyub/0e/1ftMLwaZ1fBTZC8kghRECvKXlfUkevIccw1yGlPggj8whYzsZST9pGiZlSG0aqLZ3gQ7vRSyLacHNorIUOIu+gQQZ8TR61GB4X+CPxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=mN6XUyB0; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 441FQ0qY015311;
	Wed, 1 May 2024 16:06:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=qhTErhXv7kPwGaPxnSu5C0AL6AK3KjxuhOkfaFwZrQ0=;
 b=mN6XUyB00UsD2iuJxIAR04/2WE9DudhyREnnD24y80M8HKvcoLajesGJdOQzsfhHZ9Sh
 MQK8OqsIAhXvCmhFFLDQrdMmG9wGjTvkDzLQnWFa0H/yXKLx7OUOvfSM1LnSJ+KorEiW
 8/qnsCaW3V2YNUMZr6O1/tKAa5ad13gsALUOMhNLZknEeBe5dOqPtU7rhbA4gikRM+Ih
 Bw3YGwD25SpLbrpD/7JZZJ+b7PHhj5MMewZEZmCOhVE/WXGlP0R0vl7URVtoWtnAR1ri
 u6W3Zpwu25ESVPKcEZh3jmMynzhMtdpJiLcMTEz5DiV0ybCN+4CmUQ0DJiHTh2Nv+27I JQ== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xurc882g1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 May 2024 16:06:06 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 441D6r2m022258;
	Wed, 1 May 2024 16:06:05 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xsd6mu5sa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 May 2024 16:06:05 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 441G62iY23069406
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 May 2024 16:06:05 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E1FC058057;
	Wed,  1 May 2024 16:06:02 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 57E3358058;
	Wed,  1 May 2024 16:06:02 +0000 (GMT)
Received: from [9.61.151.254] (unknown [9.61.151.254])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 May 2024 16:06:02 +0000 (GMT)
Message-ID: <366b0cb8-1309-4f15-b4f0-077dfaf4250c@linux.ibm.com>
Date: Wed, 1 May 2024 11:06:02 -0500
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/17] dt-bindings: fsi: Document the FSI controller
 common properties
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-aspeed@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsi@lists.ozlabs.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
        andrew@codeconstruct.com.au, andi.shyti@kernel.org
References: <20240429210131.373487-1-eajames@linux.ibm.com>
 <20240429210131.373487-7-eajames@linux.ibm.com>
 <3bcc9143-6896-496b-aa30-7ac0fc2d8e51@kernel.org>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <3bcc9143-6896-496b-aa30-7ac0fc2d8e51@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EUwgN6h4fW5c-n53JwXNklGrSmNFME6R
X-Proofpoint-ORIG-GUID: EUwgN6h4fW5c-n53JwXNklGrSmNFME6R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-01_15,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 clxscore=1015 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2405010112


On 4/30/24 02:01, Krzysztof Kozlowski wrote:
> On 29/04/2024 23:01, Eddie James wrote:
>> +
>> +patternProperties:
>> +  "cfam@[0-9a-f],[0-9a-f]":
>> +    type: object
>> +    properties:
>> +      chip-id:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        description:
>> +          Processor index
> fsi.txt tells a bit more about it, so extend the description.


Ack.


Thanks,

Eddie


>
>
>> +
>> +      reg:
>> +        maxItems: 1
>> +
>> +      "#address-cells":
>> +        const: 1
>> +
>> +      "#size-cells":
>> +        const: 1
>> +
>> +    required:
>> +      - reg
>> +
>> +    additionalProperties: true
>> +
>> +additionalProperties: true
>> +
>> +examples:
>> +  - |
>> +    fsi {
>> +        #address-cells = <2>;
>> +        #size-cells = <0>;
>> +
>> +        cfam@0,0 {
>> +            reg = <0 0>;
>> +            #address-cells = <1>;
>> +            #size-cells = <1>;
>> +            chip-id = <0>;
>> +        };
>> +    };
> Drop the example, it's not being validated/used.


Ack.


>
> Best regards,
> Krzysztof
>

