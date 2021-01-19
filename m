Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16D3D2FB9AC
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Jan 2021 15:37:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392070AbhASOg6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Jan 2021 09:36:58 -0500
Received: from mail-oi1-f179.google.com ([209.85.167.179]:43398 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404399AbhASNUn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Jan 2021 08:20:43 -0500
Received: by mail-oi1-f179.google.com with SMTP id q25so21077411oij.10;
        Tue, 19 Jan 2021 05:19:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kUDdGSpowK1CEbj8McVC+bBtkLq63WQr+Zql2YLqG5U=;
        b=APR2QqebwLBhixWfzvKPO1J2toMMxc5wGp2eyDUTVTgDdeiNhXK9t6GdizLJ1xkZqO
         9FUJcPELlC8JsKvZHgBtP/Ouyr8wWl7/QC6N2kqS0Li/vWGRmut2IRxVbXPhlkaNolc+
         YXtBkshomBq06Z92/3M3YA3v32X5IuS3Fjcs2T+j7H8yNeRu/EH+gKLfKCGJPh9Buv2w
         PH0oMcgsVw9Y6E7Bp34L49D7RMsDRVlVulxSNBXLwVyuZf1n6mqf1hlwIDnkodjDxUv5
         TSBMz7CAVNaWyjyCpMwPiJ6OEpyBpr+lxLlu9AucA+mGHM9ffrkAt1B/xb2zhDj9eT2T
         EnZg==
X-Gm-Message-State: AOAM5320PfM7sBJ4mg7+Ikxwfq1IGR98LK0HQaVUFF7cmGuDrycn1e5q
        +seTqS7UdaDCLlahsDcTmZN/4kOlHfyFAY4r+II=
X-Google-Smtp-Source: ABdhPJx6gcAwtwXRqp5/IJOsji1kIJ+Z/62NGRk7TKZOMu+nRuZ+LcTh4icQ0/TaVor6jnR3+WE/obLzf1Lcm6Gy7n8=
X-Received: by 2002:aca:5c05:: with SMTP id q5mr2555018oib.157.1611062368209;
 Tue, 19 Jan 2021 05:19:28 -0800 (PST)
MIME-Version: 1.0
References: <20210118003428.568892-1-djrscally@gmail.com> <20210118003428.568892-5-djrscally@gmail.com>
 <YAVSf7+iTPNYf5XS@pendragon.ideasonboard.com>
In-Reply-To: <YAVSf7+iTPNYf5XS@pendragon.ideasonboard.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Tue, 19 Jan 2021 14:19:16 +0100
Message-ID: <CAJZ5v0hUELtKc9CK=z47XQvSAAx=wTWvoVwP-PaMqugaXaCgZQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] i2c: i2c-core-acpi: Add i2c_acpi_dev_name()
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <djrscally@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-gpio@vger.kernel.org, linux-i2c <linux-i2c@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:ACPI COMPONENT ARCHITECTURE (ACPICA)" <devel@acpica.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>, andy@kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 18, 2021 at 9:55 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Daniel,
>
> Thank you for the patch.
>
> On Mon, Jan 18, 2021 at 12:34:25AM +0000, Daniel Scally wrote:
> > We want to refer to an i2c device by name before it has been
>
> s/i2c device/acpi i2c device/ ?
>
> > created by the kernel; add a function that constructs the name
> > from the acpi device instead.
> >
> > Signed-off-by: Daniel Scally <djrscally@gmail.com>
> > ---
> > Changes in v2:
> >
> >       - Stopped using devm_kasprintf()
> >
> >  drivers/i2c/i2c-core-acpi.c | 16 ++++++++++++++++
> >  include/linux/i2c.h         |  5 +++++
> >  2 files changed, 21 insertions(+)
> >
> > diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
> > index 37c510d9347a..98c3ba9a2350 100644
> > --- a/drivers/i2c/i2c-core-acpi.c
> > +++ b/drivers/i2c/i2c-core-acpi.c
> > @@ -497,6 +497,22 @@ struct i2c_client *i2c_acpi_new_device(struct device *dev, int index,
> >  }
> >  EXPORT_SYMBOL_GPL(i2c_acpi_new_device);
> >
> > +/**
> > + * i2c_acpi_dev_name - Construct i2c device name for devs sourced from ACPI
> > + * @adev:     ACPI device to construct the name for
> > + *
> > + * Constructs the name of an i2c device matching the format used by
> > + * i2c_dev_set_name() to allow users to refer to an i2c device by name even
> > + * before they have been instantiated.
> > + *
> > + * The caller is responsible for freeing the returned pointer.
> > + */
> > +char *i2c_acpi_dev_name(struct acpi_device *adev)
> > +{
> > +     return kasprintf(GFP_KERNEL, I2C_DEV_NAME_FORMAT, acpi_dev_name(adev));
>
> There's a real danger of a memory leak, as the function name sounds very
> similar to dev_name() or acpi_dev_name() and those don't allocate
> memory. I'm not sure what a better name would be, but given that this
> function is only used in patch 6/7 and not in the I2C subsystem itself,
> I wonder if we should inline this kasprintf() call in the caller and
> drop this patch.

IMO if this is a one-off usage, it's better to open-code it.
