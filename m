Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3DDE39E37E
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jun 2021 18:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233035AbhFGQ0e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Jun 2021 12:26:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:59832 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233108AbhFGQW1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 7 Jun 2021 12:22:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 77B7361922;
        Mon,  7 Jun 2021 16:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623082516;
        bh=PDrSDWqJK08hzrvryP+C2U4KMYcUrGcWbd+BDrHDCdI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=jaAm026jBYSQTqGZkG0y6bYor/w4P/pMTBgv1Ad25MEeTol+68Zn3lZdAiNTgHeJ+
         Ln/CLnpyKeYC8+E/TGjJlOtK3O/1gncy6Tthl4cKvqUUZ0UrykIlPa8hclODWk/N+m
         9Nows2ysfgvBX5nEDhGz9gdmANukJ/JBo+aKVxITtYvZU5h+S+6d3T8Hs161TY/rHd
         7Ys23L6b6IhFxScm6uHt5M1JszHhoIj61sKoGF0FbmKP4f84KGqwNbseYEAx+eFECF
         FMKHVOKF9iRQ0F/BLz6ys4A6gmjiFlRDD17zdsvAcHCGSghy55tq73Nc0i+HqNwXAJ
         h7+SDAuH32KKw==
Date:   Mon, 7 Jun 2021 11:15:15 -0500
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Dejin Zheng <zhengdejin5@gmail.com>, corbet@lwn.net,
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
Message-ID: <20210607161515.GA2495140@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLdGfmrk6+FbTbNN@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 02, 2021 at 11:51:10AM +0300, Andy Shevchenko wrote:
> On Thu, May 06, 2021 at 12:27:16AM +0800, Dejin Zheng wrote:
> > On Tue, Mar 23, 2021 at 05:47:10PM -0500, Bjorn Helgaas wrote:
> > > [+cc Christoph, Thomas, Alexander, in case you're interested]
> > > [+cc Jonathan, Kurt, Logan: vmd.c and switchtec.c use managed resources
> > > and pci_alloc_irq_vectors()]
> 
> > > On Fri, Feb 26, 2021 at 11:50:53PM +0800, Dejin Zheng wrote:
> > > > Introduce pcim_alloc_irq_vectors(), a device-managed version of
> > > > pci_alloc_irq_vectors(). Introducing this function can simplify
> > > > the error handling path in many drivers.
> > > > 
> > > > And use pci_free_irq_vectors() to replace some code in pcim_release(),
> > > > they are equivalent, and no functional change. It is more explicit
> > > > that pcim_alloc_irq_vectors() is a device-managed function.
> > > > 
> > > > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> > > 
> > > Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> > > 
> > > Let me know if you'd like me to take the series.
> > >
> > Hi Bjorn,
> > 
> > These patches are still invisible on the mainline, could you help me to
> > take it? Thanks very much!
> 
> I guess you have to rebase them on top of the latest rc (or PCI for-next) and
> send with a cover letter.

No need to rebase them.  The ideal is to base them on the "main" branch
from https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git/
(currently v5.13-rc) because that's what I base topic branches on.
But I can deal with whatever your current base is.

Thanks for the reminder; I'll take a look at your v7 posting.

Bjorn
