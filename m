Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FDE21094D1
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2019 21:48:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727127AbfKYUrn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Nov 2019 15:47:43 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:43759 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727125AbfKYUrn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Nov 2019 15:47:43 -0500
Received: by mail-io1-f66.google.com with SMTP id p12so10511819iog.10
        for <linux-i2c@vger.kernel.org>; Mon, 25 Nov 2019 12:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yRthWhVooEbY4LLswcY+HNZfo00aKn8lxMNAxWAnSJU=;
        b=l8luzNR1GrYEngxObM+5QY6Ua4KZx4IXyh2HNwmQ5WGA2UYDllVmfVPMygsEjyn24v
         pnghUdBXH6XWq8WcgNPPpeszL9SL6dlMPLfdcOuq1jTmT3YTIpDobJL8eWYkI+AXrGbQ
         GBH/x5YZaRCqMnvaYJBjzK85MZQ1VG2ZkBQBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yRthWhVooEbY4LLswcY+HNZfo00aKn8lxMNAxWAnSJU=;
        b=qrFC3rAQ4y0i4Q0gzmmNokm+W6K5PNsKCLcZL8XI1mhzvSVQVGOJXzukWm/LD2NM16
         xQpo04dUR2avW7Bemz3/98ySg6ltV/WN0EzhRya+sKN+zAwhvO6uFBelIGkmWH0GJULV
         KP+ivgV6+UQ7FxdG2U2DgDiOtXlhTG16YVVWATbJ9KrIdym3No721t2p8iPev05akXZB
         /myB7QwDHxK3MLQ0khiQDl03ztRqMRn45KnJ6XHgXkTrjKBJNCJW5BnBZ0nWURMwPZ4L
         x9IzDu0VHOpX44PQgrZoXNwgSxQOniFbBeKv0PnXcpubZD1U4Zakp3bVtURzc+CM49go
         20Pg==
X-Gm-Message-State: APjAAAXFTRawzDYZumz4j0+u2mooEIeYzE0g4fxTjU7L9+Q8FrNYile8
        o8Zsr7JFvGAFXcCX3abrlfLPbA==
X-Google-Smtp-Source: APXvYqx52hdZpWhasD8RAEyrtFMQFu686GZUdkwzFpSpR2FZXnWH6evmDOU2A4WhWLPKvJM/4okZaA==
X-Received: by 2002:a6b:4f0a:: with SMTP id d10mr8253598iob.134.1574714861816;
        Mon, 25 Nov 2019 12:47:41 -0800 (PST)
Received: from localhost ([2620:15c:183:0:82e0:aef8:11bc:24c4])
        by smtp.gmail.com with ESMTPSA id h14sm2507640ilc.87.2019.11.25.12.47.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2019 12:47:41 -0800 (PST)
From:   Raul E Rangel <rrangel@chromium.org>
To:     enric.balletbo@collabora.com, Wolfram Sang <wsa@the-dreams.de>
Cc:     Akshu.Agrawal@amd.com, Raul E Rangel <rrangel@chromium.org>,
        Akshu Agrawal <akshu.agrawal@amd.com>,
        Guenter Roeck <groeck@chromium.org>,
        linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-i2c@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Benson Leung <bleung@chromium.org>
Subject: [PATCH v2 2/2] platform/chrome: i2c: i2c-cros-ec-tunnel: Convert i2c tunnel to MFD Cell
Date:   Mon, 25 Nov 2019 13:47:30 -0700
Message-Id: <20191125134551.v2.2.Iddc7dd74f893297cb932e9825d413e7890633b3d@changeid>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
In-Reply-To: <20191125204730.187000-1-rrangel@chromium.org>
References: <20191125204730.187000-1-rrangel@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

If the i2c-cros-ec-tunnel driver is compiled into the kernel, it is
possible that i2c-cros-ec-tunnel could be probed before cros_ec_XXX
has finished initializing and setting the drvdata. This would cause a
NULL pointer panic.

Converting this driver over to an MFD solves the problem and aligns with
where the cros_ec is going.

Signed-off-by: Raul E Rangel <rrangel@chromium.org>
---
You can now see the device node lives under the mfd device.

$ find /sys/bus/platform/devices/cros-ec-dev.0.auto/cros-ec-i2c-tunnel.12.auto/ -iname firmware_node -exec ls -l '{}' \;
/sys/bus/platform/devices/cros-ec-dev.0.auto/cros-ec-i2c-tunnel.12.auto/firmware_node -> ../../../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1c/PNP0C09:00/GOOG0004:00/GOOG0012:00
/sys/bus/platform/devices/cros-ec-dev.0.auto/cros-ec-i2c-tunnel.12.auto/i2c-9/firmware_node -> ../../../../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1c/PNP0C09:00/GOOG0004:00/GOOG0012:00
/sys/bus/platform/devices/cros-ec-dev.0.auto/cros-ec-i2c-tunnel.12.auto/i2c-9/i2c-10EC5682:00/firmware_node -> ../../../../../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1c/PNP0C09:00/GOOG0004:00/GOOG0012:00/10EC5682:00

Changes in v2:
- Moved i2c tunnel into cros_ec_platform_cells
- Requires https://lkml.org/lkml/2019/11/21/208 to correctly enumerate.

 drivers/i2c/busses/i2c-cros-ec-tunnel.c | 36 +++++++++----------------
 drivers/mfd/cros_ec_dev.c               |  9 +++++++
 2 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cros-ec-tunnel.c b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
