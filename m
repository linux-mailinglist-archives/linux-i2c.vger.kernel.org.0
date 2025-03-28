Return-Path: <linux-i2c+bounces-10062-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53735A750D2
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Mar 2025 20:33:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54D28189087F
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Mar 2025 19:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A95031E1DED;
	Fri, 28 Mar 2025 19:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="byxXT6+Z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D5C35972;
	Fri, 28 Mar 2025 19:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743190385; cv=none; b=J5n3sK3yatePf3n/fW5V84Q5PB+qX3XmU4e0/nCD5suD0xFMkYE8IgKLx/OAciRMQyP/ngnDuFcndb1kStlZK17x3pNfD/LEox+wIFtJiCbxSbZohgU+6KAuGJ5mVmcC1/hoQhhqn7f1JY0hULKLKdiK2De/v1VXUc9dDOoPBvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743190385; c=relaxed/simple;
	bh=sezMGADMbesTGuGXfIbnNncPeM4zIsAZQfZWIjOPu6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C9LbNqE82rd0IBKw8BbusgVd73+d+MMwuZMBX15p1gePjNBzivny6RGTo5+EE8eN6wC2qtV+G4gTOvj/x3tMKibgdHxqGsx9ifwUu6pOkEmEtFCKUl1rTFdzSi1YekcYBmGG4Bu6mGo/jTLhtKZysXt8QmuZ6fOHbF/3uDaiusI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=byxXT6+Z; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2279915e06eso57734075ad.1;
        Fri, 28 Mar 2025 12:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743190383; x=1743795183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmzzK5wrB1TwLnmdvaDnS9IoMKPVneQIzyzg2Urwedk=;
        b=byxXT6+ZJzGrpaRZeM2lOKvL+2IMlNJ+FwvKeGw9l+R+ruvZqD7uxDw5lYmWEsmVhn
         pvdEY7yOauyUlNc7SBQzIgeWhWL4iXYw8lyZnymsIsnKLjvS1uQYDAL9/TdXV6JF16a6
         eycV1/RokmCKO4t5w67qZeFGgoufvsRWVlMyL6AjNuyXDpCwCoKl9uxrLmmU3lNI4lib
         5CEc/xC8Qhf9mGNTTO236e3mUrHQUDDslBVWVRJnDvr/4dMV9JXCQNb21ukI4gUyPX/I
         r+WqxgIAk6lciiItCuF8la1pPwpBR99ksYcIqcwVqz0zw61pukkbmrZ41S+Q5lnvfoCV
         8gvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743190383; x=1743795183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wmzzK5wrB1TwLnmdvaDnS9IoMKPVneQIzyzg2Urwedk=;
        b=XzZ09Ei7hBEDkeQzpI9J3xdVHnJwhRnti0T4hDOZo7GbjUaByn0WJX0iUu2pk8z9ar
         +Y4FlCQslYApbwKfx7NfJuXfIX/VQtvhWRbZHncRFc90QSxj9yS0aGYMrmIyJwR6K03r
         l5kEvqJthEGm8w7nJ//KmfJuILY2wPThX8oiL9Xq3u7/OKTQcaxMezu/yWQcdWjaeC4g
         /WB6BaILmM5iLA9ORH+pIk50j2qa4ilQmBr+FTBLGk0oBONa4WgWHSc06KFU0KFk8eiG
         pvTKMgfTNoEUWhxpN7xrxSfMgZCjoQS49oeZKCjJZJ8QuzLZl4x4NxItCLMP2PcKY7fN
         Rz0g==
X-Forwarded-Encrypted: i=1; AJvYcCWPps9aO8yQvyCnNR2Gc6nVaOnCoUyD+nVCcDyX0IQcecrw31cW9eRCExAgnnX4MznRtmW+Vqj4W6ym1Zy3@vger.kernel.org, AJvYcCXkix8iv8LWxtg6EeKKKFnHHouJXPwRtqAQccnXGoZ9jMaVD4EEtDos7Lh0NG3tl3NBQ15J8/eSD18=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8BkYLg1Ci9C1kPKo9zALXYCVARGOQFdGYjuH+8x+Nd32zDLii
	9bCuiuGvqLD6BExi10ZAWo+5lXaQBV+ZvBSAwRYTwHqnxJY1nso4bYaU10g2
