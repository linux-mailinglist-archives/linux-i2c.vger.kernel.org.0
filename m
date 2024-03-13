Return-Path: <linux-i2c+bounces-2343-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E710487A02E
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Mar 2024 01:37:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2530B1C2160A
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Mar 2024 00:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23BAB6107;
	Wed, 13 Mar 2024 00:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PSsvmZeI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E0EA930;
	Wed, 13 Mar 2024 00:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710290259; cv=none; b=A0adGFvon3pX2rLtNEHi+wH7IwykUW7P4PNpAePxRPZZ2tMv9BfLGbHMBnt0QBDyK1nJ1X+fieY3G5bae1j0oEjMFgRjuscXezJs01EaDNI04r98xTLL69rxewJcIq4GUK7vw0B3CsGnrlznMsR2SGpGLgLPkAaiW/U0tF+jVN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710290259; c=relaxed/simple;
	bh=1SnPGZWN0QXG/cj+HeG9fCWJ3nuxPvrSGvhQr+67xqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XyF2Za/rT92NcMcmmveXBsXPic9I0NhEV8PT2cLT8F5xevf/r9JgZMTU+h1iGZyltsgXiAR9kW6sg4LCVqgSphxL4zY876pldzBLRPXuQ2NazxQfKs0L6EB1U/s66svU0B8SzrgtaQCifoyewYxo3BmnC0obzeJIc5RivkllxZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PSsvmZeI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 897F2C43390;
	Wed, 13 Mar 2024 00:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710290259;
	bh=1SnPGZWN0QXG/cj+HeG9fCWJ3nuxPvrSGvhQr+67xqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PSsvmZeILe0xThjiru4Kga15JP/fW+1l8qlwVKVBHT8jT9Fp1TMJPjJ32D+rWpNIj
	 TEfNf0niIVdNTsssrJJZMJqZf8sUTLRsX6u51ZZMJoDMTNsUST9sBGL46uF38dTZut
	 yYIxBgR7iEq4/24utxzmBLoRYM5KeMkJVLnBGaqtVIvPhK2guawDaFjTtWIALzeaAf
	 rXIu6KCkicc7CKZAgNLjMowqaFsPLAsMBOqOrxAipyIt1fBiVY56oixNsxO8dPEsgx
	 8XdcXgzV2BnhKZCZhGEqybj98lgbIMYZ4KwDamk7r+eLzVrgfPk+qv16gyRo44kGSf
	 vteE9PgDz5PnA==
Date: Wed, 13 Mar 2024 01:37:35 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, 
	Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Peter Rosin <peda@axentia.se>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org, linux-pci@vger.kernel.org, 
	gregory.clement@bootlin.com, theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com, 
	u-kumar1@ti.com
Subject: Re: [PATCH v4 03/18] i2c: omap: wakeup the controller during
 suspend() callback
Message-ID: <z5sitoz6iz34v6nlfzc3ao3yijbzbsw2xxulqee2yuxx7sfnmi@pajsdc473jy2>
References: <20240102-j7200-pcie-s2r-v4-0-6f1f53390c85@bootlin.com>
 <20240102-j7200-pcie-s2r-v4-3-6f1f53390c85@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240102-j7200-pcie-s2r-v4-3-6f1f53390c85@bootlin.com>

Hi Thomas,

On Mon, Mar 04, 2024 at 04:35:46PM +0100, Thomas Richard wrote:
> A device may need the controller up during suspend_noirq() or
> resume_noirq().
> But if the controller is autosuspended, there is no way to wakeup it during
> suspend_noirq() or resume_noirq() because runtime pm is disabled at this
> time.
> 
> The suspend() callback wakes up the controller, so it is available until
> its suspend_noirq() callback (pm_runtime_force_suspend()).
> During the resume, it's restored by resume_noirq() callback
> (pm_runtime_force_resume()). Then resume() callback enables autosuspend.
> 
> So the controller is up during a little time slot in suspend and resume
> sequences even if it's not used.
> 
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

