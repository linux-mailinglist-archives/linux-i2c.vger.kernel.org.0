Return-Path: <linux-i2c+bounces-419-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 315797F5B67
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 10:41:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0826281802
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 09:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C83224DA;
	Thu, 23 Nov 2023 09:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXuguf7/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8D7910E2;
	Thu, 23 Nov 2023 01:41:02 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a02d12a2444so84052666b.3;
        Thu, 23 Nov 2023 01:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700732461; x=1701337261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aq+Z35kBN2Z5WfXGmAWrEgYrcQFVHuODhyHjoCApg/g=;
        b=XXuguf7/roAvoYRK64dg8BBV5JIWYbblgPznxzJX3RmGcQ46NYIPyK2lWg4+Pl2J2Z
         Vl7gkFH6jmK3ebcSJkSTTXJJq60Ks1yQwIf4BtH3E9nNJ48NUiFvo0rmwykx5jAFK5gS
         Okhgt9fufdzXewzx1TqgoZ5fcxYA8aA3+DBvu1gtebEu9mdO2mok8Qpz75tKXNEOV9g6
         l6ltYmil3aqI1sk/SZYbovTXRmHqwu08AC+ezbpFmfTC7vPmtjoR77OUADJ9z9fq1nz/
         JV930W+TxK6hbkA2q0fMFLt9+MM9P25MqWy0dw6CvMjDeDkCj4rHZoO/yYWKYwBeWERZ
         nPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700732461; x=1701337261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aq+Z35kBN2Z5WfXGmAWrEgYrcQFVHuODhyHjoCApg/g=;
        b=SWiur/BQvFO6XKhRUFPzoQuLXt4rhC110QkhCFH1xj8Gi6coSrEPPbbz0SMme6DAs9
         919A7XfXthpVSc2QdZL2cOJEzu/oIYslay4/T4YiX2KACWxp4LxdpvwEB1PbLwvonEHx
         P1UTDCiQQhDSbvMxHhTSfxGEHOBHQKzP3lkv82NQJj9kYvy0h7DVyIdzxNN9kBbPxt/m
         DvINbRB4hwh3s5x+GIuW45mfWa1O0pbTdtCCbXF/ipBP1ydBraQrbiXBuaU7+6xfqLOn
         z9BfkVBhcrdV7EQUIleandatVARlWdmfZiRa1sBOwPibn8eWNopX/lLt0n+6fT6aDWGg
         Sp3A==
X-Gm-Message-State: AOJu0Yyuyh2vbk4c63cEV9piZRSUH6klpsgsYk9D0v+j4UgyYAH19mAc
	/oy6uV7/0ujQp2WxRrWuFiM=
X-Google-Smtp-Source: AGHT+IEV+7/puW0dt9JkKFWNyuf9FB8n8CqRgv0YKKalYf/l6B4ZXh/aBJaazGmziZBUrdXnlZahBA==
X-Received: by 2002:a17:906:74c7:b0:a01:8957:7c75 with SMTP id z7-20020a17090674c700b00a0189577c75mr3683442ejl.11.1700732461099;
        Thu, 23 Nov 2023 01:41:01 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-c0f2-3200-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:c0f2:3200:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id s9-20020a1709066c8900b009e5ce1acb01sm546199ejr.103.2023.11.23.01.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 01:41:00 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH v5 19/20] drivers/gpu/drm/display: remove I2C_CLASS_DDC support
Date: Thu, 23 Nov 2023 10:40:39 +0100
Message-ID: <20231123094040.592-20-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231123094040.592-1-hkallweit1@gmail.com>
References: <20231123094040.592-1-hkallweit1@gmail.com>
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

Acked-by: Alex Deucher <alexander.deucher@amd.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
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


