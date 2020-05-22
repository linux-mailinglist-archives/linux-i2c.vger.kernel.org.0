Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFB9D1DE4F2
	for <lists+linux-i2c@lfdr.de>; Fri, 22 May 2020 12:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728640AbgEVK6N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 May 2020 06:58:13 -0400
Received: from mga12.intel.com ([192.55.52.136]:22930 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728371AbgEVK6M (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 22 May 2020 06:58:12 -0400
IronPort-SDR: kNX8adT255bfXVyi3re9qNirSPPFT/5lZ+rh2ws9vLBh2Lhcu2r1aZ6Sk85VfNzra69z1h1GHL
 CGUlyGZE3x+w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2020 03:58:12 -0700
IronPort-SDR: ZG01XN5P+LbNMcDYXdVIHf5I9Fk+9dVf8JpfBhqagmc/RxNTVpEWv29lklf2smsIteO8NVtgGx
 ObJxHAgXI+zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,421,1583222400"; 
   d="scan'208";a="440818198"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005.jf.intel.com with ESMTP; 22 May 2020 03:58:10 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jc5NW-008DUg-4Q; Fri, 22 May 2020 13:58:14 +0300
Date:   Fri, 22 May 2020 13:58:14 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v2 1/7] i2c: designware: Get rid of PCI driver specifics
 in common code
Message-ID: <20200522105814.GT1634618@smile.fi.intel.com>
References: <20200519125043.6069-1-andriy.shevchenko@linux.intel.com>
 <46e45caf-7ce4-d3b2-cea6-747424b44a4a@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46e45caf-7ce4-d3b2-cea6-747424b44a4a@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 20, 2020 at 04:55:39PM +0300, Jarkko Nikula wrote:
> On 5/19/20 3:50 PM, Andy Shevchenko wrote:
> > Do not spread PCI specifics over common code. It seems to be a layering
> > violation which can be easily avoided. Refactor PCI driver and drop
> > PCI specifics from common code.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> > v2: new patch
> >   drivers/i2c/busses/i2c-designware-core.h   |  1 -
> >   drivers/i2c/busses/i2c-designware-pcidrv.c | 24 +++++++++++++---------
> >   2 files changed, 14 insertions(+), 11 deletions(-)
> > 
> For all patches 1-7/7:
> 
> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Thank you, Jarkko!

Wolfram, do we have a chance to get this into v5.8-rc1?

-- 
With Best Regards,
Andy Shevchenko


