Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDEBE1932F4
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Mar 2020 22:43:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbgCYVnP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Mar 2020 17:43:15 -0400
Received: from mga03.intel.com ([134.134.136.65]:63303 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726081AbgCYVnP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 25 Mar 2020 17:43:15 -0400
IronPort-SDR: /b3txDayFS56iiHaWEwLVWhH4luxKlprVKcIXo1i1htyxAcGbQio+HMVGKhpmxBXhMhRgDy685
 tpVDRh6mEkSw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2020 14:43:15 -0700
IronPort-SDR: rr/bCDLMnTYSC/0Kfbcst1ekWyjOZ+ZADNTJxnI2myZ1rKDjnbMzJyGsjJ+WOrqXyTkzAZ8k1/
 TgPtjm/L5djA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,305,1580803200"; 
   d="scan'208";a="357946830"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001.fm.intel.com with ESMTP; 25 Mar 2020 14:43:13 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jHDnw-00Cwo5-B4; Wed, 25 Mar 2020 23:43:16 +0200
Date:   Wed, 25 Mar 2020 23:43:16 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v2 1/4] i2c: mux: pca954x: Refactor pca954x_irq_handler()
Message-ID: <20200325214316.GJ1922688@smile.fi.intel.com>
References: <20200316160724.37596-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200316160724.37596-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 16, 2020 at 06:07:21PM +0200, Andy Shevchenko wrote:
> Refactor pca954x_irq_handler() to:
>   - use for_each_set_bit() macro
>   - use IRQ_RETVAL() macro
> 
> Above change makes code easy to read and understand.

Peter, does this series good in your opinion?

> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: masked pending to prevent handling of spurious IRQs (Peter)
>  drivers/i2c/muxes/i2c-mux-pca954x.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
> index a0d926ae3f86..b764c7c746e9 100644
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
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko


