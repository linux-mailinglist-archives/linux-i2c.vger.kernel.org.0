Return-Path: <linux-i2c+bounces-11044-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE800ABC734
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 20:27:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0402D1B61EE5
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 18:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B577B286D65;
	Mon, 19 May 2025 18:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jkrp+0i5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DD71DE4E5
	for <linux-i2c@vger.kernel.org>; Mon, 19 May 2025 18:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747679239; cv=none; b=U0ZLdt0b/D/S8S/rk/U5qZ3NFrpBVsT1XaU1D+4KtquASuGdH5HkHBOWdmlazsE6MUyx5C4vGpRGbX7n0mbkk8F7q/6Xyuo8O++lQesRoUR1h1S9sVzLwDFeh/g2sJ0BwgawBUL2R5z7Tr0Ud7obCLTfdXn/liv+Geiv7RcOBI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747679239; c=relaxed/simple;
	bh=Ui6m5E+ZmEoFyBbRKnq9Sska4taJPJfwm8Q7IJNMy6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JOsQ7q9+gFenYxlizx9LVHlkxgPcESNOm9mGQKWZDbMNOnIqbkJposRVlX7NHPMkC3jYHJS2kz9M/ggWXkDDkMaXZzcEymPb+hclSPQvTlSGNsw6cm3hYNhV/wOV6HRs2J4g0kGUPoHpW0fhEolMiEJSMfEjednXVZ1mHZ8+EfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jkrp+0i5; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso6102213b3a.2
        for <linux-i2c@vger.kernel.org>; Mon, 19 May 2025 11:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747679237; x=1748284037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=94HwSgL1FSeTYJRRTW3aU6iPF/Xb8afa7uWaTem6x54=;
        b=Jkrp+0i5rQk0hxlmvLxlcb+TFKCUpT1egg9/aLFBt+I0trjMEctNIs6dPwXdgKtLIj
         rFeFGOtmyh8G7KBkGc2ynj406Wgq7pBGP2g2nKMTfTy31cvzMscKVEKcTEMqwMxCCsHM
         ifintAqiog303k4Zdm8oj6TVZr75rEP+qONJQuhplqHYG3xO/D/mkMhOxQmXvV7UK+o5
         CUn3MN1OK+jEtuvuiTkIO8yJqF21RYOZR0ZAJ0redPuIwxo4HY3G24zTD0htR2gU6irL
         J0RdMt7RnRN4NJqUYVYd7bx1+JJbzC3YsF7BlyEMwN8pjfgUPyqP4yVVIKzhqgH5ivgZ
         07QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747679237; x=1748284037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=94HwSgL1FSeTYJRRTW3aU6iPF/Xb8afa7uWaTem6x54=;
        b=Atf3iaFaPWrWaGrO+D+Q69z7blxg8u5VHQBsSv/rJuOT1rtPWYIJ9Oig9W3zGsuN+s
         loIdNYGjPp9BT0wPygMG2XFZV+WqUsc12Vy9t2FropYsJRorfkEKndwh5RSbUfpiwZ0z
         LM75XfrqswwOCkKvlaEgh4ryx3N0VV+/HuNN90PEddW9eVoFK1lcRArlK6a/15mh7C0m
         UfavSOcXSO7iIV2D6amTxVsY0N/IoA1+bSasNJAJE0SX39j5H9iSz+ZRtvL53Uf12FMU
         OZD/CMvAV4qk81sWWFbLb05bTvGZtmZkhp3zTvJRJjWD+yv1ZWQEtlEKLpu3C8GFF8BX
         sLbw==
X-Gm-Message-State: AOJu0YwGMXQdjCMQ89L1QiZdBZHxLSJFfQ9BO9BAsjHFVnR1+iX3wnbg
	g6QVU6umjkSXh1IRptrusQIMpdrqM1SFg+sxEDqf0XDXtluOIs08NJq0zvM4h/QH
X-Gm-Gg: ASbGncvgHQWPFx0ojAObFe3OaV4G8cT7DpIKsYnzUAg53XvdqH0mdlIKEDupGwHbuoX
	jLtdmTD0QAU8gdD0WaMl9kn/6jPnfJycWxHq7lxDbElabVav4fxVMV7WkOD0fUoinizRpnYQm0s
	3OwogCl+XgcPtsr84cwtuAKfJe6cmasL2XDd55G6H/OAM13d8XzjjKI8u9pZuMAGXi2o51spQo9
	8acqFGDp+PpPiuvw9vFmvseLwyPbweHxe8vwlFxTqQznPTvW3HvHTSDojA/247meKu/WKf5rU/4
	jIJyZNdlx7YpiDdYJSbECCFoV/IjshaQ1758iEYWd+Irz3aCjaHwCSBSVVY986s5vhG+K+dYiab
	B
X-Google-Smtp-Source: AGHT+IEuMZJQIFFobCSDEri4DjwyGJe/IMNyi+i9Etol3nzfKtvgkB8IwPurG+sO9lCnj2oD+nWJ/g==
X-Received: by 2002:a05:6a00:c86:b0:740:9e87:9625 with SMTP id d2e1a72fcca58-742acc8ff71mr19130641b3a.4.1747679236955;
        Mon, 19 May 2025 11:27:16 -0700 (PDT)
Received: from localhost.localdomain ([223.181.108.253])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96e20fbsm6525746b3a.35.2025.05.19.11.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 11:27:16 -0700 (PDT)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: wsa+renesas@sang-engineering.com,
	I Viswanath <viswanathiyyappan@gmail.com>
Subject: [PATCH v2] i2c: Clarify behavior of I2C_M_RD flag
Date: Tue, 20 May 2025 05:26:57 +0530
Message-ID: <20250519235657.7404-1-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the description of I2C_M_RD to clarify that not setting it
signals a write transaction

Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
---
 include/uapi/linux/i2c.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/i2c.h b/include/uapi/linux/i2c.h
index aa751389de07..29b149ca4b70 100644
--- a/include/uapi/linux/i2c.h
+++ b/include/uapi/linux/i2c.h
@@ -21,7 +21,8 @@
  *
  * @flags:
  *   Supported by all adapters:
- *   %I2C_M_RD: read data (from slave to master). Guaranteed to be 0x0001!
+ *   %I2C_M_RD: read data (from slave to master). Guaranteed to be 0x0001! If
+ *   not set, the transaction is interpreted as write.
  *
  *   Optional:
  *   %I2C_M_DMA_SAFE: the buffer of this message is DMA safe. Makes sense only
-- 
2.49.0


