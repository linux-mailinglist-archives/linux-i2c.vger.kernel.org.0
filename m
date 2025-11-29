Return-Path: <linux-i2c+bounces-14343-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C302FC944BF
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Nov 2025 18:00:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B09E9347BEE
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Nov 2025 16:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C34311C15;
	Sat, 29 Nov 2025 16:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Fioj0ztG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E8F30F95F
	for <linux-i2c@vger.kernel.org>; Sat, 29 Nov 2025 16:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764435530; cv=none; b=chYJeGA4iWfYoVb0UazMJiPoDbdnZRcpJX2E7R4xz2l8BDcFIXq2ny4fI1225957OXPHBzogGf9r8b5dLTilFs/qNJY0+knbQ+0024WGL91tQtP9EYmT15p+XRD+mHh4gWChHNNbRWXzdsPHSN8NS5R2SamCyXTjVBX/JOgG2dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764435530; c=relaxed/simple;
	bh=lFoITZ+8y9h+znHwjqA5lzaUXuTbRHz9vr6xKWUfQoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PaZ+7Jf8hgviuKhbCFMM7lStUMF0Pb6/wE2qghAlyYpLCDP3oi/itcLSO9LR+JUuBxRuJ0ArtjgWa+r9Sc6mq7B2uhJwKGnwIs1DPJE4h4PH/rR6T5F5nl+2j5hdYAtAY1QSdNBI2IFvuGJo9u867HWxadVD2DfMx++h7Zgoba4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Fioj0ztG; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b7277324204so471670166b.0
        for <linux-i2c@vger.kernel.org>; Sat, 29 Nov 2025 08:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764435525; x=1765040325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNQekoeq5MvJ5okU84UxS4oYSbes7vTEJXlQrgYvFfA=;
        b=Fioj0ztGbpKi5xVbcQMDgGRjOEVhue1alt/Blss/r+GbLrSvS7xCBDV4X5tiABFWlb
         LkOF43MFCNFgY5cgFKPtCelS0ndktiNkCmDmdK0XSFU/iQg1nxebipsUzz9QmyUNbLdg
         afEqWn2RxQUsNyrQQG2U1Z9NsvnSj3tzqI6d9YDKl+MjPsQ6U1zaHpx76MomfOSj8sAq
         4H7rIhtoM2kMoFZHiPsJmrtJPWA+YOrNuJUD2C/hRACM3xo23Dv6ON6wRHzaz3YEdOBV
         r/1Hvy6rlKupBqffZPjmm2Vq/zr7NSlB7iVSZGbNfqlxUhdM2HdpQBWTni/lwU8peTH7
         k45g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764435525; x=1765040325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BNQekoeq5MvJ5okU84UxS4oYSbes7vTEJXlQrgYvFfA=;
        b=tTftcfKoDIGRQPM/kFQZ6W6UewaYP8SC5HJ2DUqjGrQae71RKMP9wuE/DsGskt/cjf
         ueNYtLyP81KH/VLqirm3L0KAxYYCA6geG+jB4a9gae2F5L65BIPiJ2YIQPvvD25C7zJI
         pqvsdhmL5d1imWOtLpJphCY4eS8N9OITuH6yMh+JOW0uWWOM1EZgfiCOn6eIQci0fezI
         Z5htjnehULsnp9sLJN6PbG7snB1cfqhl23AclsCgwIV3sIjxNQ3yVzT+xvUZSv1laNBt
         XJB3LZYzsb7srkPcfgMy0vHyrK733yjeuV9zNc/q8mAhU8+bVk4Inr1rpbvQ/ktYj84I
         8E1w==
X-Forwarded-Encrypted: i=1; AJvYcCV7alHXWxEUR4Z6P2hwbJ98ELZcf9nw9vjIAPVisi4oT78eraGuidIrTMHUqL9AMj0XS/vrPLM1rZI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp90vNnzVfcZhZ4dxC6pPSo2WwxaHmU5c6mEQx7WlWsFSrrJIP
	LPERqX0wCqdg15u1JkbQ5YY+t4bA+LTnaw7NaT74HqGXjFDwhTexj6McL4pa8oFwA/o=
X-Gm-Gg: ASbGnct+IjO+NeqeDSCTMhde19KSLnJRfhUa3YTH0d93+NjXYndlbU60c4B4ex+lDO9
	Bprk+ygm5m8JgiGdqsB6WLUKliZItZLGe9xxFOwmeFQ1lFqa2Bo0KScJiOMHSd4le76Erq1m5An
	sAxLR5ArvQiKiYfThlzgHWO6u3nxLUV+X0M02IErigSsdmjPTkXaoFurmCzGyp6AhouHtRwyGj5
	YU+y7sp++prz12GKG9xwrFkX2m/0dqDwh6W0ASAtsN+2X+49fPC7hESVgCIcBh13JVwOwk2HeM5
	D/H5wS2umJDsZCnxomVRbp7KCfd0PBt1/FUuf4IFnbms4l4P9+Ut4FQHzabHW8WGkN82mv0CPCZ
	iXUOX7jZhcfdTQTF+9KHt/iauMlqbjvlb/Ew2A4/fpdu0YSb0kN6igWlkNUthyOsGzf52fARZa4
	SEJSed6edo0Gm0vjEd
