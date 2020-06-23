Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7ED204DA4
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jun 2020 11:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731904AbgFWJPl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Jun 2020 05:15:41 -0400
Received: from mga14.intel.com ([192.55.52.115]:20380 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731887AbgFWJPl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Jun 2020 05:15:41 -0400
IronPort-SDR: 71IiMv+GSg0EE1yIk1CAmPFi/wsiVuMPtzh0csKYoOso3U5V4HsI4Mjsz7dzgj/13p5CyzQree
 cROoHds8zHxg==
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="143079450"
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; 
   d="scan'208";a="143079450"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2020 02:15:40 -0700
IronPort-SDR: 9ecuZ+G7GrAEeTW18nK3raseLUJZmWl/ZxbFLzykfBg11Ek8nsS/Ur4be8Pw74R56/q8BilU+Z
 E5im+7C7MZLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; 
   d="scan'208";a="310401281"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 23 Jun 2020 02:15:39 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jnf1p-00FKmg-3z; Tue, 23 Jun 2020 12:15:41 +0300
Date:   Tue, 23 Jun 2020 12:15:41 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH] i2c: designware: Fix bus speed in !CONFIG_ACPI case
Message-ID: <20200623091541.GR2428291@smile.fi.intel.com>
References: <20200623083113.241137-1-jarkko.nikula@linux.intel.com>
 <20200623084635.GP2428291@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623084635.GP2428291@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jun 23, 2020 at 11:46:35AM +0300, Andy Shevchenko wrote:
> On Tue, Jun 23, 2020 at 11:31:13AM +0300, Jarkko Nikula wrote:
> > John Stultz reported that commit f9288fcc5c615 ("i2c: designware: Move
> > ACPI parts into common module") caused a regression on the HiKey board
> > where adv7511 HDMI bridge driver wasn't probing anymore due the I2C bus
> > failed to start.
> > 
> > It seems the change caused the bus speed being zero when CONFIG_ACPI
> > not set and neither speed based on "clock-frequency" device property or
> > default fast mode is set.
> > 
> > Fix this by moving bus speed setting back to dw_i2c_plat_probe() and let
> > the i2c_dw_acpi_adjust_bus_speed() adjust only speed from ACPI.
> 
> I have slightly different idea, I'll send a patch soon after testing.

Just sent a patch. Please, review.

-- 
With Best Regards,
Andy Shevchenko


