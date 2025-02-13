Return-Path: <linux-i2c+bounces-9449-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD19A35153
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 23:33:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 673483ACDB1
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 22:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 157C1245AF6;
	Thu, 13 Feb 2025 22:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cJoEHrj9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A2B28A2BF;
	Thu, 13 Feb 2025 22:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739486005; cv=none; b=AbagjUf43/YABJfPnDqlZjkadpkcHrbG41R0lC0uQ3Qy2TWkXdjdpC0qGdEJH/t4yesuW0TVPoxqx9aWOSs1Dq6/Sx4H077WJNugPN6dZE7zA3FHFqCxupwqWNIIARZxbfJOhY7GLEyfzCOCIIWE0bM1e26buVfJJkQX9fXFGlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739486005; c=relaxed/simple;
	bh=TRIAnB8VitLE/pUmop8YkBI6cYnjELHRNFNmhq/Uj7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nP1TtSSBqA692h0uBv5owrU1pcBUohuMQetFSzQ7Nyxt9prvkvppNmFlpR77BF2EDD1lBeRRyM5MmgzOpOX9DuVAom8qFVZ1PlqTqPxfCdil2QqAspN3jHmLNJe33m6IaM5ES5LrlyEI5YLP72uIuIAyT40L3ikfhU0Iv0hUeTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cJoEHrj9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3E5CC4CED1;
	Thu, 13 Feb 2025 22:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739486005;
	bh=TRIAnB8VitLE/pUmop8YkBI6cYnjELHRNFNmhq/Uj7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cJoEHrj99WqwPIH5PfHbYx96hbnHRHt4miW4kkjtKvy618sfqg7QpF2tUAVzQQGas
	 a3SK8OMXGa8BgOuSJCYZkGeVEEQiuJyqOeC1L7tN6Pen4d2nNityJMMYg/WhfFM1qb
	 UpXFh4qLpb5RwwW6P4604KVQSX+F8eZD44G3qy8Im61MPGonhcYWYFRgb3xN9O/Aaw
	 VkI4w6Jldco24qSJUzRps3vV5zEgaNZ56R2QKtZaoGWaCQWCoTURyPiXi2wrpgDKu2
	 4nbE0R8dIdd+D7Gkj6cRm21d46WSJ70zZ0rq/0dQsyOw7wRpWJ+UblNUv/nzzhAXnY
	 65zZmFZx+oDaQ==
Date: Thu, 13 Feb 2025 23:33:22 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Vitalii Mordan <mordan@ispras.ru>
Cc: Russell King <rmk@dyn-67.arm.linux.org.uk>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Fedor Pchelkin <pchelkin@ispras.ru>, 
	Alexey Khoroshilov <khoroshilov@ispras.ru>, Vadim Mutilin <mutilin@ispras.ru>, lvc-project@linuxtesting.org
Subject: Re: [PATCH v2] i2c: pxa: fix call balance of i2c->clk handling
 routines
Message-ID: <novywnbf7giauswdm7lt5n6cwjwchhxsvmixv5m7qurcb25wo6@4ajvllzecbra>
References: <20250212172803.1422136-1-mordan@ispras.ru>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212172803.1422136-1-mordan@ispras.ru>

Hi Vitalii,

On Wed, Feb 12, 2025 at 08:28:03PM +0300, Vitalii Mordan wrote:
> If the clock i2c->clk was not enabled in i2c_pxa_probe(), it should not be
> disabled in any path.
> 
> Found by Linux Verification Center (linuxtesting.org) with Klever.

here I added a blank line.

> Signed-off-by: Vitalii Mordan <mordan@ispras.ru>

...

> -	clk_prepare_enable(i2c->clk);
> +	ret = clk_prepare_enable(i2c->clk);
> +	if (ret) {
> +		return dev_err_probe(&dev->dev, ret,
> +				     "failed to enable clock\n");
> +	}

I removed the brackets here that are not necessary.

Merged to i2c/i2c-host.

Thanks,
Andi

>  
>  	if (i2c->use_pio) {
>  		i2c->adap.algo = &i2c_pxa_pio_algorithm;
> -- 
> 2.25.1
> 

