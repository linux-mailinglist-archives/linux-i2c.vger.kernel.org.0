Return-Path: <linux-i2c+bounces-3484-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 797358C44C2
	for <lists+linux-i2c@lfdr.de>; Mon, 13 May 2024 18:03:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3578B282769
	for <lists+linux-i2c@lfdr.de>; Mon, 13 May 2024 16:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A4AB155327;
	Mon, 13 May 2024 16:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJM2tQhr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A62B147C60;
	Mon, 13 May 2024 16:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715616212; cv=none; b=Cs4qKTPyl6KjA07IIzueEYoTScj7o3V3ayL6y9GCxvG9Dv8491vKDiRdJUEUhg7PZz8DzFuRX6ygzFcV5+LsD1oscLM56y7uLaZ4ebOG38T9HJCrnM6ZgeNevRv2st30i/1cjpPoXvqCHtB34atd1R/vxer58pROmrprcLEhYRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715616212; c=relaxed/simple;
	bh=VdVNnq3NbljgrXWUzUiZGt+41VJZ0wUuqDBGBGIGUrk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UmCHjwBpxZU+j7kV8rLov200sxZ/XsP9GQYroUjZ3iqJ2uyoHI0IcsOPw8mqdLvFNwCJC8KLKym5WVVgbgaU/ul8KoooGq0dsRJ0arKWWjO/SDuJlsiCgucllmDdj+GYAPOULReZJthiFH7ZBhrtI8MJOZof7pIEiwXsy+ey+NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EJM2tQhr; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42017f8de7aso6616285e9.1;
        Mon, 13 May 2024 09:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715616209; x=1716221009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hCrormlW5ecmuB99nk6Uo0m04NHiySMbxuDD4bX0NK8=;
        b=EJM2tQhrQY+jf7DgnuP00jt+T1Zh5NdU+doczKYtZYTs8kewynj/TpgZ6xmmRJT2UH
         kc/a3B70Xjt9E7r0gv1grcqP2npFgTZ77EvRY0Cxc2J3nvUOeHo1lHvb+ilisnMVB2JT
         +LBGocNnVJ1Wr9rwuVuR1Ak2ZT8zBCWuS0Y78NUcrW3BFEqh6K8xWfkBV5qLCzHAaHA6
         RLMMFZMWXDOz+Udr3Mi5+/WV8lLjjSUp6W7l1C1QIMy2zxK2MWVUB9R4J0ytznF+bWyY
         BNg/YO/qcTJlQgNjacQXe3y2Q/QfKivxhZ3QyQiNzXScqqISPwSQKP5soXHa2lRsV65m
         dFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715616209; x=1716221009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hCrormlW5ecmuB99nk6Uo0m04NHiySMbxuDD4bX0NK8=;
        b=t4RfUfDt/zPQOwayyA0wpN73tAvF1fM1na0Ob5IuCIsgJTFijC2AckE1szuz3V+oox
         DEaypOKyN+V1SnIoGVrk9by/jaYNelclFX0sobUhlqq2Coir2PBuRIb52CbxJSgVIfC0
         pxg2dbQ9U/pc3HYNtQ0stp6SKsEHwfY5EACzIn/9EKYvsGbyvHbOeccWbS+Y/im0raTW
         +SZW1psIOZt+EextcOZQkckKiZn8guPeU0/RTljhOnF++Sz/kh6/bGcxI8buFw3nOdHo
         bIUuFkLLevSRl6R0aB7YPICxoC6yr3nGz1k8gJ7rd1VM9EacaLTdC5H7NZ6BS+9BsGKc
         dj7w==
X-Forwarded-Encrypted: i=1; AJvYcCUHAPVNEf7eedPRx6GcR1z/grAqXeQEhHQlkOEwQBxzroT4OY0SwyaoO6D7/UTPH3lIvmuZbHjkeKamnbyBdd6SvPQGgxlA4dYTitrH4NiCVPFMTjZ5wqOawvG3nx0t1cuNmfnwl6NL
X-Gm-Message-State: AOJu0YydoouqCVQs2Fd1w/vTS+kLDWVD/LfY5U2Ooeyxz8RBXTD0o1h2
	RJYzuLtdHzAzcbJ2JmuFOhl4jVdhjd7vmDdZz2Ahjc69usN0ewF93toVeg==
X-Google-Smtp-Source: AGHT+IGn9zalGC2BX8yZ8muwRaEpxnIaTN/Y4bSOw4CLYgzaW8UmN3NdZGTIh8XqCCjsR9rRHwgcsA==
X-Received: by 2002:a5d:550b:0:b0:34a:9afe:76f with SMTP id ffacd0b85a97d-3504a73749cmr7946882f8f.30.1715616209264;
        Mon, 13 May 2024 09:03:29 -0700 (PDT)
Received: from mfe-desktop.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3502b79bc8esm11397181f8f.15.2024.05.13.09.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 09:03:28 -0700 (PDT)
From: marc.ferland@gmail.com
X-Google-Original-From: marc.ferland@sonatest.com
To: michal.simek@amd.com
Cc: andi.shyti@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marc Ferland <marc.ferland@sonatest.com>
Subject: [PATCH v2] i2c: xiic: improve error message when transfer fails to start
Date: Mon, 13 May 2024 12:03:24 -0400
Message-Id: <20240513160324.3761564-1-marc.ferland@sonatest.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marc Ferland <marc.ferland@sonatest.com>

xiic_start_xfer can fail for different reasons:

- EBUSY: bus is busy or i2c messages still in tx_msg or rx_msg
- ETIMEDOUT: timed-out trying to clear the RX fifo
- EINVAL: wrong clock settings

Both EINVAL and ETIMEDOUT will currently print a specific error
message followed by a generic one, for example:

    Failed to clear rx fifo
    Error xiic_start_xfer

however EBUSY will simply output the generic message:

    Error xiic_start_xfer

which is not really helpful.

This commit adds a new error message when a busy condition is detected
and also removes the generic message since it does not provide any
relevant information to the user.

Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
---
Changes in v2:
 - add a message where the error actually occurs (suggested by
   Andi Shyti)
 - remove the generic message completely (Andi Shyti)

 drivers/i2c/busses/i2c-xiic.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index b9ad935d7ff3..afb242be456d 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1114,8 +1114,11 @@ static int xiic_start_xfer(struct xiic_i2c *i2c, struct i2c_msg *msgs, int num)
 	mutex_lock(&i2c->lock);
 
 	ret = xiic_busy(i2c);
-	if (ret)
+	if (ret) {
+		dev_err(i2c->adap.dev.parent,
+			"cannot start a transfer while busy\n");
 		goto out;
+	}
 
 	i2c->tx_msg = msgs;
 	i2c->rx_msg = NULL;
@@ -1173,10 +1176,8 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 		return err;
 
 	err = xiic_start_xfer(i2c, msgs, num);
-	if (err < 0) {
-		dev_err(adap->dev.parent, "Error xiic_start_xfer\n");
+	if (err < 0)
 		goto out;
-	}
 
 	err = wait_for_completion_timeout(&i2c->completion, XIIC_XFER_TIMEOUT);
 	mutex_lock(&i2c->lock);
-- 
2.34.1


