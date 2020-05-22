Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A2E81DE6EE
	for <lists+linux-i2c@lfdr.de>; Fri, 22 May 2020 14:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728801AbgEVMcu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 May 2020 08:32:50 -0400
Received: from mga01.intel.com ([192.55.52.88]:30730 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728495AbgEVMcu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 22 May 2020 08:32:50 -0400
IronPort-SDR: vIum7ldppE2n7O0qXiHPTnJzTQXWSpAf4FB1k3+4f/bmbKyd2mefokXU60mxFpti1e0Q5RQ9CB
 GsEu4vBMdctg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2020 05:32:49 -0700
IronPort-SDR: gdNOhWPiD26Qwsk/8U/6trhMNaOkd6iMPsw+64KEMYwuMKrff1ja/OqQ3CbSLJRswf4BsofcDC
 tkglDYyxrfwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,421,1583222400"; 
   d="scan'208";a="309358979"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by FMSMGA003.fm.intel.com with ESMTP; 22 May 2020 05:32:46 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jc6r2-008EIs-Rz; Fri, 22 May 2020 15:32:48 +0300
Date:   Fri, 22 May 2020 15:32:48 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tali Perry <tali.perry1@gmail.com>
Cc:     ofery@google.com, brendanhiggins@google.com,
        avifishman70@gmail.com, tmaimon77@gmail.com, kfting@nuvoton.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, wsa@the-dreams.de,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 3/3] i2c: npcm7xx: Add support for slave mode for
 Nuvoton
Message-ID: <20200522123248.GC1634618@smile.fi.intel.com>
References: <20200522113312.181413-1-tali.perry1@gmail.com>
 <20200522113312.181413-4-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200522113312.181413-4-tali.perry1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, May 22, 2020 at 02:33:12PM +0300, Tali Perry wrote:
> Add support for slave mode for Nuvoton
> NPCM BMC I2C controller driver.

I guess it will require v14, so, few nits below.

...

> +const int npcm_i2caddr[I2C_NUM_OWN_ADDR] = {
> +					    NPCM_I2CADDR1, NPCM_I2CADDR2,
> +					    NPCM_I2CADDR3, NPCM_I2CADDR4,
> +					    NPCM_I2CADDR5, NPCM_I2CADDR6,
> +					    NPCM_I2CADDR7, NPCM_I2CADDR8,
> +					    NPCM_I2CADDR9, NPCM_I2CADDR10,

One TAB is enough.

> +					   };

No need to indent at all.

...

> +	/* Set and enable the address */
> +	iowrite8(sa_reg, bus->reg + npcm_i2caddr[(int)addr_type]);

I'm wondering why you need a casting here.

-- 
With Best Regards,
Andy Shevchenko


