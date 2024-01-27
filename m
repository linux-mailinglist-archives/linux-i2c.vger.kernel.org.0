Return-Path: <linux-i2c+bounces-1493-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B0F83F040
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Jan 2024 22:46:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F63F282C7D
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Jan 2024 21:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7FF81B5BB;
	Sat, 27 Jan 2024 21:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJFqJgRC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DBB1B271;
	Sat, 27 Jan 2024 21:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706391985; cv=none; b=mUDL8IovCSOrtwAPMIqkEomt3VxLfk5XWyk4nbminuBHJrvjHdpnW0oB1Ppoa8CbGbhHZJX4BOek5m86t6cKhyRPM3WUrKE50a1n5D33CUM0BzrW1D+H92hfvjBrgjZS27TSR5YQ2q7aDNZSgDkJwgBQu0rruEO0vRPOXmeA+PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706391985; c=relaxed/simple;
	bh=SErjFBICAWxRTxTFw2so2di/v5LFUPRZOMxTT+5uyqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DfuituOAVA5W3+7rDJ2xfo/2Q0l5QcSAA1xlK3CsVkC8Lw5yMy3oVLc34IERoJMrvhvOvkLH3ESoPHGxEXPGiyqe4cJkiDwgrgJ4Acotb5BhIu7U8G7N9QOfuT7fG3Qg4d10Yb2RH0VLQYXPWOmysmI/+4sVR7XHSZzJVW/lJMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJFqJgRC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A7AFC433C7;
	Sat, 27 Jan 2024 21:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706391984;
	bh=SErjFBICAWxRTxTFw2so2di/v5LFUPRZOMxTT+5uyqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BJFqJgRCiVMNZX+V2TC3V0uQ1Q9GGncokLQikLTlsvHbP0c2jzCg/ddXZkWnKWPgT
	 IOIRBPj+Q27jll86wkFQEPd1TlRJge92vUiAgl7pBSYHv/+Wj4HPz5giLUC1xTmpv2
	 S9503BZ29w1y0lBgShOk9pJJ8HdceEEgoUu880ddhkgihwDMg7Mghl9G2pv3s2Fcwx
	 80xY1DDANGPeMGi2OD60DnkG0CGu5sip2JVMW46HYJXEKw6d6SuZMF11yvqVI4/lGV
	 Fau6lNL4FcYxEX72Z59QewSz1lV6swlpJVO998IiQhpvy+UMJ15Ub1sP/Yaasq83ao
	 XXz8oextlma7g==
Date: Sat, 27 Jan 2024 22:46:19 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
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
Subject: Re: [PATCH v2 01/15] gpio: pca953x: move suspend()/resume() to
 suspend_noirq()/resume_noirq()
Message-ID: <jwal3js3xjnbx46syf2jldsdx7fp4yv63fvsbnwo5npbbxapdu@n2flwlvsaetg>
References: <20240102-j7200-pcie-s2r-v2-0-8e4f7d228ec2@bootlin.com>
 <20240102-j7200-pcie-s2r-v2-1-8e4f7d228ec2@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240102-j7200-pcie-s2r-v2-1-8e4f7d228ec2@bootlin.com>

Hi Thomas,

On Fri, Jan 26, 2024 at 03:36:43PM +0100, Thomas Richard wrote:
> Some IOs can be needed during suspend_noirq()/resume_noirq().
> So move suspend()/resume() to noirq.
> 
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

