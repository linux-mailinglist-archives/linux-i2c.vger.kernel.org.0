Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA6F31CC40
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Feb 2021 15:42:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229946AbhBPOl5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Feb 2021 09:41:57 -0500
Received: from mga18.intel.com ([134.134.136.126]:64276 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229912AbhBPOlx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 16 Feb 2021 09:41:53 -0500
IronPort-SDR: l/cd7nk06vGanIa4BlJt9cGCdjC9P6ey6oXT23dmDqYTKR9Od267hBtbJOlqIYNwVG/GxBxHML
 7T6Z63SbodPg==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="170563656"
X-IronPort-AV: E=Sophos;i="5.81,183,1610438400"; 
   d="scan'208";a="170563656"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 06:40:07 -0800
IronPort-SDR: Pq8V7q6rM2uU+JP3glHQjL4C3bJgpyP//rleNfSJVFUkh9uhxSSg9nl3JIE2jPSZvo7/8XCTec
 CU5C+bwn4hvg==
X-IronPort-AV: E=Sophos;i="5.81,183,1610438400"; 
   d="scan'208";a="361703509"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 06:40:04 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lC1WD-005U7q-H3; Tue, 16 Feb 2021 16:40:01 +0200
Date:   Tue, 16 Feb 2021 16:40:01 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        mika.westerberg@linux.intel.com, rric@kernel.org,
        bhelgaas@google.com, wsa@kernel.org, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org, kw@linux.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Message-ID: <YCvZQUaTI2Jt6N4q@smile.fi.intel.com>
References: <20210216141810.747678-1-zhengdejin5@gmail.com>
 <20210216141810.747678-2-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210216141810.747678-2-zhengdejin5@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 16, 2021 at 10:18:07PM +0800, Dejin Zheng wrote:
> Introduce pcim_alloc_irq_vectors(), a device-managed version of
> pci_alloc_irq_vectors(). Introducing this function can simplify
> the error handling path in many drivers.

> -	if (dev->msi_enabled)
> -		pci_disable_msi(dev);
> -	if (dev->msix_enabled)
> -		pci_disable_msix(dev);
> +	pci_free_irq_vectors(dev);

This change deserves a line in the commit message.

-- 
With Best Regards,
Andy Shevchenko


