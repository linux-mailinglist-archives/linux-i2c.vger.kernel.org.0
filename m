Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C1B64B76CF
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Feb 2022 21:49:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242370AbiBORPZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Feb 2022 12:15:25 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242362AbiBORPY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Feb 2022 12:15:24 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D63311ADEA;
        Tue, 15 Feb 2022 09:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644945312; x=1676481312;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0RT88KVIkpcIt49KegmwACI0CL9gcweN2MoVMiIbVRY=;
  b=Ao0Y02dPb3pRuLZzfaEZnYMMkBBsWLxSaPYsbMLL0D9MpkzLQ39YaH+1
   ZvXwnOefsgEeyS1M3HvdXVtf4F0I3vT4UGyVeek641LLxmM4IgGsBo2BC
   3hubo6iaqCXuvDQzNiGkSFkxmLnLqcVaJPDzYOyGkwSkjEv77MLq0/1Nw
   yURhrTO8z7y8SW0qtwpqkFkmDb5RFqJIFhfmCYzA28YXQDvbRJNS2LCa2
   mwKIk1PPxuykw/80CqsEg6r9ELwU6jRMgegiWmxdXSBWduFgFOHLUHDHm
   7tXHKockhkdhHTa/5UBJnuCb7141dH97E2dZxphT9wKef4MIaNlcXZqb2
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="274975411"
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; 
   d="scan'208";a="274975411"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 09:12:41 -0800
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; 
   d="scan'208";a="486258571"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 09:12:34 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nK1MY-0050PZ-TS;
        Tue, 15 Feb 2022 19:11:38 +0200
Date:   Tue, 15 Feb 2022 19:11:38 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Henning Schild <henning.schild@siemens.com>
Subject: Re: [PATCH v4 5/8] mfd: lpc_ich: Add support for pinctrl in non-ACPI
 system
Message-ID: <YgveyspHVXCp2ul+@smile.fi.intel.com>
References: <20220131151346.45792-1-andriy.shevchenko@linux.intel.com>
 <20220131151346.45792-6-andriy.shevchenko@linux.intel.com>
 <YgvaqBB8fNVWp1lN@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgvaqBB8fNVWp1lN@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 15, 2022 at 04:54:00PM +0000, Lee Jones wrote:
> On Mon, 31 Jan 2022, Andy Shevchenko wrote:

Thank you for the review, my answers below.

...

> > +static struct resource apl_gpio_resources[APL_GPIO_NR_DEVICES][2] = {
> > +	[APL_GPIO_NORTH] = {
> > +		DEFINE_RES_MEM(APL_GPIO_NORTH_OFFSET, 0x1000),
> 
> Are these 0x1000's being over-written in lpc_ich_init_pinctrl()?
> 
> If so, why pre-initialise?

You mean to pre-initialize the offsets, but leave the length to be added
in the function? It can be done, but it feels inconsistent, since we would
have offsets and lengths in different places for the same thingy. That said,
I prefer current way for the sake of consistency.

> > +		DEFINE_RES_IRQ(APL_GPIO_IRQ),
> > +	},

...

> > +/* The order must be in sync with apl_pinctrl_soc_data */
> 
> Why does the order matter if you've pre-enumerated them all?

Indeed. I will drop the confusing comment in the next version.

-- 
With Best Regards,
Andy Shevchenko


