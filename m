Return-Path: <linux-i2c+bounces-5647-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4600095B160
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 11:21:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A457B242E6
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 09:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C18E817C7DC;
	Thu, 22 Aug 2024 09:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="geRRpYUD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A4A17C225
	for <linux-i2c@vger.kernel.org>; Thu, 22 Aug 2024 09:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724318423; cv=none; b=ME37WyCUw/cA/vxuQ9EIzjZxyG8D5XQ8l5wedz3EFDS0qWfIhTX36ZFkhm5isjKdMGD+8Hyt4ZMIJCgGqt5I1JcKVkDvc3YMHLyek97xaa+2RhRQRQt8TcFw1VlqFiLOBStfvDRg+6sIrsZWGS9SVQmMesvdFkKE2W6NLMGGM2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724318423; c=relaxed/simple;
	bh=QR0Lqz2zp3CjEyOcdxGH6PXgvdZjqPEuxxw3djgZW8U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j9suzyaTKcWn2oolTRwkEXnE0XfoExRRGA+sP4lkP0isUhR6lKJmcUZWFNODge+B1BFC/hemHjAo20u2YaDZEZy2JoS1P/8Id7JygMa2ZTfuUnZD9NWAcxzlqDdoApzdj5H0V8Pn5rsa1JgGdwVXPO0b29ORCrqjBNOpjmYxNAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=geRRpYUD; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-714302e7285so466649b3a.2
        for <linux-i2c@vger.kernel.org>; Thu, 22 Aug 2024 02:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724318421; x=1724923221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mXVJ4hYJVzO806R+DphXlW+DI8ouOS8A6yLy8bIlOVs=;
        b=geRRpYUDrPCv2UiMXFa416M9aigP2W+okzMRyZqtbJJi2JcUohNj9bjAd81nZ0BNZz
         H12VmSbfozPINmIqhMGL5M17/pjudkQinlN353PvoB4MmhYYlc+8y5HvSyyOTH2jQQbG
         eq4hhlGLfD98rwKcM+GepEGoS6HGIehPFyruI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724318421; x=1724923221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mXVJ4hYJVzO806R+DphXlW+DI8ouOS8A6yLy8bIlOVs=;
        b=Eg/wsGDDs6jAURmL3zfUeFBvDHsskNi4Ktc8DUVXFagFUPoC7lNxr9jDVwhmO3UzXE
         1ZO40q8EYr8Rd1dDDs8R/WnnjC1rX32Rp5YuxPxrTIKsbCuKX9V2nY+UsyiRnxg3sDOr
         o5n5c5EgFkb8sLNqb41Z3j2ggXtVGUDU/3yI58789myHucmmZIaU7RlvI32lyRiJrgBR
         TcdPwrPxbkT+Ou1WOxLAxUOC1L7U2+BdIbVwNQupB4c5NNX7XMGA5Bj2B7y2u4IJSEVJ
         hocHmh/87oYog9eAwcNXVVuHDTJ7Id7NojjTCzz3roIMGsIccjYbdaax+kQA4iHTHao4
         /jXg==
X-Forwarded-Encrypted: i=1; AJvYcCXA2CiCNEkQRoMObeKmusz+/NiA3yGU1oHCzMTPhyh3BiigGHtGI4M3kKaJEI7XPcPfEquCILXKmYY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAVPvfuNJb4+yd7uiT/e1usUe1YpEs27+k8793Q219gOaI181z
	SrMI+SjhYxf4El9NQShSAhSrPLhGmJIqZG7nIzV+Y4zOYQoX9fVEvrbnimpveA==
X-Google-Smtp-Source: AGHT+IHXMIEApsOt0aXtJsag/9KLz2oM6hiySBAzNrGHr2vTyo3uEK2rn3CZece1Sx+6ucTreM1PvA==
X-Received: by 2002:a05:6a21:10f:b0:1c0:f5fa:cbe6 with SMTP id adf61e73a8af0-1cada055bbbmr4933807637.22.1724318421036;
        Thu, 22 Aug 2024 02:20:21 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8470:6a67:8877:ce2c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434335e69sm951398b3a.194.2024.08.22.02.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:20:20 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v5 00/10] platform/chrome: Introduce DT hardware prober
Date: Thu, 22 Aug 2024 17:19:53 +0800
Message-ID: <20240822092006.3134096-1-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

This is v5 of my "of: Introduce hardware prober driver" [1] series.
v5 mainly addresses comments from Andy.

