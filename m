Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3596C6BABC1
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Mar 2023 10:10:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232027AbjCOJKt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Mar 2023 05:10:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232144AbjCOJKD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Mar 2023 05:10:03 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2421720552;
        Wed, 15 Mar 2023 02:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678871400; x=1710407400;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/9hlg9yvvgpQ82GIW45TeHtdlD4HR1qF/6Lf3lWQJgw=;
  b=UenlTkr4nijzWFtp2dEEFevoy+XXLGM1IHQxaq1KodPfW1v6dYPBtrWc
   iloj+Wd/9+SZFn7zhr67tDaYqoes2cOrITqpGxwQ9++h+H25m3XLhV4tp
   CVJjIcM2edmAx5V8uFK5U3Sel7KpzuF6aCJMRJUHrtckRSI16S7ONVsYU
   uQiTkDUsONynEP874ihTs9K20u0Vv6Z7XePFBm6m1ZtUg1bkrn1qaR1R6
   ZQFbfW8z4MWcX+89lKD1e6+l7YpJrVbvtPFFm6CQMG2ecKf7ENHhUwQld
   /8KrmHIwv9xQ64ye8LjIhr3lsv9Nzw9cK8pFYHTSpe8l4m6NSAuNPTbd+
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="335137374"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="335137374"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 02:09:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="822702202"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="822702202"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 15 Mar 2023 02:09:54 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 15 Mar 2023 11:09:53 +0200
Date:   Wed, 15 Mar 2023 11:09:53 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "Ye, Xiang" <xiang.ye@intel.com>, Lee Jones <lee@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
        srinivas.pandruvada@intel.com, sakari.ailus@linux.intel.com,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com
Subject: Re: [PATCH v5 1/5] usb: Add support for Intel LJCA device
Message-ID: <ZBGLYXxpkwokgV4R@kuha.fi.intel.com>
References: <20230312190435.3568212-1-xiang.ye@intel.com>
 <20230312190435.3568212-2-xiang.ye@intel.com>
 <20230313170341.GV9667@google.com>
 <ZBAqTqZEDz/vAwVC@ye-NUC7i7DNHE>
 <ZBAyKQwnQ8fxHRuU@kuha.fi.intel.com>
 <ZBCU5h/A2woJLtvT@ye-NUC7i7DNHE>
 <ZBCYVNmoo2EdDY90@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBCYVNmoo2EdDY90@smile.fi.intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 14, 2023 at 05:52:52PM +0200, Andy Shevchenko wrote:
> On Tue, Mar 14, 2023 at 11:38:14PM +0800, Ye, Xiang wrote:
> > On Tue, Mar 14, 2023 at 10:36:57AM +0200, Heikki Krogerus wrote:
> > > On Tue, Mar 14, 2023 at 04:03:26PM +0800, Ye, Xiang wrote:
> 
> ...
> 
> > > You don't really seem to get any benefit from MFD. Perhaps it would be
> > > more appropriate and clear if you just registered auxiliary devices in
> > > this driver. Check drivers/base/auxiliary.c.
> > Yes, it should be a work. I have a question.
> > MFD provides the ACPI binding for sub-devices through
> > struct mfd_cell_acpi_match. But I didn't see this in drivers/base/auxiliary.c.
> > If using auxiliary bus to implement the LJCA sub-devices, we need to do
> > the sub-devices acpi binding manually in ljca.c.
> > 
> > Something Like:
> > adr = LJCA_ACPI_MATCH_GPIO
> > adev = acpi_find_child_device(parent, adr, false);
> > ACPI_COMPANION_SET(&pdev->dev, adev ?: parent);
> > 
> > Is that acceptable?

Looks ok to me.

> Maybe you can implement this on the level of auxiliary bus.

I would actually prefer that the auxiliary bus itself does not make
any assumptions regarding the whereabouts of the fwnodes at this
stage. Maybe later, when(if) there are more users.

thanks,

-- 
heikki
