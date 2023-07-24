Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A82BE75F8F0
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jul 2023 15:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231251AbjGXNxk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jul 2023 09:53:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232076AbjGXNxZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jul 2023 09:53:25 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A10104C24;
        Mon, 24 Jul 2023 06:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690206655; x=1721742655;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7n/QkvSk3dkk01I6xtQBDZXyK+JGZB1UntpO5/EXJkk=;
  b=BuuFTVKhW7ZWOp8U4edkeof3QFndFAyzzkSk3P6f/GTlwB2pv0vGybF2
   5tbXeyRntjhYRoHaP8+Q/drY9gP/Bvj8sYHNEholIzLzIyjJtTI6HyepZ
   Mcu447ySsw+hi3rgUEjG1sYcWqLvu5r1jzp3OoxCR3lxbWcTtJql28fWt
   8+CpLhzjmGGPLURgXYgAncdvLSJpVnLxxXWA4OxRHDiErGg5BDl8hQT53
   TGpACJvszQUfdNJ7Akwq+pOvAy601/9P7YuSd0xKC3jBv9heIwEIlUHw5
   wJvmZeZsBY4faG2meimi4nOaIW2zn21PTGOjmU6k6UAY91JJIRxFtJekl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="366336598"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="366336598"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 06:50:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="675827551"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="675827551"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 24 Jul 2023 06:50:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qNvxQ-00Fe1G-24;
        Mon, 24 Jul 2023 16:50:40 +0300
Date:   Mon, 24 Jul 2023 16:50:40 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH RFC 1/2] drivers: fwnode: Extend device_get_match_data()
 to struct bus_type
Message-ID: <ZL6BsM0NGhn2mc+6@smile.fi.intel.com>
References: <20230723083721.35384-1-biju.das.jz@bp.renesas.com>
 <20230723083721.35384-2-biju.das.jz@bp.renesas.com>
 <ZL5bH10uJWDe2SPY@smile.fi.intel.com>
 <OS0PR01MB592287A0B91E353663FE12A68602A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZL51/dXKyDkcoDVJ@smile.fi.intel.com>
 <OS0PR01MB592289F163F05A61DFD019DF8602A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS0PR01MB592289F163F05A61DFD019DF8602A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
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

On Mon, Jul 24, 2023 at 01:19:02PM +0000, Biju Das wrote:
> > Subject: Re: [PATCH RFC 1/2] drivers: fwnode: Extend
> > device_get_match_data() to struct bus_type
> > On Mon, Jul 24, 2023 at 12:02:27PM +0000, Biju Das wrote:
> > > > Subject: Re: [PATCH RFC 1/2] drivers: fwnode: Extend
> > > > device_get_match_data() to struct bus_type On Sun, Jul 23, 2023 at
> > > > 09:37:20AM +0100, Biju Das wrote:

...

> > > > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > >
> > > > You can't just throw one's SoB tag without clear understanding
> > > > what's going on here (either wrong authorship or missing
> > > > Co-developed-by or...?).
> > >
> > > Dmitry feels instead of having separate bus based match_data() like
> > > i2c_get_match_data[2] and spi_get_device_match_data[3], it is better
> > > to have a generic approach like a single API device_get_match_data()
> > > for getting match_data for OF/ACPI/I2C/SPI tables.
> > >
> > > So, he came with a proposal and shared some code here[1].
> > 
> > Yes, I'm pretty much following the discussion.
> > 
> > > Since,I have send this patch, I put my signed -off.
> > 
> > I'm not talking about this. There is no evidence that Dmitry gives you
> > any approval to use or clear SoB tag. Again, you may not do like this.
> 
> Here Dmitry is acknowledging, he is ok with the patch I posted.
> 
> https://patchwork.kernel.org/project/linux-renesas-soc/patch/20230717131756.240645-2-biju.das.jz@bp.renesas.com/#25437032

No, you just misinterpreted his message.

See https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin
for the explanation. The SoB has to be explicitly given. Dmitry had _not_
put it like this.

-- 
With Best Regards,
Andy Shevchenko


