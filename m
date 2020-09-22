Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1198A273E25
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Sep 2020 11:10:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgIVJKC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 05:10:02 -0400
Received: from mga03.intel.com ([134.134.136.65]:2427 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726612AbgIVJKC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 22 Sep 2020 05:10:02 -0400
IronPort-SDR: lLl1m99uckNl/OYCb2pC6PwHUFaz/e7KIfwaSOssbUmOtLqTGbCWjQARvwm9DVIsA6cFAXXEXp
 QJm3aghbaSlQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9751"; a="160635717"
X-IronPort-AV: E=Sophos;i="5.77,290,1596524400"; 
   d="scan'208";a="160635717"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2020 02:10:02 -0700
IronPort-SDR: RJNMPlR6Jlk1zF38cbRBOPbHpsS6NW67JNCd+RQOqJCtr6Xnrx5ty0wnzfF1oeLGk73qBQQYbe
 5CrsvK0MewIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,290,1596524400"; 
   d="scan'208";a="338222449"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 22 Sep 2020 02:10:00 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kKeJA-0013FU-Kq; Tue, 22 Sep 2020 12:09:56 +0300
Date:   Tue, 22 Sep 2020 12:09:56 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tomer Maimon <tmaimon77@gmail.com>
Cc:     wsa@kernel.org, linux-i2c@vger.kernel.org, ohad@wizery.com,
        bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        avi.fishman@nuvoton.com, eyal.cohen@nuvoton.com
Subject: Re: Upstream I2C driver that designed for rpmsg
Message-ID: <20200922090956.GK3956970@smile.fi.intel.com>
References: <CAP6Zq1jrT-AmNT2J11OEk80=qL04=jCKTBoM-FLEt1na6d00kQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP6Zq1jrT-AmNT2J11OEk80=qL04=jCKTBoM-FLEt1na6d00kQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 22, 2020 at 12:41:35AM +0300, Tomer Maimon wrote:
> Hello all,
> 
> Our BMC have two processors
> 
>    1. main processors  - A35
>    2. Coprocessor(CP) - M4.
> 
> The BMC handles more than 30 I2C buses.
> 
> We like to handle the I2C module in the Coprocessor for offload the i2c
> transaction from main processor.
> 
> The main processor is running Linux,
> 
> The main processor and the CP communicate through rpmsg.
> 
>  Is an I2C driver that designed for rpmsg will be up-streamed to Linux.Org?

There are examples in the kernel of indirect access to I2C host controllers
which are parts of auxiliary micro controllers. I guess in principle it's okay
and most of the success of the submission depends on implementation.


-- 
With Best Regards,
Andy Shevchenko


