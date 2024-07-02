Return-Path: <linux-i2c+bounces-4582-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6C092403F
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jul 2024 16:15:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42D68B2605B
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jul 2024 14:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F6391BA067;
	Tue,  2 Jul 2024 14:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fp8a4ALq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE4EBE7F;
	Tue,  2 Jul 2024 14:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719929728; cv=none; b=EVuM2x8fWlzBaqrdr7980vIa0C0SBM/h71DPjDUCvYhwCoe7FQhqEPTj+c0Ks71bkGoi/cekXgmTVhImYm8iMi0OBXXWpMDXu76r/+elbfyqEpK5rjN0w9QgYS43+IkEfzi2e9FnzDK3Z37lYrD1KX5jwKi9ZcOeRPuDX09tWlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719929728; c=relaxed/simple;
	bh=Yj29D4k1LcVn7Ks20rGXW4rvIpFaMTU+k2U6e4btBIQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Fj9aSrEkDNabohcwiJe42WRUU85G1LNk9lZbGbR7QWKwdr6/LDj1yw68v45cqzPJRIJYmXNfsWXd2rN8ugSG2h4xH5sKFtWx3QeC4EarI0839oLY+wa/dv1v0ayta8nxmOpHblerTWno7vBXFVBx7Jz37xWbDMNYEmbdbayc1kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fp8a4ALq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE16EC116B1;
	Tue,  2 Jul 2024 14:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719929727;
	bh=Yj29D4k1LcVn7Ks20rGXW4rvIpFaMTU+k2U6e4btBIQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fp8a4ALqKzJzQAFeAuZkwqCTvJuj0YtIUipMdlDd1rdkIFeKnzJXvTU3ZN0hz7K3I
	 gdGUBWehue5RqVC5hGNOUvvuyOunqynlN5KMwgWGLsZkZ1bjI6ci4xj01PXjke6cF8
	 p/8NbVcc0wZLJ+yL0JRUzNF2LdURmYzmHW6CDju7ahJGwtuuwL4Mzn+Aj/Z1wcz5bH
	 oWLRk0GLRph+pRoW5289upyRK2T1BiUlNsysIDE7Lh88Pb71ZAoYouEyj8x2rrNUUH
	 b1aKcrmm/8bQuL0VWowbIbLBntgCeNZ+kZbpWxKHVFdpLswkkGR7QKvlhrlM+MW3hn
	 NrIInqs3S0POA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Marco Felsch <m.felsch@pengutronix.de>,
  Miquel Raynal <miquel.raynal@bootlin.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Arnd Bergmann
 <arnd@arndb.de>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  Bartosz Golaszewski <brgl@bgdev.pl>,  Russell King
 <linux@armlinux.org.uk>,  Joel Stanley <joel@jms.id.au>,  Andrew Jeffery
 <andrew@codeconstruct.com.au>,  Nicolas Ferre
 <nicolas.ferre@microchip.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  Shawn Guo <shawnguo@kernel.org>,  Sascha
 Hauer <s.hauer@pengutronix.de>,  Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,  Vladimir
 Zapolskiy <vz@mleia.com>,  Andrew Lunn <andrew@lunn.ch>,  Gregory Clement
 <gregory.clement@bootlin.com>,  Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>,  Tony Lindgren <tony@atomide.com>,
  Geert Uytterhoeven <geert+renesas@glider.be>,  Magnus Damm
 <magnus.damm@gmail.com>,  Dinh Nguyen <dinguyen@kernel.org>,  Thierry
 Reding <thierry.reding@gmail.com>,  Jonathan Hunter
 <jonathanh@nvidia.com>,  Jonathan =?utf-8?Q?Neusch=C3=A4fer?=
 <j.neuschaefer@gmx.net>,
  Michael Ellerman <mpe@ellerman.id.au>,  Nicholas Piggin
 <npiggin@gmail.com>,  Christophe Leroy <christophe.leroy@csgroup.eu>,
  "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,  Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>,  Huacai Chen <chenhuacai@kernel.org>,  WANG
 Xuerui <kernel@xen0n.name>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-i2c@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-aspeed@lists.ozlabs.org,
  imx@lists.linux.dev,  linux-omap@vger.kernel.org,
  linux-renesas-soc@vger.kernel.org,  linux-tegra@vger.kernel.org,
  openbmc@lists.ozlabs.org,  linuxppc-dev@lists.ozlabs.org,
  linux-mips@vger.kernel.org,  loongarch@lists.linux.dev
Subject: Re: [PATCH 4/9] mtd: devices: add AT24 eeprom support
In-Reply-To: <20240702-congenial-vigilant-boar-aeae44@houat> (Maxime Ripard's
	message of "Tue, 2 Jul 2024 15:56:52 +0200")
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
	<20240701-b4-v6-10-topic-usbc-tcpci-v1-4-3fd5f4a193cc@pengutronix.de>
	<07b701a9-7b52-45b7-8dba-1c25d77cbf15@linaro.org>
	<mafs0ikxnykpr.fsf@kernel.org>
	<20240702-congenial-vigilant-boar-aeae44@houat>
Date: Tue, 02 Jul 2024 16:15:20 +0200
Message-ID: <mafs0ed8byj5z.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jul 02 2024, Maxime Ripard wrote:

> On Tue, Jul 02, 2024 at 03:41:52PM GMT, Pratyush Yadav wrote:
>> On Mon, Jul 01 2024, Tudor Ambarus wrote:
>> 
>> > On 7/1/24 2:53 PM, Marco Felsch wrote:
>> >> EEPROMs can become quite large nowadays (>=64K). Exposing such devices
>> >> as single device isn't always sufficient. There may be partitions which
>> >> require different access permissions. Also write access always need to
>> >> to verify the offset.
>> >> 
>> >> Port the current misc/eeprom/at24.c driver to the MTD framework since
>> >> EEPROMs are memory-technology devices and the framework already supports
>> >
>> > I was under the impression that MTD devices are tightly coupled by erase
>> > blocks. But then we see MTD_NO_ERASE, so what are MTD devices after all?
>> 
>> I was curious as well so I did some digging.
>> 
[...]
>> 
>> I also found a thread from 2013 by Maxime Ripard (+Cc) suggesting adding
>> EEPROMs to MTD [1]. The main purpose would have been unifying the EEPROM
>> drivers under a single interface. I am not sure what came of it though,
>> since I can't find any patches that followed up with the proposal.
>
> That discussion led to drivers/nvmem after I started to work on
> some early prototype, and Srinivas took over that work.

So would you say it is better for EEPROM drivers to use nvmem instead of
moving under MTD?

-- 
Regards,
Pratyush Yadav

