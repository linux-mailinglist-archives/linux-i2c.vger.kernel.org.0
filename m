Return-Path: <linux-i2c+bounces-9220-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CC4A1D9B4
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jan 2025 16:40:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B4863A6604
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jan 2025 15:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B70E414901B;
	Mon, 27 Jan 2025 15:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WIOwJ6lM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40851885B3;
	Mon, 27 Jan 2025 15:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737992384; cv=none; b=o1TQJRWMTEJ1RdXPzzRZKTqZGyFG1IrBxYrZg2b7wdzoiBqPRd6nCBcI2C0i4sJ+xOrbbzWxtX0L8y6xjnFtRqp6HkbRZjO+XyB090BUF+a+xbbDqY0UO+N111ZIPQm0m9sY87ZtmMvz3K9WPiqu3wlBfM49o9xnIcTcniphSBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737992384; c=relaxed/simple;
	bh=Xucao2XKxqYWBDWSEH2c45K4PBJDq97oiVnevoBhIkU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n0s24lcWB6R2GixDNMk1u4fYBmVlX+gnmPqWf6ZEGLmt2DAIfBehtrHj+XaejAYgMi9MzKSUsECTjiZbn2Vum0cSrwdod/iizSRiUFSzQ5bfCUxRhNi6On9xY042j8Txy+Dj1ZbkZQH0XSFx8+iAazC2d/YL4T1lbO7ixdry1XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WIOwJ6lM; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ee8e8e29f6so6079432a91.0;
        Mon, 27 Jan 2025 07:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737992382; x=1738597182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=pt9we7aaAQ7bKAfXUJKeflFzRWw2ZTABO7BWctm1yb4=;
        b=WIOwJ6lMcVDWX8OHcLr1yfRD7r7GfD8Q3UEhwwamd8lF8vRLgCvnMgrh3ahpYSdkfy
         txDbOeB2CshtpuKsnNrbNpKoPHXbFM8VgsgNlVwE6VhZjKqVZc673yx7C5V8g8gTSr+k
         80HUS0mRRjO2yqLSuigWoqkVfUDlbD19jmsJm6GQFHiuSF1x4P0OZf1dzTzun4TEPmRZ
         2g8336kBJuL2Jzq32+bUL/iNv3hTKVrUw6WyQtEOUD4iRExjBORbbQWAK/YNdQUjzih2
         p54b16ncT9giZfjiuuQwU/DvYc+DcUllraJ/1bg/8GQTz1lSTkDAk5EGZEcwMcF8QSAT
         l1Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737992382; x=1738597182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pt9we7aaAQ7bKAfXUJKeflFzRWw2ZTABO7BWctm1yb4=;
        b=WyjuFh5w3GHRVy9E5I5KddvxJP0R808XCH7abxuboKOIptIq88mw8niNm1pT4eI7BG
         acBc84AUf0dJaVRK4DgeZGAzR+r42OeO4ydxuGzCcR8ijUcNzIxbJ9mI/2ZTSE+fsppA
         52qkqsEcfneCxHqV+3SfV1/uyh1jmLi7+AUopQ1PIxR+xdF5LMbma/EmiS0Li3QEdGn8
         ingYlsTRyrIWXwfrzCg8PSwP92FuUyqeJRtrQb/h0wqTbbFPhpR4oFIIJURnK4+mAhl5
         xZMiAZ4ygKRAwjLAIGiZt8iLVCXyoAn3Qy6mAVST8eNmEe9BnCMSoZO92+rz6G+YFqyB
         LSXg==
X-Forwarded-Encrypted: i=1; AJvYcCUpYTkIbN2PIv2s+6o9mdYQAUFTjrXwqSnvifAaVmr5iPcKerignV/6002N14CjXj+MYhHF0twHcMHb61k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2m03Qx4CDZD3Kw6t6yr+DEmEHeIAA55tzKKh+P1kytNcsxIny
	01fzc/LVAdGxVQi/TYZRCMFM4uRJ1ikNSHI9tdhCyHZlOXl5DxEpAITg6Q==
