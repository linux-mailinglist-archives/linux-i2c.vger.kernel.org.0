Return-Path: <linux-i2c+bounces-13717-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2E2BF9A7A
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Oct 2025 03:53:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E78CC3A9DDC
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Oct 2025 01:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D9E20A5F3;
	Wed, 22 Oct 2025 01:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ViEbdo5k"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065D81FE47C
	for <linux-i2c@vger.kernel.org>; Wed, 22 Oct 2025 01:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761098009; cv=none; b=n1WwgEw9jIFwkEA1kzFzB86KPnmrahIRr7/3HFwlE3Z91zGfxZVxSMEvnqDzE/qAs21raB3NWC7iALD+L05UJY8iQ9uS2Sp5quzb0vqM1zAdZMrfmg6IY4qnLEMVNMetae6CiDKMmzygO2Ap/wIoBqGlb70M49LpbWtGzn8hyDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761098009; c=relaxed/simple;
	bh=B1bHhmf+wV5gJ93JsBXBKg3bVlLXpgUEv6CQ7duz82A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e0W7RSR7wM+CQb3jLMlL3OMppPgFGe9EnUc1UxjqcK9jjvR+n6ViXWU3F29yLdCuFC9dYVzuBmrk3un3o/TXzGe1wGQhnROsLDUkCEOY+GCbKSirOFDnex6JSzbM8Q7ZtHKQnuifYXPzyJGevd35iBla1/naDY/AYdsZNhbzAso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ViEbdo5k; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4710665e7deso23913105e9.1
        for <linux-i2c@vger.kernel.org>; Tue, 21 Oct 2025 18:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761098006; x=1761702806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l7bIeWPyB6N2/Vx1az8bXwr5x8Js5h7Lo5yfkBnc+lo=;
        b=ViEbdo5kwfVASid0aWjo+Fyg1YE1YQHkIIPKcTryoKQd/Wfom2S0NpKkUuQsqqF/dY
         9gjV/6Cc5Nlzre9J3B8Cz25RHld05xRhypGVqlKl1E/foj0V38vTBIBJzWR5x2ZsynKw
         TuHqFIGvcjIPbGckLlhLWjxj2H4OfuabTFSvbiTsw7epZyKsfT6+DCrYFEVngWeRFdzQ
         mrz7Pi3lA/vRo/7VrXNhIWFE5fNmJtB4nu+pfOTHIYlBnZTZ32RcgMyTK5ByMSUpa6At
         UrmQ4W/zchk1hLHC1LKiCU71MaPptHfFRsrYAwbFAveDNi0BQpVVqRhQgvDyEpYBdvhk
         ABvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761098006; x=1761702806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l7bIeWPyB6N2/Vx1az8bXwr5x8Js5h7Lo5yfkBnc+lo=;
        b=eLVtfkeaZtWdQjSNtbq8XdyDEczuQTL9g4QoTtjMYN8+lyc4q9zPYlfTrqpc2Y6gIe
         BsrylD+p95/Mo6pH/9hSEEWZjlqYrgnoNwPYdyY8QUg8xSGdfLi67oIM5k0SLAWD/GWL
         8k0m1CO8XE/rw/dXy3Z5wTifSUwEJnku7ym1Mtqsyo6KJEsxmv7+HBJAGsrZtV2205SX
         UcGVTRyZSkP9y2a93HaLWI03cS2UQRTk2gBMJmAg2MGlkKVcWzenn+MU/uINupf0wpHd
         iewLPEQ10d/FBTSxAukSb+Ga1sYnSd97KZ+Jf7HPpJxOVQ1fv43P19jrbbU1UHNNaS7+
         gVAA==
X-Gm-Message-State: AOJu0YwTMU6M+Wf+zJRMkksXBVKGlySnZVNdex8Vhc4d67sFQMdQKwvR
	4PClv3t3uEflBTl1SCZW9WHfXRwmFnqPswKkWaz4yqm7U3HMD1mZvKhQ
