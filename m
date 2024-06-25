Return-Path: <linux-i2c+bounces-4328-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2203B916148
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 10:32:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B654B2528E
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 08:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA2571494DB;
	Tue, 25 Jun 2024 08:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="WGDcD3KI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70309149012
	for <linux-i2c@vger.kernel.org>; Tue, 25 Jun 2024 08:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719304308; cv=none; b=UQ1ucVAf0qQvGxG5DbHTfHnXC9E4VbYGAMkK5SwpsvrkhAJUS0eh6fyhJdOJsfZz8fvfYpLtIJzQWgwD363lBEN3agiUxVGY/pHjnQrnHkreXbgdE8I7lzGRjJ4ob2I9JhU+w/UTcIB9djun10eyyQ6UrWWztxJFYwYvrjYHnIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719304308; c=relaxed/simple;
	bh=lrLRbMBs4g/TFFFM2moh61rGSsaflajyDGIrE5DqCJk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NyfVCLlCiZCHV/TIJhwbX7uDgB1OAN1vq7PttbkFI62fLjfBvOGQtsrdwON87oOgYs2sIKYW7P0Gfxn7GS1ZeFyFzAGGE2ekVX4RVV8PuMV8NjOUSLtnC70vrMR1p5xlm7i9a8yjDmLa2PfkzufM4xLTsLuhd4c8cknNmvgC5K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=WGDcD3KI; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57cc1c00ba6so6409631a12.1
        for <linux-i2c@vger.kernel.org>; Tue, 25 Jun 2024 01:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719304304; x=1719909104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uFYJNf0L6n19TFEdQD+HREaIK5KYaTd+k9Ktcnq76sw=;
        b=WGDcD3KI83cYihJgg0B4Cs2y4BINyf3fWGBs3BK6JZwAj79Ksq3cGO/vfhFm7i8ndR
         nzHKtuldOAV3PtfB99uY1CaeQtOre++Oity12amXZ2xtTc1WCMvPxa2HfmZY9oXqEREz
         bUFy5v9xYjkKsolxLTONY8FR2yEs9GqfL2gtXCOnmxCEI8KiBSMaVHbCe9p7c4BUi4gf
         dVCAuVAWba93GoUVMxoBtRwP7eg8ScJ4xmUJyfpPELoekK/4bMrQ1aFY4EJzcllWOuIH
         fsDuBgWD7RMnA1/AjBvIVeHYkeJ7Sc99FwhzJvUYOikm/Ek9a6+UJAd7fUPddp3oqZji
         47PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719304304; x=1719909104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uFYJNf0L6n19TFEdQD+HREaIK5KYaTd+k9Ktcnq76sw=;
        b=GJR+eLxomK7jTTazRF0RLDiAm11i6nTfwUQAeUJcdPZLiyv9NV+MqfMzH2p5+W7vfi
         XmWiIxsjEQ38dcAplQtVyAr2GHmlOuXBWPtAZvBm+pYylcauNe7eW8I2OzWmI+3+qpir
         x9mVtwFNTgjE5LldPIdNLmYmn/aRBxhMh6BmLCdiZ89zFBWpLauqgl3uf9ba3gEoH9qI
         fX9uMWJ83zBAeWGhcFbQsaD+vmD6Ka/LwrLUjD6sCKDV8nAh0PMMINzhPQNXNlXDa3Z+
         0DB9LVF30YZ04xwFUaWKQcF8CvYWOcmUlJY+Kmw7blXSQ8f+gg95qjF0qXAZIhdaGO6U
         fpIg==
X-Gm-Message-State: AOJu0YwI+xRolIW8CmkT0ufNdhfZSH55rvqG6YAKU0W9lvqS6BES23vB
	lGUrGO6LbHdN1r6+Bwf66bAVYNuyHZcfdyyPfGwt273KWI8BiPDduoNfW8rdc0w=
X-Google-Smtp-Source: AGHT+IHRVTmajcZYD53nyXyBOInSo9kEqttsFLCtHbwoAYmlW9zJi4niM5ilsYJn+Weimmc48Kj3zA==
X-Received: by 2002:a50:d698:0:b0:57d:15ee:3d18 with SMTP id 4fb4d7f45d1cf-57d4bd7731dmr4122632a12.20.1719304303585;
        Tue, 25 Jun 2024 01:31:43 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d303da3a1sm5604885a12.12.2024.06.25.01.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 01:31:43 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>
