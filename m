Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1CFF1C75B5
	for <lists+linux-i2c@lfdr.de>; Wed,  6 May 2020 18:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729873AbgEFQGI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 May 2020 12:06:08 -0400
Received: from mga01.intel.com ([192.55.52.88]:49179 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729930AbgEFQGI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 May 2020 12:06:08 -0400
IronPort-SDR: 4vw0X8E5CNKmZC2heuRHgBbotfRElFCCLsuG+qiq6+orCMl6xSZdsH9ceDw1cF525Gp3EZ0CgQ
 WwCjJrAXwEMw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2020 09:06:07 -0700
IronPort-SDR: KtOv/kW9opKiupxXmkWQdWkiFrT39LA0VNQhGMjL/5S88L28I6deCzLfSmGNJWyEX7ebaSy3Vr
 PtfdCQolk6Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,359,1583222400"; 
   d="scan'208";a="296230787"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 06 May 2020 09:06:05 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jWMYj-0053U6-2w; Wed, 06 May 2020 19:06:09 +0300
Date:   Wed, 6 May 2020 19:06:09 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v3 1/4] i2c: mux: pca954x: Refactor pca954x_irq_handler()
Message-ID: <20200506160609.GN185537@smile.fi.intel.com>
References: <20200425115152.29475-1-andriy.shevchenko@linux.intel.com>
 <20200506124242.GH185537@smile.fi.intel.com>
 <5f4f3714-e37c-d2ec-51eb-8cc3c9dd57de@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f4f3714-e37c-d2ec-51eb-8cc3c9dd57de@axentia.se>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 06, 2020 at 03:19:29PM +0200, Peter Rosin wrote:
> 
> On 2020-05-06 14:42, Andy Shevchenko wrote:
> > On Sat, Apr 25, 2020 at 02:51:49PM +0300, Andy Shevchenko wrote:
> >> Refactor pca954x_irq_handler() to:
> >>   - use for_each_set_bit() macro
> >>   - use IRQ_RETVAL() macro
> >>
> >> Above change makes code easy to read and understand.
> > 
> > If there is no comments, Wolfram, can you apply this?
> 
> Perhaps that's best, I have had the intention to get to this for a very long
> time and I'm very sorry for delaying. The number of patches for i2c-mux is so
> low that I have not bothered to automate the process, but that also means that
> I have to sort of rediscover how to do it a few times a year. It's simply not
> effective...
> 
> Wolfram, I think it would be better if I just quit my i2c-mux tree and I
> instead review/ack patches that you then take. Would that be ok with you?
> 
> Again, sorry for being a road-block.
> 
> Reviewed-by: Peter Rosin <peda@axentia.se>

Thank you, Peter!

I hope this applies to the entire series?

-- 
With Best Regards,
Andy Shevchenko


