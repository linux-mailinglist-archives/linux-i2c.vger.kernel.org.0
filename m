Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC08E1E4409
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 15:42:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388170AbgE0NmV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 09:42:21 -0400
Received: from mga18.intel.com ([134.134.136.126]:11080 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387771AbgE0NmV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 27 May 2020 09:42:21 -0400
IronPort-SDR: VUoUA6ge9QyNZ8FD+D8CgPPlFR6AeYRY2fzHKkm1HDxaNEEN0jHkVk4mNoilXbTdqCno1r/AFD
 XgU6ONkAtvCg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2020 06:42:20 -0700
IronPort-SDR: vW6e7s7Gzf/CPGZx6t4D/RIeBm/4YAK4Hjp3JykGkTjQ4CRqBvxRYnXV0wkC/DVCr2S9XXN+QK
 Mqw3x+haU+5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,441,1583222400"; 
   d="scan'208";a="442523669"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005.jf.intel.com with ESMTP; 27 May 2020 06:42:17 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jdwK4-009EjZ-2S; Wed, 27 May 2020 16:42:20 +0300
Date:   Wed, 27 May 2020 16:42:20 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 06/11] i2c: designware: Add Baytrail sem config DW I2C
 platform dependency
Message-ID: <20200527134220.GX1634618@smile.fi.intel.com>
References: <20200527120111.5781-1-Sergey.Semin@baikalelectronics.ru>
 <20200527120111.5781-7-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527120111.5781-7-Sergey.Semin@baikalelectronics.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 27, 2020 at 03:01:06PM +0300, Serge Semin wrote:
> Currently Intel Baytrail I2C semaphore is a feature of the DW APB I2C
> platform driver. It's a bit confusing to see it's config in the menu at
> some separated place with no reference to the platform code. Let's move the
> config definition to be below the I2C_DESIGNWARE_PLATFORM config and mark
> it with "depends on I2C_DESIGNWARE_PLATFORM" statement. By doing so the
> config menu will display the feature right below the DW I2C platform
> driver item and will indent it to the right so signifying its belonging.

...

>  config I2C_DESIGNWARE_BAYTRAIL
>  	bool "Intel Baytrail I2C semaphore support"
>  	depends on ACPI
> +	depends on I2C_DESIGNWARE_PLATFORM
>  	depends on (I2C_DESIGNWARE_PLATFORM=m && IOSF_MBI) || \
>  		   (I2C_DESIGNWARE_PLATFORM=y && IOSF_MBI=y)

I didn't get this. What is broken now with existing dependencies?

(The move of the PCI part is fine)

-- 
With Best Regards,
Andy Shevchenko


