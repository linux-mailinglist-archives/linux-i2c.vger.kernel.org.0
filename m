Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC55C6B9A6A
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Mar 2023 16:53:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231231AbjCNPxc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Mar 2023 11:53:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230287AbjCNPxb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Mar 2023 11:53:31 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39A467B109;
        Tue, 14 Mar 2023 08:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678809183; x=1710345183;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TbG9kxbBuRazw+lkPlts7eEQOkz3o6LrN3ByWSVtvhQ=;
  b=miw/jxYuxluW7GiX74csc9uOAUk2HoiS4H4JpzBmzivUKraRLgW0DU1l
   dr7JV0G3b6fxpwZTadc8fh+4+yfbzucbopvl1y3jXZhHLOzjLDldlEqtU
   pSyKBQ6/zYth7Rhc8/XsZHuiD1myfpBnaGzaybkOaXr36XyLuQR6siLGw
   MvHnnlEWmk+CCSahkM1lu9JnXQun4fnS3S/ORX0V79QpD226GW8fxix5z
   RSwT91ZmPDU4L+PVk73vIwhfje1GTFdFiNKWRDbPUAm1zzRCz2sFs2C0+
   wZJnLFD2hJuQTVwgYe/ePC8Nd9gXyvhOS58wXI6t41+xiCS2vYLV86gYL
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="400050736"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="400050736"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 08:53:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="672397601"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="672397601"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 14 Mar 2023 08:52:55 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pc6xJ-003Iei-0i;
        Tue, 14 Mar 2023 17:52:53 +0200
Date:   Tue, 14 Mar 2023 17:52:52 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Ye, Xiang" <xiang.ye@intel.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Lee Jones <lee@kernel.org>,
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
Message-ID: <ZBCYVNmoo2EdDY90@smile.fi.intel.com>
References: <20230312190435.3568212-1-xiang.ye@intel.com>
 <20230312190435.3568212-2-xiang.ye@intel.com>
 <20230313170341.GV9667@google.com>
 <ZBAqTqZEDz/vAwVC@ye-NUC7i7DNHE>
 <ZBAyKQwnQ8fxHRuU@kuha.fi.intel.com>
 <ZBCU5h/A2woJLtvT@ye-NUC7i7DNHE>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBCU5h/A2woJLtvT@ye-NUC7i7DNHE>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 14, 2023 at 11:38:14PM +0800, Ye, Xiang wrote:
> On Tue, Mar 14, 2023 at 10:36:57AM +0200, Heikki Krogerus wrote:
> > On Tue, Mar 14, 2023 at 04:03:26PM +0800, Ye, Xiang wrote:

...

> > You don't really seem to get any benefit from MFD. Perhaps it would be
> > more appropriate and clear if you just registered auxiliary devices in
> > this driver. Check drivers/base/auxiliary.c.
> Yes, it should be a work. I have a question.
> MFD provides the ACPI binding for sub-devices through
> struct mfd_cell_acpi_match. But I didn't see this in drivers/base/auxiliary.c.
> If using auxiliary bus to implement the LJCA sub-devices, we need to do
> the sub-devices acpi binding manually in ljca.c.
> 
> Something Like:
> adr = LJCA_ACPI_MATCH_GPIO
> adev = acpi_find_child_device(parent, adr, false);
> ACPI_COMPANION_SET(&pdev->dev, adev ?: parent);
> 
> Is that acceptable?

Maybe you can implement this on the level of auxiliary bus.


-- 
With Best Regards,
Andy Shevchenko


