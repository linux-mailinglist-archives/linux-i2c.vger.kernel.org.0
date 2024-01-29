Return-Path: <linux-i2c+bounces-1510-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A10841574
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jan 2024 23:16:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72A371F24C5E
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jan 2024 22:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0B3B159587;
	Mon, 29 Jan 2024 22:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MQZAohOc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCEC15956E;
	Mon, 29 Jan 2024 22:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706566609; cv=none; b=Dp/o3WP4xVKLrVHQPyl1Q7xdnmfp7B3898QDaJ0Aaikb5mKHHi7MAWQ7VsnGLlZHIeA1TUlhLkhvQtYcBtKb/SFm/G3v10XsN/uMVoTMMGzRFuUTC4+IcE7MpZ0l1SIN7i/5Pg2BH5jwpiA8oKb5RZjT8vK87vrS6Ahs88AZrW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706566609; c=relaxed/simple;
	bh=fWlUMRgvqVY95h4dXufWc8ddniO0qcwX7UwmN7CzrKY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=qTrGaDsxABPRYBO77pCXAtCPHM9LiRnp8/RMBRZjGQcXkjyK0I6K6+gMyBPHyb3A/BKmpH7C4iNrIkZ6XTwIuU7LKmJrmkRs2brY+mU+RK8XerSUYzNfGDXdikbWlUNC0tEFUwDm/9VG6vfMgg0Bs5lTBJpLu6M1MAnThlOBjgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MQZAohOc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A644C433F1;
	Mon, 29 Jan 2024 22:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706566608;
	bh=fWlUMRgvqVY95h4dXufWc8ddniO0qcwX7UwmN7CzrKY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=MQZAohOc8Dgk2cjX6jvaB2a8InqsFsEgUpwwpZU2S7fbZRA0vBXW6WQSwHknPL5pw
	 Db8Yfblz+iPuvPB/SJoPzIfMgTJVjPMp80BU6HK9ZWiykjcov7UibFqd9OAb/hbzTo
	 02w2rI+/oZM/9FvV4tFg8DgNOGIo438LRESCHy+xdUfXgegDc4FK6gwqbOM1S1KUfk
	 93rCTIQMZz7MV4r01diHmg33R/SlkevQOAMb86W1RWwkaeO63dCQN5tCYK1C+q17z/
	 GuvYkKdEKIKG/PsskcufS7cJyHu5gt6cbRS3bxgctjjxpKbilNfvy8YnhfdMXizSJf
	 Dz3Pdr5WXM7sA==
Date: Mon, 29 Jan 2024 16:16:47 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>,
	Vinod Koul <vkoul@kernel.org>,
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
Subject: Re: [PATCH v2 13/15] PCI: cadence: add resume support to
 cdns_pcie_host_setup()
Message-ID: <20240129221647.GA477676@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240126214336.GA453589@bhelgaas>

On Fri, Jan 26, 2024 at 03:43:39PM -0600, Bjorn Helgaas wrote:
> In subject, capitalize "Add ..." to follow historical convention.
> Also the other driver/pci/ patches.
> 
> On Fri, Jan 26, 2024 at 03:36:55PM +0100, Thomas Richard wrote:
> > From: Théo Lebrun <theo.lebrun@bootlin.com>
> > 
> > That function mixes probe structure init and hardware config.
> > The whole hardware config part must be done at resume after a suspend to
> > ram.
> > We therefore pass it a boolean flag determining if we are at probe or at
> > resume.
> ...

> This is pretty similar but slightly different from the DWC pattern:
> 
>   imx6_pcie_probe
>     ... do structure init ...
>     if (RC)
>       dw_pcie_host_init
> 	pp->ops->init
> 	  imx6_pcie_host_init
> 
>   imx6_pcie_resume_noirq
>     imx6_pcie_host_init
> 
>   j721e_pcie_probe
>     j721e_pcie_ctrl_init
>     if (RC)
>       cdns_pcie_host_setup(true)
> 
>   j721e_pcie_resume_noirq
>     j721e_pcie_ctrl_init
>     if (RC)
>       cdns_pcie_host_setup(false)
> 
> It'd be super nice to have them the same.  Passing in a "probe" flag
> works but seems a little harder to read in cdns_pcie_host_setup() and
> you have to keep track of what it means in the callers.

Maybe a better way to say this is that this patch uses the "probe"
flag to select the behavior of cdns_pcie_host_setup(), and I think it
would be nicer to split those two behaviors into separate functions.

Bjorn

