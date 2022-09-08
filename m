Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A90665B20E0
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Sep 2022 16:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232108AbiIHOlO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Sep 2022 10:41:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232216AbiIHOkr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Sep 2022 10:40:47 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D152EB85A
        for <linux-i2c@vger.kernel.org>; Thu,  8 Sep 2022 07:40:19 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id y187so14306928iof.0
        for <linux-i2c@vger.kernel.org>; Thu, 08 Sep 2022 07:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=dkFYzxHzZtx7S+ud1yL02OeIuEzdT/rZqvxM0/793Zc=;
        b=X3j05iLtgmGpcQhk/s+lFSZWTqMfQp2L73IPF7Je8ntaS/jjxh3rQvT0I/4eNMwiZP
         gfWTKYhHpopdSEJRJ9mEyZ6xU6kJi5JZL2/xV5kbOsng3rf2SGVT41nBU/MuumWPE5wg
         yPS8vpP4+/WBxXTVBXm066sAqrERUpKO/5Qbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=dkFYzxHzZtx7S+ud1yL02OeIuEzdT/rZqvxM0/793Zc=;
        b=nbEP8bVMZ/tm2ZWA4e6+yQ7lHS4MkSg+vE0+z2p7eAuZtG4va+4XqaEBTYYvIJaHJX
         yzZJ+HXI4HT3U3tX/iV/Y+U/YkYBqDdx3igPhgiKybJ/Ga75msrRrVI9vrBaUF9mWRi4
         4QCIeTrEHmLfRwaaNU26uBSX7DnlVuITEPb360j7PKFOCjmr16Y4z31TJnw+P3quZbij
         SS/BWmpKPOCD++KrHJpYgiVonr856xhwLsI0WINUwBiHHfk3MtB/Tp3dlze8kVW6/6cF
         +9Jtjh67SZYItegAUd91Ta4vcJTv+Sh7jtNBRbca9l7wcwtSspBqe69V7dYr05ls1sbb
         vz/g==
X-Gm-Message-State: ACgBeo3LhSSg7NNvZQz/EoU7v+0FOZ1BCJnhu463vemIEdPe+BDPGAbi
        mDmz65HgLDxEG9DBfJVhHAcOjwSzVq/pqA==
X-Google-Smtp-Source: AA6agR7pzPm8VPpmxk3ejrOcVOezLVeX9hI0I3ExboDVNo0UiVSOXtZ/gd+snUBR3kOWSosZ6fs/Gg==
X-Received: by 2002:a05:6602:370d:b0:69e:25d1:a10c with SMTP id bh13-20020a056602370d00b0069e25d1a10cmr291635iob.119.1662648018707;
        Thu, 08 Sep 2022 07:40:18 -0700 (PDT)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com. [209.85.166.176])
        by smtp.gmail.com with ESMTPSA id cx7-20020a056638490700b00350682ba05csm7105398jab.30.2022.09.08.07.40.15
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 07:40:15 -0700 (PDT)
Received: by mail-il1-f176.google.com with SMTP id k9so6183327ils.12
        for <linux-i2c@vger.kernel.org>; Thu, 08 Sep 2022 07:40:15 -0700 (PDT)
X-Received: by 2002:a05:6e02:1b81:b0:2f1:d4c0:37ab with SMTP id
 h1-20020a056e021b8100b002f1d4c037abmr2064378ili.183.1662648015065; Thu, 08
 Sep 2022 07:40:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220830231541.1135813-1-rrangel@chromium.org>
 <20220830171332.4.I8af4282adc72eb9f247adcd03676a43893a020a6@changeid>
 <YxftNQrRx3fwsobk@google.com> <CAHQZ30DPmn1hN+xfck7CgOGLcze0jtHxxWnq7yVVL0Q_DzG6UQ@mail.gmail.com>
 <98559c23-cc22-3b85-2102-0cc760240804@redhat.com>
