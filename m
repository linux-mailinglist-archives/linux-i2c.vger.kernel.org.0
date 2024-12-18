Return-Path: <linux-i2c+bounces-8581-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 141E19F5B33
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 01:16:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E357F188F134
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 00:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C7E2224F6;
	Wed, 18 Dec 2024 00:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yq2feY9y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E061BC4E;
	Wed, 18 Dec 2024 00:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734480994; cv=none; b=LMPDvm1XptlD+xoRZhkU8FmxsJqee2rdFT+cUwg/H3RSVz5UTzFp0TamCb8LtwG3Rcnt/Dfh9BISGlBJ1W6ZXO8ZZ1GFJagbhXOW22+3s7R5fojynXJg5pvFTUIZPxGmE3DmAVb1uo9DAIz1Y5JRzvz0RPLFRM6IwZ5JuR8Mkh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734480994; c=relaxed/simple;
	bh=9UUTeXz/RmiSiTM0WHtuMQr6xXxy7ucGYpUuKtc3/d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NPe+kungXo85+5LvoA/ROZntfbV423RG7Jt1D6/+uyegRqojIdKTxMYnSYu7zDED29tmDvZ4kQ2xMCDeeEdGt2zU9uApVEjkBSAwXiGWUGPBSWBfh9Qs383Byz6OjE7mywRfjX4X79+Ymxo1AGbBc4IKtYGDdqJr80WvS+v/bv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yq2feY9y; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso42779855e9.2;
        Tue, 17 Dec 2024 16:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734480989; x=1735085789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jkc1OJpwev5kmjBDTJJp++J5Vm9mWdZNE430qDxhZ30=;
        b=Yq2feY9yH0fLM0TD1v0x4l5q6cv0TyLZ+VzWS2prOJz7FFAePqls0viGN9omv6Go5g
         UN/VFVIo3TTr/OhmmP4CI3cGjL7ZHQYH9NhN3UTP1GbxvzY3N7yuZRc0V5V3JeRMu0A1
         ia/P4/k/DdfHePJQE4klu+Df6U+NxxT0cKwk4Hj8zVFIOAwAe8uUnAq76j9mbLfv0Hpc
         HsXuBkVlG/r4fBQ9+83cnryIbC4BJl39V6uUKToQIt88hIw6ohmcxAeDFWkU4CHMrrMh
         4l3Gv8ju8hUjyHlOGYsMKT7TpZDAI0SDRby0cR8Ugskn4SM/t0btZE6sGt3n+8eaeem+
         OfVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734480989; x=1735085789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jkc1OJpwev5kmjBDTJJp++J5Vm9mWdZNE430qDxhZ30=;
        b=nWW2NsMeD+whAFp6M0dm30HgJivAlhQHVci2FWnNZRijVopf1nDTiu8n2hSva7K22/
         TXthcYM3gwLK0ldNVuXeIpPYwKYtD7OYM8dpOGU8qbtaUJZ605imSTit+EgGrUxKzMms
         L5xBy+20vah0Bw/zsQtQO53eWD3E2mpYOZWM5JSapclEPomElHQgUdHw/KlLkSN7K09Q
         x7lhIb5l46XlbCipKNflf0wOtvlS80ZZlZ86q/unJMnqgV/EkTmAe28hxn/1nh1pRvCW
         S9plH8kwfsXE/xioQIEx4YgMsRwue7NpVgz/gZZYlyvvn2Jpr0a7DrV3zUqNeCu41wm9
         pOXg==
X-Forwarded-Encrypted: i=1; AJvYcCXGkvTNOYJTcKOVC09v8zQfIJmKq/aP3O2eH4t7kLIkooflDzQkp+zILWJMibYqU1pphSCsTdQtve2iMWwx@vger.kernel.org, AJvYcCXQajKjfEi4VuB4BNUcLdVWlM8b3nEi7SyUkErqgMH8ZZUqio6sHV5dtHdj5rQ2W15/IXfYVb7oYz8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw25wR1WXTv8t50Z/Oc8NdEKJfC06/WerjQawVubAXyFlnn6TSu
	uBulpuGU/Rw2+GALYh69AeyTcNdpYgIb4cPLW6UvJSbyAOUTqgOw
X-Gm-Gg: ASbGncvyfY+H6ba2K7RPOww1Lg5NiSxx8rUEfwSOQwkIc8/ojsoV8RilbwxoW6bX9Oi
	BsRX3uedrenQ455PoxJWG5rYbmkB2sqL52yUOqhi0axNSq61TI8mH8Rou9XmcOnkD1tU8meeWes
	In8jXGCp1eEHfHU9CwqqcA0duri0aBte3nPO/qIZSMNBHhAkadFJUA2/vI+gdIQAksu+PCKnnMK
	pc/udgXrTUPC1HOOB6cNiUsNWEl33oGy674FLXaf4Ii97QxYejdttqSes2S9bhOWkMqqrtfLUx4
	KllJUTns9g==
X-Google-Smtp-Source: AGHT+IEpWdpeUxKa3hgntdssG+zj9KJrUSSomOvQiuiUfgGJfzeECG2boqvJKxhRp5CGAsEdo0qZdA==
X-Received: by 2002:a05:600c:3548:b0:434:a1d3:a30f with SMTP id 5b1f17b1804b1-43655345212mr4792605e9.6.1734480989251;
        Tue, 17 Dec 2024 16:16:29 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:ca61:1d3a:8af0:1c5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b1f638sm2135495e9.37.2024.12.17.16.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 16:16:28 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/9] i2c: riic: Replace dev_err with dev_err_probe in probe function
Date: Wed, 18 Dec 2024 00:16:10 +0000
Message-ID: <20241218001618.488946-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Refactor error handling in the riic_i2c_probe() function by replacing
multiple dev_err() calls with dev_err_probe().

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2
- Collected RB tag from Geert
---
 drivers/i2c/busses/i2c-riic.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 9264adc97ca9..bfaa2d728a76 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -445,10 +445,9 @@ static int riic_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(riic->base);
 
 	riic->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(riic->clk)) {
-		dev_err(dev, "missing controller clock");
-		return PTR_ERR(riic->clk);
-	}
+	if (IS_ERR(riic->clk))
+		return dev_err_probe(dev, PTR_ERR(riic->clk),
+				     "missing controller clock");
 
 	riic->rstc = devm_reset_control_get_optional_exclusive(dev, NULL);
 	if (IS_ERR(riic->rstc))
@@ -470,10 +469,9 @@ static int riic_i2c_probe(struct platform_device *pdev)
 
 		ret = devm_request_irq(dev, ret, riic_irqs[i].isr,
 				       0, riic_irqs[i].name, riic);
-		if (ret) {
-			dev_err(dev, "failed to request irq %s\n", riic_irqs[i].name);
-			return ret;
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to request irq %s\n",
+					     riic_irqs[i].name);
 	}
 
 	riic->info = of_device_get_match_data(dev);
-- 
2.43.0


