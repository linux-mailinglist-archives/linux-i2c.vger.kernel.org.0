Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 117D11555D3
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Feb 2020 11:36:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgBGKgN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Feb 2020 05:36:13 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:32945 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726827AbgBGKgN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Feb 2020 05:36:13 -0500
Received: by mail-ot1-f68.google.com with SMTP id b18so1739452otp.0;
        Fri, 07 Feb 2020 02:36:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=Ke+WNyb6rR3WzEL9YKuJlioft1ziahQrUrNAPPji+7w=;
        b=eDmpHvYummr6HEzV8GQ2km7mCZsnvkHoFhw7vdxIUGUTF86+Gl1OtBNU/chmmTQnor
         /XBK7kiuzrN7OkdTG4BSkKfeYq0hkI5ytKYix/HzMHR3jwU9w8cloBcYuqMW90ndD8q6
         UNLOBN3gGWI3rLsraZzihR6PB2rAnh1TILG6FOItzQDP40xbJNWvE4hMedT++6nnbbJJ
         yoTsUHAO3ORXj8stAn4sE8qsk1LAOr6p48fAAF/xQ1eo19xFFAl9NJyA6w0fmZYSA+V/
         xH/Hy2afgeq8j0DyiL+X1VQtEhyl9BIWGCZxpx+JulQ1xXOdHpJIQVaUWVyFsbUU4M3W
         kyBQ==
X-Gm-Message-State: APjAAAV8S3E9EgmEb8fcrgLxdSTTd8asVOvU+UoWoPGxeuSLGV+nrZdh
        mmZXoCwZKO8RxR2wNcCPo+GC3fashvgbwWTP7HM=
X-Google-Smtp-Source: APXvYqzaQ94yC64aqXo1L233ZgdYksMrCRP5ICZZj7rdYa5peH58KMKZXFOKVMHDOsFqqywNKm8QTL9LdL6B9vvbPRA=
X-Received: by 2002:a05:6830:4b9:: with SMTP id l25mr2216689otd.266.1581071773104;
 Fri, 07 Feb 2020 02:36:13 -0800 (PST)
MIME-Version: 1.0
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Fri, 7 Feb 2020 11:36:02 +0100
Message-ID: <CAJZ5v0iWhN=pxnedntPn5kriN-uEULvTjHADtJj59a5W14a4sQ@mail.gmail.com>
Subject: [GIT PULL] Additional ACPI updates for v5.6-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Linus,

Please pull from the tag

 git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
 acpi-5.6-rc1-3

with top-most commit dec0a81a7814c8a876e663e0627468e6b1a7d2fb

 i2c: designware: Add ACPI HID for Hisilicon Hip08-Lite I2C controller

on top of commit ffda81b69fce50f2543be99ef2d7c77dffc1ebc1

 Merge tag 'acpi-5.6-rc1-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm

to receive additional ACPI updates for 5.6-rc1.

These add Hisilicon Hip08-Lite I2C controller clock frequency
support to the ACPI driver for AMD SoCs (APD) and to the Designware
I2C driver (Hanjun Guo).

Thanks!


---------------

Hanjun Guo (2):
      ACPI / APD: Add clock frequency for Hisilicon Hip08-Lite I2C controller
      i2c: designware: Add ACPI HID for Hisilicon Hip08-Lite I2C controller

---------------

 drivers/acpi/acpi_apd.c                     | 6 ++++++
 drivers/i2c/busses/i2c-designware-platdrv.c | 1 +
 2 files changed, 7 insertions(+)
