Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C82B855DCA1
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jun 2022 15:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344593AbiF1KRx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jun 2022 06:17:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344822AbiF1KRa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Jun 2022 06:17:30 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECF5C2FFC7;
        Tue, 28 Jun 2022 03:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656411449; x=1687947449;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=da97cSpZGfX3JUwsbOhO0Vk5xN7SBSQ3IWBi6VYnl+8=;
  b=M5iF+B5byz5UnOlu4ENOtHdb6xY4LvjMZQ/4676/FAfoXoMx3rkfDN5S
   1x/SoJxkqUJS3tojpmd/IXLjbcSquHZiLDfq3f+OcDrdnsvCn0eeUuffR
   vjzlwvJioVt3UPnLKoaKJ5ehP5IeMC01gW39WJKUgHHp/ngE79HIT3u1I
   I1fbzH0DaW4Lz4XreqY+KwrLEN3iEh7TfGUxUnimdStCnlJikIvkgJLVp
   iNqjlTYVzAyRXghJJYLk+eWWOxwJzc5F9iU+z/1EFN63eSEBXrzG1C8fm
   ro38mzFKOTjo+l786wKmsO04YTQqR4fSkY1EDkjDPN/0GqnvGuT22xU5y
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="345697975"
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="345697975"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2022 03:17:29 -0700
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="693052346"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2022 03:17:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1o68HY-000wha-T8;
        Tue, 28 Jun 2022 13:17:20 +0300
Date:   Tue, 28 Jun 2022 13:17:20 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh@kernel.org>, Sven Peter <sven@svenpeter.dev>,
        Jie Deng <jie.deng@intel.com>, Jan Dabros <jsd@semihalf.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Olof Johansson <olof@lixom.net>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 2/2] i2c: Add Renesas RZ/V2M controller
Message-ID: <YrrVMAdZn9IyQA3b@smile.fi.intel.com>
References: <20220624101736.27217-1-phil.edworthy@renesas.com>
 <20220624101736.27217-3-phil.edworthy@renesas.com>
 <CAK8P3a085ZuyTXAWupo56wwfKdkM9EFnkPHXzxTxwTUUR5ee9Q@mail.gmail.com>
 <CAMuHMdWNvFARZgM1QX_t9aq1Kh84i2aCxcG5k9LqDM=wQu15pw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWNvFARZgM1QX_t9aq1Kh84i2aCxcG5k9LqDM=wQu15pw@mail.gmail.com>
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

On Fri, Jun 24, 2022 at 01:48:58PM +0200, Geert Uytterhoeven wrote:
> On Fri, Jun 24, 2022 at 1:27 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Fri, Jun 24, 2022 at 12:17 PM Phil Edworthy
> > <phil.edworthy@renesas.com> wrote:

...

> > Remove the #ifdef here, and use the new NOIRQ_SYSTEM_SLEEP_PM_OPS()
> > in place of SET_NOIRQ_SYSTEM_SLEEP_PM_OPS().
> 
> Cool, TIL!

There are also pm_ptr() and pm_sleep_ptr() macros (need to be used when assign
dev_pm_ops).

-- 
With Best Regards,
Andy Shevchenko


