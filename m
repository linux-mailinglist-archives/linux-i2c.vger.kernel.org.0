Return-Path: <linux-i2c+bounces-284-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A42417F05BD
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 12:28:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C445F1C2087B
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 11:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC37FDF4C;
	Sun, 19 Nov 2023 11:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYKRM9O9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 421ABD4B;
	Sun, 19 Nov 2023 03:28:39 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9fa2714e828so160026466b.1;
        Sun, 19 Nov 2023 03:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700393318; x=1700998118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytoy8pfr5Vxi1e0JcRyR6n1bj9XY0g4pH3ARHnOackE=;
        b=hYKRM9O99tjQmagsfGQf4vdehfOpCpAO2wBU55AgRlIOpp2LpvtWb1V+0WobaLifcd
         JXkNdsaDYVM24jqmdcEUKEsJB3kPOTwNF1jaH1LURfpCHZDrdXXwlYUABXVCN7JVyYpz
         Fc0VWK1kqn+2c+IndaQ2JnkbcIQs0LAmoBDoiy+59ZQpsBiNDSAUr8KIDBO5lEwPQjIl
         sp435aaN9X4UOet/P8DXCeopdi4IXXjT+JAiU+CWHpflS247AJ8axMi+n6r78P5oS4tE
         iAllEzArJW8/zO1BIpnQZY+zgC4Tvle+XCU07vH3N0lgd81YuBR+9IJxxDGyKcqiN4Bi
         WTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700393318; x=1700998118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ytoy8pfr5Vxi1e0JcRyR6n1bj9XY0g4pH3ARHnOackE=;
        b=IahFmxLf6hmigT6k6+onztfhdm4ZQcDXLEheEbQB+mHWq9zRphDb5lgmlcMccSyiZj
         oh4dE432T94ms1VncpcmCQ+Nh3wgsNWGNMlcOSh8M3pouMwiwzTKD0CIO17iX1kE+UG8
         LcjlWT25wags4gepkVnf49vKRyeYDZhwNMevcbWx2S3EcVWBN18cyuvfHDoAWax9jMEA
         DbGAv639iM0rKdpxZ0oMzSaLNce20pWyCewxMTk03ZTcQ5p7WdL7QyM4JU1bHRBn3zg3
         X1BZ/j5Od+8b2cEh9/U7oo52qJfkkLKyqX69IDA48lZUVQ/ibQIEi0OFdw2f7E/is+CO
         v6BA==
X-Gm-Message-State: AOJu0YzTJ6VdMuHIhGQ/AW+QmRq/PtvWGj6qtxn1qiyk3q59szRYu4Z9
	nHYyTXSVdvKOC2Ongq3LK/Q=
X-Google-Smtp-Source: AGHT+IEnmNpCAkcRrOzwrSosgUk4OeD4St9qXEp+f9gvbMOTGQeLWy9ztO80popOTUrnH8s4A6uwug==
X-Received: by 2002:a17:906:520b:b0:9e6:38f2:8439 with SMTP id g11-20020a170906520b00b009e638f28439mr2984313ejm.60.1700393317363;
        Sun, 19 Nov 2023 03:28:37 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id k22-20020a1709063fd600b009f8af454d0dsm2420378ejj.112.2023.11.19.03.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 03:28:37 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 09/20] drivers/video/fbdev/via/via_i2c.c: remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 12:28:14 +0100
Message-ID: <20231119112826.5115-10-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231119112826.5115-1-hkallweit1@gmail.com>
References: <20231119112826.5115-1-hkallweit1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/video/fbdev/via/via_i2c.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/via/via_i2c.c b/drivers/video/fbdev/via/via_i2c.c
index c35e530e0..582502810 100644
--- a/drivers/video/fbdev/via/via_i2c.c
+++ b/drivers/video/fbdev/via/via_i2c.c
@@ -201,7 +201,6 @@ static int create_i2c_bus(struct i2c_adapter *adapter,
 	sprintf(adapter->name, "viafb i2c io_port idx 0x%02x",
 		adap_cfg->ioport_index);
 	adapter->owner = THIS_MODULE;
-	adapter->class = I2C_CLASS_DDC;
 	adapter->algo_data = algo;
 	if (pdev)
 		adapter->dev.parent = &pdev->dev;


