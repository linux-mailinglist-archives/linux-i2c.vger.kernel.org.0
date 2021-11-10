Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 643D944C5C8
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Nov 2021 18:16:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230380AbhKJRTT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Nov 2021 12:19:19 -0500
Received: from mga04.intel.com ([192.55.52.120]:9355 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230471AbhKJRTT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 10 Nov 2021 12:19:19 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10164"; a="231440152"
X-IronPort-AV: E=Sophos;i="5.87,224,1631602800"; 
   d="scan'208";a="231440152"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2021 09:16:31 -0800
X-IronPort-AV: E=Sophos;i="5.87,224,1631602800"; 
   d="scan'208";a="602275898"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2021 09:16:29 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mkrCr-005UHL-RT;
        Wed, 10 Nov 2021 19:16:17 +0200
Date:   Wed, 10 Nov 2021 19:16:17 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Wolfram Sang <wsa@kernel.org>, ck+kernelbugzilla@bl4ckb0x.de,
        stephane.poignant@protonmail.com
Subject: Re: [PATCH v3] i2c: i801: Fix interrupt storm from SMB_ALERT signal
Message-ID: <YYv+YdRWzU9HzEY8@smile.fi.intel.com>
References: <20211110141032.2429745-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211110141032.2429745-1-jarkko.nikula@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Nov 10, 2021 at 04:10:32PM +0200, Jarkko Nikula wrote:
> Currently interrupt storm will occur from i2c-i801 after first
> transaction if SMB_ALERT signal is enabled and ever asserted. It is
> enough if the signal is asserted once even before the driver is loaded
> and does not recover because that interrupt is not acknowledged.
> 
> This fix aims to fix it by two ways:
> - Add acknowledging for the SMB_ALERT interrupt status
> - Disable the SMB_ALERT interrupt on platforms where possible since the
>   driver currently does not make use for it
> 
> Acknowledging resets the SMB_ALERT interrupt status on all platforms and
> also should help to avoid interrupt storm on older platforms where the
> SMB_ALERT interrupt disabling is not available.
> 
> For simplicity this fix reuses the host notify feature for disabling and
> restoring original register value.

With proposed modification (to the text) below, FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Link: https://bugzilla.kernel.org/show_bug.cgi?id=177311
> Reported-by: ck+kernelbugzilla@bl4ckb0x.de
> Reported-by: stephane.poignant@protonmail.com
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
> v3: Add comment from Jean Delvare why SMB_ALERT interrupt is blocked for
>     now. Simplify comment about SMB_ALERT status clearing
> v2: More verbose commenting around interrupt acknowledging, reporting
>     and SMB_ALERT disabling. Fix typo in commit log and split the first
>     sentence.
> v1:
> Hi Conrad and Stephane. This patch is otherwise the same than the one I
> had in bugzilla but this adds also acknowledging for the SMB_ALERT
> interrupt. There is short time window during driver load and unload
> where interrupt storm will still occur if signal was asserted. Also
> interrupt disabling is possible only on ICH3 and later so interrupt
> acknowledging should also help those old platforms.
> ---
>  drivers/i2c/busses/i2c-i801.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index ed271274250b..21be28b7955f 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -191,6 +191,7 @@
>  #define SMBSLVSTS_HST_NTFY_STS	BIT(0)
>  
>  /* Host Notify Command register bits */
> +#define SMBSLVCMD_SMBALERT_DISABLE	BIT(2)
>  #define SMBSLVCMD_HST_NTFY_INTREN	BIT(0)
>  
>  #define STATUS_ERROR_FLAGS	(SMBHSTSTS_FAILED | SMBHSTSTS_BUS_ERR | \
> @@ -642,12 +643,20 @@ static irqreturn_t i801_isr(int irq, void *dev_id)
>  		i801_isr_byte_done(priv);
>  
>  	/*
> -	 * Clear irq sources and report transaction result.
> +	 * Clear remaining irq sources: Completion of last command, errors

irq --> IRQ
of last --> of the last

> +	 * and the SMB_ALERT signal. SMB_ALERT status is set after signal
> +	 * assertion independently is the interrupt generation blocked or not

is --> if ?

> +	 * so clear it always when the status is set.
> +	 */
> +	status &= SMBHSTSTS_INTR | STATUS_ERROR_FLAGS | SMBHSTSTS_SMBALERT_STS;
> +	if (status)
> +		outb_p(status, SMBHSTSTS(priv));
> +	status &= ~SMBHSTSTS_SMBALERT_STS; /* SMB_ALERT not reported */
> +	/*
> +	 * Report transaction result.
>  	 * ->status must be cleared before the next transaction is started.
>  	 */
> -	status &= SMBHSTSTS_INTR | STATUS_ERROR_FLAGS;
>  	if (status) {
> -		outb_p(status, SMBHSTSTS(priv));
>  		priv->status = status;
>  		complete(&priv->done);
>  	}
> @@ -975,9 +984,13 @@ static void i801_enable_host_notify(struct i2c_adapter *adapter)
>  	if (!(priv->features & FEATURE_HOST_NOTIFY))
>  		return;
>  
> -	if (!(SMBSLVCMD_HST_NTFY_INTREN & priv->original_slvcmd))
> -		outb_p(SMBSLVCMD_HST_NTFY_INTREN | priv->original_slvcmd,
> -		       SMBSLVCMD(priv));
> +	/*
> +	 * Enable host notify interrupt and block the generation of interrupt
> +	 * from the SMB_ALERT signal because the driver does not support
> +	 * SMBus Alert yet.

does not support ... yet -->
  has not supported ... yet
  does not support

?

> +	 */
> +	outb_p(SMBSLVCMD_HST_NTFY_INTREN | SMBSLVCMD_SMBALERT_DISABLE |
> +	       priv->original_slvcmd, SMBSLVCMD(priv));
>  
>  	/* clear Host Notify bit to allow a new notification */
>  	outb_p(SMBSLVSTS_HST_NTFY_STS, SMBSLVSTS(priv));
> -- 
> 2.33.0
> 

-- 
With Best Regards,
Andy Shevchenko


