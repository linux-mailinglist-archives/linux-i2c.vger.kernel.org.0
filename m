Return-Path: <linux-i2c+bounces-12769-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 817B6B48BE7
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 13:19:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A44D162B96
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 11:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE839303A1D;
	Mon,  8 Sep 2025 11:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HRDUkYcg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EEF2FB086;
	Mon,  8 Sep 2025 11:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757330086; cv=none; b=OqcKRkXQp9J25EHcu/cVg8iLQwrg9QM6mf+t9oeq7k4E9vu5ydv2Aowy1sBIMBb1e26Ls7IM9vJed9j/msPxZwQAFHY5Y/RN5PCj7KEB2vRuY5UGrhGbHtltC2ykefhqsPakVeZ2DjBG45xpxfFp69i3yeJlN7XILYLWe9aeaps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757330086; c=relaxed/simple;
	bh=QVdNreyj/j6+OBeT5n5Odn09eL8RXcI6GMyfGx53hLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D42n3UIOSnYlukued1yspArXygxBIW48WGbz6OvNNszbu4AGi5sxZ2XGk8tsdgpk5EELYJZDKOVzec8t5rCRkWJVop79ZvRCgS1CpQzEUaTADU2L37G7lwBZX3nXOjNOLNEekfUm6+HOMfve1jwmNx1HnIun8Nhg0NePleqsLHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HRDUkYcg; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b0475ce7f41so755604266b.1;
        Mon, 08 Sep 2025 04:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757330083; x=1757934883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66U13vMoKlAR6KyBLgh704oM98OhgpU0LOQXWOT4YKE=;
        b=HRDUkYcgF2EjDKUBS1Tl8uWOW/3oQ3oJUmRHVKJbw8dIzum+0Qw66pLubdOnP47LlL
         1mKD6exyQVSiV1XOvv7/Uj2G5yhj5/OjWTmhxtcZg7yka13geuX+oOMOgEwz//dkw5Q5
         QxS0049fA3fiYwskhA2a+njvPXIyuoXTcPMCQsMlAHV2FwHW/uEFjhsvxJyDjL6uxEjN
         sH1D2w/nFpICZrLCrNinFyV8VDBpY9hd5aONW5GHoMrKNFhuCePvQl9eFCSnLsvnG/tH
         rPORd4V+SpJ7HR2rFoB9y0+wwXteNZh24ZzsMriCFYAV3+zj/6p6WJihClSKZYF4/gxb
         hfNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757330083; x=1757934883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=66U13vMoKlAR6KyBLgh704oM98OhgpU0LOQXWOT4YKE=;
        b=khuzsM6wZyQ3QJ4ni8/ArBND3hGGMlSaIgIyQZP8a7X7KHcxHW+zW80AdQbGrD4fHH
         MMANRx85YEILgS5Ll98bkEgMph6D4DuJq9B9p61PkLIiSdqVYEYTxKPdGovkhyy1o84L
         6zVlfAu5rkQINUfgtQSAa5dkHX2CKY3x+YJBn85kzAtRFASHgMceQ570B8e28eSwhdfo
         Rge25JQKYwH4/KU3qqjjhmjnqbFKiGG3ablaNJCyT4guAwG6t6NHgKJ5d2TJtTRTSGSw
         A3vDk1ibslA2DZeEQ4nhX12yX+mikXoX1yEqOlcNrAD2VCdaLy6lGhOBPQ0JjX2EGyoY
         HOmg==
X-Forwarded-Encrypted: i=1; AJvYcCX7V9bIKHLQH8qxEKAkrVmlvsz/v53rBm35k44Xzcry95PjO3v45IkVCtQ/VerB0/DFLx4PIhAV43ayaUs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEcXg73v0dKDofFO9Q2UdVkvqo9nmesE3njC4mgQiWLRsfgm4t
	wILPOoEqZKIe9/WJd8BlKwW9z/CikIE1EYdL/7R9zYaq6DQj33O2jnAn
X-Gm-Gg: ASbGncsdYkHy7kcixtLkyggqjQObjpUfGO0l/gIa2ALn9J0AyS+xtZKkkQLxXPJBNHM
	4+qaJnBZzE/CmMeZV3Mk/ioZIpJScwaKX0Ws1yfdRQbSQ3q7pwNcWpKPXXNKFnwaeN7+Vf9/1e2
	ya4dXyMPlmGSHDv2g5dmTeYXZT5qtvZmwLNADQ2LfzuaMIfePCdFekbOqgxiQLGye78GNAZhym8
	r1aJqPxf0rD4OD+vMOvVZ6zF+txGtWkYZjqOs8PnE7CJswz196QiMWgNK+NyZiJea1d8Qo0MzS4
	zSqLtXbgPHwPD5iwhTuT+dW1OEwQbdaHyONvjEFx16t3kt71hmq+iYOfNFRHwzs+IKdqKeuvZFN
	ZajTpQBcuaWvAWLw0HHLTMd+zWo0l9sflLLhM2KNn
