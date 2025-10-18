Return-Path: <linux-i2c+bounces-13623-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D36BECC26
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Oct 2025 11:14:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6312B623399
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Oct 2025 09:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFC892EBBB4;
	Sat, 18 Oct 2025 09:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I71/UhTH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB11A2EB85E
	for <linux-i2c@vger.kernel.org>; Sat, 18 Oct 2025 09:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760778843; cv=none; b=F5/+yFHpDBaUu1+ND78dgmkTHi2utJ8JwG3OYDYLGHfP+lacmaa7QtW5HrlkFsxkYnycH3J4OAASTQXcBmuaJgpRxKVNnF1xOpxrynqvrVekBYtARbD09KtQ4vr2UiMpXMtOyEegeLbMrzdPgPoTcKzQNHnlvPS8C98vKNm9hEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760778843; c=relaxed/simple;
	bh=LHZjH2UMXa92SxXhNcHHvMGpkdxmO+gWMcsE10ROlWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KLM66Chy33Ku6FJeMbrFa5c5mtGCZ/QV82IxiGduHxCxJmCSL015bfnRWcLA4pR3J6tS28DjJHUdMRn7XjdmdvnZPl1Fkp/ywH9J4DNXRBHQPbFG075c5SD6OvOIX8K500TqfBh4VCngzjcvaqL/6Vdyxb7xymajzl8HsjpuO2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I71/UhTH; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4711f3c386eso9038635e9.0
        for <linux-i2c@vger.kernel.org>; Sat, 18 Oct 2025 02:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760778839; x=1761383639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XH2k5qkD7Z3u1A48Y16IYSnGNDzLTVrlHvL80g4n3eU=;
        b=I71/UhTHTGAWR2C9m7ZUGD0tEn4Iq9cwnPEgd1U/WC0qH++SWOV1pqnqP/VGlv74wM
         ztkUcPSCr88VhiNfM1yMqjui0DAoSoauG5R84oG0RYhzbt98l08FZemLbstyYb+dU3xW
         HSgQZHQ6imavfJ6dkBVtKeQahd8vR7ppJvNla1T3Y71r84BhcRcxkxwhb8apFuOFnKeO
         gmyVcgnErNjtEbr4pG8Oa2S3YirjvE8tMlTnqpV3u3+SntqjS8sI7jjPjSSFQkLEakdM
         jm/rGnugInVgYwnRgFzWvp8PjxnlyDmtrpFbVtrtLqY3U5HoR6oSHCphRwESsO36XtD5
         LYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760778839; x=1761383639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XH2k5qkD7Z3u1A48Y16IYSnGNDzLTVrlHvL80g4n3eU=;
        b=E+n1faFJ6gxOYWyU+3si54oapM4gGg5d3Zlvum7e0y2UD3wt8bTKfU9He40qI2Dk+m
         S8ChFrd/ivXRHzSh6JiG9uhmCvmA+UZxKfgr9c+yjhdxpXqP3xhcz7NkdbdB1P0Bn8HP
         HdRVnmta4opCe1BRjtRolhX03zRMCmUZbcWJ1laQumUEZTrgkyC4DtEG9QaQHp8SI67s
         S2x+U0aDF+N3QCqxNnKdoYfOAI7GbCcVBEQiAJyfxm96OzBAfiFhawqGd1auaIIpPQXq
         DeqbX/rgfYSjcOXmgJmmsUJMtMgohBdszKEmfYbjXHSjlsllsxsAapTmLslZSXC2Grk2
         P5Cw==
X-Gm-Message-State: AOJu0YzAaPyC8+2OoTd65TlAfmJK14FyjYMHJmOtGlI1LdPCzLeYLVB2
	FeJ+VMhxcFmoUN00YrTXdb53AppfDxLVe/MO7317Ry3rkSMeAT1+Wr57
X-Gm-Gg: ASbGnctkWX68UtyvtsbN42VZUIwsN7055aS3vE5gvQGMf1q7Vh6N3dxG935egRyEpwx
	0QQhVPyf95dwxlKNxPSCV0+cgdsFc69kWJuCnUziSO/sXZHNfmfPHgog71H7cGN+M8yY0hqUsZo
	9OZqw2HwYk1LLDTib5PBI7ILFiCnRnCY7v7B+fhM3ntoEp6AXFtDtvPoyfdpxo+D/in2arjmfx8
	od26jMCFiFunJ/grvl8cepeJd8KDjA8F513VuJzc8RkSJ8X9AUdx9wBhcamxuKg63xbu9pfXKzw
	BsHS/NBLy+zQ4OpXIUd/94Bipzc64h6bs8qPJKS22QZhpb6G6pV3XUIAYorso7Zpxwuxp+NA5lv
	XA7i295xeOUXO+5rntPxP0cwv1SNtjGRZad313gSE5IS4cfclkLiq9IgwZlTS8mnl2LpcLl1IMZ
	yHOyVn4WOAYguMmnRaFBUpGw==
