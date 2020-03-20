Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01AAB18D451
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Mar 2020 17:25:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726983AbgCTQZF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Mar 2020 12:25:05 -0400
Received: from mga17.intel.com ([192.55.52.151]:16452 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726893AbgCTQZF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 20 Mar 2020 12:25:05 -0400
IronPort-SDR: 14MO8L30nNM1uLIemtqF4HcXfcwq5Ff51W46VtTzG+bPhXvNhe3ILEIJbi2Uvg08r7SD493iPp
 +pUG1jA5gXQQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2020 09:23:54 -0700
IronPort-SDR: A8bTJwTXXi2bPPPc0eovNDP/mtGVKA/b388LtycaH5Oe+uV5mGmmS3NLcsdwdq6nZOkQyEysdO
 uu0gmw2Dx2aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,285,1580803200"; 
   d="scan'208";a="446700483"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006.fm.intel.com with ESMTP; 20 Mar 2020 09:23:53 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jFKRA-00BVKw-1s; Fri, 20 Mar 2020 18:23:56 +0200
Date:   Fri, 20 Mar 2020 18:23:56 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v3 1/6] i2c: core: Provide generic definitions for bus
 frequencies
Message-ID: <20200320162356.GE1922688@smile.fi.intel.com>
References: <20200316154929.20886-1-andriy.shevchenko@linux.intel.com>
 <20200319171913.GM1922688@smile.fi.intel.com>
 <20200320144542.GB1282@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200320144542.GB1282@ninjato>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 20, 2020 at 03:45:42PM +0100, Wolfram Sang wrote:
> On Thu, Mar 19, 2020 at 07:19:13PM +0200, Andy Shevchenko wrote:
> > On Mon, Mar 16, 2020 at 05:49:24PM +0200, Andy Shevchenko wrote:
> > > There are few maximum bus frequencies being used in the I²C core code.
> > > Provide generic definitions for bus frequencies and use them in the core.
> > > 
> > > The drivers may use predefined constants where it is appropriate.
> > > Some of them are already using these under slightly different names.
> > > We will convert them later to use newly introduced defines.
> > > 
> > > Note, the name of modes are chosen to follow well established naming
> > > scheme [1].
> > > 
> > > These definitions will also help to avoid typos in the numbers that
> > > may lead to subtle errors.
> > 
> > Wolfram, is any chance to get applied at least 1, 5 and 6 from this series?
> 
> Yes, just make sure v4 is based on i2c/for-next to minimize merge
> conflicts.

Will do, thank you!

-- 
With Best Regards,
Andy Shevchenko


