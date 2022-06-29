Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3B856057F
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jun 2022 18:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232039AbiF2QLp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jun 2022 12:11:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230041AbiF2QLo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jun 2022 12:11:44 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10F712ED4D;
        Wed, 29 Jun 2022 09:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656519104; x=1688055104;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NQbWcvlGutcXltKa5inoCTaI4pjuNgEFEtet0f4vBcY=;
  b=noq3J6LMfouMnU1NFVfWldXH1RLg8iENihk5MdSYHMAJ6k5Fz+svhKg5
   Ccp2gQz7WZec7dypkGANnYh0Xs9AVhJS9KClR9s0fkK6Wh7+Vj3ol4Olk
   HY7jj6z6eVlT1vHUfcu/lpKYW2gq2mclMC3bd2+FDOE53OZ288MchxKmq
   WBoeSXPiLzWYH8JXkZRBh9ziYxZBn2kkg0/aK07xxb18aRRIGr7jORzNd
   LgdBeMxqWfEIOCWTbA5RzIwHuIazGLhvAMAOfHEElo+2Mrr7x/iOUXkb8
   hm+qMxLsBxF4s91qiUw75J2hIysAZzExajceBV2VCa0Cnh2ePidPKwxTI
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="283166415"
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; 
   d="scan'208";a="283166415"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2022 09:10:35 -0700
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; 
   d="scan'208";a="565492968"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2022 09:10:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1o6aGo-000xsh-7j;
        Wed, 29 Jun 2022 19:10:26 +0300
Date:   Wed, 29 Jun 2022 19:10:25 +0300
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
Subject: Re: [PATCH v2 2/2] i2c: Add Renesas RZ/V2M controller
Message-ID: <Yrx5cQw8hiR46W1d@smile.fi.intel.com>
References: <20220628194526.111501-1-phil.edworthy@renesas.com>
 <20220628194526.111501-3-phil.edworthy@renesas.com>
 <YrttwplV9zEgCFji@smile.fi.intel.com>
 <CAMuHMdV1xkCvico_f359xBzkwU5pG3VVJV7O3dHRyy5a9QvyGw@mail.gmail.com>
 <Yrws5eTtdDZ2szhX@smile.fi.intel.com>
 <CAMuHMdUTux2TFMAZL0yV8xJVN4K+gHJpKHJjuOOFXJ+9VCCfQA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUTux2TFMAZL0yV8xJVN4K+gHJpKHJjuOOFXJ+9VCCfQA@mail.gmail.com>
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

On Wed, Jun 29, 2022 at 05:58:39PM +0200, Geert Uytterhoeven wrote:
> On Wed, Jun 29, 2022 at 12:46 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Wed, Jun 29, 2022 at 08:52:27AM +0200, Geert Uytterhoeven wrote:
> > > On Tue, Jun 28, 2022 at 11:08 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Tue, Jun 28, 2022 at 08:45:26PM +0100, Phil Edworthy wrote:

...

> > > > > +static int rzv2m_i2c_send(struct rzv2m_i2c_priv *priv, struct i2c_msg *msg,
> > > > > +                       unsigned int *count)
> > > > > +{
> > > > > +     unsigned int i;
> > > > > +     int ret = 0;
> > > >
> > > > Redundant assignment, you may return 0 directly.

^^^

> > > Can you prove msg->len is never zero, and the loop below is always
> > > executed at least once?
> >
> > I don't see how this is related. The ret is used only in the loop body,
> >
> >         return 0;
> >
> > outside will suffice. No?
> 
> Right, with the "return ret" in the end replaced.

Exactly what I meant above with "you may return 0 directly".

> > > The driver does set I2C_AQ_NO_ZERO_LEN, but I don't think the static
> > > checkers know ;-)
> > >
> > > > > +     for (i = 0; i < msg->len; i++) {
> > > > > +             ret = rzv2m_i2c_write_with_ack(priv, msg->buf[i]);
> > > > > +             if (ret < 0)
> > > > > +                     return ret;
> > > > > +     }
> > > > > +     *count = i;
> > > > > +
> > > > > +     return ret;
> > > > > +}

-- 
With Best Regards,
Andy Shevchenko