v2 continued Doug's "of: device: Support 2nd sources of probeable but
undiscoverable devices" [2] series, but follows the scheme suggested by
Rob, marking all second source component device nodes as "fail-needs-probe",
and having a hardware prober driver enable the one of them.


Changes since v4:
- Link to v4: 
  https://lore.kernel.org/all/20240808095931.2649657-1-wenst@chromium.org/
- Patch 1 "of: dynamic: Add of_changeset_update_prop_string"
  - Use modern designated initializer for |prop|
- Patch 2 "regulator: Move OF-specific regulator lookup code to of_regulator.c"
  - New patch only moving code
- Patch 3 "regulator: Split up _regulator_get()"
  - New patch splitting existing code into smaller functions
- Patch 4 "regulator: Do pure DT regulator lookup in of_regulator_bulk_get_all()"
  - Was "regulator: Add regulator_of_get_optional() for pure DT" in v4
  - Add OF-specific _of_regulator_get() function
  - Rename regulator_of_get_optional() to of_regulator_get_optional() for
    consistency
  - Make of_regulator_get_optional() static, as it is only used internally
  - Convert of_regulator_bulk_get_all()
- Patch 5 "gpiolib: Add gpio_property_name_length()"
  - New patch, split out from patch 7/8
- Patch 6 "i2c: Introduce OF component probe function"
  - Split code into helper functions
  - Use scoped helpers and __free() to reduce error path
- Patch 7 "i2c: of-prober: Add regulator support"
  - Split out GPIO handling as patch 8
  - Rewrote using of_regulator_bulk_get_all()
  - Replaced "regulators" with "regulator supplies" in debug messages
- Patch 8 "i2c: of-prober: Add GPIO support"
  - New patch split out from patch 7
  - Moved GPIO property name check to common function in gpiolib.c in new
    patch
  - Moved i2c_of_probe_free_gpios() into for_each_child_of_node_scoped()
  - Rewrote in gpiod_*_array-esque fashion
- Patch 9 "platform/chrome: Introduce device tree hardware prober"
  - Fix Kconfig dependency
  - Update copyright year
  - Drop "linux/of.h" header
  - Include "linux/errno.h"
  - Move |int ret| declaration to top of block
  - Return -ENODEV on no match instead of 0
  - Unregister platform driver and device unconditionally after previous
    change
- Patch 10 "arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and
	    trackpads as fail"
  - Rebased

Changes since v3:
- Patch 1 "of: dynamic: Add of_changeset_update_prop_string"
  - Use new __of_prop_free() helper (helper was added by Rob in 2024/04)
  - Add new line before header declaration
- Patch 2 "regulator: Add regulator_of_get_optional() for pure DT"
  - New patch
- Patch 3 "i2c: Introduce OF component probe function"
  - Complete kernel-doc
  - Return different error if I2C controller is disabled
  - Expand comment to explain assumptions and constraints
  - Split for-loop finding target node and operations on target node
  - Add missing i2c_put_adapter()
  - Move prober code to separate file
- Patch 4 "i2c: of-prober: Add GPIO and regulator support"
  - New patch
- Patch 5 "platform/chrome: Introduce device tree hardware prober"
  - Include linux/init.h
  - Rewrite for loop in driver probe function as suggested by Andy
  - Make prober driver buildable as module
  - Ignore prober errors other than probe deferral
- Patch 6 "arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and trackpads as fail"
  - Rebased

Patch "arm64: dts: mediatek: mt8173-elm-hana: Add G2touch G7500 touchscreen"
was merged separately and thus removed from this series.

Changes since v2:
- Added of_changeset_update_prop_string()
- Moved generic I2C code to the I2C core
- Moved remaining platform specific code to platform/chrome/
- Switched to of_node_is_available() to check if node is enabled.
- Switched to OF changeset API to update status property
- I2C probe helper function now accepts "struct device *dev" instead to
  reduce line length and dereferences
- Moved "ret = 0" to just before for_each_child_of_node(i2c_node, node)
- Depend on rather than select CONFIG_I2C
- Copied machine check to driver init function
- Explicitly mentioned "device tree" or OF in driver name, description
  and Kconfig symbol
- Dropped filename from inside the file
- Made loop variable size_t (instead of unsigned int as Andy asked)
- Switched to PLATFORM_DEVID_NONE instead of raw -1
- Switched to standard goto error path pattern in hw_prober_driver_init()
- Dropped device class from status property

