Return-Path: <linux-i2c+bounces-1683-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB168504EF
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Feb 2024 16:28:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B688284A30
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Feb 2024 15:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019B65BAD4;
	Sat, 10 Feb 2024 15:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XtgHfzob"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2188F364BF
	for <linux-i2c@vger.kernel.org>; Sat, 10 Feb 2024 15:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707578929; cv=none; b=AHcuL4wuU5QQ3lG01n12wMvs672L8oP4QeKBsq2LiKHGlS8wZ6G/Ytkk+XO/QJIbgAm4OTk5lRjCDHEHithUuyJI8y84XEZ0Xp24cGGAQZOUNVwOWA4BKKB3y734g87YRXNERaCcndgS8JbkBVn0SbP+5PIA8WAHVts7BJgnUXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707578929; c=relaxed/simple;
	bh=THIf63cNe0hbAUzX3bzh1vx1MO0mrsr1I2B/KDD74fc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=pP3E75VvLWSq24Hyrl8FbWFcQxQdsxHAOprM+HT6DzWAL0+sNPG3S2OAV/MBpPAZPtjA4Uc66lmWjxdnn+RkxdOFfOmdwX0pMOCx0UX940yyJmC6CWkNuCwc4RnK9nKROj/D163fAPplqySI4b314/c0moqe8Ls0qPC/eB0XLkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XtgHfzob; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-56174bbad45so420168a12.1
        for <linux-i2c@vger.kernel.org>; Sat, 10 Feb 2024 07:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707578926; x=1708183726; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pnrbItPU1eG4106CUvQNvjYzD7Nm3Z4rSfas2ScFL7Y=;
        b=XtgHfzobijVAo9m1QOrUAw8KHI5u1e3yg9IOjMhEFgeMfd0hfZZ9+mcgMexpFO1AEX
         f+Uw7bY9U+VR46/OBZziRZT6zudpHQ4ny1XVvkbzg6UkQURSvMDZPbRqd/aRwx6+bVK/
         Yc/NE9hmgr408rbGGWvy0Q++xwlKCP4qHRS0Dnr9IohK/7XlFGnEReYqM1L1n7juOnu5
         5lEW8jeLwE3db65PmyRmPDqmma3RbfU3IUdGg25r9fIniQkBez1Rp6kxQufQG1Ishgyx
         40bAp9OnzG8PhmoUWf2c0r2VvjTrk2GZL/gjDva5xEgyCF7HZ48nsFw3SeyDwdmdMAdw
         rLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707578926; x=1708183726;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pnrbItPU1eG4106CUvQNvjYzD7Nm3Z4rSfas2ScFL7Y=;
        b=qp3FWVxW/+TbQKfpHaAl9p8aeoJHiaoYpUknbTKnfXKMRcBFbFslL0e9Me1gIF7sEy
         XCmLA/kaqDAUswlGMMR/53pUYjxkmZwVgEnoXwtGYXJBdcL9sr4O6iptzgZkJfujNxJb
         rjS6MIhAMQnYR+Q+/nnJH0LK9v9lvFcZh2UuIRtMGTENiGtz+pv+MOOJKdMUKUQYn2ln
         yz92M2vDS6dX+ixRLx5QtIMd1eeo/4AIiJ0K7Hpg+agk2dmHRJIa3EIYz2H0AJ84xdaS
         BvjHHl9MkEPWilUiCUlNI+Vtk7VEkBV8v7IkpR6Z551fgyOodteKrc2XkHP5HAZqmB8B
         wIkg==
X-Gm-Message-State: AOJu0YzpxstdBcYgGCUMn/uKNHOX+DNqTw0cuPJxhnFrLBw9RvPP6CQw
	ShHXssZmC9V/2aNEYcyHL1O66AsaasfTKgX7l3Z9+RcwaZw/2IkaEsNLS5/5
X-Google-Smtp-Source: AGHT+IEIy/gv/0pHeI6U6lF+MZkOKv5jB2yK5wgr7CWBtGq1IdyU8timMRb4ATBEiHPSQewwoijY3A==
X-Received: by 2002:aa7:d40f:0:b0:561:3de1:ba36 with SMTP id z15-20020aa7d40f000000b005613de1ba36mr1354877edq.34.1707578926257;
        Sat, 10 Feb 2024 07:28:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV5iZvNyIEknwaXsKmtWP9aQS1jWrYwtZCzwuj35mlnvQF6lxlcAVoIGx9E6XOQwmSOATLQgOOxHPvYf/+uGci+RHseWAc=
