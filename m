Return-Path: <linux-i2c+bounces-7120-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B68E98B468
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 08:31:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44FDE1C234B4
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 06:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA5A1BD510;
	Tue,  1 Oct 2024 06:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lnPbNdp/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7FD1BD517;
	Tue,  1 Oct 2024 06:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727764196; cv=none; b=rZm9cJwk1zUhS9OnpxBTpiGtQmq2TM09LL1uyhYQjeukrRa6D/3qIMHxIBDYzIXdCdcsAl9qiN3rUVD4Ax5bm8MzgOGlH9JMtef+0oUyjNTwKx+r8y/jnvbEANms2mJvXm9EKQp8u7SyKQzhue83QjI8HjQS1eei4wLXlOtCa+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727764196; c=relaxed/simple;
	bh=uV8iWwN6dVtoqJz4MUZNhdtwgWE792mqtPkMFuC6l8E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Z6vMxPodlpNwBsp4Vl8tdWH8sbTdr7JvYlEvPscCmOcqkgyjHMSq7sHy80RiAx4iii2WSQj8eavL5H2K9WheM2DUVUdpyWi720TWAfx1JoexVNEu0FFiqZRTBt7nPgfOVg91hteLAz7anxxWQONvvdDjMxRCionXn15e+A8IXK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lnPbNdp/; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71788bfe60eso3823212b3a.1;
        Mon, 30 Sep 2024 23:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727764194; x=1728368994; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YqzdmEu2UR4QBOUCnQBa7ZbtSWN8HvAvdUKdNjbDuIM=;
        b=lnPbNdp/SvifcA+rMM22Jca0vhDIZldU8XDF4bz/g3cT2WPwJoehWkYJtrt2c4y3Zz
         XjNqN5qwS0nGV4quH0GYT0MLc4TikF4DLyILCqYcfLA+SuY/zktW9aXn16NnZG2vWZ2L
         6XcZfDzyswQfSsWaGyuGbsoC+0aQEGdyT0JmJcjMs6/fow3ZS5r1qXESXWOLb9BJQIO+
         QnieNpDQGO5v/hkgLdBPYHF6tL6Spw+GyNwzfPi+Nu9L6FM2iKt1/c/uiTuYSTh7io6s
         7hZkiEAIRSZ8n8PHiuMBI6zY4yE3hlID8V6mcLgkfwWNTdj5mn6LUuY4ih+40QDzNhqZ
         6nqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727764194; x=1728368994;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YqzdmEu2UR4QBOUCnQBa7ZbtSWN8HvAvdUKdNjbDuIM=;
        b=O33fNB5s6Q+d4wlony9JJwZMGooz2+kDDhPOYf1plpq1ydq3INQ6lO4y5dPG2GK5f2
         OwYkuF041Ry9cdy8yIxTYs4//GdmFyMHmuB/MhacPcNNk433KnLJatGYPqncl8FQhJbZ
         lUyBal+JfRSLWqp0KljHdehR4MndW0awB7mJOoq3QTkDy6Zaq5/OP/k/lSOuN/Fi653o
         RF4vzQlFWnGznm4oBniQDfWrynHz1l8bElZbs0hdkULa0x7C5bDDVQ/1gEHAs0yPmtE5
         Vsn6QEjTUkZN39AdOhVWMMjFKSPlFMVXH9vuD0VYTDtOhjd11YE6//mC5NuMihJ2qSjb
         11MA==
X-Forwarded-Encrypted: i=1; AJvYcCU/T+8e1u+/hdUmQdymiQmvRFYDUupnGaNEJwX3MJwkNWssyixJ6w9JkXcux7dN27tETCK1BlT4HjI=@vger.kernel.org, AJvYcCXmoMkdS5Pm9wMtfUkDhaZNVt4QZwbigZXnnBUcaqoBK52lOWi2qnkQa8NhByUG5JFGU3QpZmu/JrO4j9J1@vger.kernel.org
X-Gm-Message-State: AOJu0Yys/xWbbWEid4X1ut/7F5rw7ZjIpXzgcbxhttFMw6ZCjHv9WmKP
	8C9Q9fDvSyt/ZadQ6j7376gZvamw4CMiRy/xQBLKQpvaqz84OFM=
