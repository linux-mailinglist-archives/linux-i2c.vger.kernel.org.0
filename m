Return-Path: <linux-i2c+bounces-2653-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F31A9890D45
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Mar 2024 23:17:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 301A71C27D2A
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Mar 2024 22:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75B57146D6D;
	Thu, 28 Mar 2024 22:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V4OxVoCD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FB6146A9D;
	Thu, 28 Mar 2024 22:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711663673; cv=none; b=K9UfdHWbYwAcT/7O0rGYYutGWaRCfwB03TY1H65hntoK3eDJCHBkpNiezQiaHvyKr1gf0dW6z+lvtgCVHdP44dm6wDxqRsuOc0+hKPxumzN2Jci1ziC5jmCVDAsLFEMxeKfQWp9Dh6wn69RtufYPfNTvPu+DWgQK/ztuiDqnv9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711663673; c=relaxed/simple;
	bh=W4ByrRn+4LKetxSuLsKEBOpQVyml+dZHE4/n83TVljc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=UHv1CM/89YCdaR/PiK8E9LofDvhdJ1q8te2nSHxqG/rCCb5cHk3/ccxSOP2ZQij3kZXUOsEXxd82RGgjhomjgYOAMxeRnkLVpOgU+gLoK2q8nd6/UTLKA+Su+oI9GTv/iPxmyVXETTglw9AOuNrv0hl7Io7iOE3uGtKoVBLlaG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V4OxVoCD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6A53C43390;
	Thu, 28 Mar 2024 22:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711663673;
	bh=W4ByrRn+4LKetxSuLsKEBOpQVyml+dZHE4/n83TVljc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=V4OxVoCDai/enFPnJBLQJykhNDl1EcgFkrrTcoUNMqRgYCsT3pKvCQ4pUMTw9c5EV
	 7ps/B6RtmKls0wISTrTzJx0RlRfQcXeF2RY8SZiUL7i0ypKS1dLF7N6aZlbm0pweIC
	 LFaO67i9Oj0i3UhJ3KHZ10ZxkwNoNG3eWgoSsLtZLbS17N4z+u64fF8VEx1yoq97/0
	 DXM6Ed5G/l+aHVasdfhXppVn+Eekxz/UclPWyo1nU2dcbxkOitwfFqOYiBb1FSY4lh
	 yJrHD6RSB0jUdgMYWUg5JYyO1xllzQfHIzDRgLwalJClI3LBKR5WgpTPQRC9/uy9D8
	 EmwXkoGdDd/1w==
Date: Thu, 28 Mar 2024 17:07:51 -0500
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
	u-kumar1@ti.com
Subject: Re: [PATCH v4 18/18] PCI: j721e: Add suspend and resume support
Message-ID: <20240328220751.GA1613553@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240102-j7200-pcie-s2r-v4-18-6f1f53390c85@bootlin.com>

On Mon, Mar 04, 2024 at 04:36:01PM +0100, Thomas Richard wrote:
> From: Théo Lebrun <theo.lebrun@bootlin.com>
> 
> Add suspend and resume support. Only the rc mode is supported.
> 
> During the suspend stage PERST# is asserted, then deasserted during the
> resume stage.

> +		 * "Power Sequencing and Reset Signal Timings" table in
> +		 * PCI EXPRESS CARD ELECTROMECHANICAL SPECIFICATION, REV. 3.0
> +		 * indicates PERST# should be deasserted after minimum of 100us
> +		 * once REFCLK is stable. The REFCLK to the connector in RC
> +		 * mode is selected while enabling the PHY. So deassert PERST#
> +		 * after 100 us.

Please cite current spec (r5.1 was published August 2023), section,
and parameter name.  I think this is T_PERST-CLK, "REFCLK stable
before PERST# inactive", from sec 2.9.2.

> +		 */
> +		if (pcie->reset_gpio) {
> +			fsleep(100);

I'd like to see a macro used here instead of a bare number.  Since
this isn't anything specific to j721e, maybe add something like
#define PCIE_T_PERST_CLK_US alongside PCIE_T_PVPERL_MS.

> +			gpiod_set_value_cansleep(pcie->reset_gpio, 1);
> +		}

