Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 407EE105D5B
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2019 00:45:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbfKUXpg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Nov 2019 18:45:36 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:46793 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbfKUXpf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Nov 2019 18:45:35 -0500
Received: by mail-io1-f68.google.com with SMTP id i11so5656314iol.13
        for <linux-i2c@vger.kernel.org>; Thu, 21 Nov 2019 15:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xVRgrLSCAFxYcp99UUv/8W7CrNBLjuLXqwGlUdfznH4=;
        b=hD2T2mJU38DbdWzcb5auwQSXdeGCfccahv78ZqhqF4dluyI3MAFauUjDkcYRnuDaX1
         2eVVRprveqA5cZEdFjc+tgCJ1hxwnsJjzmG4u6nKTcFEEhW1QE+akJybQee8fpTYPJiK
         arlTXD3fPF9jByFHbNtp+KcZQh7AKTJ1t/Bjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xVRgrLSCAFxYcp99UUv/8W7CrNBLjuLXqwGlUdfznH4=;
        b=Ef1PZ2jAhextPeQ5XBgsRYEOJtb2CYgHlquW9KwblV7JA/8Pi8MdsK2nnvJb2+ky9J
         xzYQGNx8uTv0tSX+hXks7RAcOMmXvJ1iepHjLTGC8se3LKKjlSm27yMXbol3y1U4PYOG
         0yPMn2dxjUSq+TbVxhTBactGX0txd9A+uuP0YoKKG9dr5Kh0/W3zzlOkIkCvdd0vUOQE
         tWWQE5oQvMVsvWpy94HjVJ76MVSe+eLQjIUl6EquUFdJItVg88tMK3hI+P7iWlyMHNaB
         LjfoSOZ9F6x6qZDkELeneXhP2/iNfIAfnldvWC+BkeOdYwFfGF8AmpmfhiI5Uw6ra2sn
         6nig==
X-Gm-Message-State: APjAAAUi5u9OagKMYWKgoTX602B1xxQibJP3u2oOrS0i/P+KP4S1CDUv
        v0LMVTNF3Lr2T+1eXBxEsnJfkQ==
X-Google-Smtp-Source: APXvYqxHV0td2ruD1zRIQzusvrXHIP0baWCmRtvIR53/XBsyPdhJhro8EKZQraYM5cJgOjAEpmY5kg==
X-Received: by 2002:a5d:9e10:: with SMTP id h16mr9705425ioh.27.1574379933688;
        Thu, 21 Nov 2019 15:45:33 -0800 (PST)
Received: from localhost ([2620:15c:183:0:82e0:aef8:11bc:24c4])
        by smtp.gmail.com with ESMTPSA id c83sm1539820iof.48.2019.11.21.15.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2019 15:45:33 -0800 (PST)
From:   Raul E Rangel <rrangel@chromium.org>
To:     enric.balletbo@collabora.com
Cc:     Raul E Rangel <rrangel@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-iio@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Fabien Lahoudere <fabien.lahoudere@collabora.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-i2c@vger.kernel.org, Enrico Granata <egranata@chromium.org>,
        linux-rtc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Benson Leung <bleung@chromium.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Sebastian Reichel <sre@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Alexandru M Stan <amstan@chromium.org>,
        Gwendal Grignou <gwendal@chromium.org>,
        Akshu Agrawal <akshu.agrawal@amd.com>,
        Guenter Roeck <groeck@chromium.org>,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] platform/chrome: cros_ec: Rename cros_ec_dev to cros_ec_mfd_dev
Date:   Thu, 21 Nov 2019 16:45:29 -0700
Message-Id: <20191121164458.1.Ie5c276b95210779fc2ca5651e46552236795b6b9@changeid>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It's very confusing having cros_ec_dev and cros_ec_device. This makes it
clear you are dealing with the mfd device.

Signed-off-by: Raul E Rangel <rrangel@chromium.org>
---
This is based on top of the i2c acpi tunnel patches:
https://lore.kernel.org/patchwork/project/lkml/list/?series=419791

 drivers/i2c/busses/i2c-cros-ec-tunnel.c       |  2 +-
 drivers/iio/accel/cros_ec_accel_legacy.c      |  2 +-
 .../common/cros_ec_sensors/cros_ec_sensors.c  |  2 +-
 .../cros_ec_sensors/cros_ec_sensors_core.c    |  2 +-
 .../cros_ec_sensors/cros_ec_sensors_ring.c    |  2 +-
 drivers/iio/light/cros_ec_light_prox.c        |  2 +-
 drivers/iio/pressure/cros_ec_baro.c           |  2 +-
 .../media/platform/cros-ec-cec/cros-ec-cec.c  |  2 +-
 drivers/mfd/cros_ec_dev.c                     | 14 ++++-----
 drivers/platform/chrome/cros_ec_chardev.c     | 21 +++++++-------
 drivers/platform/chrome/cros_ec_debugfs.c     | 16 +++++-----
 drivers/platform/chrome/cros_ec_lightbar.c    | 29 ++++++++++---------
 drivers/platform/chrome/cros_ec_pd_sysfs.c    |  6 ++--
 drivers/platform/chrome/cros_ec_pd_update.c   | 20 ++++++-------
 drivers/platform/chrome/cros_ec_sysfs.c       | 16 +++++-----
 drivers/platform/chrome/cros_ec_vbc.c         |  8 ++---
 drivers/platform/chrome/cros_usbpd_logger.c   |  6 ++--
 drivers/power/supply/cros_usbpd-charger.c     |  6 ++--
 drivers/rtc/rtc-cros-ec.c                     |  2 +-
 include/linux/mfd/cros_ec.h                   |  8 ++---
 .../linux/platform_data/cros_ec_pd_update.h   |  4 +--
 21 files changed, 87 insertions(+), 85 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cros-ec-tunnel.c b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
