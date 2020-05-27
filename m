Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C7F31E482C
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 17:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728640AbgE0Psz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 11:48:55 -0400
Received: from mga11.intel.com ([192.55.52.93]:61105 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727772AbgE0Psz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 27 May 2020 11:48:55 -0400
IronPort-SDR: XjWgDcJbBdd84zEbqVX5GtDKCi+419nPwSJi0kjlDMiWkR8XEtX53QCZyJH2HKm3eT3WEZmKzl
 TnGAyzZUagnw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2020 08:48:54 -0700
IronPort-SDR: yMq0JANO0NTOgaujZjyd6x0sLdGSGLW5UxxZzucb/ttmr+YPkiZ5py6rIygbmfEyXZvihvz5KR
 j2aIU/dAa9uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,441,1583222400"; 
   d="scan'208";a="414248082"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004.jf.intel.com with ESMTP; 27 May 2020 08:48:51 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jdyIY-009FpD-KG; Wed, 27 May 2020 18:48:54 +0300
Date:   Wed, 27 May 2020 18:48:54 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 07/11] i2c: designware: Discard Cherry Trail model flag
Message-ID: <20200527154854.GH1634618@smile.fi.intel.com>
References: <20200527120111.5781-1-Sergey.Semin@baikalelectronics.ru>
 <20200527120111.5781-8-Sergey.Semin@baikalelectronics.ru>
 <20200527134339.GY1634618@smile.fi.intel.com>
 <20200527142902.2xpteguuotsl3z7y@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527142902.2xpteguuotsl3z7y@mobilestation>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 27, 2020 at 05:29:02PM +0300, Serge Semin wrote:
> On Wed, May 27, 2020 at 04:43:39PM +0300, Andy Shevchenko wrote:
> > On Wed, May 27, 2020 at 03:01:07PM +0300, Serge Semin wrote:
> > > A PM workaround activated by the flag MODEL_CHERRYTRAIL has been removed
> > > since commit 9cbeeca05049 ("i2c: designware: Remove Cherry Trail PMIC I2C
> > > bus pm_disabled workaround"), but the flag most likely by mistake has been
> > > left in the Dw I2C drivers. Let's remove it.
> > 
> > ...
> > 
> > > -#define MODEL_MSCC_OCELOT	0x00000200
> > > +#define MODEL_MSCC_OCELOT	0x00000100
> > 
> > But why?
> > 
> > Does 0x200 work or not? I didn't see this in commit message.
> 
> I removed the MODEL_CHERRYTRAIL flag and redefined the only left
> MODEL_MSCC_OCELOT flag to set the very first bit allocated for the model
> flags. Isn't that obvious?

Yes, but how it's related to the MSCC_OCELOT?

Can't you simple put your define later to that number if absence of 0x100
provokes an exception when reading this code.

Again, unneeded churn.

-- 
With Best Regards,
Andy Shevchenko


