Return-Path: <linux-i2c+bounces-12887-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 457EBB53B1D
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 20:13:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45E297A9D44
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 18:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B05873629BA;
	Thu, 11 Sep 2025 18:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FDbtfRbb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640C1346A19;
	Thu, 11 Sep 2025 18:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757614429; cv=none; b=ewcxoNpN9pPGSMFUIbxzzTlwDViFwCPqmJizHonpt7bpmZz45z0jKATBQohC+HEFT610xEf5IttbKePqlLdfeNeH+4oj3M8VvAzGCazJeLcRU9SLJv9inxC/M37XawBE1e7D6Ylro0SPZClWB+YUCS8ntqTqkyy2nh+h8oEXDZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757614429; c=relaxed/simple;
	bh=IWREfiMLNYDx0qFR4p6ULO2jXDiMkvfdP91fjr68waI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WCXyVJOcxVEGzHTAngvwDwbQey3io7XMzrHkuUxh8wZQO1sGbN7HR/4XJz0SK55aQlHpKrAYZbkaUODxulOkaD25CfZwT4T1WVswC7MYq/HNGWCwtkzGxevRdI07lIx+IM2dtWs78N022CsAp25b9QQ+CbiuZPNNVjVlGCCSTrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FDbtfRbb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ACCBC4CEF0;
	Thu, 11 Sep 2025 18:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757614427;
	bh=IWREfiMLNYDx0qFR4p6ULO2jXDiMkvfdP91fjr68waI=;
	h=From:To:Cc:Subject:Date:From;
	b=FDbtfRbbTglEwiYWaBsPqLybViT4JIqOOtvyhRiXnVC8DimBJB5PKPIiclfx+gZuT
	 JMJeOGSxJy1ES3UhpJfQR4M3o/y7DuYEqWskCzR+c6J2bHU4R+jv1J5yHuPqz62Ny5
	 iZtZa/CVS9GjXSmyJo2FiTpYrJ90udYRtNEiVKJ4yu66qPOYqimt7wc7pajeyCnY8M
	 gt8RXhAHccOYn1CpaBlb3AVqZlrkNjvcYRZF+BaEP2gkdM+qbKWtdqHqfzkNDF4n7t
	 U9nVoMtSwnIouU9nxW2lK+lH8/Vbx+/MxK6ZUFEjvx6Ts581YVQqM4NyGDH2gyFWEl
	 kqSyeZEk/AHZw==
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
Subject: [PATCH v6 0/3] usb/gpio/i2c: Add Intel USBIO USB IO-expander drivers
Date: Thu, 11 Sep 2025 20:13:40 +0200
Message-ID: <20250911181343.77398-1-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All,

Here is v6 of the patch series to add support for the Intel USBIO USB
IO-expander used by the MIPI cameras on various new (Meteor Lake and later)
Intel laptops.

Changes in v6:
- Drop I2C_FUNC_10BIT_ADDR from advertised I2C functionality
- Add Bart's Acked-by to the GPIO driver

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


