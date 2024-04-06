Return-Path: <linux-i2c+bounces-2800-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E40E89ABBF
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Apr 2024 17:46:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC35B2824A9
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Apr 2024 15:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C8583A1D7;
	Sat,  6 Apr 2024 15:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="AMESbWRy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OeXPMJ52"
X-Original-To: linux-i2c@vger.kernel.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348302943F;
	Sat,  6 Apr 2024 15:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712418384; cv=none; b=PdQ+XqQP0A7EfIQcNhIIKraFMIrPQ9mHYCf/sXxpLimKIb+2W4XHS+N38HaudC7n3BJUmGoikGYmDUM7CjGM5OVwKmpRzYDeCxP5sUo/LejM+gxqys+M7i/yE3MU2mG3t4WPCSOTKteZ5YGvel3kIPC42l0xkmYElB2oZ/GGNpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712418384; c=relaxed/simple;
	bh=11DqWCvdg355TN04/G/aUNK5DKEHBpGSkEub1LzX6i0=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=SjYqsepfskqpSntWfmdZulYxB/juyQb1pIrwKVsbe9n/apbK974ReMxkhH0T8NxP/bJ96cu8QcZsbXejEWNBJcAa6RN7EpYiWGuOyjtBU642Q+tlo2IsuBkhGhfD446YzZPZ0q5zFe0nRpZci0dk31eQsX9YVWRnp44Z2m10juw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=AMESbWRy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OeXPMJ52; arc=none smtp.client-ip=64.147.123.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 1B4C53200A39;
	Sat,  6 Apr 2024 11:46:20 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Sat, 06 Apr 2024 11:46:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1712418379; x=1712504779; bh=FETbncQY+y
	B77+U1F+rJJ7C1eUsXsfesmzviZlUCP8I=; b=AMESbWRyV+2vZKgiwi/dN87iL0
	BDzX68Fqfw8x7EC5/3adOtsJrMICgxWVUa0dM0sKHXI0z7tR8xMhPXG7NYJyb4Yc
	7IIhNkjCLii/7SHnhE+cUTUd22NZVw9N2dF1uad+AhCKrj7U9VP71y3sNBg7C69i
	DBzLvj1HHuXVZdPMgVAWDQKfDpnEGnaV9X0Sr/IP6afKvB+yjrQBoiQu/KdPyxs4
	JVa47gNvm9jiNgxCRvuIUmiAMInRZ2julz4lCh+Ddva5rVfeeyxGVeWiaeaVsCgN
	PDAlQ6SlBiFEOFzbEyFAl8uAqe1V84qogQZzg5H2Egjne7W8aEOVMUR7MILQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1712418379; x=1712504779; bh=FETbncQY+yB77+U1F+rJJ7C1eUsX
	sfesmzviZlUCP8I=; b=OeXPMJ52Yv/cSjBtXGCTYUp/Kn1/UTWP6qbHZWDT7ySB
	2djAcNhJ+J4fBhes136QmODeEsvkRKAERVprIqphbGJfAksce85xzZfnjWb1o9BM
	MDPEqzcxh9kHCs+JHC5SpAL4KVzOWM3qz8VYS/IA4XKqqzhx9B12XAtweO6/B0rE
	1gzEWWPdb8DcycX5IXweoFTmxJTsAde2Y2z2qJxIZbd3UEiJ0uyw0239BkiiJ0my
	qHnLfQotZkllCALU8hsjqMkff0t0YU8VsJUx1p25j4Eup0q27rNIvYEWknO+ui1s
	dkWxYt40tkGuyi3yVDsudX+KvnXMNcK5YsJA0+JQAA==
