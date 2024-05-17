Return-Path: <linux-i2c+bounces-3576-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F638C8C9B
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 21:10:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CE7B281745
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 19:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0148313E3FE;
	Fri, 17 May 2024 19:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ngmpevGL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4413D6A005;
	Fri, 17 May 2024 19:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715973017; cv=none; b=sj9AbRL5bMTvXgpdhmhZUyC1xPwnrWGEt3iSHWp2esFwWsB6aGehfjtDP5QL+OryxtS7YnAHm6XmESQXrSLYhdlaRZkBR5Iq2U8Pycy7RpKoqajqUZOhXFqBmMXjoqah8p5bjRG18esmkPeswvjMHT7N2VBAyiiR10fJqGdDOXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715973017; c=relaxed/simple;
	bh=RnfZxyi5GFAJQ38oEY9ABJuJmpfE8TDy13wT1rkOv34=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sj51xb6qoLt6XU8S/+LNqGDkvsA7PsXfut0woiYBnC1REQWBTYyp8ucLlCxAU6oed+codo7xu+A4CgGB6ID/smK5kKO8185gPaRhwTTU3l7WL+7vIZ9KwHFw//9mI8GfzAKrnc8fBP0fO75/UasKloeOqeiBL/C1goItxX+5vy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ngmpevGL; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a59c448b44aso508622466b.2;
        Fri, 17 May 2024 12:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715973014; x=1716577814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+VVOSJH9quqoX1VyGoo0FEpVRC1dS3g2ohGA4GxPEWU=;
        b=ngmpevGL/a3GInK/mrD4zrtxKv65N7z3dbjv3XngQ+IjSBQy8Gnz0xm4nZkeRFZgJ6
         PatfNBNs/79MyJiEgEq30YrTHaOw+n1/yz3yuQ1jm7nfk4mvGJWQEfXxeVg4ogs6PoWR
         RjzeV/IZyQXVA9p5tJsdAd+B9W7Thzp7waWY1ib4dcNJBeiMBZOg6ImIP0ccgaaN2vxW
         SXqDS672dIyx2CD/vbAg79g5k97VGMBvbQTNNAMfWTvnXPWsdAYFQt+YnvgTg/9Jii2q
         NZFR8s1A4Due3gIpbd4Y6a2CUqx6UJpnI9AyUIHAMeGkJdkQPUiT3gjsbnrlh+330Rgq
         nIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715973014; x=1716577814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+VVOSJH9quqoX1VyGoo0FEpVRC1dS3g2ohGA4GxPEWU=;
        b=hTrOEeALkqKiVD2ZlW8cwFb1toWctzdVc5CqyeWOrcvRBgItsMLieRCZHDBTxG8ejx
         zDBS9exJMRCVtjRVMm+OsMslSb9C5Cd44piWXFM1Z3kZNvVySbxXeOpjWw4PIczh+7ZC
         X4Owmt3KIAk9SWCAK038LCa2dcQFGcIMLYL/6lmWv8j/fo56m4I4+UNhf8+8srM5m9yY
         eKw657BEIhj54doKDaiR5VGYhHGmvmg7Gyr+mSiAy1/+IYwKgeP5DOvNQuG5Mcq5BT4x
         zlB6b/oTl0dzKChvDme017xGKRZIc6f/edxlfT97X12VaAkPkE6c1hzpeE1qRYNMQ/LS
         Vihw==
X-Forwarded-Encrypted: i=1; AJvYcCXgY/CXynHawdHhHe7feitDjRiArumsBaPAIfk/+Ojk6wrhFh4XP5GZsJPjt6ru2MIjxbmlo7cHGK4JlxUFP73P1/vFdFm+8Q5F5fvGN4R6E55jSRxORQa+H9f6/im/ZFSuLYuvT8jQ
X-Gm-Message-State: AOJu0YwxhXMJ+b823/iWhj6Fu64KSkWGYGRTbLkd9iLw7THlLl+Sohdj
	+6zXPcX6nGg5vNfjXFhxRF9DGlyUDCx0IZwzocIAsTGNgeZ9MPRB
X-Google-Smtp-Source: AGHT+IFc6wkTpM9J8XhB/tHdDw+l9yJH+vIYD9N3+ZIFrDSI4eMBEpNV+wR+nZS8NJ25GVit+N2IWg==
X-Received: by 2002:a17:906:aad1:b0:a59:c23d:85d2 with SMTP id a640c23a62f3a-a5a2d66b4b8mr1429573866b.55.1715973014495;
        Fri, 17 May 2024 12:10:14 -0700 (PDT)
Received: from think.fritz.box (2001-8e0-3c0d-4001-4e1d-96ff-fe13-2153.bbcs.ip6.as8758.net. [2001:8e0:3c0d:4001:4e1d:96ff:fe13:2153])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7e2bsm1144631566b.110.2024.05.17.12.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 12:10:13 -0700 (PDT)
From: Grygorii Tertychnyi <grembeter@gmail.com>
X-Google-Original-From: Grygorii Tertychnyi <grygorii.tertychnyi@leica-geosystems.com>
To: Peter Korsgaard <peter@korsgaard.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: grembeter@gmail.com,
	bsp-development.geo@leica-geosystems.com,
	Grygorii Tertychnyi <grygorii.tertychnyi@leica-geosystems.com>
Subject: [PATCH] i2c: ocores: set IACK bit after core is enabled
Date: Fri, 17 May 2024 21:10:00 +0200
Message-ID: <20240517191000.11390-1-grygorii.tertychnyi@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setting IACK bit when core is disabled does not clear the "Interrupt Flag"
bit in the status register, and the interrupt remains pending.

Sometimes it causes failure for the very first message transfer, that is
usually a device probe.

Hence, set IACK bit after core is enabled to clear pending interrupt.

Signed-off-by: Grygorii Tertychnyi <grygorii.tertychnyi@leica-geosystems.com>
---
 drivers/i2c/busses/i2c-ocores.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
index a0af027db04c..a52f8fd4e2fe 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -439,8 +439,8 @@ static int ocores_init(struct device *dev, struct ocores_i2c *i2c)
 	oc_setreg(i2c, OCI2C_PREHIGH, prescale >> 8);

 	/* Init the device */
-	oc_setreg(i2c, OCI2C_CMD, OCI2C_CMD_IACK);
 	oc_setreg(i2c, OCI2C_CONTROL, ctrl | OCI2C_CTRL_EN);
+	oc_setreg(i2c, OCI2C_CMD, OCI2C_CMD_IACK);

 	return 0;
 }
--
2.43.0

