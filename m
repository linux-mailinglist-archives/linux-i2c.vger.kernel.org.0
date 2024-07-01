Return-Path: <linux-i2c+bounces-4566-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEF091EB3C
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jul 2024 01:01:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87ABB2826E7
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 23:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D95129A7E;
	Mon,  1 Jul 2024 23:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VhEgE1Gb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6D44779E;
	Mon,  1 Jul 2024 23:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719874873; cv=none; b=bCMe49J2JM/jG2iOphCpVwXxkDqdiodeqW5snK2WlLFhxHa38MN6JRcEQHDRQiaIIExsA3H85AIYz5A2xb1oKpDnjKNT5HkosY/u72KJjgOGPaRC01RMHU5Ilt/lYeZSqthwePJPzci8tCvYDPC1PTNzLfjhjXzRv+qS8lnnZ7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719874873; c=relaxed/simple;
	bh=W3Vxk0g1pjXqCDqBTLXUyC3ixrMsH+V96dlRAd3x/hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SA92k54oD3Md/knTUmq7bRWMxVcu0f10FBv94fwtJIzATdv3Ff2QIIA7v5DGkcWyFaaZgQgQ7SI2ekNQQCI8i/Op8+4e2kEJZ6HEIek9elNMsbpFmwabKW3oD8UvPxklT1MsE3naU6hcF89kl/D1OijNiBLLiHVBu5vE/H18uAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VhEgE1Gb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B814C116B1;
	Mon,  1 Jul 2024 23:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719874872;
	bh=W3Vxk0g1pjXqCDqBTLXUyC3ixrMsH+V96dlRAd3x/hg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VhEgE1Gb3mn356K3FyidO4QIGhj7cd8YL0q3wMUZlL5YDtJgntjhYvvI/KliAGfc1
	 jzokzB70tSOkpr3xy26PO54N6//3tedtBkjM+gp69CUmNIiQLG4za7RvFZGtx8pCqI
	 II1ERtUTOgyDfgI3EoRdBEOt0DX2ydklb+36T+rZwlXfAwyilDr8Ha5zItDZWJn7Qh
	 5yGERn8/9fPEAbTw/P13KKzwrt3kAKxeiGuBt4VAunFws1Lk9tSfv2fuZg29b0cmHF
	 ytRJdSZwFztlxXxdcVFKiFlcMKyDynGlrnE+g4TI4trNTdrZniEV6kDpOYtJcxUoyk
	 LTcH2wVKC/CPg==
Date: Tue, 2 Jul 2024 01:01:08 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Patch v6] i2c: pnx: Fix potential deadlock warning from
 del_timer_sync() call in isr
Message-ID: <dudh4jdce3yxwv5yw345gw23diwparhwvsl4jrpsyzpv3sgge3@ojtdgsdgwcor>
References: <20240628152543.281105-1-piotr.wojtaszczyk@timesys.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628152543.281105-1-piotr.wojtaszczyk@timesys.com>

Hi Piotr,

On Fri, Jun 28, 2024 at 05:25:42PM GMT, Piotr Wojtaszczyk wrote:
> When del_timer_sync() is called in an interrupt context it throws a warning
> because of potential deadlock. The timer is used only to exit from
> wait_for_completion() after a timeout so replacing the call with
> wait_for_completion_timeout() allows to remove the problematic timer and
> its related functions altogether.

nice patch! I still would like an ack from Vladimir.

> Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>

Fixes: 41561f28e76a ("i2c: New Philips PNX bus driver")
Cc: Vitaly Wool <vitaly.wool@konsulko.com>
Cc: <stable@vger.kernel.org> # v2.6.20+

...

> @@ -653,7 +624,10 @@ static int i2c_pnx_probe(struct platform_device *pdev)
>  	alg_data->adapter.algo_data = alg_data;
>  	alg_data->adapter.nr = pdev->id;
>  
> -	alg_data->timeout = I2C_PNX_TIMEOUT_DEFAULT;
> +	alg_data->timeout = msecs_to_jiffies(I2C_PNX_TIMEOUT_DEFAULT);
> +	if (alg_data->timeout <= 1)
> +		alg_data->timeout = 2;

I don't see the need for this check. The default timeout is
defined as 10.

Thanks,
Andi