X-ME-Sender: <xms:Sm4RZsuRdqK6j5r2iYk9xXUEQ4IX-feQqdzWVM1iSQYMEA-7XJ8kxw>
    <xme:Sm4RZpeRkmxQU0MQp4Flyn9IkhpLepG4f2kQMnwz5BjZzD6q97EQzILpyhC5uyP5p
    7CtfLJHqwbYfXrSo3c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudegvddgleegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:Sm4RZnz_yQkFOvNm5IzFh1jcsWM6QfNTBhkedBRE1oHvg-P7LqmNKw>
    <xmx:Sm4RZvObvvmMW_fGfFJNuxV_9soP9HpvQIHGQpf3kFtsYJTtj7SnzQ>
    <xmx:Sm4RZs98jFBfOjy_73zmRjhhZzjZ2iThf2FwPRXo9sftMtEaxKlujQ>
    <xmx:Sm4RZnW6rZUHDwTKxTu-eKvoGy11xH0bJbtyrS12HpbB2r2p222B4w>
    <xmx:S24RZnWX-tLos1Htwp3tVpNcSZL7qVKrXTYDDZd2JTd-U3eZABsBAQM4hS7O>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 510DCB6008D; Sat,  6 Apr 2024 11:46:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-333-gbfea15422e-fm-20240327.001-gbfea1542
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <cea58361-16bd-4daf-85eb-4d63d47cb46f@app.fastmail.com>
In-Reply-To: <e2d0fdde-ff8b-4851-b18a-89e69dd18d5f@roeck-us.net>
References: <20240405142823.615609-1-arnd@kernel.org>
 <e2d0fdde-ff8b-4851-b18a-89e69dd18d5f@roeck-us.net>
Date: Sat, 06 Apr 2024 17:45:57 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Guenter Roeck" <linux@roeck-us.net>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Andi Shyti" <andi.shyti@kernel.org>,
 "Wim Van Sebroeck" <wim@linux-watchdog.org>,
 "Heiner Kallweit" <hkallweit1@gmail.com>,
 "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
 "Jarkko Nikula" <jarkko.nikula@linux.intel.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Jean Delvare" <jdelvare@suse.de>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: add I2C_MUX dependency
Content-Type: text/plain

On Sat, Apr 6, 2024, at 15:08, Guenter Roeck wrote:
> On Fri, Apr 05, 2024 at 04:27:43PM +0200, Arnd Bergmann wrote:
>> 
>> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
>> index 1872f1995c77..2619018dd756 100644
>> --- a/drivers/i2c/busses/Kconfig
>> +++ b/drivers/i2c/busses/Kconfig
>> @@ -108,6 +108,7 @@ config I2C_HIX5HD2
>>  config I2C_I801
>>  	tristate "Intel 82801 (ICH/PCH)"
>>  	depends on PCI
>> +	depends on I2C_MUX || I2C_MUX_GPIO=n
>>  	select P2SB if X86
>>  	select CHECK_SIGNATURE if X86 && DMI
>>  	select I2C_SMBUS
>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>> index 0b0df3fe1efd..4dfb3773e6e2 100644
>> --- a/drivers/watchdog/Kconfig
>> +++ b/drivers/watchdog/Kconfig
>> @@ -1301,8 +1301,6 @@ config ITCO_WDT
>>  	select WATCHDOG_CORE
>>  	depends on I2C || I2C=n
>>  	depends on MFD_INTEL_PMC_BXT || !MFD_INTEL_PMC_BXT
>> -	select LPC_ICH if !EXPERT
>> -	select I2C_I801 if !EXPERT && I2C
>
> Sorry, I don't understand why LPC_ICH and I2C_I801 are neither a dependency
> nor need to be selected. What if both LPC_ICH=n and I2C_I801=n, or if one is
> selected but the other is needed to connect to the watchdog ?

The Kconfig dependencies are only required if there is a compile-time
dependencies. In this case, both LPC_ICH and I2C_I801 create a
platform device that is consumed by ITCO_WDT, but it could in
theory work with any other such driver providing the device.

It would be fine to make this explicit by adding
'depends on LPC_ICH || I2C_I801' to enforce that the watchdog
driver can only be selected on if at least one of these
is present, but we have a lot of examples where we don't
spell out this type of dependency.

The two 'select' statements in comparison a really bad idea
because a driver should never need to force-enable a user
visible symbol in another subsystem, and because no single
machine would actually require both the i810 and the ich driver.

   Arnd

