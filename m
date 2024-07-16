Return-Path: <linux-i2c+bounces-4992-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEA093220F
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jul 2024 10:41:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D3771F229BE
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jul 2024 08:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C11C17CA12;
	Tue, 16 Jul 2024 08:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EA8xoWTa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DD83FB3B;
	Tue, 16 Jul 2024 08:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721119301; cv=none; b=AzXpM2xA15HhczdBG0v7XpSWxBW0IC4FhuV903OK4KYwdoRqMDfezphJxI7zXX1KXS6J60WELUy4YVWXNMwz/zs7KrWeokri5eJTUx8ITqvyPxxAr64gnPrGckrITTTLmIggxDSckDrkit6oR4Ddqy0LurgNWlKUQR9Y0xr3fPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721119301; c=relaxed/simple;
	bh=X2Vmpaj1hwRSUxeFnpBPPzC1TGzyNQj3dbWVZEBD+N0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=K//yW9XPiQ4VIvttWM/o4FjItpkcLvEQqvvQJ8Q8JKo/iz9JIEc2x9lNwhWLKZqU5VBTFGFqe9g+6UadbHWksZJB04qQ9Nw5Oqi/mGix1YqtQHMIDw7V1ho0qgSa3lu3VWop8jg9uBLBA+ppmfzuKu67ikK6qctdbqSQUfeJq5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EA8xoWTa; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DA82DFF80E;
	Tue, 16 Jul 2024 08:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1721119297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NVFwYmkmnMuFh1duNjnqqyNHAVeoWsWgyzrMNx8tuQs=;
	b=EA8xoWTaubBl0p6x7L70jTDoDusA5aizDEtPavq4n+aScpo5g6K+Sc4MSo0u/a4FrxKRj/
	0N60JRd6yBrq8lgafcxHbYmdW7nDKhC4WPKz6r4ddHSLtEFBNhZCcSdzP4WJoplurLe0x6
	ncjyjvC80eG+9JJwwHYD2w4xlHgFt4y8qq258OH6uelrsPMPM9lAzwDIya7Y3/BN+gOT6C
	i++zL8U08yFjgat2tf05rAU4jbeSLR0OPybqDtr8FWkDLy5mD5QIrJyLd56yOlzQg2lG5I
	Zw64EEKMvMdUZIaNpWsEAx5jMwdOsrftohuKF9hELkQP/Hya2sT+IqoAC5DnHw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 32/60] i2c: mv64xxx: reword according to newest
 specification
In-Reply-To: <6lnet5zr6giafoanwmqpcvkf5yzeyobvx4tnxz5pp5bnrmo6gx@csglsnqjmfrk>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-33-wsa+renesas@sang-engineering.com>
 <6lnet5zr6giafoanwmqpcvkf5yzeyobvx4tnxz5pp5bnrmo6gx@csglsnqjmfrk>
Date: Tue, 16 Jul 2024 10:41:36 +0200
Message-ID: <87h6cploe7.fsf@BLaptop.bootlin.com>
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
>>  };
>
> OK, I managed to check and I couldn't find any definition about
> the driver's state.

I apologize for responding late to your previous request.

Out of curiosity, how did you manage to check it? Was it by referring to
the Marvell datasheet pointed in the Documentation, or did you use
another method?

Gregory


>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
>
> Thanks,
> Andi

