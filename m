Return-Path: <linux-i2c+bounces-12770-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED149B48BF0
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 13:20:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 124023A3375
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 11:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B9D2FE049;
	Mon,  8 Sep 2025 11:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MVw0q6r5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7A03019AA;
	Mon,  8 Sep 2025 11:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757330100; cv=none; b=m3j05M9XB3YNw3rXa8LeuPukEq/Tic8VjsNZStSRQPULz6tpZ3IdsKrsuIclKVMqBjyrhOr2xiMuPUwjCoRMpxuPPHGvwhCPIOU0LjiEh/5dD+YoeiBlwK3U3CDmSJN5xMpMI5Tl0ATy1QPMjhnR7Y9H/oc+xId9Q7YyBqjLE9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757330100; c=relaxed/simple;
	bh=TfP6W/TnH/0OzJl7LMSUfZKB4S/i2gT2uKhKlDTtDHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DPKwBqu6cCe6Qyz6jMsDomUEVRKEQYjnJGtXjZmzp3+2a7cZu2tVjJmgMlcSU+9UZxLl962VF6Yt0QkWY+41L5boRpDy+HVeMyeCXY48ft6y1sh84A9UAsSLz8J9yypV4bI2As1LA8Ff4g+lgE8vtE7j+xVUjUhZkbzdFvxuI7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MVw0q6r5; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b0449b1b56eso618693866b.1;
        Mon, 08 Sep 2025 04:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757330097; x=1757934897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TBUgKZx8CWWM1fLAgdONFmjWGDp8QxAQMW41bDl4PYE=;
        b=MVw0q6r5lBjy5pHK4Mb3EA7bAzbFW6IWhtwhCt2l4Bj4iEG2RvRx51Oq8AiVk0ErvF
         nLE2AhOajv8+sgb7RRda/FUBQEpyF90R5ILIkev4JzUtxAEiYXRdTEcqdHCCIkzJd9rq
         3Jzf4MVEzBxDiLQpUo/sHSfFNa/L3wapSEG3jMIFzEWWUIxKscRAgbdPFBfQOud/Kf/v
         qho11XgokfLqZe2ewlGG+6lUwzVlPoJURmDvzu0SXQVav9meDQxOO5qWmYvy3gHAu++T
         qdJc9N3Y11Apf+M4UhPQLoYCvEIkdcR4RSnqIfFFGgmHLmst8I7QiptKxQoDP7wdfN78
         Ygcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757330097; x=1757934897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBUgKZx8CWWM1fLAgdONFmjWGDp8QxAQMW41bDl4PYE=;
        b=aHt/kRruryMl3pJ3msGmNnNbArwYONYuOoegCsvpNGD7Gc9uNp7nnrRK2AstH9A6cK
         F8GMUuZaJmLabTfjDaqDydpyLBM+OgpG0HaQItedDepvKBulWGUWKJr7CQcxo3vvCpIe
         uXdvdzMvCM8bTJjzFbFQQSjC/wIRFZHpuZ0LDoY1/34XY2j0+4wS50c2c7eFExcUT43w
         M1tIsmZ1Ue22ogNZRmxdwZAt8329Gi2TrzU073Jmyc0jCJ7QTeiN/jNXm7om1U6I31Vo
         ibWiWW55ZK7EJP0pojRZ94Wnep7+rsmsmzyIRfX6a1Yg25cXACWx3CR/FavgQ/tZsL6o
         TT1A==
X-Forwarded-Encrypted: i=1; AJvYcCU+FLVHUeHgP9uLYoSoyCku/Ade6P6i88YtT1v/GF324S6gRG287bKUmTt+NRjLOICKECtho+QrdzTTs2E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yypa9BMzm3lYu4eCUcjAoKDApmvBCe+qvjd1pRaczw7JY1guK8d
	CFALeZCu47GJaa+pDQu4hqgycZKWZKgEgN+b73kUcH9uAXOTKNhnR0r3
