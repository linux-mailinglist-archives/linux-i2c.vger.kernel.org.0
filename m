Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE08412DF97
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Jan 2020 17:55:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727194AbgAAQz1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Jan 2020 11:55:27 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:43056 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727201AbgAAQz1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Jan 2020 11:55:27 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C2A22516;
        Wed,  1 Jan 2020 17:55:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1577897725;
        bh=SDm9N50kP83IA091bMcNW7VseLm+e6iRMxSUK1tShlE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IMwlHPxGlc+Ri+EjU/6k0B84f48ejjbBSvYMx9cHTMKp1bBRaoy/pVQSMJv5i1ied
         LrZFxdytKERNdHJR33N+2sxFYfkr5v3K20J5T4f92yXJgyWFi1AH3HMiJ0bMJYTRsV
         vJtWb4KfF1H1ldeOOxDh32X0Cj1pXedDVeCVOEME=
Date:   Wed, 1 Jan 2020 18:55:15 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [RFC PATCH 3/5] i2c: core: add function to request an alias
Message-ID: <20200101165515.GC6226@pendragon.ideasonboard.com>
References: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
 <20191231161400.1688-4-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191231161400.1688-4-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

Thank you for the patch.

On Tue, Dec 31, 2019 at 05:13:58PM +0100, Wolfram Sang wrote:
> Some devices are able to reprogram their I2C address at runtime. This
> can prevent address collisions when one is able to activate and
> reprogram these devices one by one. For that to work, they need to be
> assigned an unused address. This new functions allows drivers to request
> for such an address. It assumes all non-occupied addresses are free. It
> will then send a message to such a free address to make sure there is
> really nothing listening there.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/i2c-core-base.c | 22 ++++++++++++++++++++++
>  include/linux/i2c.h         |  2 ++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 51bd953ddfb2..5a010e7e698f 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -2241,6 +2241,28 @@ static int i2c_detect(struct i2c_adapter *adapter, struct i2c_driver *driver)
>  	return err;
>  }
>  

Missing kerneldoc, but you already know about this.

> +struct i2c_client *i2c_new_alias_device(struct i2c_adapter *adap)
> +{
> +	struct i2c_client *alias = ERR_PTR(-EBUSY);
> +	int ret;
> +	u16 addr;
> +
> +	i2c_lock_bus(adap, I2C_LOCK_SEGMENT);
> +
> +	for (addr = 0x08; addr < 0x78; addr++) {
> +		ret = i2c_scan_for_client(adap, addr, i2c_unlocked_read_byte_probe);
> +		if (ret == -ENODEV) {
> +			alias = i2c_new_dummy_device(adap, addr);
> +			dev_dbg(&adap->dev, "Found alias: 0x%x\n", addr);
> +			break;
> +		}
> +	}

This looks quite inefficient, especially if the beginning of the range
is populated with devices. Furthermore, I think there's a high risk of
false negatives, as acquiring a free address and reprogramming the
client to make use of it are separate operations. Another call to
i2c_new_alias_device() could occur in-between. There's also the issue
that I2C hasn't been designed for scanning, so some devices may not
appreciate this.

What happened to the idea of reporting busy address ranges in the
firmware (DT, ACPI, ...) ?

> +
> +	i2c_unlock_bus(adap, I2C_LOCK_SEGMENT);
> +	return alias;
> +}
> +EXPORT_SYMBOL_GPL(i2c_new_alias_device);
> +
>  int i2c_probe_func_quick_read(struct i2c_adapter *adap, unsigned short addr)
>  {
>  	return i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, 0,
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index f834687989f7..583ca2aec022 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -441,6 +441,8 @@ i2c_new_device(struct i2c_adapter *adap, struct i2c_board_info const *info);
>  struct i2c_client *
>  i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *info);
>  
> +struct i2c_client *i2c_new_alias_device(struct i2c_adapter *adap);
> +
>  /* If you don't know the exact address of an I2C device, use this variant
>   * instead, which can probe for device presence in a list of possible
>   * addresses. The "probe" callback function is optional. If it is provided,

-- 
Regards,

Laurent Pinchart
