Return-Path: <linux-i2c+bounces-1764-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 326EC856A83
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 18:06:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E46BD288AF9
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 17:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76532136668;
	Thu, 15 Feb 2024 17:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uuL2/XHj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BE912DD9A;
	Thu, 15 Feb 2024 17:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708016768; cv=none; b=sMdwbwRRrkLiCwdc2V03yNNxaw7ULy0pKaE6wUutmuDsSXufX5k762saOG1WP5J57W7hvZDCYn3gicEbbkFmspml5uMO73JJVPCJ9END1hEpBlIaOdxHtFALjA7tCUKuuz8y1vwc7GB3uFTQ+LBf6GuwMJczfHj11kf0UZJBVRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708016768; c=relaxed/simple;
	bh=nq34IP6sfpD54hsEtrN2j/P+4DNp6g4tkl0Jwz9sTNw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=BeFUc+99OUCTTP/0rnar5a65dcjfEEf4LHMFRHzrr7HfAF0Htf0gLGbsd7zqZDyjX50pq8SfA45elWnwq/CXlqKO8g6Wi401EXElm0HcJsreFe8ZxICpRR0Mya0f3u5xhOgpSMP4EzkExCvcPenpYlOhKziy6QdNDszqd87P6UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uuL2/XHj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B88AC433C7;
	Thu, 15 Feb 2024 17:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708016767;
	bh=nq34IP6sfpD54hsEtrN2j/P+4DNp6g4tkl0Jwz9sTNw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=uuL2/XHjxDow0CBItd3NuPU14AW2Kvom1K9Wr9j5a43WNbnXKxS6qLs96rgU+lH1b
	 vYmgKOnPyo1KlOXrOx2rf3woeVDCKAsWKmnttNrVV1Jo5T14L2WXDu0TYPazgiMNVX
	 cIiQLkeo7lUq7u6QEcgmVUUWkN5Q6F98aLQbtxVr+xFE8r53AynGns+s0Rvq/VRrCm
	 lw1l5c5W3akEl8k39a6ztwOy3nsGhR9j0EGi6CvA2qt07+VBbt037uX3kPZl3GvY6b
	 DgKqCyFiw7gPCIV1YPCq3qdxrZsWswZb4+cXHIXesWd2nQ6lOD/p1N93dMixc3IBUq
	 WGDLgvYo1uQWA==
Date: Thu, 15 Feb 2024 11:06:05 -0600
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
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-pci@vger.kernel.org, gregory.clement@bootlin.com,
	theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com,
	u-kumar1@ti.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 00/18] Add suspend to ram support for PCIe on J7200
Message-ID: <20240215170605.GA1294576@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240102-j7200-pcie-s2r-v3-0-5c2e4a3fac1f@bootlin.com>

On Thu, Feb 15, 2024 at 04:17:45PM +0100, Thomas Richard wrote:
> This add suspend to ram support for the PCIe (RC mode) on J7200 platform.

>       PCI: cadence: extract link setup sequence from cdns_pcie_host_setup()
>       PCI: cadence: set cdns_pcie_host_init() global
>       PCI: j721e: add reset GPIO to struct j721e_pcie
>       PCI: j721e: add suspend and resume support

The drivers/pci/ subject line pattern is:

  PCI: <driver>: <Capitalized verb>

e.g.,

  PCI: cadence: Extract link setup sequence from cdns_pcie_host_setup()

