Return-Path: <linux-i2c+bounces-8626-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DED9F7808
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 10:10:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACC6B1896355
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 09:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E43222257D;
	Thu, 19 Dec 2024 09:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h6x3goTl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C843D222570;
	Thu, 19 Dec 2024 09:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734599354; cv=none; b=lMuF4orhBQrxtK/LEY/ZPVcKIAaHAwec2s/dRf1y7cKsLv8uaS1RsjC94BPuevqeZEx/qVMeHgYH+TvJQpZr9sgXMv8v0qQygE6qSf/lezKe0HJkwi2FN9GiWW4J275m5F7d/7Qb9bYIJ93U8qEjIMP++CGxhDZDJKcLbDCOml0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734599354; c=relaxed/simple;
	bh=PFIHSsZ4tZDzQ6Wxg6A1hng+1abgPyT1QlTDHa5uS+E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Iog5f/Jd0h45qNa1aVCjh+bmo1FNKhaSy2FrlWEjB6L5oFYlN7BfZ5ES1N9B15xhLOge79ev3A5KCd7FqqI7zow8BI8L0ivreVv36ZcFwsN+LgV+OmHkhbn6bteJlQgmka5CtUZxd8NhiIodgj1uzK5g01FRtumweTuSJNRLlMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h6x3goTl; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21628b3fe7dso4595365ad.3;
        Thu, 19 Dec 2024 01:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734599352; x=1735204152; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=piYN//2t/Q3gekIk2iV6YPjUEpOk8bMx3T+8iGXFsUI=;
        b=h6x3goTl8Qm4tntgsu4JPWRFd4fFZt9Lz6ae3/sQk5YFI6NIi7TUxC0FQq2dKTa0h1
         KAM2eCSXJDi9iTd53C8pjRqIkqdUg3RHrNrzBmqMX+x+N5V0Qpil/iZZeoejH4ydnTY5
         0SiuNhVNB3LCT1S08U7FConq8vBVsCarg8L2BVR6TrilnFzFheH3aAfBqr8CiGOL8FRC
         O4RVgkrIY+tUTT4CbQDZENnkOKGDhSsqVS9eKnIh2aMiPhVoLf8la+tUcpacNJdPMTV/
         kkRpOUOBZQoUel//jNEBIFLNtKZbQNJ5KgcuoeAOMykMHIQXYHAvkQas+FMzQAJnuCJQ
         2/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734599352; x=1735204152;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=piYN//2t/Q3gekIk2iV6YPjUEpOk8bMx3T+8iGXFsUI=;
        b=N7OCPdES857+OTUKZWxyUckGkaNv8HLaztsBQ++z7D4f5u7gmUm1ZR6l/5WVSZCFMP
         8d9CkHGlSJ6ZrLzWtqYPtIoggYzyxN5ZCjboILLcKBuAp1nzkc0x9Z3Ukqk2lL9MH/0A
         vYGE/RMET7sdrD5X8mYqap52LkSnaLav9OebzT7OLPP/QfwcqgoAwpFSjCYjzeu2tl3B
         Cls+kkBHnfaT/B1Fkf8FK2hPxFrklKMPd58KFRC9CN0Tfm9Mj8bhJTw2VXAmmeK3nM6H
         3AKBaIhnot+1FrAvP9/QZwuFK/C+AJi8F7Bsjju1jEST0JApYn2UBPQs1HEuUdtJUVHg
         ihEA==
X-Forwarded-Encrypted: i=1; AJvYcCWLkmXT3++rEYUl9ZuuGe4oxukiezk2kIOAkFvJjGFhLN5pN5nGLfZTAVkwcLYmdEEnJMWA8LDbex1S3lQw@vger.kernel.org, AJvYcCXNn30dI3XDqKJwGPXJiWAg5daEpvZKzldQySb7y8XSXQJ+o0Gkj+OXXuMu3VwxzYyWuzxQ1T+Ndis=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA2J9cxueXgwCuRBzGd9nvVQZaeM5m6q0msJmNJREjGUQIW638
	TSxsB0Tct7e5P8vna3F2TjO8QphzU8LVBIxGM8Mq3l9MBBLFFas=
X-Gm-Gg: ASbGnctx4kSJyBroSIUlBzSb211KnjEIqSwcYdeiq8YKuEy9UQfZ+obLQKf1CWeZEbi
	OcRgCPDD8XfPhFDgd68dtZWu9zAkcMpTmTQjR09/8jW6jzHjxWR6YrC8UbuYGMPJmC7YiMMrNY6
	iwzBF77E2kPwOID9qMfiBbTiZu7Qhf/ROYwpH6bE286MRhybGqLsQjSZmWZSGmVlSP94srE/xpd
	/Wda96kpaWsM2CohJ12duaBqa1kvb7+ZIAmgpDJ+taJqPCttt+pw27iU38DggJCye07/YrPCV2t
	ZlL5rqRyzPiX0fGZG700MBD8djkXtr/UNb3jIr/m9ylHJcMc
