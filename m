Return-Path: <linux-i2c+bounces-5944-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C16209655F6
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 05:50:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E735F1C22F43
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 03:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6B211494B4;
	Fri, 30 Aug 2024 03:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gEU90D1c"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFAD152165;
	Fri, 30 Aug 2024 03:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724989753; cv=none; b=kZ+wDDfJCegSJ8UQSWtxNmc/tDVXYAtetdeRslWfUYPt8YrM3PAPMqmc82+Sj1gti8MlbN6GTnNi7KkUOVncsMY5HVGmdoeiIYa1PhN6+0nXDfc7SiI5hXUMHVXefO1L1rU/4g6FEbtmbjv7LLsdN5aBBlCk5zrgVkHHAbgg3UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724989753; c=relaxed/simple;
	bh=eVxukkbljO+uXQpECJcglcHdK+HiMh1QhNQRpQ6nDqk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=S4Tdj+hLRuPvuMSODSNN2REO/5+ejTCRv+XolLru/b6H/fFavuwQLjdzrSjmLDJKfh8dtEcA0N3jqtfwrzP+pzZ98HqC2Dvw3ffBmzLNQLGjZZ+KI5kKTCFXImZLAJbilD8lgB/3+W8hEhaUm8CMOwi6ipKG47WAU4xK6q39Deg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gEU90D1c; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3df0519a3ceso859596b6e.2;
        Thu, 29 Aug 2024 20:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724989750; x=1725594550; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2L454eIDBLlnhGWV2AoOWGsI5wsfWExAXNrzW47/oEs=;
        b=gEU90D1ciSnI3Pwr3Uefr60DXi+H4t5picdCx07pWwZUE2BIg0EbQn/vOVc/mhLTur
         9AG+Rp5djoefp0FuoBAvU320/XtoxZFAhaGTnL+eavW1s8RFKzMB2OyKjLD2qRVhfQPq
         JfyqW7vOTST3Zw77VJCQJEZ1vq2OgxYG5pMoMXcJGwMW9rfTmPcWGy+LgedDT2ZqQFd+
         YdpnKeYqRC1qrojoRTrFCyPck2UZ79AyAy0Czu133D+wLQEesfY95yLYs2vK7E0blTDm
         pVS9gTd9A2NCOSnJCUg34ekg9fsaW9XZwZAKH/rIAPUsnnxMcxJCLfdxPS3WTR6BlXps
         HBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724989750; x=1725594550;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2L454eIDBLlnhGWV2AoOWGsI5wsfWExAXNrzW47/oEs=;
        b=Dbyo5euWcm9y+0WUbxOrVod7zml4iv80Z+TnD5mQEdyPM8H8MuhwltxSub3GKr3pSr
         VatbSZIjhxkLVXuEgklNzceKIGyC7KA6mQATgNNG3IT4kGFKnRdieJvGKqxlGS1ge34K
         zIR7n8aTJqimuC81djht1IGC/pQKCs8xtTLcHaI9NLBx+PsRiyegKOAuVAhC50IYQht5
         tx9CVtr8qXz9yP/X8VZv27JRobPcKpzV2wCzo7HNhIjNwV8A8XcCkkbZDpikVNZ2mKz2
         0GsRSq7ScOHo+xbvmp/2XHAvxlRsP2WUQfJ6ObH9Qp//OpTbUxILjN5Qr9fHNZoex+cJ
         yNhA==
X-Forwarded-Encrypted: i=1; AJvYcCWEcubIV+RvuxS82bUPVR/ShosnwAfKH6w1FYgaAXvakEMrUDtp+SxN0SgxWbxuxaXa9OHTb82YIK/fxFES@vger.kernel.org, AJvYcCX7LVebxOFpoVWs2HZSlceJYG3F6Em0ZDxAG7gri2ymBfijY4pL7Ym0LMHYce/PmnS+FBCJNytcUdo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/TvdEDABvSn7gabg81vw++DgXW27wfvabG4hNOonXrR1iKVsG
	g1RkxPfD/BCvLeCjpEMIOrWcWYZeefAc0q7QGpfxzNNXs8pccOU=
