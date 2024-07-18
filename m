Return-Path: <linux-i2c+bounces-5019-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EDA934ACE
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 11:20:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ECB28B21D80
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 09:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6CB824A1;
	Thu, 18 Jul 2024 09:20:19 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CBE7BAF4
	for <linux-i2c@vger.kernel.org>; Thu, 18 Jul 2024 09:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721294419; cv=none; b=J8kJgcuU0Kx9ikzdCnkec/idQGuPDef45G/KnrF9dNeyoWy18uv/x1+bqkEFjBg8SOsCWktCs1E3HSsXQqP6zSSztx3zvt0ZrIL4LjckjE05eUqM+uWChLQOYrGIvMVtYPYrKntZ2pTQp5216VDTKU9NquPVnMXxmHIzsxJY5mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721294419; c=relaxed/simple;
	bh=NVmocxKup4CnNxG4HHYvEU51kiKuUcSnBQFJoZmyjlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=le3NrQJDqQY5dgOLXib8+KR0H4Vfjseusyjs8r1sPcbReW2fBcn1UrY+4u/Vj53Ar/djUvyl+PQhspAaGblp8DfM4NwaCquWYvx7hIfsJZhvBFh/sQN4BhCGio2ys51lB3rMYWBgQ6J5Pc9cqY5wXVvmXlgCwMwh/VA0r2NBbd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1sUNGz-0002U5-TA; Thu, 18 Jul 2024 11:18:01 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1sUNGr-000PqF-MB; Thu, 18 Jul 2024 11:17:53 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1sUNGr-003zXS-1Y;
	Thu, 18 Jul 2024 11:17:53 +0200
Date: Thu, 18 Jul 2024 11:17:53 +0200
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
Message-ID: <20240718091753.apwsrvmekn2vvo4k@pengutronix.de>
References: <07b701a9-7b52-45b7-8dba-1c25d77cbf15@linaro.org>
 <mafs0ikxnykpr.fsf@kernel.org>
 <20240702-congenial-vigilant-boar-aeae44@houat>
 <mafs0ed8byj5z.fsf@kernel.org>
 <20240702-mighty-brilliant-eel-b0d9fa@houat>
 <20240708084440.70186564@xps-13>
 <20240709092214.omr7ccphdzdk7z7j@pengutronix.de>
 <20240709114302.3c604ef3@xps-13>
 <20240709103841.7x7n4hdtqrunyoc3@pengutronix.de>
 <20240717101948.2e99f472@xps-13>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240717101948.2e99f472@xps-13>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

Hi Miquel,

On 24-07-17, Miquel Raynal wrote:
> Hi Marco,
> 
> > > > > Overall I think the idea of getting rid of these misc/ drivers is goes
> > > > > into the right direction, but registering directly into NVMEM makes
> > > > > more sense IMO.    
> > > > 
> > > > So you propose to have two places for the partition handling (one for
> > > > MTD and one for NVMEM) instead of one and moving the code into NVMEM
> > > > directly?  
> > > 
> > > Why two places for the partitions handling? Just one, in NVMEM. Also  
> > 
> > Without checking the details I think that converting the MTD
> > partitioning code into NVMEM partitioning code is a bigger task. As you
> > said below there are many legacy code paths you need to consider so they
> > still work afterwards as well.
> > 
> > > usually EEPROMs don't require very advanced partitioning schemes,
> > > unlike flashes (which are the most common MTD devices today).  
> > 
> > As said in my cover letter EEPROMs can become quite large and MTD
> > supports partitioning storage devices which is very handy for large
> > EEPROMs as well.
> 
> Did you had a look at nvmem-layouts ? In particular the fixed-layout.

Yes I had a look at nvmem-layouts and we use them within a
mtd-partition. Using them instead of a mtd-partition is not sufficient
since they:
 1) don't support user-space write (I send a patch for it but it doesn't
    seem to be accepted soon).
 2) If write would be supported the user-space need to write the
    complete cell e.g. no partial writes.

> Is there anything you would like to achieve already that is not
> possible with nvmem but is with mtd?

Please see above.

Regards,
  Marco

