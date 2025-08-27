Return-Path: <linux-i2c+bounces-12444-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C51B37F87
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Aug 2025 12:11:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03E6C1B26AA0
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Aug 2025 10:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 391E934A30B;
	Wed, 27 Aug 2025 10:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qwkqNK0C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D21346A07
	for <linux-i2c@vger.kernel.org>; Wed, 27 Aug 2025 10:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756289451; cv=none; b=lxPDBbzT7v9I+NVtcAD5yvq0/2ZCiAwVbepJlPTckqsqiTysg/c4UR6kHQBvHSTVTEG32qLsOTqRd+U8nvX87atdP7GPeMHCV4wGUfvePYy/Ag25IfMiBLJP6mhhnCWI7CGLUVUCIw0odwUUJffpmZ7UMfvvtplmG2qZauOBAAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756289451; c=relaxed/simple;
	bh=b5ipVQxirQj5gbkgpSFwLTpHWhEQ1wqtWZ0y9AiGGTs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eGWLh72hr5ixOprWltO3Wx/kR1FlaaXe+DaZ2MtuMWmEIzKevH3upuy3d23KP2pqxP3omwCvAvn20708NqoGLjVeYvO3oM92cRfv4nrfBcyisaS1/oAJUUdzuixOMsi3ZD9Gl4Gk0XV+L+b2JXbJ0CgJmCyxNOtXerT6odCcpNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qwkqNK0C; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45a1b004a31so50593395e9.0
        for <linux-i2c@vger.kernel.org>; Wed, 27 Aug 2025 03:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1756289447; x=1756894247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TixQBgvEKkMQhE5xKVPB13TcCphpl84uFDbTL0vLvUw=;
        b=qwkqNK0CGVHu5LJ6HmobzJPrLwyDepRPvHxGHEz+vZcNXz1ns4diuGwvwOAuGQuHLo
         V2B16wMdj6owhnmv8X/n2pWX4ro5fUfdNlzD8wmwR9+oO2Rpz9l6tXXFw/CD4SUY3N0c
         qeroIlNTUeWZklENJzTObL4izmjBkEc8SnBkCtMJTSPG+NkNp38DiyhXCgkbXOqKW9KI
         G/6HvSOtYoXZPkMT0Zt2d7P2YFi6tj8P/JCxGsHb//yQhtPTD9adY46UJaBjLLoZMf71
         pTpH62eMCYQa5TdA+E3SFWdYWtr+bWROI7gezktWL32VdN5qZdmlPB+nToYg7U3oYJlB
         rj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756289447; x=1756894247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TixQBgvEKkMQhE5xKVPB13TcCphpl84uFDbTL0vLvUw=;
        b=JvrJlpoQVWuS8RuQ3m7qlOU5oR0nf+LH/cbAaiNwbRyYB4xzUQMkQK9tkgPvdDtWed
         dZ951pAHWeOcaEtJOcjeoCSiehY+dh+r/851+Xc3QzeODWpV1X8JWbXiQf4mqBjwK6qv
         Zj6+RHNJMb35L6L9gyDfcx8XP7vgnL5DnSgLDZVSahRYMj2mBb9dbf8bImxDb4c3ycUg
         BRGAr57B91O8npjAlxS1FZWB3pAxAehslOpSOmWitiBAW1FJSKn0hYdYFPbLSt4IDHP8
         L6QK5Bt4HyassQAvEdNyW23PZfOMra5nAIOjJ5Nd4IxYYd7kIrfc/KcgVvK5yhwKn0yn
         OK5A==
X-Forwarded-Encrypted: i=1; AJvYcCVDXqpivc8hmMo0LscsVQ/OGRVfV1zuoRr3in9op7eQR79Na+e+0GNO2xsBm/lexLpkksf8Qum0DU8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNKk7jWFOmJam/BrDvQDvJazPFNZggintqns+dBL41wmxTyyYS
	NUHj5U75NtNokd/4yHd+J7vWAM4np1P7Qdby8YeFzi9j9HkjOMBbzpXHb4j4lXoMXO4=
