Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 835262FB9AD
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Jan 2021 15:37:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392067AbhASOgu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Jan 2021 09:36:50 -0500
Received: from mail-ot1-f44.google.com ([209.85.210.44]:38261 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390548AbhASNQU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Jan 2021 08:16:20 -0500
Received: by mail-ot1-f44.google.com with SMTP id 34so8870534otd.5;
        Tue, 19 Jan 2021 05:15:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wxvsvsxyrpOZ/oY0spXlDXsPyT4qu420p3DmEnH6sfU=;
        b=C7wqhDP881vKuRJx4NtLfuZjZGmBJsIQrLDCx47XV0OF/4dM5uoX6p/JUIDHW0vV77
         VwsHE2cg70S6Nncx0BxDd4cD94/YhBJFE5B7rh+OVogNaSxiZM8U5CVQ+yAZb4EOicK/
         i1hnEvBoNigSBeb12JDfGHd9iQu+Ej77JxDUF4xj6LOAEHseSgYYEMJQm+JjCio0+O5G
         9GNCW0mqaAVvx19o9z+vX2NX9K1W6wWyqXuKIaQNtXmdKtc9e9SMg4zCk9vVZrADlYwo
         P2Z7YfKKEzzaD9V8oN/X39MaJ7L1X3ILBmGM+ZdLljJAt9he7jzr4iNADjbKe8DVhZZZ
         88Bw==
X-Gm-Message-State: AOAM532jeKNkUBYdvL1O4Sglw2i3wVayK5VcspLs2DGDZzt2T0rfeE3J
        IRE4mauSJ5Jr/104mmPWg+rug9mLlnKH5VuCKbdJHncX
X-Google-Smtp-Source: ABdhPJwCehh3k/IMteXxnwOxWa37biw3gKZKIYGKKmoFB1cZ9WYyVmZ60RkecMm29B8DPoHIR9VSqGcKux2VkA0z8VU=
X-Received: by 2002:a9d:1710:: with SMTP id i16mr3359773ota.260.1611062133927;
 Tue, 19 Jan 2021 05:15:33 -0800 (PST)
MIME-Version: 1.0
References: <20210118003428.568892-1-djrscally@gmail.com> <20210118003428.568892-3-djrscally@gmail.com>
 <CAJZ5v0gVQsZ4rxXW8uMidW9zfY_S50zpfrL-Gq0J3Z4-qqBiww@mail.gmail.com> <b381b48e-1bf2-f3e7-10a6-e51cd261f43c@gmail.com>
In-Reply-To: <b381b48e-1bf2-f3e7-10a6-e51cd261f43c@gmail.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Tue, 19 Jan 2021 14:15:21 +0100
Message-ID: <CAJZ5v0iU2m4Hs6APuauQ645DwbjYaB8nJFjYH0+7yQnR-FPZBQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] acpi: utils: Add function to fetch dependent acpi_devices
To:     Daniel Scally <djrscally@gmail.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 18, 2021 at 9:51 PM Daniel Scally <djrscally@gmail.com> wrote:
>
> On 18/01/2021 16:14, Rafael J. Wysocki wrote:
> > On Mon, Jan 18, 2021 at 1:37 AM Daniel Scally <djrscally@gmail.com> wrote:
> >> In some ACPI tables we encounter, devices use the _DEP method to assert
> >> a dependence on other ACPI devices as opposed to the OpRegions that the
> >> specification intends. We need to be able to find those devices "from"
> >> the dependee, so add a function to parse all ACPI Devices and check if
> >> the include the handle of the dependee device in their _DEP buffer.
> > What exactly do you need this for?
>
> So, in our DSDT we have devices with _HID INT3472, plus sensors which
> refer to those INT3472's in their _DEP method. The driver binds to the
> INT3472 device, we need to find the sensors dependent on them.
>

Well, this is an interesting concept. :-)

Why does _DEP need to be used for that?  Isn't there any other way to
look up the dependent sensors?

>
> > Would it be practical to look up the suppliers in acpi_dep_list instead?
> >
> > Note that supplier drivers may remove entries from there, but does
> > that matter for your use case?
>
> Ah - that may work, yes. Thank you, let me test that.

Even if that doesn't work right away, but it can be made work, I would
very much prefer that to the driver parsing _DEP for every device in
the namespace by itself.
