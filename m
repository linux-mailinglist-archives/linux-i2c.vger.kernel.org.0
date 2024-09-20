Return-Path: <linux-i2c+bounces-6893-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6B097D41F
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 12:19:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5344F1C2101A
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 10:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5153D8174E;
	Fri, 20 Sep 2024 10:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hkzhrcgq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43C514BF9B;
	Fri, 20 Sep 2024 10:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726827522; cv=none; b=domYprPMd3/gg8nvExhhCKiSvi9wfRdDM4OcBN3jso0Vq3V9tFnWOtiqmmkVrjlT5DKTmQRvN7wmmspOYHTp2x8+cW2a25EbD83PZXZVrn0YY4fGFBsXBwyaLDcjO+pHquV55htzUey4Q7oMAzeh89jjdJdWqNfA533rpEQCOJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726827522; c=relaxed/simple;
	bh=BXdwMKUSnQqMpgIUV4DlPMKSV70vqCh/Y61QD8mcvAw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=eyMhA/uqX0jcEs0vFtFcLUhU8Xwrr/eybrxLa2qLLQX3EImoCTVQIh5FIM0hTTDyiZ5dxtwUT+PTRnFczycX4teDb07LQm5jeLPTKA4geWv+u/U5ElaTpBG6evoBFgHEEoFI0hV2ufJq2Y6BsF34pOiNwEh2qSd7RZ4yPu2Pc2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hkzhrcgq; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2d889207d1aso1270467a91.3;
        Fri, 20 Sep 2024 03:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726827520; x=1727432320; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hqji9tGtt8x3XWnj49TDJpJlGjDL6hysOmPTOIryTb0=;
        b=HkzhrcgqEeeiNwv6lqgJYDF/x09FfbjlwTT1NrDYOKfH/f/njRW+3yxLk8KxAPx6xA
         PdrN7FwCOhCfjiFgVaOUKVj4f2276B24DqzeEnFNvgAWdc5/bJ7wP3WZpe8MJtojoXB0
         05t6KgDMFbOpDExiWolEoJWms5cd736MiTBE3l0W5kAu/uB1E++ET6ZW7ijp7IGECw8q
         GWllM4lGtRTrMD6G8tMfRieOEqAXUwadLAnCY4vGyN/rRsg4qCgalb+FqmxVFbhApDkR
         Q5MVMkEJn969rPoxoppsRuGOeoQNvgltF91ve8a2cwEfb6RBHwxZwRdn8U3RPLU7O8+T
         Uhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726827520; x=1727432320;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hqji9tGtt8x3XWnj49TDJpJlGjDL6hysOmPTOIryTb0=;
        b=uMYLm5PY26oD2U8WYDXXcO8yglTTEfd3vKL01uaxUASRYI3QdL6gTC7LDDrLa7SWl8
         jVzPRxP8dMOJFQ5/abfrF4lwMkpHtcrMP6gAEh6FH8LkhNfbc8bX5BNCqQlAfHmrtEK2
         Bz7D0+8sBwzowJ+CJvIR3j3W80N4dHYRUnsR794uuJCNBpMCd+pdHDc7z6eOpOZDhI+t
         XtOIoSw2PBFyt1hVipVhdue0WZk2Twr+4wRn22xI4L9gStuBIidBAcLWL0gLNj3w7iIz
         hu5JdK+X6N7ZexnHbW/RjtqGnVmsmecLqFWOlha6wAPywfryMooN6g8TM/41oDX3NhDO
         zqFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFFL+tN9QkrqW+Idax7ipamRG+0AYy3+iue2ez8pfhskiORqtDIui/iJIOluAM1rO+a4FD/fTgcnw=@vger.kernel.org, AJvYcCVcxCt2rpEN2zXqWjWwkjhD1KBU6kjIVWUfHtny0RYa34Xv/yIcAHjrUUIsRKfZiB3xzpkHkqTNJkQQkmls@vger.kernel.org
X-Gm-Message-State: AOJu0YwrfUUsIqqaNGi/ZCH5Ri//8k+QScvsZBd4yLcLejE3Ox2jPB9y
	v/zZupdqHVE3uiWYXgmV174lDiTBD8nVThFXYAU2MavmulGfiI8=
X-Google-Smtp-Source: AGHT+IFHbMVlFKHZ2gmmAnVDb59au+HAvbAe/HCOI0X6F2Mkg0p9TL07e1HiiSAyfNluOEgtpfy6Xw==
X-Received: by 2002:a17:90b:4f8b:b0:2c8:64a:5f77 with SMTP id 98e67ed59e1d1-2dd80e7191emr2734760a91.37.1726827519832;
        Fri, 20 Sep 2024 03:18:39 -0700 (PDT)
Received: from localhost (2001-b400-e35c-9cc2-447a-d760-d4f6-01f4.emome-ip6.hinet.net. [2001:b400:e35c:9cc2:447a:d760:d4f6:1f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dd7f9004fcsm1496423a91.44.2024.09.20.03.18.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Sep 2024 03:18:39 -0700 (PDT)
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
Subject: [PATCH v4 2/6] i2c: npcm: use a software flag to indicate a BER condition
Date: Fri, 20 Sep 2024 18:18:16 +0800
Message-Id: <20240920101820.44850-3-kfting@nuvoton.com>
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

If not clearing the BB (bus busy) condition in the BER (bus error)
interrupt, the driver causes a timeout and hence the i2c core
doesn't do the i2c transfer retry but returns the driver's return
value to the upper layer instead.

Clear the BB condition in the BER interrupt and a software flag is
used. The driver does an i2c recovery without causing the timeout
if the flag is set.

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 2b76dbfba438..2d034503d8bc 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -334,6 +334,7 @@ struct npcm_i2c {
 	u64 nack_cnt;
 	u64 timeout_cnt;
 	u64 tx_complete_cnt;
+	bool ber_state;
 };
 
 static inline void npcm_i2c_select_bank(struct npcm_i2c *bus,
@@ -1521,6 +1522,7 @@ static void npcm_i2c_irq_handle_ber(struct npcm_i2c *bus)
 	if (npcm_i2c_is_master(bus)) {
 		npcm_i2c_master_abort(bus);
 	} else {
+		bus->ber_state = true;
 		npcm_i2c_clear_master_status(bus);
 
 		/* Clear BB (BUS BUSY) bit */
@@ -1699,6 +1701,7 @@ static int npcm_i2c_recovery_tgclk(struct i2c_adapter *_adap)
 		dev_dbg(bus->dev, "bus%d-0x%x recovery skipped, bus not stuck",
 			bus->num, bus->dest_addr);
 		npcm_i2c_reset(bus);
+		bus->ber_state = false;
 		return 0;
 	}
 
@@ -1763,6 +1766,7 @@ static int npcm_i2c_recovery_tgclk(struct i2c_adapter *_adap)
 		if (bus->rec_succ_cnt < ULLONG_MAX)
 			bus->rec_succ_cnt++;
 	}
+	bus->ber_state = false;
 	return status;
 }
 
@@ -2158,7 +2162,7 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
 	} while (time_is_after_jiffies(time_left) && bus_busy);
 
-	if (bus_busy) {
+	if (bus_busy || bus->ber_state) {
 		iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
 		npcm_i2c_reset(bus);
 		i2c_recover_bus(adap);
-- 
2.34.1


