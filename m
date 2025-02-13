Return-Path: <linux-i2c+bounces-9450-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88016A35161
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 23:40:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26758188F84A
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 22:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 145FF26E14D;
	Thu, 13 Feb 2025 22:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LDaOMRT+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD14A2661B9;
	Thu, 13 Feb 2025 22:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739486413; cv=none; b=Dt0Geqik1rDxL4p+O4dWSZK2Y+deW4HlIctxO3rKMJnC/bMGnL7MLw1D5R/lWqKMKcq8R6ZMwGQ1lhAzIqRQYZ8Jx84b1RCYm0uQTKpLaTZ9OWDYCVrdTdosllao8lLCQV+5nnqyJXXLBqRkPTgInDCObyr4A7iSKei9OprB6GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739486413; c=relaxed/simple;
	bh=0ZOnBBooSu9QRCdFCYo96n8iF9G3PFZPyQIsWCF0pk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BT2UBmftwoMsosGY6/GlOmon5cbYCD+vgbVtP1J7lzz8mut2mzaPHeh/KnHjI3FhbLjsoRyLF/PJzrTG/8O3ckNAOQTD9Vqr8tzHIJX2hW5/uAgjjlPALVgpxKYFOwmM1pr+oS2SMHRG/3wbJsnu2LyI7nhS2Pn5wpZPd3sM2gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LDaOMRT+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B82A4C4CED1;
	Thu, 13 Feb 2025 22:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739486413;
	bh=0ZOnBBooSu9QRCdFCYo96n8iF9G3PFZPyQIsWCF0pk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LDaOMRT+uzhZjygG3ZKdmKi4aVHXqmFSkP4S4em1YBqZM/3NHQwWdOWk/XnIy3TI8
	 r7uzSQeUc5CnTiJM8IFGjV+6udouVUw+jJj/pBmC416kCsnsKqa5v/DwK2tN9+OtoD
	 qzHxDNBnBjcXH70HtaGX9nCwE4hysG3dyd8YyCsuzEZUNHEeRSzPXNJqHH8R05HMq5
	 k7uqKOoMpVDpebEzYSqs4h1iYkCCsvXQZ57wncKCWQIHeG8xW3QleMAGCws18psgNl
	 OOT43jMG0gRbfQIyaPSJIz8Vn/hwU95cgTOJ7x9WuAay7n9nhHNbHIzTxZiZGp8K4o
	 E1AlSHXlAU/GA==
Date: Thu, 13 Feb 2025 23:40:10 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, Krzysztof Adamski <krzysztof.adamski@nokia.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stefan Roese <sr@denx.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: Re: [PATCH v1 1/8] i2c: Introduce i2c_10bit_addr_from_msg()
Message-ID: <n7o3pkxkfw7jdvoce56jyxuzsnnpzkxaa2nrb725yut3i2twso@q7prmvzihysr>
References: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
 <20250212163359.2407327-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212163359.2407327-2-andriy.shevchenko@linux.intel.com>

Hi Andy,

On Wed, Feb 12, 2025 at 06:32:26PM +0200, Andy Shevchenko wrote:
> There are already a lot of drivers that have been using
> i2c_8bit_addr_from_msg() for 7-bit addresses, now it's time
> to have the similar for 10-bit addresses.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

> +static inline u8 i2c_10bit_addr_from_msg(const struct i2c_msg *msg)
> +{
> +	/*
> +	 * 10-bit address
> +	 *   addr_1: 5'b11110 | addr[9:8] | (R/nW)
> +	 *   addr_2: addr[7:0]
> +	 */
> +	return 0xf0 | ((msg->addr & GENMASK(9, 8)) >> 7) | (msg->flags & I2C_M_RD);
> +}
> +

I personally like this patch and it was an item of my todo list.
I'm OK with having it merged.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Andi

