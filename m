Return-Path: <linux-i2c+bounces-2980-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B39BB8A72D3
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 20:09:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3F9C1C21871
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 18:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0635134429;
	Tue, 16 Apr 2024 18:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="lJVGnBEw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F25A132C1F;
	Tue, 16 Apr 2024 18:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713290969; cv=none; b=W00b2tOijeKEUUYAEju4khSb3ZC2jHg4T97VU+kRaUCiognwDmuIroHyeweG0NRbLzoqhl/+8DLohZinCX9UjV7Osq/85fhHMIjfyEBOwnSUr8xeu12kijTSSDFyyP1h6Y1HiYxFD6bNBxirdBCR0Amq7BLHAHkqFaB2+P8uNv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713290969; c=relaxed/simple;
	bh=QBJT0fvjo/sByvVdqWhfu7C0uSPTcABMfRn0BIp6lpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cmglIK26F0UOUbhbfnlhiHgvDnENWNMLX3XHlG2l4pgocA4oDKuxjUS4a3AbaL3sbydaaulXgXXO9Lt9K1f4BS0PIyy1VVE3i2nClPCpl7JncC8NsPk4+yiuda7nmeNDSMushq1kLKCQeEMFWthEe/G1ERcUZtIG6cc0AcX2WM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=lJVGnBEw; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43GI5beo022066;
	Tue, 16 Apr 2024 18:09:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=jfBrONQQ7jEqgKW5KCcnvgp1KEoPk8Do22dELHBXnrQ=;
 b=lJVGnBEwDgreOF3Ue6jX6Ov4xleZ8XKnqDGGvotfYVgKjraJtjPtvEkUPmlDCaPrvhxC
 n83sDnZFDxzCG7B4yBdG+DzpSl3dEkDAOFnftgauf9Pe757FUYGHxTjNa43UhC7/r4H1
 6ymg9CejrR7HC2vxaQ1TE5aXEC+A58tOxI6OGFk/B8bMFfwhB26o5vms5TQ9WBwnZDX6
 +9t4Gv4ERZE6Dpo6nuPI1/YjsuJCXmLf8Y1WNW8VTqX8GZPB+gd7l1aqaZxQt/ydW42X
 65E+aOSPkF7B/4QdP+nK0ScSdgVqIaKB9+MLHjJdye21yJglgebflEha/2JKU4P7Osti qw== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xhwrr032h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Apr 2024 18:09:08 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43GG05Xg015835;
	Tue, 16 Apr 2024 18:09:07 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xg5vm7kt8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Apr 2024 18:09:07 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43GI957s22807200
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Apr 2024 18:09:07 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2DCCA5805E;
	Tue, 16 Apr 2024 18:09:05 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E38135805A;
	Tue, 16 Apr 2024 18:09:04 +0000 (GMT)
Received: from [9.61.157.174] (unknown [9.61.157.174])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 16 Apr 2024 18:09:04 +0000 (GMT)
Message-ID: <2474f02c-c835-4691-b531-62c8c747aede@linux.ibm.com>
Date: Tue, 16 Apr 2024 13:09:04 -0500
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 25/31] i2c: fsi: Calculate clock divider from local bus
 frequency
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-fsi@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        alistair@popple.id.au, joel@jms.id.au, jk@ozlabs.org, robh@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        lakshmiy@us.ibmcom
References: <20240226165321.91976-1-eajames@linux.ibm.com>
 <20240226165321.91976-26-eajames@linux.ibm.com>
 <q6bl7sbskt4ukd3mylfgwpo6dmv444umdpycs6xp7ozd2kv335@syeymu62fczb>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <q6bl7sbskt4ukd3mylfgwpo6dmv444umdpycs6xp7ozd2kv335@syeymu62fczb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QRXN4cZro-l8ZSyMN11WgV7XKQPY7orO
X-Proofpoint-ORIG-GUID: QRXN4cZro-l8ZSyMN11WgV7XKQPY7orO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-16_16,2024-04-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1011 suspectscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2404010000 definitions=main-2404160113


On 4/15/24 17:11, Andi Shyti wrote:
> Hi Eddie,
>
>> @@ -689,6 +692,20 @@ static int fsi_i2c_probe(struct device *dev)
>>   	mutex_init(&i2c->lock);
>>   	i2c->fsi = to_fsi_dev(dev);
>>   	INIT_LIST_HEAD(&i2c->ports);
>> +	i2c->clock_div = I2C_DEFAULT_CLK_DIV;
>> +
>> +	lbus = fsi_device_local_bus_frequency(i2c->fsi);
>> +	if (lbus) {
>> +		u32 clock = I2C_DEFAULT_CLK_RATE;
> I don't see the need for initialization.


Does device_property_read_u32 set clock if the property isn't found? If 
not, it needs to be initialized here. Or I can set it in an else 
statement from device_property_read_u32.


>
>> +
>> +		if (!device_property_read_u32(dev, "clock-frequency", &clock)) {
>> +			if (!clock)
>> +				clock = I2C_DEFAULT_CLK_RATE;
>> +		}
> no need for brackets.


Perhaps not, but checkpatch didn't complain, and I personally like 
brackets if multiple lines are included.


>
>> +
>> +		// i2c clock rate = local bus clock / (4 * (i2c clock div + 1))
> You forgot to remove this.


I actually meant to leave that comment to explain how the clock rate is 
calculated, as the reverse calculation in the code is a little more 
confusing.


>
> Andi
>
>> +		i2c->clock_div = (((lbus + (clock - 1)) / clock) / 4) - 1;
>> +	}
>>   
>>   	rc = fsi_i2c_dev_init(i2c);
>>   	if (rc)
>> -- 
>> 2.39.3
>>

