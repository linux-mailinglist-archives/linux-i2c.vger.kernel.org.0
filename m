Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 960B356B655
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Jul 2022 12:06:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237374AbiGHKGS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Jul 2022 06:06:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237242AbiGHKGR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Jul 2022 06:06:17 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C79E983F25;
        Fri,  8 Jul 2022 03:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657274776; x=1688810776;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=lbqQjKB+wMbVvhshNl7agCaUpV1RPa7FLoLbtHU0PKQ=;
  b=KTbvY+CqZlIxq8LWCyw9tgYlT8zYK45rEM91ppbZnZq4ADp5/Vt1HC8W
   zVBy4LWGlJ7TDIGAJnNnn33Tzv+UD+6fXo14n/sJp/mIwo//OU8FUc4fY
   KLf9MV+lZmikFUO0XA5w3ru92rn6lLx1KpRDWFfkKFDwhu1L2zWslRxWs
   AvuygH/FMuo9fgAI/Wc/Ct0HmhjfiddWQq5Nmtf6BpIxWid7E0mYWdLu8
   cZ4FZce2EAg8g9qKi7Ya6XW+kC38DbgJt3KygqV+EosrlAmkM15ereSzi
   tJvUqFaeFuuwn008GYmZR5zaL/NGs+XQfiIs5qrdIo2eUcY30/jz0/gpy
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="282999030"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; 
   d="scan'208";a="282999030"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 03:06:16 -0700
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; 
   d="scan'208";a="683618026"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 03:06:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1o9ksD-0017y9-0P;
        Fri, 08 Jul 2022 13:06:09 +0300
Date:   Fri, 8 Jul 2022 13:06:08 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Michael Walle <michael@walle.cc>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Till Harbaum <till@harbaum.org>
Subject: Re: [PATCH v2 2/2] i2c: Introduce i2c_str_read_write() and make use
 of it
Message-ID: <YsgBkDeq/KeQ15HU@smile.fi.intel.com>
References: <20220703154232.55549-1-andriy.shevchenko@linux.intel.com>
 <20220703154232.55549-2-andriy.shevchenko@linux.intel.com>
 <YsWI4nzQa9gmqKdw@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YsWI4nzQa9gmqKdw@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jul 06, 2022 at 03:06:42PM +0200, Wolfram Sang wrote:
> On Sun, Jul 03, 2022 at 06:42:32PM +0300, Andy Shevchenko wrote:
> > str_read_write() returns a string literal "read" or "write" based
> > on the value. It also allows to unify usage of a such in the kernel.
> > 
> > For i2c case introduce a wrapper that takes struct i2c_msg as parameter.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> To be honest, I don't think this series is very useful. Most of the
> converted strings here are debug printouts which could rather be removed
> because we have a tracepoint for i2c_transfer (which is the preferred
> unification). 

OK.

> The warnings printed on timeouts are plain wrong, because
> timeouts can happen and need to be handled by the client driver.

OK

> And the
> change in the I2C core is not worth the hazzle IMHO.

OK

Just noticed yet another (but not in the category of the above) debug message
[1]. Would it be acceptable to use patch 1 from this series and its use in (a
completely new) patch 2?

[1]: i2c-scmi.c:

	dev_dbg(&adap->dev, "access size: %d %s\n", size,
                (read_write) ? "READ" : "WRITE");

-- 
With Best Regards,
Andy Shevchenko


