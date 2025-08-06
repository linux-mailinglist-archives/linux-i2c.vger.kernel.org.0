Return-Path: <linux-i2c+bounces-12159-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C645B1C309
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Aug 2025 11:15:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 835551715C6
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Aug 2025 09:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F07C28A1F3;
	Wed,  6 Aug 2025 09:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VxTfxvvd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B637289816;
	Wed,  6 Aug 2025 09:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754471714; cv=none; b=Kc1IHvRX99DTt9aAPKhNmHqYkQkEddT7NAMdC4t6YunM/9PNLxzIapae7EOl1XgCYPhaPbG822Cp4gtNIRp2cAo9lcTBxSsg0LssazLbYPytx2LPCjZRUyK8jenIjf5uiI+EFTatavA9M4CthZTr38ZFEJDtfqgKVscEZoigESA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754471714; c=relaxed/simple;
	bh=cPjYo8AzqMspg2tYIoGyVRHz8/SiTlbD302+YRatmOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GmArbBfQ5BJapb/ZB30nAL1HzCbLN6Kyo/ejOZp+XkDv80fmb3neXijR4AcbhdQaJOMD2RHNTpv9QvGnUMomK0ZI2/RBxdgOR+2JTx82uzpdvjl+w6HJKCMtsbGrkFHsEDO2c3Q/wi1N18R8rU2G0dlkCRRkTNiEp/suuH6T1ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VxTfxvvd; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-458b49c98a7so31011365e9.1;
        Wed, 06 Aug 2025 02:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754471711; x=1755076511; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DX5JM4nBPkjLGOnJNcCxJJtxAF6mVlk/OhtjFp+9kBA=;
        b=VxTfxvvdcjS6PYY+9cyxvWiqhiNrdhwQ/ohbFrTr5ou5IqghSFLAmsCy7fod04VVfz
         bIvcjNcE6cU6Mrca4SxXx07aS3nUadGadY7mT+AdK1msoKX/4cHHNeOX85K5x1H92tfV
         If+PMiPyxNDP8dTTNifjj1avI0L8HVp0Jh9HjThxprHumr+NavPPey/dyEGHiHN2rCL7
         txdPKXUN88UM0c0QV5QqJLiIwjU1kdsHpt8VqtXpUSgoGUJEo0sYH6DWcgqd4YwF4b2d
         qIAcU9ZPCNEXQ01J6thFzlcsSrcffsbCb14ik3bErLtRaVmAdpMvwNhBaGl5KIcljlk4
         5b3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754471711; x=1755076511;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DX5JM4nBPkjLGOnJNcCxJJtxAF6mVlk/OhtjFp+9kBA=;
        b=FuI7IDny4SDlxBeIM5xg/Nr6eI8t7asLNp/83NHaMReEt0C2qO4qKrdNMZbDKFuPy4
         n3cpkwkfXvs3bLwGD3nYEJ//m3G88BfS1VJleqfMZYmrY1DAG758CrgzJVPnrNdTPa0n
         7pdazjrgVEvJIS3XJYNmfXPE+jnbmIYm6CAP8Lj4TfoMMSyk4HiCZHQ6kSwyYcSQWDCT
         0sUgtxPho/jovzkrl+d67XEelXTBq1xzCN92zO/sEk6gul1e8f5zjAaNCyg6kpUSfAUN
         dxoTatIpXNx8IfQuXXXepkZ/fqjvgpf8kkAl25EBtLwwGGRorqrTPttPa31StuqFBv2Q
         KYAA==
X-Forwarded-Encrypted: i=1; AJvYcCVN8PSdn4fgYjNj6pEYr1LHn4/qXE5D8WiW4FA9FsN5IDFuNbvHGr0CxWtXK0mJm7oI1Lttit6mO8Viy9A=@vger.kernel.org, AJvYcCX0Q8FaFjIUDfWzymKsKZoygze64EvzI/YG3w8RLNUq+/B02zkeb0PocwkzB80ckqyMZ6Ow45AnFEZSEROQTioO7HPs@vger.kernel.org
X-Gm-Message-State: AOJu0YyJR3azvl54dUulNPtSErcM8Szz5ekkBBnJ/jOr8cP9j7F/LLiV
	hq7VaBVSg70ZWRqbzy5d2MEyml2j6l6FvMa0sx7hfwXMR2wXPwuHsW7Y
X-Gm-Gg: ASbGncsvRenTJisHD2oq00mnRJnP4SkT9iUqBdG32A6Yqftc/KaZfTCmmLrAC/ooGWM
	r3r64687jSVHKd6pe6akJK3Gp0YdH01UjVS3QB3AYQ9GG9ISJPNl2q8kUP8uZraLSkviOjtKJ2B
	4D54UUpYVDjlIIyY49sPzGUMUtVUgUaE8DcnR7ZbzW0afShOdKUwjFpV1OALEPcSKW4XkDy4kXR
	RORhk/w4aOj9rmdrfousFYtkjUQCpp53Meegng9NpMfbq5YsxUINFlV0mnlC+6Zw6LsRm7b3Xzv
	6c82sQQ3rLCApBCb4kBZiARbUGn7uA8feXBRw5AHKvWZiR6I9O435wvBBi2gyZc54HaQ6OmPUmB
	ZtmZ2ToTEcJcapH5pspCS/lt0tZhbIBaiuF4=
