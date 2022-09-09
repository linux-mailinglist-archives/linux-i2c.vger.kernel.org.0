Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B720E5B3EFB
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Sep 2022 20:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbiIISr1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Sep 2022 14:47:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbiIISr0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Sep 2022 14:47:26 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D11659C23C
        for <linux-i2c@vger.kernel.org>; Fri,  9 Sep 2022 11:47:25 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id 138so1160725iou.9
        for <linux-i2c@vger.kernel.org>; Fri, 09 Sep 2022 11:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=tY2acVbA/Ha3+2EN4QAjkpHBg/SdpbP2hwHDbNpf9bw=;
        b=ODw3NcxqU5t/spePY1O2k2TkXmXTPzngWZ+jzGxk48CMeQWHZCm43xP09J0X8msJpw
         RAUkVxddDp2KODf4+zE1ChALe0wbOMml+kErKuzJ/uLWeR04yvJD6RwIfEjgdK2Z0g9Q
         9o3ic/nQgpcfaq3PozndHUEK3yIhuLu7ebECI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=tY2acVbA/Ha3+2EN4QAjkpHBg/SdpbP2hwHDbNpf9bw=;
        b=0Wsv0tbMms1X8D1lkq60tNwoNWW/0yCRzfXjztnyvPMduw5DyipmMntJre1iiESFyW
         QZLP8lLCLb95AoG5/5KTgYloV3NziUQg3sIz4KIAgIw1FfCoCZpLY5dkVBewmEfFS2kr
         aR+AEZUiy3314J6lDYV9lTQ8Zw/UBEjSABdCnbGqwn0XNQ3KvmeUxbAQvOpXc15A22Of
         4OxNBLgIDz+STciA4LKHBJflnBD5sGwEpfz+PZBlKQPywdRMg3A73P495n5j5A8h+rss
         ehjef8ZOa7t4fHiRdtcdBSqnoQ5/zDAQXPpQTqjMhj+jv7DSmVRYk25njqsJ+ChQWhyC
         Ce0w==
X-Gm-Message-State: ACgBeo10LmqmrNgWowCGqOjLwTjCuWjfJoCkOd4vqxryO0ptKsINjCSH
        r7hVvO4LKMsXYj0pkCIvnWdk/DlneXaOXQ==
X-Google-Smtp-Source: AA6agR5vipUSgjTpIWZmMlIFrO1HCo9Yo9Z8gMmqg576lN9Sy2dvehgxHH/OtOwCZh6rTZUjFWQPAw==
X-Received: by 2002:a05:6638:1346:b0:34f:87d6:8014 with SMTP id u6-20020a056638134600b0034f87d68014mr8536148jad.184.1662749244797;
        Fri, 09 Sep 2022 11:47:24 -0700 (PDT)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com. [209.85.166.49])
        by smtp.gmail.com with ESMTPSA id f29-20020a02cadd000000b003584cc3c40csm460128jap.33.2022.09.09.11.47.23
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 11:47:23 -0700 (PDT)
Received: by mail-io1-f49.google.com with SMTP id h194so349850iof.4
        for <linux-i2c@vger.kernel.org>; Fri, 09 Sep 2022 11:47:23 -0700 (PDT)
X-Received: by 2002:a05:6602:2d4f:b0:689:5bba:dc99 with SMTP id
 d15-20020a0566022d4f00b006895bbadc99mr7410102iow.7.1662749242176; Fri, 09 Sep
 2022 11:47:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220830231541.1135813-1-rrangel@chromium.org>
 <20220830171332.4.I8af4282adc72eb9f247adcd03676a43893a020a6@changeid>
 <YxftNQrRx3fwsobk@google.com> <CAHQZ30DPmn1hN+xfck7CgOGLcze0jtHxxWnq7yVVL0Q_DzG6UQ@mail.gmail.com>
 <98559c23-cc22-3b85-2102-0cc760240804@redhat.com> <CAHQZ30ACZ-1UtgbXwEc+tFRvW-KpDg87Q4nj5Dwysz2BB26yiQ@mail.gmail.com>
 <CAJZ5v0iyF98fBgGFyvj_huVkyKvn4O0_WhA=-wC2VCG6A4DdjQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0iyF98fBgGFyvj_huVkyKvn4O0_WhA=-wC2VCG6A4DdjQ@mail.gmail.com>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Fri, 9 Sep 2022 12:47:11 -0600
X-Gmail-Original-Message-ID: <CAHQZ30DY9aYBoW303qW+hkegYV0BbKFO6LkCuHKnHNxZ3QoLYw@mail.gmail.com>
Message-ID: <CAHQZ30DY9aYBoW303qW+hkegYV0BbKFO6LkCuHKnHNxZ3QoLYw@mail.gmail.com>
Subject: Re: [PATCH 4/8] i2c: acpi: Use ACPI GPIO wake capability bit to set wake_irq
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linux ACPI <linux-acpi@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
        Tim Van Patten <timvp@google.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It looks like `i2c_acpi_get_irq` and `platform_get_irq_optional` are
doing pretty much the same thing. Can we replace `i2c_acpi_get_irq`
and switch over to `platform_get_irq_optional`? Is it possible to get
a `platform_device` from an `i2c_client`?

