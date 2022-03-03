Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA9A34CBF9B
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Mar 2022 15:11:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231336AbiCCOMU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Mar 2022 09:12:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbiCCOMU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Mar 2022 09:12:20 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2D9418CC0E;
        Thu,  3 Mar 2022 06:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646316694; x=1677852694;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8UFSNQlM9WPEp6bci8a0Zs4QbDnKrGrES/unqzgEs3s=;
  b=n/zbmLUPPPtJlk4MARAEK26qvJEK+1svz2xrMZkY4Bmie5DnDsddizvF
   ArSTBAoUgGa8kVyclCEpAKLNk4XvloDP6RmGgB/zXh1Eszg8JGNPM7eM8
   T++iJLofwEOzYAaE8xYJF2lIPq7PgGWf7Mb8XBNGiOrLKAvRPtW1YyBAv
   /wrGSSZLrvdnAHwe87onlqunDZEAigvkxYIE+i5B8aWoqtV5hjJx5theY
   LVl3zhT7bmI6bUx8Y2Jtjs5ALEUng5pIrmFUvF9clbQmG0HohkXpmEIuQ
   bw4cZxwmnHSCYiqRETpcPWPMorc+ljYj3F1ZULfQYJNveEnlQUywgqITh
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="252509204"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="252509204"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 06:11:34 -0800
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="576497839"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 06:11:27 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nPmAC-00ApFi-B4;
        Thu, 03 Mar 2022 16:10:40 +0200
Date:   Thu, 3 Mar 2022 16:10:39 +0200
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
Subject: Re: [PATCH v3 11/11] i2c: npcm: Support NPCM845
Message-ID: <YiDMX7pUqs/rLJUU@smile.fi.intel.com>
References: <20220303083141.8742-1-warp5tw@gmail.com>
 <20220303083141.8742-12-warp5tw@gmail.com>
 <YiCb7LNY9tmMCZx7@smile.fi.intel.com>
 <CAHb3i=tWhtXK+c5GGbp6m23AHoyy=4woT_+n3a_N-6CqKUYb=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHb3i=tWhtXK+c5GGbp6m23AHoyy=4woT_+n3a_N-6CqKUYb=g@mail.gmail.com>
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

On Thu, Mar 03, 2022 at 02:35:58PM +0200, Tali Perry wrote:
> > On Thu, Mar 3, 2022 at 12:45 PM Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Mar 03, 2022 at 04:31:41PM +0800, Tyrone Ting wrote:

...

> > > > -     left_in_fifo = FIELD_GET(NPCM_I2CTXF_STS_TX_BYTES,
> > > > -                              ioread8(bus->reg + NPCM_I2CTXF_STS));
> > > > +     left_in_fifo = (bus->data->txf_sts_tx_bytes &
> > > > +                     ioread8(bus->reg + NPCM_I2CTXF_STS));
> > >
> > > Besides too many parentheses, this is an interesting change. So, in different
> > > versions of IP the field is on different bits? Perhaps it means that you need
> > > something like internal ops structure for all these, where you will have been
> > > using the statically defined masks?
> > >
> 
> Those are two very similar modules. The first generation had a 16 bytes HW FIFO
> and the second generation has 32 bytes.
> In V1 of this patchset the masks were defined under
> CONFIG but we were asked to change the approach:
> 
> the entire discussion can be found here:
> 
> https://www.spinics.net/lists/linux-i2c/msg55566.html
> 
> Did we understand the request change right?

Not really. If you have not simply "one (MSB) bit more" for FIFO size, then
I proposed to create a specific operations structure and use callbacks (see
drivers/dma/dw/ case for iDMA 32-bit vs. DesignWare).

But hold on and read set of questions below.

Previously it was a fixed field with the NPCM_I2CTXF_STS_TX_BYTES mask applied,
right? From above I have got that FIFO is growing twice. Is it correct?
Does the LSB stay at the same offset? What is the meaning of the MSB in 32 byte
case? If it's reserved then why not to always use 32 byte approach?

-- 
With Best Regards,
Andy Shevchenko