X-Gm-Gg: ASbGncs7N3gFXw6PoAWM6FU12ureZSU8X9APbzWiZueg/SRP8BqZRPPFpparxO6In9z
	cv8c57Ew7MGMshZ9Qfq3bfRrTZyzFV+sSotqNYWLEb0ipNHg37ZqLXF4aP9Du5fDubQnx7bXf8y
	Uu5KmIdW6Z1DBk/jyS848BZhcE19l3MCkHGB7Peg8s5k7blwCO7/f70XHq33zNSlB72tIcATRTw
	x41ZlENCv8N821sIXbV13JSkdqKZAQasv3eVAxZbY6yvEq6C3c1J12q+2y+bNIzsPDGpZvSVnZI
	gQIglgbiQbJeafUoeFEUSPBYKXpg+hTRXkMhTPKRak5CwJL68xSKLfZD9xB2SKY1pqYmZ4q/SUW
	gPnmr2MnCvHBOWiILvdrxKKit2LE4au3vUetc3CCf4Q==
X-Google-Smtp-Source: AGHT+IEAwgqjiuXz9FuLi799X51Qq+5hLQo/k1P1Mp5I5BJ5OT75oDBzsl1hH9SjLgr3KKLNdley9Q==
X-Received: by 2002:a05:6a00:18aa:b0:736:3c77:31fd with SMTP id d2e1a72fcca58-73980473887mr498675b3a.23.1743190383020;
        Fri, 28 Mar 2025 12:33:03 -0700 (PDT)
Received: from elbadrym.c.googlers.com.com (34.125.168.34.bc.googleusercontent.com. [34.168.125.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739710da6b9sm2258882b3a.174.2025.03.28.12.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 12:33:02 -0700 (PDT)
From: mohammed.0.elbadry@gmail.com
To: 
Cc: Tali Perry <tali.perry1@gmail.com>,
	Mohammed Elbadry <mohammed.0.elbadry@gmail.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	openbmc@lists.ozlabs.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] i2c: npcm: Add clock toggle recovery
Date: Fri, 28 Mar 2025 19:32:50 +0000
Message-ID: <20250328193252.1570811-1-mohammed.0.elbadry@gmail.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
In-Reply-To: <20250327193816.670658-1-mohammed.0.elbadry@gmail.com>
References: <20250327193816.670658-1-mohammed.0.elbadry@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tali Perry <tali.perry1@gmail.com>

During init of the bus, the module checks that the bus is idle.
If one of the lines are stuck try to recover them first before failing.
Sometimes SDA and SCL are low if improper reset occurs (e.g., reboot).

Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 2fe68615942e..caf9aa1e6319 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -1967,10 +1967,14 @@ static int npcm_i2c_init_module(struct npcm_i2c *bus, enum i2c_mode mode,
 
 	/* Check HW is OK: SDA and SCL should be high at this point. */
 	if ((npcm_i2c_get_SDA(&bus->adap) == 0) || (npcm_i2c_get_SCL(&bus->adap) == 0)) {
-		dev_err(bus->dev, "I2C%d init fail: lines are low\n", bus->num);
-		dev_err(bus->dev, "SDA=%d SCL=%d\n", npcm_i2c_get_SDA(&bus->adap),
-			npcm_i2c_get_SCL(&bus->adap));
-		return -ENXIO;
+		dev_warn(bus->dev, " I2C%d SDA=%d SCL=%d, attempting to recover\n", bus->num,
+				 npcm_i2c_get_SDA(&bus->adap), npcm_i2c_get_SCL(&bus->adap));
+		if (npcm_i2c_recovery_tgclk(&bus->adap)) {
+			dev_err(bus->dev, "I2C%d init fail: SDA=%d SCL=%d\n",
+				bus->num, npcm_i2c_get_SDA(&bus->adap),
+				npcm_i2c_get_SCL(&bus->adap));
+			return -ENXIO;
+		}
 	}
 
 	npcm_i2c_int_enable(bus, true);
-- 
2.49.0.472.ge94155a9ec-goog


