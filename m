Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4598C75F7B6
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jul 2023 15:03:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbjGXNDS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jul 2023 09:03:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231534AbjGXNCg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jul 2023 09:02:36 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A4E91BC0;
        Mon, 24 Jul 2023 06:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690203651; x=1721739651;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6fB1Z0/bd8HsMhNx7MVsQVXEo8XfDkPowQqzqe/d3AI=;
  b=eSzkSWVh6rZdvM/fdcfpaIFFiVVhj8lsuMf1/tWMle4D7ncb2Pdax3SH
   NHaGizvN9+p08/nSn2KgSZV34GDOE32MmOZy3l4nqn7n/SZuRfBSdHNK8
   4zbC9KIgZjDJX9thtmF1DMOrqprFsjZbpws6hfgToVGeEA3TfXYwu25iL
   ujMBgq056KcnJqncV+YaWLdmuE6AHgzzoHrXBAMqx9Vi6UI9OhvJX4hlN
   mBF/s4KJ6eubBfqPQrxG937QOrJVXj19mMz7Sb203P6A7OOwy/m9Iysk5
   fzFXR16bUDiiUI2/3D5Y9EBYtd0sWj2mtPg5tqxZB1irkZoH0VO4c4rBh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="357431116"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="357431116"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 06:00:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="795774722"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="795774722"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 24 Jul 2023 06:00:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qNvB8-00DuKe-05;
        Mon, 24 Jul 2023 16:00:46 +0300
Date:   Mon, 24 Jul 2023 16:00:45 +0300
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
Message-ID: <ZL51/dXKyDkcoDVJ@smile.fi.intel.com>
References: <20230723083721.35384-1-biju.das.jz@bp.renesas.com>
 <20230723083721.35384-2-biju.das.jz@bp.renesas.com>
 <ZL5bH10uJWDe2SPY@smile.fi.intel.com>
 <OS0PR01MB592287A0B91E353663FE12A68602A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS0PR01MB592287A0B91E353663FE12A68602A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jul 24, 2023 at 12:02:27PM +0000, Biju Das wrote:
> > Subject: Re: [PATCH RFC 1/2] drivers: fwnode: Extend
> > device_get_match_data() to struct bus_type
> > On Sun, Jul 23, 2023 at 09:37:20AM +0100, Biju Das wrote:

...

> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > 
> > You can't just throw one's SoB tag without clear understanding what's
> > going on here (either wrong authorship or missing Co-developed-by
> > or...?).
> 
> Dmitry feels instead of having separate bus based match_data() like
> i2c_get_match_data[2] and spi_get_device_match_data[3], it is better to have
> a generic approach like a single API device_get_match_data() for getting
> match_data for OF/ACPI/I2C/SPI tables.
> 
> So, he came with a proposal and shared some code here[1].

Yes, I'm pretty much following the discussion.

> Since,I have send this patch, I put my signed -off.

I'm not talking about this. There is no evidence that Dmitry gives you
any approval to use or clear SoB tag. Again, you may not do like this.

> If this patch is accepted, then we can get rid of bus based match_data.

This is unrelated to what I talking about.

> [1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20230717131756.240645-2-biju.das.jz@bp.renesas.com/#25436207

-- 
With Best Regards,
Andy Shevchenko


