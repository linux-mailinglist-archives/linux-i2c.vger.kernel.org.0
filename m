Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A7017DB40
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Aug 2019 14:21:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728916AbfHAMVM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Aug 2019 08:21:12 -0400
Received: from mga09.intel.com ([134.134.136.24]:30848 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728791AbfHAMVM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 1 Aug 2019 08:21:12 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Aug 2019 05:21:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,334,1559545200"; 
   d="scan'208";a="172896234"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by fmsmga008.fm.intel.com with ESMTP; 01 Aug 2019 05:21:08 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1htA4w-0003Cp-F3; Thu, 01 Aug 2019 15:21:06 +0300
Date:   Thu, 1 Aug 2019 15:21:06 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        rafael@kernel.org, linux-arm-kernel@lists.infradead.org,
        Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
        linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 5/7] drivers: Introduce device lookup variants by
 ACPI_COMPANION device
Message-ID: <20190801122106.GU23480@smile.fi.intel.com>
References: <20190723221838.12024-1-suzuki.poulose@arm.com>
 <20190723221838.12024-6-suzuki.poulose@arm.com>
 <20190726202353.GA963@kunai>
 <20190801115856.GS23480@smile.fi.intel.com>
 <20190801120830.GA1659@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190801120830.GA1659@ninjato>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Aug 01, 2019 at 02:08:30PM +0200, Wolfram Sang wrote:
> On Thu, Aug 01, 2019 at 02:58:56PM +0300, Andy Shevchenko wrote:
> > On Fri, Jul 26, 2019 at 10:23:54PM +0200, Wolfram Sang wrote:
> > > On Tue, Jul 23, 2019 at 11:18:36PM +0100, Suzuki K Poulose wrote:
> > > > Add a generic helper to match a device by the ACPI_COMPANION device
> > > > and provide wrappers for the device lookup APIs.
> > > > 
> > > > Cc: Len Brown <lenb@kernel.org>
> > > > Cc: linux-acpi@vger.kernel.org
> > > > Cc: linux-spi@vger.kernel.org
> > > > Cc: Mark Brown <broonie@kernel.org>
> > > > Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> > > > Cc: Wolfram Sang <wsa@the-dreams.de>
> > > > Cc: linux-i2c@vger.kernel.org
> > > > Cc: Mark Brown <broonie@kernel.org>
> > > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > > > Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > > 
> > > From my side, OK:
> > > 
> > > Acked-by: Wolfram Sang <wsa@the-dreams.de> # I2C parts
> > > 
> > > yet you missed to cc the I2C ACPI maintainers. Done so now.
> > 
> > Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > 
> > Thanks, Wolfram, for notifying.
> 
> Sure. There seems to be a problem, though? Please check:
> 
> [PATCH 1/3] i2c: Revert incorrect conversion to use generic helper
> 
> which came in today.

It's again not Cc'ed to all parties.
But OK, looks good to me.
Tough may be Jarkko can test all this.

-- 
With Best Regards,
Andy Shevchenko


