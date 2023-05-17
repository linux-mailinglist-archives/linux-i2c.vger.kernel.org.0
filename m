Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D50F70653A
	for <lists+linux-i2c@lfdr.de>; Wed, 17 May 2023 12:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbjEQK3K (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 May 2023 06:29:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230308AbjEQK3K (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 17 May 2023 06:29:10 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDAD93A80;
        Wed, 17 May 2023 03:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684319349; x=1715855349;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s+Q9MD8MUeL3jqq4EHyk0PRGS6hQxwGEoNlmystB14k=;
  b=HZf5EORYCAd4Gpzxje6G6gu/k/6yyRtNN7rr4QggBvQGGStWsxtRp1Sn
   /FOqL+v5G4Ucp4A1Yd4VMUakEe5EnNICp96PQcTqoFAFx+Z2W1FxdRXIF
   VKkNgbpQvgPvC0QOYbcuBDhymO0JFz/Y1qa6+2s9ilWPCh4RtXO4JXGgd
   AsMFPSFrK8zSJoMFNlqTWN/YqoPVMMBu1TtDl969b1ryQkkO7w3PkGlsS
   K8UkVTTSEVQxft6x8FWgMnRCdt2jUqoDouPPOgfdIryQimGsGPHWEL6Jc
   gM+GtAgEJP0//havY0ZZZxxtEJ2dVhLt/12JuDo/jTi0dVtpstdPBvW6x
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="438066579"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; 
   d="scan'208";a="438066579"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 03:29:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="876013032"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; 
   d="scan'208";a="876013032"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 17 May 2023 03:29:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pzEP0-0008HZ-1H;
        Wed, 17 May 2023 13:29:02 +0300
Date:   Wed, 17 May 2023 13:29:02 +0300
From:   'Andy Shevchenko' <andriy.shevchenko@linux.intel.com>
To:     Jiawen Wu <jiawenwu@trustnetic.com>
Cc:     netdev@vger.kernel.org, jarkko.nikula@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com,
        Jose.Abreu@synopsys.com, andrew@lunn.ch, hkallweit1@gmail.com,
        linux@armlinux.org.uk, linux-i2c@vger.kernel.org,
        linux-gpio@vger.kernel.org, mengyuanlou@net-swift.com
Subject: Re: [PATCH net-next v8 6/9] net: txgbe: Support GPIO to SFP socket
Message-ID: <ZGSsbr7oPZAZ4U7V@smile.fi.intel.com>
References: <20230515063200.301026-1-jiawenwu@trustnetic.com>
 <20230515063200.301026-7-jiawenwu@trustnetic.com>
 <ZGKlzFXfqCuq3s8u@smile.fi.intel.com>
 <00c601d9879a$ea72dd90$bf5898b0$@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00c601d9879a$ea72dd90$bf5898b0$@trustnetic.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 16, 2023 at 10:05:41AM +0800, Jiawen Wu wrote:
> On Tuesday, May 16, 2023 5:36 AM, Andy Shevchenko wrote:
> > On Mon, May 15, 2023 at 02:31:57PM +0800, Jiawen Wu wrote:
> > > Register GPIO chip and handle GPIO IRQ for SFP socket.

...

> > > +	spin_lock_init(&wx->gpio_lock);
> > 
> > Almost forgot to ask, are you planning to use this GPIO part on PREEMPT_RT
> > kernels? Currently you will get a splat in case IRQ is fired.
> 
> Hmmm, I don't know much about this. Should I use raw_spinlock_t instead of
> spinlock_t?

If you need support PREEMPT_RT.

-- 
With Best Regards,
Andy Shevchenko