X-Gm-Gg: ASbGncvaigUmXtst7TPjVpQ2OQGZrtwXpK+MnwjEU1ah3GDW5A2uk+sZyF1s4umRLFm
	cXNcGsuOebbI8ZnMAc6RVvjd8aH5CqbRNerFdcpTTP/SJWextgq2oWH58RzMAzacK3Sq9fY4JHI
	dHMmKaJJolvRz5TpYIcs8V7WvG9wnSDBcH4ZrEObImnaJ2cQyiPaK6dEwfGfcOyOqKONw/wgm3g
	EeyTSS+eFT+O9TyXe4gQwwFVmVgNRMZ/VSl3tPk4LOGnBVxBERvPDsVpcll94DoM1LqKd4+b72o
	JFlpOHDK7+62B74swMukjthiosCawD6yWUrVdjnz4NlM1JnL5cR8IUM7meuEH2CWw5rcg2xdY+v
	Lo+ZIt+/il8oQ0+rNetp+NlHsqBsWs7op3EvMPR1O
X-Google-Smtp-Source: AGHT+IE3JlJNXgpxX8j5r4zjDm5+NI53Htj/P0EpXbcWtw77dZIT/GXtwNLca3686j8M+Jcn8rSTSA==
X-Received: by 2002:a17:906:6a0c:b0:afe:e7f1:289d with SMTP id a640c23a62f3a-b04b1818f57mr615278166b.62.1757330096936;
        Mon, 08 Sep 2025 04:14:56 -0700 (PDT)
Received: from hangmanPC.. ([86.124.200.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0470f11088sm1211333966b.111.2025.09.08.04.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 04:14:56 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: andi.shyti@kernel.org,
	Markus.Elfring@web.de
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH 3/3] i2c : PCF8584 : Fixed space required after different operators
Date: Mon,  8 Sep 2025 14:13:55 +0300
Message-ID: <20250908111355.79222-4-chiru.cezar.89@gmail.com>
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

The error was: spaces required around or before or after  '=',
';', '<' and ',' operators.
Fixed by adding space(s) around or before or after different
operators.

Signed-off-by: Cezar Chiru <chiru.cezar.89@gmail.com>
---
 drivers/i2c/algos/i2c-algo-pcf.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-pcf.c b/drivers/i2c/algos/i2c-algo-pcf.c
index 598bf000bf4a..3439b7387a54 100644
--- a/drivers/i2c/algos/i2c-algo-pcf.c
+++ b/drivers/i2c/algos/i2c-algo-pcf.c
@@ -223,7 +223,7 @@ static int pcf_sendbytes(struct i2c_adapter *i2c_adap, const char *buf,
 	struct i2c_algo_pcf_data *adap = i2c_adap->algo_data;
 	int wrcount, status, timeout;
 
-	for (wrcount=0; wrcount<count; ++wrcount) {
+	for (wrcount = 0; wrcount < count; ++wrcount) {
 		DEB2(dev_dbg(&i2c_adap->dev, "i2c_write: writing %2.2X\n",
 				buf[wrcount] & 0xff));
 		i2c_outb(adap, buf[wrcount]);
@@ -314,7 +314,7 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 	struct i2c_algo_pcf_data *adap = i2c_adap->algo_data;
 	struct i2c_msg *pmsg;
 	int i;
-	int ret=0, timeout, status;
+	int ret = 0, timeout, status;
 
 	if (adap->xfer_begin)
 		adap->xfer_begin(adap->data);
@@ -328,7 +328,7 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 		goto out;
 	}
 
-	for (i = 0;ret >= 0 && i < num; i++) {
+	for (i = 0; ret >= 0 && i < num; i++) {
 		pmsg = &msgs[i];
 
 		DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: Doing %s %d bytes to 0x%02x - %d of %d messages\n",
@@ -373,9 +373,9 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 
 			if (ret != pmsg->len) {
 				DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: fail: "
-					    "only read %d bytes.\n",ret));
+					    "only read %d bytes.\n", ret));
 			} else {
-				DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: read %d bytes.\n",ret));
+				DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: read %d bytes.\n", ret));
 			}
 		} else {
 			ret = pcf_sendbytes(i2c_adap, pmsg->buf, pmsg->len,
@@ -383,9 +383,9 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 
 			if (ret != pmsg->len) {
 				DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: fail: "
-					    "only wrote %d bytes.\n",ret));
+					    "only wrote %d bytes.\n", ret));
 			} else {
-				DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: wrote %d bytes.\n",ret));
+				DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: wrote %d bytes.\n", ret));
 			}
 		}
 	}
-- 
2.43.0


