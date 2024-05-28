Return-Path: <linux-i2c+bounces-3695-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8281E8D2345
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2024 20:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B6951C22B06
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2024 18:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9CDC4C61B;
	Tue, 28 May 2024 18:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="erbA/PqX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED254175AB;
	Tue, 28 May 2024 18:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716920583; cv=none; b=iQ1opwFgniqP3ozEKHX+ny0xm0hQvYfPs9K0ChLkd2j7BjvDsqa5t8dC/BjjlxCZFx0Ngao8xmUdca81GTQPzocR70q1oJnOliubdNuvUWS+GMcctzvMKPDhWxA3ouAhAgdBxA9myX/a1Pb3iehailKhScnu/aZoNy8aOps48tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716920583; c=relaxed/simple;
	bh=QtUNxodfoUepzLMWfu0cElQDt+Ru0oc5fQ8DaPXi9gQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DzA9WdnpTFwNY91vQRaWe2TGvsZ2/GWiYPDNEKuUvPzrLX8+tgE7KUaVVBDRlvC6c4XTzJyGKSbnTPsg6+pu4eO44lmeVs9LNf9efDQ2fqIinS10/HfaoRF2WV+kYaaKhGeKi6yuZ8QGMmIZZwvi2yzFiNus7FHOGitteafTW/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=erbA/PqX; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hDGUpXuW9Jg+FqGgsoUFDxobgoSVzaRR+6S6ti9ZcBA=; b=erbA/PqXxYvPjxGKphfKhIrXAe
	CEuEZt6fPkSMvmQpujGJKQBoBjW7EUOFxsdtDqLTjmcdQQZCWXRYI3vdRng+EsArZgLCLcHXWlXKY
	w3Q2lKFSlDNQ3NjoLV0G6akHY16gDWEK3quH4io8zsPsGjWxO/0FpN79DLTY6E7tWitf3bnhwr9Ej
	eVNnY0AqzW6Io1eby05A7Wol926cqsWicQX2IIuplm+UaU5sy+ysX9FJ4vPmUAqfV3cbNIwnWVIZ3
	Z+LowyNdJmvNVrBYoWOov8RMYpmSi/6W1vbBrjwYr3/KUTMe7EPCY7G21dSF2aPqlq0uBme0Q/ilm
	XSedWBcA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49050)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sC1TJ-0005Ak-1Y;
	Tue, 28 May 2024 19:22:53 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sC1TK-0003SR-Rt; Tue, 28 May 2024 19:22:54 +0100
Date: Tue, 28 May 2024 19:22:54 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Andrew Lunn <andrew@lunn.ch>, Andi Shyti <andi.shyti@kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	linux-i2c@vger.kernel.org, Michal Simek <michal.simek@amd.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [BUG] SFP I2C timeout forces link down with PHY_ERROR
Message-ID: <ZlYg/hDhy6q/Olpr@shell.armlinux.org.uk>
References: <ec7907f1-cb5a-41ab-824c-aa0b02440ada@linux.dev>
 <ZlYUNCRroM0up0xk@shell.armlinux.org.uk>
 <90873b78-13ba-445e-890a-0b90a653721b@linux.dev>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90873b78-13ba-445e-890a-0b90a653721b@linux.dev>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, May 28, 2024 at 01:50:54PM -0400, Sean Anderson wrote:
> On 5/28/24 13:28, Russell King (Oracle) wrote:
> > First, note that phylib's policy is if it loses comms with the PHY,
> > then the link will be forced down. This is out of control of the SFP
> > or phylink code.
> > 
> > I've seen bugs with the I2C emulation on some modules resulting in
> > problems with various I2C controllers.
> > 
> > Sometimes the problem is due to a bad I2C level shifter. Some I2C
> > level shifter manufacturers will swear blind that their shifter
> > doesn't lock up, but strangely, one can prove with an osciloscope
> > that it _does_ lock up - and in a way that the only way to recover
> > was to possibly unplug the module or poewr cycle the platform.
> 
> Well, I haven't seen any case where the bus locks up. I've been able to
> recover just by doing
> 
> 	ip link set net0 down
> 	ip link set net0 up
> 
> which suggests that this is just a transient problem.
> 
> > My advice would be to investigate the hardware in the first instance.
> 
> I'll try to keep this in mind, but it's pretty infrequent and I probably
> won't be able to test anything until I can reproduce it better.
> 
> > On Tue, May 28, 2024 at 12:57:25PM -0400, Sean Anderson wrote:
> >> Hi,
> >> 
> >> I saw the following warning [1] twice when testing 1000Base-T SFP
> >> modules:
> >> 
> >> [ 1481.682501] cdns-i2c ff030000.i2c: timeout waiting on completion
> >> [ 1481.692010] Marvell 88E1111 i2c:sfp-ge3:16: Master/Slave resolution failed
> >> [ 1481.699910] ------------[ cut here ]------------
> >> [ 1481.705459] phy_check_link_status+0x0/0xe8: returned: -67
> >> [ 1481.711448] WARNING: CPU: 2 PID: 67 at drivers/net/phy/phy.c:1233 phy_state_machine+0xac/0x2ec
> >> <snip>
> >> [ 1481.904544] macb ff0c0000.ethernet net1: Link is Down
> >> 
> >> and a second time with some other errors too:
> >> 
> >> [   64.972751] cdns-i2c ff030000.i2c: xfer_size reg rollover. xfer aborted!
> >> [   64.979478] cdns-i2c ff030000.i2c: xfer_size reg rollover. xfer aborted!
> > 
> > I2C driver bug? From what I can see, this occurs when there is further
> > data to be read, and id->recv_count hits zero. The I2C controller is
> > entirely in control of how many bytes are transferred from the remote
> > device, and it should raise a NAK on the last byte before signalling a
> > STOP condition during a read.
> 
> Commit bbf967b223b3 ("i2c: cadence: Handle transfer_size rollover")
> makes it seem like a hardware error. E.g. Linux thinks we're done but
> the hardware thinks there's still more data. I've added Alex to CC;
> maybe he can comment.

See https://www.ti.com/lit/an/slva704/slva704.pdf figure 9 and the
text immediately above it. On a read, the controller is entirely
in control of how many bytes are transferred from the connected
device, and the controller has the responsibility to generate the
ACK after each byte read from the device _if_ it wants another
byte, or a NAK if it doesn't.

So, if the controller has been programmed to transfer e.g. 2 bytes,
but decides to ACK the 2nd byte and proceed to receive a 3rd byte,
that's nothing to do with the bus or the device, it's entirely down
to the controller being silly when it knows we only want 2 bytes.

> > Many drivers now do not check whether the PHY accesses they are
> > performing succeeded or not, and rely on the failure being permanent.
> 
> Well, this driver does, which is how the error gets propagated all the
> way up to phy_state_machine. 

While the Marvell driver is good (probably because phylib maintainers
look after it!), this isn't true of all drivers, and I don't think we
should add a kind of recovery to the core without sorting out the
other drivers first.

Maybe it needs to be something that PHY drivers opt into.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

