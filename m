Return-Path: <linux-i2c+bounces-1344-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EF41782F421
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jan 2024 19:23:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 919DFB21720
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jan 2024 18:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 785151CD39;
	Tue, 16 Jan 2024 18:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CBatexrm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2784C10A1D;
	Tue, 16 Jan 2024 18:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705429367; cv=none; b=lBC2Ee+6lHMUhuTH3JB7C2oVCceBLZcuUVTtCwh1exh0vjcSLgP0j3WZBwqGrM1vax3M0Ebbrnk10Q5MRkULH5t4dMTyz1sZMqrecwWT/oDTVgkpN+2pvXQWtRCnFBjBkhQXH1X0Ru00XoT4CbtHC1QzQOdVlZ0LWB8sCxx7QUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705429367; c=relaxed/simple;
	bh=24yf9WQZM8mCzBoY4DhIxhCfHQZP8hu82jOqs15h0jg=;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=RZco8vEJ7rZYjwc/s5veyZx0m7cpsjM5xWvDQx4fH8c64LLue1qy7ch8sMy/jglDMxewbUT766CTs8HySrsXxYQ8FgNPiYlNKwEqZGsC8wNtQZC9tyQ2mObE4jymNYBuO2sRkxEiP/TL/rEIOJb9eXH7VB8KRq1DIyDAzKljG6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CBatexrm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D20CC433F1;
	Tue, 16 Jan 2024 18:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705429366;
	bh=24yf9WQZM8mCzBoY4DhIxhCfHQZP8hu82jOqs15h0jg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=CBatexrm9aBNAYXsNpveWnrw+Di773YudoVO/VDqgpP9FKlSYHdGeCs9ySe0HGtWK
	 so2FLx7CeRayeJj9Z8kDp8bZqEEJxqHCJNS8c7tRBEMn8ySC/D9sH5IShv/Qo2Gila
	 wWFRNUHVyYshYfyYmIKD3cxzN/7U7Wl9fvvywrJvdzChhTimASQuKCYIKy5nyIsOoN
	 f/v4avvA0QcnowjCCBcL0oOvQHhzavvXAnirlz3cJXInydu6jFKaIIj/QeIkONkFoS
	 KSS5MkeXX+d1acaZzpQ/8hWvCjtvGU+aU4P2i/MhH3Czdl1GJCYXt9uBuT7TSbAFul
	 v2V7zez4Z1JzA==
Date: Tue, 16 Jan 2024 12:22:44 -0600
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
Subject: Re: [PATCH 11/14] phy: cadence-torrent: add suspend and resume
 support
Message-ID: <20240116182244.GA101245@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240102-j7200-pcie-s2r-v1-11-84e55da52400@bootlin.com>

On Mon, Jan 15, 2024 at 05:14:52PM +0100, Thomas Richard wrote:
> Add suspend and resume support.
> The alread_configured flag is cleared during suspend stage to force the
> phy initialization during the resume stage.

s/alread_configured/already_configured/

Wrap to fill 75 columns.  Add a blank line if you intend two
paragraphs.

I don't know whether there's a strong convention in drivers/phy, but I
see several commit logs that capitalize "PHY".  "Phy" is not a
standard English word, so I think the capitalization makes it easier
to read.

Bjorn

