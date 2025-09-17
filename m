Return-Path: <linux-i2c+bounces-13022-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D02B7F7C3
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 15:44:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A724E18835C9
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 13:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2FD831A7E0;
	Wed, 17 Sep 2025 13:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bSXkvAxL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D1032E722
	for <linux-i2c@vger.kernel.org>; Wed, 17 Sep 2025 13:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758116197; cv=none; b=U0vIJzUdoOEbwJK+rAPwkrvo/oOBGacHaJ5HqrMFVfnj0obES63JmyaKzDmLhlD5DOqsw0xSrYmP5kJHMjcGfRO+Hkf1Y2dB8ctKK/uHT41WwAac0gwyjbu2I5Mblv/y6CMpo4jNENVlvfyPmP5LD45NrJKk85NuawWMthUXRBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758116197; c=relaxed/simple;
	bh=weuJ2MwlJxBeJO+3XDOOSJC+wXIGaL1+YZNafT+N/Mc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=omgQXiJRoXTEE4154NRKnF1m7l67nZn0aBX4AOON1S7CKgQ/HzX62phNVP1EZ82v4bXwJJlVXWr5yLym98FfMGzX6NdIDGgVDNgzMz9swlkqikYHrXd2JqaXAWwoFEF6gTpeJmYZW8joZW3ZzC9OI6cymd+zgfcw4yY9QSLx+zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bSXkvAxL; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45dd513f4ecso41822335e9.3
        for <linux-i2c@vger.kernel.org>; Wed, 17 Sep 2025 06:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758116194; x=1758720994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+llRWMjZnfsGeESVFG4qICneYksOTb64WbcBHPF4Fo=;
        b=bSXkvAxL3sOye9sHUhR/L07JqaUoXTRp0X803v7fle/Ilzd7oFMxw2Q9K777tMS0RV
         s/kr8cOwsAO4cnI/81tWE4kzSDhoTFmmWZk/PT+ygm1dj88Uw+JXJbKjS7uTee7Fxke1
         RlOhg0lRJnpcIhDIBCfakEyqKyWp78U5nPOebBC60tVWmeOx438klGFdWZcEjZ7FlQPD
         za/rHte7ZpNXtR2oYYJsGbaNbdxdNdONysTaWNDAHrAdtFS6s04J9glINJT6v4dJjEx8
         ujxsLfnPMhk7hPxsCNH8avoE0ujB9bXI+IxnYR7P2aaVT0pwYtZJM6WFPlxbAekI/2O/
         yFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758116194; x=1758720994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+llRWMjZnfsGeESVFG4qICneYksOTb64WbcBHPF4Fo=;
        b=m1vf4JYtL3Eppq26GT6kl+IceBkKHiU8jO6xFGkuABPOaayU3q9CZ7S0eNgn01Pe9U
         ao6G/PjNzOOvVINpWbu3JNwG5KjdC4s7SsJ/36REZPCdoUoTksIkMoU2EZu/v/pl0qCN
         RUoZ6fO5DpBLUqGTvsa7sV/ZXTHKXyRqnGmiORZ8uU99pOMy8uGmUTMRlMUVVpsfv6CI
         ut2iI17wrxRYc3c6RMG/Syfp6O/Of2bNQBmGqVNtpZMgWhuPo0w0qH1tsyYS1qB5YR0M
         QapOHzKsDLnXo18Yu/gu4NqtF/Jj4cmgYP0ENlsTVo/PBjzha5JB/rvykVbkWxIfNprH
         3p6Q==
X-Gm-Message-State: AOJu0YyNBKZ6UEQNEd1OKq+qKjkcjDurh0x6PR9a1adbYVKKfQtfGTk6
	xF+BShBtOFztHyVX4cX8+AR2xEbpvYQsnWxpQiGrwJYvtTjC1S5TkSsB
X-Gm-Gg: ASbGnculvKvpadFJb6R07q7i1pK8gbSeE8BQUePiDHMZqWGt9WqU/jt5XxkgCvmf4jK
	uOa+W53Y+Dfl+yLhbOAf15ce/HSPQbq6NC1DnzGdB7LtchBqvAM/aS6E6OblEeDcgLr4J/2Lzgg
	4auyZAuQnGeLeJyHZtqLamy4pvJQGnghHbEGOKz06UFFFIHHc16ulMjJ1pQWb3DkCK9Ol0GZpX1
	lO55+ouqzEEIpbABsWIF13YxYMGSaXkwpBpEYDEC9lhRmAhM6aLlEY9fSCYTf4YQSMc0iAgEkdK
	13/eU9We5gTZ3ZIW+mrIjd3p8NfsPcl8jDbtvbHbneQeTbJy6/IkXS5nTU2Ighpsgr0wo9ZH2WN
	2Bo49IQ8HIXeCBy1pXVS/qUagA8uKbw==
X-Google-Smtp-Source: AGHT+IFJI8G7cdnWUw/QiXu4qHdTrxEzX22AW0w1LeHd0HI1xhxL8mn88vmRE381tEEksdN7lr43VA==
X-Received: by 2002:a05:600c:4690:b0:45b:8b51:b1dd with SMTP id 5b1f17b1804b1-462072d6e38mr21707515e9.32.1758116193979;
        Wed, 17 Sep 2025 06:36:33 -0700 (PDT)
Received: from hangmanPC.. ([86.124.200.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46139ab391bsm38198075e9.21.2025.09.17.06.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 06:36:33 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH v4 2/3] i2c: pcf8584: Fix do not use assignment inside if conditional
Date: Wed, 17 Sep 2025 16:35:23 +0300
Message-ID: <20250917133524.85063-3-chiru.cezar.89@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917133524.85063-1-chiru.cezar.89@gmail.com>
References: <20250907114557.15453-1-chiru.cezar.89@gmail.com>
 <20250917133524.85063-1-chiru.cezar.89@gmail.com>
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


