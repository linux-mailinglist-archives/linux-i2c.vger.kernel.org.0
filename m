Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70C2B398491
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jun 2021 10:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232844AbhFBIxC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Jun 2021 04:53:02 -0400
Received: from mga04.intel.com ([192.55.52.120]:29864 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232840AbhFBIxC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Jun 2021 04:53:02 -0400
IronPort-SDR: Gq9nV6jLliQbKpXHOxdKqgqhTV9v4+mdayAw9/LBf7OjSWOFVpEN7xKSvFcHPjDT/DTKRE7UxM
 9J3QIYLp/1xQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10002"; a="201881011"
X-IronPort-AV: E=Sophos;i="5.83,241,1616482800"; 
   d="scan'208";a="201881011"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2021 01:51:18 -0700
IronPort-SDR: 7O3HAkimY4ZMDtM0oGELnrPG3JJ6fXO1KDNJb2CPEYDECtirmOnx2RVej2XYigb/qgbPgmuRq5
 fuuHuCOm5+JA==
X-IronPort-AV: E=Sophos;i="5.83,241,1616482800"; 
   d="scan'208";a="438328450"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2021 01:51:13 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1loMak-00GfA7-SC; Wed, 02 Jun 2021 11:51:10 +0300
Date:   Wed, 2 Jun 2021 11:51:10 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     Bjorn Helgaas <helgaas@kernel.org>, corbet@lwn.net,
        jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        Christoph Hellwig <hch@lst.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alexander Gordeev <agordeev@redhat.com>,
        Jonathan Derrick <jonathan.derrick@intel.com>,
        Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
        Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH v5 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Message-ID: <YLdGfmrk6+FbTbNN@smile.fi.intel.com>
References: <20210226155056.1068534-2-zhengdejin5@gmail.com>
 <20210323224710.GA610170@bjorn-Precision-5520>
 <20210505162716.GB1851@nuc8i5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210505162716.GB1851@nuc8i5>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, May 06, 2021 at 12:27:16AM +0800, Dejin Zheng wrote:
> On Tue, Mar 23, 2021 at 05:47:10PM -0500, Bjorn Helgaas wrote:
> > [+cc Christoph, Thomas, Alexander, in case you're interested]
> > [+cc Jonathan, Kurt, Logan: vmd.c and switchtec.c use managed resources
> > and pci_alloc_irq_vectors()]

> > On Fri, Feb 26, 2021 at 11:50:53PM +0800, Dejin Zheng wrote:
> > > Introduce pcim_alloc_irq_vectors(), a device-managed version of
> > > pci_alloc_irq_vectors(). Introducing this function can simplify
> > > the error handling path in many drivers.
> > > 
> > > And use pci_free_irq_vectors() to replace some code in pcim_release(),
> > > they are equivalent, and no functional change. It is more explicit
> > > that pcim_alloc_irq_vectors() is a device-managed function.
> > > 
> > > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> > 
> > Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> > 
> > Let me know if you'd like me to take the series.
> >
> Hi Bjorn,
> 
> These patches are still invisible on the mainline, could you help me to
> take it? Thanks very much!

I guess you have to rebase them on top of the latest rc (or PCI for-next) and
send with a cover letter.

-- 
With Best Regards,
Andy Shevchenko


