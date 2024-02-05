Return-Path: <linux-i2c+bounces-1632-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA42849472
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Feb 2024 08:24:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CCFA1F25DC7
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Feb 2024 07:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 209C2D26D;
	Mon,  5 Feb 2024 07:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="pWBcYNFV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E359611705;
	Mon,  5 Feb 2024 07:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707117736; cv=none; b=Uo3zq6rkfm5QkaSKy6wK/MdcYGW8lDkYJ72apFdGyKUyZgUmI5IpQlPBxwQtLRTB+CfCiPZ/kla/n7k7ZOo4PFMFLDyzk1WAsV+ZQ+HtyubGPrnUZv6s/u+8UEFTWj7BtK3cK4bV72DPcYkW539a659MYSuWVEN5NyunFn9+PHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707117736; c=relaxed/simple;
	bh=qu+yTx1OVLPWhDo9bCVpMACyMIuspoXRYqNKXMacw9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MA3ouY/ra1ANIgdJNjQpElQXYj6mCY3+CFWriYQigc94DtWRFsnoTY5vZh9+wsNpkdvcrbz/YHxy2PcAuRAli/N0OjnHxteizU6DlGrMkU7f8yoMG72cNI2TwLRRC/ZPd5+OH4ruAy+dRCDOyVLhM3Cz4HS6GmjDcOxOLREsFSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=pWBcYNFV; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 2686F60333;
	Mon,  5 Feb 2024 07:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1707117734;
	bh=qu+yTx1OVLPWhDo9bCVpMACyMIuspoXRYqNKXMacw9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pWBcYNFVtYgQoLozoCxXXdqjuXmY8SrOQpWPvvfQVI4NKfVju1lTbtitfA9kD6+pG
	 p2hqjQwgp1ebAl1mEiS5QverZrCmHNxdJP3U948Dn5dyLEWHGFNU+BpEmW6j+ybYoG
	 yxRRF/fb+DUeMVlUCL37H0DYmNk3a4g7ovSmt1g8DBoCdyyScJ0O/+whc0nTQSJU7Y
	 d90a9dLdOmsRoQqNlT3oRMX3I4m2hRx61KqX3PfKX6J4saK53FXn8OEyMMU4Q6N8vz
	 IB9x4MLQWCg3APB3ApqJg7e8593AoRphMOynPw6zlauK0pMR6Fdj50hlxPOPMyLbxk
	 l1hFnmvFjAN8A==
Date: Mon, 5 Feb 2024 09:21:11 +0200
From: Tony Lindgren <tony@atomide.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Peter Rosin <peda@axentia.se>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Tom Joseph <tjoseph@cadence.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-pci@vger.kernel.org, gregory.clement@bootlin.com,
	theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com,
	u-kumar1@ti.com
Subject: Re: [PATCH v2 02/15] pinctrl: pinctrl-single: move
 suspend()/resume() callbacks to noirq
Message-ID: <20240205072111.GD5185@atomide.com>
References: <20240102-j7200-pcie-s2r-v2-0-8e4f7d228ec2@bootlin.com>
 <20240102-j7200-pcie-s2r-v2-2-8e4f7d228ec2@bootlin.com>
 <CACRpkdYBnQ6xh2yNsnvquTOq5r7NeDhot6To9myfuNbonKcgzQ@mail.gmail.com>
 <6hyubhrho6xbki6yxtmqedylc2gpeyj4yu5gtrjrq4nsthcr7g@elfukmqeve2a>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6hyubhrho6xbki6yxtmqedylc2gpeyj4yu5gtrjrq4nsthcr7g@elfukmqeve2a>

* Andi Shyti <andi.shyti@kernel.org> [240129 22:49]:
> On Sat, Jan 27, 2024 at 11:31:11PM +0100, Linus Walleij wrote:
> > On Fri, Jan 26, 2024 at 3:37 PM Thomas Richard
> > <thomas.richard@bootlin.com> wrote:
> > 
> > > The goal is to extend the active period of pinctrl.
> > > Some devices may need active pinctrl after suspend() and/or before
> > > resume().
> > > So move suspend()/resume() to suspend_noirq()/resume_noirq() in order to
> > > have active pinctrl until suspend_noirq() (included), and from
> > > resume_noirq() (included).
> > >
> > > The deprecated API has been removed to use the new one (dev_pm_ops struct).
> > >
> > > Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> > 
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > 
> > Do you want to merge this as a series or is this something I
> > should just apply?
> 
> there is still a comment from me pending.

FYI I gave this a brief test and things seem to work fine for me. Sounds
like there will be another revision though so I'll test again then.

Regards,

Tony


