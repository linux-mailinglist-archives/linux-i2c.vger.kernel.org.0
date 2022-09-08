Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C79F45B2202
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Sep 2022 17:24:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbiIHPYB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Sep 2022 11:24:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232544AbiIHPXw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Sep 2022 11:23:52 -0400
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCD21EB2EE;
        Thu,  8 Sep 2022 08:23:50 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-3487d84e477so46960687b3.6;
        Thu, 08 Sep 2022 08:23:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=hy6RYfrm5HmnR/mLw7f4LGBQqKyWCny7YZKaMviwD+g=;
        b=GN+prGANnKxenbDDawxnZwSe02nuS3w13Yp/PwykK91iUw3ID+LM4DVPcg/qjxUYiG
         vETZsHymfjp/V6cNrPR6BHzMREvrllk7sO8qpR1RB8AKXnAiD+0G8F48rYibNaSNivNQ
         itpV+0Xq2/N1fBpyp6ZZ7IYQKIRMElpiFZYhGicXCqUZxMNELX6l4fHGmj6zP1ZMa3CY
         6VFRe1ajrhw/r1UuNZASqmfUZxRY2QtXII5JVO8/h4RDZLjaFjoEx1nOMrx+o46zTUEO
         HXA/OcWkLymJ9sZoQNS0dZDe5yEOZ1SWe9TjpFR9n0ggeWakDiv43QQCQKcSp2dAT73W
         6afA==
X-Gm-Message-State: ACgBeo0yavldGuCIwAhWisSv/I4lbeEvJap4TnntDjJeh6KtOAaN0YbH
        NzMgqa9DfPBxPUQurT7QzIiTkpKKZtItrgRdapI=
X-Google-Smtp-Source: AA6agR4+K4QtVakdvSj/SzUsZhmlxPpVSgQ4oBD/H0IpCFzmvMjxNr5X4ZPtuAg1ih2lTcK+8NYgIYU/kh+BqqrUjBU=
X-Received: by 2002:a81:9407:0:b0:345:6683:d757 with SMTP id
 l7-20020a819407000000b003456683d757mr7948011ywg.326.1662650629499; Thu, 08
 Sep 2022 08:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220830231541.1135813-1-rrangel@chromium.org>
 <20220830171332.4.I8af4282adc72eb9f247adcd03676a43893a020a6@changeid>
 <YxftNQrRx3fwsobk@google.com> <CAHQZ30DPmn1hN+xfck7CgOGLcze0jtHxxWnq7yVVL0Q_DzG6UQ@mail.gmail.com>
 <98559c23-cc22-3b85-2102-0cc760240804@redhat.com> <CAHQZ30ACZ-1UtgbXwEc+tFRvW-KpDg87Q4nj5Dwysz2BB26yiQ@mail.gmail.com>
In-Reply-To: <CAHQZ30ACZ-1UtgbXwEc+tFRvW-KpDg87Q4nj5Dwysz2BB26yiQ@mail.gmail.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Thu, 8 Sep 2022 17:23:37 +0200
Message-ID: <CAJZ5v0iyF98fBgGFyvj_huVkyKvn4O0_WhA=-wC2VCG6A4DdjQ@mail.gmail.com>
Subject: Re: [PATCH 4/8] i2c: acpi: Use ACPI GPIO wake capability bit to set wake_irq
To:     Raul Rangel <rrangel@chromium.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linux ACPI <linux-acpi@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
        Tim Van Patten <timvp@google.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 8, 2022 at 4:40 PM Raul Rangel <rrangel@chromium.org> wrote:
