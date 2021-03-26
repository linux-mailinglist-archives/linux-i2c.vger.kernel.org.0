Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4861E34A722
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Mar 2021 13:29:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbhCZM2a (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Mar 2021 08:28:30 -0400
Received: from mga05.intel.com ([192.55.52.43]:49167 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229794AbhCZM2I (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 26 Mar 2021 08:28:08 -0400
IronPort-SDR: 6n9a/SYibYIIK9vWNu43kNPPIwkh6ZtsD4Yu6qffdh/yPJ4cRjA+WLAlFzhNvjn73wpV87Bd+x
 pzCu0Uxz0K1g==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="276277920"
X-IronPort-AV: E=Sophos;i="5.81,280,1610438400"; 
   d="scan'208";a="276277920"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2021 05:28:07 -0700
IronPort-SDR: gZvRIMX2zE0NlnCe5Q+/ojNZsssjV9b4Ea8lq/R3SeJO3MghC4vYrh3IS5tM6qdLetuRE7c3zv
 rGNfp/yAExoA==
X-IronPort-AV: E=Sophos;i="5.81,280,1610438400"; 
   d="scan'208";a="453496980"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2021 05:28:05 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lPlZK-00GONp-Um; Fri, 26 Mar 2021 14:28:02 +0200
Date:   Fri, 26 Mar 2021 14:28:02 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Gomez <daniel@qtec.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: designware: Add base addr info
Message-ID: <YF3TUhGEjrQyG5UU@smile.fi.intel.com>
References: <20210325151248.1066643-1-daniel@qtec.com>
 <YFyvh3sqyVcg8Iqj@smile.fi.intel.com>
 <CAH1Ww+Qs13GBC02PCgW60No2Z+vNsV14yRe7S4rtnnMLqH7BYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH1Ww+Qs13GBC02PCgW60No2Z+vNsV14yRe7S4rtnnMLqH7BYQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 26, 2021 at 11:35:08AM +0100, Daniel Gomez wrote:
> On Thu, 25 Mar 2021 at 16:43, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Mar 25, 2021 at 04:12:48PM +0100, Daniel Gomez wrote:

...

> > > Add i2c hw base address in the adapter name and when the device is
> > > probed.
> >
> > Why?
> > We have /proc/iomem for that.
> The initial reason was because I wasn't aware of /proc/iomem therefore
> I didn't have a way to match the physical address to the i2c adapter.
> So, thanks for pointing that out as now I'm able to match the physical
> address listed in iomem with the sysfs i2c bus.

You are welcome!

...

> > >       snprintf(adap->name, sizeof(adap->name),
> > > -              "Synopsys DesignWare I2C adapter");
> > > +              "Synopsys DesignWare I2C adapter at 0x%llx", dev->base_addr);
> >
> > It actually should be resource_size_t and corresponding specifier, i.e. %pa to
> > print it. Moreover, we have %pR (and %pr) specifiers for struct resource.
> I understand this but I had some doubts when I declared the variable.
> I took this as reference:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/i2c/busses/i2c-tegra.c?h=v5.12-rc4#n268
> Should it be then defined as resource_size_t instead?

It's a good question. On one hand we know that resource_size_t is a simple
redefinition of phys_addr_t, but it might be changed in the future. OTOH,
struct resource has types of resource_size_t. In any case it's a type that is
platform dependent (like long, size_t). Hence, the special specifier is needed.

> Out of the i2c subsystem, I also found several examples. For example this:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/iio/adc/at91-sama5d2_adc.c?h=v5.12-rc4#n364
> But I understand this could be out of the scope.

Not all examples in the kernel are good examples (many of them is a cargo-cult
and / or outdated). Take them with grain of salt.

But common rule is to check the log of the interesting subsystem (`git log --
drivers/<subsystem>/`) in order to find the most recent drivers or modules
added. There you very likely will find more or less modern standards and APIs
you might reuse in your code.

> Some others, even assign the the start to the dma_addr_t which could
> vary depending on CONFIG_ARCH_DMA_ADDR_T_64BIT
> but it seems equivalent to the phys_addr_t definition.

There is a document that describes all possible extensions we have for %p. You
might be curious to read more there.

...

> > > +     dev_info(&pdev->dev, "%s\n", adap->name);
> >
> > Unneeded noise.
> Also this might be out of the scope again but I added because in tty
> they were printing that information:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/tty/serial/serial_core.c?h=v5.12-rc4#n2336

TTY is different. TTY often related to a console and it's very important to
know some information as soon as possible (don't forget also hardware
debuggers, e.g. Lauterbach, which able to show kernel message ring buffer).
As you may know console is the first common target during new platform
bring-up.

-- 
With Best Regards,
Andy Shevchenko


