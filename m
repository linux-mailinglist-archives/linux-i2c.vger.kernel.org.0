Return-Path: <linux-i2c+bounces-14477-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B30AECAFCDE
	for <lists+linux-i2c@lfdr.de>; Tue, 09 Dec 2025 12:42:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7FC69301977A
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Dec 2025 11:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE6172FD7AE;
	Tue,  9 Dec 2025 11:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="13XHVvOQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4419B2E0402
	for <linux-i2c@vger.kernel.org>; Tue,  9 Dec 2025 11:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765280506; cv=none; b=bhg9Eovgy0ggbxWGpQU7v8VRii6NGYCo3xSIkqpO5OEXmuZP8dewQKJqafNT6hPSPNj1PwxyZe+j9aYC6wCFKOKFjOmOTsS5afMl87McTORl4VJIhLmtSfNXD4Qm0vpFH+66uWt/9SeVRYNnIAoJJuZPjJVh/wSSnguiGPO2rs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765280506; c=relaxed/simple;
	bh=5HX3OW285ekofJr+ZMAtH3Qgn6AjwhMDtCWinCjqMKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LaXVl3oM75d5boCtFSmCyFw2ACMxmEyj2BEppw+vn1r/X7PeqVAlOjLgAJp0pVWOMqUCJSlZT8fDscZfUykLB4/roz6eaIQSeUT+mv0BXJzi6iqJYiyHGwO4hNzWefXFilhMpeNm6Hzzn9srcnFSbaGRF7pKlJOIiozBB2qC8yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=13XHVvOQ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so35744775e9.1
        for <linux-i2c@vger.kernel.org>; Tue, 09 Dec 2025 03:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765280501; x=1765885301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iNVZpPWstq6UQ7hNmWtjUM9pqjmls6FXKaYoayGkq+0=;
        b=13XHVvOQiOrpLumjDokm2hx/HlUXCm9ltKNf0P++W/CdkcfD2DnKGhS3DokJQmTrX7
         5h2begMyEv9hEuBWR2hH8MNvfDOxY+uTcRU4DQ4WfFssSPBbVF2dx/+yXBg0arXv5Pb+
         MW0snIOdadfqAggiKfdbwmJyuXL6pUX6hpRmvw4lgY0jw6xfK23oYCdjvJvEiEnFgaqY
         muQfr/7CKODAjUMyuYNtu4cEY0Cnagw+VQypFy7H54voMoJQA/Lg85pmRGV+hRyNIbs1
         jMwJJhjxIB4fP1eHfhz5EVQc1D3zxME3JDDST6KGcmppfujX+S9N1UGDBjtLMVLq8PCC
         hdtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765280501; x=1765885301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iNVZpPWstq6UQ7hNmWtjUM9pqjmls6FXKaYoayGkq+0=;
        b=TeQhoR8YejRbaca+NJC/AhFUzO4aTexwS+NhPcLnTNBZT+PkXhAwV4/zCCfpFwlv+5
         X+pVASXcEq5wCLPB0dNRAFRZ0lWeCakXb4EJ763FdSFrWnJfH8eC+qv96vYrTrZ4++mo
         dEcU4AYltS3Qz+LVQB8W3j4FIXMuiRfL6WBWIBkuciCZfnwEvMaL4KefWWH2qg/SJiB/
         FJpNeoCNMx2K+W0KfIxM7EzOB+eNX/g/AJgK0u29ALX6AzNj4ptrgXp5044M3qcxyKW5
         dFZ80C2VGCjooFZRBTHNxAmmXgOjY+JhyWC7or9dxQRqSEIc1X+mwYQayoaOs6oy4NHA
         G+cg==
X-Forwarded-Encrypted: i=1; AJvYcCVcF+bKhB84KatYad+UVUT6oU0tnusr6XHvD0vT9pqMX8hUXaM47lyIqaA+in84n20nhqLo6BucmHY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSPzi0BhIl7RoikL7p3dxVnpALBQvsgLedol9rkQjnGn5ffiW5
	mm1G7LMqRExAYyCdfVR0Un22xcum6U7LGZeLSar10KPgv+MsAaYzpMqlaX2NPAciUrk=
X-Gm-Gg: ASbGnctTXdQUjoEfIGHh/Y3wENeXN7Dp/ww/RZTP4BAt1w1IhlA/470iq8qHfRVdJXq
	7EgdFkdEphgyiBrjNvStTcMaw5v+9EFhTuh1PkCxIjzSCei7EOBWQV7EAt4DJTXN70mp2O1kpKM
	BD23e+hBKCaiL+N62hb52uooXn5qlvpzMEMI8Ab2Z4QblYOGA1t1v9uEH1MWQL13KpJ+l8C2lal
	uhN0BKbNNbm1rG5q4p6fRUMoIqCBDDwyI1Q4vHPxTzsi6c5X4FIMUUYVN2QHyKZZX38ZZp6FW2o
	yR1Vr7zB2cF2SLsTsGc9opSRGJskNUNihcK9tYUj6ZbvzgGvOwe4OX7hu9PvnRmMFLeO+FpjaDy
	M3iUnkA2AgDkkp+5QAgKfZWYbz9LWCC2rL6Eljr9jrn0VpXhryru9UaCSqToFeU/juFYmfacGkf
	ITJ4NxkMgZqB97GJcxmL0oh3ACOCeK/9Y9ItcJR6em5/oCI+QW9RehC5G72eKfM6mNRvy6qC5ja
	w5StUAL1F62eQ==
