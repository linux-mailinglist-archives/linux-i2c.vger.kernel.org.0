Return-Path: <linux-i2c+bounces-7449-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B709A1EA3
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 11:42:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C72B81C20F5A
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 09:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444BE1D9359;
	Thu, 17 Oct 2024 09:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U7VVQ7Zj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D871D4342
	for <linux-i2c@vger.kernel.org>; Thu, 17 Oct 2024 09:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729158154; cv=none; b=SjA7DvaDSE4rDQP279poZkad4WbBrLLwRfepHKkFdnIxSJN56X9QNAiUySMoSPQRLs4JsSSzYYWwLY2MeTaH/f3ausxdwSKBUswXwhYq6jdn946+q9Tt5X5uh1rzUMG0S+FysxxbKMl64AcfKCeKOKkItuMbAuSvmg4cAqk75eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729158154; c=relaxed/simple;
	bh=BW/sR2I9PDJPnCXPVUbYo4f9EG0zNfMFEDa9SWIUeP0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CCoI99EFauKGy0RqUVYhEtIvjUfVRsGIGQiRxPtX/2bjEWxcrsUkZRJPNv9KTutRX0rxX71eKwIIKeEHxQwc6jqoAjpe4f7ZuQzAckppyn5IXk0zYaNx0LfWSN5fdqq7vUzrujwnyxNOUEzAjOTNbKnTu40J8RHwdQf9OgKzkJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U7VVQ7Zj; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20b5affde14so4939655ad.3
        for <linux-i2c@vger.kernel.org>; Thu, 17 Oct 2024 02:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729158151; x=1729762951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qhcJRnkptF7hSLZci2u/TRFoETL1ldmnk+rBBuGuOXI=;
        b=U7VVQ7ZjfS40byR19rxQCbrwfzRgxezhsw4BF+Z77oh/yFHUaVxDlXcExGOQICVmaZ
         ZHsVsPZ81S0Wz69E3AOpg84xf6bd98sOCPahA3lSEj/cqbyhC8ZagFmbgzFs940DxAVK
         H4y+Adr29LlH68b4XdePE7xjyA/oWfgsFdgr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729158151; x=1729762951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhcJRnkptF7hSLZci2u/TRFoETL1ldmnk+rBBuGuOXI=;
        b=gqnnFaQOJp/Hyk23ZVKHGbaT3WxgW/3JF5Y03LqB9010+rfAZSeVdbPz9BTunVC9W4
         jpIL1b1LNCMa0IhwRVlFeqSZKs6wi6IYsEN0iLEfnSdIoFvLRuyAaLtSZ+neraLeOdyx
         nY9SLG8oNK/nJXw5vi6jDD3iq5VgnMCzKkSMQNr9x3mO6T3Kz4L1tO0Kjlep1mAvj7ug
         d4Tx2blZdUoMyqgYc24Id2lduHxJZgXeIQbUhHN2Qt0yOKVDH6JHXIus4JRcRHRMUkzX
         IZZQ3qqvZigLNRIP249UcJtKgVvAv+rHph2Ffhfx6XkNFZoNKoMmY8VBkKJSZSjrpsyo
         giow==
X-Forwarded-Encrypted: i=1; AJvYcCUlTE21Q+R+MfU6tkLEUAPbwQrtCPBqPeB4wdZDnOVzn6jLbGE3dS9JHPKWwEnSc8YDjC+B3FFB38Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNV3XSFENyIDTxdkadrZAWF+C6ZLaYn0c8zcKbYaR+h2j3UjIX
	mL3W/MHRhI/YgOTAd6qk2YaGHH83aiwSzyg4GcWyQQ0ktePjw2qgro070t4+sQ==
