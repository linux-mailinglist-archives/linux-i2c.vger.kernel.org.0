Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AC1B31C88C
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Feb 2021 11:14:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbhBPKOe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Feb 2021 05:14:34 -0500
Received: from mga06.intel.com ([134.134.136.31]:36802 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229635AbhBPKOb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 16 Feb 2021 05:14:31 -0500
IronPort-SDR: b/yNd2HyoCGb7folJNVx6X3zZNfRf3k3afLWfjWzBdLOfj2vV3ucDnXHYhxqcEEGyEVEszrATb
 W3CSokmjEaUA==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="244326940"
X-IronPort-AV: E=Sophos;i="5.81,183,1610438400"; 
   d="scan'208";a="244326940"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 02:12:44 -0800
IronPort-SDR: XLG93KlggrUX0euPYCsPsnILxtGtL8+XPNTCDrKysJTbdDbOj2XrG8lV2XJVFMvWM5gPX7+UqW
 OgqwQpk68tTA==
X-IronPort-AV: E=Sophos;i="5.81,183,1610438400"; 
   d="scan'208";a="361582444"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 02:12:41 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lBxLT-005RFA-1Z; Tue, 16 Feb 2021 12:12:39 +0200
Date:   Tue, 16 Feb 2021 12:12:39 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Cc:     Dejin Zheng <zhengdejin5@gmail.com>, corbet@lwn.net,
        jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, helgaas@kernel.org, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Message-ID: <YCual+Fq9mcnxbM4@smile.fi.intel.com>
References: <20210215181550.714101-1-zhengdejin5@gmail.com>
 <20210215181550.714101-2-zhengdejin5@gmail.com>
 <YCrfqungNSSxe5lK@rocinante>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YCrfqungNSSxe5lK@rocinante>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 15, 2021 at 09:55:06PM +0100, Krzysztof Wilczyński wrote:

> Question: wouldn't you need to call pci_free_irq_vectors() somewhere,
> possibly to pcim_release() callback?  Although, I am not sure where the
> right place would be.
> 
> I am asking, as the documentation (see [4]) suggests that one would have
> to release allocated IRQ vectors (relevant exceprt):

It's done in pcim_release() but not explicitly.

        if (dev->msi_enabled)
                pci_disable_msi(dev);
        if (dev->msix_enabled)
                pci_disable_msix(dev);

Maybe above can be replaced by pci_free_irq_vectors() to be sure that any
future change to PCI IRQ allocation APIs.

Yes, I have checked and currently the above code is equivalent to
pci_free_irq_vectors().

Dejin, please update your patch accordingly.


-- 
With Best Regards,
Andy Shevchenko