Received: from ?IPV6:2a01:c23:c5e3:d400:ad36:6b8:178b:1fc8? (dynamic-2a01-0c23-c5e3-d400-ad36-06b8-178b-1fc8.c23.pool.telefonica.de. [2a01:c23:c5e3:d400:ad36:6b8:178b:1fc8])
        by smtp.googlemail.com with ESMTPSA id d13-20020a056402400d00b00560b0b707adsm851631eda.73.2024.02.10.07.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Feb 2024 07:28:45 -0800 (PST)
Message-ID: <68c013cc-70bd-4c5b-b6b3-5f2d87a218fa@gmail.com>
Date: Sat, 10 Feb 2024 16:28:46 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/3] i2c: i801: Move i801_wait_intr and i801_wait_byte_done in
 the code
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <d761a722-d400-4d6b-8866-4bb25d349184@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <d761a722-d400-4d6b-8866-4bb25d349184@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Move both functions to avoid forward declarations in a subsequent patch.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 68 +++++++++++++++++------------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 4951d7d90..751b7c6d2 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -330,6 +330,40 @@ MODULE_PARM_DESC(disable_features, "Disable selected driver features:\n"
 	"\t\t  0x10  don't use interrupts\n"
 	"\t\t  0x20  disable SMBus Host Notify ");
 
+/* Wait for BUSY being cleared and either INTR or an error flag being set */
+static int i801_wait_intr(struct i801_priv *priv)
+{
+	unsigned long timeout = jiffies + priv->adapter.timeout;
+	int status, busy;
+
+	do {
+		usleep_range(250, 500);
+		status = inb_p(SMBHSTSTS(priv));
+		busy = status & SMBHSTSTS_HOST_BUSY;
+		status &= STATUS_ERROR_FLAGS | SMBHSTSTS_INTR;
+		if (!busy && status)
+			return status & STATUS_ERROR_FLAGS;
+	} while (time_is_after_eq_jiffies(timeout));
+
+	return -ETIMEDOUT;
+}
+
+/* Wait for either BYTE_DONE or an error flag being set */
+static int i801_wait_byte_done(struct i801_priv *priv)
+{
+	unsigned long timeout = jiffies + priv->adapter.timeout;
+	int status;
+
+	do {
+		usleep_range(250, 500);
+		status = inb_p(SMBHSTSTS(priv));
+		if (status & (STATUS_ERROR_FLAGS | SMBHSTSTS_BYTE_DONE))
+			return status & STATUS_ERROR_FLAGS;
+	} while (time_is_after_eq_jiffies(timeout));
+
+	return -ETIMEDOUT;
+}
+
 static int i801_get_block_len(struct i801_priv *priv)
 {
 	u8 len = inb_p(SMBHSTDAT0(priv));
@@ -447,40 +481,6 @@ static int i801_check_post(struct i801_priv *priv, int status)
 	return result;
 }
 
-/* Wait for BUSY being cleared and either INTR or an error flag being set */
-static int i801_wait_intr(struct i801_priv *priv)
-{
-	unsigned long timeout = jiffies + priv->adapter.timeout;
-	int status, busy;
-
-	do {
-		usleep_range(250, 500);
-		status = inb_p(SMBHSTSTS(priv));
-		busy = status & SMBHSTSTS_HOST_BUSY;
-		status &= STATUS_ERROR_FLAGS | SMBHSTSTS_INTR;
-		if (!busy && status)
-			return status & STATUS_ERROR_FLAGS;
-	} while (time_is_after_eq_jiffies(timeout));
-
-	return -ETIMEDOUT;
-}
-
-/* Wait for either BYTE_DONE or an error flag being set */
-static int i801_wait_byte_done(struct i801_priv *priv)
-{
-	unsigned long timeout = jiffies + priv->adapter.timeout;
-	int status;
-
-	do {
-		usleep_range(250, 500);
-		status = inb_p(SMBHSTSTS(priv));
-		if (status & (STATUS_ERROR_FLAGS | SMBHSTSTS_BYTE_DONE))
-			return status & STATUS_ERROR_FLAGS;
-	} while (time_is_after_eq_jiffies(timeout));
-
-	return -ETIMEDOUT;
-}
-
 static int i801_transaction(struct i801_priv *priv, int xact)
 {
 	unsigned long result;
-- 
2.43.0



