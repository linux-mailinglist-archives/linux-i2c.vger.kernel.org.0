Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FF38310BE3
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Feb 2021 14:35:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbhBENfH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Feb 2021 08:35:07 -0500
Received: from mga12.intel.com ([192.55.52.136]:60933 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229983AbhBENcR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 5 Feb 2021 08:32:17 -0500
IronPort-SDR: Nwo79IGYWACtfeBduVxN6zwVZzOXTf3WM5iRVIIG6BCkbMQc3r/Dwm7xEGv0qNiZPuxauOKNCG
 +X4CYvTJkJ+w==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="160589442"
X-IronPort-AV: E=Sophos;i="5.81,154,1610438400"; 
   d="scan'208";a="160589442"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2021 05:24:57 -0800
IronPort-SDR: 3bagWk4ieSh14Im4ioZBhHx7ofbCZFl1vELks+rDk6fQj6QdMIrEGvtzwLd6ZjUTYSPi/25Yno
 lOM/DDvfizCQ==
X-IronPort-AV: E=Sophos;i="5.81,154,1610438400"; 
   d="scan'208";a="373390605"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2021 05:24:53 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 7F8AA20168;
        Fri,  5 Feb 2021 15:24:51 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1l816f-0005GC-7e; Fri, 05 Feb 2021 15:25:05 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v10 0/7] Support running driver's probe for a device powered off
Date:   Fri,  5 Feb 2021 15:24:58 +0200
Message-Id: <20210205132505.20173-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello everyone,

These patches enable calling (and finishing) a driver's probe function
without powering on the respective device on busses where the practice is
to power on the device for probe. While it generally is a driver's job to
check the that the device is there, there are cases where it might be
undesirable. (In this case it stems from a combination of hardware design
and user expectations; see below.) The downside with this change is that
if there is something wrong with the device, it will only be found at the
time the device is used. In this case (the camera sensors + EEPROM in a
sensor) I don't see any tangible harm from that though.

An indication both from the driver and the firmware is required to allow
the device's power state to remain off during probe (see the second patch).


The use case is such that there is a privacy LED next to an integrated
user-facing laptop camera, and this LED is there to signal the user that
the camera is recording a video or capturing images. That LED also happens
to be wired to one of the power supplies of the camera, so whenever you
power on the camera, the LED will be lit, whether images are captured from
the camera --- or not. There's no way to implement this differently
without additional software control (allowing of which is itself a
hardware design decision) on most CSI-2-connected camera sensors as they
simply have no pin to signal the camera streaming state.

This is also what happens during driver probe: the camera will be powered
on by the I²C subsystem calling dev_pm_domain_attach() and the device is
already powered on when the driver's own probe function is called. To the
user this visible during the boot process as a blink of the privacy LED,
suggesting that the camera is recording without the user having used an
application to do that. From the end user's point of view the behaviour is
not expected and for someone unfamiliar with internal workings of a
computer surely seems quite suspicious --- even if images are not being
actually captured.

I've tested these on linux-next master.

since v9 <URL:https://lore.kernel.org/linux-acpi/CAJZ5v0jjgy2KXOw5pyshvaEVzLctu4jsgYK1+YDA+8sZfp-6mw@mail.gmail.com/T/#m003f56b33350772364b1f5c832e9025677107933>:

- Use _DSE object designed for the very purpose of designating intended
  device probe power state instead of _PRE.

- Rework documentation to reflect the property to _DSE changes (missed in
  v9).

- Put maximum device enumeration power state in struct acpi_device_power,
  instead of a flag in struct acpi_device_power_flags. The default is
  ACPI_STATE_D0.

- i2c_acpi_allow_low_power_probe() now returns true if the desired power
  state is greater or equal to the current device power state.

- Rename local variable low_power as off_during_probe.

since v8 <URL:https://lore.kernel.org/patchwork/cover/1300068/>:

- Make use of ACPI _PRE object instead of a _DSD property (new patch,
  1st), align documentation with that.

- Added a blank line.

- Rebased on current linux-next master.

since v7 <URL:https://lore.kernel.org/linux-acpi/20200901210333.8462-1-sakari.ailus@linux.intel.com/>:

