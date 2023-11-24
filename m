Return-Path: <linux-i2c+bounces-447-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2AA7F7125
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Nov 2023 11:16:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 464BB1F20F18
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Nov 2023 10:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E189C1803A;
	Fri, 24 Nov 2023 10:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="go7Qrl4K"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A91E110FA;
	Fri, 24 Nov 2023 02:16:36 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a02ba1f500fso251684166b.0;
        Fri, 24 Nov 2023 02:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700820995; x=1701425795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmI/uIQ6Rz6MtRkEfeCIhTUeSTfDQWhDOaE2Jo1gHkw=;
        b=go7Qrl4KK6CKbXtxM7P2PCPTIn4BZSMVf/n58O7uymbxwsyFVBJ28r4CJ+2r5USRAx
         PMPa+e3ZFzr2E7M+xVQfnpBxMoqLtxU5YfJR8d7XdHTyJfxnkvdcPm2g6uwMBAqwSlK8
         p84TZvpQQD7ZJ4mUXSMfSdl52+0cUNpWLBnZLKAIMhP7enjX91hbs2D6zhfngQkgW5zI
         thrXPJpKWMm1R3073XiRwGJ3YE6Kg3o1u/cEIOLRG9bTSZpvQuHYfxHOL9cIh2GdNmG0
         yr1yHhm9x2iPLw09Czm85+pJwCDK+pQ13TcAjpAK3UfzqCejVOyrnKf44TnBM1Fu9AsR
         DLYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700820995; x=1701425795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CmI/uIQ6Rz6MtRkEfeCIhTUeSTfDQWhDOaE2Jo1gHkw=;
        b=csxjSGznNHKR0Is7IYeQuh6B6zPPS6Snw++DjHVqBDcp/VPn8Y9ImjKwCpvU2dtOwa
         qrpqN59bGwne+szP+ElWIEQZ8q1ecynEfY0f0V7zDwZA8JxHhJk2m4WK9iJQO5Nc1iQd
         27v4kgBJtiNSUl0AdmQH/O08oQdwJ7dxr7FkfwNLLECJUx4+R/wa+GjsKXnLJnm3I5kD
         TRystu91WqdvsP1iaYoZoIqxD5kczO8fbendkRwtO5C3FFdnA+I6IqgvrLcRDaRHnQDg
         BGY4PmtXkt1YMZgW+htzWgPSPrDjj7IyZG+0BtySUeJ5UtgI5gtCv7k1YYE3QRN6pZFb
         16mA==
X-Gm-Message-State: AOJu0Yw/oXxqvhIdzvoVtw5XCokN5V7L8Ge5n/5YRhIjAn2fQL4ZicNQ
	yfAe3nV0kNVir1mY/zEiK9lTih5r5WV1xQ==
X-Google-Smtp-Source: AGHT+IGleUJohNDiMb4cl8svyIOn0mt82nef225zJR4dEew+lBsivv8WdxG9Igavwtpw4/QWyiGOXw==
X-Received: by 2002:a17:906:29e:b0:a01:dc84:1658 with SMTP id 30-20020a170906029e00b00a01dc841658mr1687689ejf.4.1700820994715;
        Fri, 24 Nov 2023 02:16:34 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-72cf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:72cf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id oq12-20020a170906cc8c00b009fbf15cee7fsm1887801ejb.69.2023.11.24.02.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 02:16:33 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Jim Cromie <jim.cromie@gmail.com>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/10] i2c: scx200_acb: Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
Date: Fri, 24 Nov 2023 11:16:19 +0100
Message-ID: <20231124101619.6470-11-hkallweit1@gmail.com>
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
 drivers/i2c/busses/scx200_acb.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/scx200_acb.c b/drivers/i2c/busses/scx200_acb.c
index 83c1db610..3648382b8 100644
--- a/drivers/i2c/busses/scx200_acb.c
+++ b/drivers/i2c/busses/scx200_acb.c
@@ -427,7 +427,7 @@ static struct scx200_acb_iface *scx200_create_iface(const char *text,
 	snprintf(adapter->name, sizeof(adapter->name), "%s ACB%d", text, index);
 	adapter->owner = THIS_MODULE;
 	adapter->algo = &scx200_acb_algorithm;
-	adapter->class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
+	adapter->class = I2C_CLASS_HWMON;
 	adapter->dev.parent = dev;
 
 	mutex_init(&iface->mutex);


