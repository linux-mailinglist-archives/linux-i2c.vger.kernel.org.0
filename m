Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 499F942E007
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Oct 2021 19:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231376AbhJNR11 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 14 Oct 2021 13:27:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:49776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231281AbhJNR11 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 14 Oct 2021 13:27:27 -0400
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net [81.101.6.87])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7A2A0610A0;
        Thu, 14 Oct 2021 17:25:19 +0000 (UTC)
Date:   Thu, 14 Oct 2021 18:29:30 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        kernel@pengutronix.de, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH 06/15] iio: accel: ad5064: Make ad5064_core_remove()
 return void
Message-ID: <20211014182930.5fddd8a3@jic23-huawei>
In-Reply-To: <20211013203223.2694577-7-u.kleine-koenig@pengutronix.de>
References: <20211013203223.2694577-1-u.kleine-koenig@pengutronix.de>
        <20211013203223.2694577-7-u.kleine-koenig@pengutronix.de>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 13 Oct 2021 22:32:14 +0200
Uwe Kleine-König         <u.kleine-koenig@pengutronix.de> wrote:

> Up to now ad5064_core_remove() returns zero unconditionally. Make it
> return void instead which makes it easier to see in the callers that
> there is no error to handle.
> 
> Also the return value of i2c and spi remove callbacks is ignored anyway.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Skipping this one as it has since been converted to all devm_

Thanks,

Jonathan

> ---
>  drivers/iio/dac/ad5064.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iio/dac/ad5064.c b/drivers/iio/dac/ad5064.c
> index dff623b65e4f..6f66796942c0 100644
> --- a/drivers/iio/dac/ad5064.c
> +++ b/drivers/iio/dac/ad5064.c
> @@ -900,7 +900,7 @@ static int ad5064_probe(struct device *dev, enum ad5064_type type,
>  	return ret;
>  }
>  
> -static int ad5064_remove(struct device *dev)
> +static void ad5064_remove(struct device *dev)
>  {
>  	struct iio_dev *indio_dev = dev_get_drvdata(dev);
>  	struct ad5064_state *st = iio_priv(indio_dev);
> @@ -909,8 +909,6 @@ static int ad5064_remove(struct device *dev)
>  
>  	if (!st->use_internal_vref)
>  		regulator_bulk_disable(ad5064_num_vref(st), st->vref_reg);
> -
> -	return 0;
>  }
>  
>  #if IS_ENABLED(CONFIG_SPI_MASTER)
> @@ -934,7 +932,9 @@ static int ad5064_spi_probe(struct spi_device *spi)
>  
>  static int ad5064_spi_remove(struct spi_device *spi)
>  {
> -	return ad5064_remove(&spi->dev);
> +	ad5064_remove(&spi->dev);
> +
> +	return 0;
>  }
>  
>  static const struct spi_device_id ad5064_spi_ids[] = {
> @@ -1021,7 +1021,9 @@ static int ad5064_i2c_probe(struct i2c_client *i2c,
>  
>  static int ad5064_i2c_remove(struct i2c_client *i2c)
>  {
> -	return ad5064_remove(&i2c->dev);
> +	ad5064_remove(&i2c->dev);
> +
> +	return 0;
>  }
>  
>  static const struct i2c_device_id ad5064_i2c_ids[] = {

