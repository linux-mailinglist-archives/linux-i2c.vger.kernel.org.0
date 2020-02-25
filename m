Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E29C816BEF1
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2020 11:38:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730337AbgBYKiU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Feb 2020 05:38:20 -0500
Received: from mga17.intel.com ([192.55.52.151]:6271 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730336AbgBYKiU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Feb 2020 05:38:20 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Feb 2020 02:38:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,483,1574150400"; 
   d="scan'208";a="231421689"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008.fm.intel.com with ESMTP; 25 Feb 2020 02:38:18 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1j6XbE-004dS4-JF; Tue, 25 Feb 2020 12:38:00 +0200
Date:   Tue, 25 Feb 2020 12:38:00 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Baolin Wang <baolin.wang7@gmail.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [PATCH v1 31/40] i2c: spdr: Use generic definitions for bus
 frequencies
Message-ID: <20200225103800.GE10400@smile.fi.intel.com>
References: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com>
 <20200224151530.31713-31-andriy.shevchenko@linux.intel.com>
 <CADBw62reMCohyi-HHbyXpUdBB-ZsN8newHgUyy_cJ3vnfS1W2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADBw62reMCohyi-HHbyXpUdBB-ZsN8newHgUyy_cJ3vnfS1W2A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 25, 2020 at 08:49:24AM +0800, Baolin Wang wrote:
> On Mon, Feb 24, 2020 at 11:15 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > Since we have generic definitions for bus frequencies, let's use them.
> >
> > Cc: Orson Zhai <orsonzhai@gmail.com>
> > Cc: Baolin Wang <baolin.wang7@gmail.com>
> > Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Can you fix the typo in the subject line by changing 'spdr' to 'sprd'?

Sure.

> Otherwise looks good to me. Thanks.
> Reviewed-by: Baolin Wang <baolin.wang7@gmail.com>

Thanks!

-- 
With Best Regards,
Andy Shevchenko


