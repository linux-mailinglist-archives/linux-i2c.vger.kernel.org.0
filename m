Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D67918D4C3
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Mar 2020 17:46:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727217AbgCTQqK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Mar 2020 12:46:10 -0400
Received: from mga06.intel.com ([134.134.136.31]:28643 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727400AbgCTQqK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 20 Mar 2020 12:46:10 -0400
IronPort-SDR: 2CE/sYNZEMbeBRzrSlCppkMXUtdyaHDCH32hoCjM5kBRZL07MIy854KRI2f//9jc7pshToh/Sb
 w5dZYpC7hmPg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2020 09:46:09 -0700
IronPort-SDR: CIAGYUbxhSMPe7D7NLy9hJT50WRcPk/wKCmUiJvPSEQgLOeZIqzrv10hb91yeJ1O3JNuL2d1Pa
 aRt3s40Tey/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,285,1580803200"; 
   d="scan'208";a="245539878"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003.jf.intel.com with ESMTP; 20 Mar 2020 09:46:08 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jFKmg-00BVpo-MB; Fri, 20 Mar 2020 18:46:10 +0200
Date:   Fri, 20 Mar 2020 18:46:10 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 2/6] i2c: core: Allow override timing properties with 0
Message-ID: <20200320164610.GG1922688@smile.fi.intel.com>
References: <20200316154929.20886-1-andriy.shevchenko@linux.intel.com>
 <20200316154929.20886-2-andriy.shevchenko@linux.intel.com>
 <20200320144357.GA1282@ninjato>
 <20200320162326.GD1922688@smile.fi.intel.com>
 <20200320164454.GE1282@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200320164454.GE1282@ninjato>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 20, 2020 at 05:44:54PM +0100, Wolfram Sang wrote:
> On Fri, Mar 20, 2020 at 06:23:26PM +0200, Andy Shevchenko wrote:
> > On Fri, Mar 20, 2020 at 03:43:57PM +0100, Wolfram Sang wrote:
> > > 
> > > > +	struct i2c_timings i2c_t = {0};
> > > 
> > > Simply '... = { }'?
> > 
> > I prefer C standard over GCC extension.
> 
> Okay. I don't care too much. But '{ 0 }' then, with kernel style spacing?

Works for me!

-- 
With Best Regards,
Andy Shevchenko


