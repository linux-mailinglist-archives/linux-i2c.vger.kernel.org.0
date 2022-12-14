Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F3D864C842
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Dec 2022 12:43:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238010AbiLNLnR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Dec 2022 06:43:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238332AbiLNLms (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Dec 2022 06:42:48 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BCF420F7D;
        Wed, 14 Dec 2022 03:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671018149; x=1702554149;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ABJWidSLQnkvGeJdDDPuZHC7hKijESz9RFton+Q9SLo=;
  b=jocMIDxwA0wsCpe7lxqJYXP+vnQ15mdZsT7Erdsycgg/tKwqk47p8LKG
   VlxTCbNK2ObWk0uIUue9iufuaucvAXg2fCS+9mTEmQcKYBat96+hIG6KK
   fkj9aeCwiWeIwecSSb3O5Wno7xSnaSF3eRJCVgK9ToHoCkhgOiThotvWj
   3GMip/VZ/GX9lhiBnp7qeULr0k+IENJtQY6zUnnYRaJA1UHgYfwcE9HJ9
   GBMO9y2YCeeibCcy0rfLiJjIHRYkkS+7DPSub33+/IR8zJ6lRkjcizak/
   mrFMvEMfga/KojfhjNwsv63YIxitn1tSU95MwchnKzW2XQs7cJyZQZfIM
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="345451351"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; 
   d="scan'208";a="345451351"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2022 03:42:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="681488896"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; 
   d="scan'208";a="681488896"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 14 Dec 2022 03:42:24 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p5Q9W-009mWy-3C;
        Wed, 14 Dec 2022 13:42:22 +0200
Date:   Wed, 14 Dec 2022 13:42:22 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hanna Hawa <hhhawa@amazon.com>
Cc:     jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, dwmw@amazon.co.uk, benh@amazon.com,
        ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com,
        hanochu@amazon.com, farbere@amazon.com, itamark@amazon.com
Subject: Re: [PATCH 1/1] i2c: designware: add pinctrl for recovery info as an
 option
Message-ID: <Y5m2nux5Q1npXAo+@smile.fi.intel.com>
References: <20221214102707.60018-1-hhhawa@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221214102707.60018-1-hhhawa@amazon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Dec 14, 2022 at 10:27:07AM +0000, Hanna Hawa wrote:
> The current implementation of designware recovery mechanism fit for
> specific device (Intel / Altera Cyclone V SOC) which have two separated
> "wired" GPIOs to the i2c bus via the SOC FPGA for the i2c recovery.
> 
> This change add ability to get the pinctrl for the i2c recovery in order
> to switch between pin configuration (I2C and GPIO functionality) if the
> pinctrl exists.

...

> +	rinfo->pinctrl = devm_pinctrl_get(dev->dev);
> +	if (IS_ERR(rinfo->pinctrl)) {
> +		if (PTR_ERR(rinfo->pinctrl) == -EPROBE_DEFER)
> +			return -EPROBE_DEFER;
> +		rinfo->pinctrl = NULL;
> +		dev_dbg(dev->dev, "can't get pinctrl for i2c recovery\n");
> +	}

Can you explain, why pinctrl_bind_pins() is not enough?

(You may also refer to the ab78029ecc34 ("drivers/pinctrl: grab default handles
 from device core") for more details.)

-- 
With Best Regards,
Andy Shevchenko