X-Google-Smtp-Source: AGHT+IH0MuHRfQrTehiJ52oUZvyc1bRjVVlQ90Y5BVCZU/AGDxq3c6qhZBRECgPEx5G8y1z2CMPY2A==
X-Received: by 2002:a17:907:a09:b0:b76:7b8c:a6a2 with SMTP id a640c23a62f3a-b76c5513f0amr2236776366b.30.1764435525382;
        Sat, 29 Nov 2025 08:58:45 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b76f519e2a7sm746363266b.19.2025.11.29.08.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 08:58:45 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Eddie James <eajames@linux.ibm.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Ninad Palsule <ninad@linux.ibm.com>,
	linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 11/12] i2c: fsi: Convert to fsi bus probe mechanism
Date: Sat, 29 Nov 2025 17:57:47 +0100
Message-ID:  <1311bce0d8617c7821cfe0769e97f13dc466d749.1764434226.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1764434226.git.ukleinek@kernel.org>
References: <cover.1764434226.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1926; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=lFoITZ+8y9h+znHwjqA5lzaUXuTbRHz9vr6xKWUfQoQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpKyYerMbqnhdrESWnep/VE+BwW0xpjbtreFxEN ucImWFZ8nSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaSsmHgAKCRCPgPtYfRL+ TonZCACcm2Jdwaa3XVZ2Cp3JYYBZY68UG0Sf3G/dj+JWPDhCBlZ+/+v7prYyU4O3d63j5jPdYaY EHU3cy3rKORxvZQ7O3dHJ8Q2skeRpnrR2wTftedZVfUPNiB5jYlJKSe3sx3ktLQbThCQ1z2Zbvi l3lkI4FFBwsAaYkhjWjMj3y3qF+uJZn1qQdQSZZsqQwJFFf27tnOaNp0FRCvfmBqGmdpuMEMr5a gc85eibDINIZDLq4D+16foZZgOyemHYvJKOMt5G438IZ32J4vutnfcPLxCpIxrHsLlkcUkrFaJy CKa7WQj6VFAJxp9cuDEC1oHlZC7RgE+vdw20Qp5r1jOx9j+O
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The fsi bus got a dedicated probe function. Make use of that. This fixes
a runtime warning about the driver needing to be converted to the bus
probe method.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/i2c/busses/i2c-fsi.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index e98dd5dcac0f..3a7e577e6eac 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -674,8 +674,9 @@ static struct device_node *fsi_i2c_find_port_of_node(struct device_node *fsi,
 	return NULL;
 }
 
-static int fsi_i2c_probe(struct device *dev)
+static int fsi_i2c_probe(struct fsi_device *fsi_dev)
 {
+	struct device *dev = &fsi_dev->dev;
 	struct fsi_i2c_ctrl *i2c;
 	struct fsi_i2c_port *port;
 	struct device_node *np;
@@ -735,14 +736,14 @@ static int fsi_i2c_probe(struct device *dev)
 		list_add(&port->list, &i2c->ports);
 	}
 
-	dev_set_drvdata(dev, i2c);
+	fsi_set_drvdata(fsi_dev, i2c);
 
 	return 0;
 }
 
-static int fsi_i2c_remove(struct device *dev)
+static void fsi_i2c_remove(struct fsi_device *fsi_dev)
 {
-	struct fsi_i2c_ctrl *i2c = dev_get_drvdata(dev);
+	struct fsi_i2c_ctrl *i2c = fsi_get_drvdata(fsi_dev);
 	struct fsi_i2c_port *port, *tmp;
 
 	list_for_each_entry_safe(port, tmp, &i2c->ports, list) {
@@ -750,8 +751,6 @@ static int fsi_i2c_remove(struct device *dev)
 		i2c_del_adapter(&port->adapter);
 		kfree(port);
 	}
-
-	return 0;
 }
 
 static const struct fsi_device_id fsi_i2c_ids[] = {
@@ -761,10 +760,10 @@ static const struct fsi_device_id fsi_i2c_ids[] = {
 
 static struct fsi_driver fsi_i2c_driver = {
 	.id_table = fsi_i2c_ids,
+	.probe = fsi_i2c_probe,
+	.remove = fsi_i2c_remove,
 	.drv = {
 		.name = "i2c-fsi",
-		.probe = fsi_i2c_probe,
-		.remove = fsi_i2c_remove,
 	},
 };
 
-- 
2.47.3


