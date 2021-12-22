Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E06C47D143
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Dec 2021 12:47:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235657AbhLVLrg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Dec 2021 06:47:36 -0500
Received: from mga02.intel.com ([134.134.136.20]:37057 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233332AbhLVLrg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 22 Dec 2021 06:47:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640173656; x=1671709656;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aoAbh32TYP3w4Jy1rx3e+sOGeADjU570Cm9ZONwMIVA=;
  b=PA1a7sxHe81eWKAAI1whMqfvM33X8DRR5CmvW17Cg2lMNrD8dBxQFGZV
   F9gvkI64Czxm8TaTdI4TpnElHJeLr1JGLTWSbSInuI6jxg+AccRrsTKY3
   XIaM2ekc6TW6fsk9hqtNH3yfzghXANoDF6R2v8jjJfFpmr/epqauMuBAX
   4H1sP+2He/MVDzn5y+tTQ+395m6wdysJhYZ8DjmUE/hHkAoSGc0pJGPDR
   bl6pv6+auLjJEF+wgk1wwBsQzq9ifCjluzCUX0tLF4/muVX+VEtBvtmn0
   5cH30cxxYNs+UP+nSiO1dLEuPT/LMooUZnyvAGdH0DwoovrPEuQp198qM
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="227898468"
X-IronPort-AV: E=Sophos;i="5.88,226,1635231600"; 
   d="scan'208";a="227898468"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2021 03:47:36 -0800
X-IronPort-AV: E=Sophos;i="5.88,226,1635231600"; 
   d="scan'208";a="607382745"
Received: from smile.fi.intel.com ([10.237.72.61])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2021 03:47:33 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1n004O-000k9r-5h;
        Wed, 22 Dec 2021 13:46:08 +0200
Date:   Wed, 22 Dec 2021 13:46:07 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jan Dabros <jsd@semihalf.com>,
        Serge Semin <fancer.lancer@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        wsa@kernel.org, rrangel@chromium.org, mw@semihalf.com,
        jaz@semihalf.com, upstream@semihalf.com
Subject: Re: [RFC 0/2] i2c-designware: Add support for AMD PSP semaphore
Message-ID: <YcMP/9ATna3/yckC@smile.fi.intel.com>
References: <20211222094558.2098791-1-jsd@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211222094558.2098791-1-jsd@semihalf.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

+Serge

On Wed, Dec 22, 2021 at 10:45:56AM +0100, Jan Dabros wrote:
> This patchset comprises support for new i2c-designware controller setup on some
> AMD Cezanne SoCs, where x86 is sharing i2c bus with PSP. PSP uses the same
> controller and acts as an i2c arbitrator there (x86 is leasing bus from it).
> 
> First commit aims to improve generic i2c-designware code by adding extra locking
> on probe() and disable() paths. I would like to ask someone with access to
> boards which use Intel BayTrail(CONFIG_I2C_DESIGNWARE_BAYTRAIL) to verify
> behavior of my changes on such setup.
> 
> Second commit adds support for new PSP semaphore arbitration mechanism.
> Implementation is similar to the one from i2c-designware-baytrail.c however
> there are two main differences:
> 1) Add new ACPI ID in order to protect against silent binding of the old driver
> to the setup with PSP semaphore. Extra flag ARBITRATION_SEMAPHORE added to this
> new _HID allows to recognize setup with PSP.
> 2) Beside acquire_lock() and release_lock() methods we are also applying quirks
> to the lock_bus() and unlock_bus() global adapter methods. With this in place
> all i2c clients drivers may lock i2c bus for a desired number of i2c
> transactions (e.g. write-wait-read) without being aware of that such bus is
> shared with another entity.
> 
> Mark this patchset as RFC, since waiting for new ACPI ID value. As a temporary
> measure use "AMDI9999". Once proper one will be ready, will re-send this CL for
> review & merge.
> 
> Looking forward to some feedback.

If I am not mistaken something similar happened in Baikal T1.
Perhaps Serge has something to share.

-- 
With Best Regards,
Andy Shevchenko


