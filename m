Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 913D71E4464
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 15:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388603AbgE0NuY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 09:50:24 -0400
Received: from mga18.intel.com ([134.134.136.126]:11641 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388516AbgE0NuY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 27 May 2020 09:50:24 -0400
IronPort-SDR: tGAcWAIk7zdzhoykw2ighaaIoKnYlfM0ZV24KfHqrxV0IoRUh7Crg3sb9xAjlQCiVDXzoa2L36
 uKTQNENQWsuA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2020 06:50:23 -0700
IronPort-SDR: H0p5dRR8T13DBoId/dME1iuTy+t/Rp36eNRRIoaMXkmQhD3k8cz0gijFEGF1ho0R3hqSgIxSK9
 Vv4gQQiL8hgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,441,1583222400"; 
   d="scan'208";a="284807538"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002.jf.intel.com with ESMTP; 27 May 2020 06:50:20 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jdwRr-009EnT-C5; Wed, 27 May 2020 16:50:23 +0300
Date:   Wed, 27 May 2020 16:50:23 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/11] i2c: designware: Convert driver to using regmap
 API
Message-ID: <20200527135023.GZ1634618@smile.fi.intel.com>
References: <20200527120111.5781-1-Sergey.Semin@baikalelectronics.ru>
 <20200527120111.5781-9-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527120111.5781-9-Sergey.Semin@baikalelectronics.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 27, 2020 at 03:01:08PM +0300, Serge Semin wrote:
> Seeing the DW I2C driver is using flags-based accessors with two
> conditional clauses it would be better to replace them with the regmap
> API IO methods and to initialize the regmap object with read/write
> callbacks specific to the controller registers map implementation. This
> will be also handy for the drivers with non-standard registers mapping
> (like an embedded into the Baikal-T1 System Controller DW I2C block, which
> glue-driver is a part of this series).
> 
> As before the driver tries to detect the mapping setup at probe stage and
> creates a regmap object accordingly, which will be used by the rest of the
> code to correctly access the controller registers. In two places it was
> appropriate to convert the hand-written read-modify-write and
> read-poll-loop design patterns to the corresponding regmap API
> ready-to-use methods.
> 
> Note the regmap IO methods return value is checked only at the probe
> stage. The rest of the code won't do this because basically we have
> MMIO-based regmap so non of the read/write methods can fail (this also
> won't be needed for the Baikal-T1-specific I2C controller).

Thanks! My comments below.

...

>  #include <linux/export.h>
>  #include <linux/i2c.h>
>  #include <linux/interrupt.h>
> +#include <linux/regmap.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>

Please, keep ordered.

...

> +static int dw_reg_write_word(void *context, unsigned int reg, unsigned int val)
> +{
> +	struct dw_i2c_dev *dev = context;
> +

> +	writew_relaxed((u16)val, dev->base + reg);
> +	writew_relaxed((u16)(val >> 16), dev->base + reg + 2);

What does explicit casting here help to?
I think you may drop it.

> +	return 0;
>  }

...

>  #include <linux/errno.h>
>  #include <linux/i2c.h>
>  #include <linux/interrupt.h>
> +#include <linux/regmap.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>

Order?

-- 
With Best Regards,
Andy Shevchenko


