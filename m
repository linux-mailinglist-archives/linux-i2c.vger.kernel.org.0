Return-Path: <linux-i2c+bounces-7177-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D109998D1CC
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 12:59:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 770D2B25DB7
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 10:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE0171E766B;
	Wed,  2 Oct 2024 10:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vD/lUdq2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD63D16F27E;
	Wed,  2 Oct 2024 10:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727866659; cv=none; b=NXFur23X2yqXcwYcvjBjE4yzRaaU/TSvJ0b/BXzwXO+b9V05hcNDylsjl6GWVLo8L2tt/w1nwaZTE1kHx/av0nPTjWliOwg1Of67/2eIXEZnEkk1b7exhatWwhNnY/nQmnrYbO/02OXWlGUkJd0FcQyw4ocTIE8CfrOA4u965rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727866659; c=relaxed/simple;
	bh=G9SzAobm3g3SnzbxhcME9zoZwNPjZJz7K1/jidFzhqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pyvutC0Rrh2kpAgkfkql9i4FWqABc48NVazb9i+Qvg4L1odmp0TzJgon8Xs+900LFwH5550n/XSibqDDpi2Tx6ZUi0FkjC90F0J8M56ZSDIXNA9Z4a0F/o1kLnuxOXVH/boiVkAHXThT9VmXrh8Ov9WJH/IY6D7v/3ci7WV3IQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vD/lUdq2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 329DBC4CED5;
	Wed,  2 Oct 2024 10:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727866659;
	bh=G9SzAobm3g3SnzbxhcME9zoZwNPjZJz7K1/jidFzhqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vD/lUdq24sGHEdnBRFaDi9TZZtKVnUgMUznjCvPD3HarWJY9kP0vZ7ZRUbAh9Qs0B
	 3tAoTqcK3JyomRQdR6IaPAXZ1ycUUWwfKWzqmVf6OUXpDvkoVTOVMmt4sSuVTc6iia
	 wxw3pjqwDO2KWsi08EHi2tOLaMh+jh2MWkUMUoTbpygeE2kqsLdD09i6Cl6yFtEtmK
	 2AJNnTVsxNUMxUvEHbIvMAUBP7Jc+k+yNPO0KDE2X/lwwdwRqAN9nAKMc/0sIyb2yq
	 0uwtVY5fjiMIX7vfp9k7OEbdrTz5+E3x7kS6dTFHwIV/W4VWcfPCuCJC7p34khLFQl
	 QV9zcXS8o7s1w==
Date: Wed, 2 Oct 2024 12:57:36 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fixup! i2c: Add driver for the RTL9300 I2C controller
Message-ID: <rldg7q2je4alzn2qridg4ls5vakwioaphquog24jejwynmfd6z@2irqdiizethm>
References: <20240925215847.3594898-7-chris.packham@alliedtelesis.co.nz>
 <20240929200934.965955-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240929200934.965955-1-chris.packham@alliedtelesis.co.nz>

Hi Chris,

On Mon, Sep 30, 2024 at 09:09:34AM GMT, Chris Packham wrote:
> Hi Andi,
> 
> This is a fixup for the spare complaint from the kernel test robot
> https://lore.kernel.org/lkml/202409291025.P4M4O1F2-lkp@intel.com/#t
> 
> Not sure if you want to fold this into what is already in
> andi-shyti/i2c/i2c-host or if you want me to send it as a new patch.

no worries, I can take care of it.

Andi

> ---
>  drivers/i2c/busses/i2c-rtl9300.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
> index ed9a45a9d803..f0bb0ede79ce 100644
> --- a/drivers/i2c/busses/i2c-rtl9300.c
> +++ b/drivers/i2c/busses/i2c-rtl9300.c
> @@ -318,7 +318,7 @@ static const struct i2c_algorithm rtl9300_i2c_algo = {
>  	.functionality	= rtl9300_i2c_func,
>  };
>  
> -struct i2c_adapter_quirks rtl9300_i2c_quirks = {
> +static struct i2c_adapter_quirks rtl9300_i2c_quirks = {
>  	.flags		= I2C_AQ_NO_CLK_STRETCH,
>  	.max_read_len	= 16,
>  	.max_write_len	= 16,
> -- 
> 2.46.2
> 

