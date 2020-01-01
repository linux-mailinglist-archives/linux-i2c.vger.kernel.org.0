Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE2112DF94
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Jan 2020 17:50:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727133AbgAAQuF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Jan 2020 11:50:05 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:43030 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbgAAQuF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Jan 2020 11:50:05 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7700516;
        Wed,  1 Jan 2020 17:50:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1577897403;
        bh=h1re3xmWg0eibALn4QK2Pfp66oeqTj9eKiBp2QbRmV4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wghg1uy3iZ/hl1laSC7pfzRN1SJlR+mFeq19boTpIy8r797tShWVQHtbKACWYxc6e
         gxSOMNlpvyJ0VihfN9am+e+tZA8CEGgUr99YVzDZk7FOmgohJeIzH8sQ2JJjusHO0E
         GFWumBp+j3OB4yqFW9garry/ID35EpG8FO+VJqdU=
Date:   Wed, 1 Jan 2020 18:49:53 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [RFC PATCH 2/5] i2c: core: add new variant to check for a client
Message-ID: <20200101164953.GB6226@pendragon.ideasonboard.com>
References: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
 <20191231161400.1688-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191231161400.1688-3-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

Thank you for the patch.

On Tue, Dec 31, 2019 at 05:13:57PM +0100, Wolfram Sang wrote:
> For the new 'alias' feature, we need to scan for devices while holding
> the lock. We focus on read_byte transactions for now to keep things
> simple. Requesting an alias will be rare, so there is not much overhead.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/i2c-core-base.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 20a726dc78db..51bd953ddfb2 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -2108,6 +2108,23 @@ static int i2c_default_probe(struct i2c_adapter *adap, unsigned short addr)
>  	return err >= 0;
>  }
>  
> +static int i2c_unlocked_read_byte_probe(struct i2c_adapter *adap, unsigned short addr)
> +{
> +	union i2c_smbus_data dummy;
> +	int err;
> +
> +	if (i2c_check_functionality(adap, I2C_FUNC_SMBUS_READ_BYTE)) {
> +		err = __i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, 0,
> +				     I2C_SMBUS_BYTE, &dummy);
> +	} else {
> +		dev_warn(&adap->dev, "No suitable probing method supported for address 0x%02X\n",

This should be wrapped after the first argument.

s/02X/02x/

As this function is static and unused in this patch, this may introduce
a new warning when bisection. I see little reason to keep this patch
standalone, you can squash it with 3/5. It otherwise looks good to me.

> +			 addr);
> +		err = -EOPNOTSUPP;
> +	}
> +
> +	return err >= 0;
> +}
> +
>  static int i2c_scan_for_client(struct i2c_adapter *adap, unsigned short addr,
>  			    int (*probe)(struct i2c_adapter *adap, unsigned short addr))
>  {

-- 
Regards,

Laurent Pinchart
