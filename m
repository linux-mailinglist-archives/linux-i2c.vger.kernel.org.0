Return-Path: <linux-i2c+bounces-123-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7AD7E9B18
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 12:24:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 926CB280D74
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 11:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D9101CAB8;
	Mon, 13 Nov 2023 11:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AcpBq0VQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B648B1D53D
	for <linux-i2c@vger.kernel.org>; Mon, 13 Nov 2023 11:24:29 +0000 (UTC)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7481FD69;
	Mon, 13 Nov 2023 03:24:20 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50970c2115eso5933380e87.1;
        Mon, 13 Nov 2023 03:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699874658; x=1700479458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8o2HXYJRUVQ1Lpbm7zM61UahrNOCCIAHF27L8iRvJeA=;
        b=AcpBq0VQSvToazMct0QHaRZidWbU5i3uuRA9yPg7u2mEAHU6JZ7kpk9yGn/7dLucZY
         /xJq6bqLn8HMYmvY2Fj8kF2oZNnelDSUSZhzLoBcmu7NZwCFPmhqAXWJryBsHKHvRwTm
         1eQBK1TENGoj9d26gCU/4U5mGfBVBZDtDuqe8zafUcPwr0hnGSkgZ7LuyafLvmQcwJ0T
         /Z4D6e11QoP4tQ0n9Bwc9Nd7/9f2GtvvfHSqHedKd1NbSbAIfKaDpqC7wdsc+e4AXdhv
         O/Kz1E/vAejD38jaoEBWY5/niK8WXK8FHa14BlPfZyhP2FVqzMzy0eU/OjIHmKKTN0kS
         ewQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699874658; x=1700479458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8o2HXYJRUVQ1Lpbm7zM61UahrNOCCIAHF27L8iRvJeA=;
        b=OKbPIR5GuhHaOuxyKPcVjxOvN4h8U76Td3BwXQR5ZqjbYaHuO41N/8pXTQ0aUVoUGs
         a9D30Cjj3qDJSJRh9NsTYaSoQbK7t04xVERAWDukKLRBRh2ssVjP5SkQbj8pBo4Cvq1l
         Y8UB2/Z7/B+p0KRE1G6hS/d7Nz1qoG7+mNlB+RFPuINQcjJgzBoCzBLpYysomyFNavx6
         2AM1ZWoytBiyyS9E2V+kcAtdRHx6HIO63fjYkBGRAchvhw1jz8yvKl+GiWvJSaUPsT5/
         MUujqA9iVSEXsc8pmfRWyop9lZ4eTCChWCnQd+cY8T5pOSxVKUCO6L3/cwE3eeZ1V1eP
         IZUA==
X-Gm-Message-State: AOJu0Yx8Cwz6V0ACGcP5iqutiaM78ZPwhW6iuOvdowAK3mQBUQLT6Bmw
	IZ7oWvsoWt8KABAevgF8+7yBUsAYnx0vgA==
X-Google-Smtp-Source: AGHT+IFM+nvF+UETcm6JP5xDJkQVdoRgP72tN5q6tLWm5ga4IahPJk8LYKIlkJQCwwcn7w1SgkhZHQ==
X-Received: by 2002:ac2:5e87:0:b0:508:19be:fb2e with SMTP id b7-20020ac25e87000000b0050819befb2emr4055348lfq.58.1699874658428;
        Mon, 13 Nov 2023 03:24:18 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-6e16-fe00-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:6e16:fe00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id l19-20020a05600c4f1300b0040772138bb7sm13565787wmq.2.2023.11.13.03.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 03:24:18 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 19/20] drivers/gpu/drm/display: remove I2C_CLASS_DDC support
Date: Mon, 13 Nov 2023 12:23:43 +0100
Message-ID: <20231113112344.719-20-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231113112344.719-1-hkallweit1@gmail.com>
References: <20231113112344.719-1-hkallweit1@gmail.com>
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
 drivers/gpu/drm/display/drm_dp_helper.c       |    1 -
 drivers/gpu/drm/display/drm_dp_mst_topology.c |    1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index f3680f4e6..ac901f4b4 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2102,7 +2102,6 @@ int drm_dp_aux_register(struct drm_dp_aux *aux)
 	if (!aux->ddc.algo)
 		drm_dp_aux_init(aux);
 
-	aux->ddc.class = I2C_CLASS_DDC;
 	aux->ddc.owner = THIS_MODULE;
 	aux->ddc.dev.parent = aux->dev;
 
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 0e0d0e76d..4376e2c1f 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -5803,7 +5803,6 @@ static int drm_dp_mst_register_i2c_bus(struct drm_dp_mst_port *port)
 	aux->ddc.algo_data = aux;
 	aux->ddc.retries = 3;
 
-	aux->ddc.class = I2C_CLASS_DDC;
 	aux->ddc.owner = THIS_MODULE;
 	/* FIXME: set the kdev of the port's connector as parent */
 	aux->ddc.dev.parent = parent_dev;