X-Gm-Gg: ASbGncs14CsQvYjlDzIB5o9ClrInErMM4MoAEOle6w2Bef1cDhiL4fjzRwkuE0J6szQ
	J65UnHrkjz2ffTwezRXLx60kxmmdlykFHuybyFeSV1iOuuyyLlQjE3ZpPKU+A5tNQmvRNLypUuQ
	MsnrM8muU21PT2NpPOSeYELKBP6KkXXBgudiSkeefZNxZYDSCQWIv47zN96pI5afXUdId3TKmQD
	udDSZAsasUbOPddrgD1qDUzt8OC2ORcQwViG7yrnLOhNiJBq3rc0bOoORyeGjvJds3r+hipmNn5
	j9+0Fbca8MIjRNC9ovJ4DA4fBuGYkVDUjyFlbu+6bX/03b6gat1ii1jYfzIJNSHFbOzLWd40b3Q
	yBUvzxGvorIKVjToMv1n6GZEpT7r1wQOvsFMV3lW1MniJXlx6Sas55b/qKF/JvPECTDCjJOjFrN
	YFMeN0WnMG3MKtGbA=
X-Google-Smtp-Source: AGHT+IG9WDGOUicPjGB2rfzPZQ3/TTKt77LQvHjsO3zBzUiXL+ku8609E0n9vIdJ6VbyW6js3sP5UQ==
X-Received: by 2002:a05:600c:4748:b0:471:12c2:201b with SMTP id 5b1f17b1804b1-4711791c503mr126967895e9.27.1761098006305;
        Tue, 21 Oct 2025 18:53:26 -0700 (PDT)
Received: from shift.. ([86.124.201.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c428dafesm18557345e9.6.2025.10.21.18.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 18:53:25 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: andi.shyti@kernel.org,
	wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH v8 1/1] i2c: pcf8584: Move 'ret' variable inside for loop, break if ret < 0.
Date: Wed, 22 Oct 2025 04:52:13 +0300
Message-ID: <20251022015213.6988-2-chiru.cezar.89@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022015213.6988-1-chiru.cezar.89@gmail.com>
References: <20251022015213.6988-1-chiru.cezar.89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Require spaces around '=' and '<'. Add spaces around binary operators.
Enforce error fixing based on checkpatch.pl output on file.
Move 'ret' variable inside for loop. Then check if (ret < 0) break. This
improves usage of ret variable.

Signed-off-by: Cezar Chiru <chiru.cezar.89@gmail.com>
---
 drivers/i2c/algos/i2c-algo-pcf.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-pcf.c b/drivers/i2c/algos/i2c-algo-pcf.c
index 41a81d37e880..d1b0e55fd871 100644
--- a/drivers/i2c/algos/i2c-algo-pcf.c
+++ b/drivers/i2c/algos/i2c-algo-pcf.c
@@ -183,7 +183,7 @@ static int pcf_sendbytes(struct i2c_adapter *i2c_adap, const char *buf,
 	struct i2c_algo_pcf_data *adap = i2c_adap->algo_data;
 	int wrcount, status, timeout;
 
-	for (wrcount=0; wrcount<count; ++wrcount) {
+	for (wrcount = 0; wrcount < count; ++wrcount) {
 		i2c_outb(adap, buf[wrcount]);
 		timeout = wait_for_pin(adap, &status);
 		if (timeout) {
@@ -272,7 +272,7 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 	struct i2c_algo_pcf_data *adap = i2c_adap->algo_data;
 	struct i2c_msg *pmsg;
 	int i;
-	int ret=0, timeout, status;
+	int timeout, status;
 
 	if (adap->xfer_begin)
 		adap->xfer_begin(adap->data);
@@ -284,9 +284,10 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 		goto out;
 	}
 
-	for (i = 0;ret >= 0 && i < num; i++) {
-		pmsg = &msgs[i];
+	for (i = 0; i < num; i++) {
+		int ret;
 
+		pmsg = &msgs[i];
 		ret = pcf_doAddress(adap, pmsg);
 
 		/* Send START */
@@ -321,6 +322,9 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 			ret = pcf_sendbytes(i2c_adap, pmsg->buf, pmsg->len,
 					    (i + 1 == num));
 		}
+
+		if (ret < 0)
+			break;
 	}
 
 out:
-- 
2.43.0


