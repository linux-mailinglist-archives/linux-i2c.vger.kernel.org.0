Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 926C8609BFD
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Oct 2022 10:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230040AbiJXIB5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Oct 2022 04:01:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbiJXIBz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Oct 2022 04:01:55 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1A115D729;
        Mon, 24 Oct 2022 01:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666598513; x=1698134513;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PscHU1ZUOYvLbYdHmHk85RNII8BoOIqBa+IXJPv7aY4=;
  b=iH1j9wYgOdIVa6tFJDE7F8LJ0kJOXm/TW7PfjMEKyuC6F2Fby+4pOEv+
   T6bjO94H1LTKeUABRkDN2edsC07rMmokVUZ/36aDLQXDR1kFpk3LC/sWR
   pfHHtT2nx4VCQeFkwzR5J/WBln2JCSFPYCmXUsSSmoez2Iv3UODknOxHG
   iEs24yRZuo5j7oBAgR3kEudzoa17YZVIGBQo0OQiMt4pwaJIIreaCpg5E
   Y4sWroTOQVPsaCUrEsZYBkoD7hF2IyjMO+cKNCeyB1GCOjC6M6nxEb6tO
   AkptQj0meClYejj8oNeEuKWWoKjOl1DEMCm52GiBzdeavQiDxRe3RFo5e
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="290663906"
X-IronPort-AV: E=Sophos;i="5.95,207,1661842800"; 
   d="scan'208";a="290663906"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2022 01:01:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="773736785"
X-IronPort-AV: E=Sophos;i="5.95,207,1661842800"; 
   d="scan'208";a="773736785"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 24 Oct 2022 01:01:44 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 24 Oct 2022 11:01:43 +0300
Date:   Mon, 24 Oct 2022 11:01:43 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Wayne Chang <waynec@nvidia.com>
Cc:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, treding@nvidia.com,
        jonathanh@nvidia.com, thierry.reding@gmail.com, ajayg@nvidia.com,
        kishon@ti.com, vkoul@kernel.org, p.zabel@pengutronix.de,
        balbi@kernel.org, mathias.nyman@intel.com, jckuo@nvidia.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, singhanc@nvidia.com,
        linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 06/11] usb: typec: ucsi_ccg: Replace ccgx to well-known
 regex
Message-ID: <Y1ZGZ2H0/ug3se6j@kuha.fi.intel.com>
References: <20221024074128.1113554-1-waynec@nvidia.com>
 <20221024074128.1113554-7-waynec@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221024074128.1113554-7-waynec@nvidia.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 24, 2022 at 03:41:23PM +0800, Wayne Chang wrote:
> ccgx is refer to the cypress cypd4226 typec controller.
> Replace ccgx to well-known regex "cypress".
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> ---
>  drivers/usb/typec/ucsi/ucsi_ccg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index 139707a2f3d6..5d3099e6eb77 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -1358,7 +1358,7 @@ static int ucsi_ccg_probe(struct i2c_client *client,
>  	INIT_WORK(&uc->pm_work, ccg_pm_workaround_work);
>  
>  	/* Only fail FW flashing when FW build information is not provided */
> -	status = device_property_read_u16(dev, "ccgx,firmware-build",
> +	status = device_property_read_u16(dev, "cypress,firmware-build",
>  					  &uc->fw_build);
>  	if (status)
>  		dev_err(uc->dev, "failed to get FW build information\n");

This will break bisectability. You need to first add that
"cyppress,firmware-build" identifier without removing the old
"ccgx,firmware-build" identifier, and then introduce a separate
clean-up patch where you remove it when it's safe to remove:

1. Add new - This patch.
2. Modify users - PATCH 7/11.
3. Remove old - *missing*.

thanks,

-- 
heikki
