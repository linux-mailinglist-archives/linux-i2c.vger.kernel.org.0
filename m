Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 651545B8558
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Sep 2022 11:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230474AbiINJmx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Sep 2022 05:42:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231172AbiINJm2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Sep 2022 05:42:28 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 258EB32AB5;
        Wed, 14 Sep 2022 02:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663148528; x=1694684528;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KygSRb8RNrq6ueX2RVvRzI4GlM9IvgjpZfDFHSuvf9I=;
  b=HD2cffVnRwWgEaSEMDuD4Ok07WPghqktwKfpdnGWMsXlXK6lBYSV2ooz
   ndYfcn0HAx72JgbvVf1zQlguPxaplgAOR8zcH5NQzHhVJRbsKH/idNg7P
   RW1Dxl2x8yEiD/439ZZYvf/LH5BvLiGY3KsgGGSjtvJWxBFmSylltCGYe
   C3bNZJJD6U3xHkG0JTBdoxMhS8RsWb5/Zbh422ULWzvNvVwGD1X6KetbN
   z8p9Hfq28aCLIdNX3IVGLXY1ncRPSvbJNsQ4R/HpOXMWgisWCBwRbXf3e
   zmwdDDv2KeOM565P2YHjDrSTotx/cYGZKohfUu6LYoCUGWuYWs1hTu4n6
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="278114977"
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; 
   d="scan'208";a="278114977"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2022 02:42:07 -0700
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; 
   d="scan'208";a="685251593"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2022 02:42:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oYOu9-0028hA-2F;
        Wed, 14 Sep 2022 12:42:01 +0300
Date:   Wed, 14 Sep 2022 12:42:01 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Raul Rangel <rrangel@chromium.org>
Cc:     Linux ACPI <linux-acpi@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        "jingle.wu" <jingle.wu@emc.com.tw>,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
        Tim Van Patten <timvp@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 07/13] i2c: acpi: Use ACPI wake capability bit to set
 wake_irq
Message-ID: <YyGh6Yjbb/5rkh35@smile.fi.intel.com>
References: <20220912221317.2775651-1-rrangel@chromium.org>
 <20220912160931.v2.7.I8af4282adc72eb9f247adcd03676a43893a020a6@changeid>
 <YyC9N62JaMGaeanf@smile.fi.intel.com>
 <CAHQZ30DAr_BwH03=bG9tfCSGW+-he-c-4PPeJMOqH28cVcKDoA@mail.gmail.com>
 <YyDNAw+ur177ayY0@smile.fi.intel.com>
 <CAHQZ30DP1asiMj7hoebQQvGqE36sBDjaFmp3ju3eUEF1PruFeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHQZ30DP1asiMj7hoebQQvGqE36sBDjaFmp3ju3eUEF1PruFeg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 13, 2022 at 12:56:37PM -0600, Raul Rangel wrote:
> On Tue, Sep 13, 2022 at 12:33 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Sep 13, 2022 at 12:07:53PM -0600, Raul Rangel wrote:

...

> > This is similar to what of_i2c_get_board_info() does, no?
> > Note: _get_ there.
> 
> `*info` is an out parameter in that case. Ideally I would have
> `i2c_acpi_get_irq`, `acpi_dev_gpio_irq_get_wake`,
> `platform_get_irq_optional`, and `i2c_dev_irq_from_resources` all
> return a `struct irq_info {int irq; bool wake_capable;}`. This would
> be a larger change though.

Seems the ACPI analogue is i2c_acpi_fill_info(). Can we do it there?

-- 
With Best Regards,
Andy Shevchenko


