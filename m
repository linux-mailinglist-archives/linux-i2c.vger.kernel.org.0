Return-Path: <linux-i2c+bounces-497-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4367FB495
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 09:45:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAD4D281B15
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 08:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E638119463;
	Tue, 28 Nov 2023 08:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SLRRJjWL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9607510E4
	for <linux-i2c@vger.kernel.org>; Tue, 28 Nov 2023 00:45:01 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1cfbce92362so18408325ad.1
        for <linux-i2c@vger.kernel.org>; Tue, 28 Nov 2023 00:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701161101; x=1701765901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RQ8OywwOJb3LFaBwr6mMhYpmBsDcdIoX+4ygc5IgZ6U=;
        b=SLRRJjWL9nUXo04Hq0FLqCMjg6PpRewsCugnE0Os7hG156LDM8//rXW5FTBnxRiAHC
         32pkW9KT6Yy65WMRAjXRN+Xts/fxv9iGm0kqGUNGUhb1BNhJKxngoShxCWkifMGkrEI6
         Ez+UcSldhdDymNXpNVg36e816neGwA/MCEMn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701161101; x=1701765901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RQ8OywwOJb3LFaBwr6mMhYpmBsDcdIoX+4ygc5IgZ6U=;
        b=fHxkyBtJd97tx+KS/x/eqqYGqyrN+O/q0IMuoGI0ApUXLKFEyR89vuKo8GvUIaHRse
         ItuEA/uMr1GsugXUQ+3wXbvgAVKly3+ZWaQlRKWo9YiO5ou3ltSSsxtAF6DBHTkSt41A
         FX9U00h4jwkkH+DVdKgqbFiAoIojn3xdBbKfB9tyIHxs43eHowbI1iU/xwp5sdbZvHkd
         KJj+isDirdm+YGhl7Zdm+uZ4lT9DQjvLr6C7DXAYgz1fUwnbTd0VALcuQZ1/a7LLoDj4
         fEQhXy5EJHstA37mlvLlWA9qZpPkzJ61P1ZSCFYK8aRnqO242lzZKLEl8SLpPXwNx154
         QTnA==
X-Gm-Message-State: AOJu0Yz2gdqe1I14AR06Rue8oWGyKkueK0Vc7rkDh0BTf/nhWy5Dp9Un
	GuIq1U+Bw/4wBEuVkqLbDw0B/A==
X-Google-Smtp-Source: AGHT+IE+ifoo8mgSxSw5S/xxmI2DMsomMPuTsaot5+xQeJxVwLn/vJiYkhRhgcbDX2yhQ4p2oAgnhg==
X-Received: by 2002:a17:903:22c9:b0:1cf:7bf7:e648 with SMTP id y9-20020a17090322c900b001cf7bf7e648mr25962620plg.33.1701161100925;
        Tue, 28 Nov 2023 00:45:00 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:a990:1e95:a915:9c70])
        by smtp.gmail.com with ESMTPSA id j1-20020a170902c08100b001ab39cd875csm8358074pld.133.2023.11.28.00.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 00:45:00 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
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
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	andriy.shevchenko@linux.intel.com,
	Jiri Kosina <jikos@kernel.org>,
	linus.walleij@linaro.org,
	broonie@kernel.org,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	james.clark@arm.com,
	james@equiv.tech,
	keescook@chromium.org,
	rafael@kernel.org,
	tglx@linutronix.de,
	Jeff LaBundy <jeff@labundy.com>,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [RFC PATCH v3 0/5] platform/chrome: Introduce DT hardware prober
Date: Tue, 28 Nov 2023 16:42:29 +0800
Message-ID: <20231128084236.157152-1-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

This is v3 of my "of: Introduce hardware prober driver" [1] series.
v2 continued Doug's "of: device: Support 2nd sources of probeable but
undiscoverable devices" [2] series, but follows the scheme suggested by Rob, marking all second
source component device nodes as "fail-needs-probe", and having a
hardware prober driver enable the one of them. I tried to include
everyone from the original Cc: list. Please let me know if you would
like to be dropped from future submissions.

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
via ribbon cable and always have the same resources. The driver as
implemented currently doesn't deal with regulators or GPIO pins,
since in the existing device trees they are either always on for
regulators, or have GPIO hogs or pinmux and pinconfig directly
tied to the pin controller.

The other case, selecting a display panel to use based on the SKU ID
from the firmware, hit a bit of an issue with fixing the OF graph.
I've left it out of v3 for now.

