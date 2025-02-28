Return-Path: <linux-i2c+bounces-9652-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 686DDA49D1B
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 16:19:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 436A63B01DC
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 15:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03096275606;
	Fri, 28 Feb 2025 15:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RgaYDgK1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1373127293A;
	Fri, 28 Feb 2025 15:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740755867; cv=none; b=a5y4xO7QrmsfbtIBukZeJtIOPHclXJyWtD/WJ6Yh+m17f/tRcT1MTtBaa0O0w5qHOhGeNxKN8rNzqiP/7If0M2EvoMR7/PQDkDzHLSxlkwaKwi3YZ1eQItxjkKfqn0UnGtWaEW71SG43reQj9RtPYodtDqY9BcmzWA5I8bqCUOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740755867; c=relaxed/simple;
	bh=WfkXDrGvYN8uN/Bp7tosHJ2k1BK9SeNY3SSbh1LJ+8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PXEH+JAXB8JrYTvKODc63kJZg1ZMEpsTbtNFv9OuJ7ILgbvoAhXS2bVGvfZ21SjXA7R4qhMIvTcfQ0JzlNc1WvTZgL1nTo356deRlfvzPY+nZIlIGJomcgU3VXuE6c8waw+P0ozBQb0gng7Po8LSP0gBAT1c27UzGrZOVOQLiiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RgaYDgK1; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43996e95114so15948575e9.3;
        Fri, 28 Feb 2025 07:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740755864; x=1741360664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5lOSBJvwe5uSEevcFk6UxLu7ZPFJZy2weUCb6t4qZU=;
        b=RgaYDgK1utDdu6b88ynczrxISrROpj4pBG2WUlZeyZb/8R3HG3SgeUUnfp4/lCkqFt
         mzi9+7IZkTViRnnmsdfr9eoPUK4B/TLrjQ4UMlELLBAKLU9Az7Km+pfaQGE92ClFGWZg
         I+BSN5mJNDRZr5uGdMIO0U4wtZsy3YiZycHmwDD9KI1BHAyzuhz3ncTxGt13anNCM7Nh
         JIQBLGkOft/mazWBaW7HYM+rzFAaSKbqfdxdYVY9MDtfNJsDo9tHQd3HjNXNpMRD+gpr
         t6C+7N/tXd1NWNElEiuWNE8V0M4Md1N07yMeflZGhZzwqcfrP/uZ35Z8CriSxI9Xpp4K
         rKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740755864; x=1741360664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W5lOSBJvwe5uSEevcFk6UxLu7ZPFJZy2weUCb6t4qZU=;
        b=SXhtK+Zgtx50Scs0pdKiqknfhAXfCk4Wk+Y7HhxoNRrkcftVheZGiEektl+gFSbm5B
         aes4ztaeraeCZaUU9S1rSSY1kZ/mqh2pvviT74gbmu0MO8p2w98Wh97TZO+t8ALEBDH7
         G5+v3sWpdAJHJvXGfn/bbvNji5NfCjdMe35NmhdJ8NbQA0ze9Gb2bMGav6731ZkMRA8n
         3SAUcvU3U20VbKtql/abmnc8ZqUNeUaWIhqD9uXubCZlIFYBkbg1L3xSPY7gllaROGYP
         RAYiSG60lCbbIa5mdyttg9Dnck0MPJns4yTZ0l4510I3MDXiyBleK2nq5J5W+TI0dFS8
         9XAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkdmpFoLaoEDuWUQqOUfRq03oh3JjU90iDeDCDQ74KbrR8P6MPCpplMiiXTvjbipaV5xaTEOyMCdg=@vger.kernel.org, AJvYcCXmYPGDF1Z/95MpTetAG2oHAeBycgFBMFHlB5vxb5+eUQppk92fT0SvYxGTMA9/euTQMEaqOJ4t7Rx9a/4=@vger.kernel.org, AJvYcCXo0dTZxFGcnmHK5pXnSeF8B0YTy/jcoul9O+1L2HA5HfH0JMfUFVSlgV4A2jIPVQApTCzgBIVjutvLf5WD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+bAllv13CgCYTaNGDvC2y3HHn64vMQpMZ+tZx2VISSfpRfQAz
	sJGWZSDD3evHxPnnfLZznqiNa8VVSMg6nMdS/5x8XRfsG8mEwGtm
X-Gm-Gg: ASbGncuvE+1RPVJXybTO/qgw8D9h4wpfoDrLh4s/SDCnGOthAoeDMS8Viy6fy841SLH
	eDhg0x+ft/ZF3C91apoPfKYtSoa63qsDGdoBtXJXGVsHy1RZO5nT5VDSHgRlpPlheMILtnVeGtP
	F7MVPNSmjOXRtt9yv5+Fyo3DLapNIYkDWh3MQisa0KSBHzIQKEunrGgNmowOQi8Ls0iffHRiCJ5
	Bohz3UqC3Jim0Sfwne5X4cINDQSJo0oigcB/yhfKGujmzmXS+gjQbRud/13KN03LDFqU0/rxmN3
	i5ISGFcL5e2dkTrZ818PEoBO1AGZGX9qRAx/b3U=
X-Google-Smtp-Source: AGHT+IEP1z2gYbKB4fBZrng7aoyZYKSP/V+gCCgx5zf9l4C+JfYPAcPo5iS7ng0+DCOZujB3CfGlQg==
X-Received: by 2002:a05:600c:1c95:b0:439:9828:c42c with SMTP id 5b1f17b1804b1-43ba67606d9mr30993205e9.23.1740755864122;
        Fri, 28 Feb 2025 07:17:44 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b694524c6sm63096825e9.0.2025.02.28.07.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 07:17:43 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v3 5/9] i2c: atr: deduplicate logic in attach_addr()
Date: Fri, 28 Feb 2025 17:17:22 +0200
Message-ID: <20250228151730.1874916-6-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250228151730.1874916-1-demonsingur@gmail.com>
References: <20250228151730.1874916-1-demonsingur@gmail.com>
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
index 148a7bb0508e..b9d63efce8e3 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -534,38 +534,20 @@ static int i2c_atr_attach_addr(struct i2c_adapter *adapter,
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


