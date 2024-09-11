Return-Path: <linux-i2c+bounces-6520-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C13974B3E
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 09:28:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E1DEB22F61
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 07:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5096613B284;
	Wed, 11 Sep 2024 07:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gcrwQ+MV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE1E1311AC
	for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 07:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726039701; cv=none; b=A9HFnWZj/kEY+O4tAJZzcO9o8ztOBH03DRTjokdkXVQZ59uBDDN+2Rc89lB12rIvsddejsG/IIgA5f7BXLzoCTLhx9vTSGVIF6LeUXuP32vTWb8tKLwDgzfFdZpZEVNUhuhtUPgYwxiITk+G040S/Tb0GiuOsegCn9OpIgTu/LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726039701; c=relaxed/simple;
	bh=vMhuC8PNZN3+G8Jw50ke9CsdZzsyUD/t8c7FpFFbaPs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R4qJWbFd7is3Q5nasdmhj44egcskJF65Si8HONLno9loKiAFUAS9OSEFSPr4G6UyAW6ebeMFd5GGl/Ey8K6qSyPY8qIevJ8OMjaedFN1nGeTClEzDNmIbeoL2i5xx396KNAqI3It5RKjwtHgefNSjjViNfmFdhg3c2EM4Lm2474=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gcrwQ+MV; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7d4ed6158bcso4509340a12.1
        for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 00:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726039698; x=1726644498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hTKgkUpPxMjt6Wkjy0VL4B+YQKQwbZqLJmtteD1Fqgg=;
        b=gcrwQ+MVyyNjh0NJkPbnr6wfxamVSFbnnJczUovY9Ckxl3MbQWVPWoDs1ZfKRylep1
         VqdzfZX3fIglWZHk9Mv51C/tastmIlzLPKFM+dDvi/MJb0tSUG7oHUHnxRzCguDL2Gvh
         FzqfJUhOV48FpWH/IeQPA2+5DHJK4WLHehItI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726039698; x=1726644498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hTKgkUpPxMjt6Wkjy0VL4B+YQKQwbZqLJmtteD1Fqgg=;
        b=IOSsM8kFMFRvKqbIkoaebaol+NrJrNJAIYY/9S7ZlSiqYe7csHKJAdwC6ceVNUFH04
         gG5D2JCy6Ob7jzKocTThcIiOAX2ZrBwKD7861YYn5/j+nAbh3nlyjzRO2nAHz3mdiQZ/
         vzv7an3nUzl1vBpLcJga9IA3F7Sb9Dykgx88SOs3PzOaSq+8IJgi+ygnDPX9qkx5iw+x
         0os7dp/6+u/I8noqx8FkehqGLRplDD7TUwCcrEOzZg17DsrUUY8+kV4mmbN6o34WQoxl
         NKTRMSZpdG9l6kwMYd3g1LRkbr8gf7TcH+D4nxrE3UQzULy+FiNjm0KcpioH6tvE2GCj
         uCqA==
X-Forwarded-Encrypted: i=1; AJvYcCWfeaCmQm6bYcdY7xyfjwhUtdSTa4kTENUElJKYEUudEqllTmpNlmiXIX8PPCT4M4QGDBmSGOWYwRA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+KVuxmcIRsebrSmXSLpAIgrOrdx9oWfMA+Sy3lBtePkYu/Ui1
	Zd8xKtF5wXLboG5t8b+gL5g3snZEamrxSORkNoMiWXEsV0U8KJ3XbMyEaL9Pxw==
X-Google-Smtp-Source: AGHT+IEfFgxwFodCBOOV4Mey4FyzVGvUwL6y+0sWBJDlwOxvwP6rBYJkox3CrjRNGWdE04s4ZrrqPA==
X-Received: by 2002:a05:6a20:d521:b0:1cf:2aaf:60d9 with SMTP id adf61e73a8af0-1cf5e157915mr4469402637.33.1726039698517;
        Wed, 11 Sep 2024 00:28:18 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8398:fe34:eba2:f301])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe4e7esm2399415b3a.80.2024.09.11.00.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 00:28:18 -0700 (PDT)
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
Subject: [PATCH v7 00/10] platform/chrome: Introduce DT hardware prober
Date: Wed, 11 Sep 2024 15:27:38 +0800
Message-ID: <20240911072751.365361-1-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

This is v7 of my "of: Introduce hardware prober driver" [1] series.
v7 mainly refactors the code into a series of helpers. The scope of
supported components is also reduced to those with at most one regulator
supply and one GPIO pin. Also the helpers expect these to be named and
so the "bulk get" API changes have been dropped.

Also, a pull request to document the "fail-needs-probe" status has been
sent: https://github.com/devicetree-org/dt-schema/pull/141

