Return-Path: <linux-i2c+bounces-1441-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 544218390C2
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jan 2024 15:03:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B8A52871AD
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jan 2024 14:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8694E5F84C;
	Tue, 23 Jan 2024 14:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l6lL8PmE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D2B5F841;
	Tue, 23 Jan 2024 14:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706018579; cv=none; b=fgxxe5kJLWshHn0eIXSMCWAtIhY51Ol6x0gCWj+Nd+bR5IExgkj2gy6/OeDorMXXaNYCre3NjJrYNWcW8MPAXaealgWGrEIf4RxMSWFh8+bfHngCtd90tauj6XvMHnMN8z8jbQ+0wKovpFlmN55DS4nqwATdo+hinka7YAyGWjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706018579; c=relaxed/simple;
	bh=07J5vk8WrZtMUgfX9yUoEbt1L1ydDJvsXfEiWtN8rKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=laCBR53BRXXYShYAPeWhfrA344Pis92cB2wFGohpwn8pqT/E/wv7z/y3PjGbxUz9KKdgnSxMrI3UD9cNS6ygs2z5pdpXK/ZMTeMbG949nT7STKX0zuoM4EGMm6ycQomaxrdSg6WHHQ7Z1bXYy/xokjkR9O2mNz7SZ2cNnXEYJmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l6lL8PmE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53B4C43390;
	Tue, 23 Jan 2024 14:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706018578;
	bh=07J5vk8WrZtMUgfX9yUoEbt1L1ydDJvsXfEiWtN8rKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l6lL8PmEhiPnkg3AaFYGvj4tEwYmxSUxj/M9olDGO5c+2bydQkvUmIdqo825Gr4Ge
	 r9Dji7LWBvIzsKzsw8ivu/rtRyeT6upVnAmsdFdw5F7fAdO1UOH3M4yFvGEwqsbY2w
	 edkV42ClQlkuaeU6BiHNs9RMb0RNl+a99g0Usyfr6WX7X+J428aYct34DXH56asG7R
	 2Qk0okBICHwgmhLN1EM3igCXkPbTkW7u/BXbaZXgAoLxjVuVDDfXUwc7NmgOBhgMXq
	 310/wBYOzv7hSleYDkp46A3WVSHgZoTKYM8+GCyq1u1wJb8H+1vUC9Z5II9ueFg/JC
	 D9NZ5HjbldLLw==
Date: Tue, 23 Jan 2024 19:32:54 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>,
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
Subject: Re: [PATCH 05/14] phy: ti: phy-j721e-wiz: make wiz_clock_init
 callable multiple times
Message-ID: <Za_HDoBeUC9sbh35@matsya>
References: <20240102-j7200-pcie-s2r-v1-0-84e55da52400@bootlin.com>
 <20240102-j7200-pcie-s2r-v1-5-84e55da52400@bootlin.com>
 <Za9oR8BpoufCRNIw@matsya>
 <d005e3c5-08b3-4a4f-b1ed-e02bde82c2f9@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d005e3c5-08b3-4a4f-b1ed-e02bde82c2f9@bootlin.com>

On 23-01-24, 09:20, Thomas Richard wrote:
> >>  
> >> -	ret = wiz_clock_init(wiz, node);
> >> +	ret = wiz_clock_init(wiz, node, true);
> > 
> > You are calling it one once? So what am I missing
> 
> In patch 6/14, wiz_clock_init is called in resume_noirq callback:
> 
> ret = wiz_clock_init(wiz, node, false);

noticed later, I think this would be useful to mention in changelog

-- 
~Vinod

