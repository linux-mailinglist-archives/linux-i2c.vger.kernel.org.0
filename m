Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 422FF25A81D
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Sep 2020 10:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbgIBI5K (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Sep 2020 04:57:10 -0400
Received: from mga09.intel.com ([134.134.136.24]:11316 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726269AbgIBI5K (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Sep 2020 04:57:10 -0400
IronPort-SDR: //IncEz/xVSvxx6XkGN6kLNPyg1pdUcrg2fuB2xQO06fIJ5D8kvbroQ+4aJVWuD9a1WyP9JVTn
 oSIbxY1Nq7TA==
X-IronPort-AV: E=McAfee;i="6000,8403,9731"; a="158345951"
X-IronPort-AV: E=Sophos;i="5.76,381,1592895600"; 
   d="scan'208";a="158345951"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2020 01:57:07 -0700
IronPort-SDR: n82aL5bSEOkonVTgcp4RE1Oa5ra55eIXdGE64YFUA41NOQGuv2rZz5lmZPec3Kl1ff3j2eWPiN
 ibAd5bugHZiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,381,1592895600"; 
   d="scan'208";a="331360814"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 02 Sep 2020 01:57:04 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kDON2-00DfRB-B6; Wed, 02 Sep 2020 11:43:56 +0300
Date:   Wed, 2 Sep 2020 11:43:56 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Evan Nimmo <evan.nimmo@alliedtelesis.co.nz>
Cc:     wsa@kernel.org, jarkko.nikula@linux.intel.com, jdelvare@suse.de,
        chris.packham@alliedtelesis.co.nz, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] i2c: algo-pca: Reapply i2c bus settings after
 reset
Message-ID: <20200902084356.GX1891694@smile.fi.intel.com>
References: <20200901211747.20649-1-evan.nimmo@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200901211747.20649-1-evan.nimmo@alliedtelesis.co.nz>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 02, 2020 at 09:17:47AM +1200, Evan Nimmo wrote:
> If something goes wrong (such as the SCL being stuck low) then we need
> to reset the PCA chip. The issue with this is that on reset we lose all
> config settings and the chip ends up in a disabled state which results
> in a lock up/high cpu usage. We need to re-apply any configuration that

cpu -> CPU (I guess Wolfram can decide with this when applying)

> had previously been set and re-enable the chip.

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Evan Nimmo <evan.nimmo@alliedtelesis.co.nz>
> ---
> changes in v2:
> - changed lowercase "pca to uppercase "PCA".
> - reworded and reformatted the multiline comment.
> - moved the clock frequency KERN_INFO closer to the call that sets this.
> - moved the i2c_bus_settings struct to the more generic i2c.h and removed
> - the comments indicating this as being for the pca chip.
> 
>  drivers/i2c/algos/i2c-algo-pca.c | 36 +++++++++++++++++++++-----------
>  include/linux/i2c-algo-pca.h     |  1 +
>  include/linux/i2c.h              | 14 +++++++++++++
>  3 files changed, 39 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/i2c/algos/i2c-algo-pca.c b/drivers/i2c/algos/i2c-algo-pca.c
> index 710fbef9a9c2..8b98b737b499 100644
> --- a/drivers/i2c/algos/i2c-algo-pca.c
> +++ b/drivers/i2c/algos/i2c-algo-pca.c
> @@ -41,8 +41,22 @@ static void pca_reset(struct i2c_algo_pca_data *adap)
>  		pca_outw(adap, I2C_PCA_INDPTR, I2C_PCA_IPRESET);
>  		pca_outw(adap, I2C_PCA_IND, 0xA5);
>  		pca_outw(adap, I2C_PCA_IND, 0x5A);
> +
> +		/*
> +		 * After a reset we need to re-apply any configuration
> +		 * (calculated in pca_init) to get the bus in a working state.
> +		 */
> +		pca_outw(adap, I2C_PCA_INDPTR, I2C_PCA_IMODE);
> +		pca_outw(adap, I2C_PCA_IND, adap->bus_settings.mode);
> +		pca_outw(adap, I2C_PCA_INDPTR, I2C_PCA_ISCLL);
> +		pca_outw(adap, I2C_PCA_IND, adap->bus_settings.tlow);
> +		pca_outw(adap, I2C_PCA_INDPTR, I2C_PCA_ISCLH);
> +		pca_outw(adap, I2C_PCA_IND, adap->bus_settings.thi);
> +
> +		pca_set_con(adap, I2C_PCA_CON_ENSIO);
>  	} else {
>  		adap->reset_chip(adap->data);
> +		pca_set_con(adap, I2C_PCA_CON_ENSIO | adap->bus_settings.clock_freq);
>  	}
>  }
>  
> @@ -423,13 +437,15 @@ static int pca_init(struct i2c_adapter *adap)
>  				" Use the nominal frequency.\n", adap->name);
>  		}
>  
> -		pca_reset(pca_data);
> -
>  		clock = pca_clock(pca_data);
> +
>  		printk(KERN_INFO "%s: Clock frequency is %dkHz\n",
>  		     adap->name, freqs[clock]);
>  
> -		pca_set_con(pca_data, I2C_PCA_CON_ENSIO | clock);
> +		/* Store settings as these will be needed when the PCA chip is reset */
> +		pca_data->bus_settings.clock_freq = clock;
> +
> +		pca_reset(pca_data);
>  	} else {
>  		int clock;
>  		int mode;
> @@ -496,19 +512,15 @@ static int pca_init(struct i2c_adapter *adap)
>  			thi = tlow * min_thi / min_tlow;
>  		}
>  
> +		/* Store settings as these will be needed when the PCA chip is reset */
> +		pca_data->bus_settings.mode = mode;
> +		pca_data->bus_settings.tlow = tlow;
> +		pca_data->bus_settings.thi = thi;
> +
>  		pca_reset(pca_data);
>  
>  		printk(KERN_INFO
>  		     "%s: Clock frequency is %dHz\n", adap->name, clock * 100);
> -
> -		pca_outw(pca_data, I2C_PCA_INDPTR, I2C_PCA_IMODE);
> -		pca_outw(pca_data, I2C_PCA_IND, mode);
> -		pca_outw(pca_data, I2C_PCA_INDPTR, I2C_PCA_ISCLL);
> -		pca_outw(pca_data, I2C_PCA_IND, tlow);
> -		pca_outw(pca_data, I2C_PCA_INDPTR, I2C_PCA_ISCLH);
> -		pca_outw(pca_data, I2C_PCA_IND, thi);
> -
> -		pca_set_con(pca_data, I2C_PCA_CON_ENSIO);
>  	}
>  	udelay(500); /* 500 us for oscillator to stabilise */
>  
> diff --git a/include/linux/i2c-algo-pca.h b/include/linux/i2c-algo-pca.h
> index d03071732db4..97d1f4cd8e56 100644
> --- a/include/linux/i2c-algo-pca.h
> +++ b/include/linux/i2c-algo-pca.h
> @@ -64,6 +64,7 @@ struct i2c_algo_pca_data {
>  	 * For PCA9665, use the frequency you want here. */
>  	unsigned int			i2c_clock;
>  	unsigned int			chip;
> +	struct i2c_bus_settings		bus_settings;
>  };
>  
>  int i2c_pca_add_bus(struct i2c_adapter *);
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index fc55ea41d323..8c5138fbe532 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -724,6 +724,20 @@ struct i2c_adapter {
>  };
>  #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
>  
> +/**
> + * struct i2c_bus_settings - The configured i2c bus settings
> + * @mode: Configured i2c bus mode
> + * @tlow: Configured SCL LOW period
> + * @thi: Configured SCL HIGH period
> + * @clock_freq: The configured clock frequency
> + */
> +struct i2c_bus_settings {
> +	int mode;
> +	int tlow;
> +	int thi;
> +	int clock_freq;
> +};
> +
>  static inline void *i2c_get_adapdata(const struct i2c_adapter *adap)
>  {
>  	return dev_get_drvdata(&adap->dev);
> -- 
> 2.27.0
> 

-- 
With Best Regards,
Andy Shevchenko


