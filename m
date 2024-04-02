Return-Path: <linux-i2c+bounces-2721-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3358952B9
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 14:17:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 643E51F24968
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 12:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A946762DC;
	Tue,  2 Apr 2024 12:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WpmdsWL3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C64634EA;
	Tue,  2 Apr 2024 12:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712060241; cv=none; b=ZM7mTrDmSWXAMsykE8KZMf9xtl0ZZmc/x2EIfgPZUrPmek7Q2hQCL3RP3Z1WN5EfdBfzniSup58AX+FHD5nboY5hSBkar+SWNLeHPJ1OHJwQ19lfFcoXGd+hVhF72P7KxvYrDL45OrLykfKXIqbcQMiUXbGMwoENQzECjFa201E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712060241; c=relaxed/simple;
	bh=+PJl1XVFLkJu+n5tB+S3CJb6o62Vtp1lY3hBuuDSHnw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PaWFKUJ7MnXzMOCehdfePE+DoMwFMwz6Gcuy7cn19AeP5SXpaOAUg/eWpq/dA+cbatI9mrfzhnOQKggUG24UtRfYPpIbcxwFJ9cgRk9VrLhrssAIks43JmLkREXp9Edmpdu1NDAPfRVxNOhARGUfrdlN9cDLhTH3l1W/nW2Ey4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WpmdsWL3; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A94C01C0007;
	Tue,  2 Apr 2024 12:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712060231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hO0hGxLnoN3ueobt18N0TvoV+EUroS8WDZqsXk16514=;
	b=WpmdsWL3cfrFq4LiSA1QwbtYoo2QKGBVBJfxOOOMABP7CUfGmHJ+1D44xcKhETphd2l2Ks
	/wQ/GFxkO5M0/pKKD2fR6DF3V76iSpPEL1p2uysdxTzi2TN1pmo0N99jlcRZUc1a9HE8Rg
	PLB2LocxPOtjQgtnpeVceWvhp0BfPK/UF4mFsgbA6bTWhHUxWOL/RZKkQSydeVKJy6Vsbf
	qVUzjrbbfgRiTPnHBjqD7IhNop4mZBnJrEKs59oMJ04HUG+QjMIYldjol0xSVu+Bd/nXII
	1wvCdHiUp4qPyRMGL8Vfcvp4NtGOc8JGbzx5nEmWQGJ/x/NU7QyAcdw5KqWTdw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Andi Shyti <andi.shyti@kernel.org>, Sam Edwards <cfsworks@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND v2 RFC 0/5] Enhancements for mv64xxx I2C driver
In-Reply-To: <gj3bu52qixnf7agreb7olfwmsllr3k6mcybmyhiw76esxoevk7@nmfshpqp55l4>
References: <65fa7599.5d0a0220.fe5f7.1f9f@mx.google.com>
 <gj3bu52qixnf7agreb7olfwmsllr3k6mcybmyhiw76esxoevk7@nmfshpqp55l4>
Date: Tue, 02 Apr 2024 14:17:11 +0200
Message-ID: <87le5w7yd4.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-Sasl: gregory.clement@bootlin.com

Hello Andi and Sam,

> Hi Gregory,
>
> On Tue, Mar 19, 2024 at 06:44:56PM -0600, Sam Edwards wrote:
>> Salutations, Linux I2C team!
>
> ...
>
>> In anticipation of that, I am preparing this series comprising five patches to
>> improve the functionality and reliability of the I2C adapter enough to support
>> this kind of device. I have heavily tested these changes on the Allwinner-style
>> mv64xxx core, but not the Marvell-style, and have not been able to test 10-bit
>> addressing. I would greatly appreciate if anyone here could test this series,
>> especially on non-Allwinner boards and/or boards with 10-bit devices.
>> 
>> I'm a bit skeptical of using I2C_M_NOSTART for this purpose. The driver does
>> not (and cannot) support "just any" use of I2C_M_NOSTART, so it may be
>> inappropriate to claim the I2C_FUNC_NOSTART capability. On the other hand, I
>> searched high and low and couldn't find any use of I2C_M_NOSTART that
>> *wouldn't* be supported by this change, so this could very well be exactly what
>> clients understand I2C_FUNC_NOSTART to mean. Given that the alternative would
>> be inventing a new flag ("I2C_M_READEXTRA"?) and figuring out how to supply
>> input bytes and output bytes in the same i2c_msg, I opted for the NOSTART
>> route instead.
>
> any thought on this series? I believe here we might need a bit
> more testing on other platforms.

Sorry for the lack of answer. However I saw the series, I will have a
closer look on it and give you feednacks.

Regards,

Gregory

>
> Andi
>
>> 
>> I look forward to any feedback, bug reports, test results, questions, concerns,
>> commentary, or discussion that you can offer!
>> 
>> Best regards,
>> Sam
>> 
>> Sam Edwards (5):
>>   i2c: mv64xxx: Clear bus errors before transfer
>>   i2c: mv64xxx: Clean up the private data struct
>>   i2c: mv64xxx: Refactor FSM
>>   i2c: mv64xxx: Allow continuing after read
>>   i2c: mv64xxx: Implement I2C_FUNC_NOSTART

