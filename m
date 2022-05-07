Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4C2D51E677
	for <lists+linux-i2c@lfdr.de>; Sat,  7 May 2022 12:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358904AbiEGKhQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 7 May 2022 06:37:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236372AbiEGKhP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 7 May 2022 06:37:15 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96C992D1ED;
        Sat,  7 May 2022 03:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651919609; x=1683455609;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tz4eaxNFw3OE/vYEfmWYD9ee4vGmGUyLKAFHoXsKn8Q=;
  b=kgDPj8hGIsQ2S/dIq0sRi9iT4oiK18Z0EJR68cKN19CnmC2SyL5eoBFx
   6K3q6O7VF845lDASmDO5Ue3HyFcunueF9PYPdUkNyLyLdAs6V1jgbnvjB
   sZG2QxPp85lKrTZCeFjFvT55NJvSh+c+xB+JVkGmpcMATlVF+Lc9G+uVm
   4Uu4DCKdCFXBiwUerjhIe0WcAtewvEKFrMCiU4aWiyUEiO7hxSyKvKzj5
   PEqS9ZVyelpM8B+tBXKFMAvfZfSEm/Nsne2gt8jBxVllSoY4am+PzZ89n
   2U9iATPW+tTqbrwqYHsaOrN244sa8ORH+ABixS90BTXmbWlo0St3P79hQ
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="268589634"
X-IronPort-AV: E=Sophos;i="5.91,207,1647327600"; 
   d="scan'208";a="268589634"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2022 03:33:29 -0700
X-IronPort-AV: E=Sophos;i="5.91,207,1647327600"; 
   d="scan'208";a="550239830"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2022 03:33:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nnHkV-00D3B8-LA;
        Sat, 07 May 2022 13:33:19 +0300
Date:   Sat, 7 May 2022 13:33:19 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Henning Schild <henning.schild@siemens.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-edac@vger.kernel.org, linux-i2c <linux-i2c@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>
Subject: Re: [PATCH v4 0/8] platform/x86: introduce p2sb_bar() helper
Message-ID: <YnZK75D3fMvLSgAD@smile.fi.intel.com>
References: <20220131151346.45792-1-andriy.shevchenko@linux.intel.com>
 <20220308205016.2c0112ad@md1za8fc.ad001.siemens.net>
 <YnJ0tdGTzTRYEISn@smile.fi.intel.com>
 <20220504171007.2f641098@md1za8fc.ad001.siemens.net>
 <CAHp75Vfh5DbiGQ4NLv+hhYyRx5wDbMjFmgO5sNZ7864ipRrDHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vfh5DbiGQ4NLv+hhYyRx5wDbMjFmgO5sNZ7864ipRrDHg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 04, 2022 at 05:55:26PM +0200, Andy Shevchenko wrote:
> On Wed, May 4, 2022 at 5:10 PM Henning Schild
> <henning.schild@siemens.com> wrote:
> > Am Wed, 4 May 2022 15:42:29 +0300
> > schrieb Andy Shevchenko <andriy.shevchenko@linux.intel.com>:

> ...

> > Let me know if you need it in another shape or form.
> 
> Form is okay, just would be nice if you can retest what I have in the
> branch as an updated version.

Is there any news? I would like to send a new version sooner than later.
We may also apply the patches from this series and when you will be ready
apply yours.

-- 
With Best Regards,
Andy Shevchenko


