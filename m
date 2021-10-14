Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F54F42E00E
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Oct 2021 19:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233069AbhJNRam convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 14 Oct 2021 13:30:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:51568 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232947AbhJNRal (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 14 Oct 2021 13:30:41 -0400
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net [81.101.6.87])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BF46B61156;
        Thu, 14 Oct 2021 17:28:34 +0000 (UTC)
Date:   Thu, 14 Oct 2021 18:32:46 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Lars-Peter Clausen <lars@metafoo.de>,
        Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        kernel@pengutronix.de, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH 12/15] iio: imu: st_lsm9ds0: Make st_lsm9ds0_remove()
 return void
Message-ID: <20211014183246.2985dd5f@jic23-huawei>
In-Reply-To: <20211013203223.2694577-13-u.kleine-koenig@pengutronix.de>
References: <20211013203223.2694577-1-u.kleine-koenig@pengutronix.de>
        <20211013203223.2694577-13-u.kleine-koenig@pengutronix.de>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 13 Oct 2021 22:32:20 +0200
Uwe Kleine-König <u.kleine-koenig@pengutronix.de> wrote:

> Up to now st_lsm9ds0_remove() returns zero unconditionally. Make it
> return void instead which makes it easier to see in the callers that
> there is no error to handle.
> 
> Also the return value of i2c and spi remove callbacks is ignored anyway.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Skipped as I've accepted a patch in the meantime that removes this
code by doing a full devm_ handled remove path.

Thanks,

Jonathan

> ---
>  drivers/iio/imu/st_lsm9ds0/st_lsm9ds0.h      | 2 +-
>  drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_core.c | 4 +---
>  drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_i2c.c  | 4 +++-
>  drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_spi.c  | 4 +++-
>  4 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0.h b/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0.h
> index 146393afd9a7..3f0b24e9eeea 100644
> --- a/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0.h
> +++ b/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0.h
> @@ -18,6 +18,6 @@ struct st_lsm9ds0 {
>  };
>  
>  int st_lsm9ds0_probe(struct st_lsm9ds0 *lsm9ds0, struct regmap *regmap);
> -int st_lsm9ds0_remove(struct st_lsm9ds0 *lsm9ds0);
> +void st_lsm9ds0_remove(struct st_lsm9ds0 *lsm9ds0);
>  
>  #endif /* ST_LSM9DS0_H */
> diff --git a/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_core.c b/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_core.c
> index 5e6625140db7..bfd7da4353a8 100644
> --- a/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_core.c
> +++ b/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_core.c
> @@ -150,12 +150,10 @@ int st_lsm9ds0_probe(struct st_lsm9ds0 *lsm9ds0, struct regmap *regmap)
>  }
>  EXPORT_SYMBOL_GPL(st_lsm9ds0_probe);
>  
> -int st_lsm9ds0_remove(struct st_lsm9ds0 *lsm9ds0)
> +void st_lsm9ds0_remove(struct st_lsm9ds0 *lsm9ds0)
>  {
>  	st_magn_common_remove(lsm9ds0->magn);
>  	st_accel_common_remove(lsm9ds0->accel);
> -
> -	return 0;
>  }
>  EXPORT_SYMBOL_GPL(st_lsm9ds0_remove);
>  
> diff --git a/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_i2c.c b/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_i2c.c
> index 78bede358747..e9205b46a4e6 100644
> --- a/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_i2c.c
> +++ b/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_i2c.c
> @@ -66,7 +66,9 @@ static int st_lsm9ds0_i2c_probe(struct i2c_client *client)
>  
>  static int st_lsm9ds0_i2c_remove(struct i2c_client *client)
>  {
> -	return st_lsm9ds0_remove(i2c_get_clientdata(client));
> +	st_lsm9ds0_remove(i2c_get_clientdata(client));
> +
> +	return 0;
>  }
>  
>  static struct i2c_driver st_lsm9ds0_driver = {
> diff --git a/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_spi.c b/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_spi.c
> index 180b54e66438..c51164c9f151 100644
> --- a/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_spi.c
> +++ b/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_spi.c
> @@ -65,7 +65,9 @@ static int st_lsm9ds0_spi_probe(struct spi_device *spi)
>  
>  static int st_lsm9ds0_spi_remove(struct spi_device *spi)
>  {
> -	return st_lsm9ds0_remove(spi_get_drvdata(spi));
> +	st_lsm9ds0_remove(spi_get_drvdata(spi));
> +
> +	return 0;
>  }
>  
>  static struct spi_driver st_lsm9ds0_driver = {

