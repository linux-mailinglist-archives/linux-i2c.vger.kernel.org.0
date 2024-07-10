Return-Path: <linux-i2c+bounces-4832-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F7892CD1E
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 10:36:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77A222845FF
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 08:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAC3413C3D5;
	Wed, 10 Jul 2024 08:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="C3pOQdlM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF5C12C81D
	for <linux-i2c@vger.kernel.org>; Wed, 10 Jul 2024 08:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720600564; cv=none; b=jt1ab7wtkpxMJClCOFWz8KRA8NnEocoKCwbr46mSrew2pLovu77HzDpMC//oV9PKVuplh1Eag6X+6edwrXHsR62cjZpEwOicrOLT52H+9msh4KKMGMwNvOH/en5QbKswYn59mXF1CXAle8lYi7inQd7JbbM3ToUcCs5sCbFBgfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720600564; c=relaxed/simple;
	bh=qTQ3UWIZkYcA9uMA+grXZJkdzTrMK9+HUUH/Sy4ciJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gLJwAbNoWQR/Y0IYeCsN52rBcwMNI14iD3ccOBXSmhiGhYzUexE2VmhcYTAJFGyZMs/HdIfjFtxtzLCoXojYRH+qHBc+t+rDV8l/v0H+LwUKXCYt67NEMm8zk3UODxCo99YZA2Thvf/ywcsZ+yfYqWb927EVIeu9J67N64tdlbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=C3pOQdlM; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-58ef19aa6b3so3425195a12.1
        for <linux-i2c@vger.kernel.org>; Wed, 10 Jul 2024 01:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720600561; x=1721205361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+LuniVT5zVpACFSlfXMmMucxSXmhbUp2skok1yx31w=;
        b=C3pOQdlMolJl/U0/DnXQ4w20n6I/7jWaWej5m4XszHxx9oPRky3MvyCTFlEMQwLMaE
         85lEBX5hRsJzdxAzeRSmUkz+Ob71/pYbxJ1B0IJJBFKvKrXUamGNA2URYUDvcKVdd5ww
         vqupoYb7WMvjCf44259UFEmTM3htuE/ga1JOmVXL200/notmQHCxD4dG0TSy4IDJ/ivF
         q2Qsrkgi5l9l6nUGgYPE4TTE4fExRaptrYsS4ox0L7asnSnE8HGMNRrQGpbqcQVbHvyW
         VlMsthKh24PUFxO6Ze2og1YoijEXOHXwaffBYMsXG2UsvUUZ45py3mLXoUzcyMQP7d1o
         Q+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720600561; x=1721205361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u+LuniVT5zVpACFSlfXMmMucxSXmhbUp2skok1yx31w=;
        b=UTfoGhy2YqeCUaRmwNacMuQ2TsOUFPMCd2dly4MjuLxVmpUyvlOpo0zDjBlUpB+wLx
         IFlbWn2M6VNKJ/TkqMm/DyLtTroha4GU8kHY0Ign5OXhI9qDduusmNUiKi/650lW7/zU
         oV+RqOE8TVeqISZty4+4bLK0MTJXiBiUbl9r1a9xp7L6Sl22faCmd5x9jvPfRxKhFxOr
         EFhsguhkjyHwlZdHlWp/dD5L+mQeDJ2vj3BYsiGetEZmepKBhQ0cLRJD0ON/0P2fweeH
         U2E8CfQNf5d89wqoUvspkySXlwEmq40kLKm8VdJkk4nM1tLrO88aBha+O2eAfbFpGm5e
         X0HQ==
X-Gm-Message-State: AOJu0YxCIQj9jx+QXkgKHME0zYvfQjAjUD7dmLwFrVhFt3pirfd+xbOd
	tLFgHcyuhZG2YHMGE1fCl0L6zfK8zsWM/SoAeUMT9pk+jHB6cTmY9cOhRYnEMUeDI2XKbJB0V5Z
	4
X-Google-Smtp-Source: AGHT+IG1/g6VKJsqOdFLGbUabCQ4yZ7xC9SaPhJNdEZyyY2wp1Ue1izNQNKphBJMtdMgoZIJdz00KQ==
X-Received: by 2002:aa7:ce1a:0:b0:57c:5f77:1136 with SMTP id 4fb4d7f45d1cf-594bb7745f7mr3895404a12.24.1720600560707;
        Wed, 10 Jul 2024 01:36:00 -0700 (PDT)
Received: from localhost (p50915eb1.dip0.t-ipconnect.de. [80.145.94.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-594bd459ddasm1952203a12.64.2024.07.10.01.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 01:36:00 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-i2c@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH 1/2] hwmon: (pmbus/ltc4286) Improve device matching
Date: Wed, 10 Jul 2024 10:35:44 +0200
Message-ID:  <cf49bf8b0ba4e50e71e0b31471748b50d7b1a055.1720600141.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1720600141.git.u.kleine-koenig@baylibre.com>
References: <cover.1720600141.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1462; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=qTQ3UWIZkYcA9uMA+grXZJkdzTrMK9+HUUH/Sy4ciJ8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmjkfi+nnx52u5YMCmVnj130/0fj61p6tB5bVeE HVTmgcRfJ+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZo5H4gAKCRCPgPtYfRL+ TthUB/4xxPXTVmB5CkcLl7vWDDtpthBfp7tYx49xfv8vt3aH8AhPHqP6+P7rbsDhpetpWnoc0nE ECcEjoW4BRJ2H8L5RWTDbXB/s5SxHTzSVivh+MhJ5cfykyQVOus1+LG9Rjk0lNH63LNcWxTrdWi Adl4SE/hPBlmI4hkMqfi2smy8CSsfp6GTp+cQNshPOP2t5hmgucjEiLuCHK6TJeeTuEHD+M7SaI hHrD6vdp7ZX6fwlsvQbYy0TcRH/IvpAZQlhwwWD262k4ERcqsKfoadexeAXPpb2a76PdVcn7nBV uqzGIcem3jkbhhY7Yg2nL2JgscQ+ASph4TfgO2G/iTGsXpEL
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The devices supported by this driver report the model name in their
register space. The way this is evaluated allows longer strings than the
driver's model list. Document this behaviour in a code comment to lessen
the surprise for the next reader.

Additionally emit the reported model name in case of a mismatch.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/hwmon/pmbus/ltc4286.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/ltc4286.c b/drivers/hwmon/pmbus/ltc4286.c
index 9e7ceeb7e789..2e5532300eff 100644
--- a/drivers/hwmon/pmbus/ltc4286.c
+++ b/drivers/hwmon/pmbus/ltc4286.c
@@ -95,13 +95,19 @@ static int ltc4286_probe(struct i2c_client *client)
 				     "Failed to read manufacturer model\n");
 	}
 
-	for (mid = ltc4286_id; mid->name[0]; mid++) {
+	for (mid = ltc4286_id; mid->name[0]; mid++)
+		/*
+		 * Note that by limiting the comparison to strlen(mid->name)
+		 * chars, the device reporting "lTc4286chocolade" is accepted,
+		 * too.
+		 */
 		if (!strncasecmp(mid->name, block_buffer, strlen(mid->name)))
 			break;
-	}
+
 	if (!mid->name[0])
 		return dev_err_probe(&client->dev, -ENODEV,
-				     "Unsupported device\n");
+				     "Unsupported device (reported: \"%*pE\")\n",
+				     ret, block_buffer);
 
 	if (of_property_read_u32(client->dev.of_node,
 				 "shunt-resistor-micro-ohms", &rsense))
-- 
2.43.0