In-Reply-To: <98559c23-cc22-3b85-2102-0cc760240804@redhat.com>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Thu, 8 Sep 2022 08:40:04 -0600
X-Gmail-Original-Message-ID: <CAHQZ30ACZ-1UtgbXwEc+tFRvW-KpDg87Q4nj5Dwysz2BB26yiQ@mail.gmail.com>
Message-ID: <CAHQZ30ACZ-1UtgbXwEc+tFRvW-KpDg87Q4nj5Dwysz2BB26yiQ@mail.gmail.com>
Subject: Re: [PATCH 4/8] i2c: acpi: Use ACPI GPIO wake capability bit to set wake_irq
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
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
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 7, 2022 at 2:12 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 9/7/22 04:00, Raul Rangel wrote:
> > On Tue, Sep 6, 2022 at 7:00 PM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> >>
> >> On Tue, Aug 30, 2022 at 05:15:37PM -0600, Raul E Rangel wrote:
> >>> Device tree already has a mechanism to pass the wake_irq. It does this
> >>> by looking for the wakeup-source property and setting the
> >>> I2C_CLIENT_WAKE flag. This CL adds the ACPI equivalent. It uses at the
> >>> ACPI GpioInt wake flag to determine if the interrupt can be used to wake
> >>> the system. Previously the i2c drivers had to make assumptions and
> >>> blindly enable the wake IRQ. This can cause spurious wake events. e.g.,
> >>> If there is a device with an Active Low interrupt and the device gets
> >>> powered off while suspending, the interrupt line will go low since it's
> >>> no longer powered and wake the system. For this reason we should respect
> >>> the board designers wishes and honor the wake bit defined on the
> >>> GpioInt.
> >>>
> >>> This change does not cover the ACPI Interrupt or IRQ resources.
> >>>
> >>> Signed-off-by: Raul E Rangel <rrangel@chromium.org>
> >>> ---
> >>>
> >>>  drivers/i2c/i2c-core-acpi.c |  8 ++++++--
> >>>  drivers/i2c/i2c-core-base.c | 17 +++++++++++------
> >>>  drivers/i2c/i2c-core.h      |  4 ++--
> >>>  3 files changed, 19 insertions(+), 10 deletions(-)
> >>>
> >>> diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
> >>> index c762a879c4cc6b..cfe82a6ba3ef28 100644
> >>> --- a/drivers/i2c/i2c-core-acpi.c
> >>> +++ b/drivers/i2c/i2c-core-acpi.c
> >>> @@ -182,12 +182,13 @@ static int i2c_acpi_add_resource(struct acpi_resource *ares, void *data)
> >>>  /**
> >>>   * i2c_acpi_get_irq - get device IRQ number from ACPI
> >>>   * @client: Pointer to the I2C client device
> >>> + * @wake_capable: Set to 1 if the IRQ is wake capable
> >>>   *
> >>>   * Find the IRQ number used by a specific client device.
> >>>   *
> >>>   * Return: The IRQ number or an error code.
> >>>   */
> >>> -int i2c_acpi_get_irq(struct i2c_client *client)
> >>> +int i2c_acpi_get_irq(struct i2c_client *client, int *wake_capable)
> >>>  {
> >>>       struct acpi_device *adev = ACPI_COMPANION(&client->dev);
> >>>       struct list_head resource_list;
> >>> @@ -196,6 +197,9 @@ int i2c_acpi_get_irq(struct i2c_client *client)
> >>>
> >>>       INIT_LIST_HEAD(&resource_list);
> >>>
> >>> +     if (wake_capable)
> >>> +             *wake_capable = 0;
> >>> +
> >>>       ret = acpi_dev_get_resources(adev, &resource_list,
> >>>                                    i2c_acpi_add_resource, &irq);
> >>
> >
> >
> >> You also need to handle "Interrupt(..., ...AndWake)" case here. I would
> >> look into maybe defining
> >>
> >> #define IORESOURCE_IRQ_WAKECAPABLE      (1<<6)
> >>
> >> in include/linux/ioport.h and plumbing it through from ACPI layer.
> >>
> >> Thanks.
> >
> > AFAIK the Intel (Not 100% certain) and AMD IO-APIC's can't actually
> > wake a system from suspend/suspend-to-idle.
>
> That may be true for S3 suspend (it sounds about right) there
> certainly is no way to "arm for wakeup" on the APIC, but with
> s2idle all IRQs which are not explicitly disabled by the OS
> still function normally so there any IRQ can be a wakeup
> source (AFAIK).
>
> And even with S3 suspend I think some IRQs can act as wakeup,
> but that is configured by the BIOS then and not something which
> linux can enable/disable. E.g IIRC the parent IRQ of the GPIO
> controllers on x86 is an APIC IRQ ...
>
> Regards,
>
> Hans
>

SGTM. I wanted to make sure there was interest before I invested the
time in adding the functionality. Hopefully I can push up a new patch
set tomorrow.
