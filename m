Return-Path: <linux-i2c+bounces-1631-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCE6849422
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Feb 2024 08:00:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D3D1B23089
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Feb 2024 07:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CAE9C2FD;
	Mon,  5 Feb 2024 07:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="tH36ZgQu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47115C133;
	Mon,  5 Feb 2024 06:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707116400; cv=none; b=HxGlW41j6Gn+uUyD06o3Uwa+AUWRf9Uk5uGcfg5fTqjzZOTffbygLrRRKvPH+Hl+wTO9paGeXyw3erhG2rRWkOkLW4RjDG1DleUyy7GctS/uv8xlTzbzD0dTBfe+29sFqbyRk7vnFypwGHdFc4HeHJQzobGRs0zZNqKvvrV41Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707116400; c=relaxed/simple;
	bh=zt0C46DodJBw5mMiz+hdsd1ggKvdZL8FZ+OjMed37Rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oSOaa94oOx/C4iuMWjIHLgH79pacR2wabZ/CbSlU8zTGY+iT4WqzdISN8uYvfC//6QH1k978l9Nwou6b87t690k8/+c5+gdIZJom7LYssHxAjA7PJjE/dkHuCF+eUL39P3AlsvhPn+v6StOmDvzUamVAnF5VSr6+TDAIndjVdgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=tH36ZgQu; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 3015060461;
	Mon,  5 Feb 2024 06:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1707116398;
	bh=zt0C46DodJBw5mMiz+hdsd1ggKvdZL8FZ+OjMed37Rk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tH36ZgQuTy82CmmwbwrfaK6mcnilerxyth/pAfkT84LOG4s04CTqsIidYWsJCJTc1
	 apeqTj9Ms8UG356uohWBjDVKt31g8C9hKjXd7dhaVjMRHC3ertJwBG9ydwEbnNDt8e
	 CQhDuXlo0wPxJWJJd/UVIVCM/J0Tfktzoh6ampZMQQ9nv5xQRb1TblzH3KgH3RF5Ip
	 M9zqc2fCDXTlZz5Skz7zQs2Jo9X7tgWF6JXlp++gtHN6gZPY6N0Ae2TkQjZSqoYlHl
	 uGD7cs673Ujl6skOSecx0oIAZe6gCl8kskqZ5oA6cQj2GxY8GYx4dc+Pmezp51aRAF
	 Y4Wr2WQsVmz/A==
Date: Mon, 5 Feb 2024 08:58:48 +0200
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
Subject: Re: [PATCH v2 01/15] gpio: pca953x: move suspend()/resume() to
 suspend_noirq()/resume_noirq()
Message-ID: <20240205065848.GC5185@atomide.com>
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

* Thomas Richard <thomas.richard@bootlin.com> [240126 14:37]:
> Some IOs can be needed during suspend_noirq()/resume_noirq().
> So move suspend()/resume() to noirq.

Hmm so what happened to the earlier i2c transfer at noirq level comments
from me and Linus W here? It seems the cover letter mentions it but I
don't see the related changes in this patch?

Regards,

Tony

