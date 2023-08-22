Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DD09784499
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Aug 2023 16:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233228AbjHVOnr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Aug 2023 10:43:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232957AbjHVOnr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Aug 2023 10:43:47 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8EE0124;
        Tue, 22 Aug 2023 07:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692715425; x=1724251425;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=CZBWAUJ1YziSU1jNwy5/HWNayXg6woaad+C8SdM8SNA=;
  b=gTuxGU/DiEC6WyhFQMUJf0oKMQyJXE2vjFcDe+broXC5tbb9sZiuYDso
   o18JGTMDxIKI3MKKnBNTkvK4dfoNfV+qfIwg5Q5ZaOVgT9H5DgEkMOaSl
   3zfThTWe1e/FiPoVD6LBo6+wQZZXcfq2GZmbsDYrhjOEOAxU859NfKVok
   IRp+fQEmBhJzSWPZsCFlPACPSDbLPRlnZqykpyNIYuuDynK5Kr1G9FeAX
   ryw/mSC5XWpG1t6I1ezdVDhItTzaSKzoEZAnupNYOGZKRF9a4rqdYwS1o
   +RYBoIMWQjzApJEh5PWxa6fitfVcV8nggw3O0eCFUVZshwqorbMEQq7em
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="377656020"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="377656020"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 07:43:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="850645964"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="850645964"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 22 Aug 2023 07:43:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qYSbd-00Em1X-1c;
        Tue, 22 Aug 2023 17:43:41 +0300
Date:   Tue, 22 Aug 2023 17:43:41 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yann Sionneau <ysionneau@kalray.eu>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Julian Vetter <jvetter@kalrayinc.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] i2c: designware: Add support for recovery when GPIO
 need pinctrl.
Message-ID: <ZOTJnWjG90tyGkJl@smile.fi.intel.com>
References: <20230822143437.9395-1-ysionneau@kalray.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230822143437.9395-1-ysionneau@kalray.eu>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Aug 22, 2023 at 04:34:37PM +0200, Yann Sionneau wrote:
> Currently if the SoC needs pinctrl to switch the SCL and SDA from the I2C
> function to GPIO function, the recovery won't work.
> 
> scl-gpio = <>;
> sda-gpio = <>;
> 
> Are not enough for some SoCs to have a working recovery.
> Some need:
> 
> scl-gpio = <>;
> sda-gpio = <>;
> pinctrl-names = "default", "recovery";
> pinctrl-0 = <&i2c_pins_hw>;
> pinctrl-1 = <&i2c_pins_gpio>;
> 
> The driver was not filling rinfo->pinctrl with the device node
> pinctrl data which is needed by generic recovery code.

Now looks pretty much good enough (yet the period is not needed in the Subject,
but it's fine for your newbie submission — no need to resend or make a new
version). Thank you!

-- 
With Best Regards,
Andy Shevchenko