X-Gm-Gg: ASbGncvJbiqIb759UAuVhxOul9FwWEwWdFwOorpR31EOZMxg/yGXAgw+lgEZLp5G74U
	LiSawx8ERG6r4Rv/izFmS4GL0KOQZFz7yhcjAHgCq5vo+WJzadWHpBgi4Xg2POYnMDrTF6gpGs5
	p/Hrk3ftURJN9RV36AiXWe//aCngr9Fh21yPe87KJvVrBTJvd0CVGemcAwHqcwOiRKqFkHja4iV
	dEa7B7ZWndf4Ub7jEONazO5C/wVJZIgDQL0TMFTOOdkXbnLoiKNiREXV4saNTgopxf2QrPmDq52
	vcs9QrCNxPtaM9RfJPRoxZ8EigB71ZPPIKHoVRZgHt/Qndii6CCqHZyaEXW8mV4DB8Svu3wp/U0
	m9G2ICyeA5J6iabsW0eeaIGxUjKsoK6q787pUu19eNgLyBGSOytllwRV8FEvcgKsKWsiIesDw9U
	lCYh6oD/aVTNJH4mGk
X-Google-Smtp-Source: AGHT+IETY/no0Ga/lWTRqVqc1LC0xGTolfQ/830wBvuN1CYFKv7YIKqdD72VfxqDZ91vijfk3xVUFA==
X-Received: by 2002:a05:600c:4f09:b0:45b:6163:c031 with SMTP id 5b1f17b1804b1-45b627826c3mr94650675e9.24.1756289447382;
        Wed, 27 Aug 2025 03:10:47 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6103:4200:a5a4:15e6:5b6a:a96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f2ebc62sm24589465e9.24.2025.08.27.03.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 03:10:46 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wsa+renesas@sang-engineering.com,
	ulf.hansson@linaro.org,
	rafael@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH] i2c: core: Drop dev_pm_domain_detach() call
Date: Wed, 27 Aug 2025 13:10:42 +0300
Message-ID: <20250827101042.927030-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Starting with commit f99508074e78 ("PM: domains: Detach on
device_unbind_cleanup()"), there is no longer a need to call
dev_pm_domain_detach() in the bus remove function. The
device_unbind_cleanup() function now handles this to avoid
invoking devres cleanup handlers while the PM domain is
powered off, which could otherwise lead to failures as
described in the above-mentioned commit.

Drop the explicit dev_pm_domain_detach() call and rely instead
on the flags passed to dev_pm_domain_attach() to power off the
domain.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/i2c/i2c-core-base.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index ecca8c006b02..ae7e9c8b65a6 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -573,7 +573,8 @@ static int i2c_device_probe(struct device *dev)
 		goto err_clear_wakeup_irq;
 
 	do_power_on = !i2c_acpi_waive_d0_probe(dev);
-	status = dev_pm_domain_attach(&client->dev, do_power_on ? PD_FLAG_ATTACH_POWER_ON : 0);
+	status = dev_pm_domain_attach(&client->dev, PD_FLAG_DETACH_POWER_OFF |
+				      (do_power_on ? PD_FLAG_ATTACH_POWER_ON : 0));
 	if (status)
 		goto err_clear_wakeup_irq;
 
@@ -581,7 +582,7 @@ static int i2c_device_probe(struct device *dev)
 						    GFP_KERNEL);
 	if (!client->devres_group_id) {
 		status = -ENOMEM;
-		goto err_detach_pm_domain;
+		goto err_clear_wakeup_irq;
 	}
 
 	client->debugfs = debugfs_create_dir(dev_name(&client->dev),
@@ -608,8 +609,6 @@ static int i2c_device_probe(struct device *dev)
 err_release_driver_resources:
 	debugfs_remove_recursive(client->debugfs);
 	devres_release_group(&client->dev, client->devres_group_id);
-err_detach_pm_domain:
-	dev_pm_domain_detach(&client->dev, do_power_on);
 err_clear_wakeup_irq:
 	dev_pm_clear_wake_irq(&client->dev);
 	device_init_wakeup(&client->dev, false);
@@ -636,8 +635,6 @@ static void i2c_device_remove(struct device *dev)
 
 	devres_release_group(&client->dev, client->devres_group_id);
 
-	dev_pm_domain_detach(&client->dev, true);
-
 	dev_pm_clear_wake_irq(&client->dev);
 	device_init_wakeup(&client->dev, false);
 
-- 
2.43.0


