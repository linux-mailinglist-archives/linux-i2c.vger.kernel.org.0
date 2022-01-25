Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 657F449BAC1
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jan 2022 18:58:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245122AbiAYR4l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jan 2022 12:56:41 -0500
Received: from mail-yb1-f182.google.com ([209.85.219.182]:40758 "EHLO
        mail-yb1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357539AbiAYRzC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jan 2022 12:55:02 -0500
Received: by mail-yb1-f182.google.com with SMTP id 23so63924631ybf.7;
        Tue, 25 Jan 2022 09:54:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y+R3o3okOUEIZN8/dDxsGECLwf9ITaDap15PmIOOEJw=;
        b=tsaGoOSmVk7vaXbB33hs4k9q3BbeTHUtBXwyeQUuY62ng6sjhay1Kb4Lkgq/AUAgN+
         6qPdLnFELJywM6E1EE3SVz6+TRd+7bnuB0tpov/WrsG3Svjy7GrVu8HZ/CbIDGP+QNJe
         oQEbuXHgOXLaHVLD24h2Y9Y/kXEefHWPXYT5bsrULtvYDNCfjkm3GDoPUe8hDayhTVVO
         Kz9Ms1OfHUy3KbMJp18jW8fgRMT87MzcCpM93IUAuBEeSiuySK97rE0ZoYdf+6HoURyf
         NGnh9UrhQrCFuOxTSDngSUEDDCzYrcrpIda+jjDv+UFSx1suftZpy/p6ntJvcZR8tCCq
         RDoQ==
X-Gm-Message-State: AOAM530pDc2Zout0EHUtZV5IwPRSuSgNf6aZjx1i3U89GfCmC64SQrv0
        5jnhfKkCY70mzNNEEnxmMQt4tbgQ+yC8QKXnGf0=
X-Google-Smtp-Source: ABdhPJx+RSxvIz+QTS29NNZlNto0r/PEcq1x9Ah2IeEOnqDbQuwUZ7x2ZQ/2bvu5VBLp3XyWBQoxhvNKmB0ZgYbANKg=
X-Received: by 2002:a25:1bd5:: with SMTP id b204mr34517304ybb.552.1643133297390;
 Tue, 25 Jan 2022 09:54:57 -0800 (PST)
MIME-Version: 1.0
References: <1642851166-27096-1-git-send-email-akhilrajeev@nvidia.com> <1642851166-27096-3-git-send-email-akhilrajeev@nvidia.com>
In-Reply-To: <1642851166-27096-3-git-send-email-akhilrajeev@nvidia.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Tue, 25 Jan 2022 18:54:46 +0100
Message-ID: <CAJZ5v0gt+aDr_Te_mco_0CyRJAWgyeDKUb+dksfZz0mj91G0hw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] docs: firmware-guide: ACPI: Add named interrupt doc
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Jan 22, 2022 at 12:33 PM Akhil R <akhilrajeev@nvidia.com> wrote:
>
> Add a detailed example of the named interrupts in the ACPI table.
>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

> ---
>  Documentation/firmware-guide/acpi/enumeration.rst | 39 +++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>
> diff --git a/Documentation/firmware-guide/acpi/enumeration.rst b/Documentation/firmware-guide/acpi/enumeration.rst
> index 74b830b2..d002256 100644
> --- a/Documentation/firmware-guide/acpi/enumeration.rst
> +++ b/Documentation/firmware-guide/acpi/enumeration.rst
> @@ -143,6 +143,45 @@ In robust cases the client unfortunately needs to call
>  acpi_dma_request_slave_chan_by_index() directly and therefore choose the
>  specific FixedDMA resource by its index.
>
> +Named Interrupts
> +================
> +
> +Drivers enumerated via ACPI can have names to interrupts in the ACPI table
> +which can be used to get the IRQ number in the driver.
> +
> +The interrupt name can be listed in _DSD as 'interrupt-names'. The names
> +should be listed as an array of strings which will map to the Interrupt()
> +resource in the ACPI table corresponding to its index.
> +
> +The table below shows an example of its usage::
> +
> +    Device (DEV0) {
> +        ...
> +        Name (_CRS, ResourceTemplate() {
> +            ...
> +            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive) {
> +                0x20,
> +                0x24
> +            }
> +        })
> +
> +        Name (_DSD, Package () {
> +            ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
> +            Package () {
> +                Package () {"interrupt-names",
> +                Package (2) {"default", "alert"}},
> +            }
> +        ...
> +        })
> +    }
> +
> +The interrupt name 'default' will correspond to 0x20 in Interrupt()
> +resource and 'alert' to 0x24. Note that only the Interrupt() resource
> +is mapped and not GpioInt() or similar.
> +
> +The driver can call the function - fwnode_irq_get_byname() with the fwnode
> +and interrupt name as arguments to get the corresponding IRQ number.
> +
>  SPI serial bus support
>  ======================
>
> --
> 2.7.4
>