X-Google-Smtp-Source: AGHT+IEUzXUajWE7NWxCs+sl4jnxDCzewliCBfPohtrMWKyQzYPRrVvK+cmI6/ZdtUdp4Zf3OtHTMA==
X-Received: by 2002:a05:600c:8b0c:b0:471:15df:9fcd with SMTP id 5b1f17b1804b1-47117911c51mr48689275e9.25.1760778838813;
        Sat, 18 Oct 2025 02:13:58 -0700 (PDT)
Received: from shift.. ([86.124.201.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144d17cdsm121034215e9.18.2025.10.18.02.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 02:13:58 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: andi.shyti@kernel.org,
	wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH v7 2/3] i2c: pcf8584: Fix do not use assignment inside if conditional
Date: Sat, 18 Oct 2025 12:12:57 +0300
Message-ID: <20251018091258.5266-3-chiru.cezar.89@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251018091258.5266-1-chiru.cezar.89@gmail.com>
References: <20251018091258.5266-1-chiru.cezar.89@gmail.com>
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
 drivers/i2c/algos/i2c-algo-pcf.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-pcf.c b/drivers/i2c/algos/i2c-algo-pcf.c
index 7e2d8ff33d75..41a81d37e880 100644
--- a/drivers/i2c/algos/i2c-algo-pcf.c
+++ b/drivers/i2c/algos/i2c-algo-pcf.c
@@ -129,7 +129,7 @@ static int wait_for_pin(struct i2c_algo_pcf_data *adap, int *status)
  *
  * vdovikin: added detect code for PCF8584
  */
-static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
+static int pcf_init_8584(struct i2c_algo_pcf_data *adap)
 {
 	unsigned char temp;
 
@@ -139,38 +139,38 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	 * check to see S1 now used as R/W ctrl -
 	 * PCF8584 does that when ESO is zero
 	 */
-	if (((temp = get_pcf(adap, 1)) & 0x7f) != (0)) {
+	temp = get_pcf(adap, 1);
+	if ((temp & 0x7f) != 0)
 		return -ENXIO; /* definitely not PCF8584 */
-	}
 
 	/* load own address in S0, effective address is (own << 1) */
 	i2c_outb(adap, get_own(adap));
 	/* check it's really written */
-	if ((temp = i2c_inb(adap)) != get_own(adap)) {
+	temp = i2c_inb(adap);
+	if (temp != get_own(adap))
 		return -ENXIO;
-	}
 
 	/* S1=0xA0, next byte in S2 */
 	set_pcf(adap, 1, I2C_PCF_PIN | I2C_PCF_ES1);
 	/* check to see S2 now selected */
-	if (((temp = get_pcf(adap, 1)) & 0x7f) != I2C_PCF_ES1) {
+	temp = get_pcf(adap, 1);
+	if ((temp & 0x7f) != I2C_PCF_ES1)
 		return -ENXIO;
-	}
 
 	/* load clock register S2 */
 	i2c_outb(adap, get_clock(adap));
 	/* check it's really written, the only 5 lowest bits does matter */
-	if (((temp = i2c_inb(adap)) & 0x1f) != get_clock(adap)) {
+	temp = i2c_inb(adap);
+	if ((temp & 0x1f) != get_clock(adap))
 		return -ENXIO;
-	}
 
 	/* Enable serial interface, idle, S0 selected */
 	set_pcf(adap, 1, I2C_PCF_IDLE);
 
 	/* check to see PCF is really idled and we can access status register */
-	if ((temp = get_pcf(adap, 1)) != (I2C_PCF_PIN | I2C_PCF_BB)) {
+	temp = get_pcf(adap, 1);
+	if (temp != (I2C_PCF_PIN | I2C_PCF_BB))
 		return -ENXIO;
-	}
 
 	printk(KERN_DEBUG "i2c-algo-pcf.o: detected and initialized PCF8584.\n");
 
@@ -218,7 +218,8 @@ static int pcf_readbytes(struct i2c_adapter *i2c_adap, char *buf,
 	/* increment number of bytes to read by one -- read dummy byte */
 	for (i = 0; i <= count; i++) {
 
-		if ((wfp = wait_for_pin(adap, &status))) {
+		wfp = wait_for_pin(adap, &status);
+		if (wfp) {
 			if (wfp == -EINTR)
 				return -EINTR; /* arbitration lost */
 
@@ -351,7 +352,8 @@ int i2c_pcf_add_bus(struct i2c_adapter *adap)
 	/* register new adapter to i2c module... */
 	adap->algo = &pcf_algo;
 
-	if ((rval = pcf_init_8584(pcf_adap)))
+	rval = pcf_init_8584(pcf_adap);
+	if (rval)
 		return rval;
 
 	rval = i2c_add_adapter(adap);
-- 
2.43.0


