Return-Path: <linux-i2c+bounces-3767-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 429AC8FA8F4
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 06:03:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D18ADB2620D
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 04:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D48213DB96;
	Tue,  4 Jun 2024 04:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hwsqYWJR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8694177A1E;
	Tue,  4 Jun 2024 04:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717473766; cv=none; b=mu3r7Z79WcfYgzH6WF63wjwoMW82lRIH2GlE9TZyRrzNTy3qd45x7u8bvikdk8pXTUZeMFvT+36tJmaOu3ZzaQQCsyF59fUyzMXl/dAF7CMCaEa/WkH/EtPAV5RZ1mBMB/7yzaQaX7KvBmdxQqPagBcDTfvwEB5T8kTrDzXdx1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717473766; c=relaxed/simple;
	bh=rtJFyYapRC85QY1SVBCDL3Yw6aBiggbxdK4cxx7DI50=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nZKqFEcxBdEwww1mrpNjbNdjbe6l+EzSvOo24X1F7E35qYj988bh/X+sBa9vCo5ly0s7aVOzqKmzambcdIMFM47Fc6EgII5LwM9t9JPHEURel+VcrRyanl58HISV3bfbUrH06l+04RVAE7UiInf1VKNN27GVVKOeTkzEa09YX/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hwsqYWJR; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-25082dbeb44so342117fac.3;
        Mon, 03 Jun 2024 21:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717473763; x=1718078563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4OOepMOqN3xULXLyB8tcKBBYcxy3ibGpXyjansLnUeU=;
        b=hwsqYWJRfY2siFBNYujHkp1PGZ33hZ59CbEiNTnpDus1KXLwzivmY0aGkwS0WOiiqV
         sCaiwApXpn6SLFUSzw2eonGJP4Wg27iFHnaTdYSAUZEdVnCU1/IVZeFLwQ2RuZ7ZpHYI
         bOD/DGdvTiAReNzCE5KgvVLgPHDXBq2vbEOtA4ziSFiBqJnPrczd6aDabC1JMdIhZxSo
         PXpmvbFQguQnTmh1PP6rYYTkdLeSgR+Nln183hXqpr3S2jOfClXMjBtXX8/7kP6CMlii
         hfqwurC0xVh7VYkgtz6fAVrOoqVDDL4Rx/4kH3bxM7zDt33+Xy0JtjOirwiFQ7LvV77U
         QiJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717473763; x=1718078563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4OOepMOqN3xULXLyB8tcKBBYcxy3ibGpXyjansLnUeU=;
        b=caUIYxY6FiCVF7NpaqBCG6VXdbz7giCwHI26i9pqekFTJNWV4PtaKfIHbiOw3ZrKS2
         JY+zNRPvE3YIUmKMaNOPuMdvo4o63x7LvlvbpZGaLDfc8Y4BLvcZzCSSwlbqVlCGRvec
         2dcVFLEug1DR1TxSQsJhFkDr91aIT35Eo7kQEg1FAdSizSUYvV1ZXDtrqwRXLcTZoD+v
         uQiAJgZmM5dU8bKeoG4cRkRnn/HoV8zuGCRcplmtQ0zunuSIY8woqMiVb4pnInTejbmk
         5ZpCF2fcPYRI8ItNk00UpOkau8jzV6Q1dwyMWydSXeHDyFIMjPYD1YIK1+znBSnGZFsw
         Glsw==
X-Forwarded-Encrypted: i=1; AJvYcCUviW92zfgd0xKXeOK0GJtQkG/wgp9Tcic45KkT7SNAWTxcsJh36I07jLdRNNfY7Aaede2rmmcD+MgyKg+tvcTqwpiC/HE8eLgml6VNzklkUPvDdvT7/FDmpo/e3wzzlgRcJsSCPDKjAg==
X-Gm-Message-State: AOJu0YxZ836WzN4J4KpMIaShOZQBRWQzKuZfTCaId1/6kQoPelikd8H3
	ur5X92s6vWzGqdGyO2cxkaWjl/6qGqEIQcNnJKdqggLo6J1n0x7OSQSXnQ==
X-Google-Smtp-Source: AGHT+IFsvsXv7RhqNBGWUxxUjNJ17Tmnj+Wd4561BKzAsQV5Qdd/oKIk+prwsY7MzHLpTXmDFpR1Rg==
X-Received: by 2002:a05:6870:9214:b0:250:725f:ed50 with SMTP id 586e51a60fabf-2508bab5cd6mr12770877fac.17.1717473762970;
        Mon, 03 Jun 2024 21:02:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6c355aeaae3sm6171598a12.43.2024.06.03.21.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 21:02:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Ren=C3=A9=20Rebe?= <rene@exactcode.de>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Armin Wolf <W_Armin@gmx.de>,
	Stephen Horvath <s.horvath@outlook.com.au>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/6] dt-bindings: trivial-devices: Add jedec,spd5118
Date: Mon,  3 Jun 2024 21:02:32 -0700
Message-Id: <20240604040237.1064024-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240604040237.1064024-1-linux@roeck-us.net>
References: <20240604040237.1064024-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for the SPD hub present in DDR5 modules.
(https://www.jedec.org/standards-documents/docs/jesd300-5b01).

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v4: Add Krzysztof's Acked-by:

v3: Drop explicit bindings file; add binding to trivial devices
    instead


 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 0a419453d183..1d19e67de2a1 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -168,6 +168,8 @@ properties:
           - isil,isl69269
             # Intersil ISL76682 Ambient Light Sensor
           - isil,isl76682
+            # JEDEC JESD300 (SPD5118) Hub and Serial Presence Detect
+          - jedec,spd5118
             # Linear Technology LTC2488
           - lineartechnology,ltc2488
             # 5 Bit Programmable, Pulse-Width Modulator
-- 
2.39.2


