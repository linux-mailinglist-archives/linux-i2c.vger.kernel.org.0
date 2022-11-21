Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED66E631C64
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Nov 2022 10:08:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbiKUJIT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Nov 2022 04:08:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229999AbiKUJIN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Nov 2022 04:08:13 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73A721C90B;
        Mon, 21 Nov 2022 01:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669021692; x=1700557692;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=0XuQAzofuwdZ+xWy2bdRs86GfDkAHDVptIdIzVrlpIQ=;
  b=fJBcDIvmFNUz5oS6n3kx3/wt+kxFvfdWsRhEplhEHDFjFHIqxiJ+dnrS
   XlbWGXuYfDljmMjYbLMMRmjHfb1vLKkSmi3QFHX5pbGL+XmDwVHMC9V1i
   g9JV185FLLN4emy8Oj1BtVcvaKRUv7sHwPsq9fary8fRSW4ODTjV4CGLP
   ZyYSOwLsJBe7OEb3r1eMHw/6Gs+PFvuIM0T9yq2oJVEp+1zbdigJCH3fw
   HBjI0pJi+oyDTW1UqLIiAO1WR97PQ953dEQmN25fr8kbcQ1zovjPoUc7o
   j57n4WBJwC39gcfy6ycJ/4bbVFJiwSGw/Kx/pczQkMRy7d0CrTMH0TSjj
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="293901312"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="293901312"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 01:08:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="783377103"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="783377103"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 21 Nov 2022 01:08:08 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 21 Nov 2022 11:08:07 +0200
Date:   Mon, 21 Nov 2022 11:08:07 +0200
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
Subject: Re: [PATCH 581/606] usb: typec: tcpm/tcpci_maxim: Convert to i2c's
 .probe_new()
Message-ID: <Y3s/958Y/Xw2mujx@kuha.fi.intel.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-582-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-582-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:45:15PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpci_maxim.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci_maxim.c b/drivers/usb/typec/tcpm/tcpci_maxim.c
> index 03f89e6f1a78..83e140ffcc3e 100644
> --- a/drivers/usb/typec/tcpm/tcpci_maxim.c
> +++ b/drivers/usb/typec/tcpm/tcpci_maxim.c
> @@ -438,7 +438,7 @@ static int tcpci_init(struct tcpci *tcpci, struct tcpci_data *data)
>  	return -1;
>  }
>  
> -static int max_tcpci_probe(struct i2c_client *client, const struct i2c_device_id *i2c_id)
> +static int max_tcpci_probe(struct i2c_client *client)
>  {
>  	int ret;
>  	struct max_tcpci_chip *chip;
> @@ -519,7 +519,7 @@ static struct i2c_driver max_tcpci_i2c_driver = {
>  		.name = "maxtcpc",
>  		.of_match_table = of_match_ptr(max_tcpci_of_match),
>  	},
> -	.probe = max_tcpci_probe,
> +	.probe_new = max_tcpci_probe,
>  	.remove = max_tcpci_remove,
>  	.id_table = max_tcpci_id,
>  };

thanks,

-- 
heikki
