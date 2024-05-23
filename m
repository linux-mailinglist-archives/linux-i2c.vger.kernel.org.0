Return-Path: <linux-i2c+bounces-3654-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9FA8CDA56
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 21:01:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2463B21962
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 19:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B7E82492;
	Thu, 23 May 2024 19:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="nIS/d4Lq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A7A28F5;
	Thu, 23 May 2024 19:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716490878; cv=none; b=N0iBzhNLUI0/ivX1CKk2dVtIGmbUx2uvuyzC0G+qGqqtgstir1h6c7u2wgib83kXT6X3i3O0rN4K8n7rwFAEYVWJplWBrJhQ/me+aCKEHZBwTW7gWv9PijAukzAYcHEUi7txgpHvvBRA0oVJ1/cXo04YqO/AECUPvQrqUFW4Grc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716490878; c=relaxed/simple;
	bh=3EiyLqgYby63BWgHIZFCD3c4sW1g12fHPqHi9WFjwdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dZUG0OdqdrdeWvOyAKw6N5Ppv3qiCjVMTwooQJZ71cUHw0O52WcakkcfYfDHmKyBy1FOOqnAitMd3aTbiA7wtjwjmWWnPV2M1ExCvG5Ehr+Q/SxFkmPywNPZMIRaouSLdr5y6sJLVdSIaWM5EFg6s2ocPwyM4TsUbfDaWDRDJtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=nIS/d4Lq; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44NIlAWp024151;
	Thu, 23 May 2024 19:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=bAaqPBMTRdF77PtXGmWOWLFomk8hgMqj951WpPyFeM8=;
 b=nIS/d4LqR6kwfPCrHzTykgmzlJsA2MhUQFTJb/+rdm0aaOVJN/ORmWKIBYNYGU4yCl2y
 IMejNabF9C5FOVkeWnNH8WNN2HneYeXWdfHnSxr+vIrkgrc4FeY4y+hKM7Us4RhB3/CW
 XYJ+9dWivzpqBO7FkwA5Q23cKSMzEb9dV2lgrtULn0ttfuIXmJq20d+oGuWEYqZ07L/X
 gRKfUlobgWnz+ArSUhaOV3KaBF4lWSjUFwcC2wJgZBN+/W15niJtmp6gKncV1qvgY9F/
 Au9bO6mxaVFF5f54e5xWifvC6IcHZSZ4K5Moz/wOjCegFyfJo0m8JwKp9Kz1UlcaNnJX MQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yabcn80uy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 19:00:31 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44NJ0UJg013258;
	Thu, 23 May 2024 19:00:30 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yabcn80uw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 19:00:30 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44NI0Grn026474;
	Thu, 23 May 2024 19:00:29 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y785mun5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 19:00:29 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44NJ0Ptp16908898
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 May 2024 19:00:27 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CAC5A58077;
	Thu, 23 May 2024 19:00:23 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 037865807C;
	Thu, 23 May 2024 19:00:23 +0000 (GMT)
Received: from [9.61.104.209] (unknown [9.61.104.209])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 May 2024 19:00:22 +0000 (GMT)
Message-ID: <910b18b7-3717-4087-b028-fcaf5f2a604b@linux.ibm.com>
Date: Thu, 23 May 2024 14:00:22 -0500
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 17/20] ARM: dts: aspeed: Add IBM Huygens BMC system
To: Markus Elfring <Markus.Elfring@web.de>, linux-fsi@lists.ozlabs.org,
        linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Lakshmi Yadlapati <lakshmiy@us.ibm.com>,
        Mark Brown <broonie@kernel.org>, Ninad Palsule <ninad@linux.ibm.com>,
        Rob Herring <robh@kernel.org>
References: <20240522192524.3286237-18-eajames@linux.ibm.com>
 <2fe45df6-01a2-488b-99fb-5ee20491554c@web.de>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <2fe45df6-01a2-488b-99fb-5ee20491554c@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DaHk4BGi1JnBbJEcYTxavb7ks4_-OLx7
X-Proofpoint-ORIG-GUID: lzx1m2_L4JsKlNwhIn4n44hDV1LcZcty
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_11,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1011 impostorscore=0 phishscore=0 mlxlogscore=849
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405230130


On 5/23/24 13:45, Markus Elfring wrote:
>> The Huygens is a Rainier with modifed FSI wiring.
> Will imperative wordings become helpful for a better commit message here?


This statement is a description of hardware. I cannot word that 
imperatively. The commit message is imperative - "Add Huygens system".


>
> Regards,
> Markus