- Reorder documentation patch right after the implemenation in the I²C
  framework.

- Rename allow-low-power-probe property as i2c-allow-low-power-probe.

- Remove extra "property" from the description of the
  i2c-allow-low-power-probe property and mention it's a device property.

- Add an example to the documentation and refer to the _DSD property spec.

since v6 <URL:https://lore.kernel.org/linux-acpi/20200826115432.6103-1-sakari.ailus@linux.intel.com/>:

- Use u32 for the flags field in struct i2c_driver.

- Use acpi_dev_get_property to read the allow-low-power-probe property.

since v5 <URL:https://lore.kernel.org/linux-acpi/20200810142747.12400-1-sakari.ailus@linux.intel.com/>:

- Identify sensors when they're first powered on. In previous versions, if
  this wasn't in probe, it was not done at all.

- Return allow_low_power_probe() only for ACPI devices, i.e. OF systems
  are not affected by these changes.

- Document that I2C_DRV_FL_ALLOW_LOW_POWER_PROBE flag only applies to ACPI
  drivers.

- Fix extra regulator_disable in at24 driver's remove function when the
  device was already in low power state.

since v4 <URL:https://lore.kernel.org/linux-acpi/20200121134157.20396-1-sakari.ailus@linux.intel.com/>:

- Rename "probe-low-power" property as "allow-low-power-probe". This is
  taken into account in function and file naming, too.

- Turn probe_low_power field in struct i2c_driver into flags field.

- Rebase on Wolfram's i2c/for-next branch that contains the removal of the
  support for disabling I²C core IRQ mappings (commit
  0c2a34937f7e4c4776bb261114c475392da2355c).

- Change wording for "allow-low-power-probe" property in ACPI
  documentation.

since v3 <URL:https://lore.kernel.org/linux-acpi/20200109154529.19484-1-sakari.ailus@linux.intel.com/T/#t>:

- Rework the 2nd patch based on Rafael's comments

	- Rework description of the ACPI low power state helper function,
	  according to Rafael's text.

	- Rename and rework the same function as
	  acpi_dev_state_low_power().

	- Reflect the changes in commit message as well.

- Added a patch to document the probe-low-power _DSD property.

since v2 <URL:https://patchwork.kernel.org/cover/11114255/>:

- Remove extra CONFIG_PM ifdefs; these are not needed.

- Move the checks for power state hints from drivers/base/dd.c to
  drivers/i2c/i2c-base-core.c; these are I²C devices anyway.

- Move the probe_low_power field from struct device_driver to struct
  i2c_driver.

since v1:

- Rename probe_powered_off struct device field as probe_low_power and
  reflect the similar naming to the patches overall.

- Work with CONFIG_PM disabled, too.

Rajmohan Mani (1):
  media: i2c: imx319: Support probe while the device is off

Sakari Ailus (6):
  ACPI: scan: Obtain device's desired enumeration power state
  i2c: Allow an ACPI driver to manage the device's power state during
    probe
  Documentation: ACPI: Document _DSE object usage for enum power state
  ACPI: Add a convenience function to tell a device is in low power
    state
  ov5670: Support probe whilst the device is in a low power state
  at24: Support probing while off

 Documentation/firmware-guide/acpi/index.rst   |  1 +
 .../firmware-guide/acpi/low-power-probe.rst   | 69 +++++++++++++++++
 drivers/acpi/device_pm.c                      | 23 ++++++
 drivers/acpi/scan.c                           |  4 +
 drivers/i2c/i2c-core-acpi.c                   | 10 +++
 drivers/i2c/i2c-core-base.c                   |  9 ++-
 drivers/media/i2c/imx319.c                    | 72 +++++++++++-------
 drivers/media/i2c/ov5670.c                    | 76 +++++++++++--------
 drivers/misc/eeprom/at24.c                    | 43 ++++++-----
 include/acpi/acpi_bus.h                       |  1 +
 include/linux/acpi.h                          |  6 ++
 include/linux/i2c.h                           | 19 +++++
 12 files changed, 255 insertions(+), 78 deletions(-)
 create mode 100644 Documentation/firmware-guide/acpi/low-power-probe.rst

-- 
2.20.1

