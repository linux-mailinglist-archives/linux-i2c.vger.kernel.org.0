Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B896D60D1A3
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Oct 2022 18:30:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbiJYQad (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Oct 2022 12:30:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbiJYQab (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Oct 2022 12:30:31 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10EA837416;
        Tue, 25 Oct 2022 09:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666715430; x=1698251430;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OCw8LBAbtL6n1oVf4Uw+wL2lj/NP8ROrSq3ggGOmy3Q=;
  b=iOXuxJ0BV8mUgkOZ0P/tlXlxmcL3i5BfcGiU1iBKg2v7J1mv715dEI3b
   QLgQ9pu1QbQOrYB94qdD67BlTycHA0my5qtYS2Avd7adEB+VAIdz0w676
   2QCggpk2/0CtM+fBI7ohSfM3NKWRIhUYojEMrwMSkDAkFITX/8hUVg1gM
   GKgxtMPlqxqhMaQGUcNEVJtTtF3T3+kAEUeK0+ehz9iFa8SZyWA5UL7q0
   SJpgQqgG9rrPvQuUc90JmMSprKVwAhQFEuuIV7mLnsOEj0wWBDRqM58te
   xLyDft7MCgOP6atx5faWPYVVR/62kV74gnEh+80O7CtTxs9KMSPXeihER
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="291028459"
X-IronPort-AV: E=Sophos;i="5.95,212,1661842800"; 
   d="scan'208";a="291028459"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2022 09:30:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="662866531"
X-IronPort-AV: E=Sophos;i="5.95,212,1661842800"; 
   d="scan'208";a="662866531"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 25 Oct 2022 09:30:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1onMoZ-0026O3-2W;
        Tue, 25 Oct 2022 19:30:07 +0300
Date:   Tue, 25 Oct 2022 19:30:07 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Akhil R <akhilrajeev@nvidia.com>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 2/2] i2c: i2c-smbus: fwnode_irq_get_byname() return
 value fix
Message-ID: <Y1gPDyS2ck90pDF1@smile.fi.intel.com>
References: <cover.1666710197.git.mazziesaccount@gmail.com>
 <fbd52f5f5253b382b8d7b3e8046134de29f965b8.1666710197.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbd52f5f5253b382b8d7b3e8046134de29f965b8.1666710197.git.mazziesaccount@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Oct 25, 2022 at 06:12:11PM +0300, Matti Vaittinen wrote:
> The fwnode_irq_get_byname() was changed to not return 0 upon failure so
> return value check can be adjusted to reflect the change.

...

> Depends on the mentioned return value change which is in patch 1/2. The
> return value change does also cause a functional change here. Eg. when
> IRQ mapping fails, the fwnode_irq_get_byname() no longer returns zero.
> This will cause also the probe here to return nonzero failure. I guess
> this is desired behaviour.

The entire error handling there looks suspicious.

The 'struct i2c_smbus_alert_setup' description says:

 "If irq is not specified, the smbus_alert driver doesn't take care of
  interrupt handling. In that case it is up to the I2C bus driver to
  either handle the interrupts or to poll for alerts."

So, the question is, shouldn't we just drop the check completely?

-- 
With Best Regards,
Andy Shevchenko


