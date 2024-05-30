Return-Path: <linux-i2c+bounces-3711-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DD48D466C
	for <lists+linux-i2c@lfdr.de>; Thu, 30 May 2024 09:49:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E6DB0B229D5
	for <lists+linux-i2c@lfdr.de>; Thu, 30 May 2024 07:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC137406D;
	Thu, 30 May 2024 07:49:23 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846CC142E94;
	Thu, 30 May 2024 07:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717055363; cv=none; b=StDKBgL7Ovp1YOOL7L8n6XK2ZqNi6LpJ2bAkVDpgwp5FLAsrc+JzSoQOWQkQAxZAhTh+0ri0jH+UCk0j9qaIUfp1okv9WKUEg/21NYwVxPmaIU+atcyhCYluTC5JraQ8wYv29t0r0ZJipdfhPjX8llafyujhlZvEkMJqsxJEn1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717055363; c=relaxed/simple;
	bh=+YvBVbZzFbc+gKXJ23pL38vrpx7TOwOwxpEq+ky160I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u3WBcMbLR7zcBlmdVqBzRWaYHOetpQa8ljCEg6aKhWRQzr4MDmCo//iXBp+QmSmG9LSjL+j6EAAUPqa21NByNWVpDZPDHyFPrVFGb4hxlurTYnQ2qzRgYTcwZCgQVEKO+pikM1NpqkMW9Ea2ctKnyNs9sjGVuq3WCfftzkGrv3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [141.14.13.3] (g258.RadioFreeInternet.molgen.mpg.de [141.14.13.3])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id E42EE61E5FE01;
	Thu, 30 May 2024 09:47:45 +0200 (CEST)
Message-ID: <2774cb4c-4eea-4bf5-8b2b-438adf18448d@molgen.mpg.de>
Date: Thu, 30 May 2024 09:47:44 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: aspeed: Update the stop sw state when the bus
 recovry occurs
To: Tommy Huang <tommy_huang@aspeedtech.com>
Cc: brendan.higgins@linux.dev, benh@kernel.crashing.org, joel@jms.id.au,
 andi.shyti@kernel.org, andrew@codeconstruct.com.au, wsa@kernel.org,
 BMC-SW@aspeedtech.com, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240530070656.3841066-1-tommy_huang@aspeedtech.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20240530070656.3841066-1-tommy_huang@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Tommy,


Thank you for your patch.

Am 30.05.24 um 09:06 schrieb Tommy Huang:
> When the i2c bus recovey occurs, driver will send i2c stop command

recove*r*y

> in the scl low condition. In this case the sw state will still keep
> original situation. Under multi-master usage, i2c bus recovery will

What is the user visible problem?

> be called when i2c transfer timeout occurs. Update the stop command
> calling with aspeed_i2c_do_stop function to update master_state.

How can this be tested?

> Fixes: f327c686d3ba ("i2c: aspeed: added driver for Aspeed I2C")
> 

The blank line can be removed.

> Signed-off-by: Tommy Huang <tommy_huang@aspeedtech.com>
> ---
>   drivers/i2c/busses/i2c-aspeed.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index ce8c4846b7fa..32f8b0c1c174 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -169,6 +169,7 @@ struct aspeed_i2c_bus {
>   };
>   
>   static int aspeed_i2c_reset(struct aspeed_i2c_bus *bus);
> +static void aspeed_i2c_do_stop(struct aspeed_i2c_bus *bus);
>   
>   static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
>   {
> @@ -187,7 +188,7 @@ static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
>   			command);
>   
>   		reinit_completion(&bus->cmd_complete);
> -		writel(ASPEED_I2CD_M_STOP_CMD, bus->base + ASPEED_I2C_CMD_REG);
> +		aspeed_i2c_do_stop(bus);
>   		spin_unlock_irqrestore(&bus->lock, flags);
>   
>   		time_left = wait_for_completion_timeout(


Kind regards,

Paul

