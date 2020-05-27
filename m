Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D04F1E48E4
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 17:57:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390727AbgE0P5b (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 11:57:31 -0400
Received: from mga09.intel.com ([134.134.136.24]:46751 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389098AbgE0P5a (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 27 May 2020 11:57:30 -0400
IronPort-SDR: /RmBll3NcqzurLjWivv0Ghnq5xxgj2jb78FFbvo/j95HEIbawZi2Ty6mY8fSVXBSvyIAIbdPHw
 uVF0hID3qgQQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2020 08:57:28 -0700
IronPort-SDR: 48nmseDxO4buDj9BHJ72XfM7rkj0ZuzQrmlgWuQGxqfSjijDZadQB+8NIQrLGd5GtUaD3f9rrI
 YhKw3Kbh5dwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,441,1583222400"; 
   d="scan'208";a="255505955"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007.fm.intel.com with ESMTP; 27 May 2020 08:57:23 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jdyQn-009Ftm-Uq; Wed, 27 May 2020 18:57:25 +0300
Date:   Wed, 27 May 2020 18:57:25 +0300
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
Subject: Re: [PATCH v5 07/11] i2c: designware: Discard Cherry Trail model flag
Message-ID: <20200527155725.GK1634618@smile.fi.intel.com>
References: <20200527153046.6172-1-Sergey.Semin@baikalelectronics.ru>
 <20200527153046.6172-8-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527153046.6172-8-Sergey.Semin@baikalelectronics.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 27, 2020 at 06:30:42PM +0300, Serge Semin wrote:
> A PM workaround activated by the flag MODEL_CHERRYTRAIL has been removed
> since commit 9cbeeca05049 ("i2c: designware: Remove Cherry Trail PMIC I2C
> bus pm_disabled workaround"), but the flag most likely by mistake has been
> left in the Dw I2C drivers. Let's remove it.

Same comment as per previous version.

> Since MODEL_MSCC_OCELOT is
> the only model-flag left, redefine it to be 0x100 so setting a very first
> bit in the MODEL_MASK bits range.

Cool, but why should we care?

> -#define MODEL_MSCC_OCELOT	0x00000200
> +#define MODEL_MSCC_OCELOT	0x00000100

We have 4 bits for that, and you are going to reuse this anyway.

I consider this unneeded churn.

-- 
With Best Regards,
Andy Shevchenko


