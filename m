Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3BED5AF9B1
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Sep 2022 04:04:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbiIGCEN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Sep 2022 22:04:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbiIGCEM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Sep 2022 22:04:12 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB865910AA;
        Tue,  6 Sep 2022 19:04:11 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id o126so4177869pfb.6;
        Tue, 06 Sep 2022 19:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=chfMZrx5v0YRcAnXYpUA1CnA/WnOfArS4Lmd34UdkZY=;
        b=hFXP6IV6HkX+U5uUzrRKTdjGR0zcRlzcz3rG4w8iD+uNjDnUtGvEAQme1Oxg/UCGRm
         YBhzEj9b87jBrnZaC5REdO1LDIZneVS4PVZ4dji5nEVFbSwHbV0pMuoIz2+vcQEj8VlC
         3wsvVS2Kb8qq4EcvM+Nq3iMcHxYgk4lPpBOdKKv1r7pvaZ4OrZj0nas7+cEOVeDSLkMx
         FWWQMCwLk16i3L9sBO82363L0yICri92RW4l2eKVSg/Ou/Ho4FIrIFxszhc977waFq99
         vmYV7l5YBsW7HZkAd5QRP7zu7gwlxRW2UqixtoQxOBDd2nPgMlZh055aT5SFf3i/sEw+
         t5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=chfMZrx5v0YRcAnXYpUA1CnA/WnOfArS4Lmd34UdkZY=;
        b=fRMYxIaTz1HeK8kY/j2Z1FPLKk7ex8cHiJJqa4UL19xB3XXTZtQdEhjdQ63k4KoSR0
         kG8pyKRFRST097wiMyPcYm7uKjoN/nTC+KQNq2jzdv8v75TR27CgNDJ+VSmT++TPPUim
         /TcCkLTZxqNYL//Wrw94RnRvKDkjOtIk1jy5URCaDm1Ge6RX19DIxLQ2O1/JugjjPPsq
         KrGjWa+vV3uX1Vf0O0oBP6Ewq0KLknNAdqKgpKHlBn+tXNlwDHzQ/2qd1HOc5vhjTuli
         9HbETRNmxAmnIGNFC7O0yYR6s+981vs1LVQbt5CMLaxrTa30XoBAwqgVRgNuznFVUmjm
         5EwQ==
X-Gm-Message-State: ACgBeo1jxcou0xGGePbDv50xVI9uT84+sazyGrkXhrDByvXKW7ILvAyl
        ZLXn1wgmoy1CNOiyj44C6Qg=
X-Google-Smtp-Source: AA6agR60/0mCm0vqmUm3+VdvVyPErwkPVWttERs9dwgWDm0x27HME4k1ndALpmU9KlLC8hLOpTRyeQ==
X-Received: by 2002:a63:d406:0:b0:434:7829:2e73 with SMTP id a6-20020a63d406000000b0043478292e73mr1377550pgh.573.1662516251151;
        Tue, 06 Sep 2022 19:04:11 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:abc4:5d24:5a73:a96b])
        by smtp.gmail.com with ESMTPSA id m7-20020a1709026bc700b00172ccb3f4ebsm6589574plt.160.2022.09.06.19.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 19:04:10 -0700 (PDT)
Date:   Tue, 6 Sep 2022 19:04:07 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Raul Rangel <rrangel@chromium.org>
Cc:     Linux ACPI <linux-acpi@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
        Tim Van Patten <timvp@google.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/8] i2c: acpi: Use ACPI GPIO wake capability bit to set
 wake_irq
Message-ID: <Yxf8F4mO8XUW0keq@google.com>
References: <20220830231541.1135813-1-rrangel@chromium.org>
 <20220830171332.4.I8af4282adc72eb9f247adcd03676a43893a020a6@changeid>
 <YxftNQrRx3fwsobk@google.com>
 <CAHQZ30DPmn1hN+xfck7CgOGLcze0jtHxxWnq7yVVL0Q_DzG6UQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHQZ30DPmn1hN+xfck7CgOGLcze0jtHxxWnq7yVVL0Q_DzG6UQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 06, 2022 at 08:00:00PM -0600, Raul Rangel wrote:
> On Tue, Sep 6, 2022 at 7:00 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > On Tue, Aug 30, 2022 at 05:15:37PM -0600, Raul E Rangel wrote:
> > > Device tree already has a mechanism to pass the wake_irq. It does this
> > > by looking for the wakeup-source property and setting the
> > > I2C_CLIENT_WAKE flag. This CL adds the ACPI equivalent. It uses at the
> > > ACPI GpioInt wake flag to determine if the interrupt can be used to wake
> > > the system. Previously the i2c drivers had to make assumptions and
> > > blindly enable the wake IRQ. This can cause spurious wake events. e.g.,
> > > If there is a device with an Active Low interrupt and the device gets
> > > powered off while suspending, the interrupt line will go low since it's
> > > no longer powered and wake the system. For this reason we should respect
> > > the board designers wishes and honor the wake bit defined on the
> > > GpioInt.
> > >
> > > This change does not cover the ACPI Interrupt or IRQ resources.
> > >
> > > Signed-off-by: Raul E Rangel <rrangel@chromium.org>
> > > ---
> > >
> > >  drivers/i2c/i2c-core-acpi.c |  8 ++++++--
> > >  drivers/i2c/i2c-core-base.c | 17 +++++++++++------
> > >  drivers/i2c/i2c-core.h      |  4 ++--
> > >  3 files changed, 19 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
> > > index c762a879c4cc6b..cfe82a6ba3ef28 100644
> > > --- a/drivers/i2c/i2c-core-acpi.c
> > > +++ b/drivers/i2c/i2c-core-acpi.c
> > > @@ -182,12 +182,13 @@ static int i2c_acpi_add_resource(struct acpi_resource *ares, void *data)
> > >  /**
> > >   * i2c_acpi_get_irq - get device IRQ number from ACPI
> > >   * @client: Pointer to the I2C client device
> > > + * @wake_capable: Set to 1 if the IRQ is wake capable
> > >   *
> > >   * Find the IRQ number used by a specific client device.
> > >   *
> > >   * Return: The IRQ number or an error code.
> > >   */
> > > -int i2c_acpi_get_irq(struct i2c_client *client)
> > > +int i2c_acpi_get_irq(struct i2c_client *client, int *wake_capable)
> > >  {
> > >       struct acpi_device *adev = ACPI_COMPANION(&client->dev);
> > >       struct list_head resource_list;
> > > @@ -196,6 +197,9 @@ int i2c_acpi_get_irq(struct i2c_client *client)
> > >
> > >       INIT_LIST_HEAD(&resource_list);
> > >
> > > +     if (wake_capable)
> > > +             *wake_capable = 0;
> > > +
> > >       ret = acpi_dev_get_resources(adev, &resource_list,
> > >                                    i2c_acpi_add_resource, &irq);
> >
> 
> 
> > You also need to handle "Interrupt(..., ...AndWake)" case here. I would
> > look into maybe defining
> >
> > #define IORESOURCE_IRQ_WAKECAPABLE      (1<<6)
> >
> > in include/linux/ioport.h and plumbing it through from ACPI layer.
> >
> > Thanks.
> 
> AFAIK the Intel (Not 100% certain) and AMD IO-APIC's can't actually
> wake a system from suspend/suspend-to-idle. It requires either a GPE
> or GPIO controller to wake the system. This is the reason I haven't
> pushed patches to handle the Interrupt/IRQ resource. Can anyone
> confirm?

I've heard there are ARM ACPI systems...

Thanks.

-- 
Dmitry
