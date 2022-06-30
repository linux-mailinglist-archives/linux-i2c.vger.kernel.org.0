Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 806C25616D5
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jun 2022 11:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233256AbiF3Jyx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Jun 2022 05:54:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230350AbiF3Jyw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Jun 2022 05:54:52 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0879422BFB;
        Thu, 30 Jun 2022 02:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656582892; x=1688118892;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CUOQrUSJ2KY+ndB6KEnXIUcaX5x6MvXMks/uk2GK8AU=;
  b=DaCjchU6du8CbV3wHRnixtieBgzwi8N8K1AjiPSQz3HB9HJ23/vD5CvG
   AM8tVEsI4maNcj28yVa4+gLEehHYP9hKvf5NhG1nmfpY4Z78i7ZPSEobz
   PhQcJgk/dWAHiL3tt+dKCqxiJi+N3WcqYDdruCZiKmLxdnA0MioqKi18v
   neyL02LN5F+ZRqqbghskb63UCky4EHoVle8FZhzysVZ6URbhvJ4M6a5fb
   cZfLxM5fslpwy+2gtOwcsGxCHRmldiIYL1U+7ggoSHYhAh1GLU0omodkB
   ovtzHptQGb6PPmGP5Mk5wIC5TUW7b5SqEXHgSquPRwaL9xWxnUZF0q4VX
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="368619353"
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; 
   d="scan'208";a="368619353"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2022 02:54:51 -0700
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; 
   d="scan'208";a="565797824"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2022 02:54:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1o6qsl-000yRh-Hv;
        Thu, 30 Jun 2022 12:54:43 +0300
Date:   Thu, 30 Jun 2022 12:54:43 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
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
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] i2c: Add Renesas RZ/V2M controller
Message-ID: <Yr1y4+tY3DUt9IZ1@smile.fi.intel.com>
References: <20220628194526.111501-1-phil.edworthy@renesas.com>
 <20220628194526.111501-3-phil.edworthy@renesas.com>
 <YrttwplV9zEgCFji@smile.fi.intel.com>
 <TYYPR01MB70862C7983958DE5B327308FF5BA9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYYPR01MB70862C7983958DE5B327308FF5BA9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
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

On Thu, Jun 30, 2022 at 09:41:37AM +0000, Phil Edworthy wrote:
> On 28 June 2022 22:08 Andy Shevchenko wrote:
> > On Tue, Jun 28, 2022 at 08:45:26PM +0100, Phil Edworthy wrote:

...

> > > +	if (ret == 0) {
> > 
> > This is a bit confusing if it's only comparison with "no error code"
> > condition. Use if (!ret) if there is no meaning of positive value.

> > Same applies to other cases in the code.

^^^

> > > +		if (read)
> > > +			ret = rzv2m_i2c_receive(priv, msg, &count);
> > > +		else
> > > +			ret = rzv2m_i2c_send(priv, msg, &count);
> > > +
> > > +		if ((ret == 0) && stop)
> > 
> > Like here.
> Sorry, I don't follow you. How is (ret == 0) any different to (!ret) ?

See above.

...

> > > +	adap->dev.of_node = dev->of_node;
> > 
> > device_set_node()
> Since we don't need to set dev->fwnode, why is device_set_node() any
> better?

We may go for I2C subsystem that supports only fwnode (as others already or
almost about to do). This will reduce a lot of unneeded churn in the future.

-- 
With Best Regards,
Andy Shevchenko


