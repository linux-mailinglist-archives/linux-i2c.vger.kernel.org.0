Return-Path: <linux-i2c+bounces-12776-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7918CB48FD2
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 15:38:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3815A3BA841
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 13:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC54230CD87;
	Mon,  8 Sep 2025 13:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NeYoG7A4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17E630C62A;
	Mon,  8 Sep 2025 13:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757338614; cv=none; b=pmvi6nNN5I+g2Qo/V9oBNGOJjYlkNN+iAOTwHerXWUbW9PfPGVMrdcQ9gi4tHMeD1GnzUuDJpVOlO1b1VDBa+zi5PYkrn5hFC/PxuQDYonZ51Ycirj5TK55JG+XglrUYfwxey1QVprHr/aHu0R0+KDlKqQpW3MfewUgQqzYAUas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757338614; c=relaxed/simple;
	bh=QVdNreyj/j6+OBeT5n5Odn09eL8RXcI6GMyfGx53hLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mWXLv3hm+fUmOq265STJxLYuEfK357uocEFagBCoKyBH4yg5/ktgeTiYSXporx9e+j/CeUEvb/mfAAAzHPms8s8uCISaTxXFHjQoxnQo8her2lcGpDZP6r34SIj5ugaVJBtGDtXhYh5iILGcanQGRXjJlUl7mmkoCh4RO1NvD6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NeYoG7A4; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b0415e03e25so614039366b.0;
        Mon, 08 Sep 2025 06:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757338611; x=1757943411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66U13vMoKlAR6KyBLgh704oM98OhgpU0LOQXWOT4YKE=;
        b=NeYoG7A4gZNK4LqM4fQvJl7yY76EHMCJq9kCnxC/hSf3bNjhPgG8RSFV+40F3mnGUt
         k1pdEeZzCzTGNScHCucwMFNEZkwhlI/DUnl+8zI10wugiqN3qoWw2yknYDYfR9qh8X+S
         wqh9t0+y9lPi/dVXwQ10lEiQZ5gCYO6KT+XGB+4hADrNu+RuuEQ8w5z+4owH9LM3WKri
         MAA6c67E+tvPlXAKDjKWHAZ+2dHqCmXLe4h+PDC/UV0HGVS5Df/vbkgoYk9EoFwDd0hL
         NS8YpbcIiTqOGV0axEQkij0ZlYoDB4wI+ZS82wKZhuUHx8Q3S/iivtNMeogH/bdm6CxP
         NPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757338611; x=1757943411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=66U13vMoKlAR6KyBLgh704oM98OhgpU0LOQXWOT4YKE=;
        b=IxZx+CidPyurUd4nDWBsS666chgWI7xyb/Q7TedyRH8xtMsityVAiqC+UNFClI4/Rd
         LSs1nCxTd585WuLgTQ6OEYqzbkckt3nl21VnLPbDGcEpI7cHDP2aBrDBh5lqoPe+Wdte
         laIx3pbIdC/IYbitWYuoOURIBLhafr77FAONHwef+LqmqOzc1jxHG60VUfWiFb8Cn1SO
         D9B98FTZMI4h+eUaTZsblF8+Y1sKJaUzsVdF5adEhN7UiLbfacaK3M66JXee48PmAjWY
         u5tEYuIJRLnzGQP9mxmVlKFb67Vo0T2juSG9NiZy1E3EOeJHrSQhm7flcnWnkYDYy/q9
         vbCA==
X-Forwarded-Encrypted: i=1; AJvYcCWViip6fVvhlXh5F6Bma71Sh1s7h6NXAXqyuBSe0BPvrJp/BzZnLsGXH7CfvCTQ9k29RwCxZgFt+r0vBBo=@vger.kernel.org
X-Gm-Message-State: AOJu0YywD7NzeJQCBeItpWYkWvQE0FNflXnKCIxvjA0mvmwIRiYrpXeE
	cTlSB69IN1qhFn1OI6R79qgrPXkjxXVTuDQIBy2FIcarDP7RiEuNf/tQ
X-Gm-Gg: ASbGncuX8L1DwzKo+l/OsIdAwxJMY9RilcTucqETaxv5yWAQbky9HZECnaURtF5bPx1
	3FpYjnRKF3tAQuq13oEEYP6NyBzc83LKAfR0lTr2oU5emz+UG7z90etRS/7wJ2UC4gcngWZUBRs
	YJmMuXkV/zq0p6hfr4hfmZIvaXK0l9nlai5T3ih7JEQnZHA/uxXIlChg2QvK+Zljs9gHC4MZt2j
	KseDrUsI/wf33AwkK/SqdLzotKHpSIfCcYs3GdUq2IHeGqBDMNnrYDZfNKStG3KavoYeCJw5ok7
	KiZVeuqlrtQ9SRVN4qM33MkhRfZp4i1tCXCV/8KuImq8O/49Xzy3KMoyZCMY/qBZChanZelysU9
	LLuqo5WRBNxhk1U7ttpW4PRpMnaak+Hi7haqa7It3I/ngviTMgx0=
X-Google-Smtp-Source: AGHT+IGfqxPm+iisZIXvcjdvhT/1FPFmSECOw5PWkB4R+rcbdQm+qEfAgY/DNTD/HvGp1OP9NYSUSw==
X-Received: by 2002:a17:907:3c8f:b0:b04:3662:971 with SMTP id a640c23a62f3a-b04b172eaf0mr672253766b.65.1757338610765;
        Mon, 08 Sep 2025 06:36:50 -0700 (PDT)
Received: from hangmanPC.. ([86.124.200.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b040a410817sm2177352266b.101.2025.09.08.06.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 06:36:48 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: andi.shyti@kernel.org,
	Markus.Elfring@web.de
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH v2 2/3] i2c: PCF8584: Fix do not use assignment in 'if' conditional
Date: Mon,  8 Sep 2025 16:36:07 +0300
Message-ID: <20250908133608.45773-3-chiru.cezar.89@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250908133608.45773-1-chiru.cezar.89@gmail.com>
References: <7e155481-b1b7-48db-af64-6a313ade1bbf@web.de>
 <20250908133608.45773-1-chiru.cezar.89@gmail.com>
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


