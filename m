Return-Path: <linux-i2c+bounces-6892-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B525C97D41B
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 12:19:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D8DC2856B4
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 10:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 430A313CFAD;
	Fri, 20 Sep 2024 10:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bSRJSWiw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9041428E4;
	Fri, 20 Sep 2024 10:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726827516; cv=none; b=JcDHUgqPLrbmOsVTCPPT9UozsXuJ+LLvYCBzxWoFvOuMjg3dcaUHmOzJmSUxnon9BSam759Pdje3BlSQi3lUsEGgU+X9HsKZ+JX2vbsq+OG0j6K/Ben3Z/wH+a7AAl1vTrBljkrXnu1TsqBLBmPpJYrMWNnLB8MAurkrIKnPcQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726827516; c=relaxed/simple;
	bh=iYCX3RYL/EHVpLJdEhvdt2zVPvzBLqXunrCXVnQgazY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=YyG3VNBavAd4PTJlS8VLNTCoYUHIS1m+YzlB+zLdaXC5PTONCxovi26RZbCxmydr34aiKZsNSNN3T7yPTFElAH+h2+9z2KghzuiGtdK+Zvp2tL8iQoXH8PQFU0JGtiHPzqTQcmS5i8aOvaKwCEAswIKRV2+xC6C7Qxcm2de8SOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bSRJSWiw; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7cf5e179b68so1619802a12.1;
        Fri, 20 Sep 2024 03:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726827514; x=1727432314; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b5x6COaWYuBZ+I/ktGSPVnQK2t9IfKl2Gymo5GZUYVM=;
        b=bSRJSWiwCzTOvGwo8D6L3V96PXAJFmeOjTaUnwz+0/e0yu3kQea9B24xXduS2j1k9d
         zZpCXrvvu0ENHDBz6oQvUVvuLusESzvKR19NNroiAXS+IphC3ZZOPgGjdgoo7+BOz8Xx
         N5da3xRsk2je/rfpegQhCAeqBhPnDiLmn7831WCdK50sl7MMA4uUjw/lIXf8hwCejSRC
         uk+tBQH1mj3hajTxe4QPAWNJh/mybb+/HG/VwJCjLY4hbmxjJX5y5DDrqvisKk+eYLXi
         lOv6g/G/D0Fj7gEAXdPUqW1v6q8ZWHQi3obsynKhG06C8pshFC3+3rcwQPyhzdJ3tk6g
         sVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726827514; x=1727432314;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b5x6COaWYuBZ+I/ktGSPVnQK2t9IfKl2Gymo5GZUYVM=;
        b=ovzIAr5jJkEsh0nU6cR41sStxCBR7YQburUh77EwYAmBC8B7T48T0AKTZTEpd5l/Ge
         6W0NUEUZSP2K2NM9ADAkC3qsocA2WRGD8jQgE5PbHAVeCph6RssbVm8q0BA5PBUDlmIS
         Dr5TgCl0htNIvMlLJYrApZDBINnl2wxIdT3qvWe1Z13QYkDZVndy7eqx3izH7BiEJzyV
         Cxt8mhNwPjjHbu4nXKvcFNQJgmo77PBlcvzi0Pz5axeV9WObxV0uJP65AhX5xAmKY9ki
         1R//q8l7nXyCXnuFcmX+FNbcFxJQlJ/gi67wNo0rv5+S+RxM116BCEEJGYEpKb+oamJd
         rigA==
X-Forwarded-Encrypted: i=1; AJvYcCWgR3xOfsOkBJEq+oEXRWLFdnbUM/yzoE0z9o7ruqNjJtM6YEfXr5xVXMYu1DbGOCLoxUYiYQFMFcLQM3Sx@vger.kernel.org, AJvYcCXIeEOqcSzCwkcwXk+RC9eXZVqGU3aAxefCz6B8+cGm8Va8X0USjKyQZkRzmK/HkVhEijWNmUT7UfU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjJ9V3AtihZlvUnCG439mGM9ti1OZsJNMO/MJKEef87b/GVaJn
	Jmt9WL4pfsLeemtqREInCtnUx16Gn+4dA8iLy+T8TAoBcd1wQSc=
X-Google-Smtp-Source: AGHT+IEHwBHrwTHTEv0Pp/iXOeAFo6lVrY7n+mRIq3slFlGs00IXkri4xKe99XIYbrrJH0TpeFpgOA==
X-Received: by 2002:a05:6a21:83:b0:1ce:d403:612d with SMTP id adf61e73a8af0-1d2fca71fe1mr6873701637.13.1726827513723;
        Fri, 20 Sep 2024 03:18:33 -0700 (PDT)
Received: from localhost (2001-b400-e35c-9cc2-447a-d760-d4f6-01f4.emome-ip6.hinet.net. [2001:b400:e35c:9cc2:447a:d760:d4f6:1f4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db4998b4f3sm10636251a12.72.2024.09.20.03.18.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Sep 2024 03:18:33 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/6] i2c: npcm: correct the read/write operation procedure
Date: Fri, 20 Sep 2024 18:18:15 +0800
Message-Id: <20240920101820.44850-2-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240920101820.44850-1-kfting@nuvoton.com>
References: <20240920101820.44850-1-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

From: Tyrone Ting <kfting@nuvoton.com>

From: Tyrone Ting <kfting@nuvoton.com>

Originally the driver uses the XMIT bit in SMBnST register to decide
the upcoming i2c transaction. If XMIT bit is 1, then it will be an i2c
write operation. If it's 0, then a read operation will be executed.

In slave mode the XMIT bit can simply be used directly to set the state.
XMIT bit can be used as an indication to the current state of the state
machine during slave operation. (meaning XMIT = 1 during writing and
XMIT = 0 during reading).

In master operation XMIT is valid only if there are no bus errors.
For example: in a multi master where the same module is switching from
master to slave at runtime, and there are collisions, the XMIT bit
cannot be trusted.

However the maser already "knows" what the bus state is, so this bit
is not needed and the driver can just track what it is currently doing.

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index bbcb4d6668ce..2b76dbfba438 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -1628,13 +1628,10 @@ static void npcm_i2c_irq_handle_sda(struct npcm_i2c *bus, u8 i2cst)
 			npcm_i2c_wr_byte(bus, bus->dest_addr | BIT(0));
 	/* SDA interrupt, after start\restart */
 	} else {
-		if (NPCM_I2CST_XMIT & i2cst) {
-			bus->operation = I2C_WRITE_OPER;
+		if (bus->operation == I2C_WRITE_OPER)
 			npcm_i2c_irq_master_handler_write(bus);
-		} else {
-			bus->operation = I2C_READ_OPER;
+		else if (bus->operation == I2C_READ_OPER)
 			npcm_i2c_irq_master_handler_read(bus);
-		}
 	}
 }
 
-- 
2.34.1


