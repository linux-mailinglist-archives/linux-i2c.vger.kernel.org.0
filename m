Return-Path: <linux-i2c+bounces-12241-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2E2B208A9
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 14:21:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E5A217DCBE
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 12:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E33CE2D29D1;
	Mon, 11 Aug 2025 12:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Gpl0cloj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EB120297C;
	Mon, 11 Aug 2025 12:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754914899; cv=none; b=N7yIdtto8H7RttXuXZZG91RZQaPIHvmReq+0B5ywaIb1yw2c1vIEn45aSwWzQyeai2UXUQsxxGyJj16pPR5C+LEAmoikS25D5bIZCqNcjErSRx82Ei3G45NcoVNAYktPqMgjuVdHFQ9ys2JFqUx6cwl6bllG6KQ08mKTrEX4/Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754914899; c=relaxed/simple;
	bh=Ql1JCgnCHCe7QLdED93B26Cg21+RnnwnTV77huzWi0s=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qs5yb3LZ9T9r1boC0kmChmGGQgCnOnAYtFC4/872CQZE4MAiL3vP3sNNWHqVosQzV6q5oXKWultRfdNEUgN7ZmidAmoFvz0LQcOyhw8gkRDkdDaiCYKukmP06UCTnEq5bvtXODAzHrLAdWZxiDy44bmwhhGNNYXipg67V3XSw9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Gpl0cloj; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1754914898; x=1786450898;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Ql1JCgnCHCe7QLdED93B26Cg21+RnnwnTV77huzWi0s=;
  b=Gpl0clojgNadKcllAmuS5qeyr7U61wJHDZdoNrUpvQXfyYR/YcdiLIZZ
   T/jJBrCdcFKKzgbl3tGf/K1pgZlnW+Wc2VVlRfjOgsTxTC0nXKo4JeT24
   w6mnq55pqVRBeHTtrE7glPy239HLTPGbZokXHQdr1TeRPb5L4wjt9cgTH
   BItjbrQ7jbkciy1t/uzQKgEoxZuQhBrpLN2wBn/Wz+MJZCOtQh+n47bpU
   ELZLDE0f7x2RiAzlNQpwJj/qDLJv2+YdqJX7tCm/sRGy3Sbr1qWmGjXa7
   kvztThpDlB8CDVKa6CkdGzraZDppxs/7+5hxV7+cCLmBt84aUAVnNWAhV
   w==;
X-CSE-ConnectionGUID: wyxru+5XTMK+lbiHaXZ4+w==
X-CSE-MsgGUID: 5Wwrm8/ITrONPZG1z6ylXA==
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="45644208"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Aug 2025 05:21:28 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 11 Aug 2025 05:20:58 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 11 Aug 2025 05:20:53 -0700
Date: Mon, 11 Aug 2025 12:20:53 +0000
From: Daniel Machon <daniel.machon@microchip.com>
To: Robert Marko <robert.marko@sartura.hr>
CC: Nicolas Ferre <nicolas.ferre@microchip.com>, Arnd Bergmann
	<arnd@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"Russell King" <linux@armlinux.org.uk>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Olivia Mackall <olivia@selenic.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>,
	Vinod Koul <vkoul@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Lee Jones
	<lee@kernel.org>, Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-serial@vger.kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>,
	<luka.perkov@sartura.hr>, Conor Dooley <Conor.Dooley@microchip.com>, "Lars
 Povlsen - M31675" <Lars.Povlsen@microchip.com>
Subject: Re: [PATCH v8 01/10] arm64: Add config for Microchip SoC platforms
Message-ID: <20250811122053.4bfyoefln7wpz2a4@DEN-DL-M70577>
References: <20250702183856.1727275-1-robert.marko@sartura.hr>
 <20250702183856.1727275-2-robert.marko@sartura.hr>
 <ea353170-6e03-4231-afc2-3dc45253931d@app.fastmail.com>
 <CA+HBbNHxiU5+xVJTyPQFuCJLyEs5_MpybSBEgxi25bzaGfiVHA@mail.gmail.com>
 <421d61db-27eb-4ad2-bd98-eb187fd14b1e@microchip.com>
 <CA+HBbNEiKWS71jtF_jqV9bdX9HVroaZSGMaeD-xFM8sm0kLtCw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+HBbNEiKWS71jtF_jqV9bdX9HVroaZSGMaeD-xFM8sm0kLtCw@mail.gmail.com>

