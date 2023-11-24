Return-Path: <linux-i2c+bounces-445-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A609B7F7121
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Nov 2023 11:16:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BD9A1F20EFA
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Nov 2023 10:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A520A199A1;
	Fri, 24 Nov 2023 10:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X9oKWUBI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F11E21981;
	Fri, 24 Nov 2023 02:16:33 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-54a95657df3so2603916a12.0;
        Fri, 24 Nov 2023 02:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700820992; x=1701425792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VbsbH1CThP42UiUJns2VDtTJbIoXHmLVJdFuam5YX4A=;
        b=X9oKWUBID6OlknMR76MJ8/PNkQP+IG+lRE5M9SgcBKo/JZ4naaHuCI3TtoEhE3RvL1
         CEvlGrDhruiRHkgZ9bUue+5m5VtBqjtV4nrTuKtcEtTLE5KmvqUnPzYZbFI2tLEPBSl4
         9P8s/CDNOwkDDhoR6qyd/wOiBNhWMZ3Ah9c17hdtPV4daxBY+D4AbiUtxLrKgmUpCjMG
         isiEemXpWfZGCXci0Im2UIHrn3gJMgF/y/pS1uCWaYuV5DsN7uSwNFXMqNUvS7uzWKv4
         /PX0ChxgiWUPgHUQRTsywQH83bn8yCMOArya6EwQACA2XGO+GhURd6Cv8Zw9QAhwIecy
         EYuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700820992; x=1701425792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VbsbH1CThP42UiUJns2VDtTJbIoXHmLVJdFuam5YX4A=;
        b=QVcmSUqoKb0amngK6ZFz4hle4Y/iKjktHheJfO0pYGUVUj695yQymfyZ+989RsKF/E
         Yq3b+/xdoH1gAuQpCWAWK9lTUaUoYgT+yxxeDNOyF3KeLppY4wdlxPX4Wl6IpUmiH90y
         xLPHCP8SXuSXN4dyXR8oq6OUojLddXfhh/dfjpdu+S2u1DHGw7sZXdcyC/KqbztyEwhF
         SGQTarE8gqXS8dYtV2mWE8yOk8dgIIU3FFl5ikZF9IpUgYRVe5PX0sK8fUypUoxwJ06U
         svQ5d3LJLt0ObME1xnDgayGSXbCCfsxpeHdMywHHgo3G3/0qejt7srlYBq0YRvAJpht4
         oJig==
X-Gm-Message-State: AOJu0YxfPKR1ThakTVqAw2579TGvs8PBF4RKxmqo2lvL0qjwudTTcQkX
	JJxPQGo7ioST8lpW8lAXju8=
X-Google-Smtp-Source: AGHT+IEl7DVOh1yNeZ0+PXY4g23+UeNxF96Aj9qPHe8kNZb0s0xY2k4/cW8g1WnJAVASNqPSlqExJQ==
X-Received: by 2002:a17:906:590e:b0:a04:837e:a955 with SMTP id h14-20020a170906590e00b00a04837ea955mr1609642ejq.32.1700820992151;
        Fri, 24 Nov 2023 02:16:32 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-72cf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:72cf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id oq12-20020a170906cc8c00b009fbf15cee7fsm1887801ejb.69.2023.11.24.02.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 02:16:31 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Sergey Kozlov <serjk@netup.ru>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Abylay Ospan <aospan@netup.ru>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/10] media: netup_unidvb: Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
Date: Fri, 24 Nov 2023 11:16:17 +0100
Message-ID: <20231124101619.6470-9-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231124101619.6470-1-hkallweit1@gmail.com>
References: <20231124101619.6470-1-hkallweit1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After removal of the legacy eeprom driver the only remaining I2C
client device driver supporting I2C_CLASS_SPD is jc42. Because this
driver also supports I2C_CLASS_HWMON, adapters don't have to
declare support for I2C_CLASS_SPD if they support I2C_CLASS_HWMON.
It's one step towards getting rid of I2C_CLASS_SPD mid-term.

Series was created supported by Coccinelle and its splitpatch.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c b/drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c
index bd38ce444..46676f2c8 100644
--- a/drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c
+++ b/drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c
@@ -289,7 +289,7 @@ static const struct i2c_algorithm netup_i2c_algorithm = {
 static const struct i2c_adapter netup_i2c_adapter = {
 	.owner		= THIS_MODULE,
 	.name		= NETUP_UNIDVB_NAME,
-	.class		= I2C_CLASS_HWMON | I2C_CLASS_SPD,
+	.class		= I2C_CLASS_HWMON,
 	.algo		= &netup_i2c_algorithm,
 };
 


