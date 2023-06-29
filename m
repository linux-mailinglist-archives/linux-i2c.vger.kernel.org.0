Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63E0B7422A0
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Jun 2023 10:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232555AbjF2Iv1 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 29 Jun 2023 04:51:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233165AbjF2Iu7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Jun 2023 04:50:59 -0400
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 830E93A91;
        Thu, 29 Jun 2023 01:49:30 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-991f9148334so12725166b.1;
        Thu, 29 Jun 2023 01:49:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688028569; x=1690620569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zXyMfRHiL1jzRvsSV8HdmQH0P5MA6wvw18jFEiSEx6Y=;
        b=ZMHyk4N+jab0F8DnrXu3pgj82jEDe6lHgDloF/AQQPbiCN6gZVMv868KyI+eg9Isc3
         HME9Das80gAZ6JHShlfu0SqVqoNNYxZIfxpI9qO80HTjQ8RwyYkRpLo8ggHcnGRnHHZ5
         fkPRhVOMltYH272tHXg/tabOvMaO9+b3ffpLT610XlRkFo+oGa8fRrbABCjdqaGTaGAG
         GnzVNQ1h8MTMwLmiurxiqxUI8Z+j5M9lyaqINYIVMvsWPqhbsO5H9594oIQm/CFKWhSg
         rwVJnmwRe+z72CzvkdZElSmcT69Ujdur0XJK2/j+n4TIEC4VM4U2QqaUPx8KLv2P8QCs
         D7kA==
X-Gm-Message-State: AC+VfDxqSa1z/76y1q4EQeanc/UEBg7SvCsPoiNrdvQ4VSf3JAIe7HSY
        YYm+FxchPYtL6mAsjPJxog9ILXi2G8r0VnwndzA=
X-Google-Smtp-Source: ACHHUZ7CxUdboIQICDiuTuZoiV5gIetxxMRGMMtz7BmRzvh0vX+WEHnwK6TRiLwZKuVWrZY3jiClssh6AfH5UMEg1jY=
X-Received: by 2002:a17:906:73dd:b0:989:1ed3:d00b with SMTP id
 n29-20020a17090673dd00b009891ed3d00bmr20540813ejl.4.1688028568798; Thu, 29
 Jun 2023 01:49:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230626110026.65825-1-andriy.shevchenko@linux.intel.com> <20230626110026.65825-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230626110026.65825-2-andriy.shevchenko@linux.intel.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Thu, 29 Jun 2023 10:49:17 +0200
Message-ID: <CAJZ5v0jqP0N3=TB3w+HMwGMzctpRCjKa3a5iHKePP113T3CK-g@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] ACPI: bus: Constify acpi_companion_match()
 returned value
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, acpica-devel@lists.linuxfoundation.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Robert Moore <robert.moore@intel.com>,
        Michael Walle <michael@walle.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 26, 2023 at 1:00 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> acpi_companion_match() doesn't alter the contents of the passed
> parameter, so we don't expect that returned value can be altered
> either. So constify it.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This makes sense even without the rest of the series, so I can queue
it up right away if you want me to do that.

> ---
>  drivers/acpi/bus.c          | 6 +++---
>  drivers/acpi/device_sysfs.c | 2 +-
>  drivers/acpi/internal.h     | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
> index e3e0bd0c5a50..20cdfb37da79 100644
> --- a/drivers/acpi/bus.c
> +++ b/drivers/acpi/bus.c
> @@ -682,7 +682,7 @@ bool acpi_device_is_first_physical_node(struct acpi_device *adev,
>   * resources available from it but they will be matched normally using functions
>   * provided by their bus types (and analogously for their modalias).
>   */
> -struct acpi_device *acpi_companion_match(const struct device *dev)
> +const struct acpi_device *acpi_companion_match(const struct device *dev)
>  {
>         struct acpi_device *adev;
>
> @@ -706,7 +706,7 @@ struct acpi_device *acpi_companion_match(const struct device *dev)
>   * identifiers and a _DSD object with the "compatible" property, use that
>   * property to match against the given list of identifiers.
>   */
> -static bool acpi_of_match_device(struct acpi_device *adev,
> +static bool acpi_of_match_device(const struct acpi_device *adev,
>                                  const struct of_device_id *of_match_table,
>                                  const struct of_device_id **of_id)
>  {
> @@ -808,7 +808,7 @@ static bool __acpi_match_device_cls(const struct acpi_device_id *id,
>         return true;
>  }
>
> -static bool __acpi_match_device(struct acpi_device *device,
> +static bool __acpi_match_device(const struct acpi_device *device,
>                                 const struct acpi_device_id *acpi_ids,
>                                 const struct of_device_id *of_ids,
>                                 const struct acpi_device_id **acpi_id,
> diff --git a/drivers/acpi/device_sysfs.c b/drivers/acpi/device_sysfs.c
> index 0fbfbaa8d8e3..b9bbf0746199 100644
> --- a/drivers/acpi/device_sysfs.c
> +++ b/drivers/acpi/device_sysfs.c
> @@ -283,7 +283,7 @@ int acpi_device_uevent_modalias(const struct device *dev, struct kobj_uevent_env
>  }
>  EXPORT_SYMBOL_GPL(acpi_device_uevent_modalias);
>
> -static int __acpi_device_modalias(struct acpi_device *adev, char *buf, int size)
> +static int __acpi_device_modalias(const struct acpi_device *adev, char *buf, int size)
>  {
>         int len, count;
>
> diff --git a/drivers/acpi/internal.h b/drivers/acpi/internal.h
> index 50dcb35c9965..f4148dc50b9c 100644
> --- a/drivers/acpi/internal.h
> +++ b/drivers/acpi/internal.h
> @@ -121,7 +121,7 @@ int acpi_bus_register_early_device(int type);
>  /* --------------------------------------------------------------------------
>                       Device Matching and Notification
>     -------------------------------------------------------------------------- */
> -struct acpi_device *acpi_companion_match(const struct device *dev);
> +const struct acpi_device *acpi_companion_match(const struct device *dev);
>  int __acpi_device_uevent_modalias(const struct acpi_device *adev,
>                                   struct kobj_uevent_env *env);
>
> --
> 2.40.0.1.gaa8946217a0b
>
