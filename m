Return-Path: <linux-i2c+bounces-8065-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8279D309C
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 23:41:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28A231F23822
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 22:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84F801D1F63;
	Tue, 19 Nov 2024 22:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c/aGw7Vk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE441BBBD3;
	Tue, 19 Nov 2024 22:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732056099; cv=none; b=qrxMWvpH45Xmff5oj0RLUmH4Ce4Q4ENtGdxa8au59mWICOfmNKi+z388xS6Kv+QjmNA4tZE/qA7g6ZXjaM+Yr0xy91NHmItgCFTmMZuQhD2W/Du6H/zzmCPpusoZxTModOu6O/fuk2Drm89sN7tYRAlNZLbqR4sCWEqB+N5aAl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732056099; c=relaxed/simple;
	bh=71LU36mZUPbIC4riwRuXcYFpKCVgcCuZoQQ34L+KGnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CHgEOYOH9GBFMEAeOWIrtdAs2nG6iaqwFXV3lCs9K/VdLsHVBflC0OYPvb2ERq/SxCjMnTObPbytOu+DlFOEudGhfWO64Rmaklv+Kx9VhRtzALwBkvFenPyPZwokAbkB+qUGUyw2T2Dz1Zb3jGqxu6kkeZFNMYJOqhBysCN43dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c/aGw7Vk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53EFFC4CECF;
	Tue, 19 Nov 2024 22:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732056098;
	bh=71LU36mZUPbIC4riwRuXcYFpKCVgcCuZoQQ34L+KGnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c/aGw7VkZuedJAlvYw5YIu4eeEu2m2KQFPuD8V3t149i1QFrNZ0waUaB0fLcghyLI
	 rYoH0rUOeLuT/mmym6hNKglQTUjr7E7WVkjscWm3GLSx7HPRFTvF1xOLhme5W9zzah
	 XpFpyndhHI2yCsBe+wIkPYBt2sn9x5ICpIs+zGWdwayN+tne+v443NfeeI6klmktrx
	 EQpKBZT4S9Xw66CY3+EziID1KVg7xmBtwV34cF/zOVTPMJf9X+7eu3MRw+BrwDu+/i
	 ucaRFgf8iqVMvyuqs0COfYdO8KqtWH+1doOqgUPtlkOIJHwyWtQqnmnH+e4yoPqySX
	 r21WIU1JfmPtA==
Date: Tue, 19 Nov 2024 23:41:36 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	blake.vermeer@keysight.com, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v2 3/5] i2c: Congatec Board Controller i2c bus driver
Message-ID: <lfh3asa2bmy73c4otgtbpr6l2wmjn7btsqzy6zv22sjots53a6@axonub5u454l>
References: <20240503-congatec-board-controller-v2-0-681511a01c8f@bootlin.com>
 <20240503-congatec-board-controller-v2-3-681511a01c8f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503-congatec-board-controller-v2-3-681511a01c8f@bootlin.com>

Hi Thomas,

...

> +static struct platform_driver cgbc_i2c_driver = {
> +	.driver = {
> +		.name = "cgbc-i2c",
> +	},
> +	.probe		= cgbc_i2c_probe,
> +	.remove_new	= cgbc_i2c_remove,

Please use "remove" now.

Andi

