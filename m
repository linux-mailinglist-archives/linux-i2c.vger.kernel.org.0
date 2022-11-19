Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 972D1630E99
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 13:03:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231777AbiKSMDw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Nov 2022 07:03:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231658AbiKSMDu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Nov 2022 07:03:50 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 611581D337;
        Sat, 19 Nov 2022 04:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668859429; x=1700395429;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=yW4nfdgNhTgrlVD9CZ4AM85k+btTwwC+nY12lvuGCB0=;
  b=DKXBQYpZgafrq2W6Qicms+/2pZnq1kPNd/soXeA79vhwlMeoh9zQO49w
   Y7m2D39nleYYNEh0oWRe7GRlHCskqYjL7eWCiwiyA6AK30AvRGJcOs/f2
   6bl+QYVyVG1qq6GrsKshcX7yLX5eX8IHUwc5JMVwvBsqezTrGBdeQSrvO
   I9qh5LSQAISMSAzkn6iPl5ud8M8vMmhkenxrLMIFEwKOi6qRH5kz0nIdk
   Qpcjp6PfYaixrapAklGxXWBp0VDhgfY7hEdDHYDm3OAffS1IkW4HHMBYq
   noJTUzMlwwUNaQCs8+GwjlIZDdHpR3iphx3VLUTxH9r5uj5GqM3VrW5q6
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="300852242"
X-IronPort-AV: E=Sophos;i="5.96,176,1665471600"; 
   d="scan'208";a="300852242"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2022 04:03:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="885606693"
X-IronPort-AV: E=Sophos;i="5.96,176,1665471600"; 
   d="scan'208";a="885606693"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 19 Nov 2022 04:03:44 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1owMZS-00ERTC-2A;
        Sat, 19 Nov 2022 14:03:42 +0200
Date:   Sat, 19 Nov 2022 14:03:42 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Dmitry Rokosov <DDRokosov@sberdevices.ru>,
        Miaoqian Lin <linmq006@gmail.com>,
        wangjianli <wangjianli@cdjrlc.com>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 054/606] iio: accel: kxcjk-1013: Convert to i2c's
 .probe_new()
Message-ID: <Y3jGHufAJVxZp1f0@smile.fi.intel.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-55-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-55-uwe@kleine-koenig.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:36:28PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> .probe_new() doesn't get the i2c_device_id * parameter, so determine
> that explicitly in the probe function.

Since there is no split on per subsystem basis (I mean, as a series targeting
only, let's say, IIO subsystem with cover letter), I'm answering here that all
IIO patches are good to me, thanks, Uwe!

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/iio/accel/kxcjk-1013.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iio/accel/kxcjk-1013.c b/drivers/iio/accel/kxcjk-1013.c
> index e626b6fa8a36..98da4bda22df 100644
> --- a/drivers/iio/accel/kxcjk-1013.c
> +++ b/drivers/iio/accel/kxcjk-1013.c
> @@ -1424,9 +1424,9 @@ static const char *kxcjk1013_match_acpi_device(struct device *dev,
>  	return dev_name(dev);
>  }
>  
> -static int kxcjk1013_probe(struct i2c_client *client,
> -			   const struct i2c_device_id *id)
> +static int kxcjk1013_probe(struct i2c_client *client)
>  {
> +	const struct i2c_device_id *id = i2c_client_get_device_id(client);
>  	static const char * const regulator_names[] = { "vdd", "vddio" };
>  	struct kxcjk1013_data *data;
>  	struct iio_dev *indio_dev;
> @@ -1732,7 +1732,7 @@ static struct i2c_driver kxcjk1013_driver = {
>  		.of_match_table = kxcjk1013_of_match,
>  		.pm	= &kxcjk1013_pm_ops,
>  	},
> -	.probe		= kxcjk1013_probe,
> +	.probe_new	= kxcjk1013_probe,
>  	.remove		= kxcjk1013_remove,
>  	.id_table	= kxcjk1013_id,
>  };
> -- 
> 2.38.1
> 

-- 
With Best Regards,
Andy Shevchenko