X-Google-Smtp-Source: AGHT+IFqjeFtTWyJo7Yt1w2zgHCCsE/PgpgUbX7INlU2Fq5tEzzIvyp2oysXTDSIJZ6c1m1oL5+SVw==
X-Received: by 2002:a05:600c:6014:b0:479:3a2a:94e7 with SMTP id 5b1f17b1804b1-4793a2a952fmr81397435e9.10.1765280501553;
        Tue, 09 Dec 2025 03:41:41 -0800 (PST)
Received: from localhost (p200300f65f00660846b2ba6e435ad603.dip0.t-ipconnect.de. [2003:f6:5f00:6608:46b2:ba6e:435a:d603])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47a7d70fae2sm34084825e9.12.2025.12.09.03.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 03:41:41 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Eddie James <eajames@linux.ibm.com>
Cc: Ninad Palsule <ninad@linux.ibm.com>,
	linux-fsi@lists.ozlabs.org,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/13] i2c: fsi: Convert to fsi bus probe mechanism
Date: Tue,  9 Dec 2025 12:40:36 +0100
Message-ID:  <d8c27aed45bf3119c08c9772768d675ae2ccc0c3.1765279318.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765279318.git.u.kleine-koenig@baylibre.com>
References: <cover.1765279318.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1975; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=5HX3OW285ekofJr+ZMAtH3Qgn6AjwhMDtCWinCjqMKk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpOArStEL5Ys2R2thb6Z/34Sl59kUwOR6aGpFPS ZCbRTq8ETqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTgK0gAKCRCPgPtYfRL+ Tvf0B/92vabNFUU6s1pdd/h9ixnoGht1iEP8dpZA3iUTxQVwQ1HSizaycKJdQ8uF6xKNCjVH+yg ZURYCCI3ni8m5mLq6G56KkKc+hZQKgfCANtjXOZT9kUzVe0SrOVl6F0bJt/E5YPOq3/Cs0mPQLd pzOH8RgvinIylj8TXpA0bZkFiGRSTKUYyhg8pUGvIW7o1hzc3JvlX1fyygBjM8eJENvw+XAJ828 FH0rpp4dxaY7CzJ/PUEoBudHXnWxfEM2UW9muqHSu/KV5ksn5eLYl+hE4gogRhYzLAv+2lEeQp2 RKtHM62FUtNwhkVZbNr5cvI5Uz6NpQVkU4gV5/hTHJiFxvOb
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The fsi bus got a dedicated probe function. Make use of that. This fixes
a runtime warning about the driver needing to be converted to the bus
probe method.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-fsi.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index e98dd5dcac0f..3a7e577e6eac 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -674,8 +674,9 @@ static struct device_node *fsi_i2c_find_port_of_node(struct device_node *fsi,
 	return NULL;
 }
 
-static int fsi_i2c_probe(struct device *dev)
+static int fsi_i2c_probe(struct fsi_device *fsi_dev)
 {
+	struct device *dev = &fsi_dev->dev;
 	struct fsi_i2c_ctrl *i2c;
 	struct fsi_i2c_port *port;
 	struct device_node *np;
@@ -735,14 +736,14 @@ static int fsi_i2c_probe(struct device *dev)
 		list_add(&port->list, &i2c->ports);
 	}
 
-	dev_set_drvdata(dev, i2c);
+	fsi_set_drvdata(fsi_dev, i2c);
 
 	return 0;
 }
 
-static int fsi_i2c_remove(struct device *dev)
+static void fsi_i2c_remove(struct fsi_device *fsi_dev)
 {
-	struct fsi_i2c_ctrl *i2c = dev_get_drvdata(dev);
+	struct fsi_i2c_ctrl *i2c = fsi_get_drvdata(fsi_dev);
 	struct fsi_i2c_port *port, *tmp;
 
 	list_for_each_entry_safe(port, tmp, &i2c->ports, list) {
@@ -750,8 +751,6 @@ static int fsi_i2c_remove(struct device *dev)
 		i2c_del_adapter(&port->adapter);
 		kfree(port);
 	}
-
-	return 0;
 }
 
 static const struct fsi_device_id fsi_i2c_ids[] = {
@@ -761,10 +760,10 @@ static const struct fsi_device_id fsi_i2c_ids[] = {
 
 static struct fsi_driver fsi_i2c_driver = {
 	.id_table = fsi_i2c_ids,
+	.probe = fsi_i2c_probe,
+	.remove = fsi_i2c_remove,
 	.drv = {
 		.name = "i2c-fsi",
-		.probe = fsi_i2c_probe,
-		.remove = fsi_i2c_remove,
 	},
 };
 
-- 
2.47.3