index 5d91e33eb600..2e3217678fa3 100644
--- a/drivers/i2c/busses/i2c-cros-ec-tunnel.c
+++ b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
@@ -6,6 +6,7 @@
 #include <linux/acpi.h>
 #include <linux/module.h>
 #include <linux/i2c.h>
+#include <linux/mfd/cros_ec.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_ec_proto.h>
 #include <linux/platform_device.h>
@@ -27,7 +28,6 @@
 struct ec_i2c_device {
 	struct device *dev;
 	struct i2c_adapter adap;
-	struct cros_ec_device *ec;
 
 	u16 remote_bus;
 
@@ -176,6 +176,7 @@ static int ec_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg i2c_msgs[],
 {
 	struct ec_i2c_device *bus = adap->algo_data;
 	struct device *dev = bus->dev;
+	struct cros_ec_dev *ec = dev_get_drvdata(dev->parent);
 	const u16 bus_num = bus->remote_bus;
 	int request_len;
 	int response_len;
@@ -183,6 +184,16 @@ static int ec_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg i2c_msgs[],
 	int result;
 	struct cros_ec_command *msg;
 
+	if (!ec) {
+		dev_err(dev, "%s: ec is missing!\n", __func__);
+		return -EINVAL;
+	}
+
+	if (!ec->ec_dev) {
+		dev_err(dev, "%s: ec->ec_dev is missing!\n", __func__);
+		return -EINVAL;
+	}
+
 	request_len = ec_i2c_count_message(i2c_msgs, num);
 	if (request_len < 0) {
 		dev_warn(dev, "Error constructing message %d\n", request_len);
@@ -212,7 +223,7 @@ static int ec_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg i2c_msgs[],
 	msg->outsize = request_len;
 	msg->insize = response_len;
 
-	result = cros_ec_cmd_xfer_status(bus->ec, msg);
+	result = cros_ec_cmd_xfer_status(ec->ec_dev, msg);
 	if (result < 0) {
 		dev_err(dev, "Error transferring EC i2c message %d\n", result);
 		goto exit;
@@ -241,17 +252,11 @@ static const struct i2c_algorithm ec_i2c_algorithm = {
 
 static int ec_i2c_probe(struct platform_device *pdev)
 {
-	struct cros_ec_device *ec = dev_get_drvdata(pdev->dev.parent);
 	struct device *dev = &pdev->dev;
 	struct ec_i2c_device *bus = NULL;
 	u32 remote_bus;
 	int err;
 
-	if (!ec->cmd_xfer) {
-		dev_err(dev, "Missing sendrecv\n");
-		return -EINVAL;
-	}
-
 	bus = devm_kzalloc(dev, sizeof(*bus), GFP_KERNEL);
 	if (bus == NULL)
 		return -ENOMEM;
@@ -263,7 +268,6 @@ static int ec_i2c_probe(struct platform_device *pdev)
 	}
 	bus->remote_bus = remote_bus;
 
-	bus->ec = ec;
 	bus->dev = dev;
 
 	bus->adap.owner = THIS_MODULE;
@@ -292,25 +296,11 @@ static int ec_i2c_remove(struct platform_device *dev)
 	return 0;
 }
 
-static const struct of_device_id cros_ec_i2c_of_match[] = {
-	{ .compatible = "google,cros-ec-i2c-tunnel" },
-	{},
-};
-MODULE_DEVICE_TABLE(of, cros_ec_i2c_of_match);
-
-static const struct acpi_device_id cros_ec_i2c_tunnel_acpi_id[] = {
-	{ "GOOG0012", 0 },
-	{ }
-};
-MODULE_DEVICE_TABLE(acpi, cros_ec_i2c_tunnel_acpi_id);
-
 static struct platform_driver ec_i2c_tunnel_driver = {
 	.probe = ec_i2c_probe,
 	.remove = ec_i2c_remove,
 	.driver = {
 		.name = "cros-ec-i2c-tunnel",
-		.acpi_match_table = ACPI_PTR(cros_ec_i2c_tunnel_acpi_id),
-		.of_match_table = of_match_ptr(cros_ec_i2c_of_match),
 	},
 };
 
diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 1efdba18f20b..04f8fc5772f0 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -101,12 +101,21 @@ static const struct cros_feature_to_cells cros_subdevices[] = {
 	},
 };
 
+static const struct mfd_cell_acpi_match cros_ec_i2c_tunnel_acpi_match = {
+	.pnpid = "GOOG0012"
+};
+
 static const struct mfd_cell cros_ec_platform_cells[] = {
 	{ .name = "cros-ec-chardev", },
 	{ .name = "cros-ec-debugfs", },
 	{ .name = "cros-ec-lightbar", },
 	{ .name = "cros-ec-pd-sysfs" },
 	{ .name = "cros-ec-sysfs", },
+	{
+		.name = "cros-ec-i2c-tunnel",
+		.acpi_match = &cros_ec_i2c_tunnel_acpi_match,
+		.of_compatible = "google,cros-ec-i2c-tunnel"
+	},
 };
 
 static const struct mfd_cell cros_ec_vbc_cells[] = {
-- 
2.24.0.432.g9d3f5f5b63-goog

