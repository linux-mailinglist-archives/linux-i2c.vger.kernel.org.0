Return-Path: <linux-i2c+bounces-13650-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D02BEF248
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 05:07:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1A0E1888511
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 03:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0053229ACC3;
	Mon, 20 Oct 2025 03:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NSOZSufX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B07226B75F
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 03:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760929621; cv=none; b=Oca9YTNHnsYfLFhdm+iwS4XIX+18D3yVT6EdyhgLFpj2hnMjxjTmoUONyzP9cxDvqGbQFjGi6BKayGsmFUnYTPChVtANW/ipZYbOUwMCq55DUtALNRgqV/Tk9y/QZX5UXRw4UZPFVli433Wd8yz7JGwbJCArKi1AO0UmhD1cNBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760929621; c=relaxed/simple;
	bh=u7XIuMjB0kYFOdNqqv6I271suhFRXV1yau7TKs/7Hlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IisCFddQcc/tm6BFe/4cfsf+0ahXP9ShDku1FpTYfxn7vKp39WrcWAaqP4RXWMQlEWKW2LMA5odJnffS1k/AHtTLykqn1HC2dhNvJOmfRfsS7AfZCccyquGCtOkXKRWVau+yKzYrV7CgJINHZ/KjAJDeFqnorpTuaA0vRNgnwJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NSOZSufX; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b54f55a290cso588834766b.2
        for <linux-i2c@vger.kernel.org>; Sun, 19 Oct 2025 20:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760929618; x=1761534418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l7bIeWPyB6N2/Vx1az8bXwr5x8Js5h7Lo5yfkBnc+lo=;
        b=NSOZSufXaNk7hzlvGIt+q5x2hBCwBrjJzJNTjjMxyvX8Gjz/ylNdE9y6MTatcTJqNK
         yJ0LZ8IqUOybNKlnnW+nxh6TffB2w2DKOPKzXnwPO5OBlieIhX8TAIBFdYN25ZTaii6K
         3MqUDVQyUe/Wvb8i+NjyUCVtXPIE3WNFQ7BiH0DXkCd9B6riYnxuA0uLygdOwmfsikXH
         3wYqX6PUIgWdGnToJNF5oOHBUH4Cxx8kNrndQVWs+h5LBGOCax/dj/9vzITfJOv7Awkv
         t2OolWlbVuwBMk+m8NN64CatToFj7WOflTq0fvHM9XKUcVZuyxqM+TfRKwMwo4ovJWof
         yr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760929618; x=1761534418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l7bIeWPyB6N2/Vx1az8bXwr5x8Js5h7Lo5yfkBnc+lo=;
        b=CI1UM6+fVPmIGcAd8fppFtb0hlfkUa8PLOxAp9q/aKzCniToVt0D9c/OZEpkgMi5dN
         Xza7XBpAeUWaFRyTSecQdvZ1+79IcbVTRYEbI9uUj6e5Nb7ViSfhQrCsDbRZSgPNS5La
         O0c6wwla3G2t/1zpHVw9XZ+yoec9w13ePsm6zPFyv1+7VgKe5ReFDNhOe9RGVEY+MsR5
         Jx0kLDctfTBfoyXu88IoDb5utKTkYLFnbdLnn7/THNoH4oxKyLgIL3fvzNlP5Bw6XBJw
         GpYq4sUYIru5wUpuKEHuV9rTP2fjp/gPjt2LLeUCi03bz0yPlpTUVR52m7tH825LxOGb
         E/5g==
X-Gm-Message-State: AOJu0YyutLB3ji4qqxHoCIZKcnnoJZWgjnLIZC5LoEmP0kvJITcHzhHm
	jOQ4J8MMms+bllT6I1Yla1IXl+9sn6aI8wvPpq2sRF6s5WQfM/429tAT
X-Gm-Gg: ASbGnctIoiV1wzCVVgcck2R8nOnAYUX1AgyK1RQLeLfna0wdy8eRHQVgokzeV1HIEtf
	dO6hqTraOhYceBdH2XjAc+IJn/ZKdwyYBwxqRHlIrI1LkMO+S/ECPJPU1zuULMZl7A6k4kZTgVI
	c7k1IC5uNu8KwlFGA87D0WNZag6wWYhPX6MNW0qGqzwsE71Gm4wDeMLUq8uWgfzgYrs1hP+hLhv
	qahUkjx1XpXilAGygD1PzY7r7gA0EktTnD/w9dVfZYYZRif5QLelD/zrXyGQj8jI5pT23uhsX20
	DLjmXcR0/y7MDz/DO17ySpKTGhcQKTsT/XJTQMEbPxco126bXXE2BrNKC5XE0G5npgyM2WWX9PI
	hycFNz2djSjVWpr1TMjeNorUP2D621r5Mrm7Q/B1unDbHN9F5qB9MBZeLeykqp5nFYZ4bbf8Fav
	gxSk6m6BISPQc=
X-Google-Smtp-Source: AGHT+IGf7mIwA3xybm5N7cq3GHAd4m9n99JF61Gq124Z/F2vUdjTtx1KyX4OoIH+SC95cESFNKzqdA==
X-Received: by 2002:a17:906:c102:b0:b2d:830a:8c09 with SMTP id a640c23a62f3a-b647512352amr1186692166b.44.1760929618183;
        Sun, 19 Oct 2025 20:06:58 -0700 (PDT)
Received: from shift.. ([86.124.201.90])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da25c9sm668375866b.11.2025.10.19.20.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 20:06:57 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: andi.shyti@kernel.org,
	wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH v8 1/2] i2c: pcf8584: Move 'ret' variable inside for loop, break if ret < 0.
Date: Mon, 20 Oct 2025 06:06:06 +0300
Message-ID: <20251020030607.10219-2-chiru.cezar.89@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251020030607.10219-1-chiru.cezar.89@gmail.com>
References: <20251020030607.10219-1-chiru.cezar.89@gmail.com>
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


