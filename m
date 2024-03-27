Return-Path: <linux-i2c+bounces-2631-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4B388F02D
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Mar 2024 21:34:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE2941C2C976
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Mar 2024 20:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 117F91534E4;
	Wed, 27 Mar 2024 20:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dZ0g5Tln"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B043B14F9E1;
	Wed, 27 Mar 2024 20:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711571634; cv=none; b=gUc4DOy6emzXt+AGJp2M8eDFr5rEtMhCmBIMLRJmDBMdhtxh3gZxjJC3IHbX8RNiYeafaHdKm9pT0qW7iEnz/t7ZyDC7j2xLCFTZBXKcasap2F/wii8vnPbHS+9ofsLFy85ceTkVFMzRjeQuNUd8mp0KrG480/q+8j2aChT+Fpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711571634; c=relaxed/simple;
	bh=rRoyxu+FoVr32d7zvCeJuaO1U99AvdvpOp4sRPoaSLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tcvHcy2og5tzxRwldjK874oG8ZlVfOQXeI3OmyuqdQ2R5zqsFkj7DnzXcEaEU6W1sRxYYLZWVLLD32FqcQ/RcuD779v6cyclLSm14eNI1wJEqen6t7EczwRCnT8M0lRmG+XZp0XdLaV1jOyEuoF+oSVrAujRc++C1+H/EvZ6kxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dZ0g5Tln; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9259EC433C7;
	Wed, 27 Mar 2024 20:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711571634;
	bh=rRoyxu+FoVr32d7zvCeJuaO1U99AvdvpOp4sRPoaSLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dZ0g5TlnUCghieJAW72UqUaU2lIIa/6hghcAqkJRZAp+RAq+3k/cZrZ57l5R7MeS2
	 TydlAKSSQZUnX+2T5p1QS75hSb72ep8uZvS/x07UsQuKkRaXozLuiQ0reoMN09MVC8
	 AIK6Ya8Aa/GiLS6827G4A7k8iVR6n5FNoOkhGY6DIqxoyQnxgT9oM/f23Oobo45pBa
	 WF66wSLY55QRYVhJdi8lQ1xKf9Ll6pqUD/1Abem9ZnyOidBaUuBaPLe5kxgZp4idaY
	 mSVgD8WJLridM75HDggtZeiLIOBIWZlD7LDMZcPES6jUj0d8jxODqikoVKY0tFlHTX
	 WAhfAy2yOWKcw==
Date: Wed, 27 Mar 2024 21:33:50 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Vinod Koul <vkoul@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Michal Simek <michal.simek@amd.com>, Eric Auger <eric.auger@redhat.com>, 
	Alex Williamson <alex.williamson@redhat.com>, linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-i2c@vger.kernel.org, linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-input@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH 01/19] amba: store owner from modules with
 amba_driver_register()
Message-ID: <6p4cdmbhrezm7fqbe3kgrkblqgrhaq4fgiw5x4n5dnptii7kjp@vmbj2pkjglp7>
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
 <20240326-module-owner-amba-v1-1-4517b091385b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240326-module-owner-amba-v1-1-4517b091385b@linaro.org>

Hi Krzysztof,

...

>  /**
> - *	amba_driver_register - register an AMBA device driver
> + *	__amba_driver_register - register an AMBA device driver
>   *	@drv: amba device driver structure
> + *	@owner: owning module/driver
>   *
>   *	Register an AMBA device driver with the Linux device model
>   *	core.  If devices pre-exist, the drivers probe function will
>   *	be called.
>   */
> -int amba_driver_register(struct amba_driver *drv)
> +int __amba_driver_register(struct amba_driver *drv,

...

> +/*
> + * use a macro to avoid include chaining to get THIS_MODULE
> + */

Should the documentation be moved here? Well... I don't see any
documentation linking this file yet, but in case it comes we want
documented amba_driver_register() rather than
__amba_driver_register().

Andi

> +#define amba_driver_register(drv) \
> +	__amba_driver_register(drv, THIS_MODULE)
> +

