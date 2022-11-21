Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAE2A631C7A
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Nov 2022 10:09:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230005AbiKUJJI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Nov 2022 04:09:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230042AbiKUJIv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Nov 2022 04:08:51 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B18BA8A173;
        Mon, 21 Nov 2022 01:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669021730; x=1700557730;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Rnum/f98DCwepSy1xWkxPybQGGhC/aG2W+0RQ/lwNn0=;
  b=AMwnbn5/2bULEtjmHhH6bGaU5TOxWfhS7pYD4VJDmoFvSDYb9h7T8Vtv
   DO0wv/b8xiNHkbxwscFpvszJyspvP8oPNk2V2GWQXwxP5Wu/4Ld8HsaM9
   GvQDFVi5e+uv5bkmxa1vHXD9auGR+EPJ0a2GFxhX3fD7ls5blvaeqGnAt
   ClagtTOL86d5BTvmDmTT6EpX1nJvBGiD8P8VCTveTSYBT95QVbCGtVcwC
   3FI5EPvWn8OlHWD95r0WVXRdaXeE1NYPf5TdVuaNI/aISuIt7QrpMXsC6
   RLe46pFqY0oJV7g+K2iFF2RAs9sKru5NFYhMIstk6BywtUkADm4cPNtVp
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="315332804"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="315332804"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 01:08:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="783377604"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="783377604"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 21 Nov 2022 01:08:46 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 21 Nov 2022 11:08:45 +0200
Date:   Mon, 21 Nov 2022 11:08:45 +0200
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
Subject: Re: [PATCH 582/606] usb: typec: tcpm/tcpci_rt1711h: Convert to i2c's
 .probe_new()
Message-ID: <Y3tAHd9wzPNqpIzd@kuha.fi.intel.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-583-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-583-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:45:16PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpci_rt1711h.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> index 7b217c712c11..a0e9e3fe8564 100644
> --- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> +++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> @@ -327,8 +327,7 @@ static int rt1711h_check_revision(struct i2c_client *i2c, struct rt1711h_chip *c
>  	return ret;
>  }
>  
> -static int rt1711h_probe(struct i2c_client *client,
> -			 const struct i2c_device_id *i2c_id)
> +static int rt1711h_probe(struct i2c_client *client)
>  {
>  	int ret;
>  	struct rt1711h_chip *chip;
> @@ -413,7 +412,7 @@ static struct i2c_driver rt1711h_i2c_driver = {
>  		.name = "rt1711h",
>  		.of_match_table = of_match_ptr(rt1711h_of_match),
>  	},
> -	.probe = rt1711h_probe,
> +	.probe_new = rt1711h_probe,
>  	.remove = rt1711h_remove,
>  	.id_table = rt1711h_id,
>  };

thanks,

-- 
heikki
