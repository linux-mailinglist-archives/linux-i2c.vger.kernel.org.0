Return-Path: <linux-i2c+bounces-12313-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C83E9B2921B
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Aug 2025 09:56:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 863604E1793
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Aug 2025 07:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A81B238159;
	Sun, 17 Aug 2025 07:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKTR0oSU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA461E5718;
	Sun, 17 Aug 2025 07:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755417401; cv=none; b=ZNOP+lc8hKUmJKY1q2p9oJ6Y4DBjN4TGESNxHJSIrKDaVUaRmAPQuOor8e8WbJbDvnIhZ4EvbxhyG3D/L6oIGDy8Ip2Kvmjx8PzcRaIlBbpWP4pQqD6r37sYg4MZ+wUVh4463+9odYB7n7yuzps8rJrQ7Cw9b2RPBi7t62hRu5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755417401; c=relaxed/simple;
	bh=S60GrxtUjunK/rsP99mOcwBno1Hi+RGVldknhZrFPog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=E1Bua23snGKJP17Htj3f6gX7prHSVm4phowX3Kcu66c2iVdARHAv6FtIK5eTKzSfdgcUWDoYNE0sZFgGE4keb+e1bC6iVLuWFmVutHvXNWDvbSAKZH5sAuv7N7cyhSZeyMbSbfzj2fuhIReH7R6PgE1J+dfZp3ywwKkaUI34nwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKTR0oSU; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45a1b00797dso18734905e9.0;
        Sun, 17 Aug 2025 00:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755417398; x=1756022198; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KUkUBMS1IwQlC3yVuJNJNDMd6KXZgr5vYss6MjFxEsY=;
        b=TKTR0oSUrDPg/FKqzE4vDryY1kAGqEkay7mwhUVZVmN20yfS3JodwNdzkVql7QbF+X
         VfkoTuKMO/CX8+lbZ49EBJvP8mM+lNNdMyAfTXPQRrgOclgyGQjtez+gJhXnFNW/TF+K
         93Wk9BdYBHVeTELSqZTPeMCIzOhuBYqgwvfu8LKZNmKHA4iZ8K6Ogm26QyArIu2LvT+Z
         XpC1N4qPMEp7Lsi8wTlfNhSlg37K6kX9a/iQTt7xX7gSTfdSd0fmNQH/vXW0XAyN71O0
         r4UtD1bTfCGMhhNCE9hYRJFCh8mkFt//ZH65kYVsaFo+2+1fi+KmcYAg+jzFYX2qQTIx
         KENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755417398; x=1756022198;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KUkUBMS1IwQlC3yVuJNJNDMd6KXZgr5vYss6MjFxEsY=;
        b=dat2UMvR8dOx3whR5KOuaQYdDMhS5g1SBUnHbNA7mNeR3wiz9fGRcF1FB9yCAppxnN
         VrFwaSFFMyOdzxkYk3gya0NWHZHoVOlWKxIoUADT1O7UoS98gjKCsdo7YXJ4hzVjSw2c
         S5F8KAEKXHalrX+6C1/L7xPIolZLzRk46oxFZ5Jt06Sas4cbDkKs1d1otXMSIdF71G9e
         451pEF2JfxYtGEWedhvGcmaSZvL9RFKr/7/kCwFawRTehpRPlZ/jXwtp87xLjlD8nRmh
         mxe6OyrBOJe+7C56GbzZ9DVYFA/ivDOKtgVsxi8IwN9BM84j42vV3uvReFmTuBZTb2wc
         VQ8g==
X-Forwarded-Encrypted: i=1; AJvYcCVo7rlxJ/QBjkVum97JHFCj+NwH7hBrrbwhDy+FWXU7jawI3ReQjkrX+B/cwJXFMuBxFSgv2w1qETNuwYQ=@vger.kernel.org, AJvYcCWdPVVl7uTluXOj+WCRyG4imyWE8ISPsB/D6IoZ5HPqWdSej83XL3ET8L5qElNEBoolEdykUpSgo1y6AG09fW/V6RKm@vger.kernel.org
X-Gm-Message-State: AOJu0Yyher0SB0it9N9ZYXR9Lw+lOxIlLL9A83SO/Fm1a5tgSTXtLRpo
	rBgtOBYTGdoUY6AZfJBdgfYpt9zYnQpJSwpwjEqEWVd8PUyJS7QdhOF+
