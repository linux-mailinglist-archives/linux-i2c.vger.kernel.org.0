Return-Path: <linux-i2c+bounces-13209-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E23EBA479A
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 17:46:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B0121C0685E
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 15:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5370B22D4D3;
	Fri, 26 Sep 2025 15:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Co211V1K"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D074226D14
	for <linux-i2c@vger.kernel.org>; Fri, 26 Sep 2025 15:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758901603; cv=none; b=j22J5DzJaoRVXgnsqk85epaIgwH+UQDZ0BOfeDg1veUoEh7/+E+dnfmNWGDR8oIdCYsykLZ2RBs8jFxFc5Y1lBXsIUA6uunFanlRbjYqcGtQi40iRzGLX4Yiv597KFM3pZxLcO0vO0CelVW50XqFZ6Lzq8yPa30LlZQVa/+52mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758901603; c=relaxed/simple;
	bh=izxo3ytX2ky75prMgX2DgMzwqLU8Fc5i50fDUC6VwRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pz5/Afj0AzvCLH4ijfpSKHN//wQ+3StgN4GmI83wSvCnbLwHvkn3NHbd4NEp5Jf2YmpyLhicAzxxZu6fXfpZZVFBzuFhq8VcO9ZUpFfqPc7uWoJtU3CmXfoKuzFb4scw87zZbFzjWvmHWZZC/0wTHa+lL/77dSK1AQn9/81PddA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Co211V1K; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-46e37d6c21eso13824315e9.0
        for <linux-i2c@vger.kernel.org>; Fri, 26 Sep 2025 08:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758901600; x=1759506400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vyjd34dpouHtYVk7+69nnp/gLrS87XY89ac0686uOuA=;
        b=Co211V1KRseMMADs8x1nCsYi4iw20FPQ85RXqmIl3HB3qsSIO4zE3M5J8TyM1ixzDP
         XdCkA3Zz5tC0cH0TgwkIXlt83zLg4m9ZGw0HAA78412Ouoy330vjPQMaKvKMuuMWzl+Q
         pARGIiRF4Rv8SJ5ZYvU20O7sdvSw5ON8JGsDa4uQavf06WCFcPvGXrHGg5sQ9GVyI66e
         gD4qu9nJNQtbKwiazUISGJXemwyj9fEL+tJEQaH3VhY3q+/r4GtoDjRDOUWlQTLv5veB
         64vnedQVg5f1yrN5rmz1vhEJQ6ZYVeVMPSg1LP8x2PdblxQg1QekTMIAalSvd1ZEeSM1
         OUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758901600; x=1759506400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vyjd34dpouHtYVk7+69nnp/gLrS87XY89ac0686uOuA=;
        b=Vn68JD1XYq8uq8A7MJobjh/WiwMmooBxZjck7gkOsb0nK1kOuedRIjmsJmc7wxMgs5
         HZFyX5UD3QHduG/JKsuMzPDwZeMNGOgmVhTjaZhy7LN5dhwhq4Q7ZVbTs2aNN70Tw/za
         Qwk/QLStaQ1WZEC2kyBmJm4JYvVft4izU1QBLdWL2b8tj5vAFDuTRo+Cnc0xpKK4Di/C
         QhdcNw+UpPU+vm3rkfesOLbfq8xwqKK/RdGPbkSOE37RFbmm2attqneCvqO/FXQwidst
         PRkSDUZItGrCWwE0cSx2LmEJgRwVEK/i9IqaJFTBpjC4DrWenWDjeP87T0vsQrpvySLC
         xn4g==
X-Gm-Message-State: AOJu0YwTUSDZAVJknialXwC6z4i3xeFKOc7/UUdCJVPe9HEAKoKEm63o
	GpbE8+OCe/63yOZSOtJm3Ej8ggJbFUKfAO4Ms31XFqpEKdkWtiNf3eYI
X-Gm-Gg: ASbGncse9M2BYRSjcqbFUcop4ILLD5ZZttZkQ4/brYQVeN6LDwsMoM7ZFtEuDeeEWzY
	DP2znSo2M+99jt2CPBJTehrbAQ0YZHBL8qxhSTy+fICzj74wUTXqgdDRuFYNTwExhFkI06P6GeP
	AgMeLRNgdlISG7fNRtq15vVE2OGWXj1KkRs89J1cRWhf5gxS/mZJdNMUhbg4wF6qLMfL4PQKZX0
	X32oik+CeXvwUXO3eS6JCfzxXjLBfdPo1omd7rrsuKBXUVZjjBP0hfwzqRkgZ9K60kWa0O+JshN
	7/meG9gRuCSlRqexrM0MAeEDCaP3ELF/Tqn+nRyFvI527Deluq3Pk/wZn5fKGL5mlTmHPk7+8C4
	RpJ8YnQ14do1AZX04GT0pqrTqqCkdIA==
