Return-Path: <linux-i2c+bounces-7487-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D54B39A5A55
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2024 08:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55A1F1F2309F
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2024 06:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 064AE1CFEB0;
	Mon, 21 Oct 2024 06:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NAsPQvEn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7321D0DE5;
	Mon, 21 Oct 2024 06:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729492077; cv=none; b=Z1QD3QypfwSAG64G0Xd5fgn0pc9tlsOKPyp9fz0FBdxOMY97offfuM6rC7RDkknPe6yi4Pt7Fb/yjqD2XIMtTOdT9PLcJ+p6bhrjAFUJRLJqKfiYZ9fPst/mw344vyj0/uqwlprJIKnAbZqspl/mBDhJb0T3mAa2rbBmpQn5Ag0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729492077; c=relaxed/simple;
	bh=uC8G6fUReWllIcgbFLRPhRrMPL8BfZoaOJT86Dt0yqM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=M546GYEab4FJ/f9GblBjl3XXdtAtMNEEQ5hJi/WXFvp8tITL1j/ELJiclBzlVwvrgDzAMAGdBjpgYQC/RGI9k5c/HZJ6mHDub6h0IfnV/aEvRZmh23mJ43iOiGhcMr5gXUWIjPLD355Tu8rsPEr5XcfyW4IvZdJt1MgfNrYvlTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NAsPQvEn; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3e602994635so1332384b6e.0;
        Sun, 20 Oct 2024 23:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729492074; x=1730096874; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eWSyC2espM7ydjn5gySkWbFjXNw5iBOec49BkKYhVoU=;
        b=NAsPQvEn1ky83g0mEpL7Q/N9Z/9WJOzpVXUlN23lbuUYMQBQL8LNndGjiT5fgQtA0j
         cnmTMHx24YwhOBMO9HeFBdPjjDGC7ZnI1mpz7kRpMwcfVjMwlklCTdXRaPeDq37V8qBe
         US/SjsyBD91Ag3xLW+mJsrwr8jBH/8H1/mFQi+jkAFom4PxDj6x4UHPTQ9Ik+OPQ3kSA
         P8JAZbLmWHELhIcGTSc1t+H9IaMDifaPNwdeOWJCoTtjLmmCxnvktk5nDQBzVCQ4F9vC
         n1kDBRzfCkL5Z2bt1eRS9Xht57rMzrOf67zQRChFrU7z2My8HFP8GBSMJ2rtA3txHH1V
         zFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729492074; x=1730096874;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eWSyC2espM7ydjn5gySkWbFjXNw5iBOec49BkKYhVoU=;
        b=QPkyT/ofaV5n6ZIFaccMYM+r1h1kqY/e+d9pcm08/feprtfWZuUHPegOGk/1PNtmuN
         cyWavgyL1BCksnba0Gahkus0MZ+c36e38qzYqQ9nMEpqmqOtubECCs/EBcQa2KAwXMgp
         Od7gv7rqkTHfprb34rZuTbyFzjT+/hnKxYi6Wfb7c56sCBWQxknvEm3tUWiJa6ROuqdD
         TYH3aym+zDJKLwlepTY/fv6UKa6470QKbTu3Lzyay5DrZBq/kEfg93lRSujjP79RZLei
         xVvGTTuM3dnb4K43JGJQY5eGExbmv4WQ1Zqb08eNwB3fKbtwG08cEyqSEupOmfNtXcwP
         k7Ew==
X-Forwarded-Encrypted: i=1; AJvYcCX3v73DbOozPORK2dD6PSBcpydzcJnZybgwthXOhZ0MbwVo+OSFOj4aZsJ+jhqzfk/JtS655EaFDR6aLUe7@vger.kernel.org, AJvYcCXVEIGaCjxhoHxIY5tJuogqH+WiE+T+fAddPujan8uF6RY6L8HU+7rUHKGuI4cGUAlThGrW3oUT0E8=@vger.kernel.org
X-Gm-Message-State: AOJu0YygUqnJIm+xJnvWokeN8N2UadwiMI0Ck4y4ykI1PmSq/zZ9Ptd8
	n5hrkvYlDwke0rkegYW4AKU6werYCx/uL6jI+2V/9Ct/NwANUqE=
X-Google-Smtp-Source: AGHT+IFfNhZWzGxX849ort1Ktd6Xx0TzIu5FQjYTFFlchl2XNZZ5PZ+BFx5OnrOYHlagj8I8RrivPw==
X-Received: by 2002:a05:6808:3197:b0:3e5:f9d0:b33b with SMTP id 5614622812f47-3e602bccb5dmr8701179b6e.0.1729492074493;
        Sun, 20 Oct 2024 23:27:54 -0700 (PDT)
Received: from localhost (2001-b400-e38e-c9a7-dd38-775c-4093-c057.emome-ip6.hinet.net. [2001:b400:e38e:c9a7:dd38:775c:4093:c057])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eaeaafd36esm2283088a12.6.2024.10.20.23.27.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Oct 2024 23:27:54 -0700 (PDT)
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
Subject: [PATCH v7 3/4] i2c: npcm: use i2c frequency table
Date: Mon, 21 Oct 2024 14:27:31 +0800
Message-Id: <20241021062732.5592-4-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241021062732.5592-1-kfting@nuvoton.com>
References: <20241021062732.5592-1-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

From: Tyrone Ting <kfting@nuvoton.com>

Modify i2c frequency from table parameters for NPCM i2c modules.

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
index a9a9b21f1f0b..7c13f9f6014a 100644
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


