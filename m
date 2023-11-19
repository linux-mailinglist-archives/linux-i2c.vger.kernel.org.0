Return-Path: <linux-i2c+bounces-280-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1377F05B1
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 12:28:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE576280EF7
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 11:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944F6101E0;
	Sun, 19 Nov 2023 11:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QO/WlsLW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5E94D8;
	Sun, 19 Nov 2023 03:28:36 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9dbb3e0ff65so466607466b.1;
        Sun, 19 Nov 2023 03:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700393315; x=1700998115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTrCOgNzORg+kX6P4q5KSwq1S4WQ2CSsbEPwGEitBjk=;
        b=QO/WlsLWhy46Ra/Qs3atyPrxHzx9yQS7nfygUrCEBwk+lT+3B+d5U9XAs+V/wBia3t
         rxBYcW3hQFWwCQSMPu04omsUA4/+kE7WQawGmDwUrZ/hJYHQd4BnKIXuLRfo/jNonHAq
         Y/50eQEaflrsLajjO8u1ZbAmw9sQKIVsIZGxzESi7HoKsid9IJ1zt6nD3/jWWfwsRQhq
         Fy+jVtRIQ2X4XCpYASY0IutRmjNT93ga3kC4NMzwi13pctg0xrlehs9HekL/p5bfhDY5
         mK+O7xX0dbzp5cmeCYbHiIQuSLK1TnSwHDRIZ6hoAYYmzejgVoWR8LJBFFC7vw4IHEpy
         pHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700393315; x=1700998115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTrCOgNzORg+kX6P4q5KSwq1S4WQ2CSsbEPwGEitBjk=;
        b=oCeZWGF4kvtOUbdQDHflhlviDExR4fUGVqV+GXTHSWa+ScAUx5i87JkJkLFNRKJjRf
         1fPHzqaOUuMcn1XG1CqMCR5/XPznWZhLrpp3L4337+ZIdC2mmUC1NfsrfmMhWswst/oE
         Ri0sD6DKlQvlcuPcjLTiTE+R55zehmzEpPtpFdjbfullogTRocAjiZ+OpzSzEXS6YdX/
         dd7zGFlCjp00w179x8eqsIfoS9UsEbMs0z5ZlUTniTpo13bA7P1vAcTqLcvznutLHhvW
         8cdS+idHyChrg9tuf/hGbbtoFGQKVQmBe7jVgHvQ+VHxX7ZyV2IBi+fRQDMbuRTcXlvS
         qnaQ==
X-Gm-Message-State: AOJu0YxvXkf4+hfDp55CRGVxSinVkdg1oj3KuTYt/++AV68RRF4ti/Mi
	c75DA3wiNAcQPCl4/iVIbY0=
X-Google-Smtp-Source: AGHT+IGjalgverwn4S+5/ObyVC+zY2/IsZIJGBRuqRZihGBcwWfCh8FC+wiaF3tbr+HAjd7T9RyHjQ==
X-Received: by 2002:a17:906:1b:b0:9e2:af56:c380 with SMTP id 27-20020a170906001b00b009e2af56c380mr3594717eja.6.1700393314983;
        Sun, 19 Nov 2023 03:28:34 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id k22-20020a1709063fd600b009f8af454d0dsm2420378ejj.112.2023.11.19.03.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 03:28:34 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 06/20] drivers/video/fbdev/core/fb_ddc.c: remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 12:28:11 +0100
Message-ID: <20231119112826.5115-7-hkallweit1@gmail.com>
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
 drivers/video/fbdev/core/fb_ddc.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fb_ddc.c b/drivers/video/fbdev/core/fb_ddc.c
index 8bf5f2f54..e25143219 100644
--- a/drivers/video/fbdev/core/fb_ddc.c
+++ b/drivers/video/fbdev/core/fb_ddc.c
@@ -116,7 +116,6 @@ unsigned char *fb_ddc_read(struct i2c_adapter *adapter)
 	algo_data->setsda(algo_data->data, 1);
 	algo_data->setscl(algo_data->data, 1);
 
-	adapter->class |= I2C_CLASS_DDC;
 	return edid;
 }
 


