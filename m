Return-Path: <linux-i2c+bounces-12866-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D0AB53371
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 15:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D8EF1CC1077
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 13:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7988A322A3E;
	Thu, 11 Sep 2025 13:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bp1UzKVq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFFC2E401;
	Thu, 11 Sep 2025 13:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757596717; cv=none; b=i/DLPofKFrPOF8jFBx5SA2wkz+vB6DRpeAX3LdQrn9bKkL71vblSPkWryeAM4uIuIqEd0LS8Rew/c5l+8KJxWSxiQgrjuX4wN68xKz7SRWY3CXYBSgZamaIg3AGhfbQd14OtImAYwsq4LnjL24DW7o+PlcuP/WSSxax4oaLfDFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757596717; c=relaxed/simple;
	bh=YG/vEhqn3/yG3yOUHYvMDp3IurV7m/ZP6vW11i4EWmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c32EOmPv0S54jcALj+xGGsqb4a+Olu30Z0G9Jaxa/QW350Nz9BvzQU8qwNHwhnysyxuXFIjRnuuv/wnyu68oSulfA5Oo5p1XGyxfEfuydvkTOOKRJtlaBGf3FBx7WKr4UKjM+caw+fT8TcSuShzCrmdJpF3I1Qbws4nkEdiyqRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bp1UzKVq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 494F0C4CEF0;
	Thu, 11 Sep 2025 13:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757596716;
	bh=YG/vEhqn3/yG3yOUHYvMDp3IurV7m/ZP6vW11i4EWmQ=;
	h=From:To:Cc:Subject:Date:From;
	b=Bp1UzKVq5D4iH+KtWvf2g/vd6xeHncUEijGskp5faarVNhcJMhziGwlWJcqZOrPpX
	 1PJDfeY8GinJ0Zwq2IGd7KOm0J06Kg2m3LubADCaGwR/WXf0RM4vZ1bX655tkIEpFE
	 uJWud1krT2mVRp4Qo84O4jy9eGoQPW+1ygN3+OPHL5g3RsOQRyQoCrhYbHnRNRuBOj
	 hHop0rzn5GCbUrwTdivdwCoqpslqB5ioHR+wdeAKpmXgydk7CjydJICsP3orm34X4Z
	 JbGvz63wDVy292KX3Kiio5XX2W26Uwx5/10eQLHS6ZPt7A88cH3QuCQ/8HEHK4pcaE
	 6CvqNsmoS2tdw==
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
Subject: [PATCH v5 0/3] usb/gpio/i2c: Add Intel USBIO USB IO-expander drivers
Date: Thu, 11 Sep 2025 15:18:29 +0200
Message-ID: <20250911131832.59335-1-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All,

Here is v5 of the patch series to add support for the Intel USBIO USB
IO-expander used by the MIPI cameras on various new (Meteor Lake and later)
Intel laptops.

Changes in v5:
- GPIO: Move GPIO_USBIO Kconfig option under 'menu "USB GPIO expanders"'
- I2C: Drop some unnecessary dev_dbg() messages
- I2C: Add I2C_AQ_NO_ZERO_LEN to the adapter quirks

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
the USB tree.

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
 drivers/i2c/busses/i2c-usbio.c | 320 ++++++++++++++
 drivers/usb/misc/Kconfig       |  14 +
 drivers/usb/misc/Makefile      |   1 +
 drivers/usb/misc/usbio.c       | 749 +++++++++++++++++++++++++++++++++
 include/linux/usb/usbio.h      | 177 ++++++++
 11 files changed, 1542 insertions(+)
 create mode 100644 drivers/gpio/gpio-usbio.c
 create mode 100644 drivers/i2c/busses/i2c-usbio.c
 create mode 100644 drivers/usb/misc/usbio.c
 create mode 100644 include/linux/usb/usbio.h

-- 
2.51.0


