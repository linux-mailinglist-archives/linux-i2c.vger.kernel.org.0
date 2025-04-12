Return-Path: <linux-i2c+bounces-10282-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E838A86F26
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Apr 2025 21:37:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A92C8A2B5D
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Apr 2025 19:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F3A21D584;
	Sat, 12 Apr 2025 19:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DhB6JoC9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802C8347A2;
	Sat, 12 Apr 2025 19:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744486643; cv=none; b=UcIUFJ/zUJtNKCLqr4Wc1qOoeRscpx8Bkk5midP9im9Zxvtk7LIWDajakc51zTuuNbAiaw4uC9fQHrWGa5P7xqKJboT29FrJLo33as0ZP6fX7ZkjDqUVzpAeVRzT+lPG8H/yV9nzYcXdxonn2wwqtaVUjOlIqav2JTDeFdRLB9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744486643; c=relaxed/simple;
	bh=mx1z/re7n04Yxpanb9se1RHCDu8fxXSp37D3YTgFUYY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VylQsDityrSki0FwIiiziEzFUPTympsDxzdbLNgPZtkNQXiYKsWV8chwLIttX3+jJADcBA0mQ0iJ5x07XmDpJhUUsETocL3jCCC4q/j6uXCVoc5T42yZ0ukX8/gOOj+fbhvLXjfAF4wD70r2fCd86o6lh1R3BqryvqHHdLxqPx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DhB6JoC9; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e8ff1b051dso5232156d6.1;
        Sat, 12 Apr 2025 12:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744486639; x=1745091439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DYEHzBb/el9AoD7D2FT1/1Eq0yjWyE2cC1Wk1nSVLpA=;
        b=DhB6JoC9Ql91YG2Kc9LeRPr1UcUk2fLrjzsvEba7YCX8Z7iboiJGD/ECaDED98O6I8
         UbdYMpQwf8PjxuveW0LN7EjLUDyaWqiK18xlZyKXKEBJ8SF8Xa/2EDRj0oQftf9rvDfB
         y1v/0gG9i46JvqbpmpddCiV2y8sH+T9FsvrPP/Ha8MFVpk7g4xcSJAmbo7KjKpcnc61N
         ziDiKUt9ndtmKcKYS3Hz/d5rNihKcwluIKzG7GRNeDim4qREYqOvNVH7q39zkHfGyD1t
         AUw6AY5GBaNT5Nn1r9XCq59cYdiLFadPsNvi9+ZOc/LPTy4HmX72cyDHav3+oXhiQzZM
         4N6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744486639; x=1745091439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DYEHzBb/el9AoD7D2FT1/1Eq0yjWyE2cC1Wk1nSVLpA=;
        b=BbfXK1kEXTg0dhw70PUScReXMv8jvAWoq1XI8ZU+3U4I9vm29P4h4g4zUVLwvo/zDn
         /VpIW3xG4Nie+fgLddwELr/UEUeSMOyP4AltMoEkOR0+CYM/OCHDcSPRtvHwAYBkVrJf
         urRbrjBmE/f8C3mqunLpLkC23rHzZ1rWEKZP742qpEWV8HFTKNBr7LEhAmTwPxwwNi3V
         NnQ8xzfZX66FN/s+badjv05qB0ZLlER2Z8A9jcTcnZElYYkPQSIkzDH90HK3DBBsG6YG
         WR9OaR/GJX/hUGJbPnLR6CHCHAEY+2K/sjyVqjFWkFvJfXd4YLo8ET/27VBBfupUyRp4
         1HLA==
X-Forwarded-Encrypted: i=1; AJvYcCXSLdnSIPOWo1jZWOvRweIBPEpSdYg1RhdICgaJhw9mbmfzn3wmoiXs9Dghag9WLmPoZIhZD9MLfTU=@vger.kernel.org, AJvYcCXiiAg2hFICLPL6Fi3Y4RIeG5XVRuvu1WoMKOfqB2vlR1d3Ik/j2b8mqrWez48x0Bq4gOCtpAp35AawDYMo@vger.kernel.org
X-Gm-Message-State: AOJu0YxggXmQlVNpa7WT1EpA6lPx9hjAm6/tybHsmtdRRM5I1NsekxzH
	XvbXYQPgNJGhfYPe+j9AhENhH6D9DzjdaQ5e0Ow2nMefqhq62nE=
X-Gm-Gg: ASbGncs5PllCzmidyANM3CSPoncnscwG8MIfd+ND4zkvANTFFbE5gNEbDRsbLSD2bH9
	U/dsFj/CZUrsPTMk2q9q/LhLOEa2gxosLg3wP8prM8iSvF+EeKGiua5SQuTuvCdU57uHTECdhHL
	RDx4/7ZEPq+AqGqAqL0B0ee6EIoE3WIydg+UaFjhAA1e07I7KPMrpOEXFMsywJcJYGy6GIDm6/o
	IEvvGwpUlMP3fBZn0mRW5r1ejqtqMt8Eh6ePiGqx8/y3gfRnHvNiiUJ9qkNUWmSiWm+CHPWCV3X
	AidCcZ3p10/rsegttGbDsxIF8vfGFaUBZtJjcA==
X-Google-Smtp-Source: AGHT+IG+dK1CyZ/ZjXMnHu8ljlvkEeDsfaduxQ7Cw8m+w5ILm1RgkP22YLpdG7M9YRi1DdAeyJKPsw==
X-Received: by 2002:a05:622a:490:b0:474:e996:197a with SMTP id d75a77b69052e-47978fd6eddmr34349551cf.10.1744486639099;
        Sat, 12 Apr 2025 12:37:19 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47983d782ebsm11797151cf.9.2025.04.12.12.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 12:37:18 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: vz@mleia.com,
	andi.shyti@kernel.org,
	wsa@kernel.org,
	manabian@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] i2c: lpc2k: Add check for clk_enable()
Date: Sat, 12 Apr 2025 14:37:13 -0500
Message-Id: <20250412193713.105838-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add check for the return value of clk_enable() to catch
the potential error.

This is similar to the commit 8332e6670997
("spi: zynq-qspi: Add check for clk_enable()").

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
Fixes: 3f9c37a0c9a5 ("i2c: lpc2k: add driver")
---
 drivers/i2c/busses/i2c-lpc2k.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-lpc2k.c b/drivers/i2c/busses/i2c-lpc2k.c
index 6943a0de860a..ccd13c4fb83e 100644
--- a/drivers/i2c/busses/i2c-lpc2k.c
+++ b/drivers/i2c/busses/i2c-lpc2k.c
@@ -442,8 +442,13 @@ static int i2c_lpc2k_suspend(struct device *dev)
 static int i2c_lpc2k_resume(struct device *dev)
 {
 	struct lpc2k_i2c *i2c = dev_get_drvdata(dev);
+	int ret;
 
-	clk_enable(i2c->clk);
+	ret = clk_enable(i2c->clk);
+	if (ret) {
+		dev_err(dev, "failed to enable clock.\n");
+		return ret;
+	}
 	i2c_lpc2k_reset(i2c);
 
 	return 0;
-- 
2.34.1