X-Google-Smtp-Source: AGHT+IEohxXdFrMXghDMqya4r3GJDnxAJjIsW5bwjZzKjXzMyMJqLnPF4XZFHF/d9W+QmiqCzC5FUg==
X-Received: by 2002:a17:907:7f28:b0:af9:d80f:645d with SMTP id a640c23a62f3a-b04b16d44admr827433866b.57.1757330082872;
        Mon, 08 Sep 2025 04:14:42 -0700 (PDT)
Received: from hangmanPC.. ([86.124.200.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0470f11088sm1211333966b.111.2025.09.08.04.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 04:14:42 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: andi.shyti@kernel.org,
	Markus.Elfring@web.de
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH 2/3] i2c : PCF8584 : Fix do not use assignment in 'if' conditional
Date: Mon,  8 Sep 2025 14:13:54 +0300
Message-ID: <20250908111355.79222-3-chiru.cezar.89@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250908111355.79222-1-chiru.cezar.89@gmail.com>
References: <adb7d136-eba4-4ed2-b893-4f7c43f8d678@web.de>
 <20250908111355.79222-1-chiru.cezar.89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed errors usage of assignment inside of 'if' conditional
statements. Revealed by checkpatch.pl.
Fixed by moving assignment from inside 'if' to 1 line before each
if conditional statement that caused errors.

Signed-off-by: Cezar Chiru <chiru.cezar.89@gmail.com>
---
 drivers/i2c/algos/i2c-algo-pcf.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-pcf.c b/drivers/i2c/algos/i2c-algo-pcf.c
index 3fc4b5080a32..598bf000bf4a 100644
--- a/drivers/i2c/algos/i2c-algo-pcf.c
+++ b/drivers/i2c/algos/i2c-algo-pcf.c
@@ -169,7 +169,8 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	 * check to see S1 now used as R/W ctrl -
 	 * PCF8584 does that when ESO is zero
 	 */
-	if (((temp = get_pcf(adap, 1)) & 0x7f) != (0)) {
+	temp = get_pcf(adap, 1);
+	if ((temp & 0x7f) != (0)) {
 		DEB2(printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't select S0 (0x%02x).\n", temp));
 		return -ENXIO; /* definitely not PCF8584 */
 	}
@@ -177,7 +178,8 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	/* load own address in S0, effective address is (own << 1) */
 	i2c_outb(adap, get_own(adap));
 	/* check it's really written */
-	if ((temp = i2c_inb(adap)) != get_own(adap)) {
+	temp = i2c_inb(adap);
+	if (temp != get_own(adap)) {
 		DEB2(printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't set S0 (0x%02x).\n", temp));
 		return -ENXIO;
 	}
@@ -185,7 +187,8 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	/* S1=0xA0, next byte in S2 */
 	set_pcf(adap, 1, I2C_PCF_PIN | I2C_PCF_ES1);
 	/* check to see S2 now selected */
-	if (((temp = get_pcf(adap, 1)) & 0x7f) != I2C_PCF_ES1) {
+	temp = get_pcf(adap, 1);
+	if ((temp & 0x7f) != I2C_PCF_ES1) {
 		DEB2(printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't select S2 (0x%02x).\n", temp));
 		return -ENXIO;
 	}
@@ -193,7 +196,8 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	/* load clock register S2 */
 	i2c_outb(adap, get_clock(adap));
 	/* check it's really written, the only 5 lowest bits does matter */
-	if (((temp = i2c_inb(adap)) & 0x1f) != get_clock(adap)) {
+	temp = i2c_inb(adap);
+	if ((temp & 0x1f) != get_clock(adap)) {
 		DEB2(printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't set S2 (0x%02x).\n", temp));
 		return -ENXIO;
 	}
@@ -202,7 +206,8 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	set_pcf(adap, 1, I2C_PCF_IDLE);
 
 	/* check to see PCF is really idled and we can access status register */
-	if ((temp = get_pcf(adap, 1)) != (I2C_PCF_PIN | I2C_PCF_BB)) {
+	temp = get_pcf(adap, 1);
+	if (temp != (I2C_PCF_PIN | I2C_PCF_BB)) {
 		DEB2(printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't select S1` (0x%02x).\n", temp));
 		return -ENXIO;
 	}
@@ -255,7 +260,8 @@ static int pcf_readbytes(struct i2c_adapter *i2c_adap, char *buf,
 	/* increment number of bytes to read by one -- read dummy byte */
 	for (i = 0; i <= count; i++) {
 
-		if ((wfp = wait_for_pin(adap, &status))) {
+		wfp = wait_for_pin(adap, &status);
+		if (wfp) {
 			if (wfp == -EINTR)
 				return -EINTR; /* arbitration lost */
 
@@ -415,7 +421,8 @@ int i2c_pcf_add_bus(struct i2c_adapter *adap)
 	/* register new adapter to i2c module... */
 	adap->algo = &pcf_algo;
 
-	if ((rval = pcf_init_8584(pcf_adap)))
+	rval = pcf_init_8584(pcf_adap);
+	if (rval)
 		return rval;
 
 	rval = i2c_add_adapter(adap);
-- 
2.43.0


