Return-Path: <linux-i2c+bounces-11974-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 717BDB0B01B
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Jul 2025 14:59:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 171703A64EC
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Jul 2025 12:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE902288C36;
	Sat, 19 Jul 2025 12:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TgTJYi2g"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B9728851F;
	Sat, 19 Jul 2025 12:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752929801; cv=none; b=JrjltL+izIk8t8jHPAZRIlrzygw4oO6VFfojxDv1wXGQOzx5i6PrqKcfKJyKwrQcNtUTnVFBYNUV0SBpZGyg4+yr0KLb5wA512WoSWEeGk6BHdvHI76ArOCzhv1GEZYU9aN5oH14Ffo4wcpLK1XsWhU2truDbC8niy6DMoc+aTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752929801; c=relaxed/simple;
	bh=XuqdLOxXDPO9JQSHjDKhnVmvk5hC7cXCT51JI5Zeh+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TDHGBxWk4xA03lbbQOl4vkammyBIvy06BUGo03xNd7fX7Lflw3vpyQUkr8qQuiRPXZkRupGPK0+DsT3KaB3YhngcbEhu95YZTCrdAe8VM1gf7OKp6WnF4OOHYjqgCOP+in0pCDWZP+FlJtv5lfhwzamKKAJMn9ztcyN7USxAAbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TgTJYi2g; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b5e6bfb427so1677016f8f.2;
        Sat, 19 Jul 2025 05:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752929798; x=1753534598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Flp2kuB43upoDmZKHtPKy1TYQrSu+LhhKaLm1sYr4pw=;
        b=TgTJYi2gJyB8KUmuifll2B7ydocFdzWKLtSaYeDAxcQfI4kyIeg+obhbdJvWs+E05m
         YDUf09xhGFmq6pmct7gpn5GqFdawMPuAEr5Vz90T8Q2p6M3PWNLNrEry6cK6Ahbr4VdK
         0MRBZjcDEkaJUmvDzLlhs7m/oOmcf7LkTKDfFz2fyczENt9hkw9yy+gPMFXS/S11Wrop
         Zw2Me3Wd+1Z5KQz69ycWemGFjxKOFZ4TGaa2HoEG28kBlXvA8tOlKdzJ9N23Id2sMCOP
         Jyc9VfotgQ8JYj9oJNtVBpcFu7uiJNTZ2Iz2Dut2s0DBTTws6V8PtfFD0JKMLk5zvHlG
         T7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752929798; x=1753534598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Flp2kuB43upoDmZKHtPKy1TYQrSu+LhhKaLm1sYr4pw=;
        b=iCV31DxBI6/uhgKU2slfye3HOMWojy5L/9Z8wTtGniVK+69e6SOZZszKLQ2ScjxHN2
         3kBiyWbetvNfEeB3tseTJ3cLqS/vdLe2M3wcqIb3JrkDQAKeY4pA3mIgn/5CY16H1uQg
         iEMlf2fTZ964cY8JhTapwdmtYL4piiNxOrakZGduC35eYyqVQhybwhJZ3fe/B+yxkfES
         mq2P/Qs7dmUZM34coGaSFbumUOx6f4KKbdGwhWF/OqLwz3CEY7ZJtyCzBL2OvF6lt8cB
         kz2RyAab0+FAB4hRNCD5EfK/7/LXPWVM1QchFQYw3mNWwQbkyRu/7egKOWxRdtPsFiBL
         pkjw==
X-Forwarded-Encrypted: i=1; AJvYcCVSvzYOnK2KQqViVBFNu77pDGzut6yz4WhjbGWLmzE4307rwE7wZaOIsUeUGcoSHmPL0TJ1P/KfFm6f@vger.kernel.org, AJvYcCWbqWQNNlQc+4rXWtbtSfTsrrT8VMZB629W9IMynsUbWnwrY606Ty2beh7YaZWu13qBcyVa2SgZn/w6@vger.kernel.org, AJvYcCXsDra0m3Gvzk+ZqyOqZqlv7hSi4BlFJ1pLvLWHOsuUZxZJ+ywQzXT/UvfltUkuYtTodBg2vkB7GMsNnZug@vger.kernel.org
X-Gm-Message-State: AOJu0YyAmA91l3iMsCdRbXrBLrVzT0sGM8PENCef6rtOYlRH7hEt1QGA
	eTCOfZ4CA3QmySh20a7MTRu/S1UNp/WmvoM2a2PfvC2gBYn5/oJGtoDb
X-Gm-Gg: ASbGncv8dCJar1qvDzgQp+epRmnQKk5BsifDz08PtM3krZhktRFWjzvSmjNiVY0vGHb
	n1G1JwtWk8EeBXpDq7jDcAIxYVQkch5M9GlA9fCjxjR7gbDSfEBnPye43bFqWeuQML9VOv3smHW
	k6lYPNxK2P1ufVL3aeEPsb26tdXhfOnyWmAODuZWn8ygHkbqUG2LNE3N0RZC14CrvcowqwTqe82
	w0nRa7RO0ZZfP7OfRCsjzn1mC4pnTe8u3CFuySo+uXCpsfOiW+8H4a/h7sA9KeZGuW0OqtoQLRv
	ZPCRGwFGv1UAFGvDDVBLiCcb5L7TwrQYWPLneHCcekXeSOAHE3y8eXvBkGm5fkUKEUf6en/Dhb/
	o70qZFu1HlEf6eMmAMajC3stgABxodmso06BhZsPIK/2wNxOaw215Js5ARbZLUc/ysHs5+w7Kca
	t/
X-Google-Smtp-Source: AGHT+IE4JOLUnKqTG+RRT3va8EmyFFWbs2GSaAaRZYzN4jRFgloh4aLC71f8N6Pli1m8JiHLL5dIBg==
X-Received: by 2002:a5d:64cd:0:b0:3a4:f7e6:284b with SMTP id ffacd0b85a97d-3b61b0ec05bmr5500785f8f.10.1752929798033;
        Sat, 19 Jul 2025 05:56:38 -0700 (PDT)
Received: from Ansuel-XPS24 (host-212-171-170-230.retail.telecomitalia.it. [212.171.170.230])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4562e81ccb4sm106688005e9.17.2025.07.19.05.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 05:56:37 -0700 (PDT)
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
Subject: [PATCH 5/5] i2c: mt7621: make device reset optional
Date: Sat, 19 Jul 2025 14:56:15 +0200
Message-ID: <20250719125617.8886-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250719125617.8886-1-ansuelsmth@gmail.com>
References: <20250719125617.8886-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Airoha SoC that makes use of the same Mediatek I2C driver/logic doesn't
have reset line for I2C so use optional device_reset variant.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/i2c/busses/i2c-mt7621.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index b4dc1fb269a6..6e3848f163f0 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -91,7 +91,7 @@ static void mtk_i2c_reset(struct mtk_i2c *i2c)
 	u32 reg;
 	int ret;
 
-	ret = device_reset(i2c->adap.dev.parent);
+	ret = device_reset_optional(i2c->adap.dev.parent);
 	if (ret)
 		dev_err(i2c->dev, "I2C reset failed!\n");
 
-- 
2.50.0


