Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 555EF43D145
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Oct 2021 20:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240518AbhJ0S4h (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Oct 2021 14:56:37 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51]:43536 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230437AbhJ0S4g (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 Oct 2021 14:56:36 -0400
Received: by mail-ot1-f51.google.com with SMTP id y15-20020a9d460f000000b0055337e17a55so4952365ote.10;
        Wed, 27 Oct 2021 11:54:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0BMTeXCdhZ7VaC/eWMcigTkrnP2pN01kWWzYJFIQyu0=;
        b=HO7aDRTVppu2yosyAPICQSxU5lZ2c/IAU7mENzj2Yo+g35S4jyN81S/nOvQFt8IeMa
         iSxbgkOPknv3UJfXJ6ZB+rNIIieF0nX7pT8u9A8ugyviKYXfqJ9GynfPJGnXg0lY3wQz
         k+P/M9SLXiqEYYLMKu7PHGki/0gOxznCv6Yag5tQvV6ldvgXyYq6qPGbc5y7bzhD/xNh
         tdNfTP9V/rlGW4/88xZTr+UVPxpAxxJtswzyAWYyna3mLcyjIWZtMVpTYFYbMfJVcQDG
         08mRvET7OYyxzDFsLcVnMNoYavmi2C4ydmBkWJk+4qYzGPdt776gKCgEEypNcqjYjSKt
         mK/A==
X-Gm-Message-State: AOAM5325/P09KwSftqsB9AjpEOKVfdPFpMMIgKDiIDS9b1odyIR+0dJL
        T/wbSmw5pyTjdh15j7B3wrShb8sE7KZPGVLcXKc=
X-Google-Smtp-Source: ABdhPJw0AMpRmI1zFTOHuehxHHn8AZdWi9FzbUBykmyZ1w/j7Rjw32Mx1RuAL2p+wihj2Y1Je++etttIOPSnN3B9SVM=
X-Received: by 2002:a05:6830:1af0:: with SMTP id c16mr25788038otd.16.1635360850599;
 Wed, 27 Oct 2021 11:54:10 -0700 (PDT)
MIME-Version: 1.0
References: <20211025094119.82967-1-hdegoede@redhat.com> <20211025094119.82967-3-hdegoede@redhat.com>
In-Reply-To: <20211025094119.82967-3-hdegoede@redhat.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Wed, 27 Oct 2021 20:53:59 +0200
Message-ID: <CAJZ5v0h2gaVxOKL0xnDpJiO2G3zvacTVbQajYaDBcXuxaoEjrg@mail.gmail.com>
Subject: Re: [PATCH v4 02/11] i2c: acpi: Use acpi_dev_ready_for_enumeration() helper
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
        linux-clk <linux-clk@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 25, 2021 at 11:42 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> The clk and regulator frameworks expect clk/regulator consumer-devices
> to have info about the consumed clks/regulators described in the device's
> fw_node.
>
> To work around cases where this info is not present in the firmware tables,
> which is often the case on x86/ACPI devices, both frameworks allow the
> provider-driver to attach info about consumers to the clks/regulators
> when registering these.
>
> This causes problems with the probe ordering wrt drivers for consumers
> of these clks/regulators. Since the lookups are only registered when the
> provider-driver binds, trying to get these clks/regulators before then
> results in a -ENOENT error for clks and a dummy regulator for regulators.
>
> To ensure the correct probe-ordering the ACPI core has code to defer the
> enumeration of consumers affected by this until the providers are ready.
>
> Call the new acpi_dev_ready_for_enumeration() helper to avoid
> enumerating / instantiating i2c-clients too early.
>
> Acked-by: Wolfram Sang <wsa@kernel.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

> ---
>  drivers/i2c/i2c-core-acpi.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
> index 546cc935e035..71eee5bc17ab 100644
> --- a/drivers/i2c/i2c-core-acpi.c
> +++ b/drivers/i2c/i2c-core-acpi.c
> @@ -144,9 +144,12 @@ static int i2c_acpi_do_lookup(struct acpi_device *adev,
>         struct list_head resource_list;
>         int ret;
>
> -       if (acpi_bus_get_status(adev) || !adev->status.present)
> +       if (acpi_bus_get_status(adev))
>                 return -EINVAL;
>
> +       if (!acpi_dev_ready_for_enumeration(adev))
> +               return -ENODEV;
> +
>         if (acpi_match_device_ids(adev, i2c_acpi_ignored_device_ids) == 0)
>                 return -ENODEV;
>
> --
> 2.31.1
>
