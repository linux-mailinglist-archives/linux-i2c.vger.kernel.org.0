Return-Path: <linux-i2c+bounces-5941-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DED9655ED
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 05:49:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A287B22BA1
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 03:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74D3D14D446;
	Fri, 30 Aug 2024 03:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ak8q4lzm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D370014C596;
	Fri, 30 Aug 2024 03:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724989744; cv=none; b=fKleN/9rl1yf+C5Uj+fDGE+ST+Ju0hdd8bnU/+yu2d7FYPZ6ERVpbPJAhVSzFlNm2YTWjqogahgdRTnZit6CVNPEKha92s6QlMuSBooo1YQ8iei2iJhYLju6fupK1jt621BQX4EWD9YAzYKLGCbTcXl2jg/hzv2/4j9I/vdC9gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724989744; c=relaxed/simple;
	bh=2GfhZthxRo2cGnQkUAimOhU1adC//LwCOY7KJqz2Uig=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=QW+0lzmKdVmv0Fay5eLYbAE16fszYGomHPg1W3znvYNGklA2RPVSlaQfe4pBKvTr2w6fT5/zNIBMhYiP3PKzJUzzpiy/q0VT9fgOQMhFWv5zabpU8n5pKrk8GPCKOli/IxQ34EY30jqrVFO5wVhNhqgQUso3VrYFDbxPDF5q/6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ak8q4lzm; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-714114be925so1126580b3a.2;
        Thu, 29 Aug 2024 20:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724989742; x=1725594542; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VnrTLojAZPBUqXV+IxATkeEOOYkS6IQOxRjyLV//KxQ=;
        b=Ak8q4lzmSa9gpxa2+zufIuyu/gQrLgZOe3Jpe90ouVH3XWqWMT3gw8tyMCMpZzz5av
         To8VCfSKHJbix5oGXBSy/8MYhat+humHEBrM6KCnT3+upZkfSsoc2P2N56ffAF1+sBeb
         7Wq1DfpNkaVRPCA3k6qLiLHD6kr5+Lv/pAI4qBCxkmJNDYyGd7zgJLFxbiB5+7YFVhbN
         kWuw7E7LSNEI89HzuwvCazTDJL2i7x724JVR+gAkIGAUczKI5x86qR/uE9npw8DTkiJp
         p3jlusTzsiTBoiDSBlF47bK+M/sqg/C5oUqAV2tELU66z+J/PN2H6pdV/CfRfCMvz/FD
         BplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724989742; x=1725594542;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VnrTLojAZPBUqXV+IxATkeEOOYkS6IQOxRjyLV//KxQ=;
        b=WmDGcEkbATUTjupKwONQoKFxVYetfmIH0cclfMOg9Zy4YOc1hBxr9PKPk+anUmmgKN
         hsrzwkqxMvCPglo3yFfJ2MZOjiphb3lX7I1oUTlARjNd6SS/9nzSQtN+kGFX7SgwOidK
         z8Qw1EtHofmAO185E4TUHg3/RHn9YknmIwKgcTW+9Bcn3+DI9PmrgV5NsXjRW8yhf/y/
         /5+jQNgfT20PD96+mxL2OFFyz6P/mCQ/lE323PvXgClRz/x9oJLFLvO1o32h+PfrNH+c
         Zihw9H3cAWf8ZkDNK/GBDij8M2gKUYa2e07U+JNSGsNFhQhTtDTcwIosxTnFtsPcR3kt
         GsnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNa5BfHCooanyLcOpqQDTGy3Ns06GdNWWQPuTmndvYVPQESC+BGXCSUv2uVIDPRqQX3+WakS6LmmE=@vger.kernel.org, AJvYcCWo/Bku/BwoU4RfG+hoV9v9Fv4JHMaPQcuXBWHctfci6GU/KM+8AdkT3Er5qoC3I3922/l4GsLq9DdXyc94@vger.kernel.org
X-Gm-Message-State: AOJu0YwTsAwCpm8GkRtqnnWyVe++bxwuydzsDvJnZLIsuQdTqObs/EWr
	dzpMXfDCcuY1ciOomGi+36TYJyVvsaP2WazjtXd0FJYwXW2vIgg=
X-Google-Smtp-Source: AGHT+IGG8X0DXHUFSFQGLI9Izd2j/MNhoYs9RHnKyE5Q3GWJUcqI+sbWLul0dVdBJ9mmrPY4THzgpw==
X-Received: by 2002:a05:6a20:4f9a:b0:1cc:e4be:5fae with SMTP id adf61e73a8af0-1cce4be5fd5mr3165746637.7.1724989741837;
        Thu, 29 Aug 2024 20:49:01 -0700 (PDT)
Received: from localhost (2001-b400-e338-dab5-746d-1a82-f21e-bb0a.emome-ip6.hinet.net. [2001:b400:e338:dab5:746d:1a82:f21e:bb0a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e55b9cf0sm1907320b3a.96.2024.08.29.20.49.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Aug 2024 20:49:01 -0700 (PDT)
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
Subject: [PATCH v2 3/7] i2c: npcm: use a software flag to indicate a BER condition
Date: Fri, 30 Aug 2024 11:46:36 +0800
Message-Id: <20240830034640.7049-4-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240830034640.7049-1-kfting@nuvoton.com>
References: <20240830034640.7049-1-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

If not clearing the BB (bus busy) condition in the BER (bus error)
interrupt, the driver causes a timeout and hence the i2c core
doesn't do the i2c transfer retry but returns the driver's return
value to the upper layer instead.

Clear the BB condition in the BER interrupt and a software flag is
used. The driver does an i2c recovery without causing the timeout
if the flag is set.

Fixes: 48acf8292280 ("i2c: Remove redundant comparison in npcm_i2c_reg_slave")
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
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


