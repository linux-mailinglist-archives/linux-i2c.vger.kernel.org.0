Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5049F744162
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Jun 2023 19:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231718AbjF3Rhf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Jun 2023 13:37:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231857AbjF3Rhe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 30 Jun 2023 13:37:34 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D3DB1FE4;
        Fri, 30 Jun 2023 10:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688146653; x=1719682653;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dm6Sl1OEMpFX+zHsfmQ4rudo1iU9mbzP0Adu+TolMaY=;
  b=AzzEdiWKzJJNkTEf6Dd6CzhhXMAsVItlLhScmWNvrT3QjyjKhN0Tu/7E
   u/6w7gKM9Rx8XHPrO0nlvIhI/51Qsuc82vr7CGEJt69eUlPY+eIfBUIw8
   lr3iZRu8GHigaOnDOk8MFVXTevbNkqGM/rdhWjw/I2LGre+4/yTRnXxZo
   0frZH3bHEkEVH6dpGY14qR6guFan5PtWLWnmFRLPvbwz3Lrin4qkw0BGS
   w0MtrUfbpAHgznV8cwFPrvYauFMPfNDZIFhoNBzFhjR/MHpQegXEzbUfy
   DlJuHipI1U/WZLoBxk94+g+Bx85OoaOhSYls0OxvcrxFMiBC16knBiCyG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="352272354"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="352272354"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 10:37:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="787789404"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="787789404"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 30 Jun 2023 10:37:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qFI3d-001AR3-2g;
        Fri, 30 Jun 2023 20:37:21 +0300
Date:   Fri, 30 Jun 2023 20:37:21 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Wu, Wentong" <wentong.wu@intel.com>
Cc:     "Ye, Xiang" <xiang.ye@intel.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>,
        "Zhang, Lixu" <lixu.zhang@intel.com>
Subject: Re: [PATCH v5 1/5] usb: Add support for Intel LJCA device
Message-ID: <ZJ8S0ds4IX4wLF9V@smile.fi.intel.com>
References: <20230312190435.3568212-1-xiang.ye@intel.com>
 <20230312190435.3568212-2-xiang.ye@intel.com>
 <20230313170341.GV9667@google.com>
 <ZBAqTqZEDz/vAwVC@ye-NUC7i7DNHE>
 <ZBAyKQwnQ8fxHRuU@kuha.fi.intel.com>
 <ZBCU5h/A2woJLtvT@ye-NUC7i7DNHE>
 <ZBCYVNmoo2EdDY90@smile.fi.intel.com>
 <ZBGLYXxpkwokgV4R@kuha.fi.intel.com>
 <DM6PR11MB43163C9D76023777B36380B98D2AA@DM6PR11MB4316.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB43163C9D76023777B36380B98D2AA@DM6PR11MB4316.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jun 30, 2023 at 07:40:48AM +0000, Wu, Wentong wrote:
> > From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Sent: Wednesday, March 15, 2023 5:10 PM
> > On Tue, Mar 14, 2023 at 05:52:52PM +0200, Andy Shevchenko wrote:
> > > On Tue, Mar 14, 2023 at 11:38:14PM +0800, Ye, Xiang wrote:
> > > > On Tue, Mar 14, 2023 at 10:36:57AM +0200, Heikki Krogerus wrote:
> > > > > On Tue, Mar 14, 2023 at 04:03:26PM +0800, Ye, Xiang wrote:

...

> > > > > You don't really seem to get any benefit from MFD. Perhaps it
> > > > > would be more appropriate and clear if you just registered
> > > > > auxiliary devices in this driver. Check drivers/base/auxiliary.c.
> > > > Yes, it should be a work. I have a question.
> > > > MFD provides the ACPI binding for sub-devices through struct
> > > > mfd_cell_acpi_match. But I didn't see this in drivers/base/auxiliary.c.
> > > > If using auxiliary bus to implement the LJCA sub-devices, we need to
> > > > do the sub-devices acpi binding manually in ljca.c.
> > > >
> > > > Something Like:
> > > > adr = LJCA_ACPI_MATCH_GPIO
> > > > adev = acpi_find_child_device(parent, adr, false);
> > > > ACPI_COMPANION_SET(&pdev->dev, adev ?: parent);
> > > >
> > > > Is that acceptable?
> 
> This actually doesn't work, look at the acpi_find_child_device(), it compares
> the bus address specified by _ADR object, but there is no _ADR object in DSDT
> for these three devices because the relationship between the parent and
> children isn't bus type listed in ACPI spec, so it always return NULL.

If you want to have this on ACPI enabled platform, ACPI table has to have
the necessary bits. What you are describing is a BIOS bug _or_ somebody has
to provide the SSDT overlay depending on the real connection of the device..

> > Looks ok to me.
> > 
> > > Maybe you can implement this on the level of auxiliary bus.
> > 
> > I would actually prefer that the auxiliary bus itself does not make any
> > assumptions regarding the whereabouts of the fwnodes at this stage. Maybe
> > later, when(if) there are more users.

-- 
With Best Regards,
Andy Shevchenko


