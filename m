Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37E2B39D852
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jun 2021 11:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230207AbhFGJLR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Jun 2021 05:11:17 -0400
Received: from mga06.intel.com ([134.134.136.31]:42701 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229966AbhFGJLR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 7 Jun 2021 05:11:17 -0400
IronPort-SDR: oNkDAjhELqPl7NqsmA4VxYwoBLvdcTYSVtRuupRWhWyzZ+9LepccKfuGqO63mxrQ/AcT/424kR
 9wBn8f+f/9mA==
X-IronPort-AV: E=McAfee;i="6200,9189,10007"; a="265742366"
X-IronPort-AV: E=Sophos;i="5.83,254,1616482800"; 
   d="scan'208";a="265742366"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2021 02:09:25 -0700
IronPort-SDR: AVf+Bb2+vvg9Pqp1PkGb97UJVhH6aGPAUc9x5fqXuyr5TF8u9ARtib7K5J6AKXFyxfSgi9gUJ4
 e0AOYsvWkdkA==
X-IronPort-AV: E=Sophos;i="5.83,254,1616482800"; 
   d="scan'208";a="469023588"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2021 02:09:23 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lqBG4-000DMN-DN; Mon, 07 Jun 2021 12:09:20 +0300
Date:   Mon, 7 Jun 2021 12:09:20 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     helgaas@kernel.org, corbet@lwn.net, jarkko.nikula@linux.intel.com,
        mika.westerberg@linux.intel.com, rric@kernel.org,
        bhelgaas@google.com, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/4] Introduce pcim_alloc_irq_vectors()
Message-ID: <YL3iQMNTcQrA3okH@smile.fi.intel.com>
References: <20210606070511.778487-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210606070511.778487-1-zhengdejin5@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Jun 06, 2021 at 03:05:07PM +0800, Dejin Zheng wrote:
> Introduce pcim_alloc_irq_vectors(), a device-managed version of
> pci_alloc_irq_vectors(), In some i2c drivers, If pcim_enable_device()
> has been called before, then pci_alloc_irq_vectors() is actually a
> device-managed function. It is used as a device-managed function, So
> replace it with pcim_alloc_irq_vectors().

Thanks!

> Changelog
> ---------
> v5 -> v6:
> 	- rebase to 5.13-rc4

It's already rc5 and I believe you better use the subsystem tree against which
your series is (i.e. PCI for-next or how it is called there).

Besides that kbuild bot is not happy.


-- 
With Best Regards,
Andy Shevchenko