X-Google-Smtp-Source: AGHT+IF/IC+aeuBtTap/PKQzO4i5s8SlIErDSZdLt05AwBOrV+ByFlnqbT3N/nNBC/+cEpOIi72paw==
X-Received: by 2002:a17:903:22d2:b0:20c:9821:6998 with SMTP id d9443c01a7336-20d27e7eb3emr91012465ad.10.1729158151545;
        Thu, 17 Oct 2024 02:42:31 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fabb:a7ab:3d7:9aaa])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d17f87ccasm40638655ad.62.2024.10.17.02.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 02:42:31 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
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
Subject: [PATCH v9 0/7] platform/chrome: Introduce DT hardware prober
Date: Thu, 17 Oct 2024 17:34:35 +0800
Message-ID: <20241017094222.1014936-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

This is v9 of my "of: Introduce hardware prober driver" series.
v8 mainly reduced the number of callbacks as Doug suggested, and
addressed all the review comments. The trackpad probing was converted
to use the simple helpers, however in practice it still behaves like
the dumb probing, since the regulator supply is marked as always on
in the DT, and the delay is set to 0 to preserve present behavior.

Changes since v9:
- Link to v8:
  https://lore.kernel.org/all/20241008073430.3992087-1-wenst@chromium.org/
- Patch "i2c: core: Remove extra space in Makefile" was merged and
  dropped from this version
- Patch 3 "i2c: Introduce OF component probe function"
  - Added missing include of <linux/kconfig.h> to i2c-of-prober.h
  - Expanded description of i2c_of_probe_ops::enable to mention that
    returning -EPROBE_DEFER is valid (Doug)
  - Reworded descrption of i2c_of_probe_ops::cleanup_early to avoid
    confusion with i2c_of_probe_ops::enable (Doug)
  - Reworked i2c_of_probe_get_i2c_node() to return NULL on failure,
    matching most functions that return |struct device_node *|.
- Patch 4 "i2c: of-prober: Add simple helpers for regulator support"
  - Picked up Doug's reviewed-by
- Patch 5 "i2c: of-prober: Add GPIO support to simple helpers"
  - Moved |struct gpio_desc| forward declaration before |struct regulator|
    (Andy)
  - Dropped GPIO descriptor validity check from
    i2c_of_probe_simple_disable_gpio(); GPIO functions check it (Andy)
  - Dropped comment from i2c_of_probe_simple_disable_gpio() (Doug)
  - Reworded comment in i2c_of_probe_simple_cleanup() (Doug)
  - Picked up Doug's reviewed-by
- Patch 6 "platform/chrome: Introduce device tree hardware prober"
  - Added trailing commas on last field in struct variable declarations
    (Andy)
  - Added macros wrapping chromeos_i2c_probe_dumb_* and
    chromeos_i2c_probe_simple_*_cfg variable declarations (Andy)
  - Split up hw_prober_platforms into one field per line (Andy)
  - Picked up Doug's reviewed-by
- Patch 7 "arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and
	   trackpads as fail"

The older changelog entries have been moved to the bottom of the cover
letter.


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

Patch 3 implements probing the I2C bus for presence of components as
a hookable helper function in the I2C core.

Patch 4 implements regulator supply support as a set of simple helpers
for the I2C component prober.

Patch 5 implements GPIO support for the I2C component prober simple
helpers.

Patch 6 adds a ChromeOS specific DT hardware prober. This initial
version targets the Hana Chromebooks, probing its I2C trackpads and
touchscreens.

Patch 7 modifies the Hana device tree and marks the touchscreens
and trackpads as "fail-needs-probe", ready for the driver to probe.


The regulator parts were merged separately with an immutable tag [1]. Rob
already gave his Reviewed-by for the OF bits, and I assume he is OK with
them going through a different branch. So I believe it is fine for
Wolfram to take all the patch except the last one through the I2C tree.
The last DTS patch can be merged through the MediaTek tree once the
driver bits land.


Thanks
ChenYu


[1] https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git/tag/?h=regulator-of-get-optional

Changes since v7:
- Link to v7:
  https://lore.kernel.org/all/20240911072751.365361-1-wenst@chromium.org/
- Patch 2 "of: base: Add for_each_child_of_node_with_prefix()"
  - Collected Rob's Reviewed-by
- Patch 3 "i2c: core: Remove extra space in Makefile"
  - Collected Andi's Reviewed-by
