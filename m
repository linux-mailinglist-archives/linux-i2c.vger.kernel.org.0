Return-Path: <linux-i2c+bounces-3693-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AD68D22D1
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2024 19:53:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C0817B221A3
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2024 17:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6517745020;
	Tue, 28 May 2024 17:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XH3ubCZ6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4D93E478
	for <linux-i2c@vger.kernel.org>; Tue, 28 May 2024 17:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716918784; cv=none; b=qUjQP0uGys2zL4WAFysX/1V2VV35hcR7ILS35OxOISYopMXK2Ivu+WrvAMZQ86ExNPv2vtkHUY4XeZXfa5W3gWysOyUrZ6oL3qrBty+T2bQwd6eX5+WTv8aTMDYBtH286NEBy+2LSeMxjEZTCTll2XHxqpMZeAHpXLp3GlvHa5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716918784; c=relaxed/simple;
	bh=eUdSdQ9cdw8tBxu4pJAWUaOjnZMDsr/CJl22+nf6t0Q=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZB7qaOw6qAH5BLqYhW9jJNdp0CK1iXB7Mur52g8HVwxvqUmAGC7p79QrRkK+rCO3nb8wODdACIxgCTZblXHiNmXhrxHOJ03453OeZYGWaNtnbWakCsO6cJ1FK4dSh/dfPJ1JCIas2zQo8xsGMI4PrYLkMQ5eqyWPW2+4E0zqH/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XH3ubCZ6; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux@armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1716918780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kIXY6m78aF06Wj1IhD21/vXPn+0spKIAiHBeBQ4dyJs=;
	b=XH3ubCZ6cSON2X8geqtFXGpyqBmynD9m+0Dh+zIa8PyLufNGeVszFN2fi/B1QGjyhyjkA4
	dunPHc15ZxPn4i+Hs4M1yoECffhVGEMGbijgYV7qIpJuned3ZVXdEGS4F85HlXkodi7/pU
	wHXJbKBhgMI40tG04o2qKNs3DSelm+E=
X-Envelope-To: alex.williams@ni.com
X-Envelope-To: andrew@lunn.ch
X-Envelope-To: andi.shyti@kernel.org
X-Envelope-To: netdev@vger.kernel.org
X-Envelope-To: linux-i2c@vger.kernel.org
X-Envelope-To: michal.simek@amd.com
X-Envelope-To: hkallweit1@gmail.com
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: linux-kernel@vger.kernel.org
Message-ID: <ebf93967-81d0-46bc-baf5-b20f9336cfa8@linux.dev>
Date: Tue, 28 May 2024 13:52:56 -0400
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [BUG] SFP I2C timeout forces link down with PHY_ERROR
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Alex Williams <alex.williams@ni.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Andi Shyti <andi.shyti@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 linux-i2c@vger.kernel.org, Michal Simek <michal.simek@amd.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <ec7907f1-cb5a-41ab-824c-aa0b02440ada@linux.dev>
 <ZlYUNCRroM0up0xk@shell.armlinux.org.uk>
 <90873b78-13ba-445e-890a-0b90a653721b@linux.dev>
Content-Language: en-US
In-Reply-To: <90873b78-13ba-445e-890a-0b90a653721b@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

(forgot to CC Alex)

