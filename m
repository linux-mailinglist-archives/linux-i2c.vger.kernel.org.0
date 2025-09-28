Return-Path: <linux-i2c+bounces-13266-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3459BA6FA6
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Sep 2025 13:13:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF1B17AD614
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Sep 2025 11:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4B1E1DA62E;
	Sun, 28 Sep 2025 11:13:29 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD4B15E90;
	Sun, 28 Sep 2025 11:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759058009; cv=none; b=gAOH1S4hdib+AP1y5M+2nIqzy6Vu4ZTWe/T4H4MzdoEn9duxotJyhZgb8MPArtDnfIxgKo+Q/4ulEAezJGM10U8EmbNG4vZ3eHRkFFokCggk/BwNO1pKnYDgYfGNcgVZ/W2LF76bs0SlV5HLHxB37jElutRkU0zpREkbIlfhVLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759058009; c=relaxed/simple;
	bh=BGjEeHnpR7fquKM2+Gt10+/YCfHBGuwKrXn068aIokM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XyRjUVN1UDU2OD4GtQYgD08QtYsgsIGCOB+j22QL00KoT+56BaTaC4Z4zO3KOY5VMVgiQXnjxyQF4/wvsh6yF8bQUEHf4Uy7IuR943Ofaf5O2PBoU63vslCBpbB1GLbIeLfDVzukWyX3dvA63+YFTWoXdrvQmQ9KKRFPhsXHntY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 21148340D30;
	Sun, 28 Sep 2025 11:13:26 +0000 (UTC)
Date: Sun, 28 Sep 2025 19:13:21 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Jesse T <mr.bossman075@gmail.com>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2] i2c: spacemit: configure ILCR for accurate SCL
 frequency
Message-ID: <20250928111321-GYB1346428@gentoo.org>
References: <20250718-k1-i2c-ilcr-v2-1-b4c68f13dcb1@linux.spacemit.com>
 <CAJFTR8RGT0JFcsSODEgyWgJYKj6QhWa7=5Tm9_6U4Pkv56X=-g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJFTR8RGT0JFcsSODEgyWgJYKj6QhWa7=5Tm9_6U4Pkv56X=-g@mail.gmail.com>

Hi Jesse,

On 23:37 Thu 17 Jul     , Jesse T wrote:
> On Thu, Jul 17, 2025 at 9:08 PM Troy Mitchell
> <troy.mitchell@linux.spacemit.com> wrote:
> >
> > The SpacemiT I2C controller's SCL (Serial Clock Line) frequency for
> > master mode operations is determined by the ILCR (I2C Load Count Register).
> > Previously, the driver relied on the hardware's reset default
> > values for this register.
> >
> > The hardware's default ILCR values (SLV=0x156, FLV=0x5d) yield SCL
> > frequencies lower than intended. For example, with the default
> > 31.5 MHz input clock, these default settings result in an SCL
> > frequency of approximately 93 kHz (standard mode) when targeting 100 kHz,
> > and approximately 338 kHz (fast mode) when targeting 400 kHz.
> > These frequencies are below the 100 kHz/400 kHz nominal speeds.
> >
> > This patch integrates the SCL frequency management into
> > the Common Clock Framework (CCF). Specifically, the ILCR register,
> > which acts as a frequency divider for the SCL clock, is now registered
> > as a managed clock (scl_clk) within the CCF.
> >
> > This patch also cleans up unnecessary whitespace
> > in the included header files.
> >
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > ---

..[snip]
> >
> > +static struct clk *spacemit_i2c_register_scl_clk(struct spacemit_i2c_dev *i2c,
> > +                                                struct clk *parent)
> > +{
> > +       struct clk_init_data init;
> > +       char name[32];
> > +
> > +       snprintf(name, sizeof(name), "%s_scl_clk", dev_name(i2c->dev));
> > +
> > +       init.name = name;
> > +       init.ops = &spacemit_i2c_clk_ops;
> > +       init.parent_data = (struct clk_parent_data[]) {
> > +               { .fw_name = "func" },
> 
> Is "func" a placeholder? Can we name it i2c_scl_clk?
> 
no, it's the parent clk of scl that need to request, which correspond to
the DT node 

      clocks = <&syscon_apbc CLK_TWSI8>,
                ..
      clock-names = "func", ..

-- 
Yixun Lan (dlan)

