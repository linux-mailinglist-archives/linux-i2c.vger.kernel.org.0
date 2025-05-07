Return-Path: <linux-i2c+bounces-10870-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AE1AADEE2
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 14:20:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9F2E1C05D44
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 12:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 297B8262FE3;
	Wed,  7 May 2025 12:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mShRjFcD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4665E261581;
	Wed,  7 May 2025 12:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746620375; cv=none; b=dKGTPnVK/KIjghe3ybKxa8veDjJ94d7lC6x7gqaU5SGtkRmMQDBUALPBcPCR9e1se8CzGwuXTX417hksCl650SQFAKVb19lONgzjruZBX6yatZyw4JVBS/ulIcq9ZLYQ665JVKs5wNDJiiFZ3rvxgVieOkTyuaWjGCclqgvYTGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746620375; c=relaxed/simple;
	bh=X3YUS/ie8/5FFQjnr03A2xbiPiwtHC++WaH/577C/GM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RhYcAjjnKRExPatima43DAOW1Wmt/U79VY2hUd2YEvPBCCZcgcvrE1n/+xwwCUCJe0bxUHDLUkRWhJ/OCLkNKAxXKI5UPJ9Wj77mSa/FPThy47QQcjQ+h+XYqZNu6HQDho8x+fMpDYRdnD2vahWv7I3z6njRVzfJANVzFJz4hcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mShRjFcD; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5fbf0324faaso996392a12.1;
        Wed, 07 May 2025 05:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746620373; x=1747225173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hum8qy+jd558PCIht5KO1+9qi0uHpfr5Dfjd1rYbB/s=;
        b=mShRjFcDo0ufBOioeu8rtm6Ypwxw3O/fs2e+9jajr++RmcVqwwcm6k+D9rWss0z9Yf
         xeKWTaLRZaZWqIvlcQcYZNMwlXe2vNyAFYWpEh/WD/X6W2oY/tvsiOMGU7QgpBJcTDGQ
         KgKdzmD/H9LLvux7fExkJxW/6diH3DG0SBx36WQdOI5NnQGnkJyoc4o32VMevaegInAh
         96Qk0BtE2/SKP/NETn+2eWsOmFBcbWkMjJG9YadM3lh6RZOuk8vHd+ajoHq1uwGQ5ek8
         KqHGeCpEGeQ71u5jQ6eVDOA3be3iDpKvAt29BURuLfMnpidMe3s2QTFw3XtGFuOS9PP/
         Ib4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746620373; x=1747225173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hum8qy+jd558PCIht5KO1+9qi0uHpfr5Dfjd1rYbB/s=;
        b=Lr9Y5Ww8ODJ2PxnozhIHZ0JB0Zn3FAxh3aYFLNusaLHtHVDcfIOvSN041axAFv0lag
         mvFnsDpxNZi9xxvKpUuwF3I8olm2aTgYkIKNPYJ068z791srcZvxdXoY50VKj/7/QRHQ
         ASwwu85AY21ppXLji5z0KV1c5JYkv3A4xGWeSuc5jh8QeHB7yF8n1Q/1uj7B3EDAxLDn
         FZlXe/USlP3PF61ztvkBzMtjY2RalgX8P3HtDmEvTeWnsLvWpERL1reLpv+QG+b1R5+g
         fg+Q3we5S2FfGHIuoAf5WUTxkRE/3PN/ROJyIj0ZKOq48iaKniC4iKguyPiUUXYV9nhW
         RlkQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5K2//Pkdaj9Xi+0gByVs+Zwi1Krolm44bqs0/9dbRkD4bIVUR8C67rFCX+HdCQV5zm9tBUshgiPY=@vger.kernel.org, AJvYcCVrScP/Ny4s8JrbX9v81cVt13Fzm5JPvHywRi6zOPQMWmGkhZRF4pWINRYFiH12nYcLtMGc6MXT9FHFEQm6@vger.kernel.org, AJvYcCW57sJ+bci2KHLLs/LASCX9LLBYrcogcSpkynHezQhVQU4xChYieU7YCDiauOlFVFjzodtidM2YOzO6bWU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc7qaVX/x0aXd652SNPcbccWmjV8qBWmU6oYLtovnfDGS7b1xS
	NjMB2VLgYkiOpylSVSgKfzNXXyTzpr+pqeyE+awXGUwnNAho7k8UIIOwMw==
X-Gm-Gg: ASbGncs0tp+g0LxbAuBo4zURcIU+49GSqiJRZ2I5ZZeKQIJ6Yp8eS6Pk2RhDUgu941S
	+qSpNJRGdx6mcytjWwyEZWQ8S+eE89T58xvfQqmtD0Y/R74K/cLBIpNF+hpdm6fLKIXsD1dmI06
	Qjrc5OuXHdqyQIJiejRoCuPoVCVqIQdsZiPxDtbOe5c5iZAo1c2IsjU05FDSkh5ln04xg2UV+aI
	7BtIX/534t18W5F8ssHItUi+jG42jWc5yYsTyhjQHu7zaisUCLvTDM+h/DSK8XOsA/3jjLihEnD
	5/5E2yqXwSTEAlRFrQ1p/Lm+uu97myvJFcTZLFRQUJlMyE7QR97QmDnHs9T3VwY=
X-Google-Smtp-Source: AGHT+IHgBSIVG7Xa9BXL9TdhQxQ6rHWVbK1V9hDshVe5yWBiKY4V4ani0CAqOqHy2aBB4ONpetAx7Q==
X-Received: by 2002:a05:6402:3588:b0:5e6:17e6:9510 with SMTP id 4fb4d7f45d1cf-5fbe9d77c6dmr2625869a12.6.1746620372382;
        Wed, 07 May 2025 05:19:32 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa777557b9sm9350002a12.10.2025.05.07.05.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 05:19:32 -0700 (PDT)
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
Subject: [PATCH v5 6/9] i2c: atr: allow replacing mappings in attach_addr()
Date: Wed,  7 May 2025 15:19:12 +0300
Message-ID: <20250507121917.2364416-7-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507121917.2364416-1-demonsingur@gmail.com>
References: <20250507121917.2364416-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is possible for aliases to be exhausted while we are still attaching
children.

Allow replacing mapping on attach by calling
i2c_atr_replace_mapping_by_addr() if i2c_atr_create_mapping_by_addr()
fails.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/i2c/i2c-atr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index ae5c2ee629f0..91aabfb4379b 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -543,6 +543,9 @@ static int i2c_atr_attach_addr(struct i2c_adapter *adapter,
 	mutex_lock(&chan->alias_pairs_lock);
 
 	c2a = i2c_atr_create_mapping_by_addr(chan, addr);
+	if (!c2a)
+		c2a = i2c_atr_replace_mapping_by_addr(chan, addr);
+
 	if (!c2a) {
 		dev_err(atr->dev, "failed to find a free alias\n");
 		ret = -EBUSY;
-- 
2.49.0