index 2e3217678fa3..48e8dceb9496 100644
--- a/drivers/i2c/busses/i2c-cros-ec-tunnel.c
+++ b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
@@ -176,7 +176,7 @@ static int ec_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg i2c_msgs[],
 {
 	struct ec_i2c_device *bus = adap->algo_data;
 	struct device *dev = bus->dev;
-	struct cros_ec_dev *ec = dev_get_drvdata(dev->parent);
+	struct cros_ec_mfd_dev *ec = dev_get_drvdata(dev->parent);
 	const u16 bus_num = bus->remote_bus;
 	int request_len;
 	int response_len;
diff --git a/drivers/iio/accel/cros_ec_accel_legacy.c b/drivers/iio/accel/cros_ec_accel_legacy.c
index fcc3f999e482..a6a8421460ac 100644
--- a/drivers/iio/accel/cros_ec_accel_legacy.c
+++ b/drivers/iio/accel/cros_ec_accel_legacy.c
@@ -163,7 +163,7 @@ static const struct iio_chan_spec cros_ec_accel_legacy_channels[] = {
 static int cros_ec_accel_legacy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct cros_ec_dev *ec = dev_get_drvdata(dev->parent);
+	struct cros_ec_mfd_dev *ec = dev_get_drvdata(dev->parent);
 	struct iio_dev *indio_dev;
 	struct cros_ec_sensors_core_state *state;
 	int ret;
diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
index 8108e5017998..6111b25d77ca 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
@@ -222,7 +222,7 @@ static const struct iio_info ec_sensors_info = {
 static int cros_ec_sensors_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct cros_ec_dev *ec_dev = dev_get_drvdata(dev->parent);
+	struct cros_ec_mfd_dev *ec_dev = dev_get_drvdata(dev->parent);
 	struct iio_dev *indio_dev;
 	struct cros_ec_sensors_state *state;
 	struct iio_chan_spec *channel;
diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
index 77f18f734658..cdfd46cbbd03 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
@@ -196,7 +196,7 @@ int cros_ec_sensors_core_init(struct platform_device *pdev,
 {
 	struct device *dev = &pdev->dev;
 	struct cros_ec_sensors_core_state *state = iio_priv(indio_dev);
-	struct cros_ec_dev *ec = dev_get_drvdata(pdev->dev.parent);
+	struct cros_ec_mfd_dev *ec = dev_get_drvdata(pdev->dev.parent);
 	struct cros_ec_sensor_platform *sensor_platform = dev_get_platdata(dev);
 	u32 ver_mask;
 	int frequencies[ARRAY_SIZE(state->frequencies) / 2] = { 0 };
diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_ring.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_ring.c
index 6b034edc06bf..52568fd5126f 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_ring.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_ring.c
@@ -1057,7 +1057,7 @@ static const struct iio_chan_spec cros_ec_ring_channels[] = {
 static int cros_ec_ring_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct cros_ec_dev *ec_dev = dev_get_drvdata(dev->parent);
+	struct cros_ec_mfd_dev *ec_dev = dev_get_drvdata(dev->parent);
 	struct cros_ec_device *ec_device;
 	struct iio_dev *indio_dev;
 	struct iio_buffer *buffer;
diff --git a/drivers/iio/light/cros_ec_light_prox.c b/drivers/iio/light/cros_ec_light_prox.c
index e501e7c8a6e1..12bf8c2785c6 100644
--- a/drivers/iio/light/cros_ec_light_prox.c
+++ b/drivers/iio/light/cros_ec_light_prox.c
@@ -365,7 +365,7 @@ static const struct iio_info cros_ec_light_prox_info = {
 static int cros_ec_light_prox_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct cros_ec_dev *ec_dev = dev_get_drvdata(dev->parent);
+	struct cros_ec_mfd_dev *ec_dev = dev_get_drvdata(dev->parent);
 	struct iio_dev *indio_dev;
 	struct cros_ec_light_prox_state *state;
 	struct iio_chan_spec *channel;
diff --git a/drivers/iio/pressure/cros_ec_baro.c b/drivers/iio/pressure/cros_ec_baro.c
index a8f52503d02a..a2486269be2c 100644
--- a/drivers/iio/pressure/cros_ec_baro.c
+++ b/drivers/iio/pressure/cros_ec_baro.c
@@ -119,7 +119,7 @@ static const struct iio_info cros_ec_baro_info = {
 static int cros_ec_baro_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct cros_ec_dev *ec_dev = dev_get_drvdata(dev->parent);
+	struct cros_ec_mfd_dev *ec_dev = dev_get_drvdata(dev->parent);
 	struct iio_dev *indio_dev;
 	struct cros_ec_baro_state *state;
 	struct iio_chan_spec *channel;
diff --git a/drivers/media/platform/cros-ec-cec/cros-ec-cec.c b/drivers/media/platform/cros-ec-cec/cros-ec-cec.c
index 4a3b3810fd89..3d29f93549c5 100644
--- a/drivers/media/platform/cros-ec-cec/cros-ec-cec.c
+++ b/drivers/media/platform/cros-ec-cec/cros-ec-cec.c
@@ -259,7 +259,7 @@ static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
 
 static int cros_ec_cec_probe(struct platform_device *pdev)
 {
-	struct cros_ec_dev *ec_dev = dev_get_drvdata(pdev->dev.parent);
+	struct cros_ec_mfd_dev *ec_dev = dev_get_drvdata(pdev->dev.parent);
 	struct cros_ec_device *cros_ec = ec_dev->ec_dev;
 	struct cros_ec_cec *cros_ec_cec;
 	struct device *hdmi_dev;
diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 61b20e061f75..763fd9ecf037 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * cros_ec_dev - expose the Chrome OS Embedded Controller to user-space
+ * cros_ec_mfd_dev - expose the Chrome OS Embedded Controller to user-space
  *
  * Copyright (C) 2014 Google, Inc.
  */
@@ -125,7 +125,7 @@ static struct mfd_cell cros_ec_fw_cells[] = {
 	},
 };
 
-int cros_ec_check_features(struct cros_ec_dev *ec, int feature)
+int cros_ec_check_features(struct cros_ec_mfd_dev *ec, int feature)
 {
 	struct cros_ec_command *msg;
 	int ret;
@@ -167,7 +167,7 @@ static void cros_ec_class_release(struct device *dev)
  * Return the number of MEMS sensors supported.
  * Return < 0 in case of error.
  */
-static int cros_ec_get_sensor_count(struct cros_ec_dev *ec)
+static int cros_ec_get_sensor_count(struct cros_ec_mfd_dev *ec)
 {
 	/*
 	 * Issue a command to get the number of sensor reported.
@@ -205,7 +205,7 @@ static int cros_ec_get_sensor_count(struct cros_ec_dev *ec)
 	return sensor_count;
 }
 
-static void cros_ec_sensors_register(struct cros_ec_dev *ec)
+static void cros_ec_sensors_register(struct cros_ec_mfd_dev *ec)
 {
 	/*
 	 * Issue a command to get the number of sensor reported.
@@ -345,7 +345,7 @@ static const struct mfd_cell cros_ec_accel_legacy_cells[] = {
 	}
 };
 
-static void cros_ec_accel_legacy_register(struct cros_ec_dev *ec)
+static void cros_ec_accel_legacy_register(struct cros_ec_mfd_dev *ec)
 {
 	struct cros_ec_device *ec_dev = ec->ec_dev;
 	u8 status;
@@ -414,7 +414,7 @@ static int ec_device_probe(struct platform_device *pdev)
 	struct device_node *node;
 	struct device *dev = &pdev->dev;
 	struct cros_ec_platform *ec_platform = dev_get_platdata(dev);
-	struct cros_ec_dev *ec = kzalloc(sizeof(*ec), GFP_KERNEL);
+	struct cros_ec_mfd_dev *ec = kzalloc(sizeof(*ec), GFP_KERNEL);
 	int i;
 
 	if (!ec)
@@ -523,7 +523,7 @@ static int ec_device_probe(struct platform_device *pdev)
 
 static int ec_device_remove(struct platform_device *pdev)
 {
-	struct cros_ec_dev *ec = dev_get_drvdata(&pdev->dev);
+	struct cros_ec_mfd_dev *ec = dev_get_drvdata(&pdev->dev);
 
 	mfd_remove_devices(ec->dev);
 	device_unregister(&ec->class_dev);
diff --git a/drivers/platform/chrome/cros_ec_chardev.c b/drivers/platform/chrome/cros_ec_chardev.c
index 74ded441bb50..ed862e7a4b52 100644
--- a/drivers/platform/chrome/cros_ec_chardev.c
+++ b/drivers/platform/chrome/cros_ec_chardev.c
@@ -32,12 +32,12 @@
 #define CROS_MAX_EVENT_LEN	PAGE_SIZE
 
 struct chardev_data {
-	struct cros_ec_dev *ec_dev;
+	struct cros_ec_mfd_dev *ec_dev;
 	struct miscdevice misc;
 };
 
 struct chardev_priv {
-	struct cros_ec_dev *ec_dev;
+	struct cros_ec_mfd_dev *ec_dev;
 	struct notifier_block notifier;
 	wait_queue_head_t wait_event;
 	unsigned long event_mask;
@@ -52,7 +52,7 @@ struct ec_event {
 	u8 data[0];
 };
 
-static int ec_get_version(struct cros_ec_dev *ec, char *str, int maxlen)
+static int ec_get_version(struct cros_ec_mfd_dev *ec, char *str, int maxlen)
 {
 	static const char * const current_image_name[] = {
 		"unknown", "read-only", "read-write", "invalid",
@@ -161,7 +161,7 @@ static struct ec_event *cros_ec_chardev_fetch_event(struct chardev_priv *priv,
 static int cros_ec_chardev_open(struct inode *inode, struct file *filp)
 {
 	struct miscdevice *mdev = filp->private_data;
-	struct cros_ec_dev *ec_dev = dev_get_drvdata(mdev->parent);
+	struct cros_ec_mfd_dev *ec_dev = dev_get_drvdata(mdev->parent);
 	struct chardev_priv *priv;
 	int ret;
 
@@ -204,7 +204,7 @@ static ssize_t cros_ec_chardev_read(struct file *filp, char __user *buffer,
 	char msg[sizeof(struct ec_response_get_version) +
 		 sizeof(CROS_EC_DEV_VERSION)];
 	struct chardev_priv *priv = filp->private_data;
-	struct cros_ec_dev *ec_dev = priv->ec_dev;
+	struct cros_ec_mfd_dev *ec_dev = priv->ec_dev;
 	size_t count;
 	int ret;
 
@@ -254,7 +254,7 @@ static ssize_t cros_ec_chardev_read(struct file *filp, char __user *buffer,
 static int cros_ec_chardev_release(struct inode *inode, struct file *filp)
 {
 	struct chardev_priv *priv = filp->private_data;
-	struct cros_ec_dev *ec_dev = priv->ec_dev;
+	struct cros_ec_mfd_dev *ec_dev = priv->ec_dev;
 	struct ec_event *event, *e;
 
 	blocking_notifier_chain_unregister(&ec_dev->ec_dev->event_notifier,
@@ -272,7 +272,8 @@ static int cros_ec_chardev_release(struct inode *inode, struct file *filp)
 /*
  * Ioctls
  */
-static long cros_ec_chardev_ioctl_xcmd(struct cros_ec_dev *ec, void __user *arg)
+static long cros_ec_chardev_ioctl_xcmd(struct cros_ec_mfd_dev *ec,
+				       void __user *arg)
 {
 	struct cros_ec_command *s_cmd;
 	struct cros_ec_command u_cmd;
@@ -314,7 +315,7 @@ static long cros_ec_chardev_ioctl_xcmd(struct cros_ec_dev *ec, void __user *arg)
 	return ret;
 }
 
-static long cros_ec_chardev_ioctl_readmem(struct cros_ec_dev *ec,
+static long cros_ec_chardev_ioctl_readmem(struct cros_ec_mfd_dev *ec,
 					   void __user *arg)
 {
 	struct cros_ec_device *ec_dev = ec->ec_dev;
@@ -343,7 +344,7 @@ static long cros_ec_chardev_ioctl(struct file *filp, unsigned int cmd,
 				   unsigned long arg)
 {
 	struct chardev_priv *priv = filp->private_data;
-	struct cros_ec_dev *ec = priv->ec_dev;
+	struct cros_ec_mfd_dev *ec = priv->ec_dev;
 
 	if (_IOC_TYPE(cmd) != CROS_EC_DEV_IOC)
 		return -ENOTTY;
@@ -374,7 +375,7 @@ static const struct file_operations chardev_fops = {
 
 static int cros_ec_chardev_probe(struct platform_device *pdev)
 {
-	struct cros_ec_dev *ec_dev = dev_get_drvdata(pdev->dev.parent);
+	struct cros_ec_mfd_dev *ec_dev = dev_get_drvdata(pdev->dev.parent);
 	struct cros_ec_platform *ec_platform = dev_get_platdata(ec_dev->dev);
 	struct chardev_data *data;
 
diff --git a/drivers/platform/chrome/cros_ec_debugfs.c b/drivers/platform/chrome/cros_ec_debugfs.c
index 6ae484989d1f..0281fb8a3427 100644
--- a/drivers/platform/chrome/cros_ec_debugfs.c
+++ b/drivers/platform/chrome/cros_ec_debugfs.c
@@ -39,7 +39,7 @@
  * @panicinfo_blob: panicinfo debugfs blob
  */
 struct cros_ec_debugfs {
-	struct cros_ec_dev *ec;
+	struct cros_ec_mfd_dev *ec;
 	struct dentry *dir;
 	/* EC log */
 	struct circ_buf log_buffer;
@@ -61,7 +61,7 @@ static void cros_ec_console_log_work(struct work_struct *__work)
 		container_of(to_delayed_work(__work),
 			     struct cros_ec_debugfs,
 			     log_poll_work);
-	struct cros_ec_dev *ec = debug_info->ec;
+	struct cros_ec_mfd_dev *ec = debug_info->ec;
 	struct circ_buf *cb = &debug_info->log_buffer;
 	struct cros_ec_command snapshot_msg = {
 		.command = EC_CMD_CONSOLE_SNAPSHOT + ec->cmd_offset,
@@ -294,7 +294,7 @@ static const struct file_operations cros_ec_uptime_fops = {
 	.llseek = default_llseek,
 };
 
-static int ec_read_version_supported(struct cros_ec_dev *ec)
+static int ec_read_version_supported(struct cros_ec_mfd_dev *ec)
 {
 	struct ec_params_get_cmd_versions_v1 *params;
 	struct ec_response_get_cmd_versions *response;
@@ -325,7 +325,7 @@ static int ec_read_version_supported(struct cros_ec_dev *ec)
 
 static int cros_ec_create_console_log(struct cros_ec_debugfs *debug_info)
 {
-	struct cros_ec_dev *ec = debug_info->ec;
+	struct cros_ec_mfd_dev *ec = debug_info->ec;
 	char *buf;
 	int read_params_size;
 	int read_response_size;
@@ -421,7 +421,7 @@ static int cros_ec_create_panicinfo(struct cros_ec_debugfs *debug_info)
 
 static int cros_ec_debugfs_probe(struct platform_device *pd)
 {
-	struct cros_ec_dev *ec = dev_get_drvdata(pd->dev.parent);
+	struct cros_ec_mfd_dev *ec = dev_get_drvdata(pd->dev.parent);
 	struct cros_ec_platform *ec_platform = dev_get_platdata(ec->dev);
 	const char *name = ec_platform->ec_name;
 	struct cros_ec_debugfs *debug_info;
@@ -464,7 +464,7 @@ static int cros_ec_debugfs_probe(struct platform_device *pd)
 
 static int cros_ec_debugfs_remove(struct platform_device *pd)
 {
-	struct cros_ec_dev *ec = dev_get_drvdata(pd->dev.parent);
+	struct cros_ec_mfd_dev *ec = dev_get_drvdata(pd->dev.parent);
 
 	debugfs_remove_recursive(ec->debug_info->dir);
 	cros_ec_cleanup_console_log(ec->debug_info);
@@ -474,7 +474,7 @@ static int cros_ec_debugfs_remove(struct platform_device *pd)
 
 static int __maybe_unused cros_ec_debugfs_suspend(struct device *dev)
 {
-	struct cros_ec_dev *ec = dev_get_drvdata(dev);
+	struct cros_ec_mfd_dev *ec = dev_get_drvdata(dev);
 
 	if (ec->debug_info->log_buffer.buf)
 		cancel_delayed_work_sync(&ec->debug_info->log_poll_work);
@@ -484,7 +484,7 @@ static int __maybe_unused cros_ec_debugfs_suspend(struct device *dev)
 
 static int __maybe_unused cros_ec_debugfs_resume(struct device *dev)
 {
-	struct cros_ec_dev *ec = dev_get_drvdata(dev);
+	struct cros_ec_mfd_dev *ec = dev_get_drvdata(dev);
 
 	if (ec->debug_info->log_buffer.buf)
 		schedule_delayed_work(&ec->debug_info->log_poll_work, 0);
diff --git a/drivers/platform/chrome/cros_ec_lightbar.c b/drivers/platform/chrome/cros_ec_lightbar.c
index c0f2eec35a48..1ddc1b63f5b9 100644
--- a/drivers/platform/chrome/cros_ec_lightbar.c
+++ b/drivers/platform/chrome/cros_ec_lightbar.c
@@ -83,7 +83,8 @@ static int lb_throttle(void)
 	return ret;
 }
 
-static struct cros_ec_command *alloc_lightbar_cmd_msg(struct cros_ec_dev *ec)
+static struct cros_ec_command *
+alloc_lightbar_cmd_msg(struct cros_ec_mfd_dev *ec)
 {
 	struct cros_ec_command *msg;
 	int len;
@@ -103,7 +104,7 @@ static struct cros_ec_command *alloc_lightbar_cmd_msg(struct cros_ec_dev *ec)
 	return msg;
 }
 
-static int get_lightbar_version(struct cros_ec_dev *ec,
+static int get_lightbar_version(struct cros_ec_mfd_dev *ec,
 				uint32_t *ver_ptr, uint32_t *flg_ptr)
 {
 	struct ec_params_lightbar *param;
@@ -156,7 +157,7 @@ static ssize_t version_show(struct device *dev,
 			    struct device_attribute *attr, char *buf)
 {
 	uint32_t version = 0, flags = 0;
-	struct cros_ec_dev *ec = to_cros_ec_dev(dev);
+	struct cros_ec_mfd_dev *ec = to_cros_ec_dev(dev);
 	int ret;
 
 	ret = lb_throttle();
@@ -178,7 +179,7 @@ static ssize_t brightness_store(struct device *dev,
 	struct cros_ec_command *msg;
 	int ret;
 	unsigned int val;
-	struct cros_ec_dev *ec = to_cros_ec_dev(dev);
+	struct cros_ec_mfd_dev *ec = to_cros_ec_dev(dev);
 
 	if (kstrtouint(buf, 0, &val))
 		return -EINVAL;
@@ -222,7 +223,7 @@ static ssize_t led_rgb_store(struct device *dev, struct device_attribute *attr,
 {
 	struct ec_params_lightbar *param;
 	struct cros_ec_command *msg;
-	struct cros_ec_dev *ec = to_cros_ec_dev(dev);
+	struct cros_ec_mfd_dev *ec = to_cros_ec_dev(dev);
 	unsigned int val[4];
 	int ret, i = 0, j = 0, ok = 0;
 
@@ -294,7 +295,7 @@ static ssize_t sequence_show(struct device *dev,
 	struct ec_response_lightbar *resp;
 	struct cros_ec_command *msg;
 	int ret;
-	struct cros_ec_dev *ec = to_cros_ec_dev(dev);
+	struct cros_ec_mfd_dev *ec = to_cros_ec_dev(dev);
 
 	msg = alloc_lightbar_cmd_msg(ec);
 	if (!msg)
@@ -328,7 +329,7 @@ static ssize_t sequence_show(struct device *dev,
 	return ret;
 }
 
-static int lb_send_empty_cmd(struct cros_ec_dev *ec, uint8_t cmd)
+static int lb_send_empty_cmd(struct cros_ec_mfd_dev *ec, uint8_t cmd)
 {
 	struct ec_params_lightbar *param;
 	struct cros_ec_command *msg;
@@ -359,7 +360,7 @@ static int lb_send_empty_cmd(struct cros_ec_dev *ec, uint8_t cmd)
 	return ret;
 }
 
-static int lb_manual_suspend_ctrl(struct cros_ec_dev *ec, uint8_t enable)
+static int lb_manual_suspend_ctrl(struct cros_ec_mfd_dev *ec, uint8_t enable)
 {
 	struct ec_params_lightbar *param;
 	struct cros_ec_command *msg;
@@ -399,7 +400,7 @@ static ssize_t sequence_store(struct device *dev, struct device_attribute *attr,
 	struct cros_ec_command *msg;
 	unsigned int num;
 	int ret, len;
-	struct cros_ec_dev *ec = to_cros_ec_dev(dev);
+	struct cros_ec_mfd_dev *ec = to_cros_ec_dev(dev);
 
 	for (len = 0; len < count; len++)
 		if (!isalnum(buf[len]))
@@ -447,7 +448,7 @@ static ssize_t program_store(struct device *dev, struct device_attribute *attr,
 	int extra_bytes, max_size, ret;
 	struct ec_params_lightbar *param;
 	struct cros_ec_command *msg;
-	struct cros_ec_dev *ec = to_cros_ec_dev(dev);
+	struct cros_ec_mfd_dev *ec = to_cros_ec_dev(dev);
 
 	/*
 	 * We might need to reject the program for size reasons. The EC
@@ -555,7 +556,7 @@ static struct attribute_group cros_ec_lightbar_attr_group = {
 
 static int cros_ec_lightbar_probe(struct platform_device *pd)
 {
-	struct cros_ec_dev *ec_dev = dev_get_drvdata(pd->dev.parent);
+	struct cros_ec_mfd_dev *ec_dev = dev_get_drvdata(pd->dev.parent);
 	struct cros_ec_platform *pdata = dev_get_platdata(ec_dev->dev);
 	struct device *dev = &pd->dev;
 	int ret;
@@ -588,7 +589,7 @@ static int cros_ec_lightbar_probe(struct platform_device *pd)
 
 static int cros_ec_lightbar_remove(struct platform_device *pd)
 {
-	struct cros_ec_dev *ec_dev = dev_get_drvdata(pd->dev.parent);
+	struct cros_ec_mfd_dev *ec_dev = dev_get_drvdata(pd->dev.parent);
 
 	sysfs_remove_group(&ec_dev->class_dev.kobj,
 			   &cros_ec_lightbar_attr_group);
@@ -601,7 +602,7 @@ static int cros_ec_lightbar_remove(struct platform_device *pd)
 
 static int __maybe_unused cros_ec_lightbar_resume(struct device *dev)
 {
-	struct cros_ec_dev *ec_dev = dev_get_drvdata(dev->parent);
+	struct cros_ec_mfd_dev *ec_dev = dev_get_drvdata(dev->parent);
 
 	if (userspace_control)
 		return 0;
@@ -611,7 +612,7 @@ static int __maybe_unused cros_ec_lightbar_resume(struct device *dev)
 
 static int __maybe_unused cros_ec_lightbar_suspend(struct device *dev)
 {
-	struct cros_ec_dev *ec_dev = dev_get_drvdata(dev->parent);
+	struct cros_ec_mfd_dev *ec_dev = dev_get_drvdata(dev->parent);
 
 	if (userspace_control)
 		return 0;
diff --git a/drivers/platform/chrome/cros_ec_pd_sysfs.c b/drivers/platform/chrome/cros_ec_pd_sysfs.c
index ebda601c1b79..8b28ed5cde46 100644
--- a/drivers/platform/chrome/cros_ec_pd_sysfs.c
+++ b/drivers/platform/chrome/cros_ec_pd_sysfs.c
@@ -31,7 +31,7 @@ static umode_t cros_ec_pd_attrs_are_visible(struct kobject *kobj,
 					    struct attribute *a, int n)
 {
 	struct device *dev = container_of(kobj, struct device, kobj);
-	struct cros_ec_dev *ec = container_of(dev, struct cros_ec_dev,
+	struct cros_ec_mfd_dev *ec = container_of(dev, struct cros_ec_mfd_dev,
 					      class_dev);
 	struct ec_params_usb_pd_rw_hash_entry hash_entry;
 	struct ec_params_usb_pd_discovery_entry discovery_entry;
@@ -95,7 +95,7 @@ static struct attribute_group cros_ec_pd_attr_group = {
 
 static int cros_ec_pd_sysfs_probe(struct platform_device *pd)
 {
-	struct cros_ec_dev *ec_dev = dev_get_drvdata(pd->dev.parent);
+	struct cros_ec_mfd_dev *ec_dev = dev_get_drvdata(pd->dev.parent);
 	struct device *dev = &pd->dev;
 	int ret;
 
@@ -109,7 +109,7 @@ static int cros_ec_pd_sysfs_probe(struct platform_device *pd)
 
 static int cros_ec_pd_sysfs_remove(struct platform_device *pd)
 {
-	struct cros_ec_dev *ec_dev = dev_get_drvdata(pd->dev.parent);
+	struct cros_ec_mfd_dev *ec_dev = dev_get_drvdata(pd->dev.parent);
 
 	sysfs_remove_group(&ec_dev->class_dev.kobj, &cros_ec_pd_attr_group);
 
diff --git a/drivers/platform/chrome/cros_ec_pd_update.c b/drivers/platform/chrome/cros_ec_pd_update.c
index 30f56e9b6c1f..ef85fadb39de 100644
--- a/drivers/platform/chrome/cros_ec_pd_update.c
+++ b/drivers/platform/chrome/cros_ec_pd_update.c
@@ -35,7 +35,7 @@
  */
 #define DRV_NAME "cros-ec-pd-update"
 
-struct cros_ec_dev *cros_ec_pd_ec;
+struct cros_ec_mfd_dev *cros_ec_pd_ec;
 EXPORT_SYMBOL_GPL(cros_ec_pd_ec);
 
 /* Allow disabling of the update for testing purposes */
@@ -187,7 +187,7 @@ EXPORT_SYMBOL_GPL(cros_ec_pd_firmware_images);
  * @insize: Size of indata
  */
 static int cros_ec_pd_command(struct device *dev,
-			      struct cros_ec_dev *pd_dev,
+			      struct cros_ec_mfd_dev *pd_dev,
 			      int command,
 			      uint8_t *outdata,
 			      int outsize,
@@ -230,8 +230,8 @@ static int cros_ec_pd_command(struct device *dev,
  * @pd_dev: EC PD device
  * @port: Port # on device
  */
-static int cros_ec_pd_enter_gfu(struct device *dev, struct cros_ec_dev *pd_dev,
-				int port)
+static int cros_ec_pd_enter_gfu(struct device *dev,
+				struct cros_ec_mfd_dev *pd_dev, int port)
 {
 	int rv;
 	struct ec_params_usb_pd_set_mode_request set_mode_request;
@@ -254,7 +254,7 @@ static int cros_ec_pd_enter_gfu(struct device *dev, struct cros_ec_dev *pd_dev,
 
 int cros_ec_pd_get_status(
 		struct device *dev,
-		struct cros_ec_dev *pd_dev,
+		struct cros_ec_mfd_dev *pd_dev,
 		int port,
 		struct ec_params_usb_pd_rw_hash_entry *hash_entry,
 		struct ec_params_usb_pd_discovery_entry *discovery_entry)
@@ -288,7 +288,7 @@ EXPORT_SYMBOL_GPL(cros_ec_pd_get_status);
  * @fw: FW update image to inform the EC of
  */
 static int cros_ec_pd_send_hash_entry(struct device *dev,
-				      struct cros_ec_dev *pd_dev,
+				      struct cros_ec_mfd_dev *pd_dev,
 				      const struct cros_ec_pd_firmware_image
 						   *fw)
 {
@@ -311,7 +311,7 @@ static int cros_ec_pd_send_hash_entry(struct device *dev,
  * @pd_cmd: fw_update command
  */
 static int cros_ec_pd_send_fw_update_cmd(struct device *dev,
-					 struct cros_ec_dev *pd_dev,
+					 struct cros_ec_mfd_dev *pd_dev,
 					 struct ec_params_usb_pd_fw_update
 						*pd_cmd)
 {
@@ -330,7 +330,7 @@ static int cros_ec_pd_send_fw_update_cmd(struct device *dev,
  * @num_ports: Holds number of ports, on command success
  */
 static int cros_ec_pd_get_num_ports(struct device *dev,
-				    struct cros_ec_dev *pd_dev,
+				    struct cros_ec_mfd_dev *pd_dev,
 				    int *num_ports)
 {
 	struct ec_response_usb_pd_ports resp;
@@ -356,7 +356,7 @@ static int cros_ec_pd_get_num_ports(struct device *dev,
  * @port: Port# to which update device is attached
  */
 static int cros_ec_pd_fw_update(struct cros_ec_pd_update_data *drv_data,
-				struct cros_ec_dev *pd_dev,
+				struct cros_ec_mfd_dev *pd_dev,
 				const struct firmware *fw,
 				uint8_t port)
 {
@@ -548,7 +548,7 @@ static enum cros_ec_pd_find_update_firmware_result cros_ec_find_update_firmware(
  * @pd_dev: EC PD device
  */
 static uint32_t cros_ec_pd_get_host_event_status(struct device *dev,
-						 struct cros_ec_dev *pd_dev)
+						 struct cros_ec_mfd_dev *pd_dev)
 {
 	int ret;
 	struct ec_response_host_event_status host_event_status;
diff --git a/drivers/platform/chrome/cros_ec_sysfs.c b/drivers/platform/chrome/cros_ec_sysfs.c
index 74d36b8d4f46..dc0859cb5f90 100644
--- a/drivers/platform/chrome/cros_ec_sysfs.c
+++ b/drivers/platform/chrome/cros_ec_sysfs.c
@@ -57,7 +57,7 @@ static ssize_t reboot_store(struct device *dev,
 	int got_cmd = 0, offset = 0;
 	int i;
 	int ret;
-	struct cros_ec_dev *ec = to_cros_ec_dev(dev);
+	struct cros_ec_mfd_dev *ec = to_cros_ec_dev(dev);
 
 	msg = kmalloc(sizeof(*msg) + sizeof(*param), GFP_KERNEL);
 	if (!msg)
@@ -118,7 +118,7 @@ static ssize_t version_show(struct device *dev,
 	struct cros_ec_command *msg;
 	int ret;
 	int count = 0;
-	struct cros_ec_dev *ec = to_cros_ec_dev(dev);
+	struct cros_ec_mfd_dev *ec = to_cros_ec_dev(dev);
 
 	msg = kmalloc(sizeof(*msg) + EC_HOST_PARAM_SIZE, GFP_KERNEL);
 	if (!msg)
@@ -216,7 +216,7 @@ static ssize_t flashinfo_show(struct device *dev,
 	struct ec_response_flash_info *resp;
 	struct cros_ec_command *msg;
 	int ret;
-	struct cros_ec_dev *ec = to_cros_ec_dev(dev);
+	struct cros_ec_mfd_dev *ec = to_cros_ec_dev(dev);
 
 	msg = kmalloc(sizeof(*msg) + sizeof(*resp), GFP_KERNEL);
 	if (!msg)
@@ -247,7 +247,7 @@ static ssize_t flashinfo_show(struct device *dev,
 static ssize_t kb_wake_angle_show(struct device *dev,
 				  struct device_attribute *attr, char *buf)
 {
-	struct cros_ec_dev *ec = to_cros_ec_dev(dev);
+	struct cros_ec_mfd_dev *ec = to_cros_ec_dev(dev);
 	struct ec_response_motion_sense *resp;
 	struct ec_params_motion_sense *param;
 	struct cros_ec_command *msg;
@@ -280,7 +280,7 @@ static ssize_t kb_wake_angle_store(struct device *dev,
 				   struct device_attribute *attr,
 				   const char *buf, size_t count)
 {
-	struct cros_ec_dev *ec = to_cros_ec_dev(dev);
+	struct cros_ec_mfd_dev *ec = to_cros_ec_dev(dev);
 	struct ec_params_motion_sense *param;
 	struct cros_ec_command *msg;
 	u16 angle;
@@ -328,7 +328,7 @@ static umode_t cros_ec_ctrl_visible(struct kobject *kobj,
 				    struct attribute *a, int n)
 {
 	struct device *dev = container_of(kobj, struct device, kobj);
-	struct cros_ec_dev *ec = to_cros_ec_dev(dev);
+	struct cros_ec_mfd_dev *ec = to_cros_ec_dev(dev);
 
 	if (a == &dev_attr_kb_wake_angle.attr && !ec->has_kb_wake_angle)
 		return 0;
@@ -343,7 +343,7 @@ static struct attribute_group cros_ec_attr_group = {
 
 static int cros_ec_sysfs_probe(struct platform_device *pd)
 {
-	struct cros_ec_dev *ec_dev = dev_get_drvdata(pd->dev.parent);
+	struct cros_ec_mfd_dev *ec_dev = dev_get_drvdata(pd->dev.parent);
 	struct device *dev = &pd->dev;
 	int ret;
 
@@ -356,7 +356,7 @@ static int cros_ec_sysfs_probe(struct platform_device *pd)
 
 static int cros_ec_sysfs_remove(struct platform_device *pd)
 {
-	struct cros_ec_dev *ec_dev = dev_get_drvdata(pd->dev.parent);
+	struct cros_ec_mfd_dev *ec_dev = dev_get_drvdata(pd->dev.parent);
 
 	sysfs_remove_group(&ec_dev->class_dev.kobj, &cros_ec_attr_group);
 
diff --git a/drivers/platform/chrome/cros_ec_vbc.c b/drivers/platform/chrome/cros_ec_vbc.c
index f11a1283e5c8..6bcc8f6f4965 100644
--- a/drivers/platform/chrome/cros_ec_vbc.c
+++ b/drivers/platform/chrome/cros_ec_vbc.c
@@ -19,7 +19,7 @@ static ssize_t vboot_context_read(struct file *filp, struct kobject *kobj,
 				  loff_t pos, size_t count)
 {
 	struct device *dev = container_of(kobj, struct device, kobj);
-	struct cros_ec_dev *ec = to_cros_ec_dev(dev);
+	struct cros_ec_mfd_dev *ec = to_cros_ec_dev(dev);
 	struct cros_ec_device *ecdev = ec->ec_dev;
 	struct ec_params_vbnvcontext *params;
 	struct cros_ec_command *msg;
@@ -59,7 +59,7 @@ static ssize_t vboot_context_write(struct file *filp, struct kobject *kobj,
 				   loff_t pos, size_t count)
 {
 	struct device *dev = container_of(kobj, struct device, kobj);
-	struct cros_ec_dev *ec = to_cros_ec_dev(dev);
+	struct cros_ec_mfd_dev *ec = to_cros_ec_dev(dev);
 	struct cros_ec_device *ecdev = ec->ec_dev;
 	struct ec_params_vbnvcontext *params;
 	struct cros_ec_command *msg;
@@ -109,7 +109,7 @@ static struct attribute_group cros_ec_vbc_attr_group = {
 
 static int cros_ec_vbc_probe(struct platform_device *pd)
 {
-	struct cros_ec_dev *ec_dev = dev_get_drvdata(pd->dev.parent);
+	struct cros_ec_mfd_dev *ec_dev = dev_get_drvdata(pd->dev.parent);
 	struct device *dev = &pd->dev;
 	int ret;
 
@@ -124,7 +124,7 @@ static int cros_ec_vbc_probe(struct platform_device *pd)
 
 static int cros_ec_vbc_remove(struct platform_device *pd)
 {
-	struct cros_ec_dev *ec_dev = dev_get_drvdata(pd->dev.parent);
+	struct cros_ec_mfd_dev *ec_dev = dev_get_drvdata(pd->dev.parent);
 
 	sysfs_remove_group(&ec_dev->class_dev.kobj,
 			   &cros_ec_vbc_attr_group);
diff --git a/drivers/platform/chrome/cros_usbpd_logger.c b/drivers/platform/chrome/cros_usbpd_logger.c
index 2430e8b82810..56aac618736b 100644
--- a/drivers/platform/chrome/cros_usbpd_logger.c
+++ b/drivers/platform/chrome/cros_usbpd_logger.c
@@ -28,7 +28,7 @@
 
 struct logger_data {
 	struct device *dev;
-	struct cros_ec_dev *ec_dev;
+	struct cros_ec_mfd_dev *ec_dev;
 	u8 ec_buffer[CROS_USBPD_BUFFER_SIZE];
 	struct delayed_work log_work;
 	struct workqueue_struct *log_workqueue;
@@ -61,7 +61,7 @@ static int append_str(char *buf, int pos, const char *fmt, ...)
 
 static struct ec_response_pd_log *ec_get_log_entry(struct logger_data *logger)
 {
-	struct cros_ec_dev *ec_dev = logger->ec_dev;
+	struct cros_ec_mfd_dev *ec_dev = logger->ec_dev;
 	struct cros_ec_command *msg;
 	int ret;
 
@@ -194,7 +194,7 @@ static void cros_usbpd_log_check(struct work_struct *work)
 
 static int cros_usbpd_logger_probe(struct platform_device *pd)
 {
-	struct cros_ec_dev *ec_dev = dev_get_drvdata(pd->dev.parent);
+	struct cros_ec_mfd_dev *ec_dev = dev_get_drvdata(pd->dev.parent);
 	struct device *dev = &pd->dev;
 	struct logger_data *logger;
 
diff --git a/drivers/power/supply/cros_usbpd-charger.c b/drivers/power/supply/cros_usbpd-charger.c
index 6bcd4d4f95d9..a3926edeca28 100644
--- a/drivers/power/supply/cros_usbpd-charger.c
+++ b/drivers/power/supply/cros_usbpd-charger.c
@@ -44,7 +44,7 @@ struct port_data {
 
 struct charger_data {
 	struct device *dev;
-	struct cros_ec_dev *ec_dev;
+	struct cros_ec_mfd_dev *ec_dev;
 	struct cros_ec_device *ec_device;
 	int num_charger_ports;
 	int num_usbpd_ports;
@@ -101,7 +101,7 @@ static int cros_usbpd_charger_ec_command(struct charger_data *charger,
 					 void *indata,
 					 unsigned int insize)
 {
-	struct cros_ec_dev *ec_dev = charger->ec_dev;
+	struct cros_ec_mfd_dev *ec_dev = charger->ec_dev;
 	struct cros_ec_command *msg;
 	int ret;
 
@@ -592,7 +592,7 @@ static void cros_usbpd_charger_unregister_notifier(void *data)
 
 static int cros_usbpd_charger_probe(struct platform_device *pd)
 {
-	struct cros_ec_dev *ec_dev = dev_get_drvdata(pd->dev.parent);
+	struct cros_ec_mfd_dev *ec_dev = dev_get_drvdata(pd->dev.parent);
 	struct cros_ec_device *ec_device = ec_dev->ec_dev;
 	struct power_supply_desc *psy_desc;
 	struct device *dev = &pd->dev;
diff --git a/drivers/rtc/rtc-cros-ec.c b/drivers/rtc/rtc-cros-ec.c
index 6909e01936d9..fbc54915b4c5 100644
--- a/drivers/rtc/rtc-cros-ec.c
+++ b/drivers/rtc/rtc-cros-ec.c
@@ -321,7 +321,7 @@ static SIMPLE_DEV_PM_OPS(cros_ec_rtc_pm_ops, cros_ec_rtc_suspend,
 
 static int cros_ec_rtc_probe(struct platform_device *pdev)
 {
-	struct cros_ec_dev *ec_dev = dev_get_drvdata(pdev->dev.parent);
+	struct cros_ec_mfd_dev *ec_dev = dev_get_drvdata(pdev->dev.parent);
 	struct cros_ec_device *cros_ec = ec_dev->ec_dev;
 	struct cros_ec_rtc *cros_ec_rtc;
 	struct rtc_time tm;
diff --git a/include/linux/mfd/cros_ec.h b/include/linux/mfd/cros_ec.h
index 7d3d58f4e358..565a9903b15e 100644
--- a/include/linux/mfd/cros_ec.h
+++ b/include/linux/mfd/cros_ec.h
@@ -11,7 +11,7 @@
 #include <linux/device.h>
 
 /**
- * struct cros_ec_dev - ChromeOS EC device entry point.
+ * struct cros_ec_mfd_dev - ChromeOS EC device entry point.
  * @class_dev: Device structure used in sysfs.
  * @ec_dev: cros_ec_device structure to talk to the physical device.
  * @dev: Pointer to the platform device.
@@ -20,7 +20,7 @@
  * @cmd_offset: Offset to apply for each command.
  * @features: Features supported by the EC.
  */
-struct cros_ec_dev {
+struct cros_ec_mfd_dev {
 	struct device class_dev;
 	struct cros_ec_device *ec_dev;
 	struct device *dev;
@@ -30,7 +30,7 @@ struct cros_ec_dev {
 	u32 features[2];
 };
 
-#define to_cros_ec_dev(dev)  container_of(dev, struct cros_ec_dev, class_dev)
+#define to_cros_ec_dev(dev) container_of(dev, struct cros_ec_mfd_dev, class_dev)
 
 /**
  * cros_ec_check_features - Test for the presence of EC features
@@ -41,6 +41,6 @@ struct cros_ec_dev {
  * @msg: One of ec_feature_code values
  * @return: 1 if supported, 0 if not
  */
-int cros_ec_check_features(struct cros_ec_dev *ec, int feature);
+int cros_ec_check_features(struct cros_ec_mfd_dev *ec, int feature);
 
 #endif /* __LINUX_MFD_CROS_EC_H */
diff --git a/include/linux/platform_data/cros_ec_pd_update.h b/include/linux/platform_data/cros_ec_pd_update.h
index eea0cb6e1f91..ea4a64dca84c 100644
--- a/include/linux/platform_data/cros_ec_pd_update.h
+++ b/include/linux/platform_data/cros_ec_pd_update.h
@@ -97,13 +97,13 @@ enum cros_ec_pd_find_update_firmware_result {
  */
 int cros_ec_pd_get_status(
 		struct device *dev,
-		struct cros_ec_dev *pd_dev,
+		struct cros_ec_mfd_dev *pd_dev,
 		int port,
 		struct ec_params_usb_pd_rw_hash_entry *hash_entry,
 		struct ec_params_usb_pd_discovery_entry *discovery_entry);
 
 /* Store our PD device pointer so we can send update-related commands. */
-extern struct cros_ec_dev *cros_ec_pd_ec;
+extern struct cros_ec_mfd_dev *cros_ec_pd_ec;
 
 /*
  * firmware_images - Keep this updated with the latest RW FW + hash for each
-- 
2.24.0.432.g9d3f5f5b63-goog

