Return-Path: <linux-i2c+bounces-9572-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F758A43DF1
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 12:42:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F7A119C793F
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 11:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB98268C50;
	Tue, 25 Feb 2025 11:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6Y9kaPx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346E0267B82;
	Tue, 25 Feb 2025 11:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740483598; cv=none; b=hV9QKgOm/pz4kwjh4Xt1Fg8HgIbgW2WdUdGmA7C0avLcOH2kfFy+dY0fJiXgKCYrvQsd8Io9dOPxmSGhW2vbG+zJCU95jsRlwteVLEYXGN+hqlbdcampRwOmGDEqqGxz1zdnLP8Du9lyt181hn39k2dF0TTycnlRnaVM8DgUjJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740483598; c=relaxed/simple;
	bh=7Hn9eyY/r+56QtC+SrXWdk4+pEmDLawrn1RsgqslaWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i7yB7wlQu106sg3Bof/xmQKK9DdWKKXfbvzvlWH8yg206BOSpj6h5KEtl10rxk1VOK1cxa9EOEManfKPCVRML2nio4g6BZWaDPF20y3E8ZaoHYKo4IXzKjkVnwXw/3Mkdrfxujpi3O8QLahAEMMG7Sh2QDlvHhx+F+QaFAyJwIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6Y9kaPx; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e095d47a25so10114072a12.0;
        Tue, 25 Feb 2025 03:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740483595; x=1741088395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6SYdkeQz7UsVBUHqnhrO66k36/2Hqum0jxaUBXUOYI=;
        b=e6Y9kaPxueEZqtwPmJGpyl3dKsM2nL0gPrOjRcZiRqc+cS9W7TIwtV3P0GX1sbbYGr
         /wwKDFPRCRrBnqlYASbFI2ECIQg3JL1u/ww/3EWoa3vuVXKZOAVhIrTTacrTrUOeHOxe
         igl1wQ0297GAbhRlg7kRCzX2XHnDZHwFPLGdZE+3dW92KuHmgNjarL9QsCSbFLnGzAbX
         pdUVezGzD1pS7GP0MuPHXBtghHKxX8NxCHbMFo8Gfr2JTOQm0+u4danfxYDQqljO064N
         0+8WNjqLBk90hKT6j5AgrsTIuyKK4iSBvf8P7f+r+zRdqjlDrbHOWBX5oi39uOpmjs4/
         CgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740483595; x=1741088395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l6SYdkeQz7UsVBUHqnhrO66k36/2Hqum0jxaUBXUOYI=;
        b=wn3D+UUq5xqbXOrDAj4OjG7enA5YsI1OrOQA2gXq1/gHlOBXPJIiyj14AT1ZZYv1Wh
         wuEzf/upMwuOZIZtiYpq+ZgH43OLYVbBDgmI5pRiaHgBUF9FzJgmC5oPm1vT0dXt8ZgZ
         tivmma8sEFjrTKmZYCFAKCR4JdkTFXusbrCxu66W06mhPi2EGt4+dqU0fZ8WZ424/mVV
         jnwYgo677Ae4aZKIljANdzFb26OYEbEYB3dkBm7gr8Tp2PSN/4h6yF6HwX+bq3UH/pEd
         lhXOzoR1p9miIY+akTou/V299YxIWfaGdEtpxdwC90RNSYgiwVJ8wKXpqzDOrx2pJIIG
         SgfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeLQtIJ+Tb/ILK1v+bcx/0FPKEL5/plsNBHzNb2OYMuQCC+nQOqXPjdMgL2kM4GQ2Nhl2M3r4hSA118KDC@vger.kernel.org, AJvYcCVW8tsKYbg+sGX7OUzlj+yyCcfBZMetcWcg+jtbGJGE+jIiBxhUHLNxcMHGYhRu93/d1GzN00Jbmb4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyty4/Eof6pFMGx3/aghs5kYnXmznxXDDcPU1QUXWQZGxMX+6vL
	zS10dah96GQbrTnWVIVm3RkNpuNjNUwfhr7vvVyh8rQdy7ELDaxr
