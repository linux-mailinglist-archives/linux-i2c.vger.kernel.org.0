Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0775845030A
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Nov 2021 12:04:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231184AbhKOLGs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Nov 2021 06:06:48 -0500
Received: from mga02.intel.com ([134.134.136.20]:23099 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237823AbhKOLEy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Nov 2021 06:04:54 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="220630228"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; 
   d="scan'208";a="220630228"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2021 03:01:56 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; 
   d="scan'208";a="493975370"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2021 03:01:55 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mmZkA-0072KN-P2;
        Mon, 15 Nov 2021 13:01:46 +0200
Date:   Mon, 15 Nov 2021 13:01:46 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Wang, Lawrence (NSB - CN/Hangzhou)" <lawrence.wang@nokia-sbell.com>
Cc:     "jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Wang@wrlinb193.emea.nsn-net.net" <Wang@wrlinb193.emea.nsn-net.net>
Subject: Re: [PATCH] i2c: designware: Get HCNT/LCNT values from dts
Message-ID: <YZI+Gq06wk9Xfk6v@smile.fi.intel.com>
References: <20211115093556.7154-1-lawrence.wang@nokia-sbell.com>
 <YZI0LuDK63+Wb7wi@smile.fi.intel.com>
 <YZI2RnFgO0Y75KlF@smile.fi.intel.com>
 <587c61a76c8547d0a36dd11071bfcb2d@nokia-sbell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <587c61a76c8547d0a36dd11071bfcb2d@nokia-sbell.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 15, 2021 at 10:41:06AM +0000, Wang, Lawrence (NSB - CN/Hangzhou) wrote:

Please, do not top post!

> Besides the fact it misses DT schema update, why this is needed at all? 
> ------> we need a interface to configure the HCNT/LCNT via dts (current we just have ACPI to config it).
> What's wrong with the existing DT timings? 
> --------> the HCNT/LCNT value calculated by code is not accuracy. This is similar changes as the ACPI interface.

So, _this_ is a problem, try to fix it instead of band aiding here and there.

P.S. You forgot to include proper people in the Cc list. I recommend to
consider using my script [1] for sending patches.

[1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.sh

-- 
With Best Regards,
Andy Shevchenko


