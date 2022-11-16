Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 716CC62BE4C
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Nov 2022 13:38:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239084AbiKPMiA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Nov 2022 07:38:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238998AbiKPMhm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Nov 2022 07:37:42 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D215014D39;
        Wed, 16 Nov 2022 04:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668602240; x=1700138240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oGL1Yrskd/4Uu+QY6jG0ey36GZ59SJOBtdPf971QTPY=;
  b=GK7r0bdOXjKtEAaI9H7vKKevHPds/osMv8p3Bg2dLRNZRCqGztDzrORh
   6fgPl31s0PoMGe5PoRJhhcbYHB/KkaErJceXMdvUCEitre2IQhO8xdTfU
   cAsa42Lw65y85U+PrFEesn2V9LcYUjybV3bDpbOUGjqZPc0ZjuDtQ+8yc
   fzRO9VmjZ3cxV9s8c3VSpDHoojvPYw/Irosud8DfFcA2mqN1iRWtK0laa
   U7D3BJh+ek6kQDYik0dqzIvjHdzJZbM1z5VKYizttGq0+m/TgFQjXH/a9
   HcBXK3lojlQ56BTZUbh4LTfX4ZmKsE58OfkOblRsJtFTUzsu27X7o5Ure
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="376801379"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="376801379"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2022 04:37:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="781751953"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="781751953"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 16 Nov 2022 04:37:10 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 16 Nov 2022 14:37:10 +0200
Date:   Wed, 16 Nov 2022 14:37:10 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Wayne Chang <waynec@nvidia.com>
Cc:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, treding@nvidia.com,
        jonathanh@nvidia.com, thierry.reding@gmail.com, ajayg@nvidia.com,
        vkoul@kernel.org, p.zabel@pengutronix.de, balbi@kernel.org,
        mathias.nyman@intel.com, jckuo@nvidia.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, singhanc@nvidia.com,
        linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 05/13] usb: typec: ucsi_ccg: Add OF support
Message-ID: <Y3TZdkdIltobUcb3@kuha.fi.intel.com>
References: <20221114124053.1873316-1-waynec@nvidia.com>
 <20221114124053.1873316-6-waynec@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221114124053.1873316-6-waynec@nvidia.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 14, 2022 at 08:40:45PM +0800, Wayne Chang wrote:
> The change enables the device tree infrastructure support.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> V2 -> V3:nothing has changed
> V1 -> V2:nothing has changed
>  drivers/usb/typec/ucsi/ucsi_ccg.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index 835f1c4372ba..139707a2f3d6 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -643,7 +643,7 @@ static int ccg_request_irq(struct ucsi_ccg *uc)
>  {
>  	unsigned long flags = IRQF_ONESHOT;
>  
> -	if (!has_acpi_companion(uc->dev))
> +	if (!dev_fwnode(uc->dev))
>  		flags |= IRQF_TRIGGER_HIGH;
>  
>  	return request_threaded_irq(uc->irq, NULL, ccg_irq_handler, flags, dev_name(uc->dev), uc);
> @@ -1427,6 +1427,12 @@ static void ucsi_ccg_remove(struct i2c_client *client)
>  	free_irq(uc->irq, uc);
>  }
>  
> +static const struct of_device_id ucsi_ccg_of_match_table[] = {
> +		{ .compatible = "cypress,cypd4226", },
> +		{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ucsi_ccg_of_match_table);
> +
>  static const struct i2c_device_id ucsi_ccg_device_id[] = {
>  	{"ccgx-ucsi", 0},
>  	{}
> @@ -1481,6 +1487,7 @@ static struct i2c_driver ucsi_ccg_driver = {
>  		.pm = &ucsi_ccg_pm,
>  		.dev_groups = ucsi_ccg_groups,
>  		.acpi_match_table = amd_i2c_ucsi_match,
> +		.of_match_table = ucsi_ccg_of_match_table,
>  	},
>  	.probe = ucsi_ccg_probe,
>  	.remove = ucsi_ccg_remove,

thanks,

-- 
heikki