- Patch 4 "i2c: Introduce OF component probe function"
  - Dropped log level of "enabling component" to debug
  - Dropped file name from header file
  - Reverted to __free() cleanup for i2c bus node
  - Corrected "failed-needs-probe" to "fail-needs-probe" in commit message
  - Fixed incorrectly positioned period ('.') in commit message
  - Expanded description of i2c_of_probe_component()
  - Expanded comment explaining check for "available" devices to note that
    if such a device is found then the i2c probe function becomes a no-op
  - Simplified check for "available" devices for-each loop
  - Expanded description of @free_resources_early callback to explicitly
    state that it is not called if no working components are found
  - Dropped !cfg check
  - Replaced "fail" with "fail-needs-probe" in i2c_of_probe_component()
    kernel doc
  - Combined callbacks (.get_resources with .enable; .cleanup with
    .free_resources_late); .free_resources_early renamed to .cleanup_early
- Patch 5 "i2c: of-prober: Add simple helpers for regulator support"
  - Reworded comment in i2c_of_probe_simple_get_supply() as suggested
    (Andy)
  - Dropped mention of time unit in struct i2c_of_probe_simple_opts
    kernel doc (Andy)
  - Added mention of common GPIO line usages ("enable" or "reset") in I2C
    OF component prober kernel doc (Doug)
  - Added check for non-zero delay before msleep() (Doug)
  - Combined callback helpers (.get_resources with .enable; .cleanup with
    .free_resources_late)
- Patch 6 "i2c: of-prober: Add GPIO support to simple helpers"
  - Dropped mention of time unit in struct i2c_of_probe_simple_opts
    kernel doc (Andy)
  - Added check for non-zero delay before msleep() (Doug)
  - Simplified GPIO name check and reverse conditional branches (Andy)
  - Added description about the supported power sequence
  - Switched GPIO usage to logical levels (Doug)
    - Changed some variable names and comments to fit
  - Added description of power sequence to struct i2c_of_probe_simple_opts
    (Doug)
  - Added comment saying i2c_of_probe_simple_put_gpiod() might be no-op
    (Doug)
  - Combined callbacks (.get_resources with .enable; .cleanup with
    .free_resources_late); renamed i2c_of_probe_simple_free_res_early() to
    i2c_of_probe_simple_cleanup_early()
- Patch 7 "platform/chrome: Introduce device tree hardware prober"
  - Corrected Makefile item order
  - Replaced "failed-needs-probe" with "fail-needs-probe" in commit message
  - Added include of "linux/of.h" for of_machine_is_compatible()
  - Switched to simple probe helpers for trackpads on Hana
- Patch 8 "arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and
	   trackpads as fail"
  - Mark touchscreen@40 as "fail-needs-probe" as well

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

Chen-Yu Tsai (7):
  of: dynamic: Add of_changeset_update_prop_string
  of: base: Add for_each_child_of_node_with_prefix()
  i2c: Introduce OF component probe function
  i2c: of-prober: Add simple helpers for regulator support
  i2c: of-prober: Add GPIO support to simple helpers
  platform/chrome: Introduce device tree hardware prober
  arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and trackpads
    as fail

 MAINTAINERS                                   |   8 +
 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |  14 +
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |   4 +-
 drivers/i2c/Makefile                          |   1 +
 drivers/i2c/i2c-core-of-prober.c              | 414 ++++++++++++++++++
 drivers/of/base.c                             |  35 ++
 drivers/of/dynamic.c                          |  44 ++
 drivers/platform/chrome/Kconfig               |  11 +
 drivers/platform/chrome/Makefile              |   1 +
 .../platform/chrome/chromeos_of_hw_prober.c   | 153 +++++++
 include/linux/i2c-of-prober.h                 | 139 ++++++
 include/linux/of.h                            |  13 +
 12 files changed, 835 insertions(+), 2 deletions(-)
 create mode 100644 drivers/i2c/i2c-core-of-prober.c
 create mode 100644 drivers/platform/chrome/chromeos_of_hw_prober.c
 create mode 100644 include/linux/i2c-of-prober.h

-- 
2.47.0.rc1.288.g06298d1525-goog


