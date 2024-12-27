Return-Path: <linux-i2c+bounces-8756-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4559FD3F8
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 12:52:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F1DD161410
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 11:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C9111F37C4;
	Fri, 27 Dec 2024 11:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUMqhjTV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2CD1F238A;
	Fri, 27 Dec 2024 11:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735300340; cv=none; b=VAWLhNfNR+1BBvWpwzjCp7aepHPejucorekMM67UbM8LssQV0faW4/J7Wa7e1W2t9p9aPM4u9KFu5K/zMgGCjJJOqTA1zMkke0UUVksppfQ3fhIldLcyYZ7BEW29VPxI4X0HVe92Ena6X/gjFBL8UF6Q6z7bgjuZtii87jJxm7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735300340; c=relaxed/simple;
	bh=44Vs6/FM4VZrYo/0laOqRhsRYTez9Z5iEd8n1v/03Is=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OdrvSupHPnpcTdB0232IYXo2Y3+zu85X20S6LIEya3fOfVbxFOBRpQXYu3+4t87C+EyPra9kvEWbija3nXCXWSRw0DAcBmrTT/IG2XrcF2zICM+r/oGPNyHIHkWMOc0WtZyqY3zC6u7voQrs6eN4/0MhxxIwqr68Njzs10Fed5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VUMqhjTV; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-216634dd574so59061925ad.2;
        Fri, 27 Dec 2024 03:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735300338; x=1735905138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfAmnIKpqRHJaVZJ7etBHUJeCgioZCtC9Hj99Qd9EOQ=;
        b=VUMqhjTVenFGPz+1Mri1riPctbC+mQoAN3OADyDGte70mv7jPVivV7p02R712ZEmYP
         IVO1e544/snaELj49MBpCLnuD+7+uOgj6fXI2bpyzHHBZQfUz6cO0kLua46nGRfBqj1u
         WSHON2o0yRunDgGRQuLP6B9Qr19tGbw+A1wUBTPhmlNQV6MvGuxp4Y769Z27IJcCm64S
         2sF4mst+u0dy/mUKhSGoaKmSAvQY4reCk41JowqjFFqlpwxsBffb0aj8Eo1we18vbliJ
         +0SuXzUMAMxddiEirLH9/H4M6cRTAS7WTEEUUUQO2v6HRW+y2PwfR3Y9AXBRpnNr5aWN
         vFtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735300338; x=1735905138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tfAmnIKpqRHJaVZJ7etBHUJeCgioZCtC9Hj99Qd9EOQ=;
        b=X2wUadA27+V01ANHLZPiN8q5p6UxZnP5CRORQcUUHizygR+BVZ5NVQZidXFPWY56Jo
         0FuyUIkst7Z/m4BmStsOlOEtF2DHgdnMltUEnrchios/3S6UbGEMjiz2uxPdP1XGTpO3
         t5ZK1M+5QGPyANCh0BiSQb4JKvjqFakhK3fFF7flpUEviulOCGfnCKzW8X+W6RUsJAQH
         9ZjZtmPTGe00cvKqDqAjSpsGokLwsEf6J0u+9BSg258jURbMb/hUX0ta8PsmvOSfq7qp
         lGMZi8DtQD1hYlUGnVIV2G/+bs1hUgiIENpPlxdp6962MbbUJu3QJ0NNwmtHOBWyi6ys
         kxSQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0P10oU1nSKmohlAwvGyWN/YYOFoB0HCG9gh1JvMMb3ziKkti/0aWo+ogTw12DfwjsYeZDbuuElBEGWcwb@vger.kernel.org, AJvYcCWHGSlWxBLNwPL6xceCSTGcRGAMflp4jNvbmH0/2bKzh2vixlJP1arrBMZzHjvnj1d4rOLtdkkBGBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn2Fn0MkVa52+RPUQj4XUtUVbJ61kl/76X26iI92yTjuhx9V2x
	DqtJYh17RqnUKTX54Yj7/soHMCr++0X1V6KIHATuHQATVCYTlelQ
X-Gm-Gg: ASbGnctMN2nIoRkS6PyZfmo8akfNBDdQOPSSsNeaM5zSlJBiYF3BNmEDKAlGflC05yN
	l+2ywbAG5jEe0py3AAFpH66AJCNJoUP1rTRM5nmNkienjgfjY6a9UJyqFIPI72g+1lxxabxUfv8
	vLiVKjU3r39CIFIJ44hBZmvOYW0xRpVeNSyIzl/wBVXcILI82AzkE6/s80Xe6OQxeNsyypcbKyc
	lHk+m15Q93xVTNpQKYmVkXnVMH0/4mGKdWlSKmaE1mV+YC0BBFwCXIIX1SeUUGhAcgoglm9xUY+
	mw6oZek=
X-Google-Smtp-Source: AGHT+IGqzvw5ipqPXXi1vkrtY3GowQtnwgigMSDq5w2y1Vm5ZYnqM+rp2/eJ2CoTPhLElPzEM3xmng==
X-Received: by 2002:a05:6a21:78a8:b0:1e1:f281:8cfd with SMTP id adf61e73a8af0-1e5e04643a3mr42481329637.15.1735300338068;
        Fri, 27 Dec 2024 03:52:18 -0800 (PST)
Received: from prasmi.. ([2401:4900:1c07:9010:ac08:3a91:844a:cc65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbcbbsm14363990b3a.97.2024.12.27.03.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 03:52:17 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 4/8] i2c: riic: Use GENMASK() macro for bitmask definitions
Date: Fri, 27 Dec 2024 11:51:50 +0000
Message-ID: <20241227115154.56154-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227115154.56154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241227115154.56154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Replace raw bitmask values with the `GENMASK()` macro in the `i2c-riic`
driver to improve readability and maintain consistency.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
v2->v3
- Collected RB and tested tags

v1->v2
- Collected RB tag from Geert
---
 drivers/i2c/busses/i2c-riic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 954e066d61a8..ddae4b74a86b 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -55,7 +55,7 @@
 #define ICCR2_RS	BIT(2)
 #define ICCR2_ST	BIT(1)
 
-#define ICMR1_CKS_MASK	0x70
+#define ICMR1_CKS_MASK	GENMASK(6, 4)
 #define ICMR1_BCWP	BIT(3)
 #define ICMR1_CKS(_x)	((((_x) << 4) & ICMR1_CKS_MASK) | ICMR1_BCWP)
 
@@ -73,7 +73,7 @@
 
 #define ICSR2_NACKF	BIT(4)
 
-#define ICBR_RESERVED	0xe0 /* Should be 1 on writes */
+#define ICBR_RESERVED	GENMASK(7, 5) /* Should be 1 on writes */
 
 #define RIIC_INIT_MSG	-1
 
-- 
2.43.0


