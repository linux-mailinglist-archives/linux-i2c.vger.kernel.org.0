Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D91A54CBFC6
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Mar 2022 15:16:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbiCCORB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Mar 2022 09:17:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232647AbiCCORA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Mar 2022 09:17:00 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 631EC18CC67;
        Thu,  3 Mar 2022 06:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646316974; x=1677852974;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ynRuusHJD/05mmCsacrrHzXmY4ZK7oPmKnF+sWwUGc0=;
  b=ad3FVEqRnM1S71RjthFR8oAZGtR1oAaiWno5wPDeEJYdH94Tk/yNFryz
   BOIE1Ho9+E5QpXR0NiyFmA98r/06rlHo2pN6G4IEAfaw0Oy5l+WmUXexj
   lxZ9smG5BrPxIU0rEn8v2Zot2xy6qGcJTJErrTMAAkaMvq3VFGjWahNIm
   kpcEeQnrUKpxt7112/XOCfOh2/rpK+K3DZaVyuukzV0jtiDpjFdao2CpL
   nSHaVcK5a8Xj2flSJ9fnEtWwFk8/coRyilDkldsHp+p8gSXbhD/ikQAI7
   oX6j1trALy3VUlysw4M3PexiI8UDjbE1LzidPoVqSKLcvo0Avk2+nR/ky
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="253614680"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="253614680"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 06:16:12 -0800
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="545876842"
Received: from smile.fi.intel.com ([10.237.72.59])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 06:16:05 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nPmEg-00ApL3-8j;
        Thu, 03 Mar 2022 16:15:18 +0200
Date:   Thu, 3 Mar 2022 16:15:18 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tali Perry <tali.perry1@gmail.com>
Cc:     Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com,
        Tomer Maimon <tmaimon77@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        yangyicong@hisilicon.com, semen.protsenko@linaro.org,
        Wolfram Sang <wsa@kernel.org>, jie.deng@intel.com,
        sven@svenpeter.dev, bence98@sch.bme.hu, lukas.bulwahn@gmail.com,
        arnd@arndb.de, olof@lixom.net, Tali Perry <tali.perry@nuvoton.com>,
        Avi Fishman <Avi.Fishman@nuvoton.com>,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 08/11] i2c: npcm: Correct register access width
Message-ID: <YiDNdlEKqorDFkZB@smile.fi.intel.com>
References: <20220303083141.8742-1-warp5tw@gmail.com>
 <20220303083141.8742-9-warp5tw@gmail.com>
 <YiCZlhJoXPLpQ6/D@smile.fi.intel.com>
 <CAHb3i=t+Ai3w5mMhmZxxMsD7Zv0xpM4ZicMCmdDMtVn_OMbWYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHb3i=t+Ai3w5mMhmZxxMsD7Zv0xpM4ZicMCmdDMtVn_OMbWYA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 03, 2022 at 02:54:27PM +0200, Tali Perry wrote:
> > On Thu, Mar 03, 2022 at 04:31:38PM +0800, Tyrone Ting wrote:
> > > From: Tyrone Ting <kfting@nuvoton.com>
> > >
> > > Use ioread8 instead of ioread32 to access the SMBnCTL3 register since
> > > the register is only 8-bit wide.
> >
> > > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
> >
> > No, this is bad commit message, since you have bitwise masks and there is
> > nothing to fix from functional point of view. So, why is this a fix?
> >
> 
> The next gen of this device is a 64 bit cpu.
> The module is and was 8 bit.
> 
> The ioread32 that seemed to work smoothly on a 32 bit machine
> was causing a panic on a 64 bit machine.
> since the module is 8 bit we changed to ioread8.
> This is working both for the 32 and 64 CPUs with no issue.

Then the commit message is completely wrong here.
And provide necessary (no need to have noisy commit messages)
bits of the oops to show what's going on

-- 
With Best Regards,
Andy Shevchenko


