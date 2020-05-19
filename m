Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B6A71D9668
	for <lists+linux-i2c@lfdr.de>; Tue, 19 May 2020 14:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728891AbgESMdU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 May 2020 08:33:20 -0400
Received: from mga18.intel.com ([134.134.136.126]:37869 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728745AbgESMdU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 May 2020 08:33:20 -0400
IronPort-SDR: KaM0j8B/HFZOK60q/7lkhQMGOv2+p6xdb8lGldWd8khnCkEm5x4EAMbkQdLbeGCP+BKh6DKaaj
 47rGKdWN5BGA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2020 05:33:20 -0700
IronPort-SDR: 5eNgeKC12GC0hLiGgCAdOBiqQIW9Neg0WrIhdeA8o9nkZyhMKYy1/tWCoQiUPpKt1QsQ47ZpyS
 f6XrSYYx1NEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,410,1583222400"; 
   d="scan'208";a="300090419"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 19 May 2020 05:33:18 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jb1Qw-007dPq-4i; Tue, 19 May 2020 15:33:22 +0300
Date:   Tue, 19 May 2020 15:33:22 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v1 1/4] i2c: designware: Split out
 i2c_dw_validate_speed() helper
Message-ID: <20200519123322.GG1634618@smile.fi.intel.com>
References: <20200507135140.14635-1-andriy.shevchenko@linux.intel.com>
 <228e9c62-60b9-e5b8-ea5e-e012df83479b@linux.intel.com>
 <20200511134238.GI185537@smile.fi.intel.com>
 <c13ddaf2-5aef-e3fc-20ac-b1e0a9182fb0@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c13ddaf2-5aef-e3fc-20ac-b1e0a9182fb0@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 12, 2020 at 06:12:32PM +0300, Jarkko Nikula wrote:
> On 5/11/20 4:42 PM, Andy Shevchenko wrote:
> > On Mon, May 11, 2020 at 04:11:57PM +0300, Jarkko Nikula wrote:
> > > On 5/7/20 4:51 PM, Andy Shevchenko wrote:
> > > > In order to export array supported speed for wider use,
> > > > split out them along with i2c_dw_validate_speed() helper.

...

> > > This header is included by every i2c-designware-*.c file and this inline
> > > function is not tiny. Would it be better to have this in
> > > i2c-designware-common.c instead?
> > 
> > Yes, but then we will need to export i2c_dw_supported_speeds as well as its
> > array size.
> > 
> Would that not be needed if you move ACPI parts also into
> i2c-designware-common.c?

Yes, in the intermediate patch. I'm about to send v2, where you may see how it
looks like.

-- 
With Best Regards,
Andy Shevchenko


