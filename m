Return-Path: <linux-i2c+bounces-10034-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF768A718E3
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 15:42:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35E333B9064
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 14:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9691F1F754E;
	Wed, 26 Mar 2025 14:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YJ8yihbh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEE31F543F;
	Wed, 26 Mar 2025 14:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743000009; cv=none; b=S4Kmj2c7Rh3x3GxsA2THA9zRDqyanOL8GInj+bvXCxX6D0BO9Lp5B7UNJiKJ104meWsR0pXVyGhZcnGTspleLDkNWqjdA5UamRM51fj+Yea215gFcp0OUgGV3Ld7dBDEnQmWl+q1L4QxrnvS2FKhEU0apIB92Yj3QqRaeguHyxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743000009; c=relaxed/simple;
	bh=Im/ujHBZDbDagi4RGHUSi6sQR6/F1nq9HzO7V8ZfdGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rjaWl6+wOMhqK756IoBts7AC9Xm1cqK1ocNigI3NPgh3OwMVUY4gvULnd+wnbLyhk3Rqj7nDZhJfOEU/zopjJ25rCy89iAgLUMsP3ZgM6qQM2l/S11O8Eg1Cooc/hyucutf/VIgj7Ux1ppoGOHCB8qBpUrSzBW0RcDQzaSUqSVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YJ8yihbh; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30c2d427194so71125921fa.0;
        Wed, 26 Mar 2025 07:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743000005; x=1743604805; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6EuDjXKidQBl0tqYxtEZ2ruC/3IuVI6jN86tCBBzL/s=;
        b=YJ8yihbhK17QH+DR3Xx0l8wqv0so3t9d1+1YDtX6RX6l/GYNq0CmvoVWNoC0TMA5nZ
         h4+gBH8J0IoUiE6gTlkf41ZXH3TTTTjnyGloiqKXoeNbErtS22l2hsiO60eHZBjg2GEA
         jQ9SUGBc6BEMei79oRpz0vHQtZUKXl8kgBTuc2wgTOpkBviiTMfuTktOAJj8TZNYsnxr
         Z7m4txpKe4/7s3ckh820ugLjwU8ftfqP8RVhyXx8dJ5/IauDAMqULoIxBQkftEFeLKcg
         PYQimfGkaJQRv1ytnx7Xv3U4lG8uBuXoe33BKrK5YehupZhoHg9Iyvzl6DUjAQlHs+yl
         5VPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743000005; x=1743604805;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6EuDjXKidQBl0tqYxtEZ2ruC/3IuVI6jN86tCBBzL/s=;
        b=kIrpqW0RGxV7GonQpQPjjiKfpmqi3VKB4+INPRwniCcRwWy0OzwybUD4NiQpCaW21/
         nbYtGGCZifXkqDbsAipLJ3zKlq9xI2nQ59UdTV+IFl7PUc+TgSk3298cX4YMf3IeYuF1
         fVVLdYunOZsQBg2EUXKkmHuiaNDSMV42u5rpdmjMUlRx+wAl8nDwpHa279n+9ZEbKlBS
         hub3ppYKO0pP4U1RT7UEhAsOvxPDWSqJxMkVwhuY8DOw6czmIHB/Q98WQH7vgk2SUeim
         NZotbFC1tcg8wVmBn3jtOykHO5iWX40AKIFsj+6AdeXcUlORgLYrWB5zabQDObUrsI24
         JQ9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVCvd57792gg5Hau+GNjgdT23atzFFPd3rjUn7e/Hzrm8CtV3T2AdvYonAJlmj5pSX0XoQm42vCIsVzcx3l@vger.kernel.org, AJvYcCVaA62SZPYRDU3i17fwlGvffBmSBAo9j7Q2VYf+lfkTA1wAwbm2KJ9yWSV/M8M67li3s7L1QgwdpUA=@vger.kernel.org
X-Gm-Message-State: AOJu0YytUDSnVKplRJPtQGikUgatP/T2Fri34VzzJeTbrstpvtBNSsnG
	IAj+ndK9ZLIvmObyYtFyZ2FPp463eX281IZAD6G+ZnQTQesVmNlQ8MnRtmxjdHs=
X-Gm-Gg: ASbGncu8f8wj3CilacpxdyydeT58+bEEQPMNarkmfBFR7buxOzT5+ZwuCMBhlNHiPpw
	8KkBoQkU5J9rl+6RZYwv5b+Lm9mcvy1j82SMeUBA0Odqk6iD7ZSKT8RoquIn9kvFSN0hY/rCO9V
	z6F+tpxCu48ukFUCJIrki6K/QAYSy2A9lHstXNWBySFO850lUeZQ72P6KN+lp3smnia3/B/POut
	Lt8HT139znwrtr9K8BG3tX1WN8njMbn7UiNJ4bA1Ih8vpUDb4wPabqS1YbIOhV8e3Vm+8M6JYsy
	MLknN4o15Y6twlTh9V8tapf2rjWYElLw6Nx0KCmZMjnqM07EM+vgDq3wTrCPktJJ9SunDPMd9gs
	zUuUAdXmwM23O/27ngcWgG/o=
