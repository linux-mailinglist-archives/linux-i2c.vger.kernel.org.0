Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 128571E441A
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 15:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388602AbgE0Nnk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 09:43:40 -0400
Received: from mga18.intel.com ([134.134.136.126]:11202 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387581AbgE0Nnk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 27 May 2020 09:43:40 -0400
IronPort-SDR: b9ZxhJGH4GUhn0jve4kaJr13cJxWbR+w+zBRdmPiuH/lXDtdCao3rSW3ezwMaBy2OTFE4SbIxk
 rPQI0VyczK3w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2020 06:43:39 -0700
IronPort-SDR: dY6u9OQowCN3pIUwRqJi5VniyqdUtAkl4F8EPNniYD9miuGF/kA9RMEDzs7GXuacsiL5SBpssc
 rzqqjOL/sWZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,441,1583222400"; 
   d="scan'208";a="468745133"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006.fm.intel.com with ESMTP; 27 May 2020 06:43:36 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jdwLL-009EkK-MI; Wed, 27 May 2020 16:43:39 +0300
Date:   Wed, 27 May 2020 16:43:39 +0300
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
Subject: Re: [PATCH v4 07/11] i2c: designware: Discard Cherry Trail model flag
Message-ID: <20200527134339.GY1634618@smile.fi.intel.com>
References: <20200527120111.5781-1-Sergey.Semin@baikalelectronics.ru>
 <20200527120111.5781-8-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527120111.5781-8-Sergey.Semin@baikalelectronics.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 27, 2020 at 03:01:07PM +0300, Serge Semin wrote:
> A PM workaround activated by the flag MODEL_CHERRYTRAIL has been removed
> since commit 9cbeeca05049 ("i2c: designware: Remove Cherry Trail PMIC I2C
> bus pm_disabled workaround"), but the flag most likely by mistake has been
> left in the Dw I2C drivers. Let's remove it.

...

> -#define MODEL_MSCC_OCELOT	0x00000200
> +#define MODEL_MSCC_OCELOT	0x00000100

But why?

Does 0x200 work or not? I didn't see this in commit message.

-- 
With Best Regards,
Andy Shevchenko


