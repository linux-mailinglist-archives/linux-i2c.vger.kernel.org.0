Return-Path: <linux-i2c+bounces-12834-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC76B51813
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Sep 2025 15:40:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A54337AC8A3
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Sep 2025 13:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C6C031A058;
	Wed, 10 Sep 2025 13:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LIhoxWVn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FF626D4ED;
	Wed, 10 Sep 2025 13:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757511604; cv=none; b=Pa3usHB9Pq22NlbMV3S5CPoZh/wXjiMxofAD2M4Lh5sAuDX+EBSuuy9819nDp/2wyss3Nva+0rC+QRs9eONMk+IHYNQqJ5ezGqu4UdlsZ0tZG072YEjNPYuyRPlUpUKnk/SHzSNcDkU2Zwhyvg9l3VJQiHYKLTA3OWAGHMj19Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757511604; c=relaxed/simple;
	bh=8pfs23VGcu5vYHDcIs6nHSQ9NyiHhGs+taIIA0BWxSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VgWInR9D895kRrBk20LQNaUDPJoqAuLsmoUO0BI9H6UyZ2Az1tCOp3YvqAhoWPtdDYRrAA7YCGJETTcxNm4PyhAk+F5MCrML8ZnCffsM0f/90y7rX2TdSLcUlKwxaJwnE2aOw1EnYC3EWg1/zDvy/uH68MCHeNn9IldRyMIXe+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LIhoxWVn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4CADC4CEF0;
	Wed, 10 Sep 2025 13:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757511603;
	bh=8pfs23VGcu5vYHDcIs6nHSQ9NyiHhGs+taIIA0BWxSY=;
	h=From:To:Cc:Subject:Date:From;
	b=LIhoxWVnRYcJ7xFvMbgZ0Fj6iXaY70KxBsLzHUQnVIZS+rQN0V1EdAHE7issNFOOz
	 K4qcufu1dA2gC2/nOzdKPOBwbK0ziiWqbyVDLGsI/wkMcgQIE03O4yL2eUFZ+RokbE
	 xeHjZjycgd+9V7hgJHJAxuW0SIus8ml3DjBvw+1Bk/AAFS078apdlFJ7nY5rAdwFOz
	 kLngdKC0qlVhrgad8Hq9R5bSrHPo2lBjWKiDaDGRnl/kzKEj2BW8JzI8aS3rlhkoMv
	 8aaZrRjkhDvyGttrWgu0A5mCQFIglO2Hpl4hG1Z8sWjeoePysHNVZ+lLo3x354Yebz
	 df+7bJgp3Bxmg==
From: Hans de Goede <hansg@kernel.org>
To: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Richard Hughes <rhughes@redhat.com>,
	linux-i2c@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v4 0/3] usb/gpio/i2c: Add Intel USBIO USB IO-expander drivers
Date: Wed, 10 Sep 2025 15:39:55 +0200
Message-ID: <20250910133958.224921-1-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All,

Here is v4 of the patch series to add support for the Intel USBIO USB
IO-expander used by the MIPI cameras on various new (Meteor Lake and later)
Intel laptops.

Changes in v4:
- GPIO: Drop include <linux/dev_printk.h>, unneeded auxiliary_set_drvdata()

Changes in v3:
- Drop (offset >= gc->ngpio) check and make usbio_gpio_get_bank_and_pin()
  return void
- Propagate usbio_gpio_set() ret val in usbio_gpio_direction_output()
- Use devm_gpiochip_add_data() and drop auxiliary_driver remove() callback

Changes in v2:
- Split usbio-bridge mutex into ctrl_mutex and bulk_mutex
- Drop SPI support since this is not used on devices in the field
- Rework disconnect handling to be more robust
- Several different revisions need special casing add a quirks mechanism
  for this
- Stop using stdint.h (uintX_t) types
- Use __le16, __le32 type + cpu_to_le16() and friends for on wire words
- Properly check auxiliary_device_add() return value
- Add a mutex to the GPIO driver to protect usbio_gpio_update_config()
  calls, which read-modify-write banks[x].config, racing with each other
- Adjust usbio_gpio_get() to have an int return value and propagate the
  usbio_control_msg() return value
- Various (small) style fixes from Sakari's review of all 3 patches

The first patch adds an USB bridge driver which registers auxbus children
for the GPIO and I2C functions of the USBIO chip.

The second and third patch add a GPIO resp. an I2C driver for the
auxbus children using the IO functions exported by the USB bridge driver.

The second and third patch depend on the IO functions exported by
the first patch. So to merge this we will need either an immutable tag on
the USB tree, or all 3 patches can be merged through the USB tree with
acks from the GPIO and I2C subsystem maintainers.

Regards,

Hans


Israel Cepeda (3):
  usb: misc: Add Intel USBIO bridge driver
  gpio: Add Intel USBIO GPIO driver
  i2c: Add Intel USBIO I2C driver

 MAINTAINERS                    |  10 +
 drivers/gpio/Kconfig           |  11 +
 drivers/gpio/Makefile          |   1 +
 drivers/gpio/gpio-usbio.c      | 247 +++++++++++
 drivers/i2c/busses/Kconfig     |  11 +
 drivers/i2c/busses/Makefile    |   1 +
 drivers/i2c/busses/i2c-usbio.c | 325 ++++++++++++++
 drivers/usb/misc/Kconfig       |  14 +
 drivers/usb/misc/Makefile      |   1 +
 drivers/usb/misc/usbio.c       | 749 +++++++++++++++++++++++++++++++++
 include/linux/usb/usbio.h      | 177 ++++++++
 11 files changed, 1547 insertions(+)
 create mode 100644 drivers/gpio/gpio-usbio.c
 create mode 100644 drivers/i2c/busses/i2c-usbio.c
 create mode 100644 drivers/usb/misc/usbio.c
 create mode 100644 include/linux/usb/usbio.h

-- 
2.51.0


