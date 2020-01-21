Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E50451441BB
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jan 2020 17:10:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729099AbgAUQJ4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 21 Jan 2020 11:09:56 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:35365 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726555AbgAUQJ4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Jan 2020 11:09:56 -0500
Received: by mail-oi1-f195.google.com with SMTP id k4so3065190oik.2;
        Tue, 21 Jan 2020 08:09:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WN3HnFcBCL605feigra+tO+syYiJ3DTCVagEeBtU1zE=;
        b=pY4OHNDSoG/gfHQ3/qw2TD+J856e/Wn44+XpHnemeKDgaqkXMcwLSOtQ/dpIvDDDca
         ERFtnEP2fx44/QU3K0VQvPC1AM5mBMLxQwaohYKuwtPm78pLPTFFE7q1isROpOp5nvKX
         30IJDN4D7g5xCuhD/UXfW7+qd+SwFinlxl1sOwij2CzNDZ7kExlbameD0U4iPzDGDYry
         pDlenB/+gaWWHCOQZsATobEKXhPrWRxwtk9q28HODwy+Lt4UzU4L8l7b9PYe3MYIOoLn
         sxwfB5YT0JZ00Bb+OxS/LGNO5by2al81nCcgouhVrV97lQ2UIsx4bXvihBrvvlW7ih63
         srww==
X-Gm-Message-State: APjAAAV8FBC5bdbZdbGgMK6GzfMvm5p8vYbVAPY4LMPHvmz9gaJ9HLik
        8/1mvUZNIKYmRtVcui17jM2oHr/WXj36wql+yhU=
X-Google-Smtp-Source: APXvYqyFb+SVqk9VpuQeRnX96Fhq2Tj/z5ocFPbgiTRYbyNkL8iXSmsSj+ocij4JKF0ClJaAcyrt26a2HU5ddNAJ9aE=
X-Received: by 2002:a54:4e96:: with SMTP id c22mr3615375oiy.110.1579622995229;
 Tue, 21 Jan 2020 08:09:55 -0800 (PST)
MIME-Version: 1.0
References: <20200121134157.20396-1-sakari.ailus@linux.intel.com> <20200121134157.20396-7-sakari.ailus@linux.intel.com>
In-Reply-To: <20200121134157.20396-7-sakari.ailus@linux.intel.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Tue, 21 Jan 2020 17:09:44 +0100
Message-ID: <CAJZ5v0iJXUjK0n7mkqxagX9FtOmMsLqVMmU2xpQOLSb0aBWSMA@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] Documentation: ACPI: Document probe-low-power _DSD property
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        Tomasz Figa <tfiga@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jan 21, 2020 at 2:41 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Document the probe-low-power _DSD property and how it is used with I²C
> drivers.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../acpi/dsd/probe-low-power.rst              | 28 +++++++++++++++++++
>  Documentation/firmware-guide/acpi/index.rst   |  1 +
>  2 files changed, 29 insertions(+)
>  create mode 100644 Documentation/firmware-guide/acpi/dsd/probe-low-power.rst
>
> diff --git a/Documentation/firmware-guide/acpi/dsd/probe-low-power.rst b/Documentation/firmware-guide/acpi/dsd/probe-low-power.rst
> new file mode 100644
> index 0000000000000..e0343ffefe071
> --- /dev/null
> +++ b/Documentation/firmware-guide/acpi/dsd/probe-low-power.rst
> @@ -0,0 +1,28 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +======================================
> +Probing I²C devices in low power state
> +======================================
> +
> +Introduction
> +============
> +
> +In some cases it may be preferred to leave certain devices powered off for
> +the entire system bootup if powering on these devices has adverse side
> +effects, beyond just powering on the said device. The _DSD property
> +"probe-low-power" has been defined for this purpose.

Well, if you say "has been defined", you need to provide a pointer to
the definition document (a specification of some sort or similar).

> +
> +How it works
> +============
> +
> +The property "probe-low-power" boolean property may be used to tell Linux
> +that the I²C framework should instruct the kernel ACPI framework to leave
> +the device in the low power state. If the driver indicates its support for
> +this in its struct i2c_driver.probe_low_power field and the
> +"probe-low-power" property is present, the device will not be powered on
> +for probe.
> +
> +The downside is that as the device is not powered on, even if there's a
> +problem with the device, the driver likely probes just fine but the first
> +user will find out the device doesn't work, instead of a failure at probe
> +time. This feature should thus be used sparingly.
> diff --git a/Documentation/firmware-guide/acpi/index.rst b/Documentation/firmware-guide/acpi/index.rst
> index ad3b5afdae77e..4e4ac675c0ff8 100644
> --- a/Documentation/firmware-guide/acpi/index.rst
> +++ b/Documentation/firmware-guide/acpi/index.rst
> @@ -11,6 +11,7 @@ ACPI Support
>     dsd/graph
>     dsd/data-node-references
>     dsd/leds
> +   dsd/probe-low-power
>     enumeration
>     osi
>     method-customizing
> --
> 2.20.1
>
