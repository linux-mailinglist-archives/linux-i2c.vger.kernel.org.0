Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05C035B7A16
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Sep 2022 20:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232663AbiIMSvm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Sep 2022 14:51:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232831AbiIMSvJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Sep 2022 14:51:09 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E051DD8A;
        Tue, 13 Sep 2022 11:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663094027; x=1694630027;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JVKZG435pOwcUrq1+tBn1ilFxNa1SQQFcGDEMC3wZsw=;
  b=BCBmlsGgMD3drH8ZqIPCLldUHXA3ZkFI/meCiyCpBCvW9CHpqgQxdvTQ
   uc48D1ybs1sai5u13xKqUfyU3IaXZPYIcNRCocQXCPQySAQszDzwoBKlS
   CkhZ4+NTu4n5CIj21Wear2o96tCcTXENBWAgK2UcTYcJbgggoTTGYSVV0
   /xLmg33iLbd/dUj9s54XdSFoRg8qbL+rv5MTocp5nU6jYVHrnAhDxAuOE
   CAaNMWUOGrn8ztG1WnQjxCDA7L9nvYplbjxLinxN1TEqVKmjTszl5Xzkc
   Yz8qjnV4SKzGwlMNc5jWH0yiHeu9aBrAuCPvmh/93fOPamHdqIoghchMp
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="359941593"
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; 
   d="scan'208";a="359941593"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2022 11:33:46 -0700
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; 
   d="scan'208";a="567691746"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2022 11:33:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oYAj5-001t8J-2l;
        Tue, 13 Sep 2022 21:33:39 +0300
Date:   Tue, 13 Sep 2022 21:33:39 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Raul Rangel <rrangel@chromium.org>
Cc:     Linux ACPI <linux-acpi@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        "jingle.wu" <jingle.wu@emc.com.tw>,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
        Tim Van Patten <timvp@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 07/13] i2c: acpi: Use ACPI wake capability bit to set
 wake_irq
Message-ID: <YyDNAw+ur177ayY0@smile.fi.intel.com>
References: <20220912221317.2775651-1-rrangel@chromium.org>
 <20220912160931.v2.7.I8af4282adc72eb9f247adcd03676a43893a020a6@changeid>
 <YyC9N62JaMGaeanf@smile.fi.intel.com>
 <CAHQZ30DAr_BwH03=bG9tfCSGW+-he-c-4PPeJMOqH28cVcKDoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHQZ30DAr_BwH03=bG9tfCSGW+-he-c-4PPeJMOqH28cVcKDoA@mail.gmail.com>
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

On Tue, Sep 13, 2022 at 12:07:53PM -0600, Raul Rangel wrote:
> On Tue, Sep 13, 2022 at 11:26 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Mon, Sep 12, 2022 at 04:13:11PM -0600, Raul E Rangel wrote:
> > > Device tree already has a mechanism to pass the wake_irq. It does this
> > > by looking for the wakeup-source property and setting the
> > > I2C_CLIENT_WAKE flag. This CL adds the ACPI equivalent. It uses the
> > > ACPI interrupt wake flag to determine if the interrupt can be used to
> > > wake the system. Previously the i2c drivers had to make assumptions and
> > > blindly enable the wake IRQ. This can cause spurious wake events. e.g.,
> > > If there is a device with an Active Low interrupt and the device gets
> > > powered off while suspending, the interrupt line will go low since it's
> > > no longer powered and wakes the system. For this reason we should
> > > respect the board designers wishes and honor the wake bit defined on the
> > > interrupt.
> 
> >
> > > +                     if (irq > 0 && acpi_wake_capable)
> > > +                             client->flags |= I2C_CLIENT_WAKE;
> >
> > Why do we need a parameter and can't simply set this flag inside the callee?
> 
> Are you suggesting `i2c_acpi_get_irq` modify the `client->flags`? IMO
> that's a little surprising since the I wouldn't expect a `get`
> function to modify it's parameters. I'm fine implementing it if others
> agree though.

This is similar to what of_i2c_get_board_info() does, no?
Note: _get_ there.


-- 
With Best Regards,
Andy Shevchenko


