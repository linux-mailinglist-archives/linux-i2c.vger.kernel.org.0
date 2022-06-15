Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67D7B54C601
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jun 2022 12:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245537AbiFOKYC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jun 2022 06:24:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347519AbiFOKYA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Jun 2022 06:24:00 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FE761129;
        Wed, 15 Jun 2022 03:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655288639; x=1686824639;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HquhvexWsP/f5gyfcKiimGA3mEzHOd3dzsAoIQLW4hk=;
  b=MhAG4ihaQAWOQCsXGwEim98sVcWMtqzvTdE1Ge+g4gCLUKvp6pDBntTg
   tX29IKV6H6wCXtyM6ZYd08JgOHWv4K1iN7Zl9p1neX1bADudh4zXcuOQO
   ebEovQtJbfbN2+Qrztmvv3pLOLUyWDGZnoNEcGIZGFNnFqDhjXz0AJq3O
   CfAtFJ1DOF4WvixThaEnIZaeloQuiRfSBlVchuFAKanla43CTavdmckFL
   JYtNgjCnHJUukonTNm6DjqqjFpA1hXC7wVEqe1zMb4iEUacH7L6V2V9Xc
   s2etVTyUiRM1myt4CKBD7IAqr0WxaA4roOQ5vusJuYBv9al0Id/T/j262
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="261937221"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="261937221"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 03:23:58 -0700
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="674421180"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 03:23:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1o1QBl-000dIK-SV;
        Wed, 15 Jun 2022 13:23:53 +0300
Date:   Wed, 15 Jun 2022 13:23:53 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dinh Nguyen <dinguyen@kernel.org>
Cc:     jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        robh+dt@kernel.org, krzk+dt@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCHv3 1/2] i2c: designware: introduce a custom scl recovery
 for SoCFPGA platforms
Message-ID: <YqmzOT7wyCzj1mtw@smile.fi.intel.com>
References: <20220613210032.773826-1-dinguyen@kernel.org>
 <YqmyD2w5iriUYpQf@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqmyD2w5iriUYpQf@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 15, 2022 at 01:18:55PM +0300, Andy Shevchenko wrote:
> On Mon, Jun 13, 2022 at 04:00:31PM -0500, Dinh Nguyen wrote:


The below won't fly, see my corrections below.

> static int i2c_dw_init_socfpga_recovery_info(struct dw_i2c_dev *dev,
> 					     struct i2c_bus_recovery_info *rinfo)
> {
> 	rinfo->recover_bus = i2c_socfpga_scl_recovery;
> 	return 0;

	return 1;

> }
> 
> static int i2c_dw_init_generic_recovery_info(struct dw_i2c_dev *dev,
> 					     struct i2c_bus_recovery_info *rinfo)
> {
> 	struct i2c_adapter *adap = &dev->adapter;
> 	struct gpio_desc *gpio;
> 
> 	gpio = devm_gpiod_get_optional(dev->dev, "scl", GPIOD_OUT_HIGH);
> 	if (IS_ERR_OR_NULL(gpio))
> 		return PTR_ERR_OR_ZERO(gpio);
> 
> 	rinfo->scl_gpiod = gpio;
> 
> 	gpio = devm_gpiod_get_optional(dev->dev, "sda", GPIOD_IN);
> 	if (IS_ERR(gpio))
> 		return PTR_ERR(gpio);
> 	rinfo->sda_gpiod = gpio;
> 
> 	rinfo->recover_bus = i2c_generic_scl_recovery;
> 
> 	dev_info(dev->dev, "running with gpio recovery mode! scl%s",
> 		 rinfo->sda_gpiod ? ",sda" : "");
> 
> 	return 0;

	return 1;

> }
> 
> static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
> {
> 	struct i2c_bus_recovery_info *rinfo = &dev->rinfo;
> 	struct i2c_adapter *adap = &dev->adapter;
> 	int ret;
> 
> 	switch (dev->flags & MODEL_MASK) {
> 	case MODEL_SOCFPGA:
> 		ret = i2c_dw_init_socfpga_recovery_info(dev, rinfo);
> 		break;
> 	default:
> 		ret = i2c_dw_init_generic_recovery_info(dev, rinfo);
> 		break;
> 	}
> 	if (ret)

	/* The recovery is optional, that's why 0 should be returned to the caller */
	if (ret <= 0)

> 		return ret;
> 
> 	rinfo->prepare_recovery = i2c_dw_prepare_recovery;
> 	rinfo->unprepare_recovery = i2c_dw_unprepare_recovery;
> 	adap->bus_recovery_info = rinfo;
> 
> 	return 0;
> }

-- 
With Best Regards,
Andy Shevchenko


