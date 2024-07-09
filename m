Return-Path: <linux-i2c+bounces-4805-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A6B92C5AB
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 23:45:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63FE41F238C1
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 21:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70FE818785D;
	Tue,  9 Jul 2024 21:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p6xNyFyJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23675187849;
	Tue,  9 Jul 2024 21:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720561525; cv=none; b=ezS2kw3wD6zGEdqfUBwXiTvnJmQkCN9PkrrhVzSRYmop8zKaWipYXPJMXB1U4HKu+rnMz1pYJq6eUGgEdjUkmTsmuPB3uA1Z39D5Xsr0Caj9BN9Gop62JpLhjIsb41leFd7ZcO8esChY4YpuVarBUwXNtM8WeKSk0tKjsneebbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720561525; c=relaxed/simple;
	bh=qop2Iwp1SAnb+Bq0UzmGOVHr4sLRB2W2Cn57MNwfMdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ucSWaKcTIdzBvsBSmUrBJRx89vn0gzg2ABabrOaYbi5XvQURWnSh3vi3ReDujGdRNs1fhSGAdR2c6qV2wXCXg/WD0+NlecIMYhKfjH2b2WTONuLorafjJR/I7LIwY0IRYpriZZukP1TZgDHwxzbcPBC2PV8ISTZW5BF3ltCM998=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p6xNyFyJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6048EC3277B;
	Tue,  9 Jul 2024 21:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720561524;
	bh=qop2Iwp1SAnb+Bq0UzmGOVHr4sLRB2W2Cn57MNwfMdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p6xNyFyJ1UcI/HKsI69DBtZGMVCEEg9F+Yw4Rl292/GXQmcOz56yxTh0X+Lz6plah
	 ix3ABCu2SNcENi3IENsjB55X6dpyCcpp1qgIyAYz/Pa8aLGFpIoa8ym7GpoKWlQ1WK
	 0gOKXN52Uv2Y4bPQOarvVTey+NQt8BK479kFxDQWgW+o4cc8P3Z9Sk9SddJNfJEiy2
	 qgjs8ctmae/1lFfMJ5xTv5Zb6ZytzywZB5qA+3EUUeR1B2kcxkfeaIcZXHSaOaiCI1
	 FBQtD2mB9GSJ9+/vM2MICGgi6hxEj+8fmTUIKrj2/8oPRV8H8cl4pyNmnB9fLGZsVA
	 pfnEXp/AMlMlQ==
Date: Tue, 9 Jul 2024 23:45:21 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Korsgaard <peter.korsgaard@barco.com>, Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Herve Codina <herve.codina@bootlin.com>, 
	Christopher Cordahi <christophercordahi@nanometrics.ca>
Subject: Re: [PATCH v3 0/3] i2c: mux: gpio: Add 'settle-time-us' property
Message-ID: <oupp5mr6llnt43e6bbw2hbzlbru54wyqjxvfrwidfg6rojzdaj@v5ldbpldldpw>
References: <20240617120818.81237-1-bastien.curutchet@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617120818.81237-1-bastien.curutchet@bootlin.com>

Hi Peter,

any thoughts on this. Do you want me to go ahead and pick this
series up?

Andi

On Mon, Jun 17, 2024 at 02:08:15PM GMT, Bastien Curutchet wrote:
> Hi all,
> 
> The i2c-gpio-mux can be used to describe a multiplexer built upon
> several i2c isolators having an enable pin (such as LTC4310):
> 
>  +---------------+                     +------+  +------+
>  | +-----------+ |                     | dev  |  | dev  |
>  | | GPIO_EN_A |-|-----------|         +------+  +------+
>  | +-----------+ |     +-----+---+         |         |
>  |               |  |--| isol. A |---------+---------+
>  |     +-----+   |  |  +---------+
>  | SOC | I2C |---|--|
>  |     +-----+   |  |  +---------+
>  |               |  |--| isol. B |------+---------+---------+
>  | +-----------+ |     +-----+---+      |         |         |
>  | | GPIO_EN_B |-|-----------|      +------+  +------+  +------+
>  | +-----------+ |                  | dev  |  | dev  |  | dev  |
>  +---------------+                  +------+  +------+  +------+
> 
> These isolators often need some time between their enable pin's
> assertion and the first i2c transfer. If the first i2c transfer
> happens before this enabling time is reached, transfer fails.
> 
> There is no available option to configure such a time in the
> i2c-gpio-mux driver.
> 
> Add a optional property in the bindings called 'transition-delay-us'.
> If present, driver waits for this delay every time a new bus is
> selected, i.e. before returning from the bus_select() callback.
> 
> Changes in v2:
>  * Rewrite bindings' commit log
>  * Express the 'transition delay' in us instead of ms
> 
> Changes in v3:
>  * Rename DT property to 'settle-time-us'
>  * Use fsleep instead of udelay
> 
> [v1] : https://lore.kernel.org/all/20240527113908.127893-1-bastien.curutchet@bootlin.com/
> [v2] : https://lore.kernel.org/all/20240529091739.10808-1-bastien.curutchet@bootlin.com/
> 
> Bastien Curutchet (3):
>   dt-bindings: i2c: gpio: Add 'settle-time-us' property
>   i2c: mux: gpio: Re-order #include to match alphabetic order
>   i2c: mux: gpio: Add support for the 'settle-time-us' property
> 
>  .../devicetree/bindings/i2c/i2c-mux-gpio.yaml      |  3 +++
>  drivers/i2c/muxes/i2c-mux-gpio.c                   | 14 ++++++++++----
>  include/linux/platform_data/i2c-mux-gpio.h         |  2 ++
>  3 files changed, 15 insertions(+), 4 deletions(-)
> 
> -- 
> 2.45.0
> 

