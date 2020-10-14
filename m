Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAC6528DC03
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Oct 2020 10:51:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727455AbgJNIvw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Oct 2020 04:51:52 -0400
Received: from mga01.intel.com ([192.55.52.88]:50954 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726279AbgJNIvw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Oct 2020 04:51:52 -0400
IronPort-SDR: vofR62OT9JFRo8TUVZStRvDYr4xEXeiEjDAbMdZku11Hvr3PMkrSj2PPSyBvi51kxM3kK388W6
 8XZc50oPyYQA==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="183581077"
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; 
   d="scan'208";a="183581077"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2020 01:51:52 -0700
IronPort-SDR: 8SsOq+mpUdos9FvYszS9UxZl4Klz5Ltjj54ya2MfDZRaMXDYjnVb/CozTdgNmFIAO4oQmA7/kH
 USsHdYONDHig==
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; 
   d="scan'208";a="314095386"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2020 01:51:49 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kScWh-006UKY-VV; Wed, 14 Oct 2020 11:52:51 +0300
Date:   Wed, 14 Oct 2020 11:52:51 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     kernel test robot <lkp@intel.com>
Cc:     Michael Wu <michael.wu@vatics.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        Morgan Chang <morgan.chang@vatics.com>,
        Dean Hsiao <dean.hsiao@vatics.com>,
        Paul Chen <paul.chen@vatics.com>
Subject: Re: [PATCH] i2c: designware: fix slave omitted IC_INTR_STOP_DET
Message-ID: <20201014085251.GS4077@smile.fi.intel.com>
References: <20201014052532.3298-1-michael.wu@vatics.com>
 <202010141551.Y4x2qiN1-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202010141551.Y4x2qiN1-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 14, 2020 at 03:39:51PM +0800, kernel test robot wrote:
> Hi Michael,
> 
> Thank you for the patch! Yet something to improve:

Wondering if you compile this at all...

>    include/asm-generic/io.h:1017:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
>                                                      ~~~~~~~~~~ ^
> >> drivers/i2c/busses/i2c-designware-slave.c:181:42: error: expected ';' after expression
>                            dev->status = STATUS_WRITE_IN_PROGRESS
>                                                                  ^
>                                                                  ;
> >> drivers/i2c/busses/i2c-designware-slave.c:195:22: error: use of undeclared identifier 'STATUS_IDEL'
>                    if (dev->status != STATUS_IDEL) {
>                                       ^
>    7 warnings and 2 errors generated.


-- 
With Best Regards,
Andy Shevchenko


