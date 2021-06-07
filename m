Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B40339E511
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jun 2021 19:15:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230444AbhFGRQq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Jun 2021 13:16:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:41438 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230504AbhFGRQp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 7 Jun 2021 13:16:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 40FB960FF2;
        Mon,  7 Jun 2021 17:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623086093;
        bh=9jfypPKUdKJ4TKMPL0HZ70TpD4lRTMsAT/7JugcEW+g=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=VVntAZBJCrFxdag/Jatlnwr8jFp5Nx5XPaS8INk7lj8ha+sgfZkm1atn0T+zkwa1o
         WnG9n54Sk9Rc+0oErXhzgKHmhPtAb6P+w9e8Dg/RpEISs3INHv+Y6ei59mdcyL+Rmr
         /XSOytZls8BZwBVLQfN1kMRkOc6gHeLe0SB375T6Fy9tOpG4NyQcnAEFHMzemCDNLO
         FZfNlhzYTyPKFeDfA0kDvCL1hJYVSA0kMRgoM8imOR9kA10IXCqj7+JLEGAUAY0NUL
         q3LX212U1Qi1A0ODnfrZezYIhRSf6vvQF3CxG1NwIm5JI4mDDUDS32qEPDGMPgFLzg
         JeCQb3atcLEtg==
Date:   Mon, 7 Jun 2021 12:14:51 -0500
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Dejin Zheng <zhengdejin5@gmail.com>, corbet@lwn.net,
        jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        Sanket.Goswami@amd.com, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v7 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Message-ID: <20210607171451.GA2507298@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YL5FcivbsIBnVvo0@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 07, 2021 at 07:12:34PM +0300, Andy Shevchenko wrote:
> On Mon, Jun 07, 2021 at 11:39:13PM +0800, Dejin Zheng wrote:
> > Introduce pcim_alloc_irq_vectors(), a device-managed version of
> > pci_alloc_irq_vectors(). Introducing this function can simplify
> > the error handling path in many drivers.
> > 
> > And use pci_free_irq_vectors() to replace some code in pcim_release(),
> > they are equivalent, and no functional change. It is more explicit
> > that pcim_alloc_irq_vectors() is a device-managed function.
> 
> ...
> 
> > When CONFIG_PCI=n, there is no stub for pci_is_managed(), but
> > pcim_alloc_irq_vectors() will use it, so add one like other similar stubs.
> > Otherwise there can be build errors, as here by kernel test robot
> > reported:
> > include/linux/pci.h: In function 'pcim_alloc_irq_vectors':
> > >> include/linux/pci.h:1847:7: error: implicit declaration of function 'pci_is_managed' [-Werror=implicit-function-declaration]
> >     1847 |  if (!pci_is_managed(dev))
> >          |       ^~~~~~~~~~~~~~
> 
> This is rather changelog related material. No need to pollute commit message
> with this.
> 
> ...
> 
> > Reported-by: kernel test robot <lkp@intel.com>
> 
> It's new functionality. Why this tag is here?
> Use comments (similar location than changelog) to give a credit if you wish.

Agreed, I'll tidy that up, so no need to repost for this.
