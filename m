Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB15B1E493E
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 18:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390745AbgE0QFv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 12:05:51 -0400
Received: from mga04.intel.com ([192.55.52.120]:61691 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390720AbgE0QFr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 27 May 2020 12:05:47 -0400
IronPort-SDR: itCxmWZYRR+VQThHN8E8RVCe6fyNmem84PZIwjw6iOzYNH8G3Gg7neOq7plbrRuD14ug3zYjIh
 O839KhNUJwqg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2020 09:05:45 -0700
IronPort-SDR: 27kqrB+rIQ60LhaQRT/gRvk0/GPT+YNiZG4cexBHhoey3EpZQI5sOpR+MhOxIEC2JsWa6ge/RR
 tbbIaOo3oTQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,441,1583222400"; 
   d="scan'208";a="414254486"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004.jf.intel.com with ESMTP; 27 May 2020 09:05:41 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jdyYq-009Fxm-FB; Wed, 27 May 2020 19:05:44 +0300
Date:   Wed, 27 May 2020 19:05:44 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 11/11] i2c: designware: Add Baikal-T1 System I2C
 support
Message-ID: <20200527160544.GM1634618@smile.fi.intel.com>
References: <20200527153046.6172-1-Sergey.Semin@baikalelectronics.ru>
 <20200527153046.6172-12-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527153046.6172-12-Sergey.Semin@baikalelectronics.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 27, 2020 at 06:30:46PM +0300, Serge Semin wrote:
> Baikal-T1 System Controller is equipped with a dedicated I2C Controller
> which functionality is based on the DW APB I2C IP-core, the only
> difference in a way it' registers are accessed. There are three access
> register provided in the System Controller registers map, which indirectly
> address the normal DW APB I2C registers space. So in order to have the
> Baikal-T1 System I2C Controller supported by the common DW APB I2C driver
> we created a dedicated Dw I2C controller model quirk, which retrieves the
> syscon regmap from the parental dt node and creates a new regmap based on
> it.

...

> +static struct regmap_config bt1_i2c_cfg = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.fast_io = true,
> +	.reg_read = bt1_i2c_read,
> +	.reg_write = bt1_i2c_write,

> +	.max_register = DW_IC_COMP_TYPE

Perhaps leave comma here.

> +};

-- 
With Best Regards,
Andy Shevchenko


