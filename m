Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2882942C7CB
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Oct 2021 19:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230488AbhJMRl5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Oct 2021 13:41:57 -0400
Received: from mail-ot1-f44.google.com ([209.85.210.44]:36753 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbhJMRl4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Oct 2021 13:41:56 -0400
Received: by mail-ot1-f44.google.com with SMTP id p6-20020a9d7446000000b0054e6bb223f3so4727525otk.3;
        Wed, 13 Oct 2021 10:39:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b4kDTrwLJFhbJUtgSMv9e6E8tfp7/gGalPU4LhmCAqg=;
        b=dO/7/YKbr6n2c4QMLFhu3PbooDTS4fvUqo/b5gk8Xi0Lanj3b8Y9OeJYkJPQEPBI/D
         kV+lCpKPp6h0nmBDpnk0JevK2mqx64CLBetWUbKkoKg5reh38K2tFAe7M7DKaldRXo6s
         sCeF6Zzo1Yc6FX+Tbmizum0ertRuQOKIu78mTPb4n8K+WmIJOWzdeeFrKmpciTcM+6om
         pu/kZPPvyTywsweUjPOnAvhAx9Pggr8bifi6yV5As7vHRi4lWml9MnHjPOUyk+ir+0dl
         7fCtXan2ZLOhn1Fw7PNtCktJLxKM03lIp5CY4SQGNqAD3/1hQOv5d5ixKprS2aV5p6SC
         /A8w==
X-Gm-Message-State: AOAM5301mQkl8S7IBAT6jJMY/XcJ10AtNXim/qmvundLo2w9xCk+afOA
        KdaDntA+FHCXOWtMg5mZv8/hnQdHk3LEK20VkSqTBGfb
X-Google-Smtp-Source: ABdhPJztUmBjMseKDFXZQwK8hfLr2SrbEuicbMY/t5ZrYfHIjdUf+gnWa9YYYP6Dms5OmHK0nP+gXbLxR6gOK8sUgQQ=
X-Received: by 2002:a9d:2f24:: with SMTP id h33mr496079otb.254.1634146792326;
 Wed, 13 Oct 2021 10:39:52 -0700 (PDT)
MIME-Version: 1.0
References: <20211010185707.195883-1-hdegoede@redhat.com> <20211010185707.195883-3-hdegoede@redhat.com>
In-Reply-To: <20211010185707.195883-3-hdegoede@redhat.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Wed, 13 Oct 2021 19:39:41 +0200
Message-ID: <CAJZ5v0gBALWzpdmy1H3FLqFLqf3wXyVQwFRz99PJo06x53dHcQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/11] i2c: acpi: Use acpi_dev_ready_for_enumeration() helper
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
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Oct 10, 2021 at 8:57 PM Hans de Goede <hdegoede@redhat.com> wrote:
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
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/i2c/i2c-core-acpi.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
> index aaeeacc12121..688cc71d650d 100644
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

I kind of prefer combining checks that cause the same error code to be
returned, but this is fine with me too.