X-Google-Smtp-Source: AGHT+IGwidesUKI82CPYAGh+W1ieZRNF+5w82gFIAHwY6Qk0VuD4TCzaj+YRUNr+4/vPjVQUAB6OdA==
X-Received: by 2002:a05:6808:1809:b0:3de:13dd:3c30 with SMTP id 5614622812f47-3df05d99f8fmr5510291b6e.10.1724989750502;
        Thu, 29 Aug 2024 20:49:10 -0700 (PDT)
Received: from localhost (2001-b400-e338-dab5-746d-1a82-f21e-bb0a.emome-ip6.hinet.net. [2001:b400:e338:dab5:746d:1a82:f21e:bb0a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e575b7dfsm1866058b3a.190.2024.08.29.20.49.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Aug 2024 20:49:10 -0700 (PDT)
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
Subject: [PATCH v2 6/7] i2c: npcm: use i2c frequency table
Date: Fri, 30 Aug 2024 11:46:39 +0800
Message-Id: <20240830034640.7049-7-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240830034640.7049-1-kfting@nuvoton.com>
References: <20240830034640.7049-1-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

Modify i2c frequency from table parameters
for NPCM i2c modules.

Supported frequencies are:

1. 100KHz
2. 400KHz
3. 1MHz

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 230 +++++++++++++++++++------------
 1 file changed, 144 insertions(+), 86 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 67d156ed29b9..cac4ea0b69b8 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -263,6 +263,121 @@ static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] = {
 #define I2C_FREQ_MIN_HZ			10000
 #define I2C_FREQ_MAX_HZ			I2C_MAX_FAST_MODE_PLUS_FREQ
 
+struct SMB_TIMING_T {
+	u32 core_clk;
+	u8 hldt;
+	u8 dbcnt;
+	u16 sclfrq;
+	u8 scllt;
+	u8 sclht;
+	bool fast_mode;
+};
+
+static struct SMB_TIMING_T SMB_TIMING_100KHZ[] = {
+	{.core_clk = 100000000, .hldt = 0x2A, .dbcnt = 0x4, .sclfrq = 0xFB, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 62500000,  .hldt = 0x2A, .dbcnt = 0x1, .sclfrq = 0x9D, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 50000000,  .hldt = 0x2A, .dbcnt = 0x1, .sclfrq = 0x7E, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 48000000,  .hldt = 0x2A, .dbcnt = 0x1, .sclfrq = 0x79, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 40000000,  .hldt = 0x2A, .dbcnt = 0x1, .sclfrq = 0x65, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 30000000,  .hldt = 0x2A, .dbcnt = 0x1, .sclfrq = 0x4C, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 29000000,  .hldt = 0x2A, .dbcnt = 0x1, .sclfrq = 0x49, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 26000000,  .hldt = 0x2A, .dbcnt = 0x1, .sclfrq = 0x42, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 25000000,  .hldt = 0x2A, .dbcnt = 0x1, .sclfrq = 0x3F, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 24000000,  .hldt = 0x2A, .dbcnt = 0x1, .sclfrq = 0x3D, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 20000000,  .hldt = 0x2A, .dbcnt = 0x1, .sclfrq = 0x33, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 16180000,  .hldt = 0x2A, .dbcnt = 0x1, .sclfrq = 0x29, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 15000000,  .hldt = 0x23, .dbcnt = 0x1, .sclfrq = 0x26, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 13000000,  .hldt = 0x1D, .dbcnt = 0x1, .sclfrq = 0x21, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 12000000,  .hldt = 0x1B, .dbcnt = 0x1, .sclfrq = 0x1F, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 10000000,  .hldt = 0x18, .dbcnt = 0x1, .sclfrq = 0x1A, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 9000000,   .hldt = 0x16, .dbcnt = 0x1, .sclfrq = 0x17, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 8090000,   .hldt = 0x14, .dbcnt = 0x1, .sclfrq = 0x15, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 7500000,   .hldt = 0x7,  .dbcnt = 0x1, .sclfrq = 0x13, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 6500000,   .hldt = 0xE,  .dbcnt = 0x1, .sclfrq = 0x11, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 4000000,   .hldt = 0x9,  .dbcnt = 0x1, .sclfrq = 0xB,  .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false }
+};
+
+static struct SMB_TIMING_T SMB_TIMING_400KHZ[] = {
+	{.core_clk = 100000000, .hldt = 0x2A, .dbcnt = 0x3, .sclfrq = 0x0, .scllt = 0x47,
+	.sclht  = 0x35, .fast_mode = true },
+	{.core_clk = 62500000,  .hldt = 0x2A, .dbcnt = 0x2, .sclfrq = 0x0, .scllt = 0x2C,
+	.sclht  = 0x22, .fast_mode = true },
+	{.core_clk = 50000000,  .hldt = 0x21, .dbcnt = 0x1, .sclfrq = 0x0, .scllt = 0x24,
+	.sclht  = 0x1B, .fast_mode = true },
+	{.core_clk = 48000000,  .hldt = 0x1E, .dbcnt = 0x1, .sclfrq = 0x0, .scllt = 0x24,
+	.sclht  = 0x19, .fast_mode = true },
+	{.core_clk = 40000000,  .hldt = 0x1B, .dbcnt = 0x1, .sclfrq = 0x0, .scllt = 0x1E,
+	.sclht  = 0x14, .fast_mode = true },
+	{.core_clk = 33000000,  .hldt = 0x15, .dbcnt = 0x1, .sclfrq = 0x0, .scllt = 0x19,
+	.sclht  = 0x11, .fast_mode = true },
+	{.core_clk = 30000000,  .hldt = 0x15, .dbcnt = 0x1, .sclfrq = 0x0, .scllt = 0x19,
+	.sclht  = 0xD,  .fast_mode = true },
+	{.core_clk = 29000000,  .hldt = 0x11, .dbcnt = 0x1, .sclfrq = 0x0, .scllt = 0x15,
+	.sclht  = 0x10, .fast_mode = true },
+	{.core_clk = 26000000,  .hldt = 0x10, .dbcnt = 0x1, .sclfrq = 0x0, .scllt = 0x13,
+	.sclht  = 0xE,  .fast_mode = true },
+	{.core_clk = 25000000,  .hldt = 0xF,  .dbcnt = 0x1, .sclfrq = 0x0, .scllt = 0x13,
+	.sclht  = 0xD,  .fast_mode = true },
+	{.core_clk = 24000000,  .hldt = 0xD,  .dbcnt = 0x1, .sclfrq = 0x0, .scllt = 0x12,
+	.sclht  = 0xD,  .fast_mode = true },
+	{.core_clk = 20000000,  .hldt = 0xB,  .dbcnt = 0x1, .sclfrq = 0x0, .scllt = 0xF,
+	.sclht  = 0xA,  .fast_mode = true },
+	{.core_clk = 16180000,  .hldt = 0xA,  .dbcnt = 0x1, .sclfrq = 0x0, .scllt = 0xC,
+	.sclht  = 0x9,  .fast_mode = true },
+	{.core_clk = 15000000,  .hldt = 0x9,  .dbcnt = 0x1, .sclfrq = 0x0, .scllt = 0xB,
+	.sclht  = 0x8,  .fast_mode = true },
+	{.core_clk = 13000000,  .hldt = 0x7,  .dbcnt = 0x1, .sclfrq = 0x0, .scllt = 0xA,
+	.sclht  = 0x7,  .fast_mode = true },
+	{.core_clk = 12000000,  .hldt = 0x7,  .dbcnt = 0x1, .sclfrq = 0x0, .scllt = 0xA,
+	.sclht  = 0x6,  .fast_mode = true },
+	{.core_clk = 10000000,  .hldt = 0x6,  .dbcnt = 0x1, .sclfrq = 0x0, .scllt = 0x8,
+	.sclht  = 0x5,  .fast_mode = true },
+};
+
+static struct SMB_TIMING_T SMB_TIMING_1000KHZ[] = {
+	{.core_clk = 100000000, .hldt = 0x15, .dbcnt = 0x4, .sclfrq = 0x0, .scllt = 0x1C,
+	.sclht  = 0x15, .fast_mode = true },
+	{.core_clk = 62500000,  .hldt = 0xF,  .dbcnt = 0x3, .sclfrq = 0x0, .scllt = 0x11,
+	.sclht  = 0xE,  .fast_mode = true },
+	{.core_clk = 50000000,  .hldt = 0xA,  .dbcnt = 0x2, .sclfrq = 0x0, .scllt = 0xE,
+	.sclht  = 0xB,  .fast_mode = true },
+	{.core_clk = 48000000,  .hldt = 0x9,  .dbcnt = 0x2, .sclfrq = 0x0, .scllt = 0xD,
+	.sclht  = 0xB,  .fast_mode = true },
+	{.core_clk = 41000000,  .hldt = 0x9,  .dbcnt = 0x2, .sclfrq = 0x0, .scllt = 0xC,
+	.sclht  = 0x9,  .fast_mode = true },
+	{.core_clk = 40000000,  .hldt = 0x8,  .dbcnt = 0x2, .sclfrq = 0x0, .scllt = 0xB,
+	.sclht  = 0x9,  .fast_mode = true },
+	{.core_clk = 33000000,  .hldt = 0x7,  .dbcnt = 0x1, .sclfrq = 0x0, .scllt = 0xA,
+	.sclht  = 0x7,  .fast_mode = true },
+	{.core_clk = 25000000,  .hldt = 0x4,  .dbcnt = 0x1, .sclfrq = 0x0, .scllt = 0x7,
+	.sclht  = 0x6,  .fast_mode = true },
+	{.core_clk = 24000000,  .hldt = 0x7,  .dbcnt = 0x1, .sclfrq = 0x0, .scllt = 0x8,
+	.sclht  = 0x5,  .fast_mode = true },
+	{.core_clk = 20000000,  .hldt = 0x4,  .dbcnt = 0x1, .sclfrq = 0x0, .scllt = 0x6,
+	.sclht  = 0x4,  .fast_mode = true },
+};
+
 struct npcm_i2c_data {
 	u8 fifo_size;
 	u32 segctl_init_val;
@@ -1805,102 +1920,45 @@ static void npcm_i2c_recovery_init(struct i2c_adapter *_adap)
  */
 static int npcm_i2c_init_clk(struct npcm_i2c *bus, u32 bus_freq_hz)
 {
-	u32  k1 = 0;
-	u32  k2 = 0;
-	u8   dbnct = 0;
-	u32  sclfrq = 0;
-	u8   hldt = 7;
+	struct  SMB_TIMING_T *smb_timing;
+	u8   scl_table_cnt = 0, table_size = 0;
 	u8   fast_mode = 0;
-	u32  src_clk_khz;
-	u32  bus_freq_khz;
 
-	src_clk_khz = bus->apb_clk / 1000;
-	bus_freq_khz = bus_freq_hz / 1000;
 	bus->bus_freq = bus_freq_hz;
 
-	/* 100KHz and below: */
-	if (bus_freq_hz <= I2C_MAX_STANDARD_MODE_FREQ) {
-		sclfrq = src_clk_khz / (bus_freq_khz * 4);
-
-		if (sclfrq < SCLFRQ_MIN || sclfrq > SCLFRQ_MAX)
-			return -EDOM;
-
-		if (src_clk_khz >= 40000)
-			hldt = 17;
-		else if (src_clk_khz >= 12500)
-			hldt = 15;
-		else
-			hldt = 7;
-	}
-
-	/* 400KHz: */
-	else if (bus_freq_hz <= I2C_MAX_FAST_MODE_FREQ) {
-		sclfrq = 0;
+	switch (bus_freq_hz) {
+	case I2C_MAX_STANDARD_MODE_FREQ:
+		smb_timing = SMB_TIMING_100KHZ;
+		table_size = ARRAY_SIZE(SMB_TIMING_100KHZ);
+		break;
+	case I2C_MAX_FAST_MODE_FREQ:
+		smb_timing = SMB_TIMING_400KHZ;
+		table_size = ARRAY_SIZE(SMB_TIMING_400KHZ);
 		fast_mode = I2CCTL3_400K_MODE;
-
-		if (src_clk_khz < 7500)
-			/* 400KHZ cannot be supported for core clock < 7.5MHz */
-			return -EDOM;
-
-		else if (src_clk_khz >= 50000) {
-			k1 = 80;
-			k2 = 48;
-			hldt = 12;
-			dbnct = 7;
-		}
-
-		/* Master or Slave with frequency > 25MHz */
-		else if (src_clk_khz > 25000) {
-			hldt = clk_coef(src_clk_khz, 300) + 7;
-			k1 = clk_coef(src_clk_khz, 1600);
-			k2 = clk_coef(src_clk_khz, 900);
-		}
-	}
-
-	/* 1MHz: */
-	else if (bus_freq_hz <= I2C_MAX_FAST_MODE_PLUS_FREQ) {
-		sclfrq = 0;
+		break;
+	case I2C_MAX_FAST_MODE_PLUS_FREQ:
+		smb_timing = SMB_TIMING_1000KHZ;
+		table_size = ARRAY_SIZE(SMB_TIMING_1000KHZ);
 		fast_mode = I2CCTL3_400K_MODE;
-
-		/* 1MHZ cannot be supported for core clock < 24 MHz */
-		if (src_clk_khz < 24000)
-			return -EDOM;
-
-		k1 = clk_coef(src_clk_khz, 620);
-		k2 = clk_coef(src_clk_khz, 380);
-
-		/* Core clk > 40 MHz */
-		if (src_clk_khz > 40000) {
-			/*
-			 * Set HLDT:
-			 * SDA hold time:  (HLDT-7) * T(CLK) >= 120
-			 * HLDT = 120/T(CLK) + 7 = 120 * FREQ(CLK) + 7
-			 */
-			hldt = clk_coef(src_clk_khz, 120) + 7;
-		} else {
-			hldt = 7;
-			dbnct = 2;
-		}
+		break;
+	default:
+		return -EINVAL;
 	}
 
-	/* Frequency larger than 1 MHz is not supported */
-	else
-		return -EINVAL;
+	for (scl_table_cnt = 0 ; scl_table_cnt < table_size ; scl_table_cnt++)
+		if (bus->apb_clk >= smb_timing[scl_table_cnt].core_clk)
+			break;
 
-	if (bus_freq_hz >= I2C_MAX_FAST_MODE_FREQ) {
-		k1 = round_up(k1, 2);
-		k2 = round_up(k2 + 1, 2);
-		if (k1 < SCLFRQ_MIN || k1 > SCLFRQ_MAX ||
-		    k2 < SCLFRQ_MIN || k2 > SCLFRQ_MAX)
-			return -EDOM;
-	}
+	if (scl_table_cnt == table_size)
+		return -EINVAL;
 
 	/* write sclfrq value. bits [6:0] are in I2CCTL2 reg */
-	iowrite8(FIELD_PREP(I2CCTL2_SCLFRQ6_0, sclfrq & 0x7F),
+	iowrite8(FIELD_PREP(I2CCTL2_SCLFRQ6_0, smb_timing[scl_table_cnt].sclfrq & 0x7F),
 		 bus->reg + NPCM_I2CCTL2);
 
 	/* bits [8:7] are in I2CCTL3 reg */
-	iowrite8(fast_mode | FIELD_PREP(I2CCTL3_SCLFRQ8_7, (sclfrq >> 7) & 0x3),
+	iowrite8(fast_mode | FIELD_PREP(I2CCTL3_SCLFRQ8_7, (smb_timing[scl_table_cnt].sclfrq >> 7)
+		 & 0x3),
 		 bus->reg + NPCM_I2CCTL3);
 
 	/* Select Bank 0 to access NPCM_I2CCTL4/NPCM_I2CCTL5 */
@@ -1912,13 +1970,13 @@ static int npcm_i2c_init_clk(struct npcm_i2c *bus, u32 bus_freq_hz)
 		 * k1 = 2 * SCLLT7-0 -> Low Time  = k1 / 2
 		 * k2 = 2 * SCLLT7-0 -> High Time = k2 / 2
 		 */
-		iowrite8(k1 / 2, bus->reg + NPCM_I2CSCLLT);
-		iowrite8(k2 / 2, bus->reg + NPCM_I2CSCLHT);
+		iowrite8(smb_timing[scl_table_cnt].scllt, bus->reg + NPCM_I2CSCLLT);
+		iowrite8(smb_timing[scl_table_cnt].sclht, bus->reg + NPCM_I2CSCLHT);
 
-		iowrite8(dbnct, bus->reg + NPCM_I2CCTL5);
+		iowrite8(smb_timing[scl_table_cnt].dbcnt, bus->reg + NPCM_I2CCTL5);
 	}
 
-	iowrite8(hldt, bus->reg + NPCM_I2CCTL4);
+	iowrite8(smb_timing[scl_table_cnt].hldt, bus->reg + NPCM_I2CCTL4);
 
 	/* Return to Bank 1, and stay there by default: */
 	npcm_i2c_select_bank(bus, I2C_BANK_1);
-- 
2.34.1


