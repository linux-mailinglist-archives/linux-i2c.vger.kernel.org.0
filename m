Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB1B849F58F
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jan 2022 09:47:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237823AbiA1IrT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jan 2022 03:47:19 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:44934 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240484AbiA1IrT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Jan 2022 03:47:19 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 3A4911F391;
        Fri, 28 Jan 2022 08:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1643359638; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fY/lSm8EzEnnwCDiVAHl0UiB6tFu/37NEmoH6LZYNVo=;
        b=d7WOtP2QmSf7v9hN0MO3ogKKiashVMfzsACJyilCGDAKftJ3hhTrocgf2NDB9N0xEO4kyW
        pCzAmAc278mheJc00OT+ifbbRCZRQjhAjFpNsrKwbfvj6o9VVoHo0bJ4ijbIIlDqi25dTB
        lfvGIcbU5XiY/NFxaXsLBGKflQYcvE0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1643359638;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fY/lSm8EzEnnwCDiVAHl0UiB6tFu/37NEmoH6LZYNVo=;
        b=drnnON7D0ria5vTj/fdDSRkVFqWTMNnGUE667XceqQENbfMJvokbs0BxjG8V/fW3ZHSJt1
        LmSFq+p6diSp+UAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1D1A413A66;
        Fri, 28 Jan 2022 08:47:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id beqqBpat82FjZQAAMHmgww
        (envelope-from <iivanov@suse.de>); Fri, 28 Jan 2022 08:47:18 +0000
Date:   Fri, 28 Jan 2022 10:47:17 +0200
From:   "Ivan T . Ivanov" <iivanov@suse.de>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Phil Elwell <phil@raspberrypi.org>
Subject: Re: [PATCH] i2c: bcm2835: Set clock-stretch timeout to 35ms
Message-ID: <20220128084717.rbvbciprfqen4rvb@suse>
References: <20220117102504.90585-1-iivanov@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220117102504.90585-1-iivanov@suse.de>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 01-17 11:25, Ivan T. Ivanov wrote:
> Date: Mon, 17 Jan 2022 11:25:04 +0100
> From: "Ivan T. Ivanov" <iivanov@suse.de>
> To: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
>  Scott Branden <sbranden@broadcom.com>, Nicolas Saenz Julienne
>  <nsaenz@kernel.org>
> Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Phil
>  Elwell <phil@raspberrypi.org>, "Ivan T . Ivanov" <iivanov@suse.de>
> Subject: [PATCH] i2c: bcm2835: Set clock-stretch timeout to 35ms
> Message-Id: <20220117102504.90585-1-iivanov@suse.de>
Tags: all arm i2c linux me ring rpi sent

Hi,

> 
> From: Phil Elwell <phil@raspberrypi.org>
> 
> The BCM2835 I2C blocks have a register to set the clock-stretch
> timeout - how long the device is allowed to hold SCL low - in bus
> cycles. The current driver doesn't write to the register, therefore
> the default value of 64 cycles is being used for all devices.
> 
> Set the timeout to the value recommended for SMBus - 35ms.
> 
> See: https://github.com/raspberrypi/linux/issues/3064

It will be nice if we have this fix upstream.

Regards,
Ivan

> 
> Signed-off-by: Phil Elwell <phil@raspberrypi.org>
> [iivanov@suse.de fix small coding style issue]
> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> ---
>  drivers/i2c/busses/i2c-bcm2835.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm2835.c
> index 37443edbf754..9cce0e15da32 100644
> --- a/drivers/i2c/busses/i2c-bcm2835.c
> +++ b/drivers/i2c/busses/i2c-bcm2835.c
> @@ -106,6 +106,7 @@ static int clk_bcm2835_i2c_set_rate(struct clk_hw *hw, unsigned long rate,
>  {
>  	struct clk_bcm2835_i2c *div = to_clk_bcm2835_i2c(hw);
>  	u32 redl, fedl;
> +	u32 clk_tout;
>  	u32 divider = clk_bcm2835_i2c_calc_divider(rate, parent_rate);
>  
>  	if (divider == -EINVAL)
> @@ -129,6 +130,17 @@ static int clk_bcm2835_i2c_set_rate(struct clk_hw *hw, unsigned long rate,
>  	bcm2835_i2c_writel(div->i2c_dev, BCM2835_I2C_DEL,
>  			   (fedl << BCM2835_I2C_FEDL_SHIFT) |
>  			   (redl << BCM2835_I2C_REDL_SHIFT));
> +
> +	/*
> +	 * Set the clock stretch timeout to the SMBUs-recommended 35ms.
> +	 */
> +	if (rate > 0xffff * 1000 / 35)
> +		clk_tout = 0xffff;
> +	else
> +		clk_tout = 35 * rate / 1000;
> +
> +	bcm2835_i2c_writel(div->i2c_dev, BCM2835_I2C_CLKT, clk_tout);
> +
>  	return 0;
>  }
>  
> -- 
> 2.26.2
> 