X-Google-Smtp-Source: AGHT+IFqjqdS7Cg957mc1iR3Hqs7wjBVpFaj/fLbsLMX3mD8qlUCvm1PZ6Ku4y+Bx8nKg0TA6FQ3cQ==
X-Received: by 2002:a05:600c:c0c3:20b0:456:2698:d4d9 with SMTP id 5b1f17b1804b1-459e73a9797mr13116665e9.3.1754471711085;
        Wed, 06 Aug 2025 02:15:11 -0700 (PDT)
Received: from [127.0.1.1] ([102.47.32.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459dbba5210sm109451925e9.2.2025.08.06.02.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 02:15:10 -0700 (PDT)
From: Mohammad Gomaa <midomaxgomaa@gmail.com>
Date: Wed, 06 Aug 2025 12:14:32 +0300
Subject: [PATCH WIP] i2c: add tracepoints to aid debugging in i2c-core-base
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250806-refactor-add-i2c-tracepoints-v1-1-d1d39bd6fb57@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPcck2gC/x3MsQrCQAyA4VcpmQ1cgxbrG3RzcxCHa5LWLHcld
 4hQ+u4ejh/8/DsUddMCt24H148Vy6mhP3XA75hWRZNmoECXcA0Dui6Ra3aMImjEWD2ybtlSLTg
 PSvNIcmYZoS22Vtv3v3/CY7rD6zh+HUdp23MAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754471709; l=7303;
 i=midomaxgomaa@gmail.com; s=20250806; h=from:subject:message-id;
 bh=cPjYo8AzqMspg2tYIoGyVRHz8/SiTlbD302+YRatmOo=;
 b=Krha1sCWef0rBBZ+bAOkdbb/yMmrE95AhvKb65Io7TpUVQu+Fn844AqaTHgZNfUMsN2asFd4T
 bkTdd+5r5NmCEjD3H0Bt98uqOWGFWdhBN1EFtvwO/vO2LE8Ha0wbxJc
X-Developer-Key: i=midomaxgomaa@gmail.com; a=ed25519;
 pk=I6wR1OynGsrkha14RX3loo3BZsP8pVrK45bErJtcxZE=

Add tracepoints to i2c-core-base.c file to help trace
and debug I2C device probe failures.

The new trace points are:
- i2c_device_probe_debug: records non-failure routines
  e.g. IRQ 0.
- i2c_device_probe_failed: records failure routines e.g.
  failure to set default clocks.

To support operation of these tracepoints a variable
was added to record reason for debug and failure.

Signed-off-by: Mohammad Gomaa <midomaxgomaa@gmail.com>
---
Hello,

This patch adds tracepoints to i2c-core-base to aid with debugging I2C probing failrues.

The motivation for this comes from my work in Google Summer of Code (GSoC) 2025:
"ChromeOS Platform Input Device Quality Monitoring"
https://summerofcode.withgoogle.com/programs/2025/projects/uCdIgK7K

This is my first submission to the Linux kernel, so any feedback is welcome.
---
 drivers/i2c/i2c-core-base.c | 61 ++++++++++++++++++++++++++++++++++-----------
 include/trace/events/i2c.h  | 23 +++++++++++++++++
 2 files changed, 70 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index ecca8c006b020379fb53293b20ab09ba25314609..c145af56a17d74117985430d04b75fff5b45b9b2 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -495,6 +495,8 @@ static int i2c_device_probe(struct device *dev)
 	struct i2c_driver	*driver;
 	bool do_power_on;
 	int status;
+	const char *reason = NULL;
+	bool has_id_table, has_acpi_match, has_of_match;
 
 	if (!client)
 		return 0;
@@ -509,38 +511,54 @@ static int i2c_device_probe(struct device *dev)
 			/* Keep adapter active when Host Notify is required */
 			pm_runtime_get_sync(&client->adapter->dev);
 			irq = i2c_smbus_host_notify_to_irq(client);
+			reason = "IRQ 0: could not get irq from Host Notify";
 		} else if (is_of_node(fwnode)) {
 			irq = fwnode_irq_get_byname(fwnode, "irq");
 			if (irq == -EINVAL || irq == -ENODATA)
 				irq = fwnode_irq_get(fwnode, 0);
+			reason = "IRQ 0: could not get irq from OF";
 		} else if (is_acpi_device_node(fwnode)) {
 			bool wake_capable;
 
 			irq = i2c_acpi_get_irq(client, &wake_capable);
 			if (irq > 0 && wake_capable)
 				client->flags |= I2C_CLIENT_WAKE;
+			reason = "IRQ 0: could not get irq from ACPI";
 		}
 		if (irq == -EPROBE_DEFER) {
 			status = dev_err_probe(dev, irq, "can't get irq\n");
+			reason = "IRQ 0: could not get IRQ due to EPROBE_DEFER";
 			goto put_sync_adapter;
 		}
 
-		if (irq < 0)
+		if (irq < 0) {
+			trace_i2c_device_probe_debug(dev, reason);
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
+		trace_i2c_device_probe_debug(dev, "no I2C ID table");
+	if (!has_acpi_match)
+		trace_i2c_device_probe_debug(dev, "ACPI ID table mismatch");
+	if (!has_of_match)
+		trace_i2c_device_probe_debug(dev, "OF ID table mismatch");
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
+		reason = "no I2C ID table and no ACPI/OF match";
 		goto put_sync_adapter;
 	}
 
@@ -550,47 +568,60 @@ static int i2c_device_probe(struct device *dev)
 		wakeirq = fwnode_irq_get_byname(fwnode, "wakeup");
 		if (wakeirq == -EPROBE_DEFER) {
 			status = dev_err_probe(dev, wakeirq, "can't get wakeirq\n");
+			reason = "get wake IRQ due to EPROBE_DEFER";
 			goto put_sync_adapter;
 		}
 
 		device_init_wakeup(&client->dev, true);
 
-		if (wakeirq > 0 && wakeirq != client->irq)
+		if (wakeirq > 0 && wakeirq != client->irq) {
 			status = dev_pm_set_dedicated_wake_irq(dev, wakeirq);
-		else if (client->irq > 0)
+			reason = "failed to set dedicated wakeup IRQ";
+		} else if (client->irq > 0) {
 			status = dev_pm_set_wake_irq(dev, client->irq);
-		else
+			reason = "failed to set wakeup IRQ";
+		} else {
 			status = 0;
+			reason = "no IRQ";
+		}
 
-		if (status)
+		if (status) {
 			dev_warn(&client->dev, "failed to set up wakeup irq\n");
+			trace_i2c_device_probe_debug(&client->dev, reason);
+		}
 	}
 
 	dev_dbg(dev, "probe\n");
 
 	status = of_clk_set_defaults(to_of_node(fwnode), false);
