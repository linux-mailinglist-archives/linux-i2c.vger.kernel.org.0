Return-Path: <linux-i2c+bounces-11985-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C26B0CA41
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Jul 2025 20:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F8541AA8034
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Jul 2025 18:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 787FC2E2EFF;
	Mon, 21 Jul 2025 18:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MggNcTuD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC1B2E265D;
	Mon, 21 Jul 2025 18:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753121253; cv=none; b=mVy16JuNViY3iErtUoR8wy/qk93oOv1VMLBUwONewPrzVgkMHQOJ/QGFeLNFLPdqLu4mbJi/ce/ODTzCt8o/V46X+k+u3SVQcCDLr/DKZi/ZMclfaaWdlsu7kRdlhOXrYXQX0EMOlg3x3YwDWDmtjrj6QsSqtAmAZzrrg1In5Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753121253; c=relaxed/simple;
	bh=gCTLtnVEWTLUGy/YqhtrwDKE2ztfQikmDUvErDItnQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jnlM4Ar7O2MVS3K6VK1Gafgno/RSk7Y83mxN5GKzXATHwUf1TVNbiC6O0jZvXPwhuAksw9llIHSGVmxAAmbG9N8meBK/ZjUBmmIpAZmBL47xOc+mSKow0as+NmfBketNwLD9Pu7S2FMRyYjNehsAA4zIa0dH3lNDGWhJ0IL+oBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MggNcTuD; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4537edf2c3cso48923795e9.3;
        Mon, 21 Jul 2025 11:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753121250; x=1753726050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G45LkEjjfWLu5Gg4t0c9h2G9tyU2GytQmU3UOMJ0qRU=;
        b=MggNcTuDF+Z0Xvhx6L7cGGZhuBvnNJXGT9GYx4FDzqnkQ2ORmM0D0EGged46tXM4zW
         vtakvWSUN2FyfjLmxDi9SLmCjsCsM8FNF75WUnv7hU4x3PS6EENQsL5QmuISMpGgb+Io
         qlvhBv8dJwM4RN+0POwQwZO7RfRia4CBhOymecYA0xlN42N2KyfPwlhD8ACTzOqowbii
         0BLjBgOakxGeZLeiR8d3fycMghvxiLV3mC+EzXrYEH2PQNwFnVv+v6RMdFeEXF1xyzZ8
         TJ5cx9UUgwlCip1ELhxZG5IXv7UUdeKhCRHeG4qxSuZkvfgdidFQEMRI0KcYpsZDeu2f
         Z+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753121250; x=1753726050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G45LkEjjfWLu5Gg4t0c9h2G9tyU2GytQmU3UOMJ0qRU=;
        b=UQ+wiAtuaYVfGngGxCqgEPXd50RXIXDD99ULy0QiZ3YGKihQDfig1wjc9FoooR/w6D
         hijkyqtugpAsTBR6vSnNSYXnB07em6HsJLAP8D6u4V8DzYXQiGZRE9y6MGm8fs9/4wlW
         u1xvL2Qtp/TirLfISJurDAyToKt2HtJPbWvcwtJl+jg5swj2u2Gn8bHPKPMn9m+L/P3g
         xJjKYw/IbT2cmtUR2Eb0KjLT9vt9jmAtiJ/iqhmXPOqhqA3geTv/hI/gv94JTtMVLWtu
         rvadtZWT87MLD+2RP4N/It52Jg7hWvpl32976lqrUiGUsWg60MW52/H44kHNHDVi6RX/
         fvvg==
X-Forwarded-Encrypted: i=1; AJvYcCU6ZdyapKLx6Km2iDGXnwepLxkvsasuIOIEdKfjdL/KkfBr+GAKkg7bPnn4OnEhHRTdu3QCs2fff/QH@vger.kernel.org, AJvYcCU8l6oT0slRApA/fWT53SEJu1BVGcETmr/5y0PxrvWrqTaNc6PV0vpjmlcAy9M9R2TWGgr/MuNpjJ60@vger.kernel.org, AJvYcCUTj+TF4dcu7tlLR0d0a6lovVf7zPlEV8F/k95Fw9gBNH/sykTzRGCi4bNp1Csw/vTd1lLAZfwUDWrAWhuc@vger.kernel.org
X-Gm-Message-State: AOJu0YyhQ+iM0zUdopjxHoNB2s1unZHJkznnEJzNsNxJxYLMsIfZDeme
	hcz9Gnp65kYv1Nj/c7uyLYn98X0+G+C6d9vDh3Ar5DyPkrCJDyrEbeLK
X-Gm-Gg: ASbGncukDIROuCm1h/gnZmWZau+a/KJcHi/8nzr6JtZOAtmVtags+VmUf+iORVgHDvw
	wqUti1d01SBUslm1qNFp2hhdfaT6stJfyfsJvCJJgHGp4I0pgUkP0MG+7AIA6bwhU1IjeWB7F86
	ItQLjBYgpfobdlEuqo5olTvXW8ncsGKlNHptJYc2CNbQASOfAvbBI6VJpFQuRfeDS8DIdIvkRqI
	52gyXqRyVtl2yxKidRQPLYqooPYlFuAtA38+4YKE4KdWu2GVjeP1awUE4JYMYuYTa2G0Xsih6jG
	3WbAoRvp6lIaXstFSkW47b5+lK6LxxRyKvRI6bY/SyuToJ1Bu2ZYdky34510U87luCYYs6rnFqB
	BluHb8/o+FWwYjS8iY6rnqto=
X-Google-Smtp-Source: AGHT+IEaJ9IKclVWpAiI/LNl2Pqjf/7hnj98qH2PFtCovmBuGGl9+iOZcDYxw7D2OIArZ9QiG9oQOg==
X-Received: by 2002:a05:600c:a00d:b0:43d:4686:5cfb with SMTP id 5b1f17b1804b1-4563ab1fe93mr127073725e9.27.1753121249509;
        Mon, 21 Jul 2025 11:07:29 -0700 (PDT)
Received: from Ansuel-XPS24 ([109.52.136.49])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b61ca25443sm11183370f8f.9.2025.07.21.11.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 11:07:29 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 2/5] i2c: mt7621: clear pending interrupt on i2c reset
Date: Mon, 21 Jul 2025 20:05:53 +0200
Message-ID: <20250721180710.2116-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250721180710.2116-1-ansuelsmth@gmail.com>
References: <20250721180710.2116-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On resetting the i2c bus, clear any pending interrupt to have a more
consistent state on the next operation.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/i2c/busses/i2c-mt7621.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index c0e13f9af3e5..58c3da92cea3 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -101,6 +101,8 @@ static void mtk_i2c_reset(struct mtk_i2c *i2c)
 	iowrite32(((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN |
 		  SM0CTL0_SCL_STRETCH, i2c->base + REG_SM0CTL0_REG);
 	iowrite32(0, i2c->base + REG_SM0CFG2_REG);
+	/* Clear any pending interrupt */
+	iowrite32(1, i2c->base + REG_PINTEN_REG);
 }
 
 static void mtk_i2c_dump_reg(struct mtk_i2c *i2c)
-- 
2.50.0


