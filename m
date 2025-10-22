Return-Path: <linux-i2c+bounces-13718-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C22FBF9A80
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Oct 2025 03:54:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52C0419C73BD
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Oct 2025 01:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A31201113;
	Wed, 22 Oct 2025 01:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jUh8V7wO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53C71FDA89
	for <linux-i2c@vger.kernel.org>; Wed, 22 Oct 2025 01:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761098056; cv=none; b=PWUL25XVcZfraevcdn86ZxFSk3KNdgRK7tQMKmVF67HANifnP741KcZ6eZ5lR3wtROOKnP48T28v3hn5lfOv8IoSCDvO7cncplrhc1Y4Z+nhkE0WE7dS11dcCJKqF/sK+1kmaJH0RKCai8qtfKicxc/dclvOqUXOMd+NOipF3NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761098056; c=relaxed/simple;
	bh=7SWJW/bStU/PcvTcsMTdRhwzcQsK6wMyBdkCxjenGzg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EXOv96mtUCBBXyESf85A0i/kkL7ezqFQ7CdPHy27ECawdpifmgttfDGWH1I7NZuo2RQuYTqTEKiRkc6YYkHPXaziNfRTHM6g+fWlqGjc/HTulF04jYxE2r5uoDEmT+pUM7YJAx+c+CWk/7wNT02kgNTVVXGfUzrjlCl9Cz0R4O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jUh8V7wO; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-471191ac79dso53157365e9.3
        for <linux-i2c@vger.kernel.org>; Tue, 21 Oct 2025 18:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761098053; x=1761702853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cdEInNnnI8mUaV9oHcjuBVGjC97eLQH2pPXt+cVP+WI=;
        b=jUh8V7wO1dka79EH6/thwZ3obJCFmx8aVfelpWXXzfEovxpOu44fuAdYR9aK39fK6h
         m1YQfogdEXwVOxjqBAzXh3yYgHqgq8Zntzc/TNxiUP3tPIwkOyWI9m8BdbQdUSuLVMPv
         HC6jrN0t8SvY4DsaIKrj9BJ7nsDAAITDjZ8Ijv/H0aTLjSKWq0LVsbiqdFgoHS0h6eNd
         NPnsfR4G4IeV9Kujag+QA4Pq2xov1pBhe3QS2FSLP30clc6gyjdpL8fX1kbioCu1Q/9F
         c6sYwq34NKlCNjQRn80/gSEwBtSCYeW9zTLe85w1XrgDIQ0Z+HmQ0fDlfAqkNVWwp+Ph
         9RTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761098053; x=1761702853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cdEInNnnI8mUaV9oHcjuBVGjC97eLQH2pPXt+cVP+WI=;
        b=gMkFgFzK+A6TYSr84tJDYazilEyRSRv+OK99y0DJLEHPWxm9WlOlHalimCKtCuX5c2
         AXBUWSS8qYOqbRdLL7XuhR+741Fiv83EoNtwRrNoHrOu0r+mBT9out285FDO0u3Xhnud
         iEF8J5SWwqK+nyLCiUQ//pNP1a61zc8UX2LsR3v6t8dVCFGikeZx/TpiihDaGQ2yWd+p
         qZaP14FSIgYRcJGwK2upd5cmWRh0A+mlC4WDjSzQvrdGtnUR4vo8P4MgFh0DHweJk+QQ
         ClzilhUYgzUPye430Yvubwk4NXfi2zTQvn8YW5EgSxuVEMLEzDTVu/reh+59+UE9/eyp
         YXGg==
X-Gm-Message-State: AOJu0YyjmvjvBnuYBr81WF2GUpCAljmw5Ga1a6JLnoHVNg5ARTmfGs3R
	qD5XIipvyMLETrdumjuqpWp4raHljS1mU7HE0Of5FeEOZKE5Q1K+uTwU
X-Gm-Gg: ASbGncvaSfBl69TN0SH7ulH15NTyxyxhL0fuIAOLZnpL6y9YyDtwtrFvjSG17iBKkd8
	V7xZgm7xf5PBMioVVHt/+C0zOvXKaj4jwddi/i9/J5ESaMKeBna6SwB35wqziQjLuVssuR25Qhx
	NGP6tWGJe/0+DuY3QtbLfWNaQhJZyl1dj3nSDso0jlbx37VEwfKQXiahYIQenLyLZphCSX2s48g
	fJL8QMBrNRMyyLP2Q+q8FDh4NOCC0nNzNdXw8c1WH+MwTgmZdrptoMfAu9YPG8ZSdJzhcrWVTv/
	fbdX7N1W2aO77cZ5vgcXGk2kiZR62PJeva97r3XEHpR//qZWLc5Xx/9fgVJw0YxOJTXNAxaSpra
	7Xd0XvE6fWclb3O4bONXRm2zzLC6LJN8PtiNBT11FCKSOVow2cS+bNZBGks3pYgEfaXGhUYBWy1
	YDfwzOmUv+Q0/qHqs=
X-Google-Smtp-Source: AGHT+IG+iNm8EjeDp0NASCXQRsYB7vpkeyR3u30iI3VIRokzzDe0B+HNAmeJ4eO8dQkgDFLMnmcAGA==
X-Received: by 2002:a05:600c:858c:b0:46d:b665:1d95 with SMTP id 5b1f17b1804b1-47117917bb6mr124309795e9.32.1761098052918;
        Tue, 21 Oct 2025 18:54:12 -0700 (PDT)
Received: from shift.. ([86.124.201.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c4281314sm19309395e9.4.2025.10.21.18.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 18:54:12 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: andi.shyti@kernel.org,
	wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH] i2c: pcf8584: Make pcf_doAddress() function void
Date: Wed, 22 Oct 2025 04:54:05 +0300
Message-ID: <20251022015405.7082-1-chiru.cezar.89@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change pcf_doAddress() function's type from int to void as it is always
returns 0. This way there is no need for extra assignment and extra checks
when the function is called.
Remove assignment of pcf_doAddress() and replace it with a simple function
call.

Signed-off-by: Cezar Chiru <chiru.cezar.89@gmail.com>
---
 drivers/i2c/algos/i2c-algo-pcf.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-pcf.c b/drivers/i2c/algos/i2c-algo-pcf.c
index d1b0e55fd871..7e4a6d19494b 100644
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


