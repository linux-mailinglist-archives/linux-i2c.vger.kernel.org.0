Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BF90428336
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Oct 2021 20:59:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231835AbhJJTBG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 10 Oct 2021 15:01:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25476 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232925AbhJJS7b (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 10 Oct 2021 14:59:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633892252;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=9fP16BY7AsTDNFJGLr1NMnUHLpxbega7qb7JKUQTqx8=;
        b=Iu2Lj6G2eOitFmGL7uMANdCzAk16VWNfbt7Rn2k//PVNowFHnZNqIe3QpaG0o7qMseYUbd
        QMqqDOh0W6QEMpLrW1U6AIU2IIoQtyqTAzaIEMbgK7rFD1P8ihAt8ZIa7NO/hIpxX9dITa
        JjMXLMhsFS7ATanNFLvJcVSZNfh6Shc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-1YFKpSw2PDKGspw1HsPLAA-1; Sun, 10 Oct 2021 14:57:16 -0400
X-MC-Unique: 1YFKpSw2PDKGspw1HsPLAA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E5231808304;
        Sun, 10 Oct 2021 18:57:13 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.6])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7438E5F4E1;
        Sun, 10 Oct 2021 18:57:08 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v3 00/11] Add support for X86/ACPI camera sensor/PMIC setup with clk and regulator platform data
Date:   Sun, 10 Oct 2021 20:56:56 +0200
Message-Id: <20211010185707.195883-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi All,

Here is v2 of my patch-set adding support for camera sensor connected to a
TPS68470 PMIC on x86/ACPI devices.

v3 of this patch-set further reworks how to defer the binding of the
camera-sensor drivers till all clk/regulator/gpio consumer/lookup info has
been registered. See the new patch 1 + 2 (replacing v1 patch 1-3 /
v2 patch 1-2).

I'm quite happy with how this works now, so from my pov this is the final
version of the device-instantiation deferral code / approach.

###

The clk and regulator frameworks expect clk/regulator consumer-devices
to have info about the consumed clks/regulators described in the device's
fw_node, but on ACPI this info is missing.

This series worksaround this by providing platform_data with the info to
the TPS68470 clk/regulator MFD cells.

Patches 1 - 2 deal with a probe-ordering problem this introduces,
since the lookups are only registered when the provider-driver binds,
trying to get these clks/regulators before then results in a -ENOENT
error for clks and a dummy regulator for regulators. See the patches
for more details.

Patch 3 adds a header file which adds tps68470_clk_platform_data and
tps68470_regulator_platform_data structs. The futher patches depend on
this new header file.

Patch 4 + 5 add the TPS68470 clk and regulator drivers

Patches 6 - 11 Modify the INT3472 driver which instantiates the MFD cells to
provide the necessary platform-data.

Assuming this series is acceptable to everyone, we need to talk about how
to merge this.

Assuming the i2c-core-acpi.c are ok with it patches 1 + 2 can both be
merged into linux-pm by Rafael, independent of the rest of the series
(there are some runtime deps on other changes for everything to work,
but the camera-sensors impacted by this are not fully supported yet in
the mainline kernel anyways).

For "[PATCH 03/13] platform_data: Add linux/platform_data/tps68470.h file",
which all further patches depend on I plan to provide an immutable branch
myself (once it has been reviewed), which the clk / regulator maintainers
can then merge before merging the clk / regulator driver which depends on
this.

And I will merge that IM-branch + patches 6-11 into the pdx86 tree myself.

Regards,

Hans


Daniel Scally (1):
  platform/x86: int3472: Enable I2c daisy chain

Hans de Goede (10):
  ACPI: delay enumeration of devices with a _DEP pointing to an INT3472
    device
  i2c: acpi: Use acpi_dev_ready_for_enumeration() helper
  platform_data: Add linux/platform_data/tps68470.h file
  regulator: Introduce tps68470-regulator driver
  clk: Introduce clk-tps68470 driver
  platform/x86: int3472: Split into 2 drivers
  platform/x86: int3472: Add get_sensor_adev_and_name() helper
  platform/x86: int3472: Pass tps68470_clk_platform_data to the
    tps68470-regulator MFD-cell
  platform/x86: int3472: Pass tps68470_regulator_platform_data to the
    tps68470-regulator MFD-cell
  platform/x86: int3472: Deal with probe ordering issues

 drivers/acpi/scan.c                           |  36 ++-
 drivers/clk/Kconfig                           |   6 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-tps68470.c                    | 256 ++++++++++++++++++
 drivers/i2c/i2c-core-acpi.c                   |   5 +-
 drivers/platform/x86/intel/int3472/Makefile   |   9 +-
 ...lk_and_regulator.c => clk_and_regulator.c} |   2 +-
 drivers/platform/x86/intel/int3472/common.c   |  82 ++++++
 .../{intel_skl_int3472_common.h => common.h}  |   6 +-
 ...ntel_skl_int3472_discrete.c => discrete.c} |  51 ++--
 .../intel/int3472/intel_skl_int3472_common.c  | 106 --------
 ...ntel_skl_int3472_tps68470.c => tps68470.c} |  97 ++++++-
 drivers/platform/x86/intel/int3472/tps68470.h |  25 ++
 .../x86/intel/int3472/tps68470_board_data.c   | 118 ++++++++
 drivers/regulator/Kconfig                     |   9 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/tps68470-regulator.c        | 193 +++++++++++++
 include/acpi/acpi_bus.h                       |   5 +-
 include/linux/mfd/tps68470.h                  |  11 +
 include/linux/platform_data/tps68470.h        |  35 +++
 20 files changed, 904 insertions(+), 150 deletions(-)
 create mode 100644 drivers/clk/clk-tps68470.c
 rename drivers/platform/x86/intel/int3472/{intel_skl_int3472_clk_and_regulator.c => clk_and_regulator.c} (99%)
 create mode 100644 drivers/platform/x86/intel/int3472/common.c
 rename drivers/platform/x86/intel/int3472/{intel_skl_int3472_common.h => common.h} (94%)
 rename drivers/platform/x86/intel/int3472/{intel_skl_int3472_discrete.c => discrete.c} (91%)
 delete mode 100644 drivers/platform/x86/intel/int3472/intel_skl_int3472_common.c
 rename drivers/platform/x86/intel/int3472/{intel_skl_int3472_tps68470.c => tps68470.c} (55%)
 create mode 100644 drivers/platform/x86/intel/int3472/tps68470.h
 create mode 100644 drivers/platform/x86/intel/int3472/tps68470_board_data.c
 create mode 100644 drivers/regulator/tps68470-regulator.c
 create mode 100644 include/linux/platform_data/tps68470.h

-- 
2.31.1

