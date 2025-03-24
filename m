Return-Path: <linux-i2c+bounces-10005-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 947ACA6E4D2
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Mar 2025 21:59:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E789F16D3EE
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Mar 2025 20:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC4151DE4F3;
	Mon, 24 Mar 2025 20:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OywqGw04"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDFC1C863D;
	Mon, 24 Mar 2025 20:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742849955; cv=none; b=M6Oyq2qW1//ekTT6z+hRRAjA+vH5190VEWmQ9JJxpJqAh3+nP5rvp2wnduVG3Dp8P/O0JaCOZSUPanymDtd1uUV3ekYUGZqlPBivoYS1LFqLm1cegmgvmWb/E0n/XTGHqTupftee8JLDEP77XBgDXE9XOh+VbhHRU4KUi3pkqVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742849955; c=relaxed/simple;
	bh=asju3rQAo04YCdntHD32ptXxWghMUqK9pcJv+rfzMaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fCuMGRbBLraR8WYcR5sodv9cZI55x/hIA/sIey3zFTt4mdJL8yWaAXmK9qBQT0wQ7i+OZsdutETswWjDoKVtPRTX+mBeGYMIUCDpe2AdjSo9QgiWH2K3dkhhhdLiWIGy3q2cixnMqJj1kgnxQIrl37b1huglMHvfvgXDq3ykepE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OywqGw04; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-226185948ffso92911685ad.0;
        Mon, 24 Mar 2025 13:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742849953; x=1743454753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRDcngEUjIrRz5dFZAAL9+m4qEIjY5kJnMxmUbBbxFM=;
        b=OywqGw04YHuGnyUee1kclSM0IVMbMXTr+LZOiEKs/SzEzp5+3mKWFsRjnDLzAM8VTo
         8mZXGpMECsKNteAJxyAri+HigF5rJqsrMxVMELgPwCDhvaEuR28s9tG2j2yDSI/q1z4Q
         gEvpZLtGqyagIMwbfYQCxaNI7SyQ5bGa0YoZxc8h5d1EhSesIvwsoED+/BVnW7tejXF5
         F5bH+W773Q8JR4/fwmSczkenLyiZ1Mohc9HDL3h0892Mj+c5cyWOliotZOJcoK38u8zi
         ZMyaKTDoSFz5fTpV06D5GeVfc7B38H0QtZQ6z/kp3eysjL2lyQxlXPef0kyifUkIrgCO
         Bbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742849953; x=1743454753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iRDcngEUjIrRz5dFZAAL9+m4qEIjY5kJnMxmUbBbxFM=;
        b=EYYpIYiZ9/29n/zdxrxuSm6fd515WYA02X+aQ4P4I3bmdz6/DhbYEtX2XSxvLgwCJl
         e6XxMvZS5jCHKjA1XVCDE5u5Z3U1BhF2bbev+DWETndAxPIMQLCJTUp12Dx7AlyYpx1x
         x6Jeg0HxVSgEwMwcnNn9ivbVFs/dmtlm9bLis1d5buTrzKbCB1+T5jzRIfMRoZ61ZM2c
         t2A/ZnZpIQ98c9juDPwlG6S6C8fU3mZTmu0Rhs4CiJ25RWDJ7hxaEuJf5Nyb2DOP5xna
         N4QdIpvwwe/kzsmxuFX3XMLZp6H0f4xJ6z0Jjc9IgiVFBbIVMkV3EquV2RT1CRQwY2lI
         4E5g==
X-Forwarded-Encrypted: i=1; AJvYcCU3ou0kIbtdI/mhr2ZCtqWHKXmoar5L7ouFQ4XmxkplSVlwXTz2ZhQg+2BuAkHHrQnZ9gQLGr6CGdc=@vger.kernel.org, AJvYcCXHTbeysCkc3SDMaucI9FNZzimbPVZLGyc+GJofedacddhbakHbjbxbtAgMIY7lNWN7X9C6SOxJXUMgGjv5@vger.kernel.org
X-Gm-Message-State: AOJu0YxCQPA0XEbI4Y2bH3eXMKHmW7B4Njxyz/wInNInWSNhIUV95Qiv
	7UuI1YMttzs3Jv09skjbF8yNFzaF5zmtXRKAz2jfYMw6cIs5CiJ0
