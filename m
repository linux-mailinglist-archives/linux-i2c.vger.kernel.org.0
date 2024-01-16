Return-Path: <linux-i2c+bounces-1330-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE5C82EA42
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jan 2024 08:44:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37A6AB23311
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jan 2024 07:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C3191119A;
	Tue, 16 Jan 2024 07:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="p6KPwtwI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576711118B;
	Tue, 16 Jan 2024 07:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 4646160498;
	Tue, 16 Jan 2024 07:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1705391075;
	bh=GfQbjgBoY0QdWnRrKxS0+HroJWexKyse0pFiOAQkAL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p6KPwtwIvbaX5s0vn8ArVMCEI2mX1yV7niI1V76r3KDv1XHzzaRLkOoZxX/AEs2hL
	 SWghoXb2CCy8YD38pzz+wbgJJxZjJBv2ayud8mCKGtT4Qc04UkCxV+cSDgiOC0vaiZ
	 5VNkcgebX4GTOWxV71AJj5TtxQEEfsQhUAZF2Hyb4AC4w3CAMdeiQ7bNYg+3wy9EuC
	 wxwbLk7wc+/2Wq2RIuo+zjXLpqom8EArKJjQBL+JXq5G+aaMVJsgOg5OW0UT+tToPn
	 WIy/V6DptJrQcUo3MgSOGGZVOcNrBUxwfeWercSbPQoQytAOpKsmYw/tR19TmuSm3r
	 AB0BfaWOW+XXA==
Date: Tue, 16 Jan 2024 09:43:33 +0200
From: Tony Lindgren <tony@atomide.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
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
Subject: Re: [PATCH 01/14] gpio: pca953x: move suspend/resume to
 suspend_noirq/resume_noirq
Message-ID: <20240116074333.GO5185@atomide.com>
References: <20240102-j7200-pcie-s2r-v1-0-84e55da52400@bootlin.com>
 <20240102-j7200-pcie-s2r-v1-1-84e55da52400@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240102-j7200-pcie-s2r-v1-1-84e55da52400@bootlin.com>

* Thomas Richard <thomas.richard@bootlin.com> [240115 16:16]:
> Some IOs can be needed during suspend_noirq/resume_noirq.
> So move suspend/resume callbacks to noirq.

So have you checked that the pca953x_save_context() and restore works
this way? There's i2c traffic and regulators may sleep.. I wonder if
you instead just need to leave gpio-pca953x enabled in some cases
instead?

Regards,

Tony