X-Google-Smtp-Source: AGHT+IFAynLD7Y6INIeHChoWuMPGG7kXyaw3SFtjQ+rhKIWR6q8jEBeLr3s9/T+mqw663JthV2If0g==
X-Received: by 2002:a05:6a00:cd4:b0:718:edeb:5a35 with SMTP id d2e1a72fcca58-71b2607ec59mr21161483b3a.28.1727764193783;
        Mon, 30 Sep 2024 23:29:53 -0700 (PDT)
Received: from localhost (2001-b400-e30e-7f15-c94a-d42b-025a-8ff3.emome-ip6.hinet.net. [2001:b400:e30e:7f15:c94a:d42b:25a:8ff3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b264bcc30sm7296746b3a.68.2024.09.30.23.29.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2024 23:29:53 -0700 (PDT)
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
Subject: [PATCH v5 5/6] i2c: npcm: use i2c frequency table
Date: Tue,  1 Oct 2024 14:28:54 +0800
Message-Id: <20241001062855.6928-6-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241001062855.6928-1-kfting@nuvoton.com>
References: <20241001062855.6928-1-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

From: Tyrone Ting <kfting@nuvoton.com>

Modify i2c frequency from table parameters
for NPCM i2c modules.

Supported frequencies are:

1. 100KHz
2. 400KHz
3. 1MHz

The original equations were tested on a variety of chips and base clocks.
Since we added devices that use higher frequencies of the module we
saw that there is a mismatch between the equation and the actual
results on the bus itself, measured on scope.

Meanwhile, the equations were not accurate to begin with.
They are an approximation of the ideal value. The ideal value is
calculated per frequency of the core module.

So instead of using the equations we did an optimization per module
frequency, verified on a device.

Most of the work was focused on the rise time of the SCL and SDA,
which depends on external load of the bus and PU.

Different PCB designs, or specifically to this case: the number
and type of targets on the bus, impact the required values for
the timing registers.

Users can recalculate the numbers for each bus and get an even better
optimization, but our users chose not to.

We manually picked values per frequency that match the entire valid
range of targets (from 1 to max number). Then we check against the
AMR described in SMB spec and make sure that none of the values
is exceeding.

This process was led by the chip architect and included a lot of testing.

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 374 ++++++++++++++++++++++++-------
 1 file changed, 288 insertions(+), 86 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 0ee77e1fbc08..2ed69e92edf6 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -263,6 +263,265 @@ static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] = {
 #define I2C_FREQ_MIN_HZ			10000
 #define I2C_FREQ_MAX_HZ			I2C_MAX_FAST_MODE_PLUS_FREQ
 
+struct smb_timing_t {
+	u32 core_clk;
+	u8 hldt;
+	u8 dbcnt;
+	u16 sclfrq;
+	u8 scllt;
+	u8 sclht;
+	bool fast_mode;
+};
+
+static struct smb_timing_t smb_timing_100khz[] = {
+	{
+		.core_clk = 100000000, .hldt = 0x2A, .dbcnt = 0x4,
+		.sclfrq = 0xFB, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 62500000, .hldt = 0x2A, .dbcnt = 0x1,
+		.sclfrq = 0x9D, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 50000000, .hldt = 0x2A, .dbcnt = 0x1,
+		.sclfrq = 0x7E, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 48000000, .hldt = 0x2A, .dbcnt = 0x1,
+		.sclfrq = 0x79, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 40000000, .hldt = 0x2A, .dbcnt = 0x1,
+		.sclfrq = 0x65, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 30000000, .hldt = 0x2A, .dbcnt = 0x1,
+		.sclfrq = 0x4C, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 29000000, .hldt = 0x2A, .dbcnt = 0x1,
+		.sclfrq = 0x49, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 26000000, .hldt = 0x2A, .dbcnt = 0x1,
+		.sclfrq = 0x42, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 25000000, .hldt = 0x2A, .dbcnt = 0x1,
+		.sclfrq = 0x3F, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 24000000, .hldt = 0x2A, .dbcnt = 0x1,
+		.sclfrq = 0x3D, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 20000000, .hldt = 0x2A, .dbcnt = 0x1,
+		.sclfrq = 0x33, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 16180000, .hldt = 0x2A, .dbcnt = 0x1,
+		.sclfrq = 0x29, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 15000000, .hldt = 0x23, .dbcnt = 0x1,
+		.sclfrq = 0x26, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 13000000, .hldt = 0x1D, .dbcnt = 0x1,
+		.sclfrq = 0x21, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 12000000, .hldt = 0x1B, .dbcnt = 0x1,
+		.sclfrq = 0x1F, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 10000000, .hldt = 0x18, .dbcnt = 0x1,
+		.sclfrq = 0x1A, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 9000000, .hldt = 0x16, .dbcnt = 0x1,
+		.sclfrq = 0x17, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 8090000, .hldt = 0x14, .dbcnt = 0x1,
+		.sclfrq = 0x15, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 7500000, .hldt = 0x7, .dbcnt = 0x1,
+		.sclfrq = 0x13, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 6500000, .hldt = 0xE, .dbcnt = 0x1,
+		.sclfrq = 0x11, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 4000000, .hldt = 0x9, .dbcnt = 0x1,
+		.sclfrq = 0xB, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+};
+
+static struct smb_timing_t smb_timing_400khz[] = {
+	{
+		.core_clk = 100000000, .hldt = 0x2A, .dbcnt = 0x3,
+		.sclfrq = 0x0, .scllt = 0x47, .sclht = 0x35,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 62500000, .hldt = 0x2A, .dbcnt = 0x2,
+		.sclfrq = 0x0, .scllt = 0x2C, .sclht = 0x22,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 50000000, .hldt = 0x21, .dbcnt = 0x1,
+		.sclfrq = 0x0, .scllt = 0x24, .sclht = 0x1B,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 48000000, .hldt = 0x1E, .dbcnt = 0x1,
+		.sclfrq = 0x0, .scllt = 0x24, .sclht = 0x19,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 40000000, .hldt = 0x1B, .dbcnt = 0x1,
+		.sclfrq = 0x0, .scllt = 0x1E, .sclht = 0x14,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 33000000, .hldt = 0x15, .dbcnt = 0x1,
+		.sclfrq = 0x0, .scllt = 0x19, .sclht = 0x11,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 30000000, .hldt = 0x15, .dbcnt = 0x1,
+		.sclfrq = 0x0, .scllt = 0x19, .sclht = 0xD,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 29000000, .hldt = 0x11, .dbcnt = 0x1,
+		.sclfrq = 0x0, .scllt = 0x15, .sclht = 0x10,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 26000000, .hldt = 0x10, .dbcnt = 0x1,
+		.sclfrq = 0x0, .scllt = 0x13, .sclht = 0xE,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 25000000, .hldt = 0xF, .dbcnt = 0x1,
+		.sclfrq = 0x0, .scllt = 0x13, .sclht = 0xD,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 24000000, .hldt = 0xD, .dbcnt = 0x1,
+		.sclfrq = 0x0, .scllt = 0x12, .sclht = 0xD,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 20000000, .hldt = 0xB, .dbcnt = 0x1,
+		.sclfrq = 0x0, .scllt = 0xF, .sclht = 0xA,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 16180000, .hldt = 0xA, .dbcnt = 0x1,
+		.sclfrq = 0x0, .scllt = 0xC, .sclht = 0x9,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 15000000, .hldt = 0x9, .dbcnt = 0x1,
+		.sclfrq = 0x0, .scllt = 0xB, .sclht = 0x8,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 13000000, .hldt = 0x7, .dbcnt = 0x1,
+		.sclfrq = 0x0, .scllt = 0xA, .sclht = 0x7,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 12000000, .hldt = 0x7, .dbcnt = 0x1,
+		.sclfrq = 0x0, .scllt = 0xA, .sclht = 0x6,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 10000000, .hldt = 0x6, .dbcnt = 0x1,
+		.sclfrq = 0x0, .scllt = 0x8, .sclht = 0x5,
+		.fast_mode = true,
+	},
+};
+
+static struct smb_timing_t smb_timing_1000khz[] = {
+	{
+		.core_clk = 100000000, .hldt = 0x15, .dbcnt = 0x4,
+		.sclfrq = 0x0, .scllt = 0x1C, .sclht = 0x15,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 62500000, .hldt = 0xF, .dbcnt = 0x3,
+		.sclfrq = 0x0, .scllt = 0x11, .sclht = 0xE,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 50000000, .hldt = 0xA, .dbcnt = 0x2,
+		.sclfrq = 0x0, .scllt = 0xE, .sclht = 0xB,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 48000000, .hldt = 0x9, .dbcnt = 0x2,
+		.sclfrq = 0x0, .scllt = 0xD, .sclht = 0xB,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 41000000, .hldt = 0x9, .dbcnt = 0x2,
+		.sclfrq = 0x0, .scllt = 0xC, .sclht = 0x9,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 40000000, .hldt = 0x8, .dbcnt = 0x2,
+		.sclfrq = 0x0, .scllt = 0xB, .sclht = 0x9,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 33000000, .hldt = 0x7, .dbcnt = 0x1,
+		.sclfrq = 0x0, .scllt = 0xA, .sclht = 0x7,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 25000000, .hldt = 0x4, .dbcnt = 0x1,
+		.sclfrq = 0x0, .scllt = 0x7, .sclht = 0x6,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 24000000, .hldt = 0x7, .dbcnt = 0x1,
+		.sclfrq = 0x0, .scllt = 0x8, .sclht = 0x5,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 20000000, .hldt = 0x4, .dbcnt = 0x1,
+		.sclfrq = 0x0, .scllt = 0x6, .sclht = 0x4,
+		.fast_mode = true,
+	},
+};
+
 struct npcm_i2c_data {
 	u8 fifo_size;
 	u32 segctl_init_val;
@@ -1805,102 +2064,45 @@ static void npcm_i2c_recovery_init(struct i2c_adapter *_adap)
  */
 static int npcm_i2c_init_clk(struct npcm_i2c *bus, u32 bus_freq_hz)
 {
-	u32  k1 = 0;
-	u32  k2 = 0;
-	u8   dbnct = 0;
-	u32  sclfrq = 0;
-	u8   hldt = 7;
+	struct  smb_timing_t *smb_timing;
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
+		smb_timing = smb_timing_100khz;
+		table_size = ARRAY_SIZE(smb_timing_100khz);
+		break;
+	case I2C_MAX_FAST_MODE_FREQ:
+		smb_timing = smb_timing_400khz;
+		table_size = ARRAY_SIZE(smb_timing_400khz);
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
+		smb_timing = smb_timing_1000khz;
+		table_size = ARRAY_SIZE(smb_timing_1000khz);
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
+	for (scl_table_cnt = 0; scl_table_cnt < table_size; scl_table_cnt++)
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
+	iowrite8(FIELD_PREP(I2CCTL3_SCLFRQ8_7, (smb_timing[scl_table_cnt].sclfrq >> 7) & 0x3) |
+		 fast_mode,
 		 bus->reg + NPCM_I2CCTL3);
 
 	/* Select Bank 0 to access NPCM_I2CCTL4/NPCM_I2CCTL5 */
@@ -1912,13 +2114,13 @@ static int npcm_i2c_init_clk(struct npcm_i2c *bus, u32 bus_freq_hz)
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


