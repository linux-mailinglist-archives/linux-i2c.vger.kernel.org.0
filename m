Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA8148177A
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Dec 2021 00:14:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232846AbhL2XOm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Dec 2021 18:14:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27555 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232503AbhL2XOl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Dec 2021 18:14:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640819680;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=w3GL8tFlo58OCqQkXwG1ZEQDk8vRPPWSObGz0xUB/fE=;
        b=Y/zmJATr49M2WlX5FwvZdaoMolSvQOCJoKA6hh47Of6hOoWCIU37TNlJNB8/XpelUPl/MP
        ucWmFTbfh/RYHnT06X4cPG3/xwugp5BT3APxcdMEggrbL+MdVmbZ+nwpqgkVuUUpW3foQT
        9VDDMlRdU4IB4XgSmpvNOphdMxPAmTA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-Xsg4AYuHN-6SZqoRUK0KrQ-1; Wed, 29 Dec 2021 18:14:37 -0500
X-MC-Unique: Xsg4AYuHN-6SZqoRUK0KrQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EBB31023F4D;
        Wed, 29 Dec 2021 23:14:35 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.20])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3EC311037F5B;
        Wed, 29 Dec 2021 23:14:32 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-i2c@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        linux-serial@vger.kernel.org
Subject: [PATCH 00/12] ACPI / pdx86: Add support for x86 Android tablets with broken DSDTs
Date:   Thu, 30 Dec 2021 00:14:19 +0100
Message-Id: <20211229231431.437982-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi All,

As a small(ish) hoppy project over the holidays I've been looking into
getting some (somewhat older) x86 tablets which ship with Android as the
only OS on their factory image working with the mainline kernel.

These typically have pretty broken DSDTs since the Android image kernel
just has everything hardcoded.

This patch-series makes most things on 3 of these tablets work with the
mainline kernel and lays the groundwork for adding support for similar
tablets.

Since the ACPI tables on these devices clearly are buggy this series is
written so as to add minimal changes to the ACPI core code, leaving all
of the heavy lifting to the recently introduced (in linux-next)
drivers/platform/x86/x86-android-tablets.c module, which when built as
a module only autoloads on affected devices based on DMI matching.

And when this module is disabled the added acpi_quirk_skip_*_enumeration()
helpers are replaced by inline stubs and even the minimally added core
code will be optimized away.

The ACPI core changes are in patches 1-3 of this series. Since the
i2c and serdev ACPI enumeration changes are very small and depend on
patch 1, I believe it would be best for patches 1-3 to all be merged
through Rafael's ACPI tree.

Greg and Wolfram, may we have your acks for this please?

I will take care of merging the rest of the series through the pdx86
tree (these 2 parts of this series can be merged independenly without
issues).

Regards,

Hans


Hans de Goede (12):
  ACPI / x86: Add acpi_quirk_skip_[i2c_client|serdev]_enumeration()
    helpers
  i2c: acpi: Do not instantiate I2C-clients on boards with known bogus
    DSDT entries
  serdev: Do not instantiate serdevs on boards with known bogus DSDT
    entries
  platform/x86: x86-android-tablets: Don't return -EPROBE_DEFER from a
    non probe() function
  platform/x86: x86-android-tablets: Add support for PMIC interrupts
  platform/x86: x86-android-tablets: Add support for instantiating
    platform-devs
  platform/x86: x86-android-tablets: Add support for instantiating
    serdevs
  platform/x86: x86-android-tablets: Add support for registering GPIO
    lookup tables
  platform/x86: x86-android-tablets: Add support for preloading modules
  platform/x86: x86-android-tablets: Add Asus TF103C data
  platform/x86: x86-android-tablets: Add Asus MeMO Pad 7 ME176C data
  platform/x86: x86-android-tablets: Add TM800A550L data

 drivers/acpi/x86/utils.c                   |  96 ++++
 drivers/i2c/i2c-core-acpi.c                |  17 +
 drivers/platform/x86/Kconfig               |   2 +-
 drivers/platform/x86/x86-android-tablets.c | 562 ++++++++++++++++++++-
 drivers/tty/serdev/core.c                  |  14 +
 include/acpi/acpi_bus.h                    |  16 +
 6 files changed, 698 insertions(+), 9 deletions(-)

-- 
2.33.1