On Fri, Jul 04, 2025 at 07:36:06PM +0200, Robert Marko wrote:
> 
> On Thu, Jul 3, 2025 at 3:56 PM Nicolas Ferre
> <nicolas.ferre@microchip.com> wrote:
> >
> > Robert, Arnd,
> >
> > On 03/07/2025 at 14:25, Robert Marko wrote:
> > > On Wed, Jul 2, 2025 at 9:57 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > >>
> > >> On Wed, Jul 2, 2025, at 20:35, Robert Marko wrote:
> > >>> Currently, Microchip SparX-5 SoC is supported and it has its own symbol.
> > >>>
> > >>> However, this means that new Microchip platforms that share drivers need
> > >>> to constantly keep updating depends on various drivers.
> > >>>
> > >>> So, to try and reduce this lets add ARCH_MICROCHIP symbol that drivers
> > >>> could instead depend on.
> > >>
> > >> Thanks for updating the series to my suggestion!
> > >>
> > >>> @@ -174,6 +160,27 @@ config ARCH_MESON
> > >>>          This enables support for the arm64 based Amlogic SoCs
> > >>>          such as the s905, S905X/D, S912, A113X/D or S905X/D2
> > >>>
> > >>> +menuconfig ARCH_MICROCHIP
> > >>> +     bool "Microchip SoC support"
> > >>> +
> > >>> +if ARCH_MICROCHIP
> > >>> +
> > >>> +config ARCH_SPARX5
> > >>> +     bool "Microchip Sparx5 SoC family"
> > >>
> > >> This part is the one bit I'm not sure about: The user-visible
> > >> arm64 CONFIG_ARCH_* symbols are usually a little higher-level,
> > >> so I don't think we want both ARCH_MICROCHIP /and/ ARCH_SPARX5
> > >> here, or more generally speaking any of the nested ARCH_*
> > >> symbols.
> >
> > Well, having a look at arch/arm64/Kconfig.platforms, I like how NXP is
> > organized.
> >
> > SPARX5, LAN969x or other MPU platforms, even if they share some common
> > IPs, are fairly different in terms of internal architecture or feature set.
> > So, to me, different ARCH_SPARX5, ARCH_LAN969X (as Robert proposed) or
> > future ones make a lot sense.
> > It will help in selecting not only different device drivers but
> > different PM architectures, cores or TrustZone implementation...
> >
> > >> This version of your patch is going to be slightly annoying
> > >> to existing sparx5 users because updating an old .config
> > >> breaks when ARCH_MICROCHIP is not enabled.
> >
> > Oh, yeah, indeed. Even if I find Robert's proposal ideal.
> >
> > Alexandre, Lars, can you evaluate this level of annoyance?
> >
> > >> The two options that I would prefer here are
> > >>
> > >> a) make ARCH_SPARX5 a hidden symbol in order to keep the
> > >>     series bisectable, remove it entirely once all references
> > >>     are moved over to ARCH_MICROCHIP
> > >>
> > >> b) Make ARCH_MICROCHIP a hidden symbol that is selected by
> > >>     ARCH_SPARX5 but keep the menu unchanged.
> > >
> > > Hi Arnd,
> > > Ok, I see the issue, and I would prefer to go with option b and do
> > > what I did for
> > > AT91 with the hidden ARCH_MICROCHIP symbol to avoid breaking current configs.
> >
> > Yep, but at the cost of multiple entries for Microchip arm64 SoCs at the
> > "Platform selection" menu level. Nuvoton or Cavium have this already, so
> > it's probably fine.
> 
> Yes, this is why I went with a menu instead, to me it is much cleaner.
> 
> So, how would you guys want me to proceed?
> 
> a) Keep the menu-based config symbol
> or
> b) Like for AT91, add a hidden symbol and keep the individual SoC-s in
> the top level
> platform menu?
> 
> Regards,
> Robert

Hi Robert,

Sorry for the late reply.

I appreciate the effort to make the addition of future symbols easier by using
a common ARCH_MICROCHIP symbol — that makes sense to me.

Regarding the actual symbols, I’m certainly no expert, but I agree with
Nicolas, that having more granular control with separate ARCH_SPARX5 and
ARCH_LAN969X could make sense, as opposed to only having ARCH_MICROCHIP, as
Arnd mentioned.

As for the goal of using a common symbol for drivers to depend on,  while not
breaking existing configs (are there any unwritten rules or practices about
breaking existing configs?), I think option B will work fine. I dont mind the
symbols being top-level.

/Daniel



