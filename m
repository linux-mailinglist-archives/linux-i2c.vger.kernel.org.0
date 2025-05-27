Return-Path: <linux-i2c+bounces-11145-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48712AC46AA
	for <lists+linux-i2c@lfdr.de>; Tue, 27 May 2025 05:05:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECFC43B5350
	for <lists+linux-i2c@lfdr.de>; Tue, 27 May 2025 03:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C531B415F;
	Tue, 27 May 2025 03:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mb0tKhqx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E38D1ABEC5;
	Tue, 27 May 2025 03:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748315129; cv=none; b=fgkOLfDK/obyiH13vDnv5GHPMH6BxzXyJP3rizZXQeBv3kCiiSS8nQmrS5zw56UcZJ0hyDzLWZUS7TCphHj2mZ/sMlWP+yJWbWenrS68LBkQkf/hexohhfCh/dZOptZkPgipiWIno7nANylHeWLhUGF8tuRMS0bcstnJV5evDOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748315129; c=relaxed/simple;
	bh=juK5tZdi8RsaiFxRk10fqCxfasF++8Sd+4K+Pbno3sA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aZe0NBT/DSJ3odT1AJzXNkFk0olQOLiAoE/54NZOKzMZBTrMozFWGljgr9rd2z5NQlVFrpPV4MTH8WirJovrCRa1BifZnPWpecATRglsbKN9gOy7yZJnSp4X6SfMpP826ZEh9UV4UrisNO1uecpTBSWhh0Tcx7MMQn21cX369V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mb0tKhqx; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7426c44e014so2132276b3a.3;
        Mon, 26 May 2025 20:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748315127; x=1748919927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=px18dyVutpW04jql0iY32hxuCKS/qRCICcni9mYoXKc=;
        b=mb0tKhqxSmgg2nPlx/HjrbeOimBvOp2hJgao0rSryUB9TsbyJeQwmHsNrmfhx8Lb1F
         C2egtPADCQnlDA3zQptFU+HuMSsO3O6YjqdSdIgGQ7YA48EtCSjWziq6gQufilidWTIA
         RgBWQvb0JkI//ByG2+qMMuPKVLtJswWhBntMAJ5EFzFFSPqSvUHnWnbRS+7EitVFLG1B
         eJ7Ut0apR49nG2JF6jYb0h6YwjaPaN4HMhXTUxcCgbs3d/VrhjgYdZ4uqdMYdMUD8GW9
         0AuIvfbr9zgPLVqbjbcKtr5Mmbv05Pw4KKkU9OKbh3yyw5jgZcF1+sRh09Iko9V/Fos+
         +09A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748315127; x=1748919927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=px18dyVutpW04jql0iY32hxuCKS/qRCICcni9mYoXKc=;
        b=EzUGGkRkvMTXZfRUBYjwehtVJgx/96mlC0Fn5X9Oh4g8bN14j0N469l3e2lmIzSJtx
         h/+/EfRJ4C3WvxG0K9bntjcoIqVcQXiAGUNmk2VexrrPaFcN6O6Lm6dr71e0ASP3w+/s
         o9bs7zbSfRqDifCjpNBvbp9me3Tv84Si0MCqGaFWqo0VcC9sP4tb3lVA5p244xoAC+W5
         HJRmuvSrBgwn3a0XZ+u0DnGoR3fRQ+TIlLU75nfmLuEjbwSNAw3jJgIsUzZqABXPPPJ3
         FPSY+9oxO7G2yedrwyEcluJuWtsylsHqF7TKy94s70x4I3iw0Y5n4KbT2AqWpVK4Ug5n
         obmA==
X-Forwarded-Encrypted: i=1; AJvYcCV3OoM0X/NPb2zfMl+4TBUAko9NLhM3iJvPvVtsd2lFPph4T1bIpk/H+Vo9FjB/07U//T9sBx6DBmA=@vger.kernel.org, AJvYcCXHPth0+jYVlhBj2Sdy4p874N9jguzdp7wSms9Am7MxUlIo0d+NFUparJZaUOrxcY1BOSoAQQWlILxTPvPD@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm9mrP7AVYDETHeL36kTU0EOftaYxHA9uT0t/wtpJp+K/5dJ/l
	nUyzlOKmFWObu/QP3sy/uFD+8aJSuHEumssoZPDQ3aOKOF9+vujlfFtq
