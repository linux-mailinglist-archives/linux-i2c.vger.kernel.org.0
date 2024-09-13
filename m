Return-Path: <linux-i2c+bounces-6688-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9D5977D0D
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 12:15:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30AAA1C243E4
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 10:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A87061D88B1;
	Fri, 13 Sep 2024 10:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jCrGW4G/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089511C2DAA;
	Fri, 13 Sep 2024 10:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726222504; cv=none; b=V4HZyI9GYSZxpF99coRv9Y3VeDG4z/7fGkvIiMiua68tEN9ACaZxb8REYEzijF6o0OxBf/OkvpiZPJLy35seVmwJjhvQ+afk4XjcIZF1qPeA3lSxunVhaJS+RxCMDMxsPOyfvEtO7dlqAqqlxwbb/aSJM63Nv9wTQtr14T55yZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726222504; c=relaxed/simple;
	bh=UaVhrWPRrj8URDfaChzsHRZwdGfSRxrk64dkcS/Mepw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=YV+4NrHzgKZEkUNTLlMTbH9Q5B1G5LH8mS88SoqFnKQDtnUWxNRgqeprQ+VaSDanEvJ3XLaKRf0MBxPM2E8fesk5kUmmrB2fSpx41ob2lYyMSOIEAVU+OnXZInTDS9wlEiFxyX/EZqzAfM3a3vWeWBlKAmfrTb46P6eH15bDwWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jCrGW4G/; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-718f4fd89e5so1805066b3a.0;
        Fri, 13 Sep 2024 03:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726222502; x=1726827302; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1BGcthvFE7iZ7GLQ5GBYdiVKahiHTHcdNQMsIVlcYPg=;
        b=jCrGW4G/isNgGsERH1nGO+HQuDYZBziegOT29imFeyP+l7GfLy3Df04rrZmxC4yiIo
         Vh4yOhT/iKYQuiWjuSmKn6xz1zXqGXKy4VTwqUf8FKqARsJgst6R8j8cvsrGs8uvYRhb
         CqZOrrTfM/ZI1Exuh9dFQlM4znuvsOQbsyoTLFIvcdl5bQg8rnCHxjigG39EMYYlY10o
         hnQwaSfRbyFlDCktscHrhqK7Eb5S5paH2jTE0F1FHz4yXkwCkrwFvDCxFSvlbI9XqHOq
         pgGjvi0AToFfYxv5qKhTHomr+sb1ZCabEtQMPC8CehQGs+O3UwwlWtZSVRK7XyxtzhUm
         aXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726222502; x=1726827302;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1BGcthvFE7iZ7GLQ5GBYdiVKahiHTHcdNQMsIVlcYPg=;
        b=Bbm6YRlqx345+CqK9IG87FPSfoW8FQUWemJ1GITeekrd1xAOy0suaoTmLb9NdKFdo4
         h9n29P1+RGhC4NKYUog/9xdVEiZsxi+372gQCCRafjXjSpTy7tZAJTu++u2i59xd728g
         qSLD+hln8X4H/ClHzQ/jeX3UQjfBpzXKG7rf8TA0A3G7T10cz9rSVyJsHis3Vc5WvvWg
         KbC68+hj31En3l+bOArWCEdAR2oiw316exGcAth+Z+xsKMSQz7FqkTO3n+iZgLCoZ4JY
         Z7LM1lOnqK+2k87Qux2kb9/XbHqNyaGCi6lsAyEdffnBKx+pBhEZP0QDB5V2e+PtHL2U
         V10A==
X-Forwarded-Encrypted: i=1; AJvYcCVbw1H+uORX32tezruZiczN7RnsGEOv7fLwivvHPWwXfvDCnHNdW0dlO0SUq20eU2yLqKNOE9yt3wFmF9As@vger.kernel.org, AJvYcCXQxJMmuD9ij5FGXBYb1fxgACpU0DkQEuYXsKsqHVRP0UDEoXjEk7JYBCv5TjwXLZsEgGOz713F9oY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpsryTWdfJ49xvrctPiRSLNpI0NMEnUH9oEWLjD1u74nJagnPy
	+lcLRjJ20wxFPIyDB1zIcKaUMX718z3E9x1lZcBcRbkXyf0cwGk=
X-Google-Smtp-Source: AGHT+IFN/+8+evtZLjVKFw6cYdVaoUYs3aUOmN15pQaGNz/9tKq8F0s/IxmSII3BTDfiXTypDRemBA==
X-Received: by 2002:a05:6a21:58b:b0:1cf:6953:2872 with SMTP id adf61e73a8af0-1cf764c27f2mr7849092637.48.1726222502190;
        Fri, 13 Sep 2024 03:15:02 -0700 (PDT)
Received: from localhost (2001-b400-e334-c33a-b4cd-4a8f-209a-cf54.emome-ip6.hinet.net. [2001:b400:e334:c33a:b4cd:4a8f:209a:cf54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7190909256csm5804618b3a.125.2024.09.13.03.15.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Sep 2024 03:15:01 -0700 (PDT)
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
Subject: [PATCH v3 2/6] i2c: npcm: use a software flag to indicate a BER condition
Date: Fri, 13 Sep 2024 18:14:42 +0800
Message-Id: <20240913101445.16513-3-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240913101445.16513-1-kfting@nuvoton.com>
References: <20240913101445.16513-1-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

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


