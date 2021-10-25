Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA4D4392A0
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Oct 2021 11:41:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232696AbhJYJn6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Oct 2021 05:43:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35375 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232692AbhJYJn5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Oct 2021 05:43:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635154895;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=AJjwA8KpQ+JtJtv1gkti7fBiNXqA/I5dkFBR+HHCYOg=;
        b=BeTMTOycSLJylzRq9SgQfFG/G0ZaDfQi7EBGgTgKeRDyUGLClC7G9b7MyJtfBY1BhTWnUe
        tuPWjb3usby6V0wnZTpNLV5I8j9bZDiY/HA6/q1O8xY4QCOm5wtWxqyuXRExqg/3ShQTp1
        sWhZMYUetl7mhKqomdCqNOHfwlvghyM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-OW6uVO-qNgm_GI2K9g3plA-1; Mon, 25 Oct 2021 05:41:31 -0400
X-MC-Unique: OW6uVO-qNgm_GI2K9g3plA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 688511006AA4;
        Mon, 25 Oct 2021 09:41:28 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.195.129])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5BC1F60BF4;
        Mon, 25 Oct 2021 09:41:20 +0000 (UTC)
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
Subject: [PATCH v4 00/11] Add support for X86/ACPI camera sensor/PMIC setup with clk and regulator platform data
Date:   Mon, 25 Oct 2021 11:41:08 +0200
Message-Id: <20211025094119.82967-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi All,

Here is v4 of my patch-set adding support for camera sensor connected to a
TPS68470 PMIC on x86/ACPI devices.

Changes in v4:
[PATCH 01/11] ACPI: delay enumeration of devices with a _DEP
              pointing to an INT3472 device:
- Move the acpi_dev_ready_for_enumeration() check to acpi_bus_attach()
  (replacing the acpi_device_is_present() check there)

[PATCH 04/11] regulator: Introduce tps68470-regulator driver:
- Make the top comment block use c++ style comments
- Drop the bogus builtin regulator_init_data
- Make the driver enable the PMIC clk when enabling the Core buck
  regulator, this switching regulator needs the PLL to be on
- Kconfig: add || COMPILE_TEST, fix help text

[PATCH 05/11] clk: Introduce clk-tps68470 driver
- Kconfig: select REGMAP_I2C, add || COMPILE_TEST, fix help text
- tps68470_clk_prepare(): Wait for the PLL to lock before returning
- tps68470_clk_unprepare(): Remove unnecesary clearing of divider regs
- tps68470_clk_probe(): Use devm_clk_hw_register()
- Misc. small cleanups

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

Patch 2 has already been acked by Wolfram for merging by Rafael, so patch
1 + 2 can be merged into linux-pm, independent of the rest of the series
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

 drivers/acpi/scan.c                           |  37 ++-
 drivers/clk/Kconfig                           |   8 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-tps68470.c                    | 253 ++++++++++++++++++
 drivers/i2c/i2c-core-acpi.c                   |   5 +-
 drivers/platform/x86/intel/int3472/Makefile   |   9 +-
 ...lk_and_regulator.c => clk_and_regulator.c} |   2 +-
 drivers/platform/x86/intel/int3472/common.c   |  82 ++++++
 .../{intel_skl_int3472_common.h => common.h}  |   6 +-
 ...ntel_skl_int3472_discrete.c => discrete.c} |  51 ++--
 .../intel/int3472/intel_skl_int3472_common.c  | 106 --------
 ...ntel_skl_int3472_tps68470.c => tps68470.c} |  98 ++++++-
 drivers/platform/x86/intel/int3472/tps68470.h |  25 ++
 .../x86/intel/int3472/tps68470_board_data.c   | 118 ++++++++
 drivers/regulator/Kconfig                     |   9 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/tps68470-regulator.c        | 215 +++++++++++++++
 include/acpi/acpi_bus.h                       |   5 +-
 include/linux/mfd/tps68470.h                  |  11 +
 include/linux/platform_data/tps68470.h        |  35 +++
 20 files changed, 925 insertions(+), 152 deletions(-)
 create mode 100644 drivers/clk/clk-tps68470.c
 rename drivers/platform/x86/intel/int3472/{intel_skl_int3472_clk_and_regulator.c => clk_and_regulator.c} (99%)
 create mode 100644 drivers/platform/x86/intel/int3472/common.c
 rename drivers/platform/x86/intel/int3472/{intel_skl_int3472_common.h => common.h} (94%)
 rename drivers/platform/x86/intel/int3472/{intel_skl_int3472_discrete.c => discrete.c} (91%)
 delete mode 100644 drivers/platform/x86/intel/int3472/intel_skl_int3472_common.c
 rename drivers/platform/x86/intel/int3472/{intel_skl_int3472_tps68470.c => tps68470.c} (54%)
 create mode 100644 drivers/platform/x86/intel/int3472/tps68470.h
 create mode 100644 drivers/platform/x86/intel/int3472/tps68470_board_data.c
 create mode 100644 drivers/regulator/tps68470-regulator.c
 create mode 100644 include/linux/platform_data/tps68470.h

-- 
2.31.1

