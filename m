Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03AB117B9C1
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Mar 2020 11:02:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726079AbgCFKCP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Mar 2020 05:02:15 -0500
Received: from mga18.intel.com ([134.134.136.126]:49522 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726070AbgCFKCP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 6 Mar 2020 05:02:15 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Mar 2020 02:02:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,521,1574150400"; 
   d="scan'208";a="413842401"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005.jf.intel.com with ESMTP; 06 Mar 2020 02:02:13 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jA9o7-007K96-Jt; Fri, 06 Mar 2020 12:02:15 +0200
Date:   Fri, 6 Mar 2020 12:02:15 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v1 1/5] i2c: mux: pca954x: Refactor pca954x_irq_handler()
Message-ID: <20200306100215.GS1224808@smile.fi.intel.com>
References: <20200305155352.39095-1-andriy.shevchenko@linux.intel.com>
 <31d8a07f-a841-d58b-ebc8-3cba39d00a95@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31d8a07f-a841-d58b-ebc8-3cba39d00a95@axentia.se>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 05, 2020 at 09:34:46PM +0000, Peter Rosin wrote:
> On 2020-03-05 16:53, Andy Shevchenko wrote:
> > Refactor pca954x_irq_handler() to:
> >   - use for_each_set_bit() macro
> >   - use IRQ_RETVAL() macro
> > 
> > Above change makes code easy to read and understand.

> > +	pending = ret >> PCA954X_IRQ_OFFSET;
> > +	for_each_set_bit(i, &pending, data->chip->nchans)
> > +		handle_nested_irq(irq_linear_revmap(data->irq, i));
> > +
> > +	return IRQ_RETVAL(pending);
> 
> What if ret has some bit set above the bit corresponding to the last channel?

We will "handle" spurious interrupt.

> Maybe that's somehow not possible, but if that's the case it's not apparent.

So, does

	pending = (ret >> PCA954X_IRQ_OFFSET) & (BIT(data->chip->nchans) - 1);

satisfy you?

-- 
With Best Regards,
Andy Shevchenko


