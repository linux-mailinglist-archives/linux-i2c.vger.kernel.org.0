Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8971631C88
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Nov 2022 10:10:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230165AbiKUJKV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Nov 2022 04:10:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230166AbiKUJJ5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Nov 2022 04:09:57 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C41A8DA5D;
        Mon, 21 Nov 2022 01:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669021797; x=1700557797;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=YK1fJnwYjE6pEUlQTwqHgFrvyAFXsLhLRFs9q3IFLwA=;
  b=VPqJBqz+oqplmUPzu2q7pq7XThTBKojIo8jlrRXcoQHVpvGQ98kNWf/G
   gEHNcsBG6U0VdzNV2qOPiZw2dM+ri0UVhaWyf+9OVUDKr5+vKUzeinHVT
   FXTRnA9nv6+qqOPlerOxlZo/FXWPwTiZchWb8mTcpHCsR/rX2eC7Wlviz
   sOfS2fBRDtneqpeibT02FmVbeecfVxe6D1/vCItvJjgT8Qp4k4mcOW+8S
   1S2O0d+SdHL6bpiO9GOniJhoZpysDd0LTLl+Axpw4uu8BYNLKsWZ41pEq
   2yPRWGXdb0AmJHi4Ta0Hq8GWNpDJYEcLXM8RGiF5wTH7GB8+UcAaY6DFv
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="293221035"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="293221035"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 01:09:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="783378100"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="783378100"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 21 Nov 2022 01:09:51 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 21 Nov 2022 11:09:51 +0200
Date:   Mon, 21 Nov 2022 11:09:51 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Corey Minyard <cminyard@mvista.com>,
        Colin Ian King <colin.i.king@gmail.com>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-usb@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 584/606] usb: typec: ucsi: stm32g0: Convert to i2c's
 .probe_new()
Message-ID: <Y3tAX8I3EWoIlraR@kuha.fi.intel.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-585-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-585-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:45:18PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi_stm32g0.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_stm32g0.c b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> index 7b92f0c8de70..93fead0096b7 100644
> --- a/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> +++ b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> @@ -626,7 +626,7 @@ static int ucsi_stm32g0_probe_bootloader(struct ucsi *ucsi)
>  	return 0;
>  }
>  
> -static int ucsi_stm32g0_probe(struct i2c_client *client, const struct i2c_device_id *id)
> +static int ucsi_stm32g0_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
>  	struct ucsi_stm32g0 *g0;
> @@ -763,7 +763,7 @@ static struct i2c_driver ucsi_stm32g0_i2c_driver = {
>  		.of_match_table = of_match_ptr(ucsi_stm32g0_typec_of_match),
>  		.pm = pm_sleep_ptr(&ucsi_stm32g0_pm_ops),
>  	},
> -	.probe = ucsi_stm32g0_probe,
> +	.probe_new = ucsi_stm32g0_probe,
>  	.remove = ucsi_stm32g0_remove,
>  	.id_table = ucsi_stm32g0_typec_i2c_devid
>  };

thanks,

-- 
heikki
