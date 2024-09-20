Return-Path: <linux-i2c+bounces-6897-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB6D97D42A
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 12:20:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55F3EB22E34
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 10:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45631152532;
	Fri, 20 Sep 2024 10:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MOCbzs3k"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF56713DDC2;
	Fri, 20 Sep 2024 10:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726827540; cv=none; b=B14niUCf5vTn6hzrBVSFUHyU+jx/DwhKV6fZ4gxjPCT5w+TJs3/g2TaApF8ouKFZOup21qlxwH3s7ZSIuah3Owshkh+8F+bfcUqBC2uagk8grHMWap99XZd2X0AiNpnogIrtZT5C7NzbKEpyNR3LI9nI4fYFkqvfjr41geWL5SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726827540; c=relaxed/simple;
	bh=gvKR/LNghQAQ4Rj9o8ccB3IHJzGgbJQW1c9wlwaTIC4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=DbkxyHEZFO8HjcUkN2k891hGHgdaYwVuwxnQKvyn05u2zo5HVXkVLEl1UDJ6ZCkcjJl3rURAfEJPZOpVbhW1iavqE4TIaxN9ugehgArtlEHRjS6E3AE7hhNJA52fKwqEgFU9lUhIESK2cjkkqXU8Gx2QvLRrFJOy4/2nELOfw4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MOCbzs3k; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2d88690837eso1647718a91.2;
        Fri, 20 Sep 2024 03:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726827538; x=1727432338; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MOSQS2phhZy9vhfSdqHxVy6juQR6vrzN7E2tXsy++5Y=;
        b=MOCbzs3kHVg7AcL2Gdru/A9Bb6on3Pn9wbNqtRKhlRlewMkdl7hqRMQ8z0Qv+clqZc
         5xL7Hi9UOBpidJ1JdYHpCZcMj7LqaY9fpg08NagbmlBR1Me1NkuO/lSoApObQwXaNI66
         uFTyChU8e8jKPV+xuWaUGbYFzhqxNEqvOq6UDA1OTCrad+TUOed61menGq9hZ5bO9JN8
         k4yA6zOvgO2jSpa+o2GZqJV/sggG5hsWZBSKs3N7QWSwISeRgx8W2LusSW3wYQ9hI5UA
         ka/MMHx/UmM5DK00wSv72FZhmIPlwQSi0HTywswFiwRTGJruLxAEbnIGlzoFSX6GojGS
         eTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726827538; x=1727432338;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MOSQS2phhZy9vhfSdqHxVy6juQR6vrzN7E2tXsy++5Y=;
        b=lSGLjYEaqp2mXGA3K1fPbd4VowqYJjb4/sAa51aHVGb0FglFs5H9oAU0bVUDS59di6
         /lXsvLgaxl14tkrr1XIsQzXtusc09gMXxHFI3R5/EUgDN2ELd+ApLCezykK8rPJ7J/Qz
         uE1xoGSUB4zhwTNb/Tf+GC4AHzg+G/2EbZZByBAJ4H93z4bZbDI2Mc4Xy16zNJZbeEe5
         3fvVhpuIXoHxv1g1GvKCC61BoQwZ2SSU/rmRofcS7yX0rGtNAZFQ0HQQu/R2/eA6QUt0
         023en3iNShTVgiJCSOO/VoBh9RWdH+fnCnGvydWbNcEVlRWwi5Oqa07e625mNVEhaqnv
         iO3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVnHZTZcPTZMvTYsj6fRuRUr8ERG9N9mUXjG5EOwU+cIZFPrr3kfY6Q0hdwEP0T/WheGidIEpizqCI=@vger.kernel.org, AJvYcCWnG70oKE54QVFi/CC37Lyz8cCDfYfEgy0lq0/ra82fKCFduIjvZFfItpHSUt3vdOGro3g/s6ZI6y/Gzl/w@vger.kernel.org
X-Gm-Message-State: AOJu0YwV8d2Y/iamkHsDjhdiq3X1Vu9GEI458Y6vsHgFjDknv7YDK6XX
	Te+OsDLUzNdT8oI7v92Es1RumW8nd29cYegSXXyFim+S0rEhx3o=
X-Google-Smtp-Source: AGHT+IFG40FXFa7cL/Nwmch53MN0BC+f2vfZG29tfUmd80whMxH/9pjTgZnrwZksfCx6vZxpzJKgrA==
X-Received: by 2002:a17:90a:9313:b0:2d3:cd22:e66f with SMTP id 98e67ed59e1d1-2dd865e77e5mr1171550a91.9.1726827537966;
        Fri, 20 Sep 2024 03:18:57 -0700 (PDT)
Received: from localhost (2001-b400-e35c-9cc2-447a-d760-d4f6-01f4.emome-ip6.hinet.net. [2001:b400:e35c:9cc2:447a:d760:d4f6:1f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dd7f947427sm1487476a91.48.2024.09.20.03.18.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Sep 2024 03:18:57 -0700 (PDT)
From: warp5tw@gmail.com
X-Google-Original-From: kfting@nuvoton.com
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	andi.shyti@kernel.org,
	andriy.shevchenko@linux.intel.com,
	wsa@kernel.org,
	rand.sec96@gmail.com,
	wsa+renesas@sang-engineering.com,
	warp5tw@gmail.com,
	tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com,
	tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com,
	JJLIU0@nuvoton.com,
	kfting@nuvoton.com
Cc: openbmc@lists.ozlabs.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Boyer <Charles.Boyer@fii-usa.com>,
	Vivekanand Veeracholan <vveerach@google.com>
Subject: [PATCH v4 6/6] i2c: npcm: Enable slave in eob interrupt
Date: Fri, 20 Sep 2024 18:18:20 +0800
Message-Id: <20240920101820.44850-7-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240920101820.44850-1-kfting@nuvoton.com>
References: <20240920101820.44850-1-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

From: Charles Boyer <Charles.Boyer@fii-usa.com>

Nuvoton slave enable was in user space API call master_xfer, so it is
subject to delays from the OS scheduler. If the BMC is not enabled for
slave mode in time for master to send response, then it will NAK the
address match. Then the PLDM request timeout occurs.

If the slave enable is moved to the EOB interrupt service routine, then
the BMC can be ready in slave mode by the time it needs to receive a
response.

Signed-off-by: Charles Boyer <Charles.Boyer@fii-usa.com>
Signed-off-by: Vivekanand Veeracholan <vveerach@google.com>
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 9d533873e477..aa3310afbf6d 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -1925,6 +1925,12 @@ static int npcm_i2c_int_master_handler(struct npcm_i2c *bus)
 	    (FIELD_GET(NPCM_I2CCST3_EO_BUSY,
 		       ioread8(bus->reg + NPCM_I2CCST3)))) {
 		npcm_i2c_irq_handle_eob(bus);
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+		/* reenable slave if it was enabled */
+		if (bus->slave)
+			iowrite8((bus->slave->addr & 0x7F) | NPCM_I2CADDR_SAEN,
+				 bus->reg + NPCM_I2CADDR1);
+#endif
 		return 0;
 	}
 
-- 
2.34.1


