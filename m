Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BDDD631C5A
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Nov 2022 10:07:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbiKUJHE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Nov 2022 04:07:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230071AbiKUJG6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Nov 2022 04:06:58 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BDA26DCF7;
        Mon, 21 Nov 2022 01:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669021617; x=1700557617;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=El1owSZ4AYMdxBGJ9rCbI7dkNXVMjMjSZLv6HRn5Xaw=;
  b=SCZoh0PVM+cPk8JfqKnCtSyfaO7diNEkl4IwP/dsV3Jde16G3HDtnVGH
   GXU6lcD6kh+Zvy7PRoekiwWuRGIoMbj1fqUp2wH8GUlCDE+Cv8xmnEHSS
   QyyuDseR+6L+kBw5RbqGXU/GqqK/UB0cTNAk0/lVjJ4+b1EzXhfjrr6Nj
   oqy7+GUBY8mE+97fRzmke2UlZAxieZC4D7dfRxU3K3SVc/jK2RoZcTOQH
   EUTTqLtxSFP8uufpTpESrp16yGkXMJFJ9SPoERhhmWATXENv95kUIpSUS
   BG9iX6xhNRqVUWj4dVuLISEtXVcD7JE0pCbgCTJK0rfYzrCyJL8x4suUe
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="312213379"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="312213379"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 01:06:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="783376645"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="783376645"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 21 Nov 2022 01:06:53 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 21 Nov 2022 11:06:52 +0200
Date:   Mon, 21 Nov 2022 11:06:52 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 579/606] usb: typec: tcpm/fusb302: Convert to i2c's
 .probe_new()
Message-ID: <Y3s/rFMTr8JCMuyd@kuha.fi.intel.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-580-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-580-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:45:13PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/fusb302.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> index 721b2a548084..1ffce00d94b4 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -1677,8 +1677,7 @@ static struct fwnode_handle *fusb302_fwnode_get(struct device *dev)
>  	return fwnode;
>  }
>  
> -static int fusb302_probe(struct i2c_client *client,
> -			 const struct i2c_device_id *id)
> +static int fusb302_probe(struct i2c_client *client)
>  {
>  	struct fusb302_chip *chip;
>  	struct i2c_adapter *adapter = client->adapter;
> @@ -1837,7 +1836,7 @@ static struct i2c_driver fusb302_driver = {
>  		   .pm = &fusb302_pm_ops,
>  		   .of_match_table = of_match_ptr(fusb302_dt_match),
>  		   },
> -	.probe = fusb302_probe,
> +	.probe_new = fusb302_probe,
>  	.remove = fusb302_remove,
>  	.id_table = fusb302_i2c_device_id,
>  };

thanks,

-- 
heikki