X-Gm-Gg: ASbGncsbDwbLpEW5vClQ/vAhjtk/iQRxCHaX7TOJyIN82C71/WzU94uGbR7kjYAclI4
	L1w1dD2zBLv8e0vHUfom2rQxUd9eYIIrDJrpUrKfAmFEI4zF8oXHDR5iYZU1/+ySXFM0oIffwvh
	htDKVOV/HsIwGaoXOPMdpiySLNdi0ruZSX3pwWHOMsHgpFawGn4u3qt+L61JKrdo9zKPdNK47mb
	hJ8ZKsN0afEoMhO9MhiyZNIVb/dqrOujlSejwTc99FhDD/wtNFPDE+CzIjqaq5AJcZ9HHlKpGyg
	TikRcmTMOD2akT4DNhE2jI57Tf/jnUvFKwNmFKyKFTlDlv70InugAr0ZCsM+DvBb0IR7fDYLl2/
	glgodTT2Z24NnZxP2Bil5EpizdUQtM7fWHMqG0mWMdHJdSw==
X-Google-Smtp-Source: AGHT+IHmDWSNgOWD3RT3qzb5/6qFfdTgixyLmXH8JgP9ZhrNAHtazORpFUC9JcRw5L/IBtc0xjYmGw==
X-Received: by 2002:a05:6a00:1383:b0:742:da7c:3f27 with SMTP id d2e1a72fcca58-745fdb4c492mr16827503b3a.0.1748315126741;
        Mon, 26 May 2025 20:05:26 -0700 (PDT)
Received: from localhost.localdomain (c-98-42-219-30.hsd1.ca.comcast.net. [98.42.219.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-746029d0b57sm4532201b3a.19.2025.05.26.20.05.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 May 2025 20:05:25 -0700 (PDT)
From: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>
To: andi.shyti@kernel.org
Cc: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	openbmc@lists.ozlabs.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v5] i2c: npcm: Add clock toggle recovery
Date: Mon, 26 May 2025 20:05:06 -0700
Message-Id: <20250527030506.79191-1-mohammed.0.elbadry@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250328193252.1570811-1-mohammed.0.elbadry@gmail.com>
References: <20250328193252.1570811-1-mohammed.0.elbadry@gmail.com>
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
Reviewed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index de713b5747fe..4738fc450a6b 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2178,10 +2178,15 @@ static int npcm_i2c_init_module(struct npcm_i2c *bus, enum i2c_mode mode,
 
 	/* Check HW is OK: SDA and SCL should be high at this point. */
 	if ((npcm_i2c_get_SDA(&bus->adap) == 0) || (npcm_i2c_get_SCL(&bus->adap) == 0)) {
-		dev_err(bus->dev, "I2C%d init fail: lines are low\n", bus->num);
-		dev_err(bus->dev, "SDA=%d SCL=%d\n", npcm_i2c_get_SDA(&bus->adap),
-			npcm_i2c_get_SCL(&bus->adap));
-		return -ENXIO;
+		dev_warn(bus->dev, " I2C%d SDA=%d SCL=%d, attempting to recover\n", bus->num,
+				 npcm_i2c_get_SDA(&bus->adap), npcm_i2c_get_SCL(&bus->adap));
+		ret = npcm_i2c_recovery_tgclk(&bus->adap);
+		if (ret) {
+			dev_err(bus->dev, "I2C%d init fail: SDA=%d SCL=%d\n",
+				bus->num, npcm_i2c_get_SDA(&bus->adap),
+				npcm_i2c_get_SCL(&bus->adap));
+			return ret;
+		}
 	}
 
 	npcm_i2c_int_enable(bus, true);
-- 
2.39.5 (Apple Git-154)


