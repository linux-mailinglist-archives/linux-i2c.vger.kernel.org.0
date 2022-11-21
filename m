Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7B64631C7D
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Nov 2022 10:09:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbiKUJJv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Nov 2022 04:09:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230081AbiKUJJg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Nov 2022 04:09:36 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE1888DA4A;
        Mon, 21 Nov 2022 01:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669021771; x=1700557771;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=iJBlNMxuMvGuPsHeEWP0axMcKV69XdXooK27Jk8W2iQ=;
  b=Kk6798SWWmiOO+7nmP38fcEMm9sfsJpH1cw9i+Kz6Jp9jK+CburriOZN
   k9YQoa1AW8RV73aonDbnBPX3bGbDZMr/O/6ylaBCtDYEfz5RNJMIGHsVr
   Gtglu2AzKD8CcUF14GX3NukSTY9115F/gpfQ4tzWJ9qDWyRYFMQZPnioJ
   aiU4M5b1NG08KQBLrJj+YFI+zpMCOYIp03RBDGtese/JIhX+T0lfYqRp3
   RJ9VGzqlLfjMsBpUnknIsx6MNoG+O1O1smiglDNDdcaV6ZBCUUM0rMKUa
   aQPRw1CebZXylYbVUHWsot/oX05/QJ3dxXOvNFQrYJ22fY46jfxEPoKpl
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="293220961"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="293220961"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 01:09:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="783377981"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="783377981"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 21 Nov 2022 01:09:24 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 21 Nov 2022 11:09:24 +0200
Date:   Mon, 21 Nov 2022 11:09:24 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sing-Han Chen <singhanc@nvidia.com>,
        Sanket Goswami <Sanket.Goswami@amd.com>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 583/606] usb: typec: ucsi/ucsi_ccg: Convert to i2c's
 .probe_new()
Message-ID: <Y3tARALjhs+QFfVb@kuha.fi.intel.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-584-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-584-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:45:17PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi_ccg.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index 835f1c4372ba..46441f1477f2 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -1338,8 +1338,7 @@ static struct attribute *ucsi_ccg_attrs[] = {
>  };
>  ATTRIBUTE_GROUPS(ucsi_ccg);
>  
> -static int ucsi_ccg_probe(struct i2c_client *client,
> -			  const struct i2c_device_id *id)
> +static int ucsi_ccg_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
>  	struct ucsi_ccg *uc;
> @@ -1482,7 +1481,7 @@ static struct i2c_driver ucsi_ccg_driver = {
>  		.dev_groups = ucsi_ccg_groups,
>  		.acpi_match_table = amd_i2c_ucsi_match,
>  	},
> -	.probe = ucsi_ccg_probe,
> +	.probe_new = ucsi_ccg_probe,
>  	.remove = ucsi_ccg_remove,
>  	.id_table = ucsi_ccg_device_id,
>  };

thanks,

-- 
heikki
