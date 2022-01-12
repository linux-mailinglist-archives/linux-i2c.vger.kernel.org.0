Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBE0248C797
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jan 2022 16:50:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354793AbiALPuZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jan 2022 10:50:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354854AbiALPuH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Jan 2022 10:50:07 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA8EFC06173F;
        Wed, 12 Jan 2022 07:50:06 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id m4so11576791edb.10;
        Wed, 12 Jan 2022 07:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TFgnthO3d7FtM/wAdBTZ92v0qtPDXktX81ZqG9bJ8fQ=;
        b=oHnNrjevdOSf7DCrODGMrKZepHOtsK8oes2SyeUHeIt+wfP9iycEkNz1RsQGaRJrac
         HogSgaWGQC0QrF8YPXmJ1GPRxJ56iWijWV7acvSETdim6p80qAVMvQwY80Xc+QCbxX7S
         jn4X5Zd5SUF9rbltiPTehuSakvsgvoVBWIDB0Yfo19KYgBRN44GQM+C3FJgshYMBJEXO
         jfnj649uZYEypaHs/XGOImVZC2jt5/8pKe6FlKNILwda6cjJY7xXaK2Mdu/5oDm4Zgjf
         z7wcnuffcY0MRR2i6v0/tjQguZRLIfg7NvFSKmT+4HzC5uvzzA4J2LnTTiyViSvkNWc8
         EZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TFgnthO3d7FtM/wAdBTZ92v0qtPDXktX81ZqG9bJ8fQ=;
        b=EmX/PycxocwlamQxh4mE3C48mcHm8zhIo9W1/cg9yGpPJTZm+SNPwNMcNfjmxjbFMq
         ATCnQiKBNOYUdtJWnKrqzHkQSi1AKS1gbxqIpi3xv8j13kXutSMIkqanxLSJcA7AA0BK
         1hQDuSFkvxEt1g9jJXmrJJ1KhTnYYQwJHUcP6iDeSxKbXWdWwc5uFPwmYIbGO1hhYgK9
         S3UWCCwdxcYiKjmpLcAaCh+ZXhPzZucMUrtqjQuzTnthOy7vEFjXh14NNNGI22lFu8yG
         ROoNX7tUt9kMyBwT/BtFWtlTZs+6YQNJdvQKAM6foARs4bTNFI8t+wOioHIvu0J+yNnA
         RIfg==
X-Gm-Message-State: AOAM531zO2Lu5pkeoCrS1vgwnKAR2ej5sMWgxmhwPc+WWPRdhijDo/JU
        KiOD9ank/W+SbxYNb+3yj1WjcdUD6yD6d+0tu5LXEfniveqcAQ==
X-Google-Smtp-Source: ABdhPJzFVjXJLI/i85mTVwe5RLCXGOeh2iqt8RVc5alU8UFqmMzCpW8UorxBo0fdR0maPO19R/4OcBSn4B8y+jSYA18=
X-Received: by 2002:a05:6402:4301:: with SMTP id m1mr225773edc.125.1642002605272;
 Wed, 12 Jan 2022 07:50:05 -0800 (PST)
MIME-Version: 1.0
References: <1641996862-26960-1-git-send-email-akhilrajeev@nvidia.com> <1641996862-26960-3-git-send-email-akhilrajeev@nvidia.com>
In-Reply-To: <1641996862-26960-3-git-send-email-akhilrajeev@nvidia.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 12 Jan 2022 17:48:18 +0200
Message-ID: <CAHp75VewfGiRuT4iBLWZ3YQZdmLfgGGPX180quVZu_NVjz7-cQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] docs: firmware-guide: ACPI: Add named interrupt doc
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     Christian Koenig <christian.koenig@amd.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jan 12, 2022 at 4:15 PM Akhil R <akhilrajeev@nvidia.com> wrote:

Thanks for doing this, very helpful! My comments below.

> Added details and example for named interrupts in the ACPI Table

Table.

...

> +Named Interrupts
> +================
> +
> +Drivers with ACPI node can have names to interrupts in ACPI table which
> +can be used to get the irq number in the driver.

IRQ

> +The interrupt name can be listed in _DSD as 'interrupt-names'. The names
> +should be listed as an array of strings which will map to the Interrupt
> +property in ACPI table corresponding to its index.

'Interrupt property' --> 'Interrupt() resource'

the ACPI

> +The table below shows an example of its usage::
> +
> +       Device (DEV0) {
> +               ...
> +               Name (_CRS, ResourceTemplate() {
> +                       ...
> +                       Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive) {
> +                               0x20,
> +                               0x24
> +                       }
> +               })
> +
> +               Name (_DSD, Package () {
> +                       ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
> +                       Package () {
> +                               Package () {"interrupt-names",
> +                                       Package (2) {"default", "alert"}},
> +                       }

                       Package () {
                               Package () {
                                        "interrupt-names", Package ()
{"default", "alert"}
                               },
                       }

> +                       ...
> +               })
> +       }

Please, drop the indentation to just 4 spaces.

> +The interrupt name 'default' will correspond to 0x20 in Interrupt property

Interrupt() resource

> +and 'alert' to 0x24.
> +
> +The driver can call the function - device_irq_get_byname with the device

device_irq_get_byname()

> +and interrupt name as arguments to get the corresponding irq number.

IRQ

-- 
With Best Regards,
Andy Shevchenko