X-Gm-Gg: ASbGnctaS3q/9XG3gGv2r/7vKGUBWfybbyqdfC4L+M4jk4muc+L0tOjn1sooYDep/Lu
	A1Oa3aOkGqMOcrmsfSnN3PUJH89DDyF7whXeByjUGfa5RiD/ofhbbnQoFm/WS17CAfCxt58jS0M
	sdwkZOQynhRtLM7iFe2y78qqxjhdab4KqndCPsyTHdpC3goK6U3zt0XWUzAvXDOAWDJORn8ssjf
	K6jan6gGszWMhZkYJMk3FXP7W0P+UZ3mvYXZaS6TPePOqg0Cib9O87bgToqqHr5oTjudyItWeGc
	yaTZgitGiyf7sA0SVqYZpXhB5XbyIe0E5pfs04yWz6iKJLGI/QF2v84XkbaqDg4FUncuvASfttp
	/z9mMryXLebMqkwg4pP/WwpgXPEu663xxbzyXal8tKg==
X-Google-Smtp-Source: AGHT+IHkr2sTzQNuh0LuuVwrL/ch5KdFMGZS1R3V3qsOxZmXsMv1kTGG1KRM7YCEP4lJq/mAzF1wCA==
X-Received: by 2002:a05:6a00:1886:b0:736:ab48:5b0 with SMTP id d2e1a72fcca58-7390596681fmr20612552b3a.2.1742849953101;
        Mon, 24 Mar 2025 13:59:13 -0700 (PDT)
Received: from elbadrym.c.googlers.com.com (34.125.168.34.bc.googleusercontent.com. [34.168.125.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2a4e8d7sm6537479a12.72.2025.03.24.13.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 13:59:12 -0700 (PDT)
From: mohammed.0.elbadry@gmail.com
To: 
Cc: Tali Perry <tali.perry1@gmail.com>,
	Mohammed Elbadry <mohammed.0.elbadry@gmail.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	openbmc@lists.ozlabs.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] i2c: npcm: Add clock toggle recovery
Date: Mon, 24 Mar 2025 20:58:59 +0000
Message-ID: <20250324205901.1274708-2-mohammed.0.elbadry@gmail.com>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
In-Reply-To: <20250324205901.1274708-1-mohammed.0.elbadry@gmail.com>
References: <20250324203233.1266772-2-mohammed.0.elbadry@gmail.com>
 <20250324205901.1274708-1-mohammed.0.elbadry@gmail.com>
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
---
 drivers/i2c/busses/i2c-npcm7xx.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 3ad6124be80f..78c85015d955 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2043,10 +2043,14 @@ static int npcm_i2c_init_module(struct npcm_i2c *bus, enum i2c_mode mode,
 
 	/* Check HW is OK: SDA and SCL should be high at this point. */
 	if ((npcm_i2c_get_SDA(&bus->adap) == 0) || (npcm_i2c_get_SCL(&bus->adap) == 0)) {
-		dev_err(bus->dev, "I2C%d init fail: lines are low\n", bus->num);
-		dev_err(bus->dev, "SDA=%d SCL=%d\n", npcm_i2c_get_SDA(&bus->adap),
-			npcm_i2c_get_SCL(&bus->adap));
-		return -ENXIO;
+		dev_warn(bus->dev, " I2C%d SDA=%d SCL=%d, attempt recover\n", bus->num,
+				 npcm_i2c_get_SDA(&bus->adap), npcm_i2c_get_SCL(&bus->adap));
+		if (npcm_i2c_recovery_tgclk(&bus->adap)) {
+			dev_err(bus->dev, "I2C%d init fail: lines are low\n", bus->num);
+			dev_err(bus->dev, "SDA=%d SCL=%d\n", npcm_i2c_get_SDA(&bus->adap),
+				npcm_i2c_get_SCL(&bus->adap));
+			return -ENXIO;
+		}
 	}
 
 	npcm_i2c_int_enable(bus, true);
-- 
2.34.1

**Reported-by: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>**
**Tested-by: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>**

