Return-Path: <linux-i2c+bounces-1513-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 349318415FB
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jan 2024 23:49:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3D9D2815E3
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jan 2024 22:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6B2350A6B;
	Mon, 29 Jan 2024 22:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XrHpYcOK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878FA51C29;
	Mon, 29 Jan 2024 22:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706568564; cv=none; b=AI0RaKYynq1I+f/E0qgz2Pdjm0N9WiCtWI4iE9Q5F9GG9HX1ueaDSAGbsnomcQ2EG+TD3adprdVFLLr9yzoNol4sBmiM4rM/E0ijJYhnGakyGK95QAHJb1NCwWcIujYQQ9f92E144ESTK4xcCnEUJ9J64Frl3j0ouYiSUquyhA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706568564; c=relaxed/simple;
	bh=by+ve1UBbFb+J2zjnMunK9KbwOF5Bwt69isjqXT6wJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHCNDonCeZiAPeMuVRgJrYA07N806DNQjIVkLedo5QDx1mrRY1aiyKx6r61yxJTGkECpZ1Yuw7XP4zUbxqxhAnMQsKjT6m0WOkIrWkPspZ2odn20pM6HxSjwXpLgXoDDpWAQvF+SgHfCVfWoqs0dEdNi47QabVJlhGGyrJ1hB/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XrHpYcOK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6089EC433C7;
	Mon, 29 Jan 2024 22:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706568564;
	bh=by+ve1UBbFb+J2zjnMunK9KbwOF5Bwt69isjqXT6wJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XrHpYcOKjqSNUCB68RIn9ULWsfa6YD7kKYl3fS+dxSpAxqzXWqgdjXRHMiVwxPKKe
	 Y6G0zrB0RcKBd8bDenDGthQJEYHGFrGIEjSb0zpYXgLepXPQ9b1An7et4kYnUj9Ebi
	 K+qxh0SX/D5+m8THertBdWrpRQFxLdXKZS2GbHgUnOX9dfb4UsAxTqcxdnS0vFVWA4
	 4pZ25SkIaMKP1VdVC+unr8VYkSYpM8n4v11YRXdjaio5sKcDoVWJF1lC5N0l26iesV
	 39QbcK6jjT4vVZlbDmAfutSFyjIUZ+m42GXOTUyWjdGmRgq+slDCdj8ZG2Z0kR9C7r
	 6RZ3dJdAYKzdg==
Date: Mon, 29 Jan 2024 23:49:19 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Richard <thomas.richard@bootlin.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, 
	Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Peter Rosin <peda@axentia.se>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Tom Joseph <tjoseph@cadence.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org, gregory.clement@bootlin.com, 
	theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com, u-kumar1@ti.com
Subject: Re: [PATCH v2 02/15] pinctrl: pinctrl-single: move
 suspend()/resume() callbacks to noirq
Message-ID: <6hyubhrho6xbki6yxtmqedylc2gpeyj4yu5gtrjrq4nsthcr7g@elfukmqeve2a>
References: <20240102-j7200-pcie-s2r-v2-0-8e4f7d228ec2@bootlin.com>
 <20240102-j7200-pcie-s2r-v2-2-8e4f7d228ec2@bootlin.com>
 <CACRpkdYBnQ6xh2yNsnvquTOq5r7NeDhot6To9myfuNbonKcgzQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYBnQ6xh2yNsnvquTOq5r7NeDhot6To9myfuNbonKcgzQ@mail.gmail.com>

Hi Linus,

On Sat, Jan 27, 2024 at 11:31:11PM +0100, Linus Walleij wrote:
> On Fri, Jan 26, 2024 at 3:37 PM Thomas Richard
> <thomas.richard@bootlin.com> wrote:
> 
> > The goal is to extend the active period of pinctrl.
> > Some devices may need active pinctrl after suspend() and/or before
> > resume().
> > So move suspend()/resume() to suspend_noirq()/resume_noirq() in order to
> > have active pinctrl until suspend_noirq() (included), and from
> > resume_noirq() (included).
> >
> > The deprecated API has been removed to use the new one (dev_pm_ops struct).
> >
> > Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Do you want to merge this as a series or is this something I
> should just apply?

there is still a comment from me pending.

Thanks,
Andi

> Yours,
> Linus Walleij

