Return-Path: <linux-i2c+bounces-3691-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9C38D2277
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2024 19:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8AE31F24494
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2024 17:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0BC174EC0;
	Tue, 28 May 2024 17:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="vqz2m5Qj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BC21DA4C;
	Tue, 28 May 2024 17:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716917310; cv=none; b=W9Cmc5Y01lC2H6qiJKjs0VeBHQrCj0DURgS9Bkm71cyVrxDyEK06g28fSYqjyt2qi/2MvGHPJrc0sG4LzK0lKyvGnzLYAfqb6GOczzBDyQdCLVzn12OYeZZsuR7TG3ywCS/gA2G1X1sLDETMVYP9BKoE62HMKW64+c6AtbNl4EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716917310; c=relaxed/simple;
	bh=keLiBMxhiaQ84iw6aj4l2f4RxD/rNX/UUq7Sb/E08Q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qxNDWYoJO0HQvSofUfW63AHLfIGeeM1JCdIqwhGv1UItQn7EEJXK03IDfTaAZIO84SboCXqyaT8E1+ig//E2VK8wN/IebZQFd+tiIRuibxixs9PmI9M33qQjTDrXAYMDye1fGuWdolFff4NjGdGdSJ60+at258uqXEU8x7oE9LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=vqz2m5Qj; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=u1o6iJOkpHwS/LOclFozOycTaolR6RFkB/DiALrvffQ=; b=vqz2m5QjcFshj08py6ocf/DX7w
	YSPS4Mq8/FpLSvjqJE1qJR+qwxfTIMcdJYgAAyRbrKyaQIpJzpVyYBQISlQfQ5XQashHqZLf9YoyN
	RnbCtNNk/bcD1c89YlVN1EvJnnWqK4Epz5y3X/4OsMTnA/RVOjkMQZ1IC9l7TM5kdaWVaY6+5XCvx
	MS/7VGTPV7HLB6NBSYIqkVxxzHOgQPcSD97Q96i8COP7+SXzJzThqaxijkwWDtohCQCUmilQv/Z8H
	HACaoccR+NKzv80GB5g98DAJrXNbR9hZHCXuU+vpEWBwLAy1UUVp3RaoB6qo3hbLtLnYWmphC/owK
	rozAQ3MA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44962)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sC0cV-000583-2F;
	Tue, 28 May 2024 18:28:19 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sC0cW-0003Q7-8H; Tue, 28 May 2024 18:28:20 +0100
Date: Tue, 28 May 2024 18:28:20 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Andrew Lunn <andrew@lunn.ch>, Andi Shyti <andi.shyti@kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	linux-i2c@vger.kernel.org, Michal Simek <michal.simek@amd.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [BUG] SFP I2C timeout forces link down with PHY_ERROR
Message-ID: <ZlYUNCRroM0up0xk@shell.armlinux.org.uk>
References: <ec7907f1-cb5a-41ab-824c-aa0b02440ada@linux.dev>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec7907f1-cb5a-41ab-824c-aa0b02440ada@linux.dev>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

First, note that phylib's policy is if it loses comms with the PHY,
then the link will be forced down. This is out of control of the SFP
or phylink code.

I've seen bugs with the I2C emulation on some modules resulting in
problems with various I2C controllers.

Sometimes the problem is due to a bad I2C level shifter. Some I2C
level shifter manufacturers will swear blind that their shifter
doesn't lock up, but strangely, one can prove with an osciloscope
that it _does_ lock up - and in a way that the only way to recover
was to possibly unplug the module or poewr cycle the platform.

My advice would be to investigate the hardware in the first instance.

On Tue, May 28, 2024 at 12:57:25PM -0400, Sean Anderson wrote:
> Hi,
> 
> I saw the following warning [1] twice when testing 1000Base-T SFP
> modules:
> 
> [ 1481.682501] cdns-i2c ff030000.i2c: timeout waiting on completion
> [ 1481.692010] Marvell 88E1111 i2c:sfp-ge3:16: Master/Slave resolution failed
> [ 1481.699910] ------------[ cut here ]------------
> [ 1481.705459] phy_check_link_status+0x0/0xe8: returned: -67
> [ 1481.711448] WARNING: CPU: 2 PID: 67 at drivers/net/phy/phy.c:1233 phy_state_machine+0xac/0x2ec
> <snip>
> [ 1481.904544] macb ff0c0000.ethernet net1: Link is Down
> 
> and a second time with some other errors too:
> 
> [   64.972751] cdns-i2c ff030000.i2c: xfer_size reg rollover. xfer aborted!
> [   64.979478] cdns-i2c ff030000.i2c: xfer_size reg rollover. xfer aborted!

I2C driver bug? From what I can see, this occurs when there is further
data to be read, and id->recv_count hits zero. The I2C controller is
entirely in control of how many bytes are transferred from the remote
device, and it should raise a NAK on the last byte before signalling a
STOP condition during a read.

> I think some part of the stack should implement a retry mechanism, but
> I'm not sure which part. One idea could be to have mdio-i2c propagate
> negative errors instead of converting them to successful reads of
> 0xffff.

That would unfortunately break phylib's PHY probing.

> - Are I2C bus drivers supposed to be flaky like this? That is, are callers of
>   i2c_transfer expected to handle the occasional spurious error?

I2C transfers - to some extent - are supposed to have a number of
retries, but that's for the I2C device not responding to its address.
Otherwise, the bus is supposed to be reliable (there is no form of
error detection however - there's no CRCs or similar.)

The problem with merely retrying the transaction is a register read
from a PHY may have side-effects (such as the BMSR's LSTATUS bit
which is latched in link-fail state until the next read. Or a
register pointer could be incremented. So it's not simple to solve
at bus level.

> - Similarly, are MDIO bus drivers allowed to be flaky?

No.

I think the only realistic method would be for phylib to attempt to
reprogram the PHY, but that would need lots of changes to phylib.

Many drivers now do not check whether the PHY accesses they are
performing succeeded or not, and rely on the failure being permanent.

> Of course, the best option would be to fix cdns-i2c to not be buggy, but
> the hardware itself is buggy in at least one of the above cases so that
> may not be practical.

Well, I don't think there's much option. If I2C drivers are flakey maybe
its better to use GPIOs instead of the broken "inteligent" hardware.

Maybe Andrew has a different view however.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

