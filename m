Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 401A152D05D
	for <lists+linux-i2c@lfdr.de>; Thu, 19 May 2022 12:21:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232530AbiESKVQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 May 2022 06:21:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236674AbiESKVA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 May 2022 06:21:00 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4D8CA1A1;
        Thu, 19 May 2022 03:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652955657; x=1684491657;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FatCZH8qt4fgDVYzoY7VrgkzS4VzXbrP3W8FkMBs2z0=;
  b=VScy/omhTnl5wqLmBajz5G+rjDZSTm6ZuWhtwbjEZ+9K3xoLQmK53uCm
   4ioNCQRNdVS9gZ5d6dZ4aIeqxI67bQ07sdJNSxDoFaBP6215dpw3BcWLQ
   +2zzuHIx1IsSBreCIXYyoZOwx4/hXJvnvLvFpH87E4cRVrlboFnwc8847
   iYaCNB0mvITW2dsZOvDgbWlh/b00Xm5hbsDYi5aFLkGzXcHYQ2BzEjMw9
   IwHV0jkTheQcr4QaNED36Fz0iWLhJjTlrCMRr76EgSslUIFchM5CBpzpa
   65kwql20F47GWPiK6p99zchYAfdnh1SN4fGQ9/Nh38DtSd+VGms3rUgEu
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="271832918"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; 
   d="scan'208";a="271832918"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2022 03:20:57 -0700
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; 
   d="scan'208";a="570134209"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2022 03:20:55 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nrdH2-000FaJ-5o;
        Thu, 19 May 2022 13:20:52 +0300
Date:   Thu, 19 May 2022 13:20:51 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dinh Nguyen <dinguyen@kernel.org>
Cc:     jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        robh+dt@kernel.org, krzk+dt@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: designware: introduce a custom scl recovery for
 SoCFPGA platforms
Message-ID: <YoYaA5iTin3rzuob@smile.fi.intel.com>
References: <20220518202217.85803-1-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220518202217.85803-1-dinguyen@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 18, 2022 at 03:22:16PM -0500, Dinh Nguyen wrote:
> The I2C pins on the SoCFPGA platforms do not go through a GPIO module,
> thus cannot be recovered by the default method of by doing a GPIO access.
> Only a reset of the I2C IP block can a recovery be successful.

...

>  #define MODEL_BAIKAL_BT1	BIT(9)
>  #define MODEL_AMD_NAVI_GPU	BIT(10)
> +#define MODEL_SOCFPGA		BIT(11)

...

> -#define MODEL_MASK		GENMASK(11, 8)

> +#define MODEL_MASK		GENMASK(12, 8)

Why this change is made?

...

> +	switch (dev->flags & MODEL_MASK) {
> +	case MODEL_SOCFPGA:
> +		rinfo->recover_bus = i2c_custom_scl_recovery;

_custom_ is too broad, use exact name, i.e.

	i2c_socfpga_scl_recovery

> +		break;
> +	default:
> +		rinfo->recover_bus = i2c_generic_scl_recovery;
> +		break;
> +	}

...

> +	{ .compatible = "intel,socfpga-i2c", .data = (void *)MODEL_SOCFPGA },

> +

Stray change.

-- 
With Best Regards,
Andy Shevchenko