v2 continued Doug's "of: device: Support 2nd sources of probeable but
undiscoverable devices" [2] series, but follows the scheme suggested by
Rob, marking all second source component device nodes as "fail-needs-probe",
and having a hardware prober driver enable the one of them.


Changes since v6:
- Link to v6:
  https://lore.kernel.org/all/20240904090016.2841572-1-wenst@chromium.org/
- Dropped patch "gpiolib: Add gpio_property_name_length()"
  No longer needed
- Dropped patch "regulator: Move OF-specific regulator lookup code to of_regulator.c"
  Already merged
- Patch 2 "of: base: Add for_each_child_of_node_with_prefix()"
  - Changed helper name to "for_each_child_of_node_with_prefix()"
- Patch 4 "regulator: Add of_regulator_get_optional() for pure DT regulator lookup"
  - Was "regulator: Do pure DT regulator lookup in of_regulator_bulk_get_all()"
  - Changed reference [1] to Link: tag
  - Rebased on top of commit 401d078eaf2e ("regulator: of: Refactor
    of_get_*regulator() to decrease indentation")
  - Exported of_regulator_get_optional()
  - Changed commit message to focus on "of_regulator_get_optional()"
  - Dropped change to of_regulator_bulk_get_all()
- Patch 5 "i2c: core: Remove extra space in Makefile"
  - Collected Andy's Reviewed-by
- Patch 6 "i2c: Introduce OF component probe function"
  - Correctly replaced for_each_child_of_node_scoped() with
    for_each_child_of_node_with_prefix()
  - Added namespace for exported symbols
  - Made the probe function a framework with hooks
  - Split out a new header file
  - Added MAINTAINERS entry
  - Reworded kernel-doc
  - Dropped usage of __free from i2c_of_probe_component() since error
    path cleanup is needed anyway
- Patch 7 "i2c: of-prober: Add simple helpers for regulator support"
  - Moved change of of_get_next_child_scoped() to
    of_get_next_child_with_prefix() to previous patch
  - Restructured into helpers for the I2C OF component prober
  - Reduced to only handle one regulator
  - Commit message updated
- Patch 8 "i2c: of-prober: Add GPIO support to simple helpers"
  - Restructured into helpers for the I2C OF component prober
  - Reduced to only handle one GPIO
  - Set GPIO to input on (failure) cleanup
  - Updated commit message
- Patch 9 "platform/chrome: Introduce device tree hardware prober"
  - Adapted to new I2C OF prober interface
  - Collected Acked-by tag

Changes since v5:
- Link to v5:
  https://lore.kernel.org/all/20240822092006.3134096-1-wenst@chromium.org/
- Patch 1 "of: dynamic: Add of_changeset_update_prop_string"
  - Collected Rob's reviewed-by
- Patch 2 "of: base: Add for_each_child_of_node_with_prefix_scoped()"
  - New patch
- Patch 3 "regulator: Move OF-specific regulator lookup code to of_regulator.c"
  - Fix kerneldoc format of of_regulator_dev_lookup()
  - Fix stub compile error for !CONFIG_OF in drivers/regulator/internal.h
- Patch 4 "regulator: Split up _regulator_get()"
  - Fixed kerneldoc "Return" section format for _regulator_get_common()
  - Slightly reworded return value description
- Patch 5 "regulator: Do pure DT regulator lookup in of_regulator_bulk_get_all()"
  - Used "dev_of_node(dev)" instead of "dev->of_node"
  - Replaced "dev_printk" with "dev_printk()" in kerneldoc mentions
  - Fixed kerneldoc "Return" section format for of_regulator_get_optional()
  - Fix @np parameter name in of_regulator_dev_lookup() kerneldoc
- Patch 6 "gpiolib: Add gpio_property_name_length()"
  - Changed function name to "gpio_get_property_name_length()"
  - Changed argument name to "propname"
  - Clarified return value for "*-<GPIO suffix>" case
  - Reworked according to Andy's suggestion
  - Added stub function
- Patch 7 "i2c: core: Remove extra space in Makefile"
  - New patch
- Patch 8 "i2c: Introduce OF component probe function"
  - Fixed indent in Makefile
  - Split regulator and GPIO TODO items
  - Reversed final conditional in i2c_of_probe_enable_node()
- Patch 9 "i2c: of-prober: Add regulator support"
  - Split of_regulator_bulk_get_all() return value check and explain
    "ret == 0" case
  - Switched to of_get_next_child_with_prefix_scoped() where applicable
  - Used krealloc_array() instead of directly calculating size
  - copy whole regulator array in one memcpy() call
  - Drop "0" from struct zeroing initializer
  - Split out regulator helper from i2c_of_probe_enable_res() to keep
    code cleaner when combined with the next patch
  - Added options for customizing power sequencing delay
  - Rename i2c_of_probe_get_regulator() to i2c_of_probe_get_regulators()
  - Add i2c_of_probe_free_regulator() helper
- Patch 10 "i2c: of-prober: Add GPIO support"
  - Renamed "con" to "propname" in i2c_of_probe_get_gpiod()
  - Copy string first and check return value of strscpy() for overflow in
    i2c_of_probe_get_gpiod()
  - Add parenthesis around "enable" and "reset" GPIO names in comments
  - Split resource count debug message into two separate lines
  - Split out GPIO helper from i2c_of_probe_enable_res() to keep code
    cleaner following the previous patch
  - Adopted options for customizing power sequencing delay following
    previous patch
- Patch 11 "platform/chrome: Introduce device tree hardware prober"
  - Adapt to new i2c_of_probe_component() parameters
- Patch 12 "arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and
	    trackpads as fail"
  - None

See v5 cover letter for previous change logs.

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

Patch 2 adds for_each_child_of_node_with_prefix(), as suggested by Andy.

Patches 3 through 4 reorganize the OF-specific regulator core code and
adds a new of_regulator_get_optional() function to look up regulator
supplies solely using device tree nodes.

Patch 5 cleans up some extra spaces in the i2c core Makefile

Patch 6 implements probing the I2C bus for presence of components as
a hookable helper function in the I2C core.

Patch 7 implements regulator supply support as a set of simple helpers
for the I2C component prober.

Patch 8 implements GPIO support for the I2C component prober simple
helpers.

Patch 9 adds a ChromeOS specific DT hardware prober. This initial
version targets the Hana Chromebooks, probing its I2C trackpads and
touchscreens.

Patch 10 modifies the Hana device tree and marks the touchscreens
and trackpads as "fail-needs-probe", ready for the driver to probe.


The patch and build time dependencies for this series is now quite
complicated:

  regulator cleanups in -next -> regulator patches here ----
							   |
							   v
  platform/chrome device tree hardware prober <--- i2c of-prober
 
The regulator patches in this series depend on other cleanup patches [1]
that are already in -next. Patches 6 through 8 introducting i2c of-prober
depend on the first 5 patches. Patch 11, The chrome prober, depends on
patch 6 for now.

I think it would be easier if the respective maintainers take the first
four patches for -rc1. Wolfram has agreed to take the remaining i2c and
chrome patches through the i2c tree once the other bits have landed,
Patch 12 can go in only after everything else is in. This should be
better than having an immutable branch on top of some commit in -next
for other trees to consume.

This might be the last revision I send out before ELCE / Plumbers, as
I'm traveling to Austria a few day earlier. If there are more concerns
about the design, maybe we could discuss it in person then if all
concerned parties are present.


Thanks
ChenYu


Chen-Yu Tsai (10):
  of: dynamic: Add of_changeset_update_prop_string
  of: base: Add for_each_child_of_node_with_prefix()
  regulator: Split up _regulator_get()
  regulator: Add of_regulator_get_optional() for pure DT regulator
    lookup
  i2c: core: Remove extra space in Makefile
  i2c: Introduce OF component probe function
  i2c: of-prober: Add simple helpers for regulator support
  i2c: of-prober: Add GPIO support to simple helpers
  platform/chrome: Introduce device tree hardware prober
  arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and trackpads
    as fail

 MAINTAINERS                                   |   8 +
 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |  13 +
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |   4 +-
 drivers/i2c/Makefile                          |   7 +-
 drivers/i2c/i2c-core-of-prober.c              | 455 ++++++++++++++++++
 drivers/of/base.c                             |  35 ++
 drivers/of/dynamic.c                          |  44 ++
 drivers/platform/chrome/Kconfig               |  11 +
 drivers/platform/chrome/Makefile              |   1 +
 .../platform/chrome/chromeos_of_hw_prober.c   | 125 +++++
 drivers/regulator/core.c                      |  58 ++-
 drivers/regulator/internal.h                  |   6 +
 drivers/regulator/of_regulator.c              |  51 +-
 include/linux/i2c-of-prober.h                 | 131 +++++
 include/linux/of.h                            |  13 +
 include/linux/regulator/consumer.h            |   4 +
 16 files changed, 942 insertions(+), 24 deletions(-)
 create mode 100644 drivers/i2c/i2c-core-of-prober.c
 create mode 100644 drivers/platform/chrome/chromeos_of_hw_prober.c
 create mode 100644 include/linux/i2c-of-prober.h

-- 
2.46.0.598.g6f2099f65c-goog


