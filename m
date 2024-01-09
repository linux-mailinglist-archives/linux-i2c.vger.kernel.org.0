Return-Path: <linux-i2c+bounces-1241-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 551CD82887D
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jan 2024 15:52:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C3D01C2460D
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jan 2024 14:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E7A39ADB;
	Tue,  9 Jan 2024 14:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kBvGGRyf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386296D6EC;
	Tue,  9 Jan 2024 14:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50e7d6565b5so3289776e87.0;
        Tue, 09 Jan 2024 06:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704811923; x=1705416723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WIOUb/aBIlK1Nf+/sJcceLe8u9RDBXYQMUJNkLqF+jk=;
        b=kBvGGRyfky7GrurWDX3sTlqU/V4bVhWWGb41lxDIm9gg9cq3aCKZ4YonCNuai9tigQ
         Ao8DMacb0jqjdWcDvXqhmaTH11nvk11GXy3EMlN13wlgClDPdmfiMXXTkYrdwq2wAu8y
         hoXgQqcoZucMba0V7FthaH3r00qgZnkObx8SZxWr+ywoCyck65/8pNRfv00/K55q94r5
         FHVSExySpLMxlEl5ThpMxQ9gOFaXMWtuKmZ8evhV2Rwyf2ll6qi1AP1FUQKuoRAZ8VJH
         BR+D98H0CtNVBnhWxp1KI93nlnS6YkJkCCybDYJvU7UPUYHcMqWqrmF87GTlT6CEfOCU
         I+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704811923; x=1705416723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WIOUb/aBIlK1Nf+/sJcceLe8u9RDBXYQMUJNkLqF+jk=;
        b=nj8hCsLUeCkDqNjKtS9POELu21DGcgcrFDrtQhtoeWeyunICcyp1aCtF4v5Ca/jAj3
         9NmBXqRZsVv49NYUnTRFTjjlVizDI/4+z4mB0f5XXW3NX4U3/7upvQIiUhUVGkAi2JVp
         EVqVot5JEs09Xl6wyJLo0MZSzw7gGl/fx/g4t63ZW7gexCU1HBVUfdKCKgygk1YIV1nb
         vMdqbWASdiuizLHssrZqLUO9cMyNKvysLzLeMi2XSGBHjI7frMGMmxP3OtsDsr2/UT8y
         UMRmzmogm1a6NhOU3Io2ixbuEB/dXsCG4ODkMERdr0nIKUTbby1TQZEZUCTKLgI1/ORo
         16/A==
X-Gm-Message-State: AOJu0YyuI2MknSkeoOnXyZtfSGi/OiCFfe9QfSTmumh+1cE37Aq3RhZu
	uG9IZYrQAMDAXFFVCQSwyKg=
X-Google-Smtp-Source: AGHT+IHX4Hq5rPkeD5504AXZ6QnaSXBzBZrfEtWVv3iESmgI1RSzHQkbpF0lv43UZIzg/VylkcQF9w==
X-Received: by 2002:a05:6512:20c8:b0:50e:6878:a70b with SMTP id u8-20020a05651220c800b0050e6878a70bmr2104873lfr.54.1704811922775;
        Tue, 09 Jan 2024 06:52:02 -0800 (PST)
Received: from rand-ubuntu-development.dl.local (mail.confident.ru. [85.114.29.218])
        by smtp.gmail.com with ESMTPSA id b13-20020ac2562d000000b0050e7f5cffa6sm369150lff.273.2024.01.09.06.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 06:52:02 -0800 (PST)
From: Rand Deeb <rand.sec96@gmail.com>
To: Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	openbmc@lists.ozlabs.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: deeb.rand@confident.ru,
	lvc-project@linuxtesting.org,
	voskresenski.stanislav@confident.ru,
	Rand Deeb <rand.sec96@gmail.com>
Subject: [PATCH] i2c: Fix NULL pointer dereference in npcm_i2c_reg_slave
Date: Tue,  9 Jan 2024 17:51:21 +0300
Message-Id: <20240109145121.8850-1-rand.sec96@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the npcm_i2c_reg_slave function, a potential NULL pointer dereference
issue occurs when 'client' is NULL. This patch adds a proper NULL check for
'client' at the beginning of the function to prevent undefined behavior.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Rand Deeb <rand.sec96@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index c1b679737240..cfabfb50211d 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -1243,13 +1243,14 @@ static irqreturn_t npcm_i2c_int_slave_handler(struct npcm_i2c *bus)
 static int npcm_i2c_reg_slave(struct i2c_client *client)
 {
 	unsigned long lock_flags;
-	struct npcm_i2c *bus = i2c_get_adapdata(client->adapter);
-
-	bus->slave = client;
+	struct npcm_i2c *bus;
 
-	if (!bus->slave)
+	if (!client)
 		return -EINVAL;
 
+	bus = i2c_get_adapdata(client->adapter);
+	bus->slave = client;
+
 	if (client->flags & I2C_CLIENT_TEN)
 		return -EAFNOSUPPORT;
 
-- 
2.34.1


