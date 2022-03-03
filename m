Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCE924CBFB9
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Mar 2022 15:14:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230479AbiCCOPP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Mar 2022 09:15:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230329AbiCCOPO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Mar 2022 09:15:14 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 691FA18C7B4;
        Thu,  3 Mar 2022 06:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646316869; x=1677852869;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5QG9h5lx2anIO5uIyhVHkmCiySJytsOAX/CGcMce8NM=;
  b=LbxnWVSe5MLrk+r0E9HQpM3q9hRl+sToWPrC+eziFpgNYkhGwgHOisJy
   Yskv1fe5pwch43V6V2lZ3SSv3cmdJ7eoJnLrJ6qcRaHC3b/N6SH1akHoY
   1blNHAgunH0GSoB2qlXd3fit6HMGZbE6R6ZgtdrMFW8XLILNt+6ZT6TWx
   2Dt2ghoVS7Ds7hUb0MFs3FGCObASTm0tnfMgGqhLAEt8GEpoq2c8FMMHI
   9vnwBnGMyCSbjb0FtCQ7QHcf15xB2NKymHX86Y8DmuCcSkPAXQe/XieJV
   aeAS2snnVB71ewA2X92snXNkwM6nNHbwye4ZuGSl9ed31/scJlWNZLP5n
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="251258796"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="251258796"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 06:14:29 -0800
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="511442309"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 06:14:22 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nPmD0-00ApIt-Ho;
        Thu, 03 Mar 2022 16:13:34 +0200
Date:   Thu, 3 Mar 2022 16:13:34 +0200
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
Subject: Re: [PATCH v3 09/11] i2c: npcm: Handle spurious interrupts
Message-ID: <YiDNDsPWKyaIUlQR@smile.fi.intel.com>
References: <20220303083141.8742-1-warp5tw@gmail.com>
 <20220303083141.8742-10-warp5tw@gmail.com>
 <YiCaSSbbszm3qYIQ@smile.fi.intel.com>
 <CAHb3i=sStqdSpLKtF_UGmTsOssR_swssTd3pv6c2-z_kiUPTTA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHb3i=sStqdSpLKtF_UGmTsOssR_swssTd3pv6c2-z_kiUPTTA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 03, 2022 at 02:48:20PM +0200, Tali Perry wrote:
> > On Thu, Mar 3, 2022 at 12:37 PM Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Thu, Mar 03, 2022 at 04:31:39PM +0800, Tyrone Ting wrote:
> > > > From: Tali Perry <tali.perry1@gmail.com>
> > > >
> > > > In order to better handle spurious interrupts:
> > > > 1. Disable incoming interrupts in master only mode.
> > > > 2. Clear end of busy (EOB) after every interrupt.
> > > > 3. Return correct status during interrupt.
> > >
> > > This is bad commit message, it doesn't explain "why" you are doing these.

...

> BMC users connect a huge tree of i2c devices and muxes.
> This tree suffers from spikes, noise and double clocks.
> All these may cause spurious interrupts to the BMC.
> 
> If the driver gets an IRQ which was not expected and was not handled
> by the IRQ handler,
> there is nothing left to do but to clear the interrupt and move on.

Yes, the problem is what "move on" means in your case.
If you get a spurious interrupts there are possibilities what's wrong:
1) HW bug(s)
2) FW bug(s)
3) Missed IRQ mask in the driver
4) Improper IRQ mask in the driver

The below approach seems incorrect to me.

> If the transaction failed, driver has a recovery function.
> After that, user may retry to send the message.
> 
> Indeed the commit message doesn't explain all this.
> We will fix and add to the next patchset.
> 
> > > > +     /*
> > > > +      * if irq is not one of the above, make sure EOB is disabled and all
> > > > +      * status bits are cleared.
> > >
> > > This does not explain why you hide the spurious interrupt.
> > >
> > > > +      */
> > > > +     if (ret == IRQ_NONE) {
> > > > +             npcm_i2c_eob_int(bus, false);
> > > > +             npcm_i2c_clear_master_status(bus);
> > > > +     }
> > > > +
> > > > +     return IRQ_HANDLED;

-- 
With Best Regards,
Andy Shevchenko