>
> On Wed, Sep 7, 2022 at 2:12 AM Hans de Goede <hdegoede@redhat.com> wrote:
> >
> > Hi,
> >
> > On 9/7/22 04:00, Raul Rangel wrote:
> > > On Tue, Sep 6, 2022 at 7:00 PM Dmitry Torokhov
> > > <dmitry.torokhov@gmail.com> wrote:
> > >>
> > >> On Tue, Aug 30, 2022 at 05:15:37PM -0600, Raul E Rangel wrote:
> > >>> Device tree already has a mechanism to pass the wake_irq. It does this
> > >>> by looking for the wakeup-source property and setting the
> > >>> I2C_CLIENT_WAKE flag. This CL adds the ACPI equivalent. It uses at the
> > >>> ACPI GpioInt wake flag to determine if the interrupt can be used to wake
> > >>> the system. Previously the i2c drivers had to make assumptions and
> > >>> blindly enable the wake IRQ. This can cause spurious wake events. e.g.,
> > >>> If there is a device with an Active Low interrupt and the device gets
> > >>> powered off while suspending, the interrupt line will go low since it's
> > >>> no longer powered and wake the system. For this reason we should respect
> > >>> the board designers wishes and honor the wake bit defined on the
> > >>> GpioInt.
> > >>>
> > >>> This change does not cover the ACPI Interrupt or IRQ resources.
> > >>>
> > >>> Signed-off-by: Raul E Rangel <rrangel@chromium.org>
> > >>> ---
> > >>>
> > >>>  drivers/i2c/i2c-core-acpi.c |  8 ++++++--
> > >>>  drivers/i2c/i2c-core-base.c | 17 +++++++++++------
> > >>>  drivers/i2c/i2c-core.h      |  4 ++--
> > >>>  3 files changed, 19 insertions(+), 10 deletions(-)
> > >>>
> > >>> diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
> > >>> index c762a879c4cc6b..cfe82a6ba3ef28 100644
> > >>> --- a/drivers/i2c/i2c-core-acpi.c
> > >>> +++ b/drivers/i2c/i2c-core-acpi.c
> > >>> @@ -182,12 +182,13 @@ static int i2c_acpi_add_resource(struct acpi_resource *ares, void *data)
> > >>>  /**
> > >>>   * i2c_acpi_get_irq - get device IRQ number from ACPI
> > >>>   * @client: Pointer to the I2C client device
> > >>> + * @wake_capable: Set to 1 if the IRQ is wake capable
> > >>>   *
> > >>>   * Find the IRQ number used by a specific client device.
> > >>>   *
> > >>>   * Return: The IRQ number or an error code.
> > >>>   */
> > >>> -int i2c_acpi_get_irq(struct i2c_client *client)
> > >>> +int i2c_acpi_get_irq(struct i2c_client *client, int *wake_capable)
> > >>>  {
> > >>>       struct acpi_device *adev = ACPI_COMPANION(&client->dev);
> > >>>       struct list_head resource_list;
> > >>> @@ -196,6 +197,9 @@ int i2c_acpi_get_irq(struct i2c_client *client)
> > >>>
> > >>>       INIT_LIST_HEAD(&resource_list);
> > >>>
> > >>> +     if (wake_capable)
> > >>> +             *wake_capable = 0;
> > >>> +
> > >>>       ret = acpi_dev_get_resources(adev, &resource_list,
> > >>>                                    i2c_acpi_add_resource, &irq);
> > >>
> > >
> > >
> > >> You also need to handle "Interrupt(..., ...AndWake)" case here. I would
> > >> look into maybe defining
> > >>
> > >> #define IORESOURCE_IRQ_WAKECAPABLE      (1<<6)
> > >>
> > >> in include/linux/ioport.h and plumbing it through from ACPI layer.
> > >>
> > >> Thanks.
> > >
> > > AFAIK the Intel (Not 100% certain) and AMD IO-APIC's can't actually
> > > wake a system from suspend/suspend-to-idle.
> >
> > That may be true for S3 suspend (it sounds about right) there
> > certainly is no way to "arm for wakeup" on the APIC, but with
> > s2idle all IRQs which are not explicitly disabled by the OS
> > still function normally so there any IRQ can be a wakeup
> > source (AFAIK).

That's true.

Moreover, even for S3 there are transitions into it and there may be
wakeup interrupts taking place during those transitions.  Those may be
any IRQs too.

> > And even with S3 suspend I think some IRQs can act as wakeup,
> > but that is configured by the BIOS then and not something which
> > linux can enable/disable. E.g IIRC the parent IRQ of the GPIO
> > controllers on x86 is an APIC IRQ ...

It's more about how the system is wired up AFAICS.  Basically, in
order to wake up the system from S3, the given IRQ needs to be
physically attached to an input that will trigger the platform wakeup
logic while in S3.

> >
>
> SGTM. I wanted to make sure there was interest before I invested the
> time in adding the functionality. Hopefully I can push up a new patch
> set tomorrow.

Sounds good. :-)