Cc: linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: Drop explicit initialization of struct i2c_device_id::driver_data to 0
Date: Tue, 25 Jun 2024 10:31:31 +0200
Message-ID: <20240625083131.2205302-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2394; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=lrLRbMBs4g/TFFFM2moh61rGSsaflajyDGIrE5DqCJk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmeoBkKAf/ZaY6caK48nILIQIiTrKM7TghneDD9 IY64l4m8kuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZnqAZAAKCRCPgPtYfRL+ TriMB/0WXelvfn7ht5Su8VI/cpnonl55tmGIbKMU9lfjClb8xK1H8tEvp8bdwHfBMkH1hxR6xcz GTIWM4b6GemdKur9VMv1n8lIhO7lrX2fQ+WPZeRfvP4c55Ek0R3MpuINWlT00YYliyNGriJEeNF fyThPrRcSOSFeVaHoAyrRmcVhF+37u5SvIX7o5Sm46OK2kubMDImwK6Objz+IbBGDFMpgfQkvFR 20dTwSDQn32mWJoDnLmlXHEoMLOdBywdsoKlxgr7+yVFKvSe4vqZSdCEgojxlWpvI7OSyedHqxO bfY98fUvzO71uZcChLRr6Vez6NZvPTxQPRN0X16QV6KkNZH3
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

These drivers don't use the driver_data member of struct i2c_device_id,
so don't explicitly initialize this member.

This prepares putting driver_data in an anonymous union which requires
either no initialization or named designators. But it's also a nice
cleanup on its own.

While add it, also remove a comma after the sentinel entry.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/i2c/i2c-core-base.c         | 4 ++--
 drivers/i2c/i2c-slave-testunit.c    | 2 +-
 drivers/i2c/i2c-smbus.c             | 2 +-
 drivers/i2c/muxes/i2c-mux-pca9541.c | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index db0d1ac82910..49fdcb3eb8f6 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1066,8 +1066,8 @@ EXPORT_SYMBOL(i2c_find_device_by_fwnode);
 
 
 static const struct i2c_device_id dummy_id[] = {
-	{ "dummy", 0 },
-	{ },
+	{ "dummy" },
+	{ }
 };
 
 static int dummy_probe(struct i2c_client *client)
diff --git a/drivers/i2c/i2c-slave-testunit.c b/drivers/i2c/i2c-slave-testunit.c
index a49642bbae4b..fd57b9bb2356 100644
--- a/drivers/i2c/i2c-slave-testunit.c
+++ b/drivers/i2c/i2c-slave-testunit.c
@@ -162,7 +162,7 @@ static void i2c_slave_testunit_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id i2c_slave_testunit_id[] = {
-	{ "slave-testunit", 0 },
+	{ "slave-testunit" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, i2c_slave_testunit_id);
diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
index f809f0ef2004..1cb137b9181d 100644
--- a/drivers/i2c/i2c-smbus.c
+++ b/drivers/i2c/i2c-smbus.c
@@ -160,7 +160,7 @@ static void smbalert_remove(struct i2c_client *ara)
 }
 
 static const struct i2c_device_id smbalert_ids[] = {
-	{ "smbus_alert", 0 },
+	{ "smbus_alert" },
 	{ /* LIST END */ }
 };
 MODULE_DEVICE_TABLE(i2c, smbalert_ids);
diff --git a/drivers/i2c/muxes/i2c-mux-pca9541.c b/drivers/i2c/muxes/i2c-mux-pca9541.c
index e28694d991fb..8663c8a7c269 100644
--- a/drivers/i2c/muxes/i2c-mux-pca9541.c
+++ b/drivers/i2c/muxes/i2c-mux-pca9541.c
@@ -78,7 +78,7 @@ struct pca9541 {
 };
 
 static const struct i2c_device_id pca9541_id[] = {
-	{"pca9541", 0},
+	{ "pca9541" },
 	{}
 };
 

base-commit: 62c97045b8f720c2eac807a5f38e26c9ed512371
-- 
2.43.0


