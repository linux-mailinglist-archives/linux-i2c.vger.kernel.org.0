Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE233EA26A
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Aug 2021 11:48:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235508AbhHLJtC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Aug 2021 05:49:02 -0400
Received: from mga14.intel.com ([192.55.52.115]:1482 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235145AbhHLJtC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 12 Aug 2021 05:49:02 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10073"; a="215048389"
X-IronPort-AV: E=Sophos;i="5.84,315,1620716400"; 
   d="scan'208";a="215048389"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2021 02:48:37 -0700
X-IronPort-AV: E=Sophos;i="5.84,315,1620716400"; 
   d="scan'208";a="527700435"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2021 02:48:36 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1mE7KA-008Xdh-BL; Thu, 12 Aug 2021 12:48:30 +0300
Date:   Thu, 12 Aug 2021 12:48:30 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2 1/9] i2c: i801: Improve disabling runtime pm
Message-ID: <YRTubuupevq0JMbW@smile.fi.intel.com>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
 <10690555-2317-4916-70b8-870708858f9b@gmail.com>
 <YRPvtPid3EeMylSr@smile.fi.intel.com>
 <3f225422-b343-eaef-0a95-9d15a5a378f2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f225422-b343-eaef-0a95-9d15a5a378f2@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 11, 2021 at 10:03:12PM +0200, Heiner Kallweit wrote:
> On 11.08.2021 17:41, Andy Shevchenko wrote:
> > On Fri, Aug 06, 2021 at 11:12:18PM +0200, Heiner Kallweit wrote:
> >> Setting the autosuspend delay to a negative value disables runtime pm in
> >> a little bit smarter way, because we need no cleanup when removing the
> >> driver. Note that this is safe when reloading the driver, because the
> >> call to pm_runtime_set_autosuspend_delay() in probe() will reverse the
> >> effect. See update_autosuspend() for details.
> > 
> > ...
> > 
> >>  		 * BIOS is accessing the host controller so prevent it from
> >>  		 * suspending automatically from now on.
> >>  		 */
> >> -		pm_runtime_get_sync(&pdev->dev);
> >> +		pm_runtime_set_autosuspend_delay(&pdev->dev, -1);
> > 
> > I dunno if it's being discussed, but with this you effectively allow user to
> > override the setting. It may screw things up AFAIU the comment above.
> > 
> No, this hasn't been discussed. At least not now. Thanks for the hint.
> This attribute is writable for the root user, so we could argue that
> the root user has several options to break the system anyway.

But it will mean the side effect on this driver and typical (root-run) system
application (systemd like?) should care now the knowledge about this
side-effect. I do not think it is desired behaviour. But I'm not a maintainer
and I commented here just to make everybody understand the consequences of the
change.

-- 
With Best Regards,
Andy Shevchenko


