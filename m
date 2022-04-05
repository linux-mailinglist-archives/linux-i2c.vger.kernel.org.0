Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7FC04F240B
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Apr 2022 09:14:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231664AbiDEHQy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Apr 2022 03:16:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231433AbiDEHPz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Apr 2022 03:15:55 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94BD11140;
        Tue,  5 Apr 2022 00:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649142829; x=1680678829;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gVevFzET9ycXC2k6vi+6fMLZJPIT3zjfXlIjZtaxpYQ=;
  b=AEF9oBQuzYCNFUjyz9UMl4Q7vfdSLJNzbbzzaAKwajkSNuzZrqYXG6W7
   3fdDJq8qKFY9MBqT+LGIwYXWhKNlqmVjE5n799Em7ou5B0gOWDE0sHM4c
   dbPIqvpOk+i6i2Tmo4xZueG/JjKVL+orA4oYyQe4ZkD8Nrymh3sLw+Mjy
   XQ141iT3j0mDq3BwYxqecnzxYB6YLh9REXfE55Eg3XSZKTx3VDMzs4kaC
   QEfLHbqN+gS5M4cFSlylj4cBgdwTA+obhpkWDKxBA+Wj+a5HbwfYrXLMt
   eEPMtxndMC/dBg0XMzuSj+t4EpkJj1d3lwZ/27Gmlx2pDRJcl8CQ1m9cn
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="241268903"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; 
   d="scan'208";a="241268903"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2022 00:13:49 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; 
   d="scan'208";a="641500699"
Received: from smile.fi.intel.com ([10.237.72.59])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2022 00:13:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nbdNH-00DBjy-VC;
        Tue, 05 Apr 2022 10:13:11 +0300
Date:   Tue, 5 Apr 2022 10:13:11 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Avi Fishman <avifishman70@gmail.com>
Cc:     Tali Perry <tali.perry1@gmail.com>,
        Tyrone Ting <warp5tw@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        yangyicong@hisilicon.com, semen.protsenko@linaro.org,
        Wolfram Sang <wsa@kernel.org>, jie.deng@intel.com,
        sven@svenpeter.dev, bence98@sch.bme.hu,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, olof@lixom.net,
        Tali Perry <tali.perry@nuvoton.com>,
        Avi Fishman <Avi.Fishman@nuvoton.com>,
        Tomer Maimon <tomer.maimon@nuvoton.com>, KWLIU@nuvoton.com,
        JJLIU0@nuvoton.com, kfting@nuvoton.com,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 09/11] i2c: npcm: Handle spurious interrupts
Message-ID: <YkvsB27Oj0kSmJRG@smile.fi.intel.com>
References: <20220303083141.8742-1-warp5tw@gmail.com>
 <20220303083141.8742-10-warp5tw@gmail.com>
 <YiCaSSbbszm3qYIQ@smile.fi.intel.com>
 <CAHb3i=sStqdSpLKtF_UGmTsOssR_swssTd3pv6c2-z_kiUPTTA@mail.gmail.com>
 <YiDNDsPWKyaIUlQR@smile.fi.intel.com>
 <CAKKbWA5FyCKTjEUw8rqtkoL7aw6f7Fa_QzcAkgaRnnUMTe0SKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKKbWA5FyCKTjEUw8rqtkoL7aw6f7Fa_QzcAkgaRnnUMTe0SKg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Apr 04, 2022 at 08:03:44PM +0300, Avi Fishman wrote:
> On Thu, Mar 3, 2022 at 4:14 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Mar 03, 2022 at 02:48:20PM +0200, Tali Perry wrote:
> > > > On Thu, Mar 3, 2022 at 12:37 PM Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Thu, Mar 03, 2022 at 04:31:39PM +0800, Tyrone Ting wrote:
> > > > > > From: Tali Perry <tali.perry1@gmail.com>
> > > > > >
> > > > > > In order to better handle spurious interrupts:
> > > > > > 1. Disable incoming interrupts in master only mode.
> > > > > > 2. Clear end of busy (EOB) after every interrupt.
> > > > > > 3. Return correct status during interrupt.
> > > > >
> > > > > This is bad commit message, it doesn't explain "why" you are doing these.
> >
> > ...
> >
> > > BMC users connect a huge tree of i2c devices and muxes.
> > > This tree suffers from spikes, noise and double clocks.
> > > All these may cause spurious interrupts to the BMC.

(1)

> > > If the driver gets an IRQ which was not expected and was not handled
> > > by the IRQ handler,
> > > there is nothing left to do but to clear the interrupt and move on.
> >
> > Yes, the problem is what "move on" means in your case.
> > If you get a spurious interrupts there are possibilities what's wrong:
> > 1) HW bug(s)
> > 2) FW bug(s)
> > 3) Missed IRQ mask in the driver
> > 4) Improper IRQ mask in the driver
> >
> > The below approach seems incorrect to me.
> 
> Andy, What about this explanation:
> On rare cases the i2c gets a spurious interrupt which means that we
> enter an interrupt but in
> the interrupt handler we don't find any status bit that points to the
> reason we got this interrupt.
> This may be a rare case of HW issue that is still under investigation.
> In order to overcome this we are doing the following:
> 1. Disable incoming interrupts in master mode only when slave mode is
> not enabled.
> 2. Clear end of busy (EOB) after every interrupt.
> 3. Clear other status bits (just in case since we found them cleared)
> 4. Return correct status during the interrupt that will finish the transaction.
> On next xmit transaction if the bus is still busy the master will
> issue a recovery process before issuing the new transaction.

This sounds better, thanks.

One thing to clarify, the (1) states that the HW "issue" is known and becomes a
PCB level one, i.e. noisy environment that has not been properly shielded.
So, if it is known, please put the reason in the commit message.

Also would be good to see numbers of "rare". Is it 0.1%?

> > > If the transaction failed, driver has a recovery function.
> > > After that, user may retry to send the message.
> > >
> > > Indeed the commit message doesn't explain all this.
> > > We will fix and add to the next patchset.
> > >
> > > > > > +     /*
> > > > > > +      * if irq is not one of the above, make sure EOB is disabled and all
> > > > > > +      * status bits are cleared.
> > > > >
> > > > > This does not explain why you hide the spurious interrupt.
> > > > >
> > > > > > +      */

-- 
With Best Regards,
Andy Shevchenko


