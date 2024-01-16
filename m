Return-Path: <linux-i2c+bounces-1343-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B136082F412
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jan 2024 19:20:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6556E1F24A2F
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jan 2024 18:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 769B11CFBE;
	Tue, 16 Jan 2024 18:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DsPYcpVq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE831CFAE;
	Tue, 16 Jan 2024 18:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705429182; cv=none; b=uS+fGuxlHIPzHAem07HLwlTW5dBuIWZfAAS1k6v52Dsb/V2owD8Y/ZR5Znj02N4eOByafREGSAAQeosgeYSh0qzHsRgV/Wq3mgeOdGcP+S1geyX5dwpg86Vnqp2NvLlsISVoQMKck9KUZiUsCz85F9w49RdANrjMrUSsLlKi45A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705429182; c=relaxed/simple;
	bh=cK0uK7R2+gEbjOCsenY8rYIQosqscpXTCp6F+qM8Pd8=;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To; b=f4qqqu70PiY9s2RJIg1vFMbhOBJJrv52f+4/jsYkaxi57jZ2W7SIAMtX+XwwFcXgBljGh+5tFyOCaPUXJUCTXI8wkt/31vujlAMpGdhqPoBG0xItl0ZQ+wc8C760n3eWSnPuWHXTJnZDnNyzTXDwo4rThA2yKc47T2THVs29cKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DsPYcpVq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4490FC433F1;
	Tue, 16 Jan 2024 18:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705429181;
	bh=cK0uK7R2+gEbjOCsenY8rYIQosqscpXTCp6F+qM8Pd8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=DsPYcpVqeSMaQVwap6TSM10XjoOPuojT6s+DQLUtOv+G5QecnwOOLG/Btd30B9sKD
	 sPLkDVnjb3Ujys/qaKlj6P/2Q2Q976Ex1Qvf1/GH+yU1SiUnOC2LJ6MwMU6A0kkb4b
	 laB0h0Yy1fmCV5dvcsLx+/XtcTFLtVXXPReiJfAINVpuOKuFIX3CfdDb/k7vHjTyE8
	 EpnyMDv5x9RZhgd0oSGVD9/8ujhuWDfhz67X1nUEGE7Q2EVz0/eU202+tc6yopwHJk
	 mlhOdTwzbhGv1kssB7mJQ3FfHQgC/qjiMsfFWtIYbEVwdvWBzJM/I/6Y3PGVRbGwm5
	 BA2iB9BUFtu6Q==
Date: Tue, 16 Jan 2024 12:19:39 -0600
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
Subject: Re: [PATCH 13/14] PCI: j721e: move reset GPIO to device struct
Message-ID: <20240116181939.GA101049@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240102-j7200-pcie-s2r-v1-13-84e55da52400@bootlin.com>

On Mon, Jan 15, 2024 at 05:14:54PM +0100, Thomas Richard wrote:
> From: Théo Lebrun <theo.lebrun@bootlin.com>
> 
> Move reset GPIO to device struct, so it can be used at suspend and
> resume stages.

s/Move/Add/ since we're not moving it from one struct to another.  (In
subject also.)

s/device struct/struct j721e_pcie/ since "device struct" could also
refer to the "struct device", which is obviously not relevant here.

BTW, if you capitalize the PCI subject lines to match previous
history, it will save some work when applying this series.

Also rewrap commit logs to fill 75 columns and add blank lines between
paragraphs (noticed in patch 12/14).

> @@ -54,6 +54,7 @@ struct j721e_pcie {
>  	struct clk		*refclk;
>  	u32			mode;
>  	u32			num_lanes;
> +	struct gpio_desc	*reset_gpio;
>  	void __iomem		*user_cfg_base;
>  	void __iomem		*intd_cfg_base;
>  	u32			linkdown_irq_regfield;
> @@ -359,7 +360,6 @@ static int j721e_pcie_probe(struct platform_device *pdev)
>  	struct j721e_pcie *pcie;
>  	struct cdns_pcie_rc *rc = NULL;
>  	struct cdns_pcie_ep *ep = NULL;
> -	struct gpio_desc *gpiod;
>  	void __iomem *base;
>  	struct clk *clk;
>  	u32 num_lanes;

