Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5A864759F7
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Dec 2021 14:52:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231757AbhLONwb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Dec 2021 08:52:31 -0500
Received: from mga11.intel.com ([192.55.52.93]:7131 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231627AbhLONwa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Dec 2021 08:52:30 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="236765755"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="236765755"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2021 05:52:30 -0800
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="614707597"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2021 05:52:28 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mxUgu-006caG-Rv;
        Wed, 15 Dec 2021 15:51:32 +0200
Date:   Wed, 15 Dec 2021 15:51:32 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Subject: Re: [PATCH v2 4/6] i2c: designware-pci: Fix to change data types of
 hcnt and lcnt parameters
Message-ID: <Ybny5Cxh60e7d63q@smile.fi.intel.com>
References: <20211213180034.30929-1-andriy.shevchenko@linux.intel.com>
 <20211213180034.30929-4-andriy.shevchenko@linux.intel.com>
 <05baeea4-08ef-4fcd-5004-58b19e3e63f3@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05baeea4-08ef-4fcd-5004-58b19e3e63f3@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Dec 15, 2021 at 09:55:47AM +0200, Jarkko Nikula wrote:
> On 12/13/21 20:00, Andy Shevchenko wrote:
> > From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
> > 
> > The data type of hcnt and lcnt in the struct dw_i2c_dev is of type u16.
> > It's better to have same data type in struct dw_scl_sda_cfg as well.

...

> I proposed this to be first before questionable cleanups since this fixes
> existing confusion (noted by Wolfram not any of us). Same to 5-6/6.

Okay, I postpone this series. It seems altogether it will require more time
than I currently have. Consider picking patches on the basis you have in mind
if you consider them useful. Thanks!

-- 
With Best Regards,
Andy Shevchenko


