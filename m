Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10DDF31CC3D
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Feb 2021 15:42:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbhBPOll (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Feb 2021 09:41:41 -0500
Received: from mga06.intel.com ([134.134.136.31]:60032 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229916AbhBPOlL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 16 Feb 2021 09:41:11 -0500
IronPort-SDR: jIas1xF4TaOMw+ssUkMtzicRfSWUDAzUO3b4FTlWVdjqE2uvNGLv88+rt1kqPeX96WU+LtIsPJ
 +vsmfDa+0+/A==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="244377521"
X-IronPort-AV: E=Sophos;i="5.81,183,1610438400"; 
   d="scan'208";a="244377521"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 06:39:14 -0800
IronPort-SDR: zXTNp0diplCmlIc1HMcl9+3iipNwCOEwZUWnYn4bABY29FaA3CkgDNxoeIKWy3Mx9tjPvJn2Kj
 /KU7OBGzcpRA==
X-IronPort-AV: E=Sophos;i="5.81,183,1610438400"; 
   d="scan'208";a="493310383"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 06:39:11 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lC1VN-005U7J-4w; Tue, 16 Feb 2021 16:39:09 +0200
Date:   Tue, 16 Feb 2021 16:39:09 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        mika.westerberg@linux.intel.com, rric@kernel.org,
        bhelgaas@google.com, wsa@kernel.org, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org, kw@linux.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] i2c: designware: Use the correct name of
 device-managed function
Message-ID: <YCvZDTLYPOvg73lb@smile.fi.intel.com>
References: <20210216141810.747678-1-zhengdejin5@gmail.com>
 <20210216141810.747678-4-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210216141810.747678-4-zhengdejin5@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 16, 2021 at 10:18:09PM +0800, Dejin Zheng wrote:
> Use the new function pcim_alloc_irq_vectors() to allocate IRQ vectors,
> the pcim_alloc_irq_vectors() function, an explicit device-managed version
> of pci_alloc_irq_vectors(). If pcim_enable_device() has been called
> before, then pci_alloc_irq_vectors() is actually a device-managed
> function. It is used here as a device-managed function, So replace it
> with pcim_alloc_irq_vectors().

...

> -	r = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
> +	r = pcim_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
>  	if (r < 0)
>  		return r;

It's good, but now why do we have pci_free_irq_vectors() in the same file?


-- 
With Best Regards,
Andy Shevchenko


