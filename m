Return-Path: <linux-i2c+bounces-4902-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F54692E46F
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 12:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0E501C20E65
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 10:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E5015AD95;
	Thu, 11 Jul 2024 10:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IjIkTiBu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2147157A59;
	Thu, 11 Jul 2024 10:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720693280; cv=none; b=FKnL6yLxsLYFa2Equ4ZHtvFtJQ8etjGkbmFQDTTMArUEEDkjNx9e036b5RzRPdYiXy9hPlVwHmqGU8nGghMUFGWDgba2XmeCuPwsk06uVG312tXBRb9C4oEvkRlbgODgn/le+U0JjRPxybt2TSLpzkW3/ZrNt1m5gBQ5D+fcmH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720693280; c=relaxed/simple;
	bh=QcQ0uibM7EwQ7o/FHK5UXHNCLMrQ9cs3EDuWA5Tleeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b63UXuRoXFWdV687DNktIB/LJZJV/mc9IWEwsMu5SFhqo0bKYI8+7tXFmwz5n/fBxwLkubnSlkIIrBaGc68UBxuEl5IweRedv9zE30nSIk0B4N/5E4CAlL+Jt3zDzt2xl85ZWrqBAsBz1gbWeRXDlRh4l0puSmwixyU9WEWxDNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IjIkTiBu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBF79C4AF07;
	Thu, 11 Jul 2024 10:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720693280;
	bh=QcQ0uibM7EwQ7o/FHK5UXHNCLMrQ9cs3EDuWA5Tleeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IjIkTiBu6kfCs4PM7aSws5NgW5r3xl4kbLC+f38PAVvigy/RSeQfze0KB8hbuviqK
	 zZXnC9drQVINaI5Vk6Sumwzs1q/m/frpSYR7VTONlOO5xmohkzPSsRRwDe3T+smn3F
	 TGAjVsQSL0AihfUN68jHi9GuNsc7wpmOGQNB/AZOgKqCKd0Jg7H13g5mCjnR3Sdo3X
	 hc4x8F2YGvepUaDsp61Mg7fPhcrtPkLfk2GLd5p1cQ9nvhWsXEGC6FjbSQH7s817vS
	 wXaY5qbiYi+YbqGJUbAuzGBOEvmyiOJdyfGh4DRTyZzQx7KIWpjT/wqJSgT3ygrlAO
	 agk35CPbF548g==
Date: Thu, 11 Jul 2024 12:21:16 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 32/60] i2c: mv64xxx: reword according to newest
 specification
Message-ID: <6lnet5zr6giafoanwmqpcvkf5yzeyobvx4tnxz5pp5bnrmo6gx@csglsnqjmfrk>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-33-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-33-wsa+renesas@sang-engineering.com>

Hi Wolfram,

> diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
> index dc160cbc3155..29f94efedf60 100644
> --- a/drivers/i2c/busses/i2c-mv64xxx.c
> +++ b/drivers/i2c/busses/i2c-mv64xxx.c
> @@ -89,8 +89,8 @@ enum {
>  	MV64XXX_I2C_STATE_WAITING_FOR_RESTART,
>  	MV64XXX_I2C_STATE_WAITING_FOR_ADDR_1_ACK,
>  	MV64XXX_I2C_STATE_WAITING_FOR_ADDR_2_ACK,
> -	MV64XXX_I2C_STATE_WAITING_FOR_SLAVE_ACK,
> -	MV64XXX_I2C_STATE_WAITING_FOR_SLAVE_DATA,
> +	MV64XXX_I2C_STATE_WAITING_FOR_TARGET_ACK,
> +	MV64XXX_I2C_STATE_WAITING_FOR_TARGET_DATA,
>  };

OK, I managed to check and I couldn't find any definition about
the driver's state.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

