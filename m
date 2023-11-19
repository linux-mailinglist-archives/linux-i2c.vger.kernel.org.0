Return-Path: <linux-i2c+bounces-261-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 662567F0532
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 11:15:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB9F2B20ADA
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 10:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EAFAE56D;
	Sun, 19 Nov 2023 10:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QTY637og"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AFF1E5;
	Sun, 19 Nov 2023 02:14:56 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso471890566b.1;
        Sun, 19 Nov 2023 02:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700388895; x=1700993695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTrCOgNzORg+kX6P4q5KSwq1S4WQ2CSsbEPwGEitBjk=;
        b=QTY637ogyl6fV3J6sSZXCo4WD1WykxFeUdP6G5TOM/Rn2hq1UW7jXOzdS+U4hBmcwL
         0+3MNQIB+dxqzEzlOmqzUsx7RrL5rpnjK4e38Qn9fjx2UhLjtoU+I638R6l+SMsy3PRM
         ET+TADO0g1uUhnbZkQzugz5L+OdS/tPRwNsVKGMikO8edjAbeuz1u9JMNj0QNawSZI71
         XQ16sUxqu6qQKneyg4eGVwFv4GGF+pHKMN+Z/KAxzjtpEMEGZ1+LhWO7691XZBYNi7aA
         g+LCzaUJntQztPJXdYad8vrAJXIwT4KuvjJ8ZSbNog8OL1wXcCdSWIePDAGnP08rnUht
         FcTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700388895; x=1700993695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTrCOgNzORg+kX6P4q5KSwq1S4WQ2CSsbEPwGEitBjk=;
        b=WEx9BTLzg9JhOhH/Y7tdSKD9vFL5vrPFln++GepAenzCQyIXx3xPq8GmiL54HTyHr7
         jHUL0FNh3tN+2YMznvmFGmWfAHiYcB94eVxOo5cWJpouA26Jf/Qrm59Vcws0k6YXhpM8
         fJxndxNZa8B/H1/wThQo7HVqXyuBPebLMx8MLsxN9zPH5xR1AvE9QyFUPy1FlylmRxdo
         YFhv/CVp02vwIx9BGf8enzN6fHFpraT5IiKviO1SuNNnMH+ELaVURuzPtswSMqZtJ0NR
         QFP2LDfdFOB9CrEDmPIP76GRne5npG5cNpjFeBvvxnlSCbtFyxxj91tkcaKsCDqOdYba
         vDMA==
X-Gm-Message-State: AOJu0Yw+5syKZGzp9cF04jd+ODSbW+c0BfsvLaU/dKsLxQcTc2UurwxJ
	4rjTtjOrGnMoPFEL5T3lQ3lrlEmI0mmz5g==
X-Google-Smtp-Source: AGHT+IGBo5TDe+9oNNSJJ/7D94Y6LpcpavrjXJu+KHrikjnvpOJEV08xR/3GbhvbP9lm9HCrbdPOJQ==
X-Received: by 2002:a17:906:74c1:b0:9fa:fb8c:3904 with SMTP id z1-20020a17090674c100b009fafb8c3904mr2090466ejl.65.1700388894616;
        Sun, 19 Nov 2023 02:14:54 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id p20-20020a17090628d400b009928b4e3b9fsm2743581ejd.114.2023.11.19.02.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 02:14:54 -0800 (PST)
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
Date: Sun, 19 Nov 2023 11:14:31 +0100
Message-ID: <20231119101445.4737-7-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231119101445.4737-1-hkallweit1@gmail.com>
References: <20231119101445.4737-1-hkallweit1@gmail.com>
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
 


