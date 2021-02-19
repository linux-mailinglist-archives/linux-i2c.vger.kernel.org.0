Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AFDB31FB62
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Feb 2021 15:52:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbhBSOvp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Feb 2021 09:51:45 -0500
Received: from mga04.intel.com ([192.55.52.120]:31939 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229930AbhBSOuy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Feb 2021 09:50:54 -0500
IronPort-SDR: +4RF03nIyHPZi7UhDcYVMIbSKvTEB1wYhL2NAhGScX5KBXK6Wz0XFJ+6z1reYsZsYxCG3dr0bz
 BtnlyA8UglYA==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="181303765"
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; 
   d="scan'208";a="181303765"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2021 06:49:03 -0800
IronPort-SDR: Uq9BrER0cYtgb3PBefjRQKbz28uOWaMWnMGEDOB/EltjgHv47bgZ+ybyeMZfqASp/GoPK6lv8A
 uWJy/okfay3w==
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; 
   d="scan'208";a="428864916"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2021 06:48:59 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lD75V-006EgV-5R; Fri, 19 Feb 2021 16:48:57 +0200
Date:   Fri, 19 Feb 2021 16:48:57 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Robert Richter <rric@kernel.org>
Cc:     Dejin Zheng <zhengdejin5@gmail.com>, corbet@lwn.net,
        jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        bhelgaas@google.com, wsa@kernel.org, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Message-ID: <YC/P2VF8ki28Hqnp@smile.fi.intel.com>
References: <20210218150458.798347-1-zhengdejin5@gmail.com>
 <20210218150458.798347-2-zhengdejin5@gmail.com>
 <YC/NxfsQn2RKkrp8@rric.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YC/NxfsQn2RKkrp8@rric.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Feb 19, 2021 at 03:40:05PM +0100, Robert Richter wrote:
> On 18.02.21 23:04:55, Dejin Zheng wrote:
> > Introduce pcim_alloc_irq_vectors(), a device-managed version of
> > pci_alloc_irq_vectors(). Introducing this function can simplify
> > the error handling path in many drivers.
> > 
> > And use pci_free_irq_vectors() to replace some code in pcim_release(),
> > they are equivalent, and no functional change. It is more explicit
> > that pcim_alloc_irq_vectors() is a device-managed function.

...

> If it is just about having a pcim-* counterpart why not just an inline
> function like the one below.

It's a good suggestion, thanks!

Still we need to amend pcim_release() to explicitly show that we call
pci_free_irq_vectors().

-- 
With Best Regards,
Andy Shevchenko


