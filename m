Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE9FB77BA7
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Jul 2019 21:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387893AbfG0T6Q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 27 Jul 2019 15:58:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:42106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387841AbfG0T6Q (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 27 Jul 2019 15:58:16 -0400
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net [82.4.196.95])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 231D9208C0;
        Sat, 27 Jul 2019 19:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564257495;
        bh=WHB1WWnPPiAlyljf4N8cT7LMn9j/5w6GRw1Hj8gOLpM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=QZiz/rdxGOVw9FTVXee4yi8sZkyT02EdKrTAPRYxb9lnLV7CdY92nMMWGJYnJj1kf
         NYI9Amq8PPPhH1DDBGCqPx4hPFO6q8cDnfmDn2lLstzvS4SjAq5zkioBSJwfcOC/Sv
         MP5K8tf/+GcL3xT15ZIdJ96JDdQi5A+l/IX4f/tw=
Date:   Sat, 27 Jul 2019 20:58:11 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] iio: light: veml6070: convert to
 i2c_new_dummy_device
Message-ID: <20190727205811.7beba748@archlinux>
In-Reply-To: <20190722172613.3890-3-wsa+renesas@sang-engineering.com>
References: <20190722172613.3890-1-wsa+renesas@sang-engineering.com>
        <20190722172613.3890-3-wsa+renesas@sang-engineering.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 22 Jul 2019 19:26:12 +0200
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> Move from i2c_new_dummy() to i2c_new_dummy_device(), so we now get an
> ERRPTR which we use in error handling.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to do something random with it.

Thanks,

Jonathan

> ---
> 
> Generated with coccinelle. Build tested by me and buildbot. Not tested on HW.
> 
>  drivers/iio/light/veml6070.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iio/light/veml6070.c b/drivers/iio/light/veml6070.c
> index a3138e1b5803..0be553ad5989 100644
> --- a/drivers/iio/light/veml6070.c
> +++ b/drivers/iio/light/veml6070.c
> @@ -158,10 +158,10 @@ static int veml6070_probe(struct i2c_client *client,
>  	indio_dev->name = VEML6070_DRV_NAME;
>  	indio_dev->modes = INDIO_DIRECT_MODE;
>  
> -	data->client2 = i2c_new_dummy(client->adapter, VEML6070_ADDR_DATA_LSB);
> -	if (!data->client2) {
> +	data->client2 = i2c_new_dummy_device(client->adapter, VEML6070_ADDR_DATA_LSB);
> +	if (IS_ERR(data->client2)) {
>  		dev_err(&client->dev, "i2c device for second chip address failed\n");
> -		return -ENODEV;
> +		return PTR_ERR(data->client2);
>  	}
>  
>  	data->config = VEML6070_IT_10 | VEML6070_COMMAND_RSRVD |

