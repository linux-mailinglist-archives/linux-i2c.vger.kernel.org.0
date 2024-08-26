Return-Path: <linux-i2c+bounces-5789-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B01EB95EB2F
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 10:01:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 658C11F22CD4
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 08:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D73F613A3F0;
	Mon, 26 Aug 2024 07:53:22 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C0113E039
	for <linux-i2c@vger.kernel.org>; Mon, 26 Aug 2024 07:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724658802; cv=none; b=LojHgUGdymtK0xYxlVH7etEFhXw+NnKw5DQ1iUSTjlkh2t710MwiaZ2XMPmRe6UmVCCjvWNAs0KzUNRTywP147vxMblfhFD0kPP8dymHF+gBrpZeavrUozwr1s4VP4rcy1ul+w2edj3NWwqyTu2+PsHGJwvWai+DvGp1/kR4nkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724658802; c=relaxed/simple;
	bh=Pzeast/KuQTsUx/8UNRiLKWBfOfCRK1vLZpSERoh2pU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j9rg81WzEtXc0vAQXvkgedmKqUaeYn76eTDW9UE5FxQTgmBAtV4TigLazdCUm9aFsn+qXbUgzMKPfBwf0s76YBIfielD4iiMEJkaWFpEn6LpnT6iBEpotgOomIGF4YodLSMcQziG46wyyubW8a0Fmk/X8CQ9ZaGWXdMP3bPZTIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1siUVR-0006mO-Jk; Mon, 26 Aug 2024 09:51:17 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1siUVK-0038Ph-Cg; Mon, 26 Aug 2024 09:51:10 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1siUVK-006xmZ-0b;
	Mon, 26 Aug 2024 09:51:10 +0200
Date: Mon, 26 Aug 2024 09:51:10 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Russell King <linux@armlinux.org.uk>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>, Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	imx@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
	openbmc@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org,
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [PATCH 0/9] AT24 EEPROM MTD Support
Message-ID: <20240826075110.u3cxc6dootou72eq@pengutronix.de>
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
 <Zsi3s9XithGEROwX@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zsi3s9XithGEROwX@smile.fi.intel.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

Hi Andy,

On 24-08-23, Andy Shevchenko wrote:
> On Mon, Jul 01, 2024 at 03:53:39PM +0200, Marco Felsch wrote:
> > This series adds the intial support to handle EEPROMs via the MTD layer
> > as well. This allow the user-space to have separate paritions since
> > EEPROMs can become quite large nowadays.
> > 
> > With this patchset applied EEPROMs can be accessed via:
> >   - legacy 'eeprom' device
> >   - nvmem device
> >   - mtd device(s)
> > 
> > The patchset targets only the AT24 (I2C) EEPROMs since I have no access
> > to AT25 (SPI) EEPROMs nor to one of the other misc/eeprom/* devices.
> > 
> > Note: I'm not familiar with Kconfig symbol migration so I don't know if
> > the last patch is required at the moment. Please be notified that the
> > list of recipients is quite large due to the defconfig changes.
> 
> FWIW, I think that MTD is *not* the place for EEPROMs.
> 
> Yeah, we have the driver spread over the kernel for EEPROMs (mostly due to
> historical reasons and absence an umbrella subsystem for them), but it's not
> the reason to hack them into something which is not quite suitable.

Thank you for you input. There are two things to mention:
 1st) I send a RFC patch and asked for feedback and all I got was: looks
      okay, please send a proper patch [1] which I did.
 2nd) I don't see the hacky part in this patchset.

Anyway the customer doesn't need the nvmem-partitions anymore and
therefore this patchset can be seen as obsolote.

Regards,
  Marco

[1] https://lore.kernel.org/lkml/20231201144441.imk7rrjnv2dugo7p@pengutronix.de/T/#m1e0e5778448971b50a883f62bd95622f6422b9a2

> 
> If NVMEM needs to be updated and may cover these cases after all (and do not
> forget about *small* size EEPROMs that most likely appear on the devices with
> limited amount of resources!) in a reasonable size and performance, why not?
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
> 