X-Gm-Gg: ASbGnctoeRrBSMSbkU+XPMpW5R64+wfIcSZSzPA6M877Yt/1HhKnhk7EfY7kzrZxQRH
	T+/ZJIA5Bpj1MxdJMX0yUc06yhu4ED/nDqSwicNRAqSUE/dncyq2a6kBNlsBaWdprlZFMQYoe66
	pGRVHFGi7UDVM9Cm7dkcgMywaKf5Iy5Y/7+ahxrq+0EfDMY2T8/e9f2hyMNzh5rcgShHga2iq7h
	CsrSCV6UjuKrTpLG16kj/HJpP2GhZQvxDWb1rn7S+i+dFoXfrplHsiF/Ab81gSJtmLr6rW5PhR6
	QcUxx000o+xwwe13ZQDhFLXTjrXIGtcXSonltB0PGnSHbw+G0g52+JP87ZGeSfyvm0a87SHu09H
	dyWLy/n+9Ca0y2wz2RDZJQ6cpYkc=
X-Google-Smtp-Source: AGHT+IGnuF8FMt+qBubHcZo8C4fC7SAScCaoFFspsdeLBrDHUCiuRVvWkyQdN/xlCiJS+XIRkXcCWQ==
X-Received: by 2002:a05:600c:3510:b0:456:1442:86e with SMTP id 5b1f17b1804b1-45a2184754bmr54181595e9.21.1755417397606;
        Sun, 17 Aug 2025 00:56:37 -0700 (PDT)
