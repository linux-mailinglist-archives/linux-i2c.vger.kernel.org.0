Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD3C44394F3
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Oct 2021 13:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232925AbhJYLlc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Oct 2021 07:41:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231338AbhJYLlc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Oct 2021 07:41:32 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CD41C061745;
        Mon, 25 Oct 2021 04:39:09 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id l13so21307772edi.8;
        Mon, 25 Oct 2021 04:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9xQstCT06pq76TZXv4w2bZwRz7EH6R1TK2p140IoLNk=;
        b=PFIYxp0es2lexC3Ge0wFOrGrHYIyt++/9TkdSJYmJv8rZuF8lSP4OqVaAYToGX/0Bj
         W73ffw9atFxhUO+sNKopfr8az0t6W2OR41331nRt6InNIGlZCIdj3CcNOi1K6cSBjGR7
         wgjTAqtl2x8WwUg/UgLJDImZimFjpFbRPESPTFB/0mkEK3AEwOrFclze+7OesNSRND2D
         E0+I4m+TOZxnJUpgMXpaSZpGGhSJbKk6u4q9/CNldWfkAq5NAet/V/awtECPjw8lnUSN
         DwPbRF5KfGrlahQtB6QACEq4BnhBKhr8ByRkRd6OqnTOWjiAyDebJG3UT0xYEPiFAnIS
         BK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9xQstCT06pq76TZXv4w2bZwRz7EH6R1TK2p140IoLNk=;
        b=Kk0ylgmxNG+QzZFCtiCJqCYL/OfZtHCwCzuWOnp6JYI6Xxwk31G/bit5BS4lmhJBjr
         unDnAC61Av4Wve9YaTb5vxOKIBwDyhEHTWk1jrAFtzSmvfdqCXGb1AOwP9EjFahY5iSG
         gPKKzX7oqV5rx0edHUFfqdiErUJmXvj8vMsZOC8DT2KDeNoWBlfI/r3NU/JQDC+/5SX6
         senjwe5cSmOWjHSgZN34PfIUhqDUXfCV4YBxrkrDW/wr8i5C9JlzncoJ9l3h0d1ENflw
         dru/qcaE319rZkfl0oU2C2T0I8y+f6uRrmaDsBqhKqlZMIWKjmulMozWXmeKyYteEDB0
         6MQw==
X-Gm-Message-State: AOAM5310R7GZNudjUw22oL3t95iYymCRTSBUqFczcAwTU9fiZ87Lcewc
        RAsfcAuSY0YwGNcXFJpGleEM9SGMAMjjIWhZBwI=
X-Google-Smtp-Source: ABdhPJwIXU3Df+S4wAeP4NEz54qMaR6Bri+4radj6taShHM4Tf8FkI9HC+gaqL5IbSuVVrYOQWI++daovA7BcobcSL0=
X-Received: by 2002:a05:6402:128c:: with SMTP id w12mr6943738edv.107.1635161948000;
 Mon, 25 Oct 2021 04:39:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211025094119.82967-1-hdegoede@redhat.com> <20211025094119.82967-11-hdegoede@redhat.com>
In-Reply-To: <20211025094119.82967-11-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 25 Oct 2021 14:38:14 +0300
Message-ID: <CAHp75VdC8i1YWZh_KXNqz_hHgHFoXQ57cce4-x3e6Ha0ZVPQag@mail.gmail.com>
Subject: Re: [PATCH v4 10/11] platform/x86: int3472: Pass tps68470_regulator_platform_data
 to the tps68470-regulator MFD-cell
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 25, 2021 at 12:42 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Pass tps68470_regulator_platform_data to the tps68470-regulator
> MFD-cell, specifying the voltages of the various regulators and
> tying the regulators to the sensor supplies so that sensors which use
> the TPS68470 can find their regulators.
>
> Since the voltages and supply connections are board-specific, this
> introduces a DMI matches int3472_tps68470_board_data struct which
> contains the necessary per-board info.
>
> This per-board info also includes GPIO lookup information for the
> sensor GPIOs which may be connected to the tps68470 gpios.

gpios --> GPIO lines

...

> +       board_data =3D int3472_tps68470_get_board_data(dev_name(&client->=
dev));

> +       if (board_data)

IIRC it's a dup. Below already incorporates this.

> +               gpiod_remove_lookup_table(board_data->tps68470_gpio_looku=
p_table);

...

> +const struct int3472_tps68470_board_data *int3472_tps68470_get_board_dat=
a(const char *dev_name)
> +{
> +       const struct int3472_tps68470_board_data *board_data;
> +       const struct dmi_system_id *match;
> +
> +       match =3D dmi_first_match(int3472_tps68470_board_data_table);
> +       while (match) {
> +               board_data =3D match->driver_data;
> +               if (strcmp(board_data->dev_name, dev_name) =3D=3D 0)
> +                       return board_data;
> +
> +               dmi_first_match(++match);
> +       }
> +
> +       return NULL;

Sounds like a d=C3=A9j=C3=A0-vu for the code seeing somewhere under sound/s=
oc or so.
Perhaps a TODO for eliminating the dup? (Yes, it's out of scope of this ser=
ies)

> +}

--=20
With Best Regards,
Andy Shevchenko
