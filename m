Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3477C31ECEF
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Feb 2021 18:14:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232743AbhBRRKE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Feb 2021 12:10:04 -0500
Received: from mga07.intel.com ([134.134.136.100]:1093 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233285AbhBROLr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 18 Feb 2021 09:11:47 -0500
IronPort-SDR: xnK0tsWla3Q1zCbO2NvpDYvJ0RU+1t11yALo6dpz0so1AlA4YUsffvc8KQZKkFl0vi/mBPbVVI
 XbhKXijZCyjQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="247585178"
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; 
   d="scan'208";a="247585178"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2021 06:02:02 -0800
IronPort-SDR: HiiFi7WXW+xa/kiPFzNBdRoER3V0irwMC05IZpVp3GgeW7pmBBbqIUuExc/xuetwOlNDym4vvt
 s1+IttZZg81A==
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; 
   d="scan'208";a="364840235"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2021 06:01:59 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lCjsS-005xjl-6S; Thu, 18 Feb 2021 16:01:56 +0200
Date:   Thu, 18 Feb 2021 16:01:56 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Robert Richter <rric@kernel.org>
Cc:     Dejin Zheng <zhengdejin5@gmail.com>, corbet@lwn.net,
        jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        bhelgaas@google.com, wsa@kernel.org, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org, kw@linux.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] Introduce pcim_alloc_irq_vectors()
Message-ID: <YC5zVHnRog3EX0rl@smile.fi.intel.com>
References: <20210216160249.749799-1-zhengdejin5@gmail.com>
 <YC41HD422Mjh1IZK@rric.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YC41HD422Mjh1IZK@rric.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Feb 18, 2021 at 10:36:28AM +0100, Robert Richter wrote:
> On 17.02.21 00:02:45, Dejin Zheng wrote:
> > Introduce pcim_alloc_irq_vectors(), a device-managed version of
> > pci_alloc_irq_vectors(), In some i2c drivers, If pcim_enable_device()
> > has been called before, then pci_alloc_irq_vectors() is actually a
> > device-managed function. It is used as a device-managed function, So
> > replace it with pcim_alloc_irq_vectors().
> > 
> > Changelog
> > ---------
> > v2 -> v3:
> > 	- Add some commit comments for replace some codes in
> > 	  pcim_release() by pci_free_irq_vectors().
> > 	- Simplify the error handling path in i2c designware
> > 	  driver.
> > v1 -> v2:
> > 	- Use pci_free_irq_vectors() to replace some code in
> > 	  pcim_release().
> > 	- Modify some commit messages.
> > 
> > Dejin Zheng (4):
> >   PCI: Introduce pcim_alloc_irq_vectors()
> >   Documentation: devres: Add pcim_alloc_irq_vectors()
> 
> This is already taken care of, see pcim_release():
> 
>         if (dev->msi_enabled)
>                 pci_disable_msi(dev);
>         if (dev->msix_enabled)
>                 pci_disable_msix(dev);
> 
> Activated when used with pcim_enable_device().
> 
> This series is not required.

The problem this series solves is an imbalanced API.
Christoph IIRC was clear that if we want to use PCI IRQ allocation API the
caller must know what's going on. Hiding this behind the scenes is not good.
And this series unhides that.

Also, you may go and clean up all pci_free_irq_vectors() when
pcim_enable_device() is called, but I guess you will get painful process and
rejection in a pile of cases.

-- 
With Best Regards,
Andy Shevchenko


