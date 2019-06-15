Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF659470D8
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Jun 2019 17:30:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727004AbfFOPaf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 15 Jun 2019 11:30:35 -0400
Received: from mga07.intel.com ([134.134.136.100]:53901 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726998AbfFOPaf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 15 Jun 2019 11:30:35 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Jun 2019 08:30:35 -0700
X-ExtLoop1: 1
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by fmsmga006.fm.intel.com with ESMTP; 15 Jun 2019 08:30:33 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hcAdU-00035F-Qk; Sat, 15 Jun 2019 18:30:32 +0300
Date:   Sat, 15 Jun 2019 18:30:32 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jean Delvare <jdelvare@suse.de>,
        Paul Gortmaker <paul.gortmaker@windriver.com>
Cc:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v1 3/3] i2c: i801: Remove linux/init.h and sort headers
Message-ID: <20190615153032.GQ9224@smile.fi.intel.com>
References: <20190613164529.63482-1-andriy.shevchenko@linux.intel.com>
 <20190613164529.63482-3-andriy.shevchenko@linux.intel.com>
 <20190614163041.13d5ee68@endymion>
 <20190614144743.GP9224@smile.fi.intel.com>
 <20190615171124.6992ffd4@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190615171124.6992ffd4@endymion>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Jun 15, 2019 at 05:11:24PM +0200, Jean Delvare wrote:
> On Fri, 14 Jun 2019 17:47:43 +0300, Andy Shevchenko wrote:
> > On Fri, Jun 14, 2019 at 04:30:41PM +0200, Jean Delvare wrote:
> > > In my books, you should never rely on a header including for you
> > > another header you need. Is there a reason for not following that
> > > principle here?  
> > 
> > init.h vs. module.h is a special case. Otherwise I agree with you.
> 
> Why? Where is this documented?

Paul did this split in the

commit 0fd972a7d91d6e15393c449492a04d94c0b89351
Author: Paul Gortmaker <paul.gortmaker@windriver.com>
Date:   Fri May 1 20:13:42 2015 -0400

    module: relocate module_init from init.h to module.h

I have no idea where it should be documented if it's not. Let Paul speak.

-- 
With Best Regards,
Andy Shevchenko


