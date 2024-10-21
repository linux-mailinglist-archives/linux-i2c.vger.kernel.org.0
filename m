Return-Path: <linux-i2c+bounces-7486-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2034A9A5A52
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2024 08:28:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 92A05B20F0C
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2024 06:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CEB21D0BA5;
	Mon, 21 Oct 2024 06:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X8ww5oQ4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8121D097F;
	Mon, 21 Oct 2024 06:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729492073; cv=none; b=Pm6HkgGuPsl5IMyojPcp/PaI0kbkD1Swc1N9FP8qSHYqhcOdPhRF0siiQA13qDjNBJhQFzB9k18kfvAgI0UNG+6mAcctUQdS49W2+ZoMI9g51pEZmwkRuApCLxdvwwI2T1ICueqGntL9oVvoO57961RIQrrtj/E8dU83S+Vgyls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729492073; c=relaxed/simple;
	bh=g7j5VuFvnxKv65zs9+mJbGgrfL7CtNbr+bbpSoJmQl0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Pq5x8lp/7XiH2GjSkldY4UsOuMcrtTv1xb3haI7dyfe9NE7QT/ExKHvbZn0vLRzP5BdxRIeGU02R7gymnlAfJGUevLdrHmlavxhm3w60KZaCUXa+UBX7WrQlGhs34MujkhF5jA6uXg+AuC5xvq4XHGDyu3SdfZMCCsxL6Uk3zXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X8ww5oQ4; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2e2cc469c62so2731480a91.2;
        Sun, 20 Oct 2024 23:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729492070; x=1730096870; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CYjjxH/6sVW4vPAuNqG1v24L702GKNztR3YORCVScdw=;
        b=X8ww5oQ4lOQ2hQGZQLNFZzNxUX1MpSV041fp4CaOsN6RkvwRvnEOGbXzy3A/khQM66
         UODdiEddNyUT0ViBLuLctFXBptwj1S5uCqcpaPdKsdFbK6xFyULOuU3ZZu1UiTi5hWNR
         sqaRTMSQtDghzz54ku1yWxYDHJ+LUjVEcPpv1s3QYgwufePBtEqSjnTNNbZ5k5NDvt4D
         L97FLCe9f3jVberJEDN9M4qqseSrA0UV9Xt9Ojiy5pic4sRI9x5XZumhLHxfJfjBJ1AX
         LKkBRWLUl6Jt3qJ+ySMNGvb5TjHzhRlI5Dl+K5kQs0DbgTflnyLJQzEW6OeUMyQUxLN3
         +u6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729492070; x=1730096870;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CYjjxH/6sVW4vPAuNqG1v24L702GKNztR3YORCVScdw=;
        b=JzS/+tmecDaSe04Tbyt09Hj1eTGuef7OCpEjkPFjyckg385zDgr3PTQ+gMUy9EJeux
         ormf7RnvRJEBEoUu/c1P/MdORLZ1tLJgpaQvh909Gr0aQQ0FsqCvaBIBFsR5lbN0Q4Kv
         YzcuIBfFNFIXu91a20/wSJziG4I94WA98sQDLBjDUyb5y3B2Aa3/p6ga3WmyVBoP0qkG
         n4EdxaVOLcX8RZOA+XRtbNlzfEnqCW5Pl2R41XE7w/AJJCtkv4kphvVmqhvV+fnwtvsx
         litCYFBTqIkKK2DTnlkJsz9JMn8TRWESy20MN1ZnkwyFHafQdAyUKpjw+WNpXYGZ7uXB
         gOQg==
X-Forwarded-Encrypted: i=1; AJvYcCVm0b/ujuSB7LRSuZWSW7rYr0eA4V+/LFRSUJ3qqdWMFe/7TkbODuG3ASPYRbX162BaMaVTTWTzFsCEZWqc@vger.kernel.org, AJvYcCXamsoPqdxkRmdzrkzkA04fOdDWD4fTFfHROWxUZUnCxySQzA1pziBLHDK2cEDHZMADJkc1wgGRMD0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0ZecxwBo2ZkfWiGJDYCxZYFLUDeWMv/Jq1qbJE7/YNrpNK3QH
	UIOpyhRR7ZlmlWu6WUnS8Jc1MU6PwWcBt6slrmP95t5FIBe1jSQ=
X-Google-Smtp-Source: AGHT+IFFpVgdw28i4FRp0IbBH2AXunBvqGNfnBaxFYwBvnU1BFlVOQU2Chz5Ii9cWnEzNwKwGduwAA==
X-Received: by 2002:a17:90a:d386:b0:2e0:8719:5f00 with SMTP id 98e67ed59e1d1-2e5617570e4mr11165488a91.22.1729492070322;
        Sun, 20 Oct 2024 23:27:50 -0700 (PDT)
Received: from localhost (2001-b400-e38e-c9a7-dd38-775c-4093-c057.emome-ip6.hinet.net. [2001:b400:e38e:c9a7:dd38:775c:4093:c057])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad389d04sm2734545a91.31.2024.10.20.23.27.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Oct 2024 23:27:49 -0700 (PDT)
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
Subject: [PATCH v7 2/4] i2c: npcm: Modify the client address assignment
Date: Mon, 21 Oct 2024 14:27:30 +0800
Message-Id: <20241021062732.5592-3-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241021062732.5592-1-kfting@nuvoton.com>
References: <20241021062732.5592-1-kfting@nuvoton.com>
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
 drivers/i2c/busses/i2c-npcm7xx.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index c96a25d37c14..a9a9b21f1f0b 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2155,6 +2155,16 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
 	} while (time_is_after_jiffies(time_left) && bus_busy);
 
+	/*
+	 * Previously, the 7-bit address was stored and being converted to
+	 * the address of event in the following call to npcm_i2c_master_start_xmit().
+	 *
+	 * Since there are cases that the i2c_recover_bus() gets called at the
+	 * early stage of npcm_i2c_master_xfer(), the address of event is stored
+	 * and then used in the i2c_recover_bus().
+	 */
+	bus->dest_addr = i2c_8bit_addr_from_msg(msg0);
+
 	/*
 	 * Check the BER (bus error) state, when ber_state is true, it means that the module
 	 * detects the bus error which is caused by some factor like that the electricity
@@ -2165,6 +2175,15 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	 * bus is busy.
 	 */
 	if (bus_busy || bus->ber_state) {
+		/*
+		 * Since the transfer might be a read operation, remove the I2C_M_RD flag
+		 * from the bus->dest_addr for the i2c_recover_bus() call later.
+		 *
+		 * The i2c_recover_bus() uses the address in a write direction to recover
+		 * the i2c bus if some error condition occurs.
+		 */
+		bus->dest_addr &= ~I2C_M_RD;
+
 		iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
 		npcm_i2c_reset(bus);
 		i2c_recover_bus(adap);
@@ -2172,7 +2191,6 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	}
 
 	npcm_i2c_init_params(bus);
-	bus->dest_addr = slave_addr;
 	bus->msgs = msgs;
 	bus->msgs_num = num;
 	bus->cmd_err = 0;
-- 
2.34.1


