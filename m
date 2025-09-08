Return-Path: <linux-i2c+bounces-12777-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5CBB48FCD
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 15:38:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2A441C22278
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 13:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC03430BF5A;
	Mon,  8 Sep 2025 13:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WN+nDiKL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9AE30BF67;
	Mon,  8 Sep 2025 13:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757338620; cv=none; b=BaLAgphKfwJJKgQ0NlzUh1b7t8RlcMPYQWdfBwLi2T+y98WYcJU+2CQthtYPnYg+vYRnVZ/3dOjxrtfrhv2g58xXEG/jjsW5GbG50FBgPfJStvwLWJZ1e1RYIDq2Kdra7bsDzNtoktR9//ZDD/UjbZu5vR7E6MXIJIMIYQ6NPrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757338620; c=relaxed/simple;
	bh=ecvvBjgaX627eS4bnciAJVcw918vwmUmroJnAfjPWD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RyrPTsQnG+6GUDVjH7/mo4hqXjzPKPCQEfbHCJntD0uFvpW9QX15txhHL5DsiIpQABeucli87AQnxtRP3n7WPmhxHwOGOydpcyN2EFEGyR0Fx8FilkC/F8GaHXLEpVVSvdUTbF2ojhvI6TiFnxSN+xiXhIv1bO01oIlyZafwDyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WN+nDiKL; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b0418f6fc27so736360366b.3;
        Mon, 08 Sep 2025 06:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757338617; x=1757943417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXeKJgMER9aDCzzqr2kjUqaLvJ57CDALLyPeDYmgRoY=;
        b=WN+nDiKLmX0bNQ53uGCSCxSbCSJ4xA8iPzVm6/zaJ1hvfd4bcQCSDxAFlOV9QOBtKS
         JMJzMUSJyXbkiLQCsPfXedV74u0qZgm+noQgJiVvQsl5naaDFhLwmt8KgjoijfBXqKsT
         raZb00RhJ56OsgDlSmLGry2VIUy1HnLQopwXRyC/ZZaBw9oPlxvNXM5MdPh0zNgAZagX
         LcQAYdYuBiikUnQOQLImmnqn/XdyrTupNkw3FpMnjamn6Wsan2NLQItUzQelZOixvHkH
         depjABMg8hRMB2LoVMdpOrTYlqsgLJdjYzOp4BlVla0N3pXqGZQVvB9QQRg0BRFAhyXp
         w0HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757338617; x=1757943417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXeKJgMER9aDCzzqr2kjUqaLvJ57CDALLyPeDYmgRoY=;
        b=dLXxaaBQrOqI1WGnWZTJAvPa1ojtmhuPB3td9UXeHi6JyMgKGbL8aNoR8NPI43YfDi
         GPTlwmQFz6j3rqtTLzK+fPwWm86nho2CKMNJkhRtw4K4Jj0YpQIUT4bg+3NERQQx0c/T
         vTK5zQWK8VS6YhAmZwRi92wnTorW8I/67eIes2mFmKmYHTf3NOwa1VAY8FwW93HwqFlN
         mDF6CB3shj9hhqey6lntWaqC2Nc/MUbdBEkHKwE6kQll9xxTeoDwhU3D7zsp60TLTBzJ
         cRLobCTpuA9RKIWvQzgmOVjxTaPBXeEfDgz65Ro3MO8Ww7l3Y7vUuKdeZ6aLwc/6QUBL
         r7XA==
X-Forwarded-Encrypted: i=1; AJvYcCWyWdFP/GOls1y3JV6+Jf9LYY01WZ4YSHTwoT/bAa5oeW3ZwnHnwFjJyCPbvt0L8IdAFQzKAD28eWTQCXM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLz4LDsNB2kMAGdcJgg5AzX44r4fjAwhmuLbTITsgBU1Jsjaj4
	mNm5FVsUEenLCI5tCu0lMNYIS8cMID1XCidq8clwkk+iJIc2AzrMhq7jTkKwHw==
X-Gm-Gg: ASbGncsvChDRT8sF+bVOfBjbiRBej4guH2jxI1TW0wGA9X1DuhzF14XWRaOJo6oMRU3
	jnif8O7ZgawTL/I0OSgLIJgap1mZia4KvMgSsjBqPmpvXD8GSGUseY0Nwa+xGvWv6n/pQgPNTC3
	EwAtULad8MGXgZFLArI/E22858KuuV6+7OPim+Z96Pzc8xvwzXM175egswjqbnYqom3qOWD7jyf
	kT52bNXyhH4nHLohYRGSkjwf8EvUn26Qly6D1U6tUfx0ldmxFpz7xCLd1hgCkMoijzoc98c4GCM
	PWkEAUAAsbUzmzE8Vnjnyn0t2P89Hoa50jlsbpw5FlNj4K/Brz1bf8t1mS9hwy+/3h1F470hh2p
	ZY1JPik6CCwIo1TndlYQNl3gMbIy2EhP6A2tQo9cO
X-Google-Smtp-Source: AGHT+IF3+pKmwZ5eALL1rpcaEXMRx4Z957NT8Ss35bRYCHtNlw5jzP31Pc1HURLJJXg+S9GO1AOwEg==
X-Received: by 2002:a17:907:94d1:b0:b04:5a68:867c with SMTP id a640c23a62f3a-b04b1459261mr764067166b.7.1757338615524;
        Mon, 08 Sep 2025 06:36:55 -0700 (PDT)
Received: from hangmanPC.. ([86.124.200.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b040a410817sm2177352266b.101.2025.09.08.06.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 06:36:55 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: andi.shyti@kernel.org,
	Markus.Elfring@web.de
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH v2 3/3] i2c: PCF8584: Fixed space(s) required after different operators
Date: Mon,  8 Sep 2025 16:36:08 +0300
Message-ID: <20250908133608.45773-4-chiru.cezar.89@gmail.com>
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

Error: spaces required around or before or after  '=', ';', '<'
and ',' operators. Revealed by checkpatch.pl.
Added space(s) around or before or after different operators.

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