X-Google-Smtp-Source: AGHT+IGGn5bSE4gjHMGAHWfQJJacrQvAex99kJygteLoNoccgFY1I0pKwaSx1wgBttcnB2NtTW5XBQ==
X-Received: by 2002:a05:651c:c9:b0:30b:ef98:4653 with SMTP id 38308e7fff4ca-30dc5f50f0fmr19151fa.36.1743000004960;
        Wed, 26 Mar 2025 07:40:04 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d7e05f8sm21595771fa.32.2025.03.26.07.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:40:04 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 26 Mar 2025 15:39:47 +0100
Subject: [PATCH] i2c: davinci: add I2C_FUNC_PROTOCOL_MANGLING to feature
 list
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-i2c-v1-1-82409ebe9f2b@gmail.com>
X-B4-Tracking: v=1; b=H4sIALIR5GcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYyMz3UyjZF1TUzPDpDQLU+M0ixQloMqCotS0zAqwKdGxtbUA+hD6FVU
 AAAA=
X-Change-ID: 20250326-i2c-5561bf853f8d
To: Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1325;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=Im/ujHBZDbDagi4RGHUSi6sQR6/F1nq9HzO7V8ZfdGk=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn5BG9NAOxehASk4e1pFtaO3cbQpTn2CrmEBGM2
 YmGZqjRpYmJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ+QRvQAKCRCIgE5vWV1S
 MpMqD/0ZBxXUzH+XujR8gYWy6eMIbJDaF2Aov8H/slrc+vlPbqozidmexoUC7AoEB4s9tdotYmx
 hF2ko8DQXK4XFcyqI37/JoB+OEb+cce00U0sHGA3jJypk4Dj5KkwL4IgAKkuObZ9YmiX0xZ3F1H
 tSOgVQNmhI88KbUNV57wDPmMr2z8KYHK+D/7pi56iCRVr4VvCS84tyBcN8gZSAi3ayYObAkgTx1
 M7gG60WyPOZmobjQPacpz+lFslnBHj5UExruDrGvPTffQQZsc3wykz5zutpLVrqlbbrV/XfybmC
 KWzxI9dFp9Zb+nTiMT+ge3qbwYbvU5Lh5urpn0ImO2aUVdo1hvMqi5ezjnPEBA7y1WMU5vW/Dwy
 V0R8fYx5vPVhTmNSQDm9dega5t2AR2uO+bSq1cyowU5GWcrZ0nl/bdj4cuIQw68XCoHOWQjsXI/
 UqyrXLxz4773FZzS3kAEZaQbiOnJUcOcI7W89rjY9dXoKkdULqbuY91I0vKcCe5dHwLHixUm39m
 w+yMLA04IukrY6rNCXMhWwsR9qLbclRWpCKCTabz1U2eAgJZeHdD46UYu7yO9Na+46I2ulrC4gk
 vs10XGNbwEjp7/mxQ6zR22GSRa4qYcyGjWQ8BLRAUT/DzpZS6sziUQoFPwkAG7l/2LqPLzVk8bL
 kdabjV5sNdNojog==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

The driver do support I2C_M_IGNORE_NAK, so add
I2C_FUNC_PROTOCOL_MANGLING to the feature list.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
The driver do support I2C_M_IGNORE_NAK, so the
I2C_FUNC_PROTOCOL_MANGLING bit should be set.

I2C_M_IGNORE_NAK is the only supported "mangling-feature" though, but
other i2c bus drivers also seems to support only a subset of available
mangling-features, so I guess this is ok.
---
 drivers/i2c/busses/i2c-davinci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index 6a909d339681214ed4f382b62f8cd924f4295e69..6a3d4e9e07f45ecc228943e877cde1fd9d72e8cb 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -551,7 +551,8 @@ i2c_davinci_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 
 static u32 i2c_davinci_func(struct i2c_adapter *adap)
 {
-	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL |
+		I2C_FUNC_PROTOCOL_MANGLING;
 }
 
 static void terminate_read(struct davinci_i2c_dev *dev)

---
base-commit: 1e26c5e28ca5821a824e90dd359556f5e9e7b89f
change-id: 20250326-i2c-5561bf853f8d

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>


