Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E731542A83
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2019 17:14:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2501883AbfFLPNm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jun 2019 11:13:42 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:32776 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2501880AbfFLPNm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Jun 2019 11:13:42 -0400
Received: by mail-qk1-f193.google.com with SMTP id r6so10522620qkc.0
        for <linux-i2c@vger.kernel.org>; Wed, 12 Jun 2019 08:13:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BwIDmOAGcEki3RdvfGMK1ES9aAPDYLop/FJjdHjbbH0=;
        b=nPSpHIIyBu9wEcBi64V4v7g6nPTVVYnO8mVHFLEBiXKvoyiR5HlMKkObSiGZRy4H6/
         icDPLqash7CN9IoHHefyG+drp+j3aIA4tFiSa81xFBYMeeAfx64zn0krpRGDWZL3WEM7
         QERBLSQfRhOIcOupN0Mhu62F3qvWUdvdkhftBic25sMjpW535xqWiS7ACSk8iXIDM0A9
         YA/6+Q6YpZDtCQGvSfGRB3brfWi8CZ/4KkoPmWxfc5napvEzhcqu3GsItuMUg7qGFQKx
         apdb2ToKEEbdllMsb5iWNTRXuLy0qkYxqdB+JD56/ld0YFY+7ADbioicR4HRbKCInBjo
         XM0w==
X-Gm-Message-State: APjAAAVF26JhI942MFQ79ppgUHPAWmKUQZWTFLEuIkFwHyowRpwqbaIm
        SWG8AMoPgcv8864PuJoJLZolsgCTpOqn+oSKmn6kG0MU
X-Google-Smtp-Source: APXvYqyuURPY4j2JOFu4hsedR0SBO7Tpt4TyJyufs9gmWqDZmLHo/p8lFdBRjG8oj/ETsABwFm/k9tSacoYc2LNbjeQ=
X-Received: by 2002:a05:620a:16c1:: with SMTP id a1mr23929067qkn.269.1560352421153;
 Wed, 12 Jun 2019 08:13:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190611123101.25264-1-ckeepax@opensource.cirrus.com>
 <CAO-hwJ+qSXwZ-5sAiZ55-r_PXp9pvnE1XEaE_v3SBnxzQQNH4g@mail.gmail.com> <20190611152833.GR28362@ediswmail.ad.cirrus.com>
In-Reply-To: <20190611152833.GR28362@ediswmail.ad.cirrus.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 12 Jun 2019 17:13:29 +0200
Message-ID: <CAO-hwJKvxWktLOH4cpmUZEWrm3aPsazGe4Oo3eGSMdvQXZV4-w@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] I2C IRQ Probe Improvements
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, mika.westerberg@linux.intel.com,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        linux-acpi@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
        Jim Broadus <jbroadus@gmail.com>, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jun 11, 2019 at 5:29 PM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> On Tue, Jun 11, 2019 at 05:16:58PM +0200, Benjamin Tissoires wrote:
> > On Tue, Jun 11, 2019 at 2:31 PM Charles Keepax
> > <ckeepax@opensource.cirrus.com> wrote:
> > >
> > > This series attempts to align as much IRQ handling into the
> > > probe path as possible. Note that I don't have a great setup
> > > for testing these patches so they are mostly just build tested
> > > and need careful review and testing before any of them are
> > > merged.
> > >
> > > The series brings the ACPI path inline with the way the device
> > > tree path handles the IRQ entirely at probe time. However,
> > > it still leaves any IRQ specified through the board_info as
> > > being handled at device time. In that case we need to cache
> > > something from the board_info until probe time, which leaves
> > > any alternative solution with something basically the same as
> > > the current handling although perhaps caching more stuff.
> >
> > Hmm, I still haven't pinpointed the issue, but I wanted to give a test
> > of the series and I have:
> > [    5.511806] i2c_hid i2c-DLL075B:01: HID over i2c has not been
> > provided an Int IRQ
> > [    5.511825] i2c_hid: probe of i2c-DLL075B:01 failed with error -22
> >
> > So it seems that there is something wrong happening when fetching the
> > IRQ and providing it to i2c-hid.
> >
> > That was on a Dell XPS 9360.
> >
> > Bisecting is starting.
> >
>
> I have a sneaking suspision, does this diff fix it:
>
> diff --git a/drivers/i2c/i2c-core-acpi.c
> b/drivers/i2c/i2c-core-acpi.c
> index 57be6342ba508..a90b05a269c36 100644
> --- a/drivers/i2c/i2c-core-acpi.c
> +++ b/drivers/i2c/i2c-core-acpi.c
> @@ -169,7 +169,7 @@ int i2c_acpi_get_irq(struct i2c_client *client)
>         acpi_dev_free_resource_list(&resource_list);
>
>         if (irq == -ENOENT)
> -           irq = acpi_dev_gpio_irq_get(adev, 0);
> +         irq = acpi_dev_gpio_irq_get(ACPI_COMPANION(&client->dev), 0);
>
>         return irq;
>  }
>

Unfortunately, this doesn't solve the issue.

The problem is either in 4/7 or 5/7 (4/7 doesn't boot AFAICT).

(chasing multiple rabbits at the same time, so hard to get to the bottom of it)

Cheers,
Benjamin

> There was some earlier discussion about which device was suitable
> for this call.
>
> Thanks,
> Charles
