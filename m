Return-Path: <linux-i2c+bounces-4991-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5329321FB
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jul 2024 10:38:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4888F28288A
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jul 2024 08:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1423E1957FF;
	Tue, 16 Jul 2024 08:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="d6MrZMB0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB5A17D374;
	Tue, 16 Jul 2024 08:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721119096; cv=none; b=EY4JxjsnTkzisFt7EDytBcrtJh6d5cfGg634YzAD7us3DalCt/mncb8/jV+ZdVsOP4wBdZJm7WBg0zl/H2AtI2zFsJruF3pBaqjbjrn/uZOS93esRguCJ7tcdfVsZMTl+GOWZDmJ4ahZF6eULBDjULG0LigmTMYehfJ87f+AUWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721119096; c=relaxed/simple;
	bh=kLkxbEQ8rcp810JgiclHx77meFSj7deUNe7AbKpUkgk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GQQcaq7KvgNdCNYYwVOs4J+K/RN7zj5pBy9WVXTMGik5tdaQ99tqVf7P2EDm7jgVt+kjJJy/lMr+w/qAbImxogUT3KcBIc8RdjhEOxHikvDLGKURY2/KCCKsrqIQLthWnQQ7O3FS1cAtDgCyiKhX0swFm6fjkNPvCOF3SPOB3Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=d6MrZMB0; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A0AE20003;
	Tue, 16 Jul 2024 08:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1721119086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SspXBYAHn0Mt+j3mzoGZT3k3RQ+l8DtN/ofReuN5uAg=;
	b=d6MrZMB0adWxDNKaLHM5BMTFpwMxT+KtNmz6NLhr4MoyQc4+moVqXbg1h7I28Rd2P1bYOI
	r+4MGovR8WT29mXvox4EushF6x1t6KnDckwBmEYDlkkA8kLMt72++B3jL0NdFYTws6+uUv
	CniG1EAfepTcDozRHjTMqpuaQxkZJvg+9eteSNtDm6D+kOP8AvKO43NElhL5BeUKn7cqg6
	LPy+X6RsNc6DvYqpSrCfyfIPxtQbthrpR6r6LSIwmF0Z8oks71CyBQUF85xW64t4TKJs8/
	uAF8ghWzqqse0ktsx3OB34bXHJPPU20o0J4cUAeL+bhCyeXHxADZKwqV9/QBIg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Jean Delvare
 <jdelvare@suse.com>
Subject: Re: [PATCH v2 32/60] i2c: mv64xxx: reword according to newest
 specification
In-Reply-To: <7szxutsq35uaydvbo6bzrpsvnx765de7ps3kpvzs3b4ubczq6x@weaxji5u2p7c>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-33-wsa+renesas@sang-engineering.com>
 <7szxutsq35uaydvbo6bzrpsvnx765de7ps3kpvzs3b4ubczq6x@weaxji5u2p7c>
Date: Tue, 16 Jul 2024 10:38:06 +0200
Message-ID: <87jzhllok1.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-Sasl: gregory.clement@bootlin.com

Hello Andi,

> Hi Wolfram,
>
> On Sat, Jul 06, 2024 at 01:20:32PM GMT, Wolfram Sang wrote:
>> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
>> specifications and replace "master/slave" with more appropriate terms.
>> 
>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> ---
>>  drivers/i2c/busses/i2c-mv64xxx.c | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>> 
>> diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
>> index dc160cbc3155..29f94efedf60 100644
>> --- a/drivers/i2c/busses/i2c-mv64xxx.c
>> +++ b/drivers/i2c/busses/i2c-mv64xxx.c
>> @@ -89,8 +89,8 @@ enum {
>>  	MV64XXX_I2C_STATE_WAITING_FOR_RESTART,
>>  	MV64XXX_I2C_STATE_WAITING_FOR_ADDR_1_ACK,
>>  	MV64XXX_I2C_STATE_WAITING_FOR_ADDR_2_ACK,
>> -	MV64XXX_I2C_STATE_WAITING_FOR_SLAVE_ACK,
>> -	MV64XXX_I2C_STATE_WAITING_FOR_SLAVE_DATA,
>> +	MV64XXX_I2C_STATE_WAITING_FOR_TARGET_ACK,
>> +	MV64XXX_I2C_STATE_WAITING_FOR_TARGET_DATA,
>
> I searched online for the datasheet but couldn't find it. It
> would be helpful to know if the SLAVE naming comes from the
> datasheet or if it is arbitrary.
>
> If it originates from the hardware specifications, I suggest
> keeping the term "SLAVE."
>
> If anyone can share the datasheet, I would be happy to review it
> myself.

I think you can find the information in any Marvell datasheet that is
referenced in Documentation/arch/arm/marvell.rst.
>
> Jean and Gregory, could you please check and provide your ack
> here?

I checked with the Armada 370 datasheet, and those states are not
explicitly referred to as "SLAVE." See section 25 for more details.

So, I think there is no problem with switching to "TARGET."

Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks,

Gregory


>
> Thanks,
> Andi

