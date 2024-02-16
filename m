Return-Path: <linux-i2c+bounces-1843-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2009858614
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 20:18:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4EDE1C23270
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 19:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C9B136662;
	Fri, 16 Feb 2024 19:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="gAqdyzcJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A28135A73;
	Fri, 16 Feb 2024 19:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708111127; cv=none; b=SpaayeapfYX+pZICbO/pVXZ5YEG31sz8bnfCFo9m0n4xg30xp1riNvKebyJXzk9gfzxCRara75PK6xjuZ/r7H67gIKKwIO53DUCr91kjwtBXBN/NPHac55O1p9KpWN3p9ivVCrJWuRpIYMqmYT7vYt6IKwYdzBWVZDNNsTeXS84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708111127; c=relaxed/simple;
	bh=2Jhhh9ICggAF5bLuB5D2MLLnslAhKlyRqkv8sny2Ytg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UR2zWfXXJ4yqAJon/DqROw/UmyEDb4UYCbeyx/ySaCeatfJ7I0tZA2zBW/fZKRrb15e1f+FhUT8JceA3hCXAZq93U6yNo4uKnCKezQFEqCXAVPtGF091GQuC2kMzppjqjSuLd6eAcdEqVfsDECy+pg7fQmSNjHgHbiX7E+jLELc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=gAqdyzcJ; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41GIvF22022224;
	Fri, 16 Feb 2024 19:18:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=wQ7cNoLiknZDmwS2Em7PNRkOjFwYxd3dHjovbtNrxUQ=;
 b=gAqdyzcJY9lqgK5tNxEFFWSf7lLIcYj1ZKTPdvdYdbUE85elYvPEB3rIjvTxPsm6FGgb
 vY1RU23R8jfPhAj9sufnA60seoix47kRDitmMp92sk0Bf+/vTGlRhF0U8vys3jS+rGGt
 e7rGfNwDIk2jY/gaj1uT8KiymPI0rP/9DYbSJCIxe7B5ttQiLx0zZkTeulJSd0L1c2MW
 2GmfrdSclQbnLexqzrW0ufHvunX/PY56uBa96yGS+sXNJMc+VTNRj3StcAad3EmHRSQA
 Ka3vdJbHu72mCrFv9lzMw3h2ho+7TNSymhXGp2rjN7q1+E2FtoC7WUSlurOyPTu9dQvU UA== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wadecgedg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 19:18:34 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41GJFltf016203;
	Fri, 16 Feb 2024 19:18:33 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3w6myn56v2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 19:18:33 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41GJIUka18678328
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Feb 2024 19:18:33 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8EB0A58061;
	Fri, 16 Feb 2024 19:18:30 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4215158055;
	Fri, 16 Feb 2024 19:18:30 +0000 (GMT)
Received: from [9.61.14.18] (unknown [9.61.14.18])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Feb 2024 19:18:30 +0000 (GMT)
Message-ID: <18f09f37-8a95-4166-9a2c-5ab094589781@linux.ibm.com>
Date: Fri, 16 Feb 2024 13:18:30 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/33] fsi: aspeed: Add AST2700 support
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        andi.shyti@kernel.org, alistair@popple.id.au, joel@jms.id.au,
        jk@ozlabs.org, sboyd@kernel.org, mturquette@baylibre.com,
        robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
References: <20240215220759.976998-1-eajames@linux.ibm.com>
 <20240215220759.976998-11-eajames@linux.ibm.com>
 <3600c556-ccb3-40a8-9c53-a718a97468ae@linaro.org>
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <3600c556-ccb3-40a8-9c53-a718a97468ae@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lN1N6RTLy6D58WBsPeYXE0nRw7yPH5_I
X-Proofpoint-ORIG-GUID: lN1N6RTLy6D58WBsPeYXE0nRw7yPH5_I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-16_18,2024-02-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402160150


On 2/16/24 02:09, Krzysztof Kozlowski wrote:
> On 15/02/2024 23:07, Eddie James wrote:
>> AST2700 requires a few bits set differently in the OPB retry
>> counter register, so add some match data and set the register
>> accordingly.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   drivers/fsi/fsi-master-aspeed.c | 28 +++++++++++++++++++++++++---
>
>> +
>>   static const struct of_device_id fsi_master_aspeed_match[] = {
>> -	{ .compatible = "aspeed,ast2600-fsi-master" },
>> +	{
>> +		.compatible = "aspeed,ast2600-fsi-master",
>> +		.data = &fsi_master_ast2600_data,
>> +	},
>> +	{
>> +		.compatible = "aspeed,ast2700-fsi-master",
> Undocumented. Really, you do not have checkpatch in IBM?
>
> Please run scripts/checkpatch.pl and fix reported warnings. Some
> warnings can be ignored, but the code here looks like it needs a fix.
> Feel free to get in touch if the warning is not clear.


I ran checkpatch. There are several FSI drivers with undocumented 
compatible strings, and the Aspeed master documentation isn't in yaml 
format, so that would require an update too. Therefore I ignored the 
warning - my mistake. I will document it in v2.


>
>
> Best regards,
> Krzysztof
>

