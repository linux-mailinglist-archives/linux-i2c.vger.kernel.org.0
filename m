Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EFC2333C30
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Mar 2021 13:06:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232088AbhCJMFy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Mar 2021 07:05:54 -0500
Received: from mga18.intel.com ([134.134.136.126]:40617 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232985AbhCJMFm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 10 Mar 2021 07:05:42 -0500
IronPort-SDR: NfAu9YXbYMo2Liwmm5JwHzDe2qUe5QAXJZQe6gSL0mRtcwPFFgf7uBkVO9wc/hbvlOwgzfL26N
 EqblV5RX7RvA==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="176048325"
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; 
   d="scan'208";a="176048325"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2021 04:05:41 -0800
IronPort-SDR: Sv/7lmh+oYy9YXTuK6T+oVj4wy6XqXQAevOODZkBBEmybeHO/Z++EkCMx6axv6mSN+Q/VHyQoW
 uW9diC3DExfw==
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; 
   d="scan'208";a="409058518"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2021 04:05:37 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lJxao-00BJhJ-9S; Wed, 10 Mar 2021 14:05:34 +0200
Date:   Wed, 10 Mar 2021 14:05:34 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.de>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Jim Quinlan <james.quinlan@broadcom.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>, hdegoede@redhat.com,
        henning.schild@siemens.com
Subject: Re: [PATCH v1 5/7] mfd: lpc_ich: Switch to generic pci_p2sb_bar()
Message-ID: <YEi2DhLu+tpegdOR@smile.fi.intel.com>
References: <20210308122020.57071-1-andriy.shevchenko@linux.intel.com>
 <20210308122020.57071-6-andriy.shevchenko@linux.intel.com>
 <20210310103539.GF701493@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210310103539.GF701493@dell>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Mar 10, 2021 at 10:35:39AM +0000, Lee Jones wrote:
> On Mon, 08 Mar 2021, Andy Shevchenko wrote:
> 
> > Instead of open coding pci_p2sb_bar() functionality we are going to
> > use generic library for that. There one more user of it is coming.
> > 
> > Besides cleaning up it fixes a potential issue if, by some reason,
> > SPI bar is 64-bit.
> 
> Probably worth cleaning up the English in both these sections.
> 
>  Instead of open coding pci_p2sb_bar() functionality we are going to
>  use generic library. There is one more user en route.
> 
>  This is more than just a clean-up.  It also fixes a potential issue
>  seen when SPI bar is 64-bit.

Thanks!

> Also worth briefly describing what that issue is I think.

Current code works if and only if the PCI BAR of the hidden device is inside 4G
address space. In case firmware decides to go above 4G, we will get a wrong
address.

Does it sound good enough?

> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  drivers/mfd/Kconfig   |  1 +
> >  drivers/mfd/lpc_ich.c | 20 ++++++--------------
> >  2 files changed, 7 insertions(+), 14 deletions(-)
> 
> Code looks fine:
> 
> For my own reference (apply this as-is to your sign-off block):
> 
>   Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

Thanks for reviewing this series, can you have a look at the earlier sent [1]
and [2]? First one has a regression fix.

[1]: https://lore.kernel.org/lkml/20210302135620.89958-1-andriy.shevchenko@linux.intel.com/T/#u
[2]: https://lore.kernel.org/lkml/20210301144222.31290-1-andriy.shevchenko@linux.intel.com/T/#u

-- 
With Best Regards,
Andy Shevchenko


