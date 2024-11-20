Return-Path: <linux-i2c+bounces-8077-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA449D33F4
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 08:03:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18AA91F2419A
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 07:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB72116EBEE;
	Wed, 20 Nov 2024 07:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PO/GJ28P"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA9F1662F1;
	Wed, 20 Nov 2024 07:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732086154; cv=none; b=DfpsiFl/nLVCE7I1fG9+WtDZDhNQTffLxReel7LUOVBTubkk2XhP7Bfx5CHge/LlNWE5hnoMBHVbVrNFk3NOS1aWSs0e5nXtol1DZE6bWjrIpNeYtJh0m+4OBfoEMmdY1InqxNtDn9fQRuN2pGXI14L/iqeMMpx/j3nNKWKHiWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732086154; c=relaxed/simple;
	bh=1V+lROt7o3roFGG9XlSfD0KUf/yppNvuAk1fHarFLjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dp5HomwkRKjgR68voCMyOFChz5qlqFBqbuHFRx3tOr3sE92roIfFGxdiXcerqcCwDb13zVWxOmTPKYDhNr9rTS8K2tBT8/MSu1IhtLTyRd5+w/wVGgbPX67AJo45GOnaYUw9ociq69gvClu7xnlsCnVOlfi4UBBjIW9PXsXcDN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PO/GJ28P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A58BC4CED0;
	Wed, 20 Nov 2024 07:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732086154;
	bh=1V+lROt7o3roFGG9XlSfD0KUf/yppNvuAk1fHarFLjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PO/GJ28PqyJ83SlHBFNymbZzjig4P5QqrK99dPHKrG29wUGBJH0fMcb3fyDNcQMTP
	 z6NuJiUwwstfGTeSu/nbpSrB+cgrHF4GI83RgxJORFaPI6aEMRusYT7ZB29ymwsak6
	 eKEU0oCp+61L5IGF6ncStrW6LhUuVqkcgrC/QkzjDn2XGOFhMiFaMPVpaf/s0ljhL5
	 bxkLRk35Kyvc484129SV5x0T5cJ+zx/ZZflf6kzJqdnIxJF5jZ6FgaPqecbZ4JzenY
	 ttX196tzCgPQl4L1mLhb1qY7G4wOt/wb1PU+Ap5aCOWO8i+wAhfbjAMuKF5IsCRYiN
	 1odhIRO+8Xzxg==
Date: Wed, 20 Nov 2024 08:02:30 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	blake.vermeer@keysight.com, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v2 3/5] i2c: Congatec Board Controller i2c bus driver
Message-ID: <vrbdmnhekuw3p4zf7xlztd3pf2mgedhrgmfgmryzcyqsuwywhj@p5yhisrggti2>
References: <20240503-congatec-board-controller-v2-0-681511a01c8f@bootlin.com>
 <20240503-congatec-board-controller-v2-3-681511a01c8f@bootlin.com>
 <lfh3asa2bmy73c4otgtbpr6l2wmjn7btsqzy6zv22sjots53a6@axonub5u454l>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lfh3asa2bmy73c4otgtbpr6l2wmjn7btsqzy6zv22sjots53a6@axonub5u454l>

Hi Thomas,

On Tue, Nov 19, 2024 at 11:41:36PM +0100, Andi Shyti wrote:
> Hi Thomas,
> 
> ...
> 
> > +static struct platform_driver cgbc_i2c_driver = {
> > +	.driver = {
> > +		.name = "cgbc-i2c",
> > +	},
> > +	.probe		= cgbc_i2c_probe,
> > +	.remove_new	= cgbc_i2c_remove,
> 
> Please use "remove" now.

please ignore this comment.

Andi

