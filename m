Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8327366F10
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Apr 2021 17:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240929AbhDUPYq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Apr 2021 11:24:46 -0400
Received: from mga14.intel.com ([192.55.52.115]:35687 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244010AbhDUPYC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 21 Apr 2021 11:24:02 -0400
IronPort-SDR: cdTdzFgRViFcDv8gRKs8iUF7CgxnaoVW1zrXGcJafDiGZdZeCCDwCk8AyYZHbr6cpteVfwUiEN
 kJU3XFV7cHEw==
X-IronPort-AV: E=McAfee;i="6200,9189,9961"; a="195273900"
X-IronPort-AV: E=Sophos;i="5.82,240,1613462400"; 
   d="scan'208";a="195273900"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2021 08:23:29 -0700
IronPort-SDR: goI6wrw2Cay5It9IfcIPGyGV379vnJrjvX3s1ZHB8nSCryD3TSo2CIT4KGJ7ZpNmtZstU7CY7x
 4ha8JHMX5UqQ==
X-IronPort-AV: E=Sophos;i="5.82,240,1613462400"; 
   d="scan'208";a="455380891"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2021 08:23:26 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lZEhH-0064QA-K1; Wed, 21 Apr 2021 18:23:23 +0300
Date:   Wed, 21 Apr 2021 18:23:23 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        mika.westerberg@linux.intel.com, rric@kernel.org,
        bhelgaas@google.com, wsa@kernel.org, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/4] Introduce pcim_alloc_irq_vectors()
Message-ID: <YIBDa1bvKInOg2LH@smile.fi.intel.com>
References: <20210226155056.1068534-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210226155056.1068534-1-zhengdejin5@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Feb 26, 2021 at 11:50:52PM +0800, Dejin Zheng wrote:
> Introduce pcim_alloc_irq_vectors(), a device-managed version of
> pci_alloc_irq_vectors(), In some i2c drivers, If pcim_enable_device()
> has been called before, then pci_alloc_irq_vectors() is actually a
> device-managed function. It is used as a device-managed function, So
> replace it with pcim_alloc_irq_vectors().

Bjorn, I don't see this anywhere, except mailing list. Neither your opinion.
What is the plan?

> Changelog
> ---------
> v4 -> v5:
> 	- Remove the check of enable device in pcim_alloc_irq_vectors()
> 	  and make it as a static line function.
> 	- Modify the subject name in patch 3 and patch 4.
> v3 -> v4:
> 	- add some commit comments for patch 3
> v2 -> v3:
> 	- Add some commit comments for replace some codes in
> 	  pcim_release() by pci_free_irq_vectors().
> 	- Simplify the error handling path in i2c designware
> 	  driver.
> v1 -> v2:
> 	- Use pci_free_irq_vectors() to replace some code in
> 	  pcim_release().
> 	- Modify some commit messages.
> 
> Dejin Zheng (4):
>   PCI: Introduce pcim_alloc_irq_vectors()
>   Documentation: devres: Add pcim_alloc_irq_vectors()
>   i2c: designware: Use pcim_alloc_irq_vectors() to allocate IRQ vectors
>   i2c: thunderx: Use pcim_alloc_irq_vectors() to allocate IRQ vectors
> 
>  .../driver-api/driver-model/devres.rst        |  1 +
>  drivers/i2c/busses/i2c-designware-pcidrv.c    | 15 ++++--------
>  drivers/i2c/busses/i2c-thunderx-pcidrv.c      |  2 +-
>  drivers/pci/pci.c                             |  5 +---
>  include/linux/pci.h                           | 24 +++++++++++++++++++
>  5 files changed, 31 insertions(+), 16 deletions(-)
> 
> -- 
> 2.25.0
> 

-- 
With Best Regards,
Andy Shevchenko