Received: from [127.0.1.1] ([156.205.52.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a223292d2sm85254605e9.21.2025.08.17.00.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 00:56:37 -0700 (PDT)
From: Mohammad Gomaa <midomaxgomaa@gmail.com>
Date: Sun, 17 Aug 2025 10:55:14 +0300
Subject: [PATCH WIP v2] i2c: add tracepoints to aid debugging in
 i2c-core-base
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250817-refactor-add-i2c-tracepoints-v2-1-c0bad299e02e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOGKoWgC/42Nvw6CMBDGX4Xc7BlaBcXJ1c3NwTC0vQMuAUpaQ
 jSEd7fhCRy/f79vhchBOMItWyHwIlH8mIQ+ZOA6M7aMQkmDznWRX/MSAzfGzT6gIULRDudgHE9
 exjmiLVnbStPZUQUJMaW2fHb8G16PJ9TJ7CSm/Xe/XNQe/UdfFCokRafKUtnY4nJvByP90fkB6
 m3bfhko6VPNAAAA
X-Change-ID: 20250806-refactor-add-i2c-tracepoints-b6e2b92d4cd9
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, kenalba@google.com, 
 hbarnor@chromium.org, rayxu@google.com, 
 Mohammad Gomaa <midomaxgomaa@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755417396; l=9680;
 i=midomaxgomaa@gmail.com; s=20250806; h=from:subject:message-id;
 bh=S60GrxtUjunK/rsP99mOcwBno1Hi+RGVldknhZrFPog=;
 b=gWgvBnkdATsN3DKs3Z5qlPHcHkJnzpTwFSejfgHTy3WI8viywrt71UzukLAGZi2TyUpQpBc/2
 in99gCwkdmSB3hX8nppWwX7A3Mt9862AgZUJFb2M8iwcWHmRsxK3qyl
X-Developer-Key: i=midomaxgomaa@gmail.com; a=ed25519;
 pk=I6wR1OynGsrkha14RX3loo3BZsP8pVrK45bErJtcxZE=

Add tracepoints to i2c-core-base.c file to help trace
and debug I2C device probe failures.

The new trace points are:
- i2c_device_probe_debug: records non-failure routines
  e.g. IRQ 0.
- i2c_device_probe_complete: records failed & successful
  probbes with appropriate trace message.

To support operation of these tracepoints an enum
was added that stores log message for debug and failure.

Signed-off-by: Mohammad Gomaa <midomaxgomaa@gmail.com>
---
Hello,

This patch adds tracepoints to i2c-core-base to aid with debugging I2C probing failrues.

The motivation for this comes from my work in Google Summer of Code (GSoC) 2025:
"ChromeOS Platform Input Device Quality Monitoring"
https://summerofcode.withgoogle.com/programs/2025/projects/uCdIgK7K

This is my first submission to the Linux kernel, so any feedback is welcome.
---
Changes in v2:
- Refactored i2c_device_probe_failed to i2c_device_probe_complete
  to support both successful and failed probes.
- Fixed formatting for TRACE_EVENT().
- Used enum instead of string variable for "reason".
- Link to v1: https://lore.kernel.org/r/20250806-refactor-add-i2c-tracepoints-v1-1-d1d39bd6fb57@gmail.com
---
 drivers/i2c/i2c-core-base.c | 63 ++++++++++++++++++++++++--------
 include/trace/events/i2c.h  | 88 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 137 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index ecca8c006b020379fb53293b20ab09ba25314609..7ca22759d26e85ee51bea60f414ed014e9bcec40 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -495,6 +495,8 @@ static int i2c_device_probe(struct device *dev)
 	struct i2c_driver	*driver;
 	bool do_power_on;
 	int status;
+	int err_reason;
+	bool has_id_table, has_acpi_match, has_of_match;
 
 	if (!client)
 		return 0;
@@ -509,38 +511,54 @@ static int i2c_device_probe(struct device *dev)
 			/* Keep adapter active when Host Notify is required */
 			pm_runtime_get_sync(&client->adapter->dev);
 			irq = i2c_smbus_host_notify_to_irq(client);
+			err_reason = I2C_TRACE_REASON_HOST_NOTIFY;
 		} else if (is_of_node(fwnode)) {
 			irq = fwnode_irq_get_byname(fwnode, "irq");
 			if (irq == -EINVAL || irq == -ENODATA)
 				irq = fwnode_irq_get(fwnode, 0);
+			err_reason = I2C_TRACE_REASON_FROM_OF;
 		} else if (is_acpi_device_node(fwnode)) {
 			bool wake_capable;
 
 			irq = i2c_acpi_get_irq(client, &wake_capable);
 			if (irq > 0 && wake_capable)
 				client->flags |= I2C_CLIENT_WAKE;
+			err_reason = I2C_TRACE_REASON_FROM_ACPI;
 		}
 		if (irq == -EPROBE_DEFER) {
 			status = dev_err_probe(dev, irq, "can't get irq\n");
+			err_reason = I2C_TRACE_REASON_EPROBE_DEFER_IRQ;
 			goto put_sync_adapter;
 		}
 
-		if (irq < 0)
+		if (irq < 0) {
+			trace_i2c_device_probe_debug(dev, err_reason);
 			irq = 0;
+		}
 
 		client->irq = irq;
 	}
 
 	driver = to_i2c_driver(dev->driver);
 
+	has_id_table = driver->id_table;
+	has_acpi_match = acpi_driver_match_device(dev, dev->driver);
+	has_of_match = i2c_of_match_device(dev->driver->of_match_table, client);
+
+	if (!has_id_table)
+		trace_i2c_device_probe_debug(dev, I2C_TRACE_REASON_NO_I2C_ID_TABLE);
+	if (!has_acpi_match)
+		trace_i2c_device_probe_debug(dev, I2C_TRACE_REASON_ACPI_ID_MISMATCH);
+	if (!has_of_match)
+		trace_i2c_device_probe_debug(dev, I2C_TRACE_REASON_OF_ID_MISMATCH);
+
 	/*
 	 * An I2C ID table is not mandatory, if and only if, a suitable OF
 	 * or ACPI ID table is supplied for the probing device.
 	 */