X-Gm-Gg: ASbGnctiKp1s3B/7GLZvD6N7isrO17TV4xf4NIyziQvSb4A92Phb/s0bLJnVq8J0Ht5
	Bx38X+/SAc2xkpVpURPG2gSog9ifi3Vdy90vCsMQX/Rug0uEXqJ3dl78weGHQZvmeAiar6N6TK/
	r566y5eBV9D/wUnjoMZkIRrZz/snGZBZ37eIwCc6JBOjhuvRAADXUZWACDiAhhvm81KkvSjpdXf
	sDWz6ghXOiVp6RkwDnkIAn5G5OGVo/HX+8heBgjRkzv5DqBk1ZQZWn16h21Dumve7ojkbRsqWuR
	XHCdkvrPK64FvZxygA==
X-Google-Smtp-Source: AGHT+IHHoX2KWoUaoDpF2dtAgdtFVsusbm5KVFPo8QX3LEpf6372vE9/k6GxUbcp5zTsoTHo22s9hQ==
X-Received: by 2002:a17:90b:1f92:b0:2ee:db8a:29d0 with SMTP id 98e67ed59e1d1-2f782d4f3edmr51975719a91.26.1737992381719;
        Mon, 27 Jan 2025 07:39:41 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa5a975sm8157440a91.15.2025.01.27.07.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 07:39:41 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] i2c: Fix core-managed per-client debugfs handling
Date: Mon, 27 Jan 2025 07:39:38 -0800
Message-ID: <20250127153938.34630-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Per-driver debugfs entries are created in the device probe function and
released in the device remove function. The common debugfs directory
introduced with commit d06905d68610 ("i2c: add core-managed per-client
directory in debugfs") is added when a device is registered, not when it
is probed, and it is removed when the device is unregistered. As result,
debugfs entries added by a driver are not deleted when a device remove
function is called since that does not necessarily result in device
unregistration. If the probe function is then called again, the debugfs
entries will already exist, which will result in error messages such as

	debugfs: File 'test' in directory '3-0020' already present!

if 'test' was a debugfs file created during the first call to probe().

This is easy to reproduce by executing "modprobe -r" followed by "modprobe"
with a driver using the debugfs pointer created by the i2c subsystem.

The debugfs directory should be created when a device is probed, not when
it is registered. It should be removed when the device is removed, not
when it is unregistered. Change the code accordingly.

Also clear the client->debugfs if creating the debugfs directory fails.
This simplifies I2C client driver code if it needs to call dentry
functions which do not validate dentry pointers passed as argument.

Fixes: d06905d68610 ("i2c: add core-managed per-client directory in debugfs")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/i2c/i2c-core-base.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index c24ccefb015e..6ae6313b2ea1 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -583,6 +583,11 @@ static int i2c_device_probe(struct device *dev)
 		goto err_detach_pm_domain;
 	}
 
+	client->debugfs = debugfs_create_dir(dev_name(&client->dev),
+					     client->adapter->debugfs);
+	if (IS_ERR(client->debugfs))
+		client->debugfs = NULL;
+
 	if (driver->probe)
 		status = driver->probe(client);
 	else
@@ -602,6 +607,7 @@ static int i2c_device_probe(struct device *dev)
 	return 0;
 
 err_release_driver_resources:
+	debugfs_remove_recursive(client->debugfs);
 	devres_release_group(&client->dev, client->devres_group_id);
 err_detach_pm_domain:
 	dev_pm_domain_detach(&client->dev, do_power_on);
@@ -627,6 +633,8 @@ static void i2c_device_remove(struct device *dev)
 		driver->remove(client);
 	}
 
+	debugfs_remove_recursive(client->debugfs);
+
 	devres_release_group(&client->dev, client->devres_group_id);
 
 	dev_pm_domain_detach(&client->dev, true);
@@ -1015,8 +1023,6 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 	if (status)
 		goto out_remove_swnode;
 
-	client->debugfs = debugfs_create_dir(dev_name(&client->dev), adap->debugfs);
-
 	dev_dbg(&adap->dev, "client [%s] registered with bus id %s\n",
 		client->name, dev_name(&client->dev));
 
@@ -1061,7 +1067,6 @@ void i2c_unregister_device(struct i2c_client *client)
 	if (ACPI_COMPANION(&client->dev))
 		acpi_device_clear_enumerated(ACPI_COMPANION(&client->dev));
 
-	debugfs_remove_recursive(client->debugfs);
 	device_remove_software_node(&client->dev);
 	device_unregister(&client->dev);
 }
-- 
2.45.2


