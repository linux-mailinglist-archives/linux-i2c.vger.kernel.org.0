Return-Path: <linux-i2c+bounces-13666-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDB4BF03FA
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 11:41:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97906400FB9
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 09:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 759F72F7453;
	Mon, 20 Oct 2025 09:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t2MMRvxX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22DD2F7AA8;
	Mon, 20 Oct 2025 09:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760953125; cv=none; b=I1uVJtn6o5FnE+rfNowEWT8K3+7d9jTnTOon5C0tSEmc12tnRO2MTwN8QLRnKoRE2wB39+I2tfNsuVmyYnYjHN2TatQDDuZIY26AmoJCm/7FnInVDVLry97qFhDIbbrUAH3vCBXtseYcbaXp+FhPmQRkjt9ROEQveX8K1CVJPd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760953125; c=relaxed/simple;
	bh=VKCYuth/NqxGJoPPggikV+GdPYEkZJ8g3GjwRJo8xY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tg0KUka04Zde/O5zf0dC7B5OSg4UYt2VhTt6WnajKqpIlBDDfxrv1DD3WPz+Z3NvQIGjXcpI6wc3J+Qy3XiniI9Rep5hGs3x1//PcC51Rma3wWclHROz+5Oq4eCdcOFyLpidq0F2kvPZowp5++bqAObMEW/FLHUGkB0zXIsE4mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t2MMRvxX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 338F5C4CEF9;
	Mon, 20 Oct 2025 09:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760953125;
	bh=VKCYuth/NqxGJoPPggikV+GdPYEkZJ8g3GjwRJo8xY4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=t2MMRvxXkCGnLs2tcMpgxmjfhn8rEOYvprk0/eWT9SmVw8OadOiZokDelfq2F+/8n
	 KGolFiXETA/xLXKMKhzt/9aWJGBfKP5R69hZax6lsDOw7+VP4OqbJLOI9sMgYJu6lB
	 x6F7iZ3qMFheo3XH49PTDW3QePr8kXsX7Njh6uAmWFUp64PRuNLlaH45WUGazMb+3S
	 vgqKnXN/+Yo1XKgzZV4XMcWGgWtS5HSzSwk43RKhqp6v/4luk+vKQ4m21uTO125GNo
	 3qylZMK+PKY2+CfEtPtqxSOAH2i5VyyZe3uOqXfM0qMd62wNAwTIYoB66mrTIq2vgh
	 ZA9WpZVjk/auw==
Message-ID: <f5e7bb0d-205b-4c10-8c31-bf60e1e42b73@kernel.org>
Date: Mon, 20 Oct 2025 11:38:38 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] i2c: designware: Enable transfer with different
 target addresses
To: =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Dmitry Guzman <dmitry.guzman@mobileye.com>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev
References: <20251017-i2c-dw-v1-0-7b85b71c7a87@bootlin.com>
 <20251017-i2c-dw-v1-2-7b85b71c7a87@bootlin.com>
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20251017-i2c-dw-v1-2-7b85b71c7a87@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Benoît,

On 17/10/2025 16:59, Benoît Monin wrote:
> When i2c_dw_xfer() is called with more than one message, it sets the
> target address according to the first message. If any of the following
> messages have a different target address, the transfer finishes with
> an error.
> 
> Instead, if the next message has a different target address, wait until
> all previous messages are sent and the STOP condition is detected. This
> will complete the current part of the transfer. The next part is then
> handled by looping in i2c_dw_xfer(), calling i2c_dw_xfer_init() and
> i2c_dw_wait_transfer() until all messages of the transfer have been
> processed, or an error is detected.
> 
> The RESTART bit is now set after the first message of each part of the
> transfer, instead of just after the very first message of the whole
> transfer.
> 
> For each address change, i2c_dw_xfer_init() is called, which takes care
> of disabling the adapter before changing the target address register,
> then re-enabling it. Given that we cannot know the value of the
> I2C_DYNAMIC_TAR_UPDATE parameter, this is the only sure way to change
> the target address.

I have the problem described here:

https://lore.kernel.org/linux-i2c/ee6afdd7-3117-43cd-831f-e0ec5ee46f46@kernel.org/

And it looks like this patch is intended to solve that problem (one transaction
with two writes to different target addresses).

I tried this patch, but it doesn't work. Instead I get a time out:

[  111.695238] i2c_designware 1f00074000.i2c: controller timed out

Is it indeed meant to solve the problem I have or is it addressing another
issue?

I'm happy to help test patches.

Regards,

	Hans

> 
> Based on the work of Dmitry Guzman <dmitry.guzman@mobileye.com>
> 
> Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
> ---
>  drivers/i2c/busses/i2c-designware-master.c | 58 ++++++++++++++++--------------
>  1 file changed, 31 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index c7a72c28786c2..f9a180b145da8 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -436,6 +436,7 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
>  	u8 *buf = dev->tx_buf;
>  	bool need_restart = false;
>  	unsigned int flr;
> +	int first_idx = dev->msg_write_idx;
>  
>  	intr_mask = DW_IC_INTR_MASTER_MASK;
>  
> @@ -446,11 +447,11 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
>  		 * If target address has changed, we need to
>  		 * reprogram the target address in the I2C
>  		 * adapter when we are done with this transfer.
> +		 * This can be done after STOP_DET IRQ flag is raised.
> +		 * So, disable "TX FIFO empty" interrupt.
>  		 */
>  		if (msgs[dev->msg_write_idx].addr != addr) {
> -			dev_err(dev->dev,
> -				"%s: invalid target address\n", __func__);
> -			dev->msg_err = -EINVAL;
> +			intr_mask &= ~DW_IC_INTR_TX_EMPTY;
>  			break;
>  		}
>  
> @@ -465,7 +466,7 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
>  			 * set restart bit between messages.
>  			 */
>  			if ((dev->master_cfg & DW_IC_CON_RESTART_EN) &&
> -					(dev->msg_write_idx > 0))
> +					(dev->msg_write_idx > first_idx))
>  				need_restart = true;
>  		}
>  
> @@ -822,7 +823,6 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>  		break;
>  	}
>  
> -	reinit_completion(&dev->cmd_complete);
>  	dev->msgs = msgs;
>  	dev->msgs_num = num;
>  	dev->cmd_err = 0;
> @@ -841,18 +841,33 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>  	if (ret < 0)
>  		goto done;
>  
> -	/* Start the transfers */
> -	i2c_dw_xfer_init(dev);
> +	do {
> +		reinit_completion(&dev->cmd_complete);
>  
> -	/* Wait for tx to complete */
> -	ret = i2c_dw_wait_transfer(dev);
> -	if (ret) {
> -		dev_err(dev->dev, "controller timed out\n");
> -		/* i2c_dw_init_master() implicitly disables the adapter */
> -		i2c_recover_bus(&dev->adapter);
> -		i2c_dw_init_master(dev);
> -		goto done;
> -	}
> +		/* Start the transfers */
> +		i2c_dw_xfer_init(dev);
> +
> +		/* Wait for tx to complete */
> +		ret = i2c_dw_wait_transfer(dev);
> +		if (ret) {
> +			dev_err(dev->dev, "controller timed out\n");
> +			/* i2c_dw_init_master() implicitly disables the adapter */
> +			i2c_recover_bus(&dev->adapter);
> +			i2c_dw_init_master(dev);
> +			goto done;
> +		}
> +
> +		if (dev->msg_err) {
> +			ret = dev->msg_err;
> +			goto done;
> +		}
> +
> +		/* We have an error */
> +		if (dev->cmd_err == DW_IC_ERR_TX_ABRT) {
> +			ret = i2c_dw_handle_tx_abort(dev);
> +			goto done;
> +		}
> +	} while (dev->msg_write_idx < num);
>  
>  	/*
>  	 * This happens rarely (~1:500) and is hard to reproduce. Debug trace
> @@ -874,23 +889,12 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>  	 */
>  	__i2c_dw_disable_nowait(dev);
>  
> -	if (dev->msg_err) {
> -		ret = dev->msg_err;
> -		goto done;
> -	}
> -
>  	/* No error */
>  	if (likely(!dev->cmd_err && !dev->status)) {
>  		ret = num;
>  		goto done;
>  	}
>  
> -	/* We have an error */
> -	if (dev->cmd_err == DW_IC_ERR_TX_ABRT) {
> -		ret = i2c_dw_handle_tx_abort(dev);
> -		goto done;
> -	}
> -
>  	if (dev->status)
>  		dev_err(dev->dev,
>  			"transfer terminated early - interrupt latency too high?\n");
> 


