Return-Path: <linux-i2c+bounces-8435-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B620E9EC2DB
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 04:08:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C0BE1881675
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 03:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 937342040A9;
	Wed, 11 Dec 2024 03:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="bCr98z0A"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD601FCFDC
	for <linux-i2c@vger.kernel.org>; Wed, 11 Dec 2024 03:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733886502; cv=none; b=gofVGx7ZELNO6avwYdNLHK+me1DTz5945L8Nw7ppjvWbrq4P08RQTPa3BtrN7iLopDcD+gjCRzkHDyX121gBxTyHwi43Goe/cgXZH+RKNteGu3YzXrr4OIqaSODi+osJ39esjN5TMI2diJjZW/Upp0506wCGTKamHhyOqmIhmZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733886502; c=relaxed/simple;
	bh=nDWof4pxM/ZlbW88hNKCqQiYHZe8+KrUnT3FXn+kSmY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cNvdCtFE7lJcm4f4lJ1AC7Cuaa1h2a1IT8nlFvipqgalWTDERC/MIPuV+mn0Wd0gZMcfGdFgTyEwmtcMynHleLKTkIuJIY+3oMMMuIc4DkvFz2pOJ0XkdsLI152cqSPno5d8szq0WGezDC6uO+t6c7kGl9H9cNy6iqqcB7iAaCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=bCr98z0A; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21636268e43so40482165ad.2
        for <linux-i2c@vger.kernel.org>; Tue, 10 Dec 2024 19:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1733886499; x=1734491299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HVevN24y3UZbP9+LNwpaUvSkD8owCWCQvSepKmgobsg=;
        b=bCr98z0ATQGqssLhxF7T2WKUmLeNzzjSlHOrXella8v8knkzQ/ZYS0G36+M1+YnZgE
         GJCzabYQgX6+daheiDd0bHBGGqZVQ/0dXGbAC2sUoxYrQunHN7mja/Lh2eLFMDy/ARkM
         dxa4sfK/NpxtMb1LS6ZjVkFsdGAkuKP1cBG0EvuUWXWxmnNSr/jLZnD89bqU2cf2NOI3
         RAA7i+HSejwLYFRZfUPJBw4V0VWkIBqbRmlE7QPJCOB9hwCluf1P0yR5626Zz2BSDgEk
         FzVg6AngnaJT1Nd50i8QtSbUWN81FZnysIci23wKnuzDn3EGeH3GHiSvkrTpX6jc7XFl
         erqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733886499; x=1734491299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HVevN24y3UZbP9+LNwpaUvSkD8owCWCQvSepKmgobsg=;
        b=U3u/5aEGJCR2BKDZo8jrG9HYTEnN5OBe5E3kUOe31+/M1f2TLjTG/YN4fXugTeCisy
         6kJtO2/FVlEU+3zBrcVM+mGyDUCPI2OJKnN7BCKZMmQTyYAwV0tit1ei4pnIU9OjSFKv
         yEKE+hbhHaqSghOs99OmJDMVFtFMdUhLzbpmPFf2OSrwQVNlhbbNUn0fRgjBP8pYOduL
         DtMvYmXYrvcHwc+PdV+2VV5V/LTjUbb850zVeHVqhLO6MLd3bItoPVcEAtYRuS9vqwkL
         wFHajVW1N8jOgAHXv1BkxfceiTcy+7Hoa4D/z4iB1euJrakXlsFgN1U/U8r7+ZZVbox5
         zVWw==
X-Gm-Message-State: AOJu0Ywzzy6diGuMb8yTEVxbnAVY0hSm1BL5HawcJXexPFayZ6G8zOrB
	HDlmxmEPUHcxoSSV70H5K53JBJchW8EAYKaUIptOVaAqp3a9j0PdAr8kWFXoecRm9jTxK3/9yR0
	x/68=
X-Gm-Gg: ASbGncuU2l9r8t5U+idWZYXHPa8Gws8dSCnbfLtjxmCi9m+yVAo7KigBGnu6lEOTxCu
	fdMJGwhKkJsgl5lnfH1bb/RsDZONOW6amkUX1WkKSDATshrO44kdBAwUtER7WTuXSlo76cEDzlY
	ZBoNjsgse2Cjl24sGeAYlCPzmZMIfy2dm2giIsYgzXJ8gkH2PHy3b/bONMVnSvchSdh8fHGxIC9
	Q2M/3QtcdXSYKfymyWPTeM2D9LMPzQJMByQOZaRWirERPeSPkXNsAJu9mRgnNfsZ8YWgSI482yr
	d/HRzLuw4FNBJG3wkD2OjBydB2BueAyA+B3uhckd
X-Google-Smtp-Source: AGHT+IEdNPAxkqRkTaUoRNWrxmiZA4Ccu/C+MlNVOILFg4MWiHK0UxIiGGJjfG3rQg8qVAFLb3lDEQ==
X-Received: by 2002:a17:902:f688:b0:215:a80b:f6f9 with SMTP id d9443c01a7336-2177851f6abmr21562585ad.8.1733886498990;
        Tue, 10 Dec 2024 19:08:18 -0800 (PST)
Received: from localhost.localdomain (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-216356eed6bsm56677645ad.255.2024.12.10.19.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 19:08:18 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] i2c: core: fix reference leak in i2c_register_adapter()
Date: Wed, 11 Dec 2024 12:08:03 +0900
Message-Id: <20241211030803.191789-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The reference count of the device incremented in device_initialize() is
not decremented when device_add() fails. Add a put_device() call before
returning from the function.

This bug was found by an experimental static analysis tool that I am
developing.

Fixes: 60f68597024d ("i2c: core: Setup i2c_adapter runtime-pm before calling device_add()")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/i2c/i2c-core-base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 7c810893bfa3..75d30861ffe2 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1562,6 +1562,7 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 	res = device_add(&adap->dev);
 	if (res) {
 		pr_err("adapter '%s': can't register device (%d)\n", adap->name, res);
+		put_device(&adap->dev);
 		goto out_list;
 	}
 
-- 
2.34.1


