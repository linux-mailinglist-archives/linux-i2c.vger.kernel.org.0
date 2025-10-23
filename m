Return-Path: <linux-i2c+bounces-13750-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E9EC00F2C
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 14:02:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBE691A06EEB
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 12:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D229930FF27;
	Thu, 23 Oct 2025 12:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cb44bygP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E695B30FC26
	for <linux-i2c@vger.kernel.org>; Thu, 23 Oct 2025 12:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761220891; cv=none; b=C7TSvM9gfZXKFBfKL35RZdqy4nttfarXs64hGSbw9DNuozkT9YdT2t26VdXYMKebQ6hVMIsjCaPxhvRVGXPQyoSbaxVcRbGwhShSIVfOK6Ndar/+I1AhBZZNeZNEfklweeLwft7GQ3yPAQLqSHObULmWWM7H88Xrhx5OaWfDAtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761220891; c=relaxed/simple;
	bh=vBh36brn/2ohhCsvBwa7uMXZhe6qtOYwOG6xdeMELnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ecss/wNG9kRMAciADc14YYwVmb1T5jGR8GnbgQleMmP8qYRaRIkZomKREQ190qi7lmMCQgisRHcweBwUnTIFVuQvYtL1cHPwEH6cAW3+S6K7umPilGZuWyvQpHY8NqotKeroaC8STGO15RmPxpJy5P5jD1uO7R9AJno8LbkUki4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cb44bygP; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47100eae3e5so7377195e9.1
        for <linux-i2c@vger.kernel.org>; Thu, 23 Oct 2025 05:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761220888; x=1761825688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jK/cyofPdzUjDgLppGWfFBjWYkuNfB9Yg6RkdFYdOoo=;
        b=cb44bygPL+CEK6tM0YKEEruR5YL6WELBz51eq43zCWRwXUtLNVA9mYJlDo7K6evMj0
         FJ1J70vFthYPNPb+3Ziu8GfV0K+MFmk92nTDc+eMIoA3TTEJa1wx3lUfSvko8oG33ouq
         fHkAX2pq6hXxbaGqpp2/ACUZduE3MMD1E2/svb/xivlX/HI+0po7crx9vXkDDtRGyAJL
         /bn1kyxEKbZ+ZrqzwDe1EPmxzv4ohY0bj88g2M2Sx0DNvnq4ybxVHEm405FYzdHs1Dmd
         m9Lnz79inL0m7uQApDdsEN0hilt2u19GEbdw0diHmgdpGOTz6vAK6Oq4+HZDtW8TYUsR
         2vLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761220888; x=1761825688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jK/cyofPdzUjDgLppGWfFBjWYkuNfB9Yg6RkdFYdOoo=;
        b=N/w1wsqEI5wHrOSq8UlDT9mfAFW2HTVrwOPLEZoCxjASt/YbfxEMV6QosCWDkcpCM9
         2NaUozi1xDD30eFheDWrSUur9VrcFROTVVn0/VuRrsqkbgSRPtKsJLsGe+wXk4j4IQO6
         HtjBksRURryASLMWKnPD3GM3DYdVPVPkg/OkTMl7HzmNgf6swtEVwLmCDHyopfKc/lew
         hG4VSc/qGWvbrX1c39ZRzV8+8H2bHEYIWF+8Zy9AZvuHyhbNXynnwjs+JcbpxsZlMZZY
         3yYPw5OouDUuTi+vOYCxnmP2HLmPJYVBuRba1YRIauANYmxOOvyYDUBYVovApNbF4kzB
         Tt3A==
X-Gm-Message-State: AOJu0YxGGy9/2oUrDy/WVPRHpyEm+2GkzlFAQxZ+DJBB4J8a/d3o2219
	RKPd0lUPVX2JN+/FSnCm3qRnaDFG1TMSvOwce3vgC0U1h62sEfYWgNHGz5X7mAVs
X-Gm-Gg: ASbGncsnrJOE6M9Vsu8G7IrtB5a+TG8H2HeAbG66pywObKLw/wMCBVCYKkyDgx7Dfng
	0aN7scRU26rpDi/0bpEKbJeB6OCj+Rs4Ke3i8Q1LDtLs6jCVx8XssMqnXzrKg4PO/nmMclUWenf
	m8cmKGD60j5oZo3QYR31hpK4pExxE4RMoVuNzEN/kuX/9jfDqIAisSnocP82aXj9gvxFS7kfEKB
	D6fERQBJJLU739IPoxROtQt/l03/oEA6S5R+xpZEwvIo2L4nuVBUbnoFssvdEO5bJjRjZuvpLtV
	ScGNpq8mwksQVZWiRA9vtGWbLJ5MSWc9oZMbtV9zs3nQA1j8g/uO5zjp/mKgI/pa5Bbfn0dR78n
	pRoZ+SdHTdf0t4bB8VLCkzinKs3vt34HwexRNYXgZhDuITR8tfgBqxmRWRMVyZzAuzR0j6/XNXz
	nfplKNjKlrBBTzlY4=
X-Google-Smtp-Source: AGHT+IEcN8gKps1aDA2FDOlBdcaY4AnKVsS7T8mKA0uOegdRhW4g58Dhfx121HCKO/EhvjpXPHXBkA==
X-Received: by 2002:a05:600c:3b24:b0:46e:1abc:1811 with SMTP id 5b1f17b1804b1-47117912b6amr169488155e9.27.1761220888066;
        Thu, 23 Oct 2025 05:01:28 -0700 (PDT)
Received: from shift.. ([86.124.201.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c43900e1sm109604435e9.17.2025.10.23.05.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 05:01:27 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: andi.shyti@kernel.org,
	wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH v9 2/3] i2c: pcf8584: Make pcf_doAddress() function void
Date: Thu, 23 Oct 2025 15:00:42 +0300
Message-ID: <20251023120043.8661-3-chiru.cezar.89@gmail.com>
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

Change pcf_doAddress() function's type from int to void as it always
returns 0. This way there is no need for extra assignment and extra checks
when the function is called.
Remove assignment of pcf_doAddress() and replace it with a simple function
call.

Signed-off-by: Cezar Chiru <chiru.cezar.89@gmail.com>
Suggested-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/algos/i2c-algo-pcf.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-pcf.c b/drivers/i2c/algos/i2c-algo-pcf.c
index 06b9fd355bff..6352314e48ed 100644
--- a/drivers/i2c/algos/i2c-algo-pcf.c
+++ b/drivers/i2c/algos/i2c-algo-pcf.c
@@ -253,7 +253,7 @@ static int pcf_readbytes(struct i2c_adapter *i2c_adap, char *buf,
 }
 
 
-static int pcf_doAddress(struct i2c_algo_pcf_data *adap,
+static void pcf_doAddress(struct i2c_algo_pcf_data *adap,
 			 struct i2c_msg *msg)
 {
 	unsigned char addr = i2c_8bit_addr_from_msg(msg);
@@ -261,8 +261,6 @@ static int pcf_doAddress(struct i2c_algo_pcf_data *adap,
 	if (msg->flags & I2C_M_REV_DIR_ADDR)
 		addr ^= 1;
 	i2c_outb(adap, addr);
-
-	return 0;
 }
 
 static int pcf_xfer(struct i2c_adapter *i2c_adap,
@@ -288,7 +286,7 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 		int ret;
 
 		pmsg = &msgs[i];
-		ret = pcf_doAddress(adap, pmsg);
+		pcf_doAddress(adap, pmsg);
 
 		/* Send START */
 		if (i == 0)
-- 
2.43.0


