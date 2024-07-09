Return-Path: <linux-i2c+bounces-4788-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B1992B3A7
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 11:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98869B2247C
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 09:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B10C2155359;
	Tue,  9 Jul 2024 09:24:29 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713B9155322
	for <linux-i2c@vger.kernel.org>; Tue,  9 Jul 2024 09:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720517069; cv=none; b=msII0JcidN+BQRsbFRjFKZvCAXezYsTJ9enY4+Xjq4FtOC1Jhu/FbYjcxR1nMoTz2TywhQPlm/bww0hGK4rf68R7x67k9DbhGyjPo1USCxdhlIAsMWW5cjpmby8ZVCjyIHvON9sVpoPUoz5K8bqmz1APTqC673Bpn6kcjZ8v/jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720517069; c=relaxed/simple;
	bh=hPWdIQzrDIKsdWWedF3zVBgednRjpKR88jLhX5flbm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aMHhC11thv/kHRVsDajX/6crlyrvRhzHUlSlosHS+h6U2MUWRY1VtU8eZ3w4Co/b1D1AfdJX21pdObuHk5FAIB/b72fV8ZgZzy9RoIBGOhprErEa2EwbE6upyiQxzSXRglYpi+RSsJDJ8eKgN3i9A1ayRCnQyWUn0LTwfCMUoJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1sR73F-0004Yx-KQ; Tue, 09 Jul 2024 11:22:21 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1sR739-008FMs-2o; Tue, 09 Jul 2024 11:22:15 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1sR738-006U3J-31;
	Tue, 09 Jul 2024 11:22:14 +0200
Date: Tue, 9 Jul 2024 11:22:14 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
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
Subject: Re: [PATCH 4/9] mtd: devices: add AT24 eeprom support
Message-ID: <20240709092214.omr7ccphdzdk7z7j@pengutronix.de>
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
 <20240701-b4-v6-10-topic-usbc-tcpci-v1-4-3fd5f4a193cc@pengutronix.de>
 <07b701a9-7b52-45b7-8dba-1c25d77cbf15@linaro.org>
 <mafs0ikxnykpr.fsf@kernel.org>
 <20240702-congenial-vigilant-boar-aeae44@houat>
 <mafs0ed8byj5z.fsf@kernel.org>
 <20240702-mighty-brilliant-eel-b0d9fa@houat>
 <20240708084440.70186564@xps-13>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240708084440.70186564@xps-13>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

Hi Miquel,

On 24-07-08, Miquel Raynal wrote:
> Hi,
> 
> > > >> >> Port the current misc/eeprom/at24.c driver to the MTD framework since
> > > >> >> EEPROMs are memory-technology devices and the framework already supports  
> > > >> >
> > > >> > I was under the impression that MTD devices are tightly coupled by erase
> > > >> > blocks. But then we see MTD_NO_ERASE, so what are MTD devices after all?  
> > > >> 
> > > >> I was curious as well so I did some digging.
> > > >>   
> > > [...]  
> > > >> 
> > > >> I also found a thread from 2013 by Maxime Ripard (+Cc) suggesting adding
> > > >> EEPROMs to MTD [1]. The main purpose would have been unifying the EEPROM
> > > >> drivers under a single interface. I am not sure what came of it though,
> > > >> since I can't find any patches that followed up with the proposal.  
> > > >
> > > > That discussion led to drivers/nvmem after I started to work on
> > > > some early prototype, and Srinivas took over that work.  
> > > 
> > > So would you say it is better for EEPROM drivers to use nvmem instead of
> > > moving under MTD?  
> > 
> > I thought so at the time, but that was more than 10y ago, and I have
> > followed neither nvmem nor MTD since so I don't really have an opinion
> > there.
> > 
> > It looks like drivers/misc/eeprom/at24.c has support for nvmem though,
> > and MTD can be used as an nvmem provider too, so it's not clear to me
> > why we would want to create yet another variant.
> > 
> > But again, you shouldn't really ask me in the first place :)
> > 
> > I'm sure Miquel, Srinivas, and surely others, are much more relevant to
> > answer that question.
> 
> More relevant, I doubt, but just a feeling: EEPROMs have their own
> subsystem now, NVMEM, which, as Maxime said, was initially written for
> that very specific case. EEPROMs don't have the complexity of MTD
> devices, and thus pulling the whole MTD subsystem just for getting
> partitions seems counter intuitive to me. You can definitely "split"
> EEPROM devices with NVMEM as well anyway.

I asked for feedback on my RFC [1] and all I got was to merge both
drivers into one and make the driver backward compatible, which I did by
this commit.

> Overall I think the idea of getting rid of these misc/ drivers is goes
> into the right direction, but registering directly into NVMEM makes
> more sense IMO.

So you propose to have two places for the partition handling (one for
MTD and one for NVMEM) instead of one and moving the code into NVMEM
directly? That doesn't sound right to me either. Also I don't get the
point why EEPROMs can't be handled by the MTD layer? The layer already
supports devices of type MTD_RAM which are very simple and don't require
an erase-op at least I don't see one.

[1] https://lore.kernel.org/all/20231127164623.1008176-1-m.felsch@pengutronix.de

Regards,
  Marco

> 
> Thanks,
> Miquèl
> 

