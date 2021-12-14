Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3503E4741F9
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Dec 2021 13:04:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233772AbhLNMEG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Dec 2021 07:04:06 -0500
Received: from mga17.intel.com ([192.55.52.151]:1139 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233738AbhLNMEF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 14 Dec 2021 07:04:05 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="219647570"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="219647570"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 04:04:01 -0800
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="583423434"
Received: from smile.fi.intel.com ([10.237.72.184])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 04:04:00 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mx6WN-0066tT-Ro;
        Tue, 14 Dec 2021 14:03:03 +0200
Date:   Tue, 14 Dec 2021 14:03:03 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     tamal.saha@intel.com
Cc:     wsa@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i2c@vger.kernel.org, bala.senthil@intel.com
Subject: Re: [PATCH v2] i2c: designware: Do not complete i2c read without
 RX_FULL interrupt
Message-ID: <YbiH95v9h2Zz55PS@smile.fi.intel.com>
References: <20211214025518.31211-1-tamal.saha@intel.com>
 <YbiHe6Lghi97CEz9@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YbiHe6Lghi97CEz9@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 14, 2021 at 02:00:59PM +0200, Andy Shevchenko wrote:
> On Tue, Dec 14, 2021 at 08:25:18AM +0530, tamal.saha@intel.com wrote:
> > From: Tamal Saha <tamal.saha@intel.com>
> > 
> > Intel Keem Bay platform supports multimaster operations over same i2c

Here you put multimaster...

> > bus using Synopsys i2c DesignWare IP. When multi masters initiate i2c

...and here multi masters.

Be consistent.

I believe the best way is to use dash variant, i.e. multi-master(s),

> > operation simultaneously in a loop, SCL line is stucked low forever
> > after few i2c operations. Following interrupt sequences are observed
> > in:
> >   working case: TX_EMPTY, RX_FULL and STOP_DET
> >   non working case: TX_EMPTY, STOP_DET, RX_FULL.
> > 
> > DW_apb_i2c stretches the SCL line when the TX FIFO is empty or when
> > RX FIFO is full. The DW_apb_i2c master will continue to hold the SCL
> > line LOW until RX FIFO is read.
> > 
> > Linux kernel i2c DesignWare driver does not handle above non working
> > sequence. TX_EMPTY, RX_FULL and STOP_DET routine execution are required
> > in sequence although RX_FULL interrupt is raised after STOP_DET by
> > hardware. Clear STOP_DET for the following conditions:
> >   (STOP_DET ,RX_FULL, rx_outstanding)
> >     Write Operation: (1, 0, 0)
> >     Read Operation:
> >       RX_FULL followed by STOP_DET: (0, 1, 1) -> (1, 0, 0)
> >       STOP_DET followed by RX_FULL: (1, 0, 1) -> (1, 1, 0)
> >       RX_FULL and STOP_DET together: (1, 1, 1)
> > 
> > Signed-off-by: Tamal Saha <tamal.saha@intel.com>
> > ---
> 
> So, where is the changelog?

-- 
With Best Regards,
Andy Shevchenko


