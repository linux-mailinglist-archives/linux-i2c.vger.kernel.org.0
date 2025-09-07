Return-Path: <linux-i2c+bounces-12719-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CC4B47CA4
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 19:51:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4CE43B9AA1
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 17:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F561286D5C;
	Sun,  7 Sep 2025 17:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CIuVoiTi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A5D3C465;
	Sun,  7 Sep 2025 17:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757267462; cv=none; b=Q5UL/3kXPw9rWLlzyuYzwRqM5kbBA945SLYVCtTI34UW8M1gmG9yTpfJecMSsEHHIMj1FP6JxacDIyRPtT7dNoUfuawzE7fNo3ipCEDKB8W8xawqWfPxZiG4waMIMkQbyUFnm1pjJpFIr9Lg+TppUmw7FYlUbZb8511lHeqb/cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757267462; c=relaxed/simple;
	bh=wwPZ3HomiYGGjQ62hDXA3II6GwdL97z+pd2v39RBOJU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oCzkiBLUKk89MrVZp/AofbpqM/emSqOV327RQhN0tZjYPH4vV0iXzt7iERYD94d1RL0sBKxFJ9l6c5eeNwGGK6GsZsRWF1a8zWVoqh0lCvEzO8TzYFBaj92CJhlNuBMOIBH9mYt5iuZUkrNHove+xwIjZaXHLgIIu2HSfh3vFhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CIuVoiTi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05137C4CEF0;
	Sun,  7 Sep 2025 17:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757267461;
	bh=wwPZ3HomiYGGjQ62hDXA3II6GwdL97z+pd2v39RBOJU=;
	h=From:To:Cc:Subject:Date:From;
	b=CIuVoiTiVnzPgiXxRf/qWvoOjBaOvxDwS6XgAP3Ent0B1v6rW1+DiJY+ing/RBTmc
	 6e3ieyECdgihpgmWxv50Tk7c4GEQNC8tfZMS/G9rwsabrP4OiDYH8TCAlRTgz7H1W3
	 Bu1+Y0ilLtFr4SVeVSX6zN2afGYfElWVFoK2Hb5NG94rgYxBEmE0s6WKjWIaHCbg6n
	 /V7vmxg3ZiJkZYMpBGXp7m9aZeWDpzZgHGmQ3O/SqN2jGc8Yt2+MTmogoMmZ3kAc+N
	 n7yL6Av9TWxpvtMhxg3qNUhgiDvDUegeB1lYKY2h/7ACEvACRu+NQtYSt4KVjn8UVn
	 o80EjKT2KXP3g==
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
Subject: [PATCH v2 0/3] usb/gpio/i2c: Add Intel USBIO USB IO-expander drivers
Date: Sun,  7 Sep 2025 19:50:53 +0200
Message-ID: <20250907175056.47314-1-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All,

Here is v2 of the patch series to add support for the Intel USBIO USB
IO-expander used by the MIPI cameras on various new (Meteor Lake and later)
Intel laptops.

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
 drivers/gpio/gpio-usbio.c      | 266 ++++++++++++
 drivers/i2c/busses/Kconfig     |  11 +
 drivers/i2c/busses/Makefile    |   1 +
 drivers/i2c/busses/i2c-usbio.c | 325 ++++++++++++++
 drivers/usb/misc/Kconfig       |  14 +
 drivers/usb/misc/Makefile      |   1 +
 drivers/usb/misc/usbio.c       | 748 +++++++++++++++++++++++++++++++++
 include/linux/usb/usbio.h      | 177 ++++++++
 11 files changed, 1565 insertions(+)
 create mode 100644 drivers/gpio/gpio-usbio.c
 create mode 100644 drivers/i2c/busses/i2c-usbio.c
 create mode 100644 drivers/usb/misc/usbio.c
 create mode 100644 include/linux/usb/usbio.h

-- 
2.51.0


