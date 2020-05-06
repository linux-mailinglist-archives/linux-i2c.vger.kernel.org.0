Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D1E31C7080
	for <lists+linux-i2c@lfdr.de>; Wed,  6 May 2020 14:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728104AbgEFMml (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 May 2020 08:42:41 -0400
Received: from mga06.intel.com ([134.134.136.31]:49316 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725887AbgEFMml (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 May 2020 08:42:41 -0400
IronPort-SDR: bl7vxNAOVrWeoM/HhIXtkcuUxIg2N3GPC5+FCCJ9SKrRK62ZoXIPTVjP0HXFz9eHguWCxJFk7O
 XrQoxe7dVSow==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2020 05:42:40 -0700
IronPort-SDR: vFoxRagHT3KF7QEReoK1RFZf9q9g7EUAXyBef5ql2TmXzxNZOheAJXoLnwShZrNje4CywrEYND
 zmpZWNZguf3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,359,1583222400"; 
   d="scan'208";a="407230042"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004.jf.intel.com with ESMTP; 06 May 2020 05:42:39 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jWJNq-0051JH-GJ; Wed, 06 May 2020 15:42:42 +0300
Date:   Wed, 6 May 2020 15:42:42 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v3 1/4] i2c: mux: pca954x: Refactor pca954x_irq_handler()
Message-ID: <20200506124242.GH185537@smile.fi.intel.com>
References: <20200425115152.29475-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200425115152.29475-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Apr 25, 2020 at 02:51:49PM +0300, Andy Shevchenko wrote:
> Refactor pca954x_irq_handler() to:
>   - use for_each_set_bit() macro
>   - use IRQ_RETVAL() macro
> 
> Above change makes code easy to read and understand.

If there is no comments, Wolfram, can you apply this?

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v3: rebase on top of latest rc
>  drivers/i2c/muxes/i2c-mux-pca954x.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
> index a0d926ae3f864..b764c7c746e96 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> @@ -327,21 +327,18 @@ static DEVICE_ATTR_RW(idle_state);
>  static irqreturn_t pca954x_irq_handler(int irq, void *dev_id)
>  {
>  	struct pca954x *data = dev_id;
> -	unsigned int child_irq;
> -	int ret, i, handled = 0;
> +	unsigned long pending;
> +	int ret, i;
>  
>  	ret = i2c_smbus_read_byte(data->client);
>  	if (ret < 0)
>  		return IRQ_NONE;
>  
> -	for (i = 0; i < data->chip->nchans; i++) {
> -		if (ret & BIT(PCA954X_IRQ_OFFSET + i)) {
> -			child_irq = irq_linear_revmap(data->irq, i);
> -			handle_nested_irq(child_irq);
> -			handled++;
> -		}
> -	}
> -	return handled ? IRQ_HANDLED : IRQ_NONE;
> +	pending = (ret >> PCA954X_IRQ_OFFSET) & (BIT(data->chip->nchans) - 1);
> +	for_each_set_bit(i, &pending, data->chip->nchans)
> +		handle_nested_irq(irq_linear_revmap(data->irq, i));
> +
> +	return IRQ_RETVAL(pending);
>  }
>  
>  static int pca954x_irq_set_type(struct irq_data *idata, unsigned int type)
> -- 
> 2.26.2
> 

-- 
With Best Regards,
Andy Shevchenko


