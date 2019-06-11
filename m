Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B0F43D08F
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2019 17:17:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727867AbfFKPRL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jun 2019 11:17:11 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:47063 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727748AbfFKPRL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Jun 2019 11:17:11 -0400
Received: by mail-qt1-f195.google.com with SMTP id h21so14934103qtn.13
        for <linux-i2c@vger.kernel.org>; Tue, 11 Jun 2019 08:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P8EQNdlfEKMSd2en3pkgledmujjaJiojIo3h1kmvnOQ=;
        b=f9/1EaKVoy3hOiqinWESsBpB40GD7+aj8CSCy70NeXATwnkYSYp3v1SitYHzcQFOCN
         XHizrzXE6y0iZvFxqr+190Oo6Oh5gq+yNpjZeewsUbpwH5OIDScV5UoVAXkgf8lMtLNT
         684sNruyqlziUd8dGtyhc5yM1DaVnRQ8gDqiipXccD4pxxNS4LY00TQWK8SHvdeSostP
         +Q2I1Qysj/U6EiDPr1gWoNdkjTvK8Po4Gx5lAnrWOJ/4zE9aCylD5fQsiUwPP3tyYAsr
         M+itsIhIA7kCkodzvx84U7kQ68RVhUBzXpyZC91a/b9qNfK/nlSIxu1I6jvOFI7GfZR4
         aEwA==
X-Gm-Message-State: APjAAAXyrvW3X+qxpzg04yPJg7VBhhHR1tzX66cHyAkbyw2kf/r4QhXG
        Tlw74CtevfkvwVbv2blVwYAkAeYe1KPwMnv2QPxnCkGNJcIvNQ==
X-Google-Smtp-Source: APXvYqxTwhCXjUiYOLjzsXDsnhv8C1o60LWTFhRLJ28dtwbw6MnKs2gpVUwymuiiAZ8b1O+X+RMvu9It7qiwHlxTQk8=
X-Received: by 2002:ac8:2998:: with SMTP id 24mr62676416qts.31.1560266230100;
 Tue, 11 Jun 2019 08:17:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190611123101.25264-1-ckeepax@opensource.cirrus.com>
In-Reply-To: <20190611123101.25264-1-ckeepax@opensource.cirrus.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 11 Jun 2019 17:16:58 +0200
Message-ID: <CAO-hwJ+qSXwZ-5sAiZ55-r_PXp9pvnE1XEaE_v3SBnxzQQNH4g@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] I2C IRQ Probe Improvements
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, mika.westerberg@linux.intel.com,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        linux-acpi@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
        Jim Broadus <jbroadus@gmail.com>, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jun 11, 2019 at 2:31 PM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> This series attempts to align as much IRQ handling into the
> probe path as possible. Note that I don't have a great setup
> for testing these patches so they are mostly just build tested
> and need careful review and testing before any of them are
> merged.
>
> The series brings the ACPI path inline with the way the device
> tree path handles the IRQ entirely at probe time. However,
> it still leaves any IRQ specified through the board_info as
> being handled at device time. In that case we need to cache
> something from the board_info until probe time, which leaves
> any alternative solution with something basically the same as
> the current handling although perhaps caching more stuff.

Hmm, I still haven't pinpointed the issue, but I wanted to give a test
of the series and I have:
[    5.511806] i2c_hid i2c-DLL075B:01: HID over i2c has not been
provided an Int IRQ
[    5.511825] i2c_hid: probe of i2c-DLL075B:01 failed with error -22

So it seems that there is something wrong happening when fetching the
IRQ and providing it to i2c-hid.

That was on a Dell XPS 9360.

Bisecting is starting.

Cheers,
Benjamin

>
> Thanks,
> Charles
>
> See previous discussions:
>  - https://lkml.org/lkml/2019/2/15/989
>  - https://www.spinics.net/lists/linux-i2c/msg39541.html
>
> Charles Keepax (7):
>   i2c: core: Allow whole core to use i2c_dev_irq_from_resources
>   i2c: acpi: Use available IRQ helper functions
>   i2c: acpi: Factor out getting the IRQ from ACPI
>   i2c: core: Make i2c_acpi_get_irq available to the rest of the I2C core
>   i2c: core: Move ACPI IRQ handling to probe time
>   i2c: core: Move ACPI gpio IRQ handling into i2c_acpi_get_irq
>   i2c: core: Tidy up handling of init_irq
>
>  drivers/i2c/i2c-core-acpi.c | 58 ++++++++++++++++++++++++++++++++-------------
>  drivers/i2c/i2c-core-base.c | 11 +++++----
>  drivers/i2c/i2c-core.h      |  9 +++++++
>  3 files changed, 56 insertions(+), 22 deletions(-)
>
> --
> 2.11.0
>
