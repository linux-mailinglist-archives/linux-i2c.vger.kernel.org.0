Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F214849FC42
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jan 2022 15:58:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245162AbiA1O6z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jan 2022 09:58:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232277AbiA1O6z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Jan 2022 09:58:55 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27DFDC06173B
        for <linux-i2c@vger.kernel.org>; Fri, 28 Jan 2022 06:58:55 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id b15so6150891plg.3
        for <linux-i2c@vger.kernel.org>; Fri, 28 Jan 2022 06:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KHGm27mRNAvmdz8X1HGEOFhtT+fnoAeLqf/TbX8jecs=;
        b=QX96t5uexOK585+jsEWZcsn9OlOppUJtIL9dCbdq90ZkD6G/9EK7dl6ftkdDLv3SJ4
         297H8HUCpS2thXv3WKzXQL3oq7nyvVTZZMw0b3gNjn0YSYt854ImR+jeHYxWHlR1eXUC
         UPN1WJmL9qha17aftZUm790Ha3WN4wsQsSQSUTD5CU5L5AD+c3Q1WVqdEQoowep4o8i5
         gnPVhkh1qy44EHNatFuSaiLTDv4QW6KRwOSd3IX9gTJXcYKaHbrTVpkJKWwcqgSTj9JS
         7WbK+BbgOY+JGFEBdbxRzB/qC8aljsrCaL8wXzRLdMU8RqnVEnWw6ahz3L1Ny6c5klRg
         eN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KHGm27mRNAvmdz8X1HGEOFhtT+fnoAeLqf/TbX8jecs=;
        b=vA2zgSBwO8KteWMilHxwWIyqhFSpI2VB9B4S6VxOLDdrgVF0Jra5E33iwNKUMJ6uDM
         ElZpPPZTmf7lQAy/OXZnG9lXUmZy5PqjRBklXIRU07QC8NULmBLfR/k8iAZCXGhNZJmK
         1UPTFQ4Ay7u2yDEgMjx3J1ZJAr46anygVQ+an5wJWPUw7J7prq9IImd2rvmF/I8/BjFX
         gsa7g1R8tVE6+r6Lt6bvn3HeekVKXm4uu0cNvqJwxbc5BGd0zXso/iBueDsmU7zqS19x
         G4fDtdMdEkXNaJiL3M7rkapIYNx9dNwPqZyuvfba0PDIV7Pwjp/rnZQRxcnFsVaUG6Sz
         rGsw==
X-Gm-Message-State: AOAM530u0uYWccUZgV/yKjDqxXNvm12YxJFYxxw55u0ZBkGT5QVlUde1
        MLQ4IXQSwAxPgpd7NdMZ/2p/KLGpSCuQ/lw2aNC5jA==
X-Google-Smtp-Source: ABdhPJyoeuHdawWTX1fkovIXW+x8syaFep3Ntoh7Frv6h+Ux1STXcUY9n7FibfP1dz5lmL8j7eyJT0dQ+q10aFblEzE=
X-Received: by 2002:a17:902:d48a:: with SMTP id c10mr8691771plg.139.1643381934663;
 Fri, 28 Jan 2022 06:58:54 -0800 (PST)
MIME-Version: 1.0
References: <20220120001621.705352-2-jsd@semihalf.com> <20220128144811.783279-1-jsd@semihalf.com>
In-Reply-To: <20220128144811.783279-1-jsd@semihalf.com>
From:   =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Date:   Fri, 28 Jan 2022 15:58:43 +0100
Message-ID: <CAOtMz3OxWhgWqRYiPEdSmLWOChoy_UujxhW2358qZrGdtw+PPg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] i2c-designware: Add support for AMD PSP semaphore
To:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Wolfram Sang <wsa@kernel.org>,
        Raul E Rangel <rrangel@chromium.org>,
        Marcin Wojtas <mw@semihalf.com>,
        Grzegorz Jaszczyk <jaz@semihalf.com>, upstream@semihalf.com,
        Tom Lendacky <thomas.lendacky@amd.com>,
        "Deucher, Alexander" <alexander.deucher@amd.com>,
        "Easow, Nimesh" <Nimesh.Easow@amd.com>,
        "Limonciello, Mario" <mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Adding proper Andy's email address (and removing wrong one) in the
whole patchset. Sorry for noise!

Best Regards,
Jan


pt., 28 sty 2022 o 15:48 Jan Dabros <jsd@semihalf.com> napisa=C5=82(a):
>
> This patchset comprises support for new i2c-designware controller setup o=
n some
> AMD Cezanne SoCs, where x86 is sharing i2c bus with PSP. PSP uses the sam=
e
> controller and acts as an i2c arbitrator there (x86 is leasing bus from i=
t).
>
> First commit aims to improve generic i2c-designware code by adding extra =
locking
> on probe() and disable() paths. I would like to ask someone with access t=
o
> boards which use Intel BayTrail(CONFIG_I2C_DESIGNWARE_BAYTRAIL) to verify
> behavior of my changes on such setup.
>
> Second commit adds support for new PSP semaphore arbitration mechanism.
> Implementation is similar to the one from i2c-designware-baytrail.c howev=
er
> there are two main differences:
> 1) Add new ACPI ID in order to protect against silent binding of the old =
driver
> to the setup with PSP semaphore. Extra flag ARBITRATION_SEMAPHORE added t=
o this
> new _HID allows to recognize setup with PSP.
> 2) Beside acquire_lock() and release_lock() methods we are also applying =
quirks
> to the lock_bus() and unlock_bus() global adapter methods. With this in p=
lace
> all i2c clients drivers may lock i2c bus for a desired number of i2c
> transactions (e.g. write-wait-read) without being aware of that such bus =
is
> shared with another entity.
>
> This patchset is a follow-up to the RFC sent earlier on LKML [1], with re=
view
> comments applied.
>
> Looking forward to some feedback.
>
> [1] https://lkml.org/lkml/2021/12/22/219
>
> v1 -> v2:
> * Remove usage of unions
> * Get rid of unnecessary __packed attributes
> * Switch to use iopoll.h and bitfields.h APIs were applicable
> * Follow the convention to check for the error first
> * Reorder entries (includes, table entries) alphabetically
> * Add necessary includes
> * Add Kconfig dependency on X86_64
> (above two fixes for "kernel test robot <lkp@intel.com>" issues)
> * Modify probe() to use terminating entry for traversing through table
>   instead of ARRAY_SIZE
> * Fix typos in comments
> * Rebase patchset
>
> Jan Dabros (2):
>   i2c: designware: Add missing locks
>   i2c: designware: Add AMD PSP I2C bus support
>
>  MAINTAINERS                                  |   1 +
>  drivers/acpi/acpi_apd.c                      |   7 +-
>  drivers/i2c/busses/Kconfig                   |  11 +
>  drivers/i2c/busses/Makefile                  |   1 +
>  drivers/i2c/busses/i2c-designware-amdpsp.c   | 373 +++++++++++++++++++
>  drivers/i2c/busses/i2c-designware-baytrail.c |  10 +-
>  drivers/i2c/busses/i2c-designware-common.c   |  12 +
>  drivers/i2c/busses/i2c-designware-core.h     |  18 +-
>  drivers/i2c/busses/i2c-designware-master.c   |   6 +
>  drivers/i2c/busses/i2c-designware-platdrv.c  |  61 +++
>  10 files changed, 489 insertions(+), 11 deletions(-)
>  create mode 100644 drivers/i2c/busses/i2c-designware-amdpsp.c
>
> --
> 2.35.0.rc0.227.g00780c9af4-goog
>
