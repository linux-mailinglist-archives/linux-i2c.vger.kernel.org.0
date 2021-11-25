Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0554945DEDE
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Nov 2021 17:58:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231656AbhKYQ7g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Nov 2021 11:59:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51211 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239219AbhKYQ5g (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Nov 2021 11:57:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637859264;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Vpfm/8+ioRS+dlzEjAh7dyrWRGlodEtlDWeMr540nV0=;
        b=J22KudOMVAvxyQGHy9xSDAKGmAaVOd5fdUCUFQ4nGoR+bamAyxSyudrGW7dgernS47zQDS
        0+OKnW1cLPvBqUjs+aOktzL1pLkT+QALnjfavjiWDB4EeACGzRvNY8+8ELJpEcessqp8HF
        E02VoF+YrhtO6vJpAsjqcymL0Pa+Km8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-ILD17J6NPDmQ6BuenJ59lw-1; Thu, 25 Nov 2021 11:54:21 -0500
X-MC-Unique: ILD17J6NPDmQ6BuenJ59lw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EDDA1853028;
        Thu, 25 Nov 2021 16:54:18 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.195.117])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 47834604CC;
        Thu, 25 Nov 2021 16:54:13 +0000 (UTC)
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
Subject: [PATCH v6 00/15] Add support for X86/ACPI camera sensor/PMIC setup with clk and regulator platform data
Date:   Thu, 25 Nov 2021 17:53:57 +0100
Message-Id: <20211125165412.535063-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Here is v6 of my patch-set adding support for camera sensor connected to a
TPS68470 PMIC on x86/ACPI devices.

Changes in v6:
- Add support for the VCM (Voice Coil Motor) controlling the focus of
  the back/main sensor camera lens:
  - Patch 3 and patches 13-15 are new patches for this
  - While working on this I learned that the VIO regulator is an always on
    regulator and must be configured at the same voltage as VSIO, the
    tps68470-regulator driver and the constraints have been updated for this
- Addressed clk-tps68470 driver review-remarks
- Some minor tweaks based on review-remarks from Andy
- Add Andy's Reviewed-by to all patches which were also in v5

I'm quite happy with how this works now, so from my pov this is ready
for merging now.

Patch 2 already has acks for merging through another tree. Patch 3
"i2c: acpi: Add i2c_acpi_new_device_by_fwnode() function" is new,
Mika, Wolfram may we have your Ack for merging this one through
Rafael's ACPI or through my platform/drivers/x86 tree too ?

Once we have acks to merge both i2c-core-acpi.c through another tree,
there are 2 options:

  a. 1. Patches 1-3 merged by Rafael, Rafael provides an IM branch
     2. I create an IM branch with patches 4 + 7-12
     3. clk + regulator maintainers merge my IM branch + clk / regulator patch
     4. media maintainers merge Rafael's IM branch + media patches
  b. 1. I create an IM branch with patches 1-4 + 7-12 (with Rafael's ack for 1)
     2. clk / regulator / media maintainers merge my IM branch + their resp. patches

Assuming Rafael does not foresee any conflicts caused by the few small ACPI
patches I believe that going with plan b would be best.

Rafael is plan b. ok with you ? You did already Ack patch 1 but IIRC that
was not specifically for merging it through another tree.

Regards,

Hans


p.s.

For the record here is part of the old cover-letter of v5:
    
Changes in v5:
- Update regulator_init_data in patch 10/11 to include the VCM regulator
- Address various small review remarks from Andy
- Make a couple of functions / vars static in the clk + regulator drivers
  Reported-by: kernel test robot <lkp@intel.com>

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
- tps68470_clk_unprepare(): Remove unnecessary clearing of divider regs
- tps68470_clk_probe(): Use devm_clk_hw_register()
- Misc. small cleanups

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


Daniel Scally (1):
  platform/x86: int3472: Enable I2c daisy chain

Hans de Goede (14):
  ACPI: delay enumeration of devices with a _DEP pointing to an INT3472
    device
  i2c: acpi: Use acpi_dev_ready_for_enumeration() helper
  i2c: acpi: Add i2c_acpi_new_device_by_fwnode() function
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
  media: ipu3-cio2: Defer probing until the PMIC is fully setup
  media: ipu3-cio2: Call cio2_bridge_init() before anything else
  media: ipu3-cio2: Add support for instantiating i2c-clients for VCMs

 drivers/acpi/scan.c                           |  37 ++-
 drivers/clk/Kconfig                           |   8 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-tps68470.c                    | 257 ++++++++++++++++++
 drivers/i2c/i2c-core-acpi.c                   |  23 +-
 drivers/media/pci/intel/ipu3/cio2-bridge.c    |  92 +++++++
 drivers/media/pci/intel/ipu3/cio2-bridge.h    |  16 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  10 +-
 drivers/platform/x86/intel/int3472/Makefile   |   9 +-
 ...lk_and_regulator.c => clk_and_regulator.c} |   2 +-
 drivers/platform/x86/intel/int3472/common.c   |  82 ++++++
 .../{intel_skl_int3472_common.h => common.h}  |   6 +-
 ...ntel_skl_int3472_discrete.c => discrete.c} |  51 ++--
 .../intel/int3472/intel_skl_int3472_common.c  | 106 --------
 ...ntel_skl_int3472_tps68470.c => tps68470.c} |  99 ++++++-
 drivers/platform/x86/intel/int3472/tps68470.h |  25 ++
 .../x86/intel/int3472/tps68470_board_data.c   | 145 ++++++++++
 drivers/regulator/Kconfig                     |   9 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/tps68470-regulator.c        | 201 ++++++++++++++
 include/acpi/acpi_bus.h                       |   5 +-
 include/linux/i2c.h                           |  17 +-
 include/linux/mfd/tps68470.h                  |  11 +
 include/linux/platform_data/tps68470.h        |  35 +++
 24 files changed, 1080 insertions(+), 168 deletions(-)
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
2.33.1

