Return-Path: <linux-i2c+bounces-5005-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BA7932FF1
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jul 2024 20:28:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AA1A1C22539
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jul 2024 18:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689F71A00F7;
	Tue, 16 Jul 2024 18:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bcFWZYdz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F81D1F171;
	Tue, 16 Jul 2024 18:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721154501; cv=none; b=PGox4qiQpvEH2gCbxEtZhk2e04y/2JPFkt+vVTTo5xw7oxUWW2kdtKktdkIUXR3KuEcM/+nIvbOUfEcOekdbpK0S2xZLs+NFwQBpTWYLjTSdqSJ2ZEgAgJbqc2gsu9+WvkggVTTmSL+NBYAzvLARM7/G3fxhpaZ1jE3zpXMpLY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721154501; c=relaxed/simple;
	bh=q81A/r1yKie6CegQ3amLDsb33PUczO4sSnrweyfcLDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQY6jj8RwXvamqpudwFpWS/GA19KhPlLNbB3/awPSnwIX8I8KUduI/0c1dVepBV2fsScycLw2PushcjsDFsqjB91LSfc+Mt2CuWUaEy0jpDg5slHYrUoi7EKXfIYk8c0PXzS3JSqv0kxjD1xuVtbzD+qCUxYzgFFVgiyduSt7bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bcFWZYdz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81A5BC116B1;
	Tue, 16 Jul 2024 18:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721154501;
	bh=q81A/r1yKie6CegQ3amLDsb33PUczO4sSnrweyfcLDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bcFWZYdzaqXvo2HSFibNf3wi8Y+6KOCrZSn8zPKCdyzxMycGLIF3mgYzjQXZGq0aL
	 VJJzdg7Y/0XB1KD+CZ8n9BRnAh7enJU2xDAFnXm4lfVd7srfExzyXJai4Jt2oBbGEe
	 TZdGGmxtiH7ZyKLZOfAYZfv0PzMal7gb0DqTwv46oGCSd6pBOvpNbU3vjQTu1qJuw0
	 QqZPhBZBOIXsEdTTBQbEvC9HHNMOLSbLaAQMmRGttCsz7mS9ybGdwwfpI3qM8nkIX6
	 mRyV/0Qh1T6l2WaALBCbYdYKUmQFrqJlvjSv0A+Ug6/X4mPyenmRhPl6CSV3FrHSWw
	 2Y8C8uhVxlLBg==
Date: Tue, 16 Jul 2024 20:28:17 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Korsgaard <peter.korsgaard@barco.com>, Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Herve Codina <herve.codina@bootlin.com>, 
	Christopher Cordahi <christophercordahi@nanometrics.ca>
Subject: Re: [PATCH v3 0/3] i2c: mux: gpio: Add 'settle-time-us' property
Message-ID: <7t5v2ercockg62r5zwlpi6vjgtcxlmckddzw5zljejjt56uq7b@2sw6eo2urjnd>
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

Hi Bastien,

with:

 - commit log fixed (gpio/mux-gpio)
 - int/u32 changed

applied to i2c/i2c-host

Thanks,
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