Patches removed from v3 and saved for later:
- of: base: Add of_device_is_fail
- of: hw_prober: Support Chromebook SKU ID based component selection
- dt-bindings: arm: mediatek: Remove SKU specific compatibles for Google Krane
- arm64: dts: mediatek: mt8183-kukui: Merge Krane device trees

For the I2C component (touchscreens and trackpads) case from the
original series, the hardware prober driver finds the particular
class of device in the device tree, gets its parent I2C adapter,
and tries to initiate a simple I2C read for each device under that
I2C bus. When it finds one that responds, it considers that one
present, marks it as "okay", and returns, letting the driver core
actually probe the device.

This works fine in most cases since these components are connected
via a ribbon cable and always have the same resources. The prober
will also grab these resources and enable them.

The other case, selecting a display panel to use based on the SKU ID
from the firmware, hit a bit of an issue with fixing the OF graph.
It has been left out since v3.

Patch 1 adds of_changeset_update_prop_string(), as requested by Rob.

Patches 2 through 4 reorganize the OF-specific regulator core code and
reworks the existing of_regulator_bulk_get_all() function to look up
regulator supplies solely using device tree nodes.

Patch 5 adds a function to the GPIO library that checks whether a
given string (property name) matches the GPIO property pattern, and
if it does, returns the length of the GPIO name.

Patch 6 implements probing the I2C bus for presence of components as
a helper function in the I2C core.

Patch 7 implements regulator supply support for the I2C component
prober.

Patch 8 implements GPIO support for the I2C component prober.

Patch 9 adds a ChromeOS specific DT hardware prober. This initial
version targets the Hana Chromebooks, probing its I2C trackpads and
touchscreens.

Patch 10 modifies the Hana device tree and marks the touchscreens
and trackpads as "fail-needs-probe", ready for the driver to probe.


The patch and build time dependencies for this series is now quite
complicated:

  of_regulator.c cleanups [1] -> regulator patches here ----
							   |
							   v
  gpio patch in -next [2] -> gpiolib patch here  -----> i2c of-prober --
								       |
                      platform/chrome device tree hardware prober <----- 
 
The regulator patches in this series depend on other cleanup patches [1]
I sent earlier. The gpiolib patch depends on a commit in -next [2]
changing the GPIO suffixes array. Patches 6 through 8 introducting i2c
of-prober depend on the first 5 patches. Patch 9, The chrome prober,
depends on patches 6 through 8.

I think it might be easier if the respective maintainers take the first
five patches for -rc1, and patches 6 through 9 go through either the i2c
or chrome trees either very late in the merge window or right after it.
Patch 10 can go in only after everything else is in. This should be
better than having an immutable branch on top of some commit in -next
for three other trees to consume.


Thanks
ChenYu

[1] https://lore.kernel.org/all/20240822072047.3097740-1-wenst@chromium.org/
[2] commit 4b91188dced8 ("gpiolib: Replace gpio_suffix_count with NULL-terminated array")

Chen-Yu Tsai (10):
  of: dynamic: Add of_changeset_update_prop_string
  regulator: Move OF-specific regulator lookup code to of_regulator.c
  regulator: Split up _regulator_get()
  regulator: Do pure DT regulator lookup in of_regulator_bulk_get_all()
  gpiolib: Add gpio_property_name_length()
  i2c: Introduce OF component probe function
  i2c: of-prober: Add regulator support
  i2c: of-prober: Add GPIO support
  platform/chrome: Introduce device tree hardware prober
  arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and trackpads
    as fail

 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |  13 +
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |   4 +-
 drivers/gpio/gpiolib.c                        |  44 ++
 drivers/i2c/Makefile                          |   1 +
 drivers/i2c/i2c-core-of-prober.c              | 391 ++++++++++++++++++
 drivers/of/dynamic.c                          |  44 ++
 drivers/platform/chrome/Kconfig               |  11 +
 drivers/platform/chrome/Makefile              |   1 +
 .../platform/chrome/chromeos_of_hw_prober.c   | 104 +++++
 drivers/regulator/core.c                      | 139 +++----
 drivers/regulator/internal.h                  |  15 +-
 drivers/regulator/of_regulator.c              | 142 ++++++-
 include/linux/gpio/consumer.h                 |   2 +
 include/linux/i2c.h                           |   4 +
 include/linux/of.h                            |   4 +
 15 files changed, 820 insertions(+), 99 deletions(-)
 create mode 100644 drivers/i2c/i2c-core-of-prober.c
 create mode 100644 drivers/platform/chrome/chromeos_of_hw_prober.c

-- 
2.46.0.184.g6999bdac58-goog