-	if (!driver->id_table &&
-	    !acpi_driver_match_device(dev, dev->driver) &&
-	    !i2c_of_match_device(dev->driver->of_match_table, client)) {
+	if (!has_id_table && !has_acpi_match && !has_of_match) {
 		status = -ENODEV;
+		err_reason = I2C_TRACE_REASON_NO_ID_MATCH;
 		goto put_sync_adapter;
 	}
 
@@ -550,47 +568,60 @@ static int i2c_device_probe(struct device *dev)
 		wakeirq = fwnode_irq_get_byname(fwnode, "wakeup");
 		if (wakeirq == -EPROBE_DEFER) {
 			status = dev_err_probe(dev, wakeirq, "can't get wakeirq\n");
+			err_reason = I2C_TRACE_REASON_EPROBE_DEFER_WAKEIRQ;
 			goto put_sync_adapter;
 		}
 
 		device_init_wakeup(&client->dev, true);
 
-		if (wakeirq > 0 && wakeirq != client->irq)
+		if (wakeirq > 0 && wakeirq != client->irq) {
 			status = dev_pm_set_dedicated_wake_irq(dev, wakeirq);
-		else if (client->irq > 0)
+			err_reason = I2C_TRACE_REASON_SET_DED_WAKE_FAILED;
+		} else if (client->irq > 0) {
 			status = dev_pm_set_wake_irq(dev, client->irq);
-		else
+			err_reason = I2C_TRACE_REASON_SET_WAKE_FAILED;
+		} else {
 			status = 0;
+			err_reason = I2C_TRACE_REASON_NO_IRQ;
+		}
 
-		if (status)
+		if (status) {
 			dev_warn(&client->dev, "failed to set up wakeup irq\n");
+			trace_i2c_device_probe_debug(&client->dev, err_reason);
+		}
 	}
 
 	dev_dbg(dev, "probe\n");
 
 	status = of_clk_set_defaults(to_of_node(fwnode), false);
-	if (status < 0)
+	if (status < 0) {
+		err_reason = I2C_TRACE_REASON_SET_DEF_CLOCKS;
 		goto err_clear_wakeup_irq;
-
+	}
 	do_power_on = !i2c_acpi_waive_d0_probe(dev);
 	status = dev_pm_domain_attach(&client->dev, do_power_on ? PD_FLAG_ATTACH_POWER_ON : 0);
-	if (status)
+	if (status) {
+		err_reason = I2C_TRACE_REASON_ATTACH_PM_DOMAIN;
 		goto err_clear_wakeup_irq;
-
+	}
 	client->devres_group_id = devres_open_group(&client->dev, NULL,
 						    GFP_KERNEL);
 	if (!client->devres_group_id) {
 		status = -ENOMEM;
+		err_reason = I2C_TRACE_REASON_OPEN_DEVRES_GROUP;
 		goto err_detach_pm_domain;
 	}
 
 	client->debugfs = debugfs_create_dir(dev_name(&client->dev),
 					     client->adapter->debugfs);
 
-	if (driver->probe)
+	if (driver->probe) {
 		status = driver->probe(client);
-	else
+		err_reason = I2C_TRACE_REASON_PROBE_FAILED;
+	} else {
 		status = -EINVAL;
+		err_reason = I2C_TRACE_REASON_NO_PROBE;
+	}
 
 	/*
 	 * Note that we are not closing the devres group opened above so
@@ -603,6 +634,8 @@ static int i2c_device_probe(struct device *dev)
 	if (status)
 		goto err_release_driver_resources;
 
+	trace_i2c_device_probe_complete(&client->dev, status, err_reason);
+
 	return 0;
 
 err_release_driver_resources:
@@ -617,6 +650,8 @@ static int i2c_device_probe(struct device *dev)
 	if (client->flags & I2C_CLIENT_HOST_NOTIFY)
 		pm_runtime_put_sync(&client->adapter->dev);
 
+	trace_i2c_device_probe_complete(&client->dev, status, err_reason);
+
 	return status;
 }
 
diff --git a/include/trace/events/i2c.h b/include/trace/events/i2c.h
index 142a23c6593c611de9abc2a89a146b95550b23cd..b00650ceba0a96a7cc538991ce5d5a45ea553715 100644
--- a/include/trace/events/i2c.h
+++ b/include/trace/events/i2c.h
@@ -16,6 +16,94 @@
 /*
  * drivers/i2c/i2c-core-base.c
  */
