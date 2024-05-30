Return-Path: <linux-i2c+bounces-3714-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2E48D5050
	for <lists+linux-i2c@lfdr.de>; Thu, 30 May 2024 18:56:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB2341C22350
	for <lists+linux-i2c@lfdr.de>; Thu, 30 May 2024 16:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45BAF446D1;
	Thu, 30 May 2024 16:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="F6jDcoqx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374344437F
	for <linux-i2c@vger.kernel.org>; Thu, 30 May 2024 16:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717088187; cv=none; b=USZgkhODUB6mwjBXqqOQUd/vor/Y8rFsjK0/+8k1Wc/7u3/DOKHqb+8vgMYgYwcC1eC4kc9c1Azeh3gRLQ5iyH0v++vkRPd+yyocnBORy1bbmg/VjFsufWoM3v4R1EkPapO0B1PtwUFACS24ihVZp2KLTLRBA3c5mMIaYUtfZQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717088187; c=relaxed/simple;
	bh=Yg3EXj5RngxLqTEo9ge9vxA8ConxQueqEBmFRNHCpVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VA4FbKUHq1K1lMgMK2QvwQamHkb0KGMHzfFRRrgQBlKD/xYupami9FB4nQsVkNLtOB4RYq/aHkltNDKTqVqBX6rjA2xnI4BD1QzWDBc7AzVgYSHy1mUlT6w6+SkyeAdFTABY9EuwfcLsOqx+mklmwVWOGZaMlwbhV+VzZqv2Nys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=F6jDcoqx; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: andrew@lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1717088183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2ct3hM3Ww+WHMzbbEaPHOdhaeIFR0TgxFOCopIwLsWM=;
	b=F6jDcoqx6HAHd7R/e3fFvka+K1XKYaWdL46hXt0ONACvxsu8C54cjfGYUqAOmvFFs4zprd
	io5fsrew2rK0YFbM4Q4fThuW6oY8EtHQfqv2swgJGUMYPWlsVR1P1GiktNTuSUpZXjy/M9
	3+z9S53UpRvXVYZB1XIScdLDA9DSufQ=
X-Envelope-To: linux@armlinux.org.uk
X-Envelope-To: alex.williams@ni.com
X-Envelope-To: andi.shyti@kernel.org
X-Envelope-To: netdev@vger.kernel.org
X-Envelope-To: linux-i2c@vger.kernel.org
X-Envelope-To: michal.simek@amd.com
X-Envelope-To: hkallweit1@gmail.com
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: linux-kernel@vger.kernel.org
Message-ID: <93e8839d-e712-4708-a2ca-df81051b8360@linux.dev>
Date: Thu, 30 May 2024 12:56:18 -0400
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [BUG] SFP I2C timeout forces link down with PHY_ERROR
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Alex Williams <alex.williams@ni.com>, Andi Shyti <andi.shyti@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 linux-i2c@vger.kernel.org, Michal Simek <michal.simek@amd.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <ec7907f1-cb5a-41ab-824c-aa0b02440ada@linux.dev>
 <ZlYUNCRroM0up0xk@shell.armlinux.org.uk>
 <90873b78-13ba-445e-890a-0b90a653721b@linux.dev>
 <ebf93967-81d0-46bc-baf5-b20f9336cfa8@linux.dev>
 <1398a492-95aa-46d9-b52b-a374fd6e9e77@lunn.ch>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <1398a492-95aa-46d9-b52b-a374fd6e9e77@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/28/24 14:14, Andrew Lunn wrote:
> On Tue, May 28, 2024 at 01:52:56PM -0400, Sean Anderson wrote:
>> (forgot to CC Alex)
>> 
>> On 5/28/24 13:50, Sean Anderson wrote:
>> > On 5/28/24 13:28, Russell King (Oracle) wrote:
>> >> First, note that phylib's policy is if it loses comms with the PHY,
>> >> then the link will be forced down. This is out of control of the SFP
>> >> or phylink code.
>> >> 
>> >> I've seen bugs with the I2C emulation on some modules resulting in
>> >> problems with various I2C controllers.
>> >> 
>> >> Sometimes the problem is due to a bad I2C level shifter. Some I2C
>> >> level shifter manufacturers will swear blind that their shifter
>> >> doesn't lock up, but strangely, one can prove with an osciloscope
>> >> that it _does_ lock up - and in a way that the only way to recover
>> >> was to possibly unplug the module or poewr cycle the platform.
>> > 
>> > Well, I haven't seen any case where the bus locks up. I've been able to
>> > recover just by doing
>> > 
>> > 	ip link set net0 down
>> > 	ip link set net0 up
>> > 
>> > which suggests that this is just a transient problem.
> 
> If you look back over the history, i don't think you will find any
> reports to transient problems with real MDIO busses. Hence any error
> is considered fatal. Also, when you consider the design of MDIO, it is
> actually very hard for an error to be detected. It is basically a
> shift register, shifting out 64 bits for a write, or 48 bits for a
> read, followed by receiving 16 bits for a read. There is no protocol
> to indicate any sort of error. If there is no device at the address,
> the pullup means you receive 1s. End of story.

Yes, I would expect the only time there could be transient problems
would be with external MII (such as if someone jiggled the phy).

> With MDIO over I2C, it is I2C which has problems, not MDIO. Do you
> expect transient problems with I2C?

Well, I2C is known to have devices which can get stuck and hang the bus
(generally requiring some bit-banging from Linux to get things unstuck,
or a reset of the device). So while I2C (like MDIO) is supposed to be
completely reliable, there is a history of it being not quite perfect.

That said, I did not expect to see these kinds of errors at all. I'll
have a closer look at the controller driver when I have the time. Maybe
there is some errata for this...

> I would also point out that MDIO is not idempotent. Reading an
> interrupt status register often clears it. Reading the link status
> clears the latched link status. If you need to retry the read of the
> interrupt status register, you cannot, the interrupt has been cleared,
> you have lost it, and probably your hardware no longer works because
> you don't know what interrupt to handle.... If you need to re-read the
> link status, you have lost the latched version, and you have missed a
> up or down event.

Yes. Same thing with I2C.

>> >> My advice would be to investigate the hardware in the first instance.
> 
> I agree with Russell. Figure out why I2C is flaky. Since this is an
> SFP it maybe something as trivial as the contacts need cleaning. Or
> the resistors are wrong, or you have a cheap module which is out of
> spec.

OK, I'll try to dig into this a little more...

--Sean

