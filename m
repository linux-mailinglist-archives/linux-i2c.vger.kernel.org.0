Return-Path: <linux-i2c+bounces-12173-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AEAB1F41A
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Aug 2025 12:23:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DFCA721D8A
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Aug 2025 10:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A04DB261595;
	Sat,  9 Aug 2025 10:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O1I2bt4O"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586BB227BB9;
	Sat,  9 Aug 2025 10:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754735019; cv=none; b=s3fvAritmD2gQwPr/yHW6jqIl7rc6aPVmazuO6Ox4UepjFO+BXc7e3A9N/0UEaviUuJC/6rCevYxlDCUXRcZesrELYcbRZnTJEiGkAjBqO5tFpVYXA0HdRThcx4gMnxpTyR82OAFqGvVFmB8y2EBpMD82BsbHaEaHV71T//Dp14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754735019; c=relaxed/simple;
	bh=/Cza+XwEEYSu1v2kYcWi4arWgCVPqIJudOZevf/Kd2A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O2qq7ZiCIav590OUCUOq1J6BFyqgSN3Oqh30tdxCspiQwumt5FOiBNZlsz3s3HZUWCFKgmbTvGgdio2ZIK8Udm2LlwcHGT6WimpDa1G5g/OsC5ciVe2v+aJbuYPm8Gvq3pRZfTZDkq6TPXW7IXDqf1QkhunqXIsYO0KTST69Oig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O1I2bt4O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D1A7C4CEE7;
	Sat,  9 Aug 2025 10:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754735016;
	bh=/Cza+XwEEYSu1v2kYcWi4arWgCVPqIJudOZevf/Kd2A=;
	h=From:To:Cc:Subject:Date:From;
	b=O1I2bt4ObbabNQFxaet24m4YNNmjlmYkI1LSSXzQafp2VOEk3DVnUypctjswMfqmn
	 LW9HBVoPW5/15nqhqD9XbPgo6R0Rgzc+y4XIFEQjW+3c63H3LojgxC2AWmaeqwGuwH
	 37QA81pEDDYu41yslA9hPm6je02YCT4fRPInile3A8KdrcuYMH9Dg85nMCnaMtH4Qu
	 REPlsCo8jXQ9PLmBZaKhFHZV5JNlLDGmsaohbGtUKfFTi749YuDPKbri2F+8Zer9RT
	 LpSGI7b4NPL7qwVkeCdHpn5IMLfR6XRZxC36n4IyU+TUqZ0T6bWMkMxUyV9dIiQ5pR
	 HcjI1dMfZpBOg==
From: Hans de Goede <hansg@kernel.org>
To: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Richard Hughes <rhughes@redhat.com>,
	linux-i2c@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH 0/3] usb/gpio/i2c: Add Intel USBIO USB IO-expander drivers
Date: Sat,  9 Aug 2025 12:23:23 +0200
Message-ID: <20250809102326.6032-1-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All,

This patch series adds support for the Intel USBIO USB IO-expander used by
the MIPI cameras on various new (Meteor Lake and later) Intel laptops.

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

 MAINTAINERS                    |   9 +
 drivers/gpio/Kconfig           |  11 +
 drivers/gpio/Makefile          |   1 +
 drivers/gpio/gpio-usbio.c      | 258 ++++++++++++
 drivers/i2c/busses/Kconfig     |  11 +
 drivers/i2c/busses/Makefile    |   1 +
 drivers/i2c/busses/i2c-usbio.c | 344 ++++++++++++++++
 drivers/usb/misc/Kconfig       |  14 +
 drivers/usb/misc/Makefile      |   1 +
 drivers/usb/misc/usbio.c       | 693 +++++++++++++++++++++++++++++++++
 include/linux/usb/usbio.h      | 168 ++++++++
 11 files changed, 1511 insertions(+)
 create mode 100644 drivers/gpio/gpio-usbio.c
 create mode 100644 drivers/i2c/busses/i2c-usbio.c
 create mode 100644 drivers/usb/misc/usbio.c
 create mode 100644 include/linux/usb/usbio.h

-- 
2.49.0


