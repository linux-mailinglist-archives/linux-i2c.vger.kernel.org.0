Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCCF874228E
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Jun 2023 10:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232700AbjF2Iru convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 29 Jun 2023 04:47:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjF2Iq3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Jun 2023 04:46:29 -0400
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A9AB421F;
        Thu, 29 Jun 2023 01:45:10 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-98e2865e2f2so11642166b.0;
        Thu, 29 Jun 2023 01:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688028309; x=1690620309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQV/B8/KWUc2BaGmpDNvQXsd3Wxm+si1uyoZZsG9Zw8=;
        b=MYJyqoiwBCSWsx7F+DkN1DfdNSFzGGrRaiZWVYnrJATPS0b/fu+PVGzrHvnaJKWwuk
         nWGnH3HCQBCW7iFCZt6F3nPulEiB8R74gGrsgSFKDDLpn6TsY0vzblyqG+VYNyT2+uZQ
         kBYQ9kKMBpSQOZISNJk4r8OlFxcj+mx4Pq0xoMjO3KnVKt87GX0uFiE4nUhNLJXyQaSm
         YFAnIluHUnndQA4ShPX0p+bqEKIKwsDdSb5B+6Zr7Fj2c8wtpOl7Haj4/L24B7W1M5xQ
         ZgH2C0gE95V9j9SMWEQg/VeD0oHkrH2EVf2Zqgr/XiaZb0f7Z/N4iB/b6ppdGLgZcijh
         787A==
X-Gm-Message-State: AC+VfDwMo9qScHn3TUudJ1OTJL2CtIcOsCS7qlIQXdfblZsJA8nOZNpm
        7Ry39Z9tW+F+EP1zTYpVtOKH5XIsHJp3+y8Nszs=
X-Google-Smtp-Source: ACHHUZ6ezk5byYRbTuIcDirr8/AY4Y7IHclWXpgCNjDnZf54x7WPrf9fm4//5L7ifiizeZMUIceXA4Yyf6CO77lwyC0=
X-Received: by 2002:a17:906:1d4:b0:974:5480:6270 with SMTP id
 20-20020a17090601d400b0097454806270mr1755547ejj.0.1688028308639; Thu, 29 Jun
 2023 01:45:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230626110026.65825-1-andriy.shevchenko@linux.intel.com> <20230626110026.65825-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230626110026.65825-3-andriy.shevchenko@linux.intel.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Thu, 29 Jun 2023 10:44:57 +0200
Message-ID: <CAJZ5v0jDO_ktnqg-2+iUt0UFRE-zYHdLHjWL3QfVD5syLF+d+w@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] ACPI: bus: Introduce acpi_match_acpi_device() helper
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
> In some cases we can't have a physical node associated with
> the ACPI device. Yet we want to match it against ID table and
> get respective driver data. Introduce the helper for that.

I think that the problem is really to find a struct acpi_device_id in
a given list matching a given struct acpi_device.

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/acpi/bus.c   | 15 +++++++++++----
>  include/linux/acpi.h |  9 +++++++++
>  2 files changed, 20 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
> index 20cdfb37da79..ee88bfb60ac2 100644
> --- a/drivers/acpi/bus.c
> +++ b/drivers/acpi/bus.c
> @@ -850,6 +850,16 @@ static bool __acpi_match_device(const struct acpi_device *device,
>         return true;
>  }
>
> +const struct acpi_device_id *acpi_match_acpi_device(const struct acpi_device_id *ids,
> +                                                   const struct acpi_device *adev)
> +{
> +       const struct acpi_device_id *id = NULL;
> +
> +       __acpi_match_device(adev, ids, NULL, &id, NULL);
> +       return id;
> +}
> +EXPORT_SYMBOL_GPL(acpi_match_acpi_device);

This is fine, but it requires a kerneldoc comment (as an exported function).

Of course, the code in scan.c can use it even if it is not exported.

> +
>  /**
>   * acpi_match_device - Match a struct device against a given list of ACPI IDs
>   * @ids: Array of struct acpi_device_id object to match against.
> @@ -864,10 +874,7 @@ static bool __acpi_match_device(const struct acpi_device *device,
>  const struct acpi_device_id *acpi_match_device(const struct acpi_device_id *ids,
>                                                const struct device *dev)
>  {
> -       const struct acpi_device_id *id = NULL;
> -
> -       __acpi_match_device(acpi_companion_match(dev), ids, NULL, &id, NULL);
> -       return id;
> +       return acpi_match_acpi_device(ids, acpi_companion_match(dev));
>  }
>  EXPORT_SYMBOL_GPL(acpi_match_device);
>
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index 640f1c07c894..641dc4843987 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -707,6 +707,9 @@ extern int acpi_nvs_register(__u64 start, __u64 size);
>  extern int acpi_nvs_for_each_region(int (*func)(__u64, __u64, void *),
>                                     void *data);
>
> +const struct acpi_device_id *acpi_match_acpi_device(const struct acpi_device_id *ids,
> +                                                   const struct acpi_device *adev);
> +
>  const struct acpi_device_id *acpi_match_device(const struct acpi_device_id *ids,
>                                                const struct device *dev);
>
> @@ -922,6 +925,12 @@ static inline int acpi_nvs_for_each_region(int (*func)(__u64, __u64, void *),
>
>  struct acpi_device_id;
>
> +static inline const struct acpi_device_id *acpi_match_acpi_device(
> +       const struct acpi_device_id *ids, const struct acpi_device *adev)
> +{
> +       return NULL;
> +}
> +
>  static inline const struct acpi_device_id *acpi_match_device(
>         const struct acpi_device_id *ids, const struct device *dev)
>  {
> --
> 2.40.0.1.gaa8946217a0b
>
