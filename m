Return-Path: <linux-i2c+bounces-12786-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F5BB497C3
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 20:00:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92B11341612
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 18:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EA70314A8D;
	Mon,  8 Sep 2025 18:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DeaJlZpU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEADB31329D;
	Mon,  8 Sep 2025 18:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757354410; cv=none; b=CNdFDuAtQZTenNAeo/pUF8WewiB57eQ+YS9OaH4tPaadlW52yZkDBYaahRPJU0aOueQyJFS8hqGCoNhwZh0lOdWiPXcPH7l911HjUPdq7eBOa30rptdm4kBs6aUne8cYSnMhVFc9spw6PbIfv6ErhBPHLkjdItxSDuLxk+4IfAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757354410; c=relaxed/simple;
	bh=nbnLe17BewysZAff4eVCMKt7iSKn1+GYCNzSzRcSIS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NEC6udW6udvKLRsIb52PdzirselSplcEyjvfDVYz2/49e/XDf0snTtWIelR02V26MGewIwhHyYNb1wD1Sax3sJ9rzH7li6B1a+JbtbCOw6eXJdDQUqr5vFN9eXLiJYW1FFfyM6o3pcWQns0LGQJJ4xVxMssg6lXnt+GVm4kI9v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DeaJlZpU; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b02c719a117so844091266b.1;
        Mon, 08 Sep 2025 11:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757354407; x=1757959207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ElkM4V1kYHxPpAH9h+TJiBnv91qoqyKJAB8yx+IWnd8=;
        b=DeaJlZpU15OjiSajyRSIQw/RdsoUJpEojg54v/ZCB3a9CTEGm75JCbPlAXK9tUPeup
         mUtWoqNipflEeQIngiVHPTLMNe41q3YMfwNvy0CYfoIxDj6+E5PGkliYKtqDoN0xwqFb
         f+T9zFx5CrIe5UbQ9MENcK9YPIlu/xqKDqoLeMvxhxx+TGB9Bn/mUGvMFmUaf1O8VSxK
         b+t9XnjX/fMz+F1LUmZ5qaPRTimy/O5x2EfjYJBwm5iuL1j8zsR52n/Etac0ThjhJ5dq
         JUFqT4IarueyGAoGH/sjkevLzt/npgvLYHH3GJ2tSCZ4FfqjZ/yXiAdD7om253dL0TWf
         +grA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757354407; x=1757959207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ElkM4V1kYHxPpAH9h+TJiBnv91qoqyKJAB8yx+IWnd8=;
        b=lTQC8lO/XiKo0VA4uzhV3TQsc4lFruG4DUlMvl5/Q6TngGhXcb5hSUdufxZiJXGStp
         kTf4gJhsN/zAGZ6jTwwZepLNsgPTAEWGBoMtKK3fK2WJp2WFZG0xVLmYWRxp/c4HGCE2
         RmRsle5zv60HKlkGT4tTTiBDbARAFRKa0BxZ90j7mVBpXrDM2y1KH/ozk1DQ1QqYbM5S
         8L4z/NafoVy1WYzVnlt5Hxq8wYjJNP4AxoXT9SuEqVU3uAYmDVepVkvXhPK+rd8AxH6+
         6ki5ku68IelUt4IZ42g2tpwUjIVTLikeeZ5Z1ofI3rL1uFNWVRSnpak2HIqqq3KyekWQ
         yiNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcBRePdf+I6w9RmlylMrUrkyKLeQZgCc6rPjTMvx1C1Ejd57F9Jy7W+QADvD13lb6QOFCiZ9jnDJtY8aY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxE0PRUnIJDC4//Ztdest/GKFOZXl9gkdz4bX+RquahzJMs6DLv
	1oxePBWrqJLp4zqGDHKQVRuDAfg7KoOsz0ual45iYFfo94Ec0K2N48SC
X-Gm-Gg: ASbGncveL9em+fMihahhLRfvCNNH3MFifMFSO6Vxf07OocrA44kHvUuIGCpy2rredsi
	I4ZpVTeipikJGrXvtx/L+9UA5TvLb2GCzWDwOGlQP9fdot77jNl8IFyjghYo0zBNWG5LkPAMkgt
	ihkyeo9CKPJZTHzJz7jYoCPsBk4pqsRh+LK/IR5qHoDzpyK/F0InQqdZ+2H90KqVA4dkt0JViAO
	XMUeIvamO06in+BV7OdFm2/aY9mU5VRvnVpqGg2hu0ComelUlrVniq45YWhxTVCFGGBbeH+CRkr
	ZAK0BUnh169PVwrgayklbQuYeuKycotlhKuWqY4dZtwU/0+jJrrg1APPP8XnBh4q7PvnUmNeB0S
	StEqCm0FX2XoqpfoBuAgJQ0IGqv4FKrGW6hg/89z2
X-Google-Smtp-Source: AGHT+IEFyFGvmHlwmLPffn6yEnCWPOlDOGImY85Hbmjn11b8E7v6Lhox+Zq5t1N+NSxWazwNdTzlkA==
X-Received: by 2002:a17:906:4783:b0:b04:80c5:685c with SMTP id a640c23a62f3a-b04b1687e66mr873911366b.35.1757354406758;
        Mon, 08 Sep 2025 11:00:06 -0700 (PDT)
Received: from hangmanPC.. ([86.124.200.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b041565ca98sm2158185966b.86.2025.09.08.11.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 11:00:06 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: andi.shyti@kernel.org,
	Markus.Elfring@web.de
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH v3 2/3] i2c: PCF8584: Fix do not use assignment in if conditional
Date: Mon,  8 Sep 2025 20:59:01 +0300
Message-ID: <20250908175902.214066-3-chiru.cezar.89@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250908175902.214066-1-chiru.cezar.89@gmail.com>
References: <207f485f-df06-43a6-b91d-8153b8922089@web.de>
 <20250908175902.214066-1-chiru.cezar.89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

if statement: Use of assignment inside of 'if' conditional is not allowed.
Move assignment from inside 'if' conditional, to one line before each 'if'
conditional statement that caused errors.

Signed-off-by: Cezar Chiru <chiru.cezar.89@gmail.com>

---

v1->v2: - Removed space between [subsystem] and ':' in subject line.
        - Attempted to change commit message to imperative mood but I
        didn't understood how.
v2->v3: - Formulated again the commit message to imperative mood.
        - Wrapped commit message to 75 columns per line.
        - Removed '' from subject line of patch

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