X-Google-Smtp-Source: AGHT+IHTqzdBHtaXdUfJQLh5OtQUwGieCVyrC3tJXdDiWFRu/A8iaXaQpl+DwoVlL2pK77Rw42fZNw==
X-Received: by 2002:a17:90b:2f03:b0:2ee:d7d3:3019 with SMTP id 98e67ed59e1d1-2f2e91f0dc9mr10901708a91.12.1734599351937;
        Thu, 19 Dec 2024 01:09:11 -0800 (PST)
Received: from localhost (2001-b400-e356-b45b-f574-35d0-91d3-527b.emome-ip6.hinet.net. [2001:b400:e356:b45b:f574:35d0:91d3:527b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f4477e8222sm956016a91.23.2024.12.19.01.09.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Dec 2024 01:09:11 -0800 (PST)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 2/4] i2c: npcm: Assign client address earlier for `i2c_recover_bus()`
Date: Thu, 19 Dec 2024 17:08:57 +0800
Message-Id: <20241219090859.18722-3-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241219090859.18722-1-kfting@nuvoton.com>
References: <20241219090859.18722-1-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

From: Tyrone Ting <kfting@nuvoton.com>

Store the client address earlier since it might get called in
the i2c_recover_bus() logic flow at the early stage of
npcm_i2c_master_xfer().

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index c96a25d37c14..760608fdd075 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2035,7 +2035,7 @@ static irqreturn_t npcm_i2c_bus_irq(int irq, void *dev_id)
 }
 
 static bool npcm_i2c_master_start_xmit(struct npcm_i2c *bus,
-				       u8 slave_addr, u16 nwrite, u16 nread,
+				       u16 nwrite, u16 nread,
 				       u8 *write_data, u8 *read_data,
 				       bool use_PEC, bool use_read_block)
 {
@@ -2043,7 +2043,6 @@ static bool npcm_i2c_master_start_xmit(struct npcm_i2c *bus,
 		bus->cmd_err = -EBUSY;
 		return false;
 	}
-	bus->dest_addr = slave_addr << 1;
 	bus->wr_buf = write_data;
 	bus->wr_size = nwrite;
 	bus->wr_ind = 0;
@@ -2086,7 +2085,6 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	unsigned long time_left, flags;
 	u16 nwrite, nread;
 	u8 *write_data, *read_data;
-	u8 slave_addr;
 	unsigned long timeout;
 	bool read_block = false;
 	bool read_PEC = false;
@@ -2099,7 +2097,6 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	}
 
 	msg0 = &msgs[0];
-	slave_addr = msg0->addr;
 	if (msg0->flags & I2C_M_RD) { /* read */
 		nwrite = 0;
 		write_data = NULL;
@@ -2155,6 +2152,21 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
 	} while (time_is_after_jiffies(time_left) && bus_busy);
 
+	/*
+	 * Store the address early in a global position to ensure it is
+	 * accessible for a potential call to i2c_recover_bus().
+	 *
+	 * Since the transfer might be a read operation, remove the I2C_M_RD flag
+	 * from the bus->dest_addr for the i2c_recover_bus() call later.
+	 *
+	 * The i2c_recover_bus() uses the address in a write direction to recover
+	 * the i2c bus if some error condition occurs.
+	 *
+	 * Remove the I2C_M_RD flag from the address since npcm_i2c_master_start_xmit()
+	 * handles the read/write operation internally.
+	 */
+	bus->dest_addr = i2c_8bit_addr_from_msg(msg0) & ~I2C_M_RD;
+
 	/*
 	 * Check the BER (bus error) state, when ber_state is true, it means that the module
 	 * detects the bus error which is caused by some factor like that the electricity
@@ -2172,7 +2184,6 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	}
 
 	npcm_i2c_init_params(bus);
-	bus->dest_addr = slave_addr;
 	bus->msgs = msgs;
 	bus->msgs_num = num;
 	bus->cmd_err = 0;
@@ -2182,7 +2193,7 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
 	npcm_i2c_int_enable(bus, true);
 
-	if (npcm_i2c_master_start_xmit(bus, slave_addr, nwrite, nread,
+	if (npcm_i2c_master_start_xmit(bus, nwrite, nread,
 				       write_data, read_data, read_PEC,
 				       read_block)) {
 		/*
-- 
2.34.1


