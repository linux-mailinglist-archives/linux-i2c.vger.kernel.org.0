Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 256A3631C54
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Nov 2022 10:06:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229957AbiKUJGK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Nov 2022 04:06:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229909AbiKUJGH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Nov 2022 04:06:07 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9059583EBB;
        Mon, 21 Nov 2022 01:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669021566; x=1700557566;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Q1XM2FQnV3HV/erohw/6BcN8dtVdOAeGf+I9EBQJpAU=;
  b=EifBon7dXPmol6RWGQ6QHtN5tKjUhIf+Yk7sXJF9bY4M50WmoLaq3ttp
   X8rixOZ5cN9dskdk1AV+dS0QhO2O/la1Wo6m2boO+xZfX5HZAzpViiGKj
   ImRzgzAmyO7BXWN+0NM57g/VM88F4ZKbQ5iF7PZq//ujrAplcw9b7ItZI
   Xipj8M16EuJcZMj817c3Cp0QXe9nwmgso5MhBfQ717D2sx0Gy976bs47i
   GeP090d68mQOaP+0ezLnvcAFYgyVfH/K/LaMTftnkrwlFhr5enlG7uT19
   WKAtREgLExf9xb4cG0S3gqHQXW+Aaw3/AWBTAcjjQ0gWVMGuk4HvSCMOp
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="340368441"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="340368441"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 01:06:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="783376344"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="783376344"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 21 Nov 2022 01:06:02 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 21 Nov 2022 11:06:01 +0200
Date:   Mon, 21 Nov 2022 11:06:01 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 578/606] usb: typec: hd3ss3220: Convert to i2c's
 .probe_new()
Message-ID: <Y3s/eWXzGKGfuAUR@kuha.fi.intel.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-579-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-579-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:45:12PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/hd3ss3220.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
> index 2a58185fb14c..f128664cb130 100644
> --- a/drivers/usb/typec/hd3ss3220.c
> +++ b/drivers/usb/typec/hd3ss3220.c
> @@ -148,8 +148,7 @@ static const struct regmap_config config = {
>  	.max_register = 0x0A,
>  };
>  
> -static int hd3ss3220_probe(struct i2c_client *client,
> -		const struct i2c_device_id *id)
> +static int hd3ss3220_probe(struct i2c_client *client)
>  {
>  	struct typec_capability typec_cap = { };
>  	struct hd3ss3220 *hd3ss3220;
> @@ -264,7 +263,7 @@ static struct i2c_driver hd3ss3220_driver = {
>  		.name = "hd3ss3220",
>  		.of_match_table = of_match_ptr(dev_ids),
>  	},
> -	.probe = hd3ss3220_probe,
> +	.probe_new = hd3ss3220_probe,
>  	.remove =  hd3ss3220_remove,
>  };
>  

thanks,

-- 
heikki
