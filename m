Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E50B4CF827
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Mar 2022 10:52:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234920AbiCGJwA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Mar 2022 04:52:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240505AbiCGJvE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Mar 2022 04:51:04 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 767787562C;
        Mon,  7 Mar 2022 01:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646646286; x=1678182286;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iYmh9KvmrAN/9n49jwIZ1qbV8GdSrmGWQVFa5C6rxI4=;
  b=amwK989APox6E/AfbAd0YUDGIOOPLjF8xKh4zmJgdz1NOS3F+trbAizf
   M0Xi1Gb7xwz12Dn2u9lJV8G5sV3n2eUM6ywdPtzhWow5toqbUoy7ZlG92
   09dFqh2wCNUwBxjGuYf6nhq2phKDYdmTeHBLawX75UdJXjZFk+vfC4idi
   ErGGN/AvNy6HNsPEmBGoRXDMZhNeiYa1fzjoZbanCbW50M1C0+1pSK+Gm
   Rl/HXN/shXUN9xCl0j5AP1z0m7xxsj4OL1CDYmPSBUn6d6tSVz5oyOBZl
   8NimXjo2+Hzc7OFCn9LqU37eOz8migoBOb8fRxF+MTIV1XxKfhkZToeou
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="254541218"
X-IronPort-AV: E=Sophos;i="5.90,161,1643702400"; 
   d="scan'208";a="254541218"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2022 01:44:40 -0800
X-IronPort-AV: E=Sophos;i="5.90,161,1643702400"; 
   d="scan'208";a="495003939"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2022 01:44:34 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nR9u8-00Ch1M-IP;
        Mon, 07 Mar 2022 11:43:48 +0200
Date:   Mon, 7 Mar 2022 11:43:48 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tomer Maimon <tmaimon77@gmail.com>
Cc:     Tali Perry <tali.perry1@gmail.com>,
        Tyrone Ting <warp5tw@gmail.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        yangyicong@hisilicon.com, semen.protsenko@linaro.org,
        Wolfram Sang <wsa@kernel.org>, jie.deng@intel.com,
        sven@svenpeter.dev, bence98@sch.bme.hu, lukas.bulwahn@gmail.com,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Tali Perry <tali.perry@nuvoton.com>,
        Avi Fishman <Avi.Fishman@nuvoton.com>,
        Tomer Maimon <tomer.maimon@nuvoton.com>, KWLIU@nuvoton.com,
        JJLIU0@nuvoton.com, kfting@nuvoton.com,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 11/11] i2c: npcm: Support NPCM845
Message-ID: <YiXT1JX5A7Ez7C6G@smile.fi.intel.com>
References: <20220303083141.8742-1-warp5tw@gmail.com>
 <20220303083141.8742-12-warp5tw@gmail.com>
 <YiCb7LNY9tmMCZx7@smile.fi.intel.com>
 <CAHb3i=tWhtXK+c5GGbp6m23AHoyy=4woT_+n3a_N-6CqKUYb=g@mail.gmail.com>
 <YiDMX7pUqs/rLJUU@smile.fi.intel.com>
 <CAP6Zq1iy0yNMemqDjrLu1F0rrRSDFhZ+SqdoOa9FyJDNL0ENXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP6Zq1iy0yNMemqDjrLu1F0rrRSDFhZ+SqdoOa9FyJDNL0ENXA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Mar 06, 2022 at 03:33:20PM +0200, Tomer Maimon wrote:
> On Thu, 3 Mar 2022 at 16:11, Andy Shevchenko <
> andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Mar 03, 2022 at 02:35:58PM +0200, Tali Perry wrote:
> > > > On Thu, Mar 3, 2022 at 12:45 PM Andy Shevchenko <
> > andriy.shevchenko@linux.intel.com> wrote:

...

> > But hold on and read set of questions below.
> >
> > Previously it was a fixed field with the NPCM_I2CTXF_STS_TX_BYTES mask
> > applied,
> > right? From above I have got that FIFO is growing twice. Is it correct?
> 
> What do you mean by growing twice? TX and RX?

I meant from 16 bytes to 32 bytes.

> > Does the LSB stay at the same offset? What is the meaning of the MSB in 32
> > byte
> > case? If it's reserved then why not to always use 32 byte approach?
> 
> Yes, the LSB stays in the same place, and bit 5 is reserved in the NPCM7XX
> SoC.
> Unfortunately, the I2C test failed when we tried to use the 32 bytes
> approach at NPCM7XX Soc, this is why we added NPCM_I2CTXF_STS_TX_BYTES and
> NPCM_I2C_STSRXF_RX_BYTES to the data structure.
> 
> The device tree data structure pass data for each specific device, so I
> don't understand why not use device tree data for supporting the I2C
> specific device? this is not the case here?

Basically we use compatible strings for that, but in any case if something
can be autodetected from hardware, it's better to use autodetection.


-- 
With Best Regards,
Andy Shevchenko


