Return-Path: <linux-i2c+bounces-2277-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB98875FDF
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 09:44:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48499281E79
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 08:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E853E52F62;
	Fri,  8 Mar 2024 08:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="REZmszDW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B71351C5C;
	Fri,  8 Mar 2024 08:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709887245; cv=none; b=bWpwg1fbJg8pMUajpdFEofAjDT5Zn+aNlx5nlxwWaAdL8mtMjtSKl5sw3Ulv1jWFCNMxCvHlSJZYhlkrQbjScplg9qhv7cKLtxzaCj+xcBpYOfpe8jhOPJOf9XSH2xpHmVwispKsfg0H9V83B9peNuefUQc11nkZxngB4BZmJWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709887245; c=relaxed/simple;
	bh=wpah1BRPoth5v+GfqPF7IPIPtr3RuwlZdH6pWroKFH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iEYOr/FfOwnDPdGRbFiUOhUgZsCZneRb+hP9NAfPUMRK4DlIfKZkZgmZOtQhBNtmqfRptK3hIgTj3iu9kAPUrBzFUt89F3VTy+sdRHo7MfXDsbTBe1I2VRgSdRxDriwFJp8Vz9SNUE/BVHaAXJWHLd7E5URlix1bFV9mOdJeoBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=REZmszDW; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id AEFC16042D;
	Fri,  8 Mar 2024 08:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1709887242;
	bh=wpah1BRPoth5v+GfqPF7IPIPtr3RuwlZdH6pWroKFH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=REZmszDWTvKT3lidocsf8OEGV1gZqMg3JFWg8YtDu7y1r5CBWQW3tOVT40RmE4b3b
	 YePLWtD4jQkdWkq5sEqYBHRLDQ19FC+AY8v6nRBdOMFfUsWOq2KODnA076fO4sRyDh
	 aVW3DWFaXAnrlMCugWxKXoKPEqjO1uFLoPDNEDlP4VLHZQLOOIiyF6xM791j7YUTDf
	 lx1ba9yyCls15dtwMOFe5GHhnQVGuOV0LTID+cEbF0dINp6nxBV0DlDufkgUlXF4VU
	 dRbJyxTNe/d/fLrFVPW/nuBrIvsj//vrjsqIXidb7LfQ9Js1kMNRTL580aZid11iSf
	 1XI2Un6qVopOg==
Date: Fri, 8 Mar 2024 10:39:40 +0200
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
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-pci@vger.kernel.org, gregory.clement@bootlin.com,
	theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com,
	u-kumar1@ti.com, Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v4 02/18] pinctrl: pinctrl-single: move
 suspend()/resume() callbacks to noirq
Message-ID: <20240308083940.GJ52537@atomide.com>
References: <20240102-j7200-pcie-s2r-v4-0-6f1f53390c85@bootlin.com>
 <20240102-j7200-pcie-s2r-v4-2-6f1f53390c85@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240102-j7200-pcie-s2r-v4-2-6f1f53390c85@bootlin.com>

* Thomas Richard <thomas.richard@bootlin.com> [240304 15:36]:
> The goal is to extend the active period of pinctrl.
> Some devices may need active pinctrl after suspend() and/or before
> resume().

Reviewed-by: Tony Lindgren <tony@atomide.com>

