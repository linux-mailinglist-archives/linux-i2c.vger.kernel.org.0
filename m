Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D303831FA21
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Feb 2021 14:54:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230241AbhBSNx6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Feb 2021 08:53:58 -0500
Received: from mga09.intel.com ([134.134.136.24]:64464 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230177AbhBSNxv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Feb 2021 08:53:51 -0500
IronPort-SDR: rgeTPppgYXTdSDu3AekE3jDHvYWRaxXYgGRdWWsCcaM9OGYuFAVDVQ2nH8H6J+TRu/gJ1TYzQZ
 0EMhq3XPfIhA==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="183960797"
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; 
   d="scan'208";a="183960797"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2021 05:52:05 -0800
IronPort-SDR: EK5Wgt/62jce1ymNozB9AcLEBud6htWOyYNWoERO8THhqspUe0CsaFjRRSoEWukDrsRVFVcpjq
 L+uCGTd68/zg==
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; 
   d="scan'208";a="378874125"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2021 05:52:02 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lD6CN-006DxP-8c; Fri, 19 Feb 2021 15:51:59 +0200
Date:   Fri, 19 Feb 2021 15:51:59 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Robert Richter <rric@kernel.org>
Cc:     Dejin Zheng <zhengdejin5@gmail.com>, corbet@lwn.net,
        jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        bhelgaas@google.com, wsa@kernel.org, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org, kw@linux.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] Introduce pcim_alloc_irq_vectors()
Message-ID: <YC/CfxHM2RMZLejc@smile.fi.intel.com>
References: <20210216160249.749799-1-zhengdejin5@gmail.com>
 <YC41HD422Mjh1IZK@rric.localdomain>
 <YC5zVHnRog3EX0rl@smile.fi.intel.com>
 <YC+euDIrR5apkAqp@rric.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YC+euDIrR5apkAqp@rric.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Feb 19, 2021 at 12:19:20PM +0100, Robert Richter wrote:
> On 18.02.21 16:01:56, Andy Shevchenko wrote:
> > The problem this series solves is an imbalanced API.
> 
> This (added) API is bloated and incomplete. It adds functions without
> benefit, the only is to have a single pcim alloc function in addition
> to the pairing of alloc/free functions. I agree, it is hard to detect
> which parts are released if pcim_enable_device() is used.

No, this API solves the above mentioned problem (what makes so special about
pci_free_irq_vectors() that it should be present?) Why do we have pcim_iomap*()
variations and not the rest?

The PCIm API is horrible in the sense of being used properly. Yes, I know how
it works and I was trying to help with that, the problem is that people didn't
and don't get how it works and stream of patches like the ones that add
pci_free_irq_vectors() are coming.

> Additional, you need to go through pcim_release() to add other
> pcim_*() functions for everything else that is released there.
> Otherwise that new API is still incomplete.

True. And here is the part that most annoying right now.
Btw, I never saw you fought against these small clean ups here and there, that
*add* explicit calls to freeing resources. Also I haven't noticed anybody
trying to correct documentation.

This series is a step to a right direction.

> But this adds another
> bunch of useless functions.

Wrong. This is quite useful to have balanced APIs. How many patches you have
seen related to the PCIm imbalanced APIs? I could tell from my experience, I
saw plenty and each time I'm trying to explain how it works people don't easily
get.

> > Christoph IIRC was clear that if we want to use PCI IRQ allocation API the
> > caller must know what's going on. Hiding this behind the scenes is not good.
> > And this series unhides that.
> 
> IMO, this is more a documentation issue. pcim_enable_device() must be
> better documented and list all enable/alloc functions that are going
> to be released out of the box later.
> 
> Even better, make sure everything is managed and thus all of a pci_dev
> is released, no matter how it was setup (this could even already be
> the case).
> 
> In addition you could implement a static code checker.

It's open source, why should we do that and not what we are proposing here?
Propose your ideas and we will discuss the patches, right?

> > Also, you may go and clean up all pci_free_irq_vectors() when
> > pcim_enable_device() is called, but I guess you will get painful process and
> > rejection in a pile of cases.
> 
> Why should something be rejected if it is not correctly freed?

Why it's not correctly freed? The function is idempotent.

> Even if pci_free_irq_vectors() is called, pcim_release() will not
> complain if it was already freed before. So using
> pci_free_irq_vectors() is ok even in conjunction with
> pcim_enable_device().

No, it's not okay from API namespace / semantics perspective.

> In the end, let's make sure everything is released in pci_dev if it is
> managed and document this.

Feel free to submit a patch!

-- 
With Best Regards,
Andy Shevchenko


