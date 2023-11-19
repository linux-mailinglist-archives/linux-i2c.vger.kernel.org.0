Return-Path: <linux-i2c+bounces-272-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE047F0548
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 11:15:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B291280BFE
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 10:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53FF1101D1;
	Sun, 19 Nov 2023 10:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmPX9+sK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9384319A;
	Sun, 19 Nov 2023 02:15:08 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-543923af573so4899332a12.0;
        Sun, 19 Nov 2023 02:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700388907; x=1700993707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFB7iCk0Bd2syBjc9Ptoymcq6fnpGc3VauDL49PiFhg=;
        b=hmPX9+sKgWlC0Tb47fguc27gPBWffnzqifdF7ydKYpxQYmmmFeqer4QUAKsmqduIRE
         LQXmIpt2wN0L2a0wblh5q3nJa9BLvQdT+3+DcuOYTJUjnLzWFT6n/Ze+F2t2Ll914HoK
         1ry3ZaKhaq3TU2e0MO1/VFIZ5zpJ+EpOKjDTOIUMpGQiDKf9l/WC1hgk7so+V2t/83Fm
         egW1aPHYnQXCt3tOKLAn4uSPQifG0dvluO9EMqBC51oyAeF9fj4CqYUVgwpdhZoCXhvC
         /xqDo7wIPgN/qUZ5pYgmurNqzXOOa+Ev81MaXrnhmRScinfQlxqsO3kx8NKRUpFFc4Ch
         QMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700388907; x=1700993707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GFB7iCk0Bd2syBjc9Ptoymcq6fnpGc3VauDL49PiFhg=;
        b=UvVmwMSWlsPXNSDk67lXrSwSwPwHN6wY5E66B1VvgklDVpEODwYPrf+vbdEpLkgGr3
         7WFyh3IfD2svG7TdYLJAMXmK2OdMeqvZIBpajx8w9phJQ4eMmITanx9khEDUlguJQ7+h
         yw+1rIYPyaPta1Xgz+VJXh2xdLfw5zc+dyywdC0GXX9NPPfaj2ditdpQ7s2CcasrHH12
         XiKJUozwS+WhpGbJB+KNc8+ZawtCsHTjspXCVfp8hJpbvpLAT7umMqm1oB/OQmilYJob
         S6c+n+SwXEnNVetalU3g+WRQnnqpJWQgtlFtYNlu4zDokBPqHX4mZXX/nCc+FmgzimEJ
         RvOQ==
X-Gm-Message-State: AOJu0YzIOYmm5dxg1D1JxTAoC9FnmdOGhuR59OHkg7Dj3EB3OEacbVR6
	YtNKzsdrDgK3rMztVCsqsk5kqkRRWVg4Cg==
X-Google-Smtp-Source: AGHT+IHz4Mkuei+5Zlm1vnh7Y4mgzhrej2LzRNWm+r0PgkV3RcbkaFxreIMEyEHshEm5B+Cmem+Rtw==
X-Received: by 2002:a17:907:9708:b0:9e5:e56b:9b7 with SMTP id jg8-20020a170907970800b009e5e56b09b7mr3842857ejc.42.1700388907007;
        Sun, 19 Nov 2023 02:15:07 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id p20-20020a17090628d400b009928b4e3b9fsm2743581ejd.114.2023.11.19.02.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 02:15:06 -0800 (PST)
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
Subject: [PATCH v3 19/20] drivers/gpu/drm/display: remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 11:14:44 +0100
Message-ID: <20231119101445.4737-20-hkallweit1@gmail.com>
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

Acked-by: Alex Deucher <alexander.deucher@amd.com>
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


