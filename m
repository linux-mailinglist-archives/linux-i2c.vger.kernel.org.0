Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7C191E48C3
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 17:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390691AbgE0Pzh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 11:55:37 -0400
Received: from mga04.intel.com ([192.55.52.120]:60699 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388564AbgE0Pzg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 27 May 2020 11:55:36 -0400
IronPort-SDR: 3oQk3ksAi2wLnrl7Fd+1MmFnOS1R8nZLwHJj7umDOdIreWI5J1CktLlpKysRoiLOv549CY2sP1
 uL/UV1jXEYZw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2020 08:55:34 -0700
IronPort-SDR: Q0gMvn7Ne9GC7CTT/yoipOujzi2D2qUiMOQJ9kd+XDLpuvZcSgJxG824+hziHxWxk65zuCd8xj
 472ccBEJEUzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,441,1583222400"; 
   d="scan'208";a="284845768"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002.jf.intel.com with ESMTP; 27 May 2020 08:55:30 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jdyOz-009Fsf-Jr; Wed, 27 May 2020 18:55:33 +0300
Date:   Wed, 27 May 2020 18:55:33 +0300
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
Subject: Re: [PATCH v5 06/11] i2c: designware: Add Baytrail sem config DW I2C
 platform dependency
Message-ID: <20200527155533.GJ1634618@smile.fi.intel.com>
References: <20200527153046.6172-1-Sergey.Semin@baikalelectronics.ru>
 <20200527153046.6172-7-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527153046.6172-7-Sergey.Semin@baikalelectronics.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 27, 2020 at 06:30:41PM +0300, Serge Semin wrote:
> Currently Intel Baytrail I2C semaphore is a feature of the DW APB I2C
> platform driver. It's a bit confusing to see it's config in the menu at
> some separated place with no reference to the platform code. Let's move the
> config definition to be below the I2C_DESIGNWARE_PLATFORM config and mark
> it with "depends on I2C_DESIGNWARE_PLATFORM" statement. By doing so the
> config menu will display the feature right below the DW I2C platform
> driver item and will indent it to the right so signifying its belonging.

Same comment as per previous version.

>  config I2C_DESIGNWARE_BAYTRAIL
>  	bool "Intel Baytrail I2C semaphore support"
>  	depends on ACPI
> +	depends on I2C_DESIGNWARE_PLATFORM
>  	depends on (I2C_DESIGNWARE_PLATFORM=m && IOSF_MBI) || \
>  		   (I2C_DESIGNWARE_PLATFORM=y && IOSF_MBI=y)

i.e. this change is not needed.

-- 
With Best Regards,
Andy Shevchenko


