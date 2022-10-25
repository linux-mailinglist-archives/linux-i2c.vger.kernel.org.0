Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2CB160C7FB
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Oct 2022 11:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231432AbiJYJZe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Oct 2022 05:25:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231742AbiJYJYw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Oct 2022 05:24:52 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 155D043E75;
        Tue, 25 Oct 2022 02:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666689631; x=1698225631;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l4RAmKLBRNslFOm+KFNGMtX8OfMzndTuAtK1gS15Rro=;
  b=GanJK1/4df3tsoQEL5GB3eUO5MqI3riu4IsSYAxCigooggsn9L2scN0k
   8HxqSdZFArmcSlfy+i4yFw2GGGzspH1kMzc2vnu8Ktw8g8LaoHtEy4oyw
   EyjWicN4gq2yEFLJH8YfwolrROTo0XEYNdSlduj/6n3ChmnV/+njgnyun
   WLi2oK4B5OcB4YTeZh8ox4drni6zQojsInmvTeL7cxNya5C+eCiujcpHM
   JatsNV2Sl5LWLJ+8vXhHVDUnpXELmaKD+beeOBoTj7IlOgd3NVSO4A0J0
   8PRtGqhUKpCdGLN0ECfUqQQsNbclDbzP8Q8gjgp1p/H2cYzH9WNS+Gxk/
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="393945858"
X-IronPort-AV: E=Sophos;i="5.95,211,1661842800"; 
   d="scan'208";a="393945858"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2022 02:20:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="694883930"
X-IronPort-AV: E=Sophos;i="5.95,211,1661842800"; 
   d="scan'208";a="694883930"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 25 Oct 2022 02:20:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1onG6j-001v8A-2h;
        Tue, 25 Oct 2022 12:20:25 +0300
Date:   Tue, 25 Oct 2022 12:20:25 +0300
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
Subject: Re: [PATCH 0/2] fix fwnode_irq_get_byname() returnvalue
Message-ID: <Y1eqWbyJLlEW5Mdo@smile.fi.intel.com>
References: <cover.1666687086.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1666687086.git.mazziesaccount@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Oct 25, 2022 at 11:50:24AM +0300, Matti Vaittinen wrote:
> The fix fwnode_irq_get_byname() may have returned zero if mapping the
> IRQ fails. This contradicts the documentation. Furthermore, returning
> zero or errno on error is unepected and can easily lead to problems
> like:
> 
> int probe(foo)
> {
> ...
> 	ret = fwnode_irq_get_byname(...);
> 	if (ret < 0)
> 		return ret;
> ...
> }
> 
> or
> 
> int probe(foo)
> {
> ...
> 	ret = fwnode_irq_get_byname(...);
> 	if (ret <= 0)
> 		return ret;
> ...
> }
> 
> which are both likely to be wrong. First treats zero as successful call and
> misses the IRQ mapping failure. Second returns zero from probe even though
> it detects the IRQ mapping failure correvtly.
> 
> Here we change the fwnode_irq_get_byname() to always return a negative
> errno upon failure. I have also audited following callers:
> 
> drivers/i2c/i2c-smbus.c
> drivers/iio/accel/adxl355_core.c
> drivers/iio/gyro/fxas21002c_core.c
> drivers/iio/imu/adis16480.c
> drivers/iio/imu/bmi160/bmi160_core.c
> drivers/iio/imu/bmi160/bmi160_core.c
> 
> and it seems to me these calls will be Ok after the change. The
> i2c-smbus.c will gain a functional change (bugfix?) as after this patch
> the probe will return -EINVAL should the IRQ mapping fail. The series
> will also adjust the return value check for zero to be omitted.

Thanks for doing this, no major comments except worrying about fwnode_irq_get()
which is left untouched an hence different error domain for the same
family of API.

For these patches:
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>


-- 
With Best Regards,
Andy Shevchenko


