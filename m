Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9731638CB4F
	for <lists+linux-i2c@lfdr.de>; Fri, 21 May 2021 18:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235807AbhEUQyM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 May 2021 12:54:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:41480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230471AbhEUQyL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 May 2021 12:54:11 -0400
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net [81.101.6.87])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 436A261073;
        Fri, 21 May 2021 16:52:46 +0000 (UTC)
Date:   Fri, 21 May 2021 17:54:06 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Sean Nyekjaer <sean@geanix.com>
Cc:     trix@redhat.com, lars@metafoo.de, andy.shevchenko@gmail.com,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] iio: accel: fxls8962af: conditionally compile
 fxls8962af_i2c_raw_read_errata3()
Message-ID: <20210521175406.274f713b@jic23-huawei>
In-Reply-To: <a3329058-2b2d-415a-5d2a-0bdf2f97d23d@geanix.com>
References: <20210518234828.1930387-1-trix@redhat.com>
        <a3329058-2b2d-415a-5d2a-0bdf2f97d23d@geanix.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 19 May 2021 07:37:16 +0200
Sean Nyekjaer <sean@geanix.com> wrote:

> On 19/05/2021 01.48, trix@redhat.com wrote:
> > From: Tom Rix <trix@redhat.com>
> > 
> > The build is failing with this link error
> > ld: fxls8962af-core.o: in function `fxls8962af_fifo_transfer':
> > fxls8962af-core.c: undefined reference to `i2c_verify_client'
> > 
> > This is needed for the i2c variant, not the spi variant. So
> > conditionally compile based on CONFIG_FXLS8962AF_I2C.
> >   
> Fixes: 68068fad0e1c ("iio: accel: fxls8962af: fix errata bug E3 - I2C burst reads")
> > Signed-off-by: Tom Rix <trix@redhat.com>  
> Reviewed-by: Sean Nyekjaer <sean@geanix.com>

Given the purpose of that check is to verify it was an i2c_client
should we be looking to instead provide a stub for the case where
we don't have CONFIG_I2C?

+CC Wolfram and linux-i2c list for input.

> > ---
> >  drivers/iio/accel/fxls8962af-core.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/iio/accel/fxls8962af-core.c b/drivers/iio/accel/fxls8962af-core.c
> > index 9fe5a18a605cc..b6d833e2058c8 100644
> > --- a/drivers/iio/accel/fxls8962af-core.c
> > +++ b/drivers/iio/accel/fxls8962af-core.c
> > @@ -624,6 +624,7 @@ static const struct iio_buffer_setup_ops fxls8962af_buffer_ops = {
> >  	.postdisable = fxls8962af_buffer_postdisable,
> >  };
> >  
> > +#if IS_ENABLED(CONFIG_FXLS8962AF_I2C)
> >  static int fxls8962af_i2c_raw_read_errata3(struct fxls8962af_data *data,
> >  					   u16 *buffer, int samples,
> >  					   int sample_length)
> > @@ -639,6 +640,7 @@ static int fxls8962af_i2c_raw_read_errata3(struct fxls8962af_data *data,
> >  
> >  	return ret;
> >  }
> > +#endif
> >  
> >  static int fxls8962af_fifo_transfer(struct fxls8962af_data *data,
> >  				    u16 *buffer, int samples)
> > @@ -648,6 +650,7 @@ static int fxls8962af_fifo_transfer(struct fxls8962af_data *data,
> >  	int total_length = samples * sample_length;
> >  	int ret;
> >  
> > +#if IS_ENABLED(CONFIG_FXLS8962AF_I2C)
> >  	if (i2c_verify_client(dev))
> >  		/*
> >  		 * Due to errata bug:
> > @@ -657,6 +660,7 @@ static int fxls8962af_fifo_transfer(struct fxls8962af_data *data,
> >  		ret = fxls8962af_i2c_raw_read_errata3(data, buffer, samples,
> >  						      sample_length);
> >  	else
> > +#endif
> >  		ret = regmap_raw_read(data->regmap, FXLS8962AF_BUF_X_LSB, buffer,
> >  				      total_length);
> >  
> >   
> 

