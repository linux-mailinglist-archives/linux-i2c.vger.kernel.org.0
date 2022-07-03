Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E13856484F
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Jul 2022 17:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232240AbiGCPQx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 3 Jul 2022 11:16:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231145AbiGCPQw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 3 Jul 2022 11:16:52 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F05695F51;
        Sun,  3 Jul 2022 08:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656861411; x=1688397411;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tbDnTkzGU2d76A5O5FJ0xojYbhaXleGjZ0EcoMcriFs=;
  b=hd0T+BtbnMKUfy0kBpTN2cgveOPuHWdWt2dAuhH/RggJeQnK3u9RzcLG
   sw/qQ3B55tKV7ZO7qgytyDCw/0qyRRTgqZ6RRyMk9NaXeXWDVvC0j9QMJ
   c5O7Qw3TSS8a694ZbdrvR1iXiq7ooKraYs9F6zq+mz5ddkIGFFvo9iB0I
   8M+BWxz0y7YufJeCw5BzaJifRHomBqsGiYGUf/HWXP7kV6mee+FzGG45h
   tTaZRd+smcZ3bifXSxQvcyvTMFH+FVcpsDUiO/lN19Sh/zr2yPq4hZe1q
   5ND+2vMDB7PgQvmhAKQefGPV0ia4lEOgYZKkiYSDnCgqCeBRdT39fy2gD
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10397"; a="308489241"
X-IronPort-AV: E=Sophos;i="5.92,241,1650956400"; 
   d="scan'208";a="308489241"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2022 08:16:51 -0700
X-IronPort-AV: E=Sophos;i="5.92,241,1650956400"; 
   d="scan'208";a="592209448"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2022 08:16:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1o81L1-0014Pm-0T;
        Sun, 03 Jul 2022 18:16:43 +0300
Date:   Sun, 3 Jul 2022 18:16:42 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh@kernel.org>, Sven Peter <sven@svenpeter.dev>,
        Jan Dabros <jsd@semihalf.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] i2c: Add Renesas RZ/V2M controller
Message-ID: <YsGy2rqk1tKQJJ/b@smile.fi.intel.com>
References: <20220701163916.111435-1-phil.edworthy@renesas.com>
 <20220701163916.111435-3-phil.edworthy@renesas.com>
 <YsAxSrcAk4jtRYx4@smile.fi.intel.com>
 <CAMuHMdU1-LQJUCsDAfaC4OhRW7ijcpAG9VEUHu_Gu1qE7LdweA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU1-LQJUCsDAfaC4OhRW7ijcpAG9VEUHu_Gu1qE7LdweA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Jul 03, 2022 at 10:41:45AM +0200, Geert Uytterhoeven wrote:
> On Sat, Jul 2, 2022 at 1:51 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Fri, Jul 01, 2022 at 05:39:16PM +0100, Phil Edworthy wrote:
> > > Yet another i2c controller from Renesas that is found on the RZ/V2M
> > > (r9a09g011) SoC. It can support only 100kHz and 400KHz operation.

...

> > > +     pm_runtime_get_sync(dev);
> 
> pm_runtime_resume_and_get() ;-)

This makes sense only if we test for error. Otherwise the put might imbalance
counter.

...

> > Isn't guaranteed by the runtime PM that device is runtime powered on the system
> > suspend?
> 
> No, as this is a system sleep callback.

Hmm... Indeed. Code also suggested what you told. Thanks!

-- 
With Best Regards,
Andy Shevchenko