+#ifndef I2C_TRACE_REASON_ENUM_DEFINED
+#define I2C_TRACE_REASON_ENUM_DEFINED
+
+#define I2C_TRACE_REASON \
+EM(HOST_NOTIFY,			"IRQ 0: could not get irq from Host Notify") \
+EM(FROM_OF,			"IRQ 0: could not get irq from OF") \
+EM(FROM_ACPI,			"IRQ 0: could not get irq from ACPI") \
+EM(EPROBE_DEFER_IRQ,		"IRQ 0: could not get IRQ due to EPROBE_DEFER") \
+EM(NO_I2C_ID_TABLE,		"no I2C ID table") \
+EM(ACPI_ID_MISMATCH,		"ACPI ID table mismatch") \
+EM(OF_ID_MISMATCH,		"OF ID table mismatch") \
+EM(NO_ID_MATCH,		"no I2C ID table and no ACPI/OF match") \
+EM(EPROBE_DEFER_WAKEIRQ,	"get wake IRQ due to EPROBE_DEFER") \
+EM(SET_DED_WAKE_FAILED,	"failed to set dedicated wakeup IRQ") \
+EM(SET_WAKE_FAILED,		"failed to set wakeup IRQ") \
+EM(NO_IRQ,			"no IRQ") \
+EM(SET_DEF_CLOCKS,		"set default clocks") \
+EM(ATTACH_PM_DOMAIN,		"attach PM domain") \
+EM(OPEN_DEVRES_GROUP,		"open devres group") \
+EM(PROBE_FAILED,		"specific driver probe failed") \
+EMe(NO_PROBE,			"no probe defined")
+
+#undef EM
+#undef EMe
+#define EM(a, b)	I2C_TRACE_REASON_##a,
+#define EMe(a, b)	I2C_TRACE_REASON_##a
+enum {
+	I2C_TRACE_REASON
+};
+
+#undef EM
+#undef EMe
+#define EM(a, b)	TRACE_DEFINE_ENUM(I2C_TRACE_REASON_##a);
+#define EMe(a, b)	TRACE_DEFINE_ENUM(I2C_TRACE_REASON_##a);
+I2C_TRACE_REASON
+
+#undef EM
+#undef EMe
+#define EM(a, b)		{ I2C_TRACE_REASON_##a, b },
+#define EMe(a, b)	{ I2C_TRACE_REASON_##a, b }
+
+#endif /* I2C_TRACE_REASON_ENUM_DEFINED */
+
+TRACE_EVENT(i2c_device_probe_debug,
+
+	TP_PROTO(struct device *dev, int err_reason),
+
+	TP_ARGS(dev, err_reason),
+
+	TP_STRUCT__entry(
+		__string(	devname,	dev_name(dev)	)
+		__field(	int,		err_reason	)
+	),
+
+	TP_fast_assign(
+		__assign_str(devname);
+		__entry->err_reason = err_reason;
+	),
+
+	TP_printk("device=%s: %s",
+		__get_str(devname),
+		__print_symbolic(__entry->err_reason, I2C_TRACE_REASON))
+);
+
+TRACE_EVENT(i2c_device_probe_complete,
+
+	TP_PROTO(struct device *dev, int status, int err_reason),
+
+	TP_ARGS(dev, status, err_reason),
+
+	TP_STRUCT__entry(
+		__string(	dev_name,	dev_name(dev)	)
+		__field(	int,		status		)
+		__field(	int,		err_reason	)
+	),
+
+	TP_fast_assign(
+		__assign_str(dev_name);
+		__entry->status = status;
+		__entry->err_reason = err_reason;
+	),
+
+	TP_printk("%s probe %s: %s",
+		__get_str(dev_name),
+		__entry->status ? "failed" : "succeeded",
+		__entry->status ? __print_symbolic(__entry->err_reason, I2C_TRACE_REASON) : "")
+);
+
 extern int i2c_transfer_trace_reg(void);
 extern void i2c_transfer_trace_unreg(void);
 

---
base-commit: 7e161a991ea71e6ec526abc8f40c6852ebe3d946
change-id: 20250806-refactor-add-i2c-tracepoints-b6e2b92d4cd9

Best regards,
-- 
Mohammad Gomaa <midomaxgomaa@gmail.com>


