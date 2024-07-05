Return-Path: <linux-i2c+bounces-4666-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CC857928D4B
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2024 20:06:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3093FB21433
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2024 18:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A2514A62F;
	Fri,  5 Jul 2024 18:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D1QdsoZl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7071B963;
	Fri,  5 Jul 2024 18:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720202791; cv=none; b=suB4oxr/ZWHRHDcN+z1dL4l8DU/iY7XQTSwezEm90qr+Ua2VyQcnjzxdM0kfWRQI01MQ7QLICkhT/ALBHtJ7mIjoLKeNd6Qx+Vau/3Ui9Y1Ci2QfMISNmJn/lPKcS/HJqeqQ907iBUZB1py1piB8Fx826L9jOyOZfqWFH7U7Z5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720202791; c=relaxed/simple;
	bh=S42tmQAfsWpBuBgVlpigJEKMpxvlDGgN7ZeqHMnQRNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UwM8XFV6XNF/WKN1cWmW8N0TC9GyfNftWrihLlKoe2NDsIwU5lBG50n/OyRWZrIYKAEENAoaxpDq/UzKZsxP0RcpINaz4gFkP632pB+Gw2b/lCCei+OoxXLiAOOnEERnSJ97EldYeD1B1cuTCFyANZfGqo5N9zpJzXuzN7yXYvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D1QdsoZl; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42567ddf099so13055975e9.3;
        Fri, 05 Jul 2024 11:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720202788; x=1720807588; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ka4a536LSADJMceJfJvpco1a/Lo++oGKUYho3/0+38k=;
        b=D1QdsoZlx39PcWIKA5y+oEOCUH8L34zIephDxvy7VOKU+mFaFzXjV90J1ualjrzsha
         xoFYRZteqjacaB7a+L+OOmZdhQGZM9UFXH+w9/ITqkj6yj+u0QyDr8FWgVSTmhiYbQhY
         jIczdVRyjjH53FQ0Rhc0u8dBYA5T5LlEGWPgALI5EuUVezR8THmLXWNwwHmEULZsHURB
         Dacg+083VPhBrdb0Zs6PZKBAA03Cc0LaCKMeLv+xHqBYQu5tkl2ppojnZCz7J/cV0x69
         dk09noWdaCNRln2sucGwYyKwKx2voZutUanoEl0sZQwhXSzq3ncfR+uAnIpEi9gL8QGV
         ecCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720202788; x=1720807588;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ka4a536LSADJMceJfJvpco1a/Lo++oGKUYho3/0+38k=;
        b=Lo3zMkyL73uvc88Y44rA12VbgXMP9hDaOUzRG4nVOrkxz5gV8FzxRH2gq/DvhhA4Xe
         nYcCDxACfsggZOPb6xriVmO6UMJ4W7CTl80akaXdDIBaJg3jTV5YYkabBfcEbNVh4yvq
         P99qFgrVi2RBobOmmVISElJxMD+DuYfUn59Oi14kSMlDiLRJN9T/lAWtDBo86+DBsV64
         eFY0YCM/CFGwR5bGiDRzj3j9Rg5GXB1KUI40kCJ23TFbScf7JcK9F41QYeqY56UmYK6L
         FvXlhUjsl4kvxBw8YDA9lI24LOS3uytgHSk/DVhO4OAfil4OrPD3nPVaxOl/GY9v/bqG
         fxiA==
X-Forwarded-Encrypted: i=1; AJvYcCX6TNpP5eBoNKWBY6EQkKUfM1/+LqYmiBP6KAmF7c093HNNJ/dCM0cYIaJpgIzHeLbEFKYenslZvZhcKkBYrJhgPDonasdZ2UXA1hmz
X-Gm-Message-State: AOJu0YwlLHs377ooBnRX4KLxn7q0nCxKv5oZHkR4SEHIHJ/U0QPDGd84
	IQ6xllrFb2i3z5AJM0knP9MnNzypi6/pchUFAgsG5Cw2LmQaFc9z
X-Google-Smtp-Source: AGHT+IGYE4H44Y+75PoJJVK24dXPFWlZRlmubvUmZgbi4bJEVh2/Vv9TJrxzG1JhoT+SkUQVScA9oQ==
X-Received: by 2002:a05:600c:5788:b0:426:5cee:4abc with SMTP id 5b1f17b1804b1-4265cee4afamr6061275e9.20.1720202788040;
        Fri, 05 Jul 2024 11:06:28 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-4adb-3312-ca75-bf55.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:4adb:3312:ca75:bf55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a28d3dasm71533715e9.46.2024.07.05.11.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 11:06:27 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 05 Jul 2024 20:06:25 +0200
Subject: [PATCH] i2c: designware: Constify read-only struct regmap_config
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-i2c-designware-platdrv-const-regmap_config-v1-1-8c82cc63df15@gmail.com>
X-B4-Tracking: v=1; b=H4sIACA2iGYC/x3N0QrCMAxA0V8ZeTZQO8vAXxGR2KY1oF1JxiaM/
 bvFx/Ny7w7GKmxwHXZQXsVkrh3n0wDxRbUwSuoG7/zFTS6g+IiJTUrdSBnbm5akK8a52oLK5UP
 t0ZGlYHjGiWgMefQOerApZ/n+Z7f7cfwAshpl2XwAAAA=
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720202787; l=1065;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=S42tmQAfsWpBuBgVlpigJEKMpxvlDGgN7ZeqHMnQRNQ=;
 b=toALZGLNxZb7QYzJ/lnsL22UjXQKAyalvcd9KJAJfIX4qo5NryY3e1QBzvLqyG8o9DOu+SwpM
 WbyL2fL3G+gBQ/vvxkIsOUDZ/+r3BrEHrMMe7Zpy3rCoJ0KMINymX7v
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`bt1_i2c_cfg` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 29aac9c87368..df3dc1e8093e 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -101,7 +101,7 @@ static int bt1_i2c_write(void *context, unsigned int reg, unsigned int val)
 		BT1_I2C_CTL_GO | BT1_I2C_CTL_WR | (reg & BT1_I2C_CTL_ADDR_MASK));
 }
 
-static struct regmap_config bt1_i2c_cfg = {
+static const struct regmap_config bt1_i2c_cfg = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,

---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240705-i2c-designware-platdrv-const-regmap_config-5bc7aa35f320

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


