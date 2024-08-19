Return-Path: <linux-i2c+bounces-5497-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C550956855
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 12:24:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EE581C20C31
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 10:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F7C016130C;
	Mon, 19 Aug 2024 10:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="mncnCM8g"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6B8165EF4
	for <linux-i2c@vger.kernel.org>; Mon, 19 Aug 2024 10:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724063050; cv=none; b=BfQ84V2tMsntVz/3CuAPfQE5w92sqVaZzdPrysKIvN7YNnqe45c3uMhKa5btUCuPKqHC5ZU/mKI3zzlMHkps9ATg9x0C/gtj5q+tyHcFmhT9vi3s13mrZOfI/xoSY9x++p1giVYvll4ePZZ3qXTi3TgOeEyJLQrRgZ61K41d2kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724063050; c=relaxed/simple;
	bh=z6TCcjwue9TYz7JInDjcmzx1UOfgxbAEKNVt5syHDaM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HAA1nl08vNO29k4mCPxiDXXNwm0PSjc6e6F/PVCJPB0r9WHI1wlxQ3XUbW1hCtmzDEftkHOAGDFfFvG3LqnJf3qIOtPZUVSbhPJafNX4F49/1Sr+RcLmtPwhFcohG0na6gsjK4Vg2U6L/uAU9stOMqb7l6wJLwX2i2gr6vdzYnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=mncnCM8g; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37196681d3bso1910766f8f.3
        for <linux-i2c@vger.kernel.org>; Mon, 19 Aug 2024 03:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724063047; x=1724667847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJ7yNcG1m1i0h8P6wLWOssV8KAFemhynAlwW6SKhVVo=;
        b=mncnCM8gy2FrBzlE9bPELAxyLgIqiL3nHP0agbx+H2oxoGYsDxDljBEDP4A2AltJ3S
         ftHtY76/pROZ8TlalUeMCgKa8m352sqVS/nrZ7aWweZZhFBnPkEGUC+FnacWyVrQYRCz
         Ps0kHiuuQ34FjTlFvEZ0cIM//hbERkqK7pVCT63294RY/RGRj2G6PV7nlqJQjhsFPhXC
         7TYjAKiHTt9keJovtLx6HK2xi5YDJvNj2Ul+ZJKZyzFXoFEiJ0UkIaxzBNowfdZSrOBZ
         3WVKwFWfCCcA1XW7eLfBrKy2zEew5ApZDa54FwQSivqJd2eyqL/rRH3qum9M1wrkpeit
         0ixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724063047; x=1724667847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NJ7yNcG1m1i0h8P6wLWOssV8KAFemhynAlwW6SKhVVo=;
        b=gatQkH/5irOXDQmUJu4rxMOvE5DS5jCLacIzihDuwwEKheIJRghT0X9EPHA7aiEpsD
         ftNko03XQUBBp/CYbkqvX1A4FSwHJ+wkSYfGFSS0VneaP/6nfAiL0vVbpxK7DcZAviFT
         aM8EacfyvJH2ZQtmAcj+8FB6s0ClJPBHbhAaFVsex52s1cj0C4I7X0L3D2AAcZkzJl96
         lFg8Afkg3SCo2+JleLtRjwtCs+EZI+TTSkXqPiNtaAaFH8aqAde3s4E/r18XlcERs/bj
         eG9zLyw+/WLr5PrH5AJU5hJv6nyEDU7NihmqK6FCp5GFKfaynI5tWhMJ5/tIdZcghaXM
         uD1Q==
X-Forwarded-Encrypted: i=1; AJvYcCU68WfRB0wRyxxOEjWZik0RzPwYI0pjBaMqJdoPpWyY7FUprq+kuG5B6cWOVyXnnaas5VcWSWnZM2x0/Ma7WfGxE9eFxysQ6N9F
X-Gm-Message-State: AOJu0YxMqbbZ+34KxBKZoIGtBChgD4XzZ02Zl3OJX/OpaOypfTiWae5v
	ijey6VebJMq6g/tHxhTdSABPcMFFfP710Iluu4ukYvZUP488qcFuTkZ2vBGUuqE=
X-Google-Smtp-Source: AGHT+IH35aeD9aoWxV9BWKKVbIqVat0Tr6oYJvQSkKpqYRsKX2JAzCz6Kq8sQaX2iqJjtiMtEYiPdA==
X-Received: by 2002:a5d:69cc:0:b0:367:905c:823e with SMTP id ffacd0b85a97d-3719464e8d4mr6538216f8f.24.1724063047209;
        Mon, 19 Aug 2024 03:24:07 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed650402sm106690275e9.11.2024.08.19.03.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 03:24:06 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de,
	wsa+renesas@sang-engineering.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 03/11] i2c: riic: Use pm_runtime_resume_and_get()
Date: Mon, 19 Aug 2024 13:23:40 +0300
Message-Id: <20240819102348.1592171-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240819102348.1592171-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240819102348.1592171-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

pm_runtime_get_sync() may return with error. In case it returns with error
dev->power.usage_count needs to be decremented. pm_runtime_resume_and_get()
takes care of this. Thus use it.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- dropped error message on pm_runtime_resume_and_get() failures
- restored initial place of i2c_del_adapter() in riic_i2c_remove()

Changes in v2:
- delete i2c adapter all the time in remove

 drivers/i2c/busses/i2c-riic.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 2e119024c2d7..6fc41bde2ec2 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -133,10 +133,12 @@ static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	struct riic_dev *riic = i2c_get_adapdata(adap);
 	struct device *dev = adap->dev.parent;
 	unsigned long time_left;
-	int i;
+	int i, ret;
 	u8 start_bit;
 
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
 
 	if (riic_readb(riic, RIIC_ICCR2) & ICCR2_BBSY) {
 		riic->err = -EBUSY;
@@ -301,6 +303,7 @@ static const struct i2c_algorithm riic_algo = {
 
 static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
 {
+	int ret;
 	unsigned long rate;
 	int total_ticks, cks, brl, brh;
 	struct device *dev = riic->adapter.dev.parent;
@@ -379,7 +382,9 @@ static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
 		 t->scl_fall_ns / (1000000000 / rate),
 		 t->scl_rise_ns / (1000000000 / rate), cks, brl, brh);
 
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
 
 	/* Changing the order of accessing IICRST and ICE may break things! */
 	riic_writeb(riic, ICCR1_IICRST | ICCR1_SOWP, RIIC_ICCR1);
@@ -498,10 +503,13 @@ static void riic_i2c_remove(struct platform_device *pdev)
 {
 	struct riic_dev *riic = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
+	int ret;
 
-	pm_runtime_get_sync(dev);
-	riic_writeb(riic, 0, RIIC_ICIER);
-	pm_runtime_put(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (!ret) {
+		riic_writeb(riic, 0, RIIC_ICIER);
+		pm_runtime_put(dev);
+	}
 	i2c_del_adapter(&riic->adapter);
 	pm_runtime_disable(dev);
 }
-- 
2.39.2