X-Gm-Gg: ASbGncsM6q5U7DZWoQ8HoeLZ8OBpUtdrek6jQyK1rkXn60qtATwrT7i8tR/R8+Yffk7
	VeNHGuw2+nf0TxTNdn8VrtvjDzqUXmff/FF+NCdHXUfMVFQeTw08EKlcit+0VJ1lIi15C+jk3gz
	m5h7NKiG+3ENJN5i65ekLpL28wUkVw2mzJC4NP3wiFGsBw3nC51c6wEM9M/ZWxCaTUwKlwlJQ+l
	EAFvsbVyypram+UO5tHYZK0o1kLKIsbF8WN4+z7V4x3l8Ys9m74DcYmp8p+fQ/crCGXrVHvFwDX
	3wmhygJtkebdrYVx0ZLaS6uB/vILZpUiBuTBn2M=
X-Google-Smtp-Source: AGHT+IFQ/Ni+BmER15klFYuEX8Ks4M2A3NLmJpjxiNWEQbMWtzAog2KQR2ZUpZwJmjeJn1+d7RkNXQ==
X-Received: by 2002:a17:907:940e:b0:abb:b209:ab98 with SMTP id a640c23a62f3a-abc09ab52ccmr1684621966b.34.1740483595119;
        Tue, 25 Feb 2025 03:39:55 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed201231dsm125510166b.115.2025.02.25.03.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 03:39:54 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Romain Gantois <romain.gantois@bootlin.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v2 6/9] i2c: atr: deduplicate logic in attach_addr()
Date: Tue, 25 Feb 2025 13:39:34 +0200
Message-ID: <20250225113939.49811-7-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250225113939.49811-1-demonsingur@gmail.com>
References: <20250225113939.49811-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the same logic as in i2c_atr_create_mapping_by_addr().

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/i2c/i2c-atr.c | 30 ++++++------------------------
 1 file changed, 6 insertions(+), 24 deletions(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index b62aa6ae452e..5b53eaee0408 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -538,38 +538,20 @@ static int i2c_atr_attach_addr(struct i2c_adapter *adapter,
 	struct i2c_atr_chan *chan = adapter->algo_data;
 	struct i2c_atr *atr = chan->atr;
 	struct i2c_atr_alias_pair *c2a;
-	u16 alias;
-	int ret;
-
-	ret = i2c_atr_reserve_alias(chan->alias_pool);
-	if (ret < 0) {
-		dev_err(atr->dev, "failed to find a free alias\n");
-		return ret;
-	}
-
-	alias = ret;
+	int ret = 0;
 
 	mutex_lock(&chan->alias_pairs_lock);
 
-	c2a = i2c_atr_create_c2a(chan, alias, addr);
+	c2a = i2c_atr_create_mapping_by_addr(chan, addr);
 	if (!c2a) {
-		ret = -ENOMEM;
-		goto err_release_alias;
+		dev_err(atr->dev, "failed to find a free alias\n");
+		ret = -EBUSY;
+		goto out_unlock;
 	}
 
-	ret = atr->ops->attach_addr(atr, chan->chan_id, addr, alias);
-	if (ret)
-		goto err_del_c2a;
-
 	dev_dbg(atr->dev, "chan%u: using alias 0x%02x for addr 0x%02x\n",
-		chan->chan_id, alias, addr);
+		chan->chan_id, c2a->alias, addr);
 
-	goto out_unlock;
-
-err_del_c2a:
-	i2c_atr_destroy_c2a(&c2a);
-err_release_alias:
-	i2c_atr_release_alias(chan->alias_pool, alias);
 out_unlock:
 	mutex_unlock(&chan->alias_pairs_lock);
 	return ret;
-- 
2.48.1


