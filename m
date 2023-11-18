Return-Path: <linux-i2c+bounces-226-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F20167F0178
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 18:42:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17F851C208BB
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 17:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F4085199C9;
	Sat, 18 Nov 2023 17:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XB/a1LQ0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 676F0D62;
	Sat, 18 Nov 2023 09:42:37 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4084de32db5so5558845e9.0;
        Sat, 18 Nov 2023 09:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700329356; x=1700934156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lj6lXffwhPaiA+tttg2gWfCsavHU7fIAFEm3bWLvYqY=;
        b=XB/a1LQ0+iWYpch2WEH4ohtCzIEuJPNRtbR2z7aUuaEeH+AU1KzpkIyVy1b5833GBk
         BD+utb5aOn1/A/5yl39ka2oKBjbk0XeN5JW24ZMEf6OTStpx19TsthZWE5G0Q2kMOEgE
         7SWKUHb8dvcQvdaNmbrDB1fBDsMXNYXZhPJUHhX7dIXXbGH5Y/edlul1iMCA9w2tB3+T
         KiJx8ZSxOcgmos4cWJyo4M37We8s4Z6OJEeC1ONgvWAOndsheGHJO98XXP2VKi2gORw8
         zcMd8FqUNYXj0meU34O4csLufQqkJuVH0S0iBwEb9saswaL+SLcyVf/6/SHRYFhwSUAN
         vaCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700329356; x=1700934156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lj6lXffwhPaiA+tttg2gWfCsavHU7fIAFEm3bWLvYqY=;
        b=ACTSVzlmPb1RvzyBdmn0NV7kKbAQ6guZmrN4SwEBYLXXDeKRi3xK+H7Y3ifnegFtxW
         1MSKVhHgCDS3HVj1Pp/dEqY3owSl1As8o7uNH8y2T+2XKPuaatYiWzNZQ7mRcjtfJo6K
         hOdOuOBq1CEUhOgXg5q05eECZlZc81FOCs5Wh3zDUofQLFc7C425A7QTFQdPnUIOi3oc
         Pm5QRMl135a/EgVm8VcfqBbtiAFpAED94al0+sZ/Lg9Rn9U0ZoPiWuPtQs6p0KUr073+
         YE6L4mKkY+1Pa6C8CrEpdm8TlWKK2p+nPYEa+30LOYMiErwANA3ofmbuZLNQ4Mi7Q3Zu
         b1qA==
X-Gm-Message-State: AOJu0YxQ9v3qX3SVKmH+qj1AmMBD3J0lM3ibm+gr+wIllMTQntOwwcX/
	AbzrVmqXdSgvjiEKJLmGRF8=
X-Google-Smtp-Source: AGHT+IH/UONni9JBi2RCMivHlBv+H1UGwnLkk3yuImh+ir7/RnEejhHlDGLGWXdlNBwBR0HTwihAzg==
X-Received: by 2002:a05:600c:4ec6:b0:409:3f53:c9c7 with SMTP id g6-20020a05600c4ec600b004093f53c9c7mr2232492wmq.35.1700329355808;
        Sat, 18 Nov 2023 09:42:35 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:77bf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id y10-20020a05600c340a00b004068de50c64sm6964211wmp.46.2023.11.18.09.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 09:42:35 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/20] drivers/video/fbdev/cyber2000fb.c: remove I2C_CLASS_DDC support
Date: Sat, 18 Nov 2023 18:42:10 +0100
Message-ID: <20231118174221.851-11-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231118174221.851-1-hkallweit1@gmail.com>
References: <20231118174221.851-1-hkallweit1@gmail.com>
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
 drivers/video/fbdev/cyber2000fb.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/cyber2000fb.c b/drivers/video/fbdev/cyber2000fb.c
index 52105dc1a..79775deda 100644
--- a/drivers/video/fbdev/cyber2000fb.c
+++ b/drivers/video/fbdev/cyber2000fb.c
@@ -1234,7 +1234,6 @@ static int cyber2000fb_setup_ddc_bus(struct cfb_info *cfb)
 	strscpy(cfb->ddc_adapter.name, cfb->fb.fix.id,
 		sizeof(cfb->ddc_adapter.name));
 	cfb->ddc_adapter.owner		= THIS_MODULE;
-	cfb->ddc_adapter.class		= I2C_CLASS_DDC;
 	cfb->ddc_adapter.algo_data	= &cfb->ddc_algo;
 	cfb->ddc_adapter.dev.parent	= cfb->fb.device;
 	cfb->ddc_algo.setsda		= cyber2000fb_ddc_setsda;


