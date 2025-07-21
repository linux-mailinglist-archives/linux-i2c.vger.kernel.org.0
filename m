Return-Path: <linux-i2c+bounces-11988-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBFBB0CA4B
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Jul 2025 20:08:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC2261AA82A8
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Jul 2025 18:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA9ED2E424A;
	Mon, 21 Jul 2025 18:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FkJT29d2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15F92E3B1A;
	Mon, 21 Jul 2025 18:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753121259; cv=none; b=d3T5Qu6J3UgsQ1y1yWjv1a6PcK5M6WgU6QmiBeDlSuEwOESStlMNQyt0FQRxnooDyPMRPUx+0BbByju664DCNtIj6hmS+ouB8YYnDqw5wk1LVTK6BMqe+7wHYDEOGLpuYPrjY+F/6fuOsTTgHHhJBEoTMKWeVpPp1dzRBIGS2L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753121259; c=relaxed/simple;
	bh=XuqdLOxXDPO9JQSHjDKhnVmvk5hC7cXCT51JI5Zeh+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oyqjrCx5t17Ai/moUXsPJwzaTss5zX8YQBw88+GnKfJuT9Q7o3VBiXl8Rsiwwsozn+MZRYgDJw5QOSJe5im/ayDLyS2rvWXRz9RaA9qZqjKgSGmB5j7IgH6rH5lNhh5q57GiIbkzM9AseDkFMdCetU844a6/lbXP1dFvLTux8y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FkJT29d2; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4555f89b236so46517715e9.1;
        Mon, 21 Jul 2025 11:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753121255; x=1753726055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Flp2kuB43upoDmZKHtPKy1TYQrSu+LhhKaLm1sYr4pw=;
        b=FkJT29d2trZDS7EIdy0grU0vj5MaaImtN29CovUEUqf5dkx9Hp21R3ouFdwK0bO4pi
         chjQJqR9zUeGzfM/hyGB6Gwot4DkcdITxRwFiS8O0OpEVkrjydYp0hE2NyKtRHqBr/y3
         gXMEU0SFhZs2JOICrRgA5p3rBSkf1hqwaSalAFM4EwNaO7JG/iU4LjUGVSOQ0ClRIHIz
         9KoVjucbDHymX+8epU3h0W9Q3sUdWMljD6QgNd0qUcPgTD8B102xhSDsuxPpLI1x1iPb
         8cia5AbOxtktlEayQ6P5y7fgjhzz+1Fhlrnyy/ekAnM1GB8tDmLBqjEvUphln7fBQRMo
         QpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753121255; x=1753726055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Flp2kuB43upoDmZKHtPKy1TYQrSu+LhhKaLm1sYr4pw=;
        b=C2mRKvvbdLaAc6hzplx7QbtX3aGN+bH8gylej3LvN36KdXcXNK33luN4M3G2isb5jJ
         W6hrUPC31XBNILVz05NIyKTsdhYGvKf0TnnFyhGjAIeZliVrnig9O3Wl0t2o8BZoW77I
         h+EWTz33nr8A1qO7og0SK4yqIoRVhsTrxWqL2W66icdYYQjCgpnOs7fzK8n/D93l49k2
         av1h+W2KOCgIJSrca+cJZ4+gvpdHaCIA738LD5qKphqxFp/L4JjMYsDZI2kfy8zq6u3O
         tBDKWPTlMY4zjYtqUc71VXffcwlF/R09Z29A73ybKCXH11R9LMvzQLARxWa4ChXIo5IB
         UKfw==
X-Forwarded-Encrypted: i=1; AJvYcCURoXzCxxxiXW9pJU/q5FZt6WOXMcQ8yR3fOKMdBnFbDTZNX9rQyB98RA1P9JAeaeCqeGhu7Rd9lNUzLKY2@vger.kernel.org, AJvYcCUvJwDMGd2zARoQ3rI2ZI6FY0wk8lAsAkwxrI9B5qT6hnJPwMfqnKHYjjvdvAFHSqNTM25g3tN+Boje@vger.kernel.org, AJvYcCXiavR4dgiKoas1JwRg8Gb2O7DXggSwT0hiPAcAlbV1uYxs+fyI+POTruYjjv6qLybhCfHVzCmkahKK@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp0LXgaQcankJ/YZ5IaTP13cT/hX/AqVbgRj2esix1CXLF2J2f
	wGKdWsKWgrwEMqFsEceq9jGOifbXO7+KVbY9LMjw2N1wH8TKQIGImSlu
X-Gm-Gg: ASbGnctLx2lVB+upWbVagXPNtWacY0QMcWXZwxvzWNvQHDLc6GPS+tfxWATZgNu4IzY
	9278ijZFq9ugxoVwG0fWdcIDjLVNlXiQY8ZUeSYYZLeMhVF+YbIK2pHUKRrMnjQD/nv98xHFCBQ
	LVBcWmixk8G0nCY+zShqrogjOtMRcitqaHexi3D8SNNBsg8rcwSaIWLSYw5EUndgmLyTip2Qrlj
	W5LqJ7pBktX6clrjpfs4rtft0BA4YRUBBO3w6t3bMKBltJxT7hetMoRBmO5IuPazLArIGj95QUk
	WPLtuuc1uhXseKDPngvkMzvwh4MYlkZCwz+1br/ov+HfsWuI8V557MXIgt5R2MPT3HK5Es5/B/T
	wcUyq+aC0AgjLdefFOheF45g=
X-Google-Smtp-Source: AGHT+IHMDl1HdTYdt7dKUNczFNSMkURtUfgoOq1Dch3s+qbqN05Wekq5XqXHAV+JIJaRsdTcIptzmA==
X-Received: by 2002:a05:6000:26c9:b0:3b4:9dbd:eee9 with SMTP id ffacd0b85a97d-3b60e510026mr17022246f8f.36.1753121254931;
        Mon, 21 Jul 2025 11:07:34 -0700 (PDT)
Received: from Ansuel-XPS24 ([109.52.136.49])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b61ca25443sm11183370f8f.9.2025.07.21.11.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 11:07:34 -0700 (PDT)
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
Subject: [PATCH v2 5/5] i2c: mt7621: make device reset optional
Date: Mon, 21 Jul 2025 20:05:56 +0200
Message-ID: <20250721180710.2116-6-ansuelsmth@gmail.com>
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


