Return-Path: <linux-i2c+bounces-13749-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C03C00F22
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 14:01:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A96C1891879
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 12:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECD7330F7F1;
	Thu, 23 Oct 2025 12:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EBZCTjHu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A51330F542
	for <linux-i2c@vger.kernel.org>; Thu, 23 Oct 2025 12:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761220884; cv=none; b=IutykKGjUXx6Yoplln8NOAdkarAeeDBn/N7/CaL28lzGp6tVWpQ7tLPNeKd8q1bojBCjq/LaHUydo4jyvZ8nmLQAJBO2td5UE14W61PG22LI9XH+Qbne4LgmPGirEYdfSoWddcbMiT00wCMtjZPbuXevMuArgY+xNPgdEbrI3yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761220884; c=relaxed/simple;
	bh=Zotq3fevEEaXcuU8hejkE5kYpZkAzx5WWlia8hMMBWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BUPJwUqmZGj/mQ8OXGJZSQB8FyiUnqSN2U0tyaAdjk/urYea0+6+modWZb6868vpOnZVNDf7+XxlibFRmnyfeb1KvHWm4ew9RYhORmblYjXbBLlXMhDbBx4jLmk7o6ecuVRKNqhi9dVxLIXvTmov/jGDaSXnLYk7Rv5JkYVuKGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EBZCTjHu; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-471b80b994bso10071585e9.3
        for <linux-i2c@vger.kernel.org>; Thu, 23 Oct 2025 05:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761220881; x=1761825681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aj+uhrCJRmw1vEgTPdOyAa9Y57LutVzk+TCy+Su0xUk=;
        b=EBZCTjHuYEwsgJRT9UCqFPsl6DeOQs2oZl3fk7/6pUvicQmI9DHqyIiBldJNzvjI7n
         tmtjMgj1beQ1h0V7oWlttJ97ZFvAhpwb+KCo5bjZmanyY+CKs1J2OH8wul0E7kx9kGdd
         OA65yGruHKpH9xgfwHGpgsSeQDWcl0qUFb3ONUeIJb7ol5/I5MPGct5mBTeUEgXk/CNw
         mKk/IAZTse6GZszEpU8EVVEVTCqpGc0kdHUhpd1Wyqh4S8JGg+Ro/67bdWbQbaUhhbNe
         Oag9LidA6r1Gvn458AL5+w3I0r+Qcyv0KWRBEHtYEQRaeYdMdpRS/Wq6cJ44IlAGCOLP
         kMjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761220881; x=1761825681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aj+uhrCJRmw1vEgTPdOyAa9Y57LutVzk+TCy+Su0xUk=;
        b=qfHLbpfjn6n+mjwKTdyyJqE23xdVEVKN5pBY5rZ7QT39zqN8KSXd7YRPi3Ad07wvMI
         /3HV7aRmsmn6hWER3WeoneiE6JFWbM4YVaX9SsDh4o1r2JlbJtsPimyQgeBltJoBuSKU
         kOWN8hqvi34m8X3IHl4+kYpElVsvluhNbseVk0WYuKfRbIi1kuXuCyhyYYzc+c1V1syB
         wFxmwRkKnJtx8bPfZkzcdJZX4qPr5zR0NVBKPX+agBDG+/yLf/ydp9KUDxDQVVQ4CeDp
         qsAiSaJ1Feyp+ZlCOG715+0mXXxD8B7pkUmkKZ3G7ajxL2AiWpsII0KxVCU8XjdYptBa
         Bpsg==
X-Gm-Message-State: AOJu0Yz9jPIvSntY8FibB3fEy9k755CkKM06Jg5UFydqAKfIiPO7jStk
	N+AwziwieDPtPdmWh6Lfe2tKhYZLJXRQ8ed23KMle84Q25ra4vXeS+K8
X-Gm-Gg: ASbGncvmlm6a8O8fr6QgTmNHPpLG8yt0W9tqRyXUCPi55Jt0+uTUKtd3PDIVRqvN5tn
	nSH8dIF62TwY7FPDBy6YgZxLLBmroxmOj4CictJIuXnC7LgZGK85YGgVTjGkzAUV1p9IkpP5lLS
	x35yrDJjhrTfUbIO4JA4rDvD8f5Jut0SjJNSzVwCcGj4OhQpeZqn8F5A5Da1LOcYyy6L5JJJSi9
	RnptF0ASEWfMuTYOb4gSvSTa1otNoIgytQz8UJVqNQbkrjFMSQz4JdX/N89jq7iWDWxeKzGJmMu
	kdq+g83KThnZGwxWJ4I9DoNBvWviWQfDSeqchHXJA+rtMAqM4lPGx2c4FiMmNjZFrUZbAeR3sgX
	fb/hfv+u2RK+FK89Iii6bkRFwUFSZRucSyjV9Lbin73XElpb8aQy3r2UyhEeBvvGoV341GZwU4W
	MxbR5w
X-Google-Smtp-Source: AGHT+IEAwBT5oX5Ux4d4Xzd53uHX6f335aO5mjfogtAT2bZBhloBaRh03Cpwn/YtNrO9Oeox9rjkYw==
X-Received: by 2002:a05:600c:820b:b0:46e:6d5f:f59 with SMTP id 5b1f17b1804b1-47117878465mr182388585e9.4.1761220880791;
        Thu, 23 Oct 2025 05:01:20 -0700 (PDT)
Received: from shift.. ([86.124.201.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c43900e1sm109604435e9.17.2025.10.23.05.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 05:01:20 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: andi.shyti@kernel.org,
	wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v9 1/3] i2c: pcf8584: Move 'ret' variable inside for loop, goto out if ret < 0.
Date: Thu, 23 Oct 2025 15:00:41 +0300
Message-ID: <20251023120043.8661-2-chiru.cezar.89@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023120043.8661-1-chiru.cezar.89@gmail.com>
References: <20251023120043.8661-1-chiru.cezar.89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Require spaces around '=' and '<'. Add spaces around binary operators.
Enforce error fixing based on checkpatch.pl output on file.
Move 'ret' variable inside for loop. Then check if (ret < 0) goto out. This
improves usage of ret variable.

Signed-off-by: Cezar Chiru <chiru.cezar.89@gmail.com>
Suggested-by: Andi Shyti <andi.shyti@kernel.org>
Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/i2c/algos/i2c-algo-pcf.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-pcf.c b/drivers/i2c/algos/i2c-algo-pcf.c
index 41a81d37e880..06b9fd355bff 100644
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
+			goto out;
 	}

 out:
--
2.43.0


