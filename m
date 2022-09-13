Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4CE75B7A64
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Sep 2022 21:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233088AbiIMTBq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Sep 2022 15:01:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233034AbiIMTBZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Sep 2022 15:01:25 -0400
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CA3B19037
        for <linux-i2c@vger.kernel.org>; Tue, 13 Sep 2022 11:56:55 -0700 (PDT)
Received: by mail-il1-x136.google.com with SMTP id a9so6774713ilh.1
        for <linux-i2c@vger.kernel.org>; Tue, 13 Sep 2022 11:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=LtAYZje0M68/s1r4tHyDwDNi40n/sG8DGVF2ayd5a6Y=;
        b=QWyBZ80Zq0ZcdHrZPzyM5kzKrK2LeLxgmwqnRm3WBzlsmowMa86coHFuZ7UFnXdydh
         1vrWYRjtGsfas8YhI08LVyrhnKYueEF8m0Hds0exJ3LwcENGYuHpKvwZVWp/HUVH0R3N
         xB3Z7vHhZ0Jrlc61V0COnfQLcjdNUkByn2cGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=LtAYZje0M68/s1r4tHyDwDNi40n/sG8DGVF2ayd5a6Y=;
        b=DJP0lJ1MUHR2cr8ffPPtvubyNNkEKKSMbJr/gqmA+8R4QbWNOLyYSEz0yvqcOO5r3P
         S7i5XWlak4u3YjHTR6gzBeZLOujGLJFusLynlyT7FrlTb6Ahp18eKTYWG5/a+8UhhgIq
         s4FBAIMxJkeRz/r7VWFytM3B4cB2nM1ldeJ7tNtub6ps1Ki/yQsmJs33v+L8XA63+jVz
         CsangiSvZrBNc06sq2OCaPnrTrUMSpdIYz1/Vp0c8gow9SGHpWzekV5F5ySkQzhBy1Ly
         s4RJi80vTuG5nzd521UPhLDdIbd90UcwLmfAbETd+VN9Rc6YKsw8dm+JpeJRv0/Z0Oct
         PsEA==
X-Gm-Message-State: ACgBeo1HaaqDsrnpltnBilJ01fqwLfFS6eAvSEfhRQm7mN3k+++ba4/n
        Jz6uu6aPlDtWzYUonvGe7EtHpLKBwHy9xQ==
X-Google-Smtp-Source: AA6agR7d9Exe4SuAF3WHQlp1jGsIz8Vyp2jeA+ZTnks8kXIGePsvbLCh30wJ/bKkjyIbQYnFV109rA==
X-Received: by 2002:a05:6e02:1cad:b0:2ef:f0d:b43 with SMTP id x13-20020a056e021cad00b002ef0f0d0b43mr13554619ill.300.1663095413646;
        Tue, 13 Sep 2022 11:56:53 -0700 (PDT)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com. [209.85.166.41])
        by smtp.gmail.com with ESMTPSA id q1-20020a02b041000000b0034c1327760bsm5888222jah.173.2022.09.13.11.56.52
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 11:56:52 -0700 (PDT)
Received: by mail-io1-f41.google.com with SMTP id e205so6374295iof.1
        for <linux-i2c@vger.kernel.org>; Tue, 13 Sep 2022 11:56:52 -0700 (PDT)
X-Received: by 2002:a02:9509:0:b0:349:b6cb:9745 with SMTP id
 y9-20020a029509000000b00349b6cb9745mr16993260jah.281.1663095412005; Tue, 13
 Sep 2022 11:56:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220912221317.2775651-1-rrangel@chromium.org>
 <20220912160931.v2.7.I8af4282adc72eb9f247adcd03676a43893a020a6@changeid>
 <YyC9N62JaMGaeanf@smile.fi.intel.com> <CAHQZ30DAr_BwH03=bG9tfCSGW+-he-c-4PPeJMOqH28cVcKDoA@mail.gmail.com>
 <YyDNAw+ur177ayY0@smile.fi.intel.com>
In-Reply-To: <YyDNAw+ur177ayY0@smile.fi.intel.com>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Tue, 13 Sep 2022 12:56:37 -0600
X-Gmail-Original-Message-ID: <CAHQZ30DP1asiMj7hoebQQvGqE36sBDjaFmp3ju3eUEF1PruFeg@mail.gmail.com>
Message-ID: <CAHQZ30DP1asiMj7hoebQQvGqE36sBDjaFmp3ju3eUEF1PruFeg@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] i2c: acpi: Use ACPI wake capability bit to set wake_irq
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 13, 2022 at 12:33 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Sep 13, 2022 at 12:07:53PM -0600, Raul Rangel wrote:
> > On Tue, Sep 13, 2022 at 11:26 AM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Mon, Sep 12, 2022 at 04:13:11PM -0600, Raul E Rangel wrote:
> > > > Device tree already has a mechanism to pass the wake_irq. It does this
> > > > by looking for the wakeup-source property and setting the
> > > > I2C_CLIENT_WAKE flag. This CL adds the ACPI equivalent. It uses the
> > > > ACPI interrupt wake flag to determine if the interrupt can be used to
> > > > wake the system. Previously the i2c drivers had to make assumptions and
> > > > blindly enable the wake IRQ. This can cause spurious wake events. e.g.,
> > > > If there is a device with an Active Low interrupt and the device gets
> > > > powered off while suspending, the interrupt line will go low since it's
> > > > no longer powered and wakes the system. For this reason we should
> > > > respect the board designers wishes and honor the wake bit defined on the
> > > > interrupt.
> >
> > >
> > > > +                     if (irq > 0 && acpi_wake_capable)
> > > > +                             client->flags |= I2C_CLIENT_WAKE;
> > >
> > > Why do we need a parameter and can't simply set this flag inside the callee?
> >
> > Are you suggesting `i2c_acpi_get_irq` modify the `client->flags`? IMO
> > that's a little surprising since the I wouldn't expect a `get`
> > function to modify it's parameters. I'm fine implementing it if others
> > agree though.
>


> This is similar to what of_i2c_get_board_info() does, no?
> Note: _get_ there.
>

`*info` is an out parameter in that case. Ideally I would have
`i2c_acpi_get_irq`, `acpi_dev_gpio_irq_get_wake`,
`platform_get_irq_optional`, and `i2c_dev_irq_from_resources` all
return a `struct irq_info {int irq; bool wake_capable;}`. This would
be a larger change though.
