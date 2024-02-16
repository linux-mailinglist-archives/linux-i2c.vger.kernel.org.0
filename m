Return-Path: <linux-i2c+bounces-1842-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B65BE85860A
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 20:14:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7359C281B0D
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 19:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B078B135A6E;
	Fri, 16 Feb 2024 19:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="eRZAH37A"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2781350F5;
	Fri, 16 Feb 2024 19:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708110884; cv=none; b=hB5hQNR5k+OP6SuFpxUUozoG4Hm4QZzNQH/kgepTcGNfk8gU5Ucp4j/kAE1RnniddSMD/vcYVvQFXD4oOOy5m8F8NRouTWa9NmaoXHFOll7MamJFFCF3++38yB8M/XGcKIz64r4wQ+oMkhMmPO3aC5mgb9l+bUipYmpsAiF9hjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708110884; c=relaxed/simple;
	bh=4zMflq+VnJgh9gRKVNTl0SwwRf1h6nqBt8DpletaZ6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JBqbgtgkg3eMYMdnuxYF5vEfZlVUGCTLVAdLH8Ahi7nk8SYxeBUsoQnecO7tyH5J392LnrboFtm699/eT5CVK4zJyHI34iLGBiar95LOu/A8SbQ+pmHh9gmVMda28uwKpoWZyyHwyOGl7MRERTHl6imH5jGwLIXJFfwnuUT2hrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=eRZAH37A; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41GIvbcd024238;
	Fri, 16 Feb 2024 19:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=zHzGk21ehQO2Gz9UHv2mp3uNd6s22EkRBNEJ2cwKgMs=;
 b=eRZAH37AovUOFRHpX7QfiJsSfNcnooPuz11yc0CsOfuwja1KzdWt+eL7ZcCkfAoTghy4
 kKFHOYGfKFgg9IX/0Q0y4GH5V25ppi6AZnFvUCuOi+vsjHMnkZonatwzys5SscvM5kA2
 7Apx5C/qCrrPzDoz5jakK5W8tq1qaNapV1mCQ7WAG/lzAIvCsapohKrmauG5jkArIzYl
 Rln3W5DLXFYUCgzEN+W7lW5zZYzpgihhUXeTp8a2mOCnyJZYiklEMdEmrXmMu24hurXH
 OzY4q8cUW+m0eomO878ODgtelDHaYZFVJIVTXSHkS4hmKkGCy47icQbcqoJFBNacgBJD Dg== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wadefrbcg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 19:14:28 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41GH76S9009896;
	Fri, 16 Feb 2024 19:14:27 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w6npmcw2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 19:14:27 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41GJEPXo18088662
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Feb 2024 19:14:27 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0DA6558063;
	Fri, 16 Feb 2024 19:14:25 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B668D58059;
	Fri, 16 Feb 2024 19:14:24 +0000 (GMT)
Received: from [9.61.14.18] (unknown [9.61.14.18])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Feb 2024 19:14:24 +0000 (GMT)
Message-ID: <8649af3d-c7f9-452b-a8c4-921fe5fa30f8@linux.ibm.com>
Date: Fri, 16 Feb 2024 13:14:24 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/33] ARM: dts: aspeed: p10 and tacoma: Set FSI clock
 frequency
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        andi.shyti@kernel.org, alistair@popple.id.au, joel@jms.id.au,
        jk@ozlabs.org, sboyd@kernel.org, mturquette@baylibre.com,
        robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
References: <20240215220759.976998-1-eajames@linux.ibm.com>
 <20240215220759.976998-8-eajames@linux.ibm.com>
 <67ea1daa-72a5-4dc0-b766-34a99052dabb@linaro.org>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <67ea1daa-72a5-4dc0-b766-34a99052dabb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Bx2ZZNL0ja3aqhyn6Hv2Kc-Wl4Xp_T5-
X-Proofpoint-GUID: Bx2ZZNL0ja3aqhyn6Hv2Kc-Wl4Xp_T5-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-16_18,2024-02-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1011
 malwarescore=0 mlxscore=0 suspectscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 mlxlogscore=826 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402160149


On 2/16/24 02:08, Krzysztof Kozlowski wrote:
> On 15/02/2024 23:07, Eddie James wrote:
>> Now that the driver doesn't hardcode the clock divider, set it
>> in the device tree.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts | 1 +
>>   arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi     | 1 +
>>   2 files changed, 2 insertions(+)
> Please do not mix DTS patches with driver code. DTS goes to the end
> because driver code CANNOT depend on it (there are exceptions but it was
> not explained here).


Sure, I didn't realize. Thanks.

Eddie


>
> Best regards,
> Krzysztof
>

