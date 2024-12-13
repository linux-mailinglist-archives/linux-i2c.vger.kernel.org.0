Return-Path: <linux-i2c+bounces-8495-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2476F9F1482
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2024 18:59:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFB901883DC7
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2024 17:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 828EB1E8841;
	Fri, 13 Dec 2024 17:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="moC8fTrj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF7C1E3775;
	Fri, 13 Dec 2024 17:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734112717; cv=none; b=o7n3N7RcLiIXjFTEGBBxXypa9g3jZwpvhFvT4o54lRD1azbwkrbS2+Exh7quHT3q6u9vNqPb3Z8msNDiye67vQEEkXnTDRAeyZyHswQJp3QFL8wCwcb2svI5J9I8R7YeYKGLJRaqdeOjD5IvUV41c1gBO6SjEP+D6Gvf1qbHjz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734112717; c=relaxed/simple;
	bh=W8oNQSeOIQ27iGni2+2i4bYsGd5Lo8gwn0kk254jE38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X40jzpLyEGCS1V6BIKXLfXgOHavRyQRUYMZKTzDu7nfNVdSd4qCKa1pNqrbN6wJDLczgeX4KI3UUZyRybjmiYwdpdf5pB8noJ+l7XwlYA1sdomzhE0qECCmh4HsUmGK0xIgWQYFuj0cFNX+fFPoH48OwtO8cYrhRU3MEr1Rc99o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=moC8fTrj; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43618283dedso19382565e9.3;
        Fri, 13 Dec 2024 09:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734112714; x=1734717514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m22X8YrMWCLSXkLU9BQ9UULdRQ3y6T7GHGyJIqVQpsA=;
        b=moC8fTrj3yh8i6GPJfM25umKI2407HXM637fVQhEl+TCgza1ZhTw4VoddbShZ5XUBx
         rmxV0MTnq4Xrgax+UHFOmGc4rHxFNxDLynJE5brXQbELmaQDVz4MoqmBPT/YE8WJbJwg
         7/NsMsWqLq2i16UtDd8wWKfZ2Ig2LXTraRQox5/GpmbOxyYQXEEWr4GTZHRzoHWniDM5
         CQUfPaa6fomy+6LU2tF+DqVHjTb6QKhxUHvjhKA3Wi48X5kmvLSlMjDoJoFjqQQ2c1zl
         McBn+AiJeweQCn19GMjRkb01tTM9eoQcQsgKOXav7rk5vnaKDzh2Z5eEUclwfLtYHQjN
         Dj9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734112714; x=1734717514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m22X8YrMWCLSXkLU9BQ9UULdRQ3y6T7GHGyJIqVQpsA=;
        b=J43h4qsjOZXe1Mjf0+8gXU+mEP5lIi+ToUfd+RD+TtTU5KMfml77Fh0kUGqh/uGhpQ
         qQwpTotIaM23lMbTiDncWkUpXAFmqpfFPdDunI4MzyBOdlqff/lgoQH8Zr4C+/9/AVel
         tkxK8cgJy2Pi7xwvycn1IA1L1BClyCjPvC3/DhgHaIDemkMJF6N57PrjkgsxGxnRfShh
         PZgsfo9j+tn2UszEXg7sFZew3G5Q5YVli6cdAIEk3EZUfJhe096+GKFmnlIkrHdXVTk+
         GoYmwiOvEoyM2cxL3ZJUAC1BYe8jugvWw1Sw7J5nVv3PhC4JdiZxREzICr4s0A2Z8taP
         ds6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWNS7HGCcUyew4Qoeo76/pDoeMTKKmfV/ovqmLJ8RzlLK8wLZ61pzNF1EZSXe+x8oFx0yLWUP6vklg=@vger.kernel.org, AJvYcCWlfSdR3VdcAKNEGTqtedaOUnpWizlSNPKZWVv6RsxP8MTRrpjvJZKwPp8Q6BvZbNElHZnDNZpaopqCuTmy@vger.kernel.org
X-Gm-Message-State: AOJu0YzKRQw8kL9cNHwzewk809ohSWPCBl4htjE+vV9z7L4CWGUqjZzG
	k/3wZdYCIet8//KpCE7YnYPO9P3vks1L4kdjeH0J2Qqc809twiqsXq0BjQ==
X-Gm-Gg: ASbGncu+wp7U1a42q8lErBbSn1iHtPtOVk5bf9695nqFcBDQf9z5knd8ieut4dzJnrZ
	vYhYPOGmLbp2xOKoPQljyDZGeLhEH2Ixt8e3wnDunT6Q84mLsWFoOPkcvZ3h41A06qJPZwcBWfN
	WINhA3OPCqZP8++Wn02ciNm/Qms+5mQdUVx7xjTEprmiGNE1R/NJRCBI5mSNfU9cwj72wBZnFdz
	TA7w5JHjWcxGNZ9qmM+Mh5kxFKH+O1RKbiDkJyI2hAfw1oRb7hdjJqWAKiHm07k084oi8NqMn7g
	T2mi/fFhKg==
X-Google-Smtp-Source: AGHT+IFO96Lc8qDkLcXuP0pFBLM9GcL6S1MVl8Atv1Y7dbdV+Yk4b4sn9KSn0FCe2DhGRAXehYI7Pg==
X-Received: by 2002:a05:6000:2a6:b0:385:f527:be6d with SMTP id ffacd0b85a97d-3888e0f4763mr2697926f8f.36.1734112713561;
        Fri, 13 Dec 2024 09:58:33 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:4eec:e99c:89a6:d7a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c804d573sm119088f8f.64.2024.12.13.09.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 09:58:32 -0800 (PST)
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
Subject: [PATCH 1/9] i2c: riic: Replace dev_err with dev_err_probe in probe function
Date: Fri, 13 Dec 2024 17:58:20 +0000
Message-ID: <20241213175828.909987-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213175828.909987-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241213175828.909987-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
 drivers/i2c/busses/i2c-riic.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index c218f73c3650..7ab32aeead4b 100644
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


