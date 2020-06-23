Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C590E204CD5
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jun 2020 10:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731825AbgFWIqf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Jun 2020 04:46:35 -0400
Received: from mga07.intel.com ([134.134.136.100]:60455 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731709AbgFWIqf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Jun 2020 04:46:35 -0400
IronPort-SDR: V0C1TffF2Fj8Tv+pUowfqPYZzj0L7r4OCkg1AgLH7w6VRjM1C24J9sMD+Q75XhnBGllVRBFzAm
 PHQfF4725AkQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="209205776"
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; 
   d="scan'208";a="209205776"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2020 01:46:34 -0700
IronPort-SDR: wCjqBTukgcKRI3kWnI+rOyn48RSwRVvG1JOtAWItWEhC6g91k5sRQtS2JXKDsynpj3aZ/mG9HD
 S43fOxy0K07g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; 
   d="scan'208";a="279051553"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006.jf.intel.com with ESMTP; 23 Jun 2020 01:46:33 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jneZf-00FKPX-OM; Tue, 23 Jun 2020 11:46:35 +0300
Date:   Tue, 23 Jun 2020 11:46:35 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH] i2c: designware: Fix bus speed in !CONFIG_ACPI case
Message-ID: <20200623084635.GP2428291@smile.fi.intel.com>
References: <20200623083113.241137-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623083113.241137-1-jarkko.nikula@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jun 23, 2020 at 11:31:13AM +0300, Jarkko Nikula wrote:
> John Stultz reported that commit f9288fcc5c615 ("i2c: designware: Move
> ACPI parts into common module") caused a regression on the HiKey board
> where adv7511 HDMI bridge driver wasn't probing anymore due the I2C bus
> failed to start.
> 
> It seems the change caused the bus speed being zero when CONFIG_ACPI
> not set and neither speed based on "clock-frequency" device property or
> default fast mode is set.
> 
> Fix this by moving bus speed setting back to dw_i2c_plat_probe() and let
> the i2c_dw_acpi_adjust_bus_speed() adjust only speed from ACPI.

I have slightly different idea, I'll send a patch soon after testing.

-- 
With Best Regards,
Andy Shevchenko


