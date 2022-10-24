Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBE9C609D10
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Oct 2022 10:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230399AbiJXIqb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Oct 2022 04:46:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230385AbiJXIq3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Oct 2022 04:46:29 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0459D67056;
        Mon, 24 Oct 2022 01:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666601189; x=1698137189;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zr3WKsPxb7aaiIO0Wjz4+22fObmXP9eCkj8VHh8e+Zw=;
  b=ivH+6Aiule3GXccJQb5bNmoDVy81GpkcZ4Q9RauKIkZsFODgkMs6cE8D
   eFGKyNwTDiro+gbzfChUpsLiACAgyLA/UjPHvfoDhjRM1tfTncw8mSryk
   AMWpg8pUSZiovFJseXClQKNSi6A3pmOv1u8iKJi+bE+/+X/ssl7lafhmq
   AoPyfwkAvxgsnWTkGZQOPah2J+x8OHsBxqnZMjvtKn7WUvzKC9FMFlFwO
   U6oIj/VvaULXWMi5uDK1WFA6Hg9WZpncT5wcNzJJTISMq29+c82SQSjpW
   WrZJcxeKyTdy8nQtSeh29CBbJZFgPsyvwhDhshoyP3s+QOuIbMnfWFq9e
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="304978464"
X-IronPort-AV: E=Sophos;i="5.95,207,1661842800"; 
   d="scan'208";a="304978464"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2022 01:46:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="773746804"
X-IronPort-AV: E=Sophos;i="5.95,207,1661842800"; 
   d="scan'208";a="773746804"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 24 Oct 2022 01:46:20 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 24 Oct 2022 11:46:20 +0300
Date:   Mon, 24 Oct 2022 11:46:20 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Wayne Chang <waynec@nvidia.com>, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        treding@nvidia.com, jonathanh@nvidia.com, thierry.reding@gmail.com,
        ajayg@nvidia.com, kishon@ti.com, vkoul@kernel.org,
        p.zabel@pengutronix.de, mathias.nyman@intel.com, jckuo@nvidia.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, singhanc@nvidia.com,
        linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 06/11] usb: typec: ucsi_ccg: Replace ccgx to well-known
 regex
Message-ID: <Y1ZQ3NyR7Suxdltu@kuha.fi.intel.com>
References: <20221024074128.1113554-1-waynec@nvidia.com>
 <20221024074128.1113554-7-waynec@nvidia.com>
 <Y1ZGZ2H0/ug3se6j@kuha.fi.intel.com>
 <87czaheiag.fsf@balbi.sh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87czaheiag.fsf@balbi.sh>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 24, 2022 at 11:29:27AM +0300, Felipe Balbi wrote:
> Heikki Krogerus <heikki.krogerus@linux.intel.com> writes:
> 
> > On Mon, Oct 24, 2022 at 03:41:23PM +0800, Wayne Chang wrote:
> >> ccgx is refer to the cypress cypd4226 typec controller.
> >> Replace ccgx to well-known regex "cypress".
> >> 
> >> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> >> ---
> >>  drivers/usb/typec/ucsi/ucsi_ccg.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >> 
> >> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> >> index 139707a2f3d6..5d3099e6eb77 100644
> >> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> >> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> >> @@ -1358,7 +1358,7 @@ static int ucsi_ccg_probe(struct i2c_client *client,
> >>  	INIT_WORK(&uc->pm_work, ccg_pm_workaround_work);
> >>  
> >>  	/* Only fail FW flashing when FW build information is not provided */
> >> -	status = device_property_read_u16(dev, "ccgx,firmware-build",
> >> +	status = device_property_read_u16(dev, "cypress,firmware-build",
> >>  					  &uc->fw_build);
> >>  	if (status)
> >>  		dev_err(uc->dev, "failed to get FW build information\n");
> >
> > This will break bisectability. You need to first add that
> > "cyppress,firmware-build" identifier without removing the old
> > "ccgx,firmware-build" identifier, and then introduce a separate
> > clean-up patch where you remove it when it's safe to remove:
> >
> > 1. Add new - This patch.
> > 2. Modify users - PATCH 7/11.
> > 3. Remove old - *missing*.
> 
> will it ever be safe to remove? What about potential products in the
> market with little to no upgrade path? There are likely to be products
> with a DTB that will never be updated, no?

Not the case here. OF support is only just added to this driver in
this series. That old identifier has been used as a build-in property
only.

thanks,

-- 
heikki