X-Google-Smtp-Source: AGHT+IGhhkmyEQtreInOjJEwlkT0VZ/84Cyff8vq+9aMQpAeAZgSoLH6iUa3PKUXGrgvGvL5GvnuKA==
X-Received: by 2002:a05:600c:3f12:b0:46e:41e6:28c7 with SMTP id 5b1f17b1804b1-46e41e6293fmr25386685e9.8.1758901599404;
        Fri, 26 Sep 2025 08:46:39 -0700 (PDT)
Received: from hangmanPC.. ([86.124.200.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e32bcd016sm41680005e9.1.2025.09.26.08.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 08:46:39 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: wsa+renesas@sang-engineering.com,
	andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH v5 2/3] i2c: pcf8584: Fix do not use assignment inside if conditional
Date: Fri, 26 Sep 2025 18:45:19 +0300
Message-ID: <20250926154520.40583-3-chiru.cezar.89@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250926154520.40583-1-chiru.cezar.89@gmail.com>
References: <aNUa-9HcQzyjZkvE@shikoro>
 <20250926154520.40583-1-chiru.cezar.89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Assign inside of 'if' conditional is not allowed. Move assignment from
inside 'if' conditional, to one line before each 'if'conditional statement
that caused errors.
Enforce errors fixing based on checkpatch.pl output on file.

Signed-off-by: Cezar Chiru <chiru.cezar.89@gmail.com>
---
 drivers/i2c/algos/i2c-algo-pcf.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-pcf.c b/drivers/i2c/algos/i2c-algo-pcf.c
index d4d82f3729d3..c856f4c8e3de 100644
--- a/drivers/i2c/algos/i2c-algo-pcf.c
+++ b/drivers/i2c/algos/i2c-algo-pcf.c
@@ -148,7 +148,8 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	 * check to see S1 now used as R/W ctrl -
 	 * PCF8584 does that when ESO is zero
 	 */
-	if (((temp = get_pcf(adap, 1)) & 0x7f) != (0)) {
+	temp = get_pcf(adap, 1);
+	if ((temp & 0x7f) != 0) {
 		printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't select S0 (0x%02x).\n", temp);
 		return -ENXIO; /* definitely not PCF8584 */
 	}
@@ -156,7 +157,8 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	/* load own address in S0, effective address is (own << 1) */
 	i2c_outb(adap, get_own(adap));
 	/* check it's really written */
-	if ((temp = i2c_inb(adap)) != get_own(adap)) {
+	temp = i2c_inb(adap);
+	if (temp != get_own(adap)) {
 		printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't set S0 (0x%02x).\n", temp);
 		return -ENXIO;
 	}
@@ -164,7 +166,8 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	/* S1=0xA0, next byte in S2 */
 	set_pcf(adap, 1, I2C_PCF_PIN | I2C_PCF_ES1);
 	/* check to see S2 now selected */
-	if (((temp = get_pcf(adap, 1)) & 0x7f) != I2C_PCF_ES1) {
+	temp = get_pcf(adap, 1);
+	if ((temp & 0x7f) != I2C_PCF_ES1) {
 		printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't select S2 (0x%02x).\n", temp);
 		return -ENXIO;
 	}
@@ -172,7 +175,8 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	/* load clock register S2 */
 	i2c_outb(adap, get_clock(adap));
 	/* check it's really written, the only 5 lowest bits does matter */
-	if (((temp = i2c_inb(adap)) & 0x1f) != get_clock(adap)) {
+	temp = i2c_inb(adap);
+	if ((temp & 0x1f) != get_clock(adap)) {
 		printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't set S2 (0x%02x).\n", temp);
 		return -ENXIO;
 	}
@@ -181,7 +185,8 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	set_pcf(adap, 1, I2C_PCF_IDLE);
 
 	/* check to see PCF is really idled and we can access status register */
-	if ((temp = get_pcf(adap, 1)) != (I2C_PCF_PIN | I2C_PCF_BB)) {
+	temp = get_pcf(adap, 1);
+	if (temp != (I2C_PCF_PIN | I2C_PCF_BB)) {
 		printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't select S1` (0x%02x).\n", temp);
 		return -ENXIO;
 	}
@@ -234,7 +239,8 @@ static int pcf_readbytes(struct i2c_adapter *i2c_adap, char *buf,
 	/* increment number of bytes to read by one -- read dummy byte */
 	for (i = 0; i <= count; i++) {
 
-		if ((wfp = wait_for_pin(adap, &status))) {
+		wfp = wait_for_pin(adap, &status);
+		if (wfp) {
 			if (wfp == -EINTR)
 				return -EINTR; /* arbitration lost */
 
@@ -394,7 +400,8 @@ int i2c_pcf_add_bus(struct i2c_adapter *adap)
 	/* register new adapter to i2c module... */
 	adap->algo = &pcf_algo;
 
-	if ((rval = pcf_init_8584(pcf_adap)))
+	rval = pcf_init_8584(pcf_adap);
+	if (rval)
 		return rval;
 
 	rval = i2c_add_adapter(adap);
-- 
2.43.0


