Return-Path: <linux-i2c+bounces-4833-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB3192CD22
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 10:36:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E198EB23D48
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 08:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168A413BACC;
	Wed, 10 Jul 2024 08:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xcMXW36M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A264D13C3F2
	for <linux-i2c@vger.kernel.org>; Wed, 10 Jul 2024 08:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720600565; cv=none; b=oGZIpTSS0/cNUAkGQ/37GHy4V+/txT/6XcAoY1/2DZ+ByIjSb2E9C9+Ra56cKa4rKDJTGm636ek7XwOtPAzyMEEZpKCSvv5Z2wel6OW0fZ8WznRsPVxTNfioE1GAxLrxfzms79dJzHQqwI8lKrfLY3PLc4QUE/J4ilHoteZlLfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720600565; c=relaxed/simple;
	bh=ZzznhNzrTYFcBYnQOf8W5bFtcIQqhHtFbQxNQUsNaCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YN54/53xye5wEKmN5XMeionJPCjGWAsHbmlZJHjIZwXF35jT+iZXeeLEN264Tef8DAFLOmfu6r+wqaFU9GFlxn9SoDSv7+7nYM8GAz8haafptZnHOecr3mwuAjKnJmhhwo10cZ/UztHsdKyBJ9yLrKmA0NobDV8xnmez/bZ/EjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xcMXW36M; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a77bf336171so106423266b.1
        for <linux-i2c@vger.kernel.org>; Wed, 10 Jul 2024 01:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720600562; x=1721205362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qtiZJz2W0rGE08L3FMzbwurxCmSUlaZ4kv0pzdE/HcM=;
        b=xcMXW36MRJJFPD5oYZhphsTMPvx00mV4noULY4oCYYOEiFVmOwfseFh/YXhoJX2qvw
         HUT6VFQytiyV0h0f9THyEI4lr4WQZO/tJqx5v2eEmmKCRHTnmVQky4sMTIMcpoU7klif
         CPF7NfxyLI5BWLqaTaYc3iOjjcaTT1vmIDgIgfan3CYd9P9wM0IrXe7orssus+JfHnm6
         j/aRWw/JyMnOJIuG0zE4jvbE29/7XjgliMp/4YwEDdB1R0oxVuiFIzfryiU0Ozyt2kPB
         80i8tGcuPOGS/AnC5jB5UFVFRduvwKpFD10NwaYIFr7dZRNt+yCs0ZiPVoED3po0H9xn
         cw/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720600562; x=1721205362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qtiZJz2W0rGE08L3FMzbwurxCmSUlaZ4kv0pzdE/HcM=;
        b=dZ/bkMkhDmkIA6no3lf3zCn/DJavl768SijIGITMkNfhFUeY5p/4vKarbtCX6CZpSc
         hk3Ax8qmepWEJneqDkJUTmn3WV/BF4JFBA18GksjsEGBi8bjyddi8EfqS5V1eaJkxTAw
         R8kUti9wohs72Zwnx8UAYCt87d1aLd6N3JIbleEPBOqRjR8pHUdXklgZxUU0i/wB/XIp
         5FEtnysUP4uZAKoyz3gtatTcqxIyetFlYKfztM18RFZiHda2eduFqIjX2dqWvFrf45SV
         y0QjzKV3+XYh76ckMsoo0Ps7h3q03H8P7VoakL3z/ji8a3o27opGCOUoivsYfKegGw1r
         hK5w==
X-Gm-Message-State: AOJu0YzcXhDs6TIjtjXPfi1jWL+1W8d8R4hLOy47Jx9rago7lwgBuRwW
	2xLwSNBKuVA4+jPpEJwiaBNXV2F/MfYjPog5R4IP25TuLNYVUMpSj948/VwfxB4=
X-Google-Smtp-Source: AGHT+IHmg0OgyKBW6vIDhYtSio0IQUsZ8nZs+BYpy92cQRqb+msUxjYJNfY8L5F79CmeK1zyuxUyGA==
X-Received: by 2002:a17:907:3f22:b0:a6f:20e0:1d1a with SMTP id a640c23a62f3a-a780d30a933mr432314166b.33.1720600561993;
        Wed, 10 Jul 2024 01:36:01 -0700 (PDT)
Received: from localhost (p50915eb1.dip0.t-ipconnect.de. [80.145.94.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a8541f7sm140222566b.154.2024.07.10.01.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 01:36:01 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-i2c@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (pmbus/ltc4286) Drop unused i2c device ids
Date: Wed, 10 Jul 2024 10:35:45 +0200
Message-ID:  <9a48ba0368e0c8cddc94c5e4cf3edd7eadc03a2d.1720600141.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=733; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=ZzznhNzrTYFcBYnQOf8W5bFtcIQqhHtFbQxNQUsNaCU=; b=owGbwMvMwMXY3/A7olbonx/jabUkhrQ+9yemfswZ/OunnNrmpd6xROFPhFRWc8aS+TGhH/4mf HZg1lnVyWjMwsDIxSArpshi37gm06pKLrJz7b/LMINYmUCmMHBxCsBE2A3Z/ztN9GZnOywSclD8 Y4RE1gtrC38FMYezRSaBXMyiDIfO2oY/2JAr6zZDW1HUQWy22i3bk2+tJ339fVbz4NzzR1KFpyi a/isw2GETFcK1lVeIUWG1avPqDYe3vdAr6rV0XRTVMtfVbZvDzZsmeSY+UyU7bvI/TOKx+PKUq7 M2a4XsQ555S5WK18Xvb9hh9jmOv9z74I1dj1PYBbLvK/6M+SCg811y3w02c+HVrhrdtR31ffwRH T9n3I/K2/ukUsbR9sObLwxfIipstj0JsfykL7xLdV4if/2SULboF4LrTyl1Gp9y3H9T5Nkxv3KW xcUOVw6XljPwchVphj9W3b/1ntj1Q2nBdVL8sz9rFNsBAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver doesn't make use of the different numbers assigned to the
different devices. So drop them.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/hwmon/pmbus/ltc4286.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/ltc4286.c b/drivers/hwmon/pmbus/ltc4286.c
index 2e5532300eff..28aa211700fe 100644
--- a/drivers/hwmon/pmbus/ltc4286.c
+++ b/drivers/hwmon/pmbus/ltc4286.c
@@ -58,8 +58,8 @@ static struct pmbus_driver_info ltc4286_info = {
 };
 
 static const struct i2c_device_id ltc4286_id[] = {
-	{ "ltc4286", 0 },
-	{ "ltc4287", 1 },
+	{ "ltc4286", },
+	{ "ltc4287", },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, ltc4286_id);
-- 
2.43.0


