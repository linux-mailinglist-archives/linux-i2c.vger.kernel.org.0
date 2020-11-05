Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C3342A7B77
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Nov 2020 11:16:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbgKEKP4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Nov 2020 05:15:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:39328 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726067AbgKEKP4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 5 Nov 2020 05:15:56 -0500
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E4E332087D;
        Thu,  5 Nov 2020 10:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604571355;
        bh=JUCNE9CUo/Zy5ahG3o2CBdGwYq96GfXTBKkF6jXHMQE=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=p7t9s+LGni3o8A34E6kdCde9kGiPPPFwfhxJHdPfNwePHO9WmC7/kK2PYche9V5Yj
         uyAZfdhm4w1VoNGUnKJrxNGzRCs3hxAlybFv7z0BcDZeTPUp4e3WdBiLR372MmBgMH
         gvINVI8nSQ1uMDRBQaWrHDoBYRsno2faONWiqQxY=
Date:   Thu, 5 Nov 2020 11:15:51 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Lars Povlsen <lars.povlsen@microchip.com>
cc:     Rishi Gupta <gupt21@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        UNGLinuxDriver <UNGLinuxDriver@microchip.com>,
        linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: mcp2221: Fix GPIO output handling
In-Reply-To: <20201104220223.293253-1-lars.povlsen@microchip.com>
Message-ID: <nycvar.YFH.7.76.2011051115140.18859@cbobk.fhfr.pm>
References: <20201104220223.293253-1-lars.povlsen@microchip.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 4 Nov 2020, Lars Povlsen wrote:

> The mcp2221 driver GPIO output handling has has several issues.
> 
> * A wrong value is used for the GPIO direction.
> 
> * Wrong offsets are calculated for some GPIO set value/set direction
>   operations, when offset is larger than 0.
> 
> This has been fixed by introducing proper manifest constants for the
> direction encoding, and using 'offsetof' when calculating GPIO
> register offsets.
> 
> The updated driver has been tested with the Sparx5 pcb134/pcb135
> board, which has the mcp2221 device with several (output) GPIO's.

I believe we want also

Fixes: 328de1c519c5c092 ("HID: mcp2221: add GPIO functionality support")

here, right? I'll add that and apply, thanks.

> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
> ---
>  drivers/hid/hid-mcp2221.c | 48 +++++++++++++++++++++++++++++++--------
>  1 file changed, 39 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
> index 0d27ccb55dd9..4211b9839209 100644
> --- a/drivers/hid/hid-mcp2221.c
> +++ b/drivers/hid/hid-mcp2221.c
> @@ -49,6 +49,36 @@ enum {
>  	MCP2221_ALT_F_NOT_GPIOD = 0xEF,
>  };
>  
> +/* MCP GPIO direction encoding */
> +enum {
> +	MCP2221_DIR_OUT = 0x00,
> +	MCP2221_DIR_IN = 0x01,
> +};
> +
> +#define MCP_NGPIO	4
> +
> +/* MCP GPIO set command layout */
> +struct mcp_set_gpio {
> +	u8 cmd;
> +	u8 dummy;
> +	struct {
> +		u8 change_value;
> +		u8 value;
> +		u8 change_direction;
> +		u8 direction;
> +	} gpio[MCP_NGPIO];
> +} __packed;
> +
> +/* MCP GPIO get command layout */
> +struct mcp_get_gpio {
> +	u8 cmd;
> +	u8 dummy;
> +	struct {
> +		u8 direction;
> +		u8 value;
> +	} gpio[MCP_NGPIO];
> +} __packed;
> +
>  /*
>   * There is no way to distinguish responses. Therefore next command
>   * is sent only after response to previous has been received. Mutex
> @@ -542,7 +572,7 @@ static int mcp_gpio_get(struct gpio_chip *gc,
>  
>  	mcp->txbuf[0] = MCP2221_GPIO_GET;
>  
> -	mcp->gp_idx = (offset + 1) * 2;
> +	mcp->gp_idx = offsetof(struct mcp_get_gpio, gpio[offset].value);
>  
>  	mutex_lock(&mcp->lock);
>  	ret = mcp_send_data_req_status(mcp, mcp->txbuf, 1);
> @@ -559,7 +589,7 @@ static void mcp_gpio_set(struct gpio_chip *gc,
>  	memset(mcp->txbuf, 0, 18);
>  	mcp->txbuf[0] = MCP2221_GPIO_SET;
>  
> -	mcp->gp_idx = ((offset + 1) * 4) - 1;
> +	mcp->gp_idx = offsetof(struct mcp_set_gpio, gpio[offset].value);
>  
>  	mcp->txbuf[mcp->gp_idx - 1] = 1;
>  	mcp->txbuf[mcp->gp_idx] = !!value;
> @@ -575,7 +605,7 @@ static int mcp_gpio_dir_set(struct mcp2221 *mcp,
>  	memset(mcp->txbuf, 0, 18);
>  	mcp->txbuf[0] = MCP2221_GPIO_SET;
>  
> -	mcp->gp_idx = (offset + 1) * 5;
> +	mcp->gp_idx = offsetof(struct mcp_set_gpio, gpio[offset].direction);
>  
>  	mcp->txbuf[mcp->gp_idx - 1] = 1;
>  	mcp->txbuf[mcp->gp_idx] = val;
> @@ -590,7 +620,7 @@ static int mcp_gpio_direction_input(struct gpio_chip *gc,
>  	struct mcp2221 *mcp = gpiochip_get_data(gc);
>  
>  	mutex_lock(&mcp->lock);
> -	ret = mcp_gpio_dir_set(mcp, offset, 0);
> +	ret = mcp_gpio_dir_set(mcp, offset, MCP2221_DIR_IN);
>  	mutex_unlock(&mcp->lock);
>  
>  	return ret;
> @@ -603,7 +633,7 @@ static int mcp_gpio_direction_output(struct gpio_chip *gc,
>  	struct mcp2221 *mcp = gpiochip_get_data(gc);
>  
>  	mutex_lock(&mcp->lock);
> -	ret = mcp_gpio_dir_set(mcp, offset, 1);
> +	ret = mcp_gpio_dir_set(mcp, offset, MCP2221_DIR_OUT);
>  	mutex_unlock(&mcp->lock);
>  
>  	/* Can't configure as output, bailout early */
> @@ -623,7 +653,7 @@ static int mcp_gpio_get_direction(struct gpio_chip *gc,
>  
>  	mcp->txbuf[0] = MCP2221_GPIO_GET;
>  
> -	mcp->gp_idx = (offset + 1) * 2;
> +	mcp->gp_idx = offsetof(struct mcp_get_gpio, gpio[offset].direction);
>  
>  	mutex_lock(&mcp->lock);
>  	ret = mcp_send_data_req_status(mcp, mcp->txbuf, 1);
> @@ -632,7 +662,7 @@ static int mcp_gpio_get_direction(struct gpio_chip *gc,
>  	if (ret)
>  		return ret;
>  
> -	if (mcp->gpio_dir)
> +	if (mcp->gpio_dir == MCP2221_DIR_IN)
>  		return GPIO_LINE_DIRECTION_IN;
>  
>  	return GPIO_LINE_DIRECTION_OUT;
> @@ -758,7 +788,7 @@ static int mcp2221_raw_event(struct hid_device *hdev,
>  				mcp->status = -ENOENT;
>  			} else {
>  				mcp->status = !!data[mcp->gp_idx];
> -				mcp->gpio_dir = !!data[mcp->gp_idx + 1];
> +				mcp->gpio_dir = data[mcp->gp_idx + 1];
>  			}
>  			break;
>  		default:
> @@ -860,7 +890,7 @@ static int mcp2221_probe(struct hid_device *hdev,
>  	mcp->gc->get_direction = mcp_gpio_get_direction;
>  	mcp->gc->set = mcp_gpio_set;
>  	mcp->gc->get = mcp_gpio_get;
> -	mcp->gc->ngpio = 4;
> +	mcp->gc->ngpio = MCP_NGPIO;
>  	mcp->gc->base = -1;
>  	mcp->gc->can_sleep = 1;
>  	mcp->gc->parent = &hdev->dev;
> -- 
> 2.25.1
> 

-- 
Jiri Kosina
SUSE Labs

