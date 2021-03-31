Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8487334FDEC
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 12:20:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234830AbhCaKTz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Mar 2021 06:19:55 -0400
Received: from mga03.intel.com ([134.134.136.65]:11279 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234666AbhCaKTb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 31 Mar 2021 06:19:31 -0400
IronPort-SDR: b9oBMQVCNAq1Fam8+ng5SSrxY10P3D/MCJ3IUzy9OO4f48ZhEDAGoKF3pxRjrrVcjAgmb66zxa
 qrdVcSHTb9Pw==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="192000399"
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; 
   d="scan'208";a="192000399"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2021 03:19:30 -0700
IronPort-SDR: nvXmnEjyshWxla5V2Rhzsc6w4ZoUr4MFfjFjrVGNOcUT7WSW9nhtKpbb0bZZm9A/GKFUplHX5j
 1rXTxGlLjhfw==
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; 
   d="scan'208";a="377210369"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2021 03:19:27 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1lRXwa-00HZih-G9; Wed, 31 Mar 2021 13:19:24 +0300
Date:   Wed, 31 Mar 2021 13:19:24 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
Cc:     yangyicong <yangyicong@huawei.com>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "Sergey.Semin@baikalelectronics.ru" 
        <Sergey.Semin@baikalelectronics.ru>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "digetx@gmail.com" <digetx@gmail.com>,
        "treding@nvidia.com" <treding@nvidia.com>,
        "jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
        "rmk+kernel@armlinux.org.uk" <rmk+kernel@armlinux.org.uk>,
        John Garry <john.garry@huawei.com>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
        "Zengtao (B)" <prime.zeng@hisilicon.com>,
        Linuxarm <linuxarm@huawei.com>
Subject: Re: [PATCH 5/5] i2c: designware: Switch over to
 i2c_freq_mode_string()
Message-ID: <YGRMrMI2ADSV9RBa@smile.fi.intel.com>
References: <1617113966-40498-1-git-send-email-yangyicong@hisilicon.com>
 <1617113966-40498-6-git-send-email-yangyicong@hisilicon.com>
 <baa1c622040745b0b13e99e3f7bf2cd3@hisilicon.com>
 <CAHp75VdY58Tm0FDcoVDWuw0LBKUFWC_hBCb5t=4WX_MPzsLvZw@mail.gmail.com>
 <7e82e13b245a4b11917a2e0191acdb1a@hisilicon.com>
 <CAHp75VeTj-wk3WP2-Unoti0+Cajx33b8NOUbBiSBQLmJHn=YAg@mail.gmail.com>
 <793f587a5bc744b393cf677258bce50e@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <793f587a5bc744b393cf677258bce50e@hisilicon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Mar 31, 2021 at 08:53:02AM +0000, Song Bao Hua (Barry Song) wrote:
> 
> > No, please read the code carefully.
> > We can duplicate conditional, but it brings a bit of inconsistency to how the counters are printed.
> 
> Thanks for clarification, I am still confused as the original
> code print the real mode based on dev->master_cfg, the new
> code is printing mode based on frequency.
> 
> My understanding is the original code could fall back to a lower
> speed when higher speed modes were not set successfully. For
> example, high speed mode falls back to fast mode:

This is a good catch! I should be fixed by a separate patch I assume.

> if ((dev->master_cfg & DW_IC_CON_SPEED_MASK) ==
> 		DW_IC_CON_SPEED_HIGH) {
> 		if ((comp_param1 & DW_IC_COMP_PARAM_1_SPEED_MODE_MASK)
> 			!= DW_IC_COMP_PARAM_1_SPEED_MODE_HIGH) {
> 			dev_err(dev->dev, "High Speed not supported!\n");
> 			dev->master_cfg &= ~DW_IC_CON_SPEED_MASK;
> 			dev->master_cfg |= DW_IC_CON_SPEED_FAST;

Basically we have to adjust timings here to reflect this change.

> 			dev->hs_hcnt = 0;
> 			dev->hs_lcnt = 0;
> 		}


-- 
With Best Regards,
Andy Shevchenko