-	if (status < 0)
+	if (status < 0) {
+		reason = "set default clocks";
 		goto err_clear_wakeup_irq;
-
+	}
 	do_power_on = !i2c_acpi_waive_d0_probe(dev);
 	status = dev_pm_domain_attach(&client->dev, do_power_on ? PD_FLAG_ATTACH_POWER_ON : 0);
-	if (status)
+	if (status) {
+		reason = "attach PM domain";
 		goto err_clear_wakeup_irq;
-
+	}
 	client->devres_group_id = devres_open_group(&client->dev, NULL,
 						    GFP_KERNEL);
 	if (!client->devres_group_id) {
 		status = -ENOMEM;
+		reason = "open devres group";
 		goto err_detach_pm_domain;
 	}
 
 	client->debugfs = debugfs_create_dir(dev_name(&client->dev),
 					     client->adapter->debugfs);
 
-	if (driver->probe)
+	if (driver->probe) {
 		status = driver->probe(client);
-	else
+		reason = "specific driver probe failed";
+	} else {
 		status = -EINVAL;
+		reason = "no probe defined";
+	}
 
 	/*
 	 * Note that we are not closing the devres group opened above so
@@ -617,6 +648,8 @@ static int i2c_device_probe(struct device *dev)
 	if (client->flags & I2C_CLIENT_HOST_NOTIFY)
 		pm_runtime_put_sync(&client->adapter->dev);
 
+	trace_i2c_device_probe_failed(&client->dev, status, reason);
+
 	return status;
 }
 
diff --git a/include/trace/events/i2c.h b/include/trace/events/i2c.h
index 142a23c6593c611de9abc2a89a146b95550b23cd..1a08800dcdd760e2a5a40b76c4a244e1b4ef3b1e 100644
--- a/include/trace/events/i2c.h
+++ b/include/trace/events/i2c.h
@@ -16,6 +16,29 @@
 /*
  * drivers/i2c/i2c-core-base.c
  */
+TRACE_EVENT(i2c_device_probe_debug,
+	    TP_PROTO(struct device *dev, const char *message),
+	    TP_ARGS(dev, message),
+	    TP_STRUCT__entry(__string(devname, dev_name(dev)) __string(message, message)),
+	    TP_fast_assign(__assign_str(devname); __assign_str(message);),
+	    TP_printk("device=%s: %s", __get_str(devname), __get_str(message))
+);
+
+TRACE_EVENT(i2c_device_probe_failed,
+	    TP_PROTO(struct device *dev, int status, const char *reason),
+	    TP_ARGS(dev, status, reason),
+	    TP_STRUCT__entry(__string(dev_name, dev_name(dev))
+			     __field(int, status)
+			     __string(reason, reason)),
+	    TP_fast_assign(__assign_str(dev_name);
+		__entry->status = status;
+		__assign_str(reason);),
+	    TP_printk("failed to probe %s: %d (%s)",
+		      __get_str(dev_name),
+		      __entry->status,
+		      __get_str(reason))
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


