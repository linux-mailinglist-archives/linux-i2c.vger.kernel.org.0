Return-Path: <linux-i2c+bounces-3771-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4F18FA904
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 06:03:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABD2C1C2358E
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 04:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12D5F140370;
	Tue,  4 Jun 2024 04:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GydqNIam"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729C413F425;
	Tue,  4 Jun 2024 04:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717473771; cv=none; b=X9ilSJElgIEr3EmG38SJE1R141FK5o/QTeaP3wTEmRk37cgRmi+JpGIWPGpSfUE6nS30Oa8juMao63K6Q07oxU8DBQLzyfxr/IKOeNCKWRbTP2T1v+nwmIw/IbbYcnIxhZG2OJCc+lP8ChuZDZva5PYqic9JRw6/LiWSyP10LVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717473771; c=relaxed/simple;
	bh=V4Bc20JgEh03G5zH/lwBSrpsAMsdSdWhIz1CkRvMky0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uWbAk3msg0HDM2RqHfl0E2lTUcJWt1TxAVVH1cLnIgC/5r5G0PQ6S30Ad8ll2O41asBboVXj8lBZ+cmbjP+ttJzUYv+W3lT/WX57HHTvu47UqDTtgjj2JN0r9j4hecM4sKfvoprMgbBMkVfAgTKDoHRxO7SMciIme4DXlAkmUdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GydqNIam; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2c1a5913777so4154554a91.2;
        Mon, 03 Jun 2024 21:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717473769; x=1718078569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xb4a23ym03gUQRSCJvpHr+ALZvR2eodvP60RsNgR2A8=;
        b=GydqNIamsktp09/SHTTxXbOxeoPwv2oxj56hJ54sjHEaFbjptyLjmoL2uV/R8iXppN
         gtXHVvwdJ6yVQzYtBSTbcFLp7CqkpPxLXbJIMgMwey/pnnwPfYa6Y0OrWJxVVorkW7vg
         8UEnt0dbTEOv1XJ7bNINxY1pXN2Jr+QACJIu5jVAL4MUm+ciZfx9/5lB7+TIYdPgz8iN
         nLTMdhd/T7Ie8SxGPWWBNLOO6JiqBrE9u2IcozZHMti6pAtBla4JVWQyJDdHm4umBtgy
         orqixFz7M6lNU/p05J2tua4ZrNBatlQR90JS4zxki9JkqB/9vC+MOMTgzXEMFFBYfqRs
         MARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717473769; x=1718078569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xb4a23ym03gUQRSCJvpHr+ALZvR2eodvP60RsNgR2A8=;
        b=MTjTrw99nS7UJTAk6ccsfHZf3iuLlebVyQrtki6Di27PStjDQfqO/yWTDxjI1Uh/uo
         Pcl1n+FX/Img17Ex61pYQHgCczUyfDrWhT22Zkt67jOyHH6DbZDX41GzGysgPVSY4HTY
         mKzvbjwJWFceF+YdnE2S+UDRiVjtrtdxpGTt1+AzU8DoBa075ptOWhTLXgUn6hihc+uE
         4/tvFIrNVqyE/ZWAG8bbDRUpbBBJe2MIxNIHkbTa1IJiJK232zHjbkB6FvV0iap3xnm/
         CJ0us/7REzOowFM7xppiHTrDeD3ExMi5+XvyQnOEKLEzPY9TLRd2u9sLdsaoouqX4xzC
         9lfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDNdw8ygE9RkPwCOj2fQrRY0XMsfyO1hTldzlXHb5ZqUgi7XYh28lDOsONgMHI8urq66QOao0Vzvj6V6TVCfNWDVHw2Y4I9qPCqL8Nmj43pcZEYH2TwbCWqK9izUcXs1N7uWu2D3yfaw==
X-Gm-Message-State: AOJu0YycrWgYarfs2/onPe7p5+Y2R2FL+SxpFS92zYv8D3Yu8Ed0vt4s
	ME9G3ce1Z9iIQzwDkIxFnug+w12TpiUWsOmIOB/ItRDERm3X4RW2qb6fDw==
X-Google-Smtp-Source: AGHT+IHUQeDx0P2ypyP9sx5ZF4dBtOlf0fsr3Qcagoq9OPB0uUsnA0kDIv2hsd/8gLcfrwFR08a+0w==
X-Received: by 2002:a17:90b:4b4b:b0:2c1:948b:6f2c with SMTP id 98e67ed59e1d1-2c1dc5cce0bmr9313439a91.39.1717473769280;
        Mon, 03 Jun 2024 21:02:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1c284250asm7528638a91.50.2024.06.03.21.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 21:02:48 -0700 (PDT)
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
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v4 5/6] i2c: smbus: Support DDR5 SPD EEPROMs
Date: Mon,  3 Jun 2024 21:02:36 -0700
Message-Id: <20240604040237.1064024-6-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240604040237.1064024-1-linux@roeck-us.net>
References: <20240604040237.1064024-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Detect DDR5 memory and instantiate the SPD5118 driver automatically.

Suggested-by: Thomas Weißschuh <linux@weissschuh.net>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v5: New patch

 drivers/i2c/i2c-smbus.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
index 97f338b123b1..8a0dab835761 100644
--- a/drivers/i2c/i2c-smbus.c
+++ b/drivers/i2c/i2c-smbus.c
@@ -382,6 +382,10 @@ void i2c_register_spd(struct i2c_adapter *adap)
 	case 0x1E:	/* LPDDR4 */
 		name = "ee1004";
 		break;
+	case 0x22:	/* DDR5 */
+	case 0x23:	/* LPDDR5 */
+		name = "spd5118";
+		break;
 	default:
 		dev_info(&adap->dev,
 			 "Memory type 0x%02x not supported yet, not instantiating SPD\n",
-- 
2.39.2