On 5/28/24 13:50, Sean Anderson wrote:
> On 5/28/24 13:28, Russell King (Oracle) wrote:
>> First, note that phylib's policy is if it loses comms with the PHY,
>> then the link will be forced down. This is out of control of the SFP
>> or phylink code.
>> 
>> I've seen bugs with the I2C emulation on some modules resulting in
>> problems with various I2C controllers.
>> 
>> Sometimes the problem is due to a bad I2C level shifter. Some I2C
>> level shifter manufacturers will swear blind that their shifter
>> doesn't lock up, but strangely, one can prove with an osciloscope
>> that it _does_ lock up - and in a way that the only way to recover
>> was to possibly unplug the module or poewr cycle the platform.
> 
> Well, I haven't seen any case where the bus locks up. I've been able to
> recover just by doing
> 
> 	ip link set net0 down
> 	ip link set net0 up
> 
> which suggests that this is just a transient problem.
> 
>> My advice would be to investigate the hardware in the first instance.
> 
> I'll try to keep this in mind, but it's pretty infrequent and I probably
> won't be able to test anything until I can reproduce it better.
> 
>> On Tue, May 28, 2024 at 12:57:25PM -0400, Sean Anderson wrote:
>>> Hi,
>>> 
>>> I saw the following warning [1] twice when testing 1000Base-T SFP
>>> modules:
>>> 
>>> [ 1481.682501] cdns-i2c ff030000.i2c: timeout waiting on completion
>>> [ 1481.692010] Marvell 88E1111 i2c:sfp-ge3:16: Master/Slave resolution failed
>>> [ 1481.699910] ------------[ cut here ]------------
>>> [ 1481.705459] phy_check_link_status+0x0/0xe8: returned: -67
>>> [ 1481.711448] WARNING: CPU: 2 PID: 67 at drivers/net/phy/phy.c:1233 phy_state_machine+0xac/0x2ec
>>> <snip>
>>> [ 1481.904544] macb ff0c0000.ethernet net1: Link is Down
>>> 
>>> and a second time with some other errors too:
>>> 
>>> [   64.972751] cdns-i2c ff030000.i2c: xfer_size reg rollover. xfer aborted!
>>> [   64.979478] cdns-i2c ff030000.i2c: xfer_size reg rollover. xfer aborted!
>> 
>> I2C driver bug? From what I can see, this occurs when there is further
>> data to be read, and id->recv_count hits zero. The I2C controller is
>> entirely in control of how many bytes are transferred from the remote
>> device, and it should raise a NAK on the last byte before signalling a
>> STOP condition during a read.
> 
> Commit bbf967b223b3 ("i2c: cadence: Handle transfer_size rollover")
> makes it seem like a hardware error. E.g. Linux thinks we're done but
> the hardware thinks there's still more data. I've added Alex to CC;
> maybe he can comment.
> 
>>> I think some part of the stack should implement a retry mechanism, but
>>> I'm not sure which part. One idea could be to have mdio-i2c propagate
>>> negative errors instead of converting them to successful reads of
>>> 0xffff.
>> 
>> That would unfortunately break phylib's PHY probing.
>> 
>>> - Are I2C bus drivers supposed to be flaky like this? That is, are callers of
>>>   i2c_transfer expected to handle the occasional spurious error?
>> 
>> I2C transfers - to some extent - are supposed to have a number of
>> retries, but that's for the I2C device not responding to its address.
>> Otherwise, the bus is supposed to be reliable (there is no form of
>> error detection however - there's no CRCs or similar.)
>> 
>> The problem with merely retrying the transaction is a register read
>> from a PHY may have side-effects (such as the BMSR's LSTATUS bit
>> which is latched in link-fail state until the next read. Or a
>> register pointer could be incremented. So it's not simple to solve
>> at bus level.
> 
> OK...
> 
>>> - Similarly, are MDIO bus drivers allowed to be flaky?
>> 
>> No.
>> 
>> I think the only realistic method would be for phylib to attempt to
>> reprogram the PHY, but that would need lots of changes to phylib.
> 
> Would it? Maybe we just need something like
> 
> if (err == -ENOLINK) {
> 	phy_init_hw(phydev);
> 	needs_aneg = true;
> 	phydev->state = PHY_UP;
> 	err = 0;
> }
> 
> in the phy_state_machine switch statement under PHY_NOLINK and
> PHY_RUNNING. The phy_init_hw wouldn't even be necessary for this case
> (but would probably be a good idea in the general case where
> master/slave resolution fails).
> 
>> Many drivers now do not check whether the PHY accesses they are
>> performing succeeded or not, and rely on the failure being permanent.
> 
> Well, this driver does, which is how the error gets propagated all the
> way up to phy_state_machine. 
> 
>>> Of course, the best option would be to fix cdns-i2c to not be buggy, but
>>> the hardware itself is buggy in at least one of the above cases so that
>>> may not be practical.
>> 
>> Well, I don't think there's much option. If I2C drivers are flakey maybe
>> its better to use GPIOs instead of the broken "inteligent" hardware.
> 
> The CPU on this device is already underpowered, so I'd rather not resort
> to bitbanging.
> 
> --Sean


