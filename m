Return-Path: <linux-i2c+bounces-7121-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D109F98B46A
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 08:31:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 058061C23482
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 06:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 792881BD018;
	Tue,  1 Oct 2024 06:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aYHZ2ywc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC39D1BDA97;
	Tue,  1 Oct 2024 06:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727764199; cv=none; b=MOriK80tFmeOc7Wcs+Sg76fzLRNPVnvP9Ya86dw3zfW2Zo/gsrpYTpYOZ30RH0hssg4iqrMzWWOVd64d+qITdH7Lgf7iRq+DbFk9zojxOdyoGqh4uKJR13fJqzVGne29EK/dL3dMoF7BSAAEyhYhgcgQLCAoA89QIEKYzr6pOY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727764199; c=relaxed/simple;
	bh=FzFLPt/0JAGGGSdk8dm26jWdm7n54H3fssDUKBnwl9s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=E9KYjWIehObJBdlO+ZoKv8+Un9FCwGEA16RzFwosZVARIuKZUksrBSBe8g6lo3WpvcEuKK6ZprpfrgFUx1IX8vCclpWUMnMk9Uh8MooIpaZGZBaQdN5YzNKPd9ZFwFB7/NfpF/tPRYjgaJRd72SxNNo1zR1ywj5IETnazJfIizk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aYHZ2ywc; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7ae3d7222d4so4419549a12.3;
        Mon, 30 Sep 2024 23:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727764197; x=1728368997; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vCToa1pjp5BirUNjWfkXpacYwQOG9xkkvltlLzTKSjY=;
        b=aYHZ2ywcSbgZuMCAI2E9zrIo6lXPvLOukzNvM9AfkN/oWT6KbDEE9JHTH9IX8iYt96
         A3Nx1knZ+o9P73hEy2rGOUibABF2MubJXKak+vgvySS3a7/KnW2daKbChPyrastvXLwU
         +mpcBUxidJefR3ZxHV6KvS6GF9AR8SrvWIjkLDsLZljaYRNIAsQib/GBbvt0GKztbf0d
         g1QR9gW/SXST2mL5S7Qc+DlXdWdZ2ryrN+ovVi2Epj09ozbzIe7O0fGScGLgEGUPbSia
         ILUxfojZyCc8ezLYHei74R60XUFXNP1BaQx1YYC/0VNuZeVV2QpzHGm20i61e8zq/oVZ
         0sOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727764197; x=1728368997;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vCToa1pjp5BirUNjWfkXpacYwQOG9xkkvltlLzTKSjY=;
        b=eVtzUzLn491q5qmz6/hnPjCwkgFJqKJ7O+gX3ZVfFRsuPdrgKwLcYFZvh1PzLKuk/c
         pY+qQdrdgMlgwHBZTCx8y7VgZKj0UiQUVNahfdMDr0ZyYQbj/Nbnfqmgi0sKIew6dCcq
         5xZrgLt0b75gf6s/NY9QcFEpTyMfh8waBE+oFeGHYSHodid0T3h329WFfqJ0FepyOy4v
         c31PEQOM8lVY3/TV3GcDu02styauRxhi/Dp9TfY/K0d49S01yPuV82K8SITHtah60XeL
         tKid6Y5o5IpdVKcX4WVSZWVK4oJP2vMXmBAIOQY1bh+CC5kbziPY380TQgOjidHc6QnV
         NV7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUJImqFV5Z1NCM4OgTamD7h4IfTgsx0Tll+7eqcqgtIQdSRsx4F5qWyEuiq1Ag7fIidaRNoRMDwYNI=@vger.kernel.org, AJvYcCXhegEpHVIxmHw/NyzkwgDzrCFlkXZwSsES18/fdcNBThNAiHoFRGA2akgmqaF9n6PkNZI9GSh0grpVqYRr@vger.kernel.org
X-Gm-Message-State: AOJu0YxlZz1hMHyGNq5drpE6VpPPG3lbw8S/qp5K2Bo+OsOWb5t9kLNK
	3+XVh+xsq2Jw4y/s27vJJo/9EL8sto55oxsrzURaglkZ8dgXVsPi7oQ6nAY=
X-Google-Smtp-Source: AGHT+IFYXUPQMked64r/OKkWQ4ip1SeDQ9qqr8pVe+NEbLmATxtjewrRe7p5N32WGEjBTzYrpoL6rg==
X-Received: by 2002:a05:6a21:e85:b0:1cf:37f8:7a1f with SMTP id adf61e73a8af0-1d4fa6358b3mr21680011637.6.1727764197089;
        Mon, 30 Sep 2024 23:29:57 -0700 (PDT)
Received: from localhost (2001-b400-e30e-7f15-c94a-d42b-025a-8ff3.emome-ip6.hinet.net. [2001:b400:e30e:7f15:c94a:d42b:25a:8ff3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b264bb694sm7313243b3a.65.2024.09.30.23.29.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2024 23:29:56 -0700 (PDT)
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
Subject: [PATCH v5 6/6] i2c: npcm: Enable slave in eob interrupt
Date: Tue,  1 Oct 2024 14:28:55 +0800
Message-Id: <20241001062855.6928-7-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241001062855.6928-1-kfting@nuvoton.com>
References: <20241001062855.6928-1-kfting@nuvoton.com>
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
index 2ed69e92edf6..90a6e6842c6b 100644
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


