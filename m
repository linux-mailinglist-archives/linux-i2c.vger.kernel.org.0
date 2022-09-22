Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 685E15E5ED3
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Sep 2022 11:44:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230461AbiIVJoV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Sep 2022 05:44:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbiIVJoV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Sep 2022 05:44:21 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E41BDD4A9C;
        Thu, 22 Sep 2022 02:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663839859; x=1695375859;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zGNnp1SHc0bPd8aNRkbUAnaA+Tc26kl+IYTmTGgGBeA=;
  b=kcdJsDiLStrd1eoU56E3C+1XQqg1LdjAdH5KBFpj/Ifxj4Bt4axjMSO+
   7+MLDiZbqH+6PgkvDN+NQulhXM1lWVSX4kKuf13zCy0UYgqucMS8Dzsg7
   bAx4DwCzLAi3vVCjaDtHsCZsawD868vczoiDxRHbzl6S4YKNB76Vzz3wv
   /ifuT/St7IbgFqhjsZ08fvvKcpqff8DW71IT//0qEyaCqYdu2VO5WGdvN
   M6P1kd9q/ZWEpgA1i8PKPdeF/f84x8D6zbduplGMfpSscVBx1oElT5pUk
   h7t7kXV8VOwBZM4kmMgnuku+dGRnrSro8R3R+/WsT2jSdcWMaQ0I6XKh9
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="280622755"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="280622755"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 02:44:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="652900936"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 22 Sep 2022 02:44:15 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1obIke-005wpi-2D;
        Thu, 22 Sep 2022 12:44:12 +0300
Date:   Thu, 22 Sep 2022 12:44:12 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Raul Rangel <rrangel@chromium.org>
Cc:     Linux ACPI <linux-acpi@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Tim Van Patten <timvp@google.com>,
        Hans de Goede <hdegoede@redhat.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
        "jingle.wu" <jingle.wu@emc.com.tw>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 07/13] i2c: acpi: Use ACPI wake capability bit to set
 wake_irq
Message-ID: <YywubKejj+4uZHl8@smile.fi.intel.com>
References: <20220919155916.1044219-1-rrangel@chromium.org>
 <20220919095504.v4.7.I8af4282adc72eb9f247adcd03676a43893a020a6@changeid>
 <Yymyzcfp7gqdTYam@smile.fi.intel.com>
 <CAHQZ30C3Wsqbwnpn+9tP2DCDdtMGOqOZ8di77agDcLM7idWxuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHQZ30C3Wsqbwnpn+9tP2DCDdtMGOqOZ8di77agDcLM7idWxuQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 21, 2022 at 09:18:34AM -0600, Raul Rangel wrote:
> On Tue, Sep 20, 2022 at 6:32 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Sep 19, 2022 at 09:59:09AM -0600, Raul E Rangel wrote:

...

> > > +     if (irq_ctx.irq == -ENOENT)
> > > +             irq_ctx.irq = acpi_dev_gpio_irq_wake_get(adev, 0, &irq_ctx.wake_capable);
> >
> > I just realized, that there is an inconsistency on how we fill the wake_capable
> > parameter. In some cases we check for IRQ for an error condition (IRQ not found)
> > and in some the wake_capable still be filled.
> >
> > Here the best approach I believe is to add
> >
> >         if (irq_ctx.irq < 0)
> >                 return irq_ctx.irq;
> >
> > I.o.w. we apply the rule "do not fill the output parameters when it's known
> > to be an error condition".
> >
> > > +     if (wake_capable)
> > > +             *wake_capable = irq_ctx.wake_capable;
> >
> > > +     return irq_ctx.irq;
> >
> 
> I applied the following:
> diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
> index ba64e505183595..1618f5619d5ed9 100644
> --- a/drivers/i2c/i2c-core-acpi.c
> +++ b/drivers/i2c/i2c-core-acpi.c
> @@ -220,7 +220,7 @@ int i2c_acpi_get_irq(struct i2c_client *client,
> bool *wake_capable)
>         if (irq_ctx.irq == -ENOENT)
>                 irq_ctx.irq = acpi_dev_gpio_irq_wake_get(adev, 0,
> &irq_ctx.wake_capable);
> 
> -       if (wake_capable)
> +       if (irq_ctx.irq > 0 && wake_capable)
>                 *wake_capable = irq_ctx.wake_capable;
> 
>         return irq_ctx.irq;

While it's working solution it is not so flexible since basically any addition
of a new code will require if (irq > 0), that's why I'm in favour of my
proposal rather than yours approach.


-- 
With Best Regards,
Andy Shevchenko