On Thu, Sep 8, 2022 at 9:23 AM Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Thu, Sep 8, 2022 at 4:40 PM Raul Rangel <rrangel@chromium.org> wrote:
> >
> > On Wed, Sep 7, 2022 at 2:12 AM Hans de Goede <hdegoede@redhat.com> wrote:
> > >
> > > Hi,
> > >
> > > On 9/7/22 04:00, Raul Rangel wrote:
> > > > On Tue, Sep 6, 2022 at 7:00 PM Dmitry Torokhov
> > > > <dmitry.torokhov@gmail.com> wrote:
> > > >>
> > > >> On Tue, Aug 30, 2022 at 05:15:37PM -0600, Raul E Rangel wrote:
> > > >>> Device tree already has a mechanism to pass the wake_irq. It does this
> > > >>> by looking for the wakeup-source property and setting the
> > > >>> I2C_CLIENT_WAKE flag. This CL adds the ACPI equivalent. It uses at the
> > > >>> ACPI GpioInt wake flag to determine if the interrupt can be used to wake
> > > >>> the system. Previously the i2c drivers had to make assumptions and
> > > >>> blindly enable the wake IRQ. This can cause spurious wake events. e.g.,
> > > >>> If there is a device with an Active Low interrupt and the device gets
> > > >>> powered off while suspending, the interrupt line will go low since it's
> > > >>> no longer powered and wake the system. For this reason we should respect
> > > >>> the board designers wishes and honor the wake bit defined on the
> > > >>> GpioInt.
> > > >>>
> > > >>> This change does not cover the ACPI Interrupt or IRQ resources.
> > > >>>
> > > >>> Signed-off-by: Raul E Rangel <rrangel@chromium.org>
> > > >>> ---
> > > >>>
> > > >>>  drivers/i2c/i2c-core-acpi.c |  8 ++++++--
> > > >>>  drivers/i2c/i2c-core-base.c | 17 +++++++++++------
> > > >>>  drivers/i2c/i2c-core.h      |  4 ++--
> > > >>>  3 files changed, 19 insertions(+), 10 deletions(-)
> > > >>>
> > > >>> diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
> > > >>> index c762a879c4cc6b..cfe82a6ba3ef28 100644
> > > >>> --- a/drivers/i2c/i2c-core-acpi.c
> > > >>> +++ b/drivers/i2c/i2c-core-acpi.c
> > > >>> @@ -182,12 +182,13 @@ static int i2c_acpi_add_resource(struct acpi_resource *ares, void *data)
> > > >>>  /**
> > > >>>   * i2c_acpi_get_irq - get device IRQ number from ACPI
> > > >>>   * @client: Pointer to the I2C client device
> > > >>> + * @wake_capable: Set to 1 if the IRQ is wake capable
> > > >>>   *
> > > >>>   * Find the IRQ number used by a specific client device.
> > > >>>   *
> > > >>>   * Return: The IRQ number or an error code.
> > > >>>   */
> > > >>> -int i2c_acpi_get_irq(struct i2c_client *client)
> > > >>> +int i2c_acpi_get_irq(struct i2c_client *client, int *wake_capable)
> > > >>>  {
> > > >>>       struct acpi_device *adev = ACPI_COMPANION(&client->dev);
> > > >>>       struct list_head resource_list;
> > > >>> @@ -196,6 +197,9 @@ int i2c_acpi_get_irq(struct i2c_client *client)
> > > >>>
> > > >>>       INIT_LIST_HEAD(&resource_list);
> > > >>>
> > > >>> +     if (wake_capable)
> > > >>> +             *wake_capable = 0;
> > > >>> +
> > > >>>       ret = acpi_dev_get_resources(adev, &resource_list,
> > > >>>                                    i2c_acpi_add_resource, &irq);
> > > >>
> > > >
> > > >
> > > >> You also need to handle "Interrupt(..., ...AndWake)" case here. I would
> > > >> look into maybe defining
> > > >>
> > > >> #define IORESOURCE_IRQ_WAKECAPABLE      (1<<6)
> > > >>
> > > >> in include/linux/ioport.h and plumbing it through from ACPI layer.
> > > >>
> > > >> Thanks.
> > > >
> > > > AFAIK the Intel (Not 100% certain) and AMD IO-APIC's can't actually
> > > > wake a system from suspend/suspend-to-idle.
> > >
> > > That may be true for S3 suspend (it sounds about right) there
> > > certainly is no way to "arm for wakeup" on the APIC, but with
> > > s2idle all IRQs which are not explicitly disabled by the OS
> > > still function normally so there any IRQ can be a wakeup
> > > source (AFAIK).
>
> That's true.
>
> Moreover, even for S3 there are transitions into it and there may be
> wakeup interrupts taking place during those transitions.  Those may be
> any IRQs too.
>
> > > And even with S3 suspend I think some IRQs can act as wakeup,
> > > but that is configured by the BIOS then and not something which
> > > linux can enable/disable. E.g IIRC the parent IRQ of the GPIO
> > > controllers on x86 is an APIC IRQ ...
>
> It's more about how the system is wired up AFAICS.  Basically, in
> order to wake up the system from S3, the given IRQ needs to be
> physically attached to an input that will trigger the platform wakeup
> logic while in S3.
>
> > >
> >
> > SGTM. I wanted to make sure there was interest before I invested the
> > time in adding the functionality. Hopefully I can push up a new patch
> > set tomorrow.
>
> Sounds good. :-)
