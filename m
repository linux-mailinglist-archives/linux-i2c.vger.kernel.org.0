Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFA4C4A6426
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Feb 2022 19:44:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235284AbiBASo2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Feb 2022 13:44:28 -0500
Received: from mga05.intel.com ([192.55.52.43]:6067 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234947AbiBASo1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 1 Feb 2022 13:44:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643741067; x=1675277067;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BSdILmVVdhlYiW3scvmJUorltIkQzLWqnyPe6L5Sra8=;
  b=hJg+W8Nt3G3p+gyTjtY3bSAYp3yuVtSFCFAcAkS1R5mlJ+h7TMpy66nt
   4KiVBvNk91ziTkdmqd11faTouumEgI2T3ihEsNjM5spIRpk8Ks3dL11CH
   DRl+c+pykhBYI1n/hWDCM/7tlXkClrn4jEv6VpIIstwVZXqm8D2ESvqRo
   vpSU9C+bPuiOm+0tnc5DlJE2bPmGdicpq5RZPTKdXM50ht/hrxVJZXo7/
   2tAya9Wsbd2VIVsQtiTT/zYH965ubFk83alQRV6yNWouOHR6+EAV/KIhz
   iOKeJzmuIs1WiBRRramfCntyqfp95idQW0ruARdKTy6Y0DPqWVRy9wG1E
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="334118357"
X-IronPort-AV: E=Sophos;i="5.88,334,1635231600"; 
   d="scan'208";a="334118357"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2022 10:44:27 -0800
X-IronPort-AV: E=Sophos;i="5.88,334,1635231600"; 
   d="scan'208";a="565686935"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2022 10:44:25 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nEy7e-00HQrv-Tt;
        Tue, 01 Feb 2022 20:43:22 +0200
Date:   Tue, 1 Feb 2022 20:43:22 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Wolfram Sang <wsa@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Linux ACPI <linux-acpi@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: ACPI: Replace acpi_bus_get_device()
Message-ID: <Yfl/Sneg9/HPOjBe@smile.fi.intel.com>
References: <4374434.LvFx2qVVIh@kreacher>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4374434.LvFx2qVVIh@kreacher>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 01, 2022 at 07:00:42PM +0100, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> Replace acpi_bus_get_device() that is going to be dropped with
> acpi_fetch_acpi_dev().
> 
> No intentional functional impact.

...

> +	if (!adev || i2c_acpi_get_info(adev, &info, adapter, NULL))

AFAICS the !adev check is redundant since acpi_device_enumerated() does it.

>  		return AE_OK;

...

> +	struct acpi_device *adev = acpi_fetch_acpi_dev(handle);
>  
> -	if (i2c_acpi_do_lookup(adev, lookup))
> +	if (!adev || i2c_acpi_do_lookup(adev, lookup))
>  		return AE_OK;

Here we need it indeed.
Dunno, if acpi_dev_ready_for_enumeration() can gain the check itself.


-- 
With Best Regards,
Andy Shevchenko


