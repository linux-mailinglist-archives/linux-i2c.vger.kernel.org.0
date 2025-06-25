Return-Path: <linux-i2c+bounces-11581-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2366CAE8016
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 12:48:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0EA317B68FA
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 10:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC4A2DA76F;
	Wed, 25 Jun 2025 10:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mjg09dkU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073442D8797;
	Wed, 25 Jun 2025 10:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750848342; cv=none; b=WT1z0NgOdKo7veEucyq8EOPCjtXl+KaM02zpEx/KjwfvZaf5fMxqCTuQUZPxlQbq3lhjXwq6qUVctODM3ciaUTlsMc6z2G0MH24ZzKsiHNq7neRnfzszO9nXVGCD5XqLSBJK1njK9vMInF/OBZexCqU4L5Jf0mBn5JblB0udTtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750848342; c=relaxed/simple;
	bh=V8xp0D8kmKWK29lG22DuPIXHOw6Sz22cNNwUnsBCE4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IcCpum6orLkl8CZVJ5b16WdbReIzLCy0N58kTbspn4gnkPtJPgiq+0p1YCIVoKf7WxiTvlh+7u4b/YDYR8NR12GvKdVuYwgTHqkbK12241/k8l2ED2vDEy7z2GsEaxJAGwA8VLGfefaJQRulls6SUP5CRwT+HtqjsX2N3BNErZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mjg09dkU; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so513988f8f.0;
        Wed, 25 Jun 2025 03:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750848339; x=1751453139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1+O3yjApi+xYikVnWil1EjVi7Ln9/YcjOKcloQC134E=;
        b=Mjg09dkUcqDcJJk3ef6CENSIzggkLmyWDPodd5ViwPMN7LCqs1jZzM3zx0RnbB1aR3
         xyjwZDVFMnh6Ag0Vv3n1YMPNRqMfkcTV0+q8PE2wpdey9Q4qX1um1ulin/y6yfsQ5zdz
         UKi10l7/Zv0yhifIIKRnYmuY0GT/g41kAQE4rsxHa5aXP0V19rNZUKpkSxyKXvN6Hs/C
         Mp7r34u+ur4YRyRhyXVhKt6xZqgkRKdqv2rUzTHhrBR+ZCVsoAfr6ixz7bFcJJ5Jhfo1
         RQb5XQBuFmW94JIBXEuKjhO5/Dd+F4snM25r+ZC+MTzpXp7JJs5+WxHHoANiaYE0toYh
         SykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750848339; x=1751453139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1+O3yjApi+xYikVnWil1EjVi7Ln9/YcjOKcloQC134E=;
        b=JzoY3Jdz0Y5JDJmvqyc9dw+3aFhfVx6cpwCDI8pPUHyzQJdWCVMWsQGJ6bEqSf6HWY
         QTjKLf1CBT4avYBAH5LGi7rjPhakYtssyk0bbqZkNJc7RDBqCOS6sOAlYULPHVjgA3Kt
         PgBlZY6d+zVFPGQV6AlXXloU9MSzPZXeYTlF+eOX4WtB/wddbHuESQC75FE2wC0KM63K
         ZE/3RqYevKiBBtc5cVP2QNQSVX8FmEVwTDZi71zmAx9DRNIrCtCRTMZmAyCdDgcxDHfx
         E5oBKgKnTR2i8tXxr2l/ZBwSVDi8bWgcrX52OI7iQ672Mi1D48+e7bG/O2k1tgMV4uby
         DcmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxM1HVXJ1wbyzQzdffmi/0M+hR+3Q8QoXjGyTpK4Mfk2d/fIz1zLi/DEVGGR/1hd+nNUs4f8kH1n1t@vger.kernel.org, AJvYcCVONBWE15sG0rCzQvejwyUZh4eongudRaDzH9dbREO7+b8alD4I69eMCuhbwc2EZvk7clZIONUDOvA6@vger.kernel.org, AJvYcCW5la+KTql31JPP013HHfCez+EDkU92Dnt8hPx1Yk61nvWiyDlA/8QXBZDRMFPVp+08DJfHUSPe+AKwmWLA@vger.kernel.org
X-Gm-Message-State: AOJu0YzUiMQRuTSqnQxdxtpPHew4csFc1AsN2rFP7j+s2SmcYBokwZ1Z
	hc7AwAh5kQkODsmk3HfUcKtsPhoq3DBd9tqufDoVQobxSUTw4/eWF7X0
X-Gm-Gg: ASbGncszUKKUlD6bjDTfNYkeYyihj0uxEulaYW0FDWAgEYGtIlbyYAl6X4C/pcdjDnU
	V6NcSeZkhe6yQhr0blumbOvnb8In0RngNWbpaCI960vNqm5BHias4lx4S+l9uCSkW/wGAdcUfBF
	exD2jeNFfymZUo6VTHYrsvOQgao2UdFhdRIizX+3MCPC2FoFn/JemX7iQxyw6GaqkCMhKrREd3v
	ahhpdnJPGAgIIwy3aJZAu0ZTTRDNqNqA2XQt3dTebmRwveQZzh+q6m7vXiya+VbTMMPSFAnqkUV
	3d1NSCeJDtDmvjmnZt2EnFwnT1vYXXzfVYeoO2oyBuS+70LbKsfYzlQJ78QuBzkNP5CexPjgzVT
	cvK8IAAvLsUOUCtgPf0Z5
X-Google-Smtp-Source: AGHT+IE56Q1ijiaCbt0rxwJcNw2j/GjhQXTQ8ujYjI/HtYTTKoBC84E+v1OFczfQI2x+Oe2l/E2BgQ==
X-Received: by 2002:a05:6000:240c:b0:3a5:2b1e:c49b with SMTP id ffacd0b85a97d-3a6e721c7famr6031357f8f.29.1750848338785;
        Wed, 25 Jun 2025 03:45:38 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c47e:d783:f875:2c7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c1easm16036175e9.3.2025.06.25.03.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:45:37 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 4/5] i2c: riic: Move generic compatible string to end of array
Date: Wed, 25 Jun 2025 11:45:25 +0100
Message-ID: <20250625104526.101004-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625104526.101004-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250625104526.101004-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reorder the entry in `riic_i2c_dt_ids` to place the generic compatible
string `renesas,riic-rz` at the end of the array, following the
convention used in other Renesas drivers.

Also, drop the unnecessary comma after the sentinel entry, as it is
not needed.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com> # on RZ/A1
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
v3->v4:
- No changes.

v2->v3:
- No changes.

v1->v2:
- Initialized the members of `riic_of_data` in the order they are
  declared in the struct.
- Added Reviewed-by and Tested-by tags.
---
 drivers/i2c/busses/i2c-riic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index ecd1c78eecfd..d0b975e45595 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -693,10 +693,10 @@ static const struct dev_pm_ops riic_i2c_pm_ops = {
 };
 
 static const struct of_device_id riic_i2c_dt_ids[] = {
-	{ .compatible = "renesas,riic-rz", .data = &riic_rz_a_info },
 	{ .compatible = "renesas,riic-r7s72100", .data =  &riic_rz_a1h_info, },
 	{ .compatible = "renesas,riic-r9a09g057", .data = &riic_rz_v2h_info },
-	{ /* Sentinel */ },
+	{ .compatible = "renesas,riic-rz", .data = &riic_rz_a_info },
+	{ /* Sentinel */ }
 };
 
 static struct platform_driver riic_i2c_driver = {
-- 
2.49.0


