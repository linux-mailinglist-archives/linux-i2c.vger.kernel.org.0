Return-Path: <linux-i2c+bounces-5945-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E99249655F8
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 05:50:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F4391F2423D
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 03:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 642C514A4DF;
	Fri, 30 Aug 2024 03:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P2adroIa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7351531C3;
	Fri, 30 Aug 2024 03:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724989756; cv=none; b=gjuyPlU1fNpsqoqgLIEXbuI2cOj+2lo35wWsl3mGS72apC6kZFjWE4Pbe0Y7V9/Kib5XiclChNKStGkmFOCmX21f1KzfyCKxfUcxOs7p1uhBd4yUl8Ho5vHQG7gHrjHZiG1D8VTCwR20tsllIoM2cH328zWD20HErSlNzAQ+WYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724989756; c=relaxed/simple;
	bh=GyGJDuotmpT+T6oQysyKHcd2ws3AuvjX3ZNsznw/iEA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=FqpZTZyfnvwqhMrFwm3Fu0VsdjCkywwmIClqHCu0BS/BX2CKG8eaEl5gwtc7I8yTCZfv7vKLuFHLRPgJ/v7Ioxm1qiA5CZabTT1VaC/lfqBuDQATMkKtr2r8Ps9YIxmpdPGN88Ny+LlMSBcW/6zXHbVa/+X6jjqjkOi28lNPM+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P2adroIa; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-201f2b7fe0dso11574505ad.1;
        Thu, 29 Aug 2024 20:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724989754; x=1725594554; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R1w8U38LxbqsHMWFXxaIYW4AXwoQS5Rj9y5ARnmh8Yw=;
        b=P2adroIa6Wlj7GO38zejHgGu9nqgvPj54fWE5uhyCE8YRkH+Yij3VJTxRuk1vFZFqL
         +XoYwvkLf8w4JeLHVSIZJ07WsJ0I+GiR47/S3CXvq6cP8bYSbeLHMweELV5wTVNx9oOd
         ywgDwUrqxaUDobuvI+L9wmllmHgfTeczRBmHTrgRawI7hkfkwzdI4yqYyQbZPGWouL4k
         vUZZN7w3O2FvDcDTjq9lgWwWxOWrYxh/v8kaJ1Pj/3dpKF5tK/2uMqZrNZouP5nMgARr
         Wsz4+HOu76kLgQakniSYheSD3u12DVDKEAHtLXrheg5lzuWtTlbBLIArPi2qgScUbnrO
         rxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724989754; x=1725594554;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R1w8U38LxbqsHMWFXxaIYW4AXwoQS5Rj9y5ARnmh8Yw=;
        b=K1tZR/yanZYF/q4ORBler49ayO0Y/gB6bvceTlsJ/cRw/6J6Fu5TWlYZPZvJgQ0jsZ
         nIKc6R2f1EOKNRjLhReegBZf1O1OTQjrwp3OKgRVPWgN03sVwoeAdR+tGOPDyjSfGJz7
         fhpL216DpRhkdXf52iAaoPLJbYhljLrKQK4I91z93cqTnOorWiQCE1ni1nkhP5lu5jpq
         t8Pu409VyKDU3GCmUNWKYpGJIcyC80rEPXPYL7jZD/FHvnW/NDZrpskXQ1qrk9F5e0ox
         FSgXJjB8oTZV+H1nNPKoyZRJKnnfik1lCrUXalmTWIQ6y+1qTKBuRSnOfDekfsS18wWM
         9C2w==
X-Forwarded-Encrypted: i=1; AJvYcCWdcPHbfYjM/SIUaPfEiLGwNSPltd2WDxI6Qt8U/vYQ4GNH2p4jO9qzYsyi2EE6xjPrFTMa8hgrdRQ=@vger.kernel.org, AJvYcCXstXQ65bc1kTZ0hPqHoD7B0t9TbCC/F65dUafMCiFQtGcGFuddm8P37ugkS1CokXrQpxsBGla3ZDrdOV4T@vger.kernel.org
X-Gm-Message-State: AOJu0YxCvQ+i71CsgC370yizP7EQB79ziTIUkSN53GCz2SiCmavkTxIX
	L9dPngCOTbyS8MzSbGgWePgIhcADXJI2b3mghsfWjRr79uzEOhw=
X-Google-Smtp-Source: AGHT+IGrJD1LOrRYZRsGSK8KrWyqBhIIUuxqyDXZM8UZXfrS+XZ4T7TqZJ1nRpyYmsA8M78lXul8eg==
X-Received: by 2002:a17:903:234c:b0:1fb:8419:8384 with SMTP id d9443c01a7336-2050c37255emr62935835ad.13.1724989754013;
        Thu, 29 Aug 2024 20:49:14 -0700 (PDT)
Received: from localhost (2001-b400-e338-dab5-746d-1a82-f21e-bb0a.emome-ip6.hinet.net. [2001:b400:e338:dab5:746d:1a82:f21e:bb0a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205155452ecsm18259455ad.219.2024.08.29.20.49.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Aug 2024 20:49:13 -0700 (PDT)
From: Tyrone Ting <warp5tw@gmail.com>
X-Google-Original-From: Tyrone Ting <kfting@nuvoton.com>
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
Subject: [PATCH v2 7/7] i2c: npcm: Enable slave in eob interrupt
Date: Fri, 30 Aug 2024 11:46:40 +0800
Message-Id: <20240830034640.7049-8-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240830034640.7049-1-kfting@nuvoton.com>
References: <20240830034640.7049-1-kfting@nuvoton.com>
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
---
 drivers/i2c/busses/i2c-npcm7xx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index cac4ea0b69b8..5bdc1b5895ac 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -1781,6 +1781,12 @@ static int npcm_i2c_int_master_handler(struct npcm_i2c *bus)
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


