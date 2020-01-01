Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1AA12DF90
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Jan 2020 17:45:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727186AbgAAQpe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Jan 2020 11:45:34 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:43000 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbgAAQpe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Jan 2020 11:45:34 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 11E8C516;
        Wed,  1 Jan 2020 17:45:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1577897132;
        bh=6Is3CGat13KFf0ZYvUZOGLzah+Z8UAeB4/j5miPu4ko=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XQYkg2xhgyvuYC/CTjlnBm8zAMgzVLMPnvWBh+P+VE9bezoGP1AxhXIwCwUYMSEa/
         VIzEWHlfWTfj2OOEGMQ++q0V00LUkdhrGi7/Cd7sBH48j7HTCwl5K+wruH0UzlW8yp
         CLZqSfEHMgAlQhjU6Uuvmpw45CIfLU1X9ANAqytw=
Date:   Wed, 1 Jan 2020 18:45:22 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [RFC PATCH 1/5] i2c: core: refactor scanning for a client
Message-ID: <20200101164522.GA6226@pendragon.ideasonboard.com>
References: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
 <20191231161400.1688-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191231161400.1688-2-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

Thank you for the patch.

On Tue, Dec 31, 2019 at 05:13:56PM +0100, Wolfram Sang wrote:
> There is a pattern to check for existence of a client which is copied in
> i2c_detect_address() and i2c_new_scanned_device():
> 
> 1) check if address is valid
> 2) check if address is already registered
> 3) send a message and check the reponse
> 
> Because this pattern will be needed a third time soon, refactor it into
> its own function.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/i2c-core-base.c | 57 ++++++++++++++++---------------------
>  1 file changed, 25 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index a1eb28a3cc54..20a726dc78db 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -2108,29 +2108,39 @@ static int i2c_default_probe(struct i2c_adapter *adap, unsigned short addr)
>  	return err >= 0;
>  }
>  
> -static int i2c_detect_address(struct i2c_client *temp_client,
> -			      struct i2c_driver *driver)
> +static int i2c_scan_for_client(struct i2c_adapter *adap, unsigned short addr,
> +			    int (*probe)(struct i2c_adapter *adap, unsigned short addr))
>  {
> -	struct i2c_board_info info;
> -	struct i2c_adapter *adapter = temp_client->adapter;
> -	int addr = temp_client->addr;
>  	int err;
>  
>  	/* Make sure the address is valid */
>  	err = i2c_check_7bit_addr_validity_strict(addr);
> -	if (err) {
> -		dev_warn(&adapter->dev, "Invalid probe address 0x%02x\n",
> -			 addr);
> +	if (WARN(err, "Invalid probe address 0x%02x\n", addr))

Does this deserve a full backtrace ? If so could you mention it in the
commit message ?

With this addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  		return err;
> -	}
>  
>  	/* Skip if already in use (7 bit, no need to encode flags) */
> -	if (i2c_check_addr_busy(adapter, addr))
> -		return 0;
> +	if (i2c_check_addr_busy(adap, addr))
> +		return -EBUSY;
>  
>  	/* Make sure there is something at this address */
> -	if (!i2c_default_probe(adapter, addr))
> -		return 0;
> +	if (!probe(adap, addr))
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +
> +static int i2c_detect_address(struct i2c_client *temp_client,
> +			      struct i2c_driver *driver)
> +{
> +	struct i2c_board_info info;
> +	struct i2c_adapter *adapter = temp_client->adapter;
> +	int addr = temp_client->addr;
> +	int err;
> +
> +	/* Only report broken addresses, busy addresses are no error */
> +	err = i2c_scan_for_client(adapter, addr, i2c_default_probe);
> +	if (err < 0)
> +		return err == -EINVAL ? -EINVAL : 0;
>  
>  	/* Finally call the custom detection function */
>  	memset(&info, 0, sizeof(struct i2c_board_info));
> @@ -2232,26 +2242,9 @@ i2c_new_scanned_device(struct i2c_adapter *adap,
>  	if (!probe)
>  		probe = i2c_default_probe;
>  
> -	for (i = 0; addr_list[i] != I2C_CLIENT_END; i++) {
> -		/* Check address validity */
> -		if (i2c_check_7bit_addr_validity_strict(addr_list[i]) < 0) {
> -			dev_warn(&adap->dev, "Invalid 7-bit address 0x%02x\n",
> -				 addr_list[i]);
> -			continue;
> -		}
> -
> -		/* Check address availability (7 bit, no need to encode flags) */
> -		if (i2c_check_addr_busy(adap, addr_list[i])) {
> -			dev_dbg(&adap->dev,
> -				"Address 0x%02x already in use, not probing\n",
> -				addr_list[i]);
> -			continue;
> -		}
> -
> -		/* Test address responsiveness */
> -		if (probe(adap, addr_list[i]))
> +	for (i = 0; addr_list[i] != I2C_CLIENT_END; i++)
> +		if (i2c_scan_for_client(adap, addr_list[i], probe) == 0)
>  			break;
> -	}
>  
>  	if (addr_list[i] == I2C_CLIENT_END) {
>  		dev_dbg(&adap->dev, "Probing failed, no device found\n");

-- 
Regards,

Laurent Pinchart
