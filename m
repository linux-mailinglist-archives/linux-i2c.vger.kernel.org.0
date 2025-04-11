Return-Path: <linux-i2c+bounces-10267-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EEEA85D6D
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Apr 2025 14:43:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C29087AF7DE
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Apr 2025 12:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A3B42367A6;
	Fri, 11 Apr 2025 12:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="E3btRzli"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB7E2367A0;
	Fri, 11 Apr 2025 12:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744375300; cv=none; b=c4IH/TWGWy4nCT87RZkx4LmPHD6y7BGyjjCBhlfiVpsBOK+dj8cfTq+OITv4oj4K5GDeGMl7jzCXjyKY3vxsHtWV5mSoHlqSTD/45leiGhNFJNGFPQxlWxQoZTqW3Jq6IOfBRPz5nXoA0IdwmUUygLtuWvHQlcpFaSloDuu58UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744375300; c=relaxed/simple;
	bh=zDL/ObZQj8eM62TAxARSjoBDC8yqTO1LrkfozSlxMZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ifOu0dLN/1agWjCjyajmmWUV22uw2Ke0By8j0blqlhIjTbVihOCFGcwzbPb+kg7bdaWTEjcpT6TiSC5t3AwFG6BwQgkVlgiMUAV4bXLH3WCofuXvBwbGxrxGtjnMmxASoihWZzArzmPipgnap0WAJHCBLmJCkPDkViu+WIFjwvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=E3btRzli; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 2D7CA1FEC1;
	Fri, 11 Apr 2025 14:41:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1744375294;
	bh=EOH8CIdz65AlaprFUzkJc8PL6lMT1kHFZ8SCjFlHZ9c=; h=From:To:Subject;
	b=E3btRzlir8gNK+aXDl3vPeVu4yeZ/AEtyTxwgKCsw8IULkGr+8Wid5/IKqHV6MMhs
	 coudJUidzaoGjnYB/rZMq/WPqLgms0I7TMW2KyPmoLu2RIvwbQssuA8exOmAGPGCq1
	 zTbZfp708FVTHIDztLVGSehqjJHi2fRFWoKhJ+tVPh/7wAhAfPIaMxlbUUg5URzSNv
	 4+1SZhkjzFgr0hLM8bIbZL3R1TMtnpC4XHpegMk/T9rVWg2IrZhGSCdneamI2OvcER
	 tNLxDjAF1Z8xMtxEKdaed9CxUIIL21V1OVYaWCODqs49g8HwRU8xQ4/AA6JkoUJn7n
	 qklDoVJJhmGnw==
Date: Fri, 11 Apr 2025 14:41:29 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Carlos Song <carlos.song@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Aisheng Dong <aisheng.dong@nxp.com>,
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1] i2c: lpi2c: implement master_xfer_atomic callback
Message-ID: <20250411124129.GA48732@francesco-nb>
References: <20250319145114.50771-1-francesco@dolcini.it>
 <20250411114738.GA43965@francesco-nb>
 <FRWPR04MB11150B555044300A70102DAF5E8B62@FRWPR04MB11150.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <FRWPR04MB11150B555044300A70102DAF5E8B62@FRWPR04MB11150.eurprd04.prod.outlook.com>

Hello,

On Fri, Apr 11, 2025 at 11:55:31AM +0000, Carlos Song wrote:
> > On Wed, Mar 19, 2025 at 03:51:14PM +0100, Francesco Dolcini wrote:
> > > From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> > >
> > > Rework the read and write code paths in the driver to support
> > > operation in atomic contexts. To achieve this, the driver must not
> > > rely on IRQs or perform any scheduling, e.g., via a sleep or schedule
> > > routine. Even jiffies do not advance in atomic contexts, so timeouts
> > > based on them are substituted with delays.
> > >
> > > Implement atomic, sleep-free, and IRQ-less operation. This increases
> > > complexity but is necessary for atomic I2C transfers required by some
> > > hardware configurations, e.g., to trigger reboots on an external PMIC chip.
> > >
> > > Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> > > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > 
> > Any comment on this?
> Looks good. Thank you for your work!
> Do you test it at some board? How can we test simply?

It was tested on Toradex SMARC iMX95, there to power-off/reset the board
we have some I2C communication required [1].

[1] https://lore.kernel.org/all/20250407114947.41421-3-francesco@dolcini.it/

Francesco


