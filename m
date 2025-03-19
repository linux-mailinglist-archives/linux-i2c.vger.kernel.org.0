Return-Path: <linux-i2c+bounces-9923-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FBFA69CD7
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 00:47:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86A6F189C581
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 23:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D04224230;
	Wed, 19 Mar 2025 23:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RXo2K4+1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B9C290F;
	Wed, 19 Mar 2025 23:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742428019; cv=none; b=PxkXQHXjLqwgLnV0zT848wI2eg2CWvCNcdTm4W6TLhk92IHRYySx+g9k30ipIf3bBKtkoSyb0whLTDnA2E4vAZ5yHheYr0scP3jAKLtcNq3ZkoA5cOhjyGwW26KHooLxacg3yN7Tqz5MPTvoktmm0eiTuZXEsVbJgjbEUX+yWR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742428019; c=relaxed/simple;
	bh=798Ih5yzvMQU6lYpe+ZBQ5F9xOjwj5zqAJyQfdmFkkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jkpY/LcSxqVLwIFQswOZ8SiMcXqDNlflDM/gc9X5sPi39SvYVaYLuMlIp+PQpoW7yfCANBz2qQv+76MXxs/86sdYljWd0H9iI7avRuZ9sFdbwS2S3o3HbIDfSLjUPTFPlwiJ2mOgkMEMrePGL6jERvHTBoMnbhO8naEKbOXNGcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RXo2K4+1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8994C4CEE4;
	Wed, 19 Mar 2025 23:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742428017;
	bh=798Ih5yzvMQU6lYpe+ZBQ5F9xOjwj5zqAJyQfdmFkkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RXo2K4+1q8pOnw93gz1wbyn2rt+YDESBMFwbGIAgzp4Brt8q/Ev4rrGM0FDqiz7uI
	 Lo920Hegde800RPe2WKDD6PaZDgKn9RBRfnqClmFnKDt/5eG7/Z7ZZdebS08npa1vf
	 UZbu5/MuNYbq9Q1RU1hkSNSC+pX2+a92NGZovSzMtu2xNsg3qqqriWfwj48uL18kST
	 5O9M96ELoSAt/76B+q23BPobREeERb00zi67M9xh0DkcttFYpJc2iO72GDBB3fYpNb
	 86FIoxeG7SyGQDitofKQhfq7TQMQUV3TKq74vuLkBx0IU2P9P6e34WGyHCGO4TBLJn
	 5OUIKH6Zz1Hng==
Date: Thu, 20 Mar 2025 00:46:53 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, 
	Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Kory Maincent <kory.maincent@bootlin.com>, 
	Cosmin Tanislav <demonsingur@gmail.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-media@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v9 0/9] misc: Support TI FPC202 dual-port controller
Message-ID: <avat6oilygpkcngtpuyentyvjqifav4f3zzvrtnsdybfl6uqja@i2surd4ywu73>
References: <20250306-fpc202-v9-0-2779af6780f6@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-fpc202-v9-0-2779af6780f6@bootlin.com>

Hi,

> Romain Gantois (9):
>       dt-bindings: misc: Describe TI FPC202 dual port controller
>       media: i2c: ds90ub960: Replace aliased clients list with address list
>       media: i2c: ds90ub960: Protect alias_use_mask with a mutex
>       i2c: use client addresses directly in ATR interface
>       i2c: move ATR alias pool to a separate struct
>       i2c: rename field 'alias_list' of struct i2c_atr_chan to 'alias_pairs'
>       i2c: support per-channel ATR alias pools
>       i2c: Support dynamic address translation
>       misc: add FPC202 dual port controller driver
> 
>  .../devicetree/bindings/misc/ti,fpc202.yaml        |  94 ++++
>  MAINTAINERS                                        |   7 +
>  drivers/i2c/i2c-atr.c                              | 483 ++++++++++++++-------
>  drivers/media/i2c/ds90ub913.c                      |   9 +-
>  drivers/media/i2c/ds90ub953.c                      |   9 +-
>  drivers/media/i2c/ds90ub960.c                      |  49 ++-
>  drivers/misc/Kconfig                               |  12 +
>  drivers/misc/Makefile                              |   1 +
>  drivers/misc/ti_fpc202.c                           | 438 +++++++++++++++++++
>  include/linux/i2c-atr.h                            |  54 ++-
>  10 files changed, 965 insertions(+), 191 deletions(-)

how are we going to take this? I think we are at the last bits of
reviews and it's time to plan merging this series.

Do we need to wait for media and then take i2c? Or shall wee take
everything via i2c.

I had a look at the whole series and looks quite all right to me.

Andi

