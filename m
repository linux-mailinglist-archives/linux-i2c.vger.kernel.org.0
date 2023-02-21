Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C401E69E1BE
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Feb 2023 14:53:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233620AbjBUNxs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Feb 2023 08:53:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234138AbjBUNxp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Feb 2023 08:53:45 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFC2C30D8;
        Tue, 21 Feb 2023 05:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676987623; x=1708523623;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+eRDC691oir3wn0epCnaH+FpHq/QnxwHp1Fu+GKbieU=;
  b=n8UWTeEXAxr7MbRj/nquCJTs4Q2jrQ8MIawoOwub+I+vhZvwFA5MpPUn
   dwSfWgPKNQbq1YrR0g6p6e6OkOoDCURaSgYtW6BW3yRzjOzN5t9JRiz32
   LhNdAk1hBsyKTPeYers5ZNuJfpYn6n3iFYhyQ8xtd3osmHV8+qUEtFtn6
   zM+bywgWOGgcaLf5nLtOgtXZ5GxbOsBfbT9z2K8kthDrvtAe0yE6XBXAl
   9XQI2tpuY3XeH0e1q0/kseKOAdg4Rm5ohL432jjrYojjdgJSzoT8styQy
   vo3ngdJZDJxDrdtnd3oIQ+PcZUEk8xlQSEDNJXXhH5pNPrOIwFQBuHnR5
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="320765317"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="320765317"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 05:53:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="814514299"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="814514299"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 21 Feb 2023 05:53:38 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 21 Feb 2023 15:53:38 +0200
Date:   Tue, 21 Feb 2023 15:53:37 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Raul E Rangel <rrangel@chromium.org>,
        Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-usb@vger.kernel.org,
        Robin van der Gracht <robin@protonic.nl>,
        Miguel Ojeda <ojeda@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 1/3] usb: typec: stusb160x: Make use of
 device_get_match_data()
Message-ID: <Y/TM4UihoGI/5Q71@kuha.fi.intel.com>
References: <20230221133307.20287-1-andriy.shevchenko@linux.intel.com>
 <20230221133307.20287-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221133307.20287-2-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 21, 2023 at 03:33:05PM +0200, Andy Shevchenko wrote:
> Switching to use device_get_match_data() helps getting of
> i2c_of_match_device() API.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/stusb160x.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/stusb160x.c b/drivers/usb/typec/stusb160x.c
> index 494b371151e0..70d9f68d99c9 100644
> --- a/drivers/usb/typec/stusb160x.c
> +++ b/drivers/usb/typec/stusb160x.c
> @@ -11,6 +11,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/property.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/usb/role.h>
> @@ -633,9 +634,8 @@ MODULE_DEVICE_TABLE(of, stusb160x_of_match);
>  
>  static int stusb160x_probe(struct i2c_client *client)
>  {
> +	const struct regmap_config *regmap_config;
>  	struct stusb160x *chip;
> -	const struct of_device_id *match;
> -	struct regmap_config *regmap_config;
>  	struct fwnode_handle *fwnode;
>  	int ret;
>  
> @@ -645,8 +645,8 @@ static int stusb160x_probe(struct i2c_client *client)
>  
>  	i2c_set_clientdata(client, chip);
>  
> -	match = i2c_of_match_device(stusb160x_of_match, client);
> -	regmap_config = (struct regmap_config *)match->data;
> +	regmap_config = device_get_match_data(&client->dev);
> +
>  	chip->regmap = devm_regmap_init_i2c(client, regmap_config);
>  	if (IS_ERR(chip->regmap)) {
>  		ret = PTR_ERR(chip->regmap);

thanks,

-- 
heikki