Patch 1 adds of_changeset_update_prop_string(), as requested by Rob.

Patch 2 implements probing the I2C bus for presence of components as
a helper function in the I2C core.

Patch 3 adds a ChromeOS specific DT hardware prober. This initial
version targets the Hana Chromebooks, probing its I2C trackpads and
touchscreens.

Patch 4 modifies the Hana device tree and marks the touchscreens
and trackpads as "fail-needs-probe", ready for the driver to probe.

Patch 5 adds a missing touchscreen variant to Hana. This patch
conflicts with another one in flight [3] that is almost the same.


Assuming this is acceptable to folks, because there are compile
time dependencies, I think it would be easier for the code bits
(patches 1 through 4) to go through either the OF tree or I2C
tree. Patches 5 and 6 can go through the soc tree via the mediatek
tree.


Thanks
ChenYu


Background as given in Doug's cover letter:

Support for multiple "equivalent" sources for components (also known
as second sourcing components) is a standard practice that helps keep
cost down and also makes sure that if one component is unavailable due
to a shortage that we don't need to stop production for the whole
product.

Some components are very easy to second source. eMMC, for instance, is
fully discoverable and probable so you can stuff a wide variety of
similar eMMC chips on your board and things will work without a hitch.

Some components are more difficult to second source, specifically
because it's difficult for software to probe what component is present
on any given board. In cases like this software is provided
supplementary information to help it, like a GPIO strap or a SKU ID
programmed into an EEPROM. This helpful information can allow the
bootloader to select a different device tree. The various different
"SKUs" of different Chromebooks are examples of this.

Some components are somewhere in between. These in-between components
are the subject of this patch. Specifically, these components are
easily "probeable" but not easily "discoverable".

A good example of a probeable but undiscoverable device is an
i2c-connected touchscreen or trackpad. Two separate components may be
electrically compatible with each other and may have compatible power
sequencing requirements but may require different software. If
software is told about the different possible components (because it
can't discover them), it can safely probe them to figure out which
ones are present.

On systems using device tree, if we want to tell the OS about all of
the different components we need to list them all in the device
tree. This leads to a problem. The multiple sources for components
likely use the same resources (GPIOs, interrupts, regulators). If the
OS tries to probe all of these components at the same time then it
will detect a resource conflict and that's a fatal error.

The fact that Linux can't handle these probeable but undiscoverable
devices well has had a few consequences:
1. In some cases, we've abandoned the idea of second sourcing
   components for a given board, which increases cost / generates
   manufacturing headaches.
2. In some cases, we've been forced to add some sort of strapping /
   EEPROM to indicate which component is present. This adds difficulty
   to manufacturing / refurb processes.
3. In some cases, we've managed to make things work by the skin of our
   teeth through slightly hacky solutions. Specifically, if we remove
   the "pinctrl" entry from the various options then it won't
   conflict. Regulators inherently can have more than one consumer, so
   as long as there are no GPIOs involved in power sequencing and
   probing devices then things can work. This is how
   "sc8280xp-lenovo-thinkpad-x13s" works and also how
   "mt8173-elm-hana" works.

End of background from Doug's cover letter.

[1] https://lore.kernel.org/linux-arm-kernel/20231109100606.1245545-1-wenst@chromium.org/
[2] https://lore.kernel.org/all/20230921102420.RFC.1.I9dddd99ccdca175e3ceb1b9fa1827df0928c5101@changeid/
[3] https://lore.kernel.org/linux-mediatek/20231115043511.2670477-1-treapking@chromium.org/

Chen-Yu Tsai (5):
  of: dynamic: Add of_changeset_update_prop_string
  i2c: of: Introduce component probe function
  platform/chrome: Introduce device tree hardware prober
  arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and trackpads
    as fail
  arm64: dts: mediatek: mt8173-elm-hana: Add G2touch G7500 touchscreen

 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |  20 ++++
 drivers/i2c/i2c-core-of.c                     | 110 ++++++++++++++++++
 drivers/of/dynamic.c                          |  47 ++++++++
 drivers/platform/chrome/Kconfig               |  11 ++
 drivers/platform/chrome/Makefile              |   1 +
 .../platform/chrome/chromeos_of_hw_prober.c   |  89 ++++++++++++++
 include/linux/i2c.h                           |   4 +
 include/linux/of.h                            |   3 +
 8 files changed, 285 insertions(+)
 create mode 100644 drivers/platform/chrome/chromeos_of_hw_prober.c

-- 
2.43.0.rc1.413.gea7ed67945-goog


