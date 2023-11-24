Return-Path: <linux-i2c+bounces-439-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5118E7F7119
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Nov 2023 11:16:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81B111C20EDD
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Nov 2023 10:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C07F018B1B;
	Fri, 24 Nov 2023 10:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MLnCxw1M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 685A41710;
	Fri, 24 Nov 2023 02:16:28 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5431614d90eso2488541a12.1;
        Fri, 24 Nov 2023 02:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700820987; x=1701425787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TvMhLdgxzmvHjkFyHLWsZZ7IOFCpPNkXdifeaawKQLI=;
        b=MLnCxw1MPygAe/hGaScggqLiNNuKTur/N7Qi9wSRttpyX/TL6MKnuTrQ85iiOzZdeZ
         NTu/1m72rZLYDjU/wz5UjajVrQSE98oDBDRBeY7PC5gxDDu0FqMXypTk3PJz37djgXZh
         Aefj43qi6LFve9mbsjKdHkzMD48eNWGj1KQ6gpolX0GLxmUgxpARtT27YSoP6bT2v5qm
         BnycdDAxICUR2bcEpuaJnMY05xpswbLncccHUteLFG/KcUlK/MgeulRg2I7uzf7o13wM
         IZf4/EGXBL4ZWwZo/W3K+A6OEjqescKsc7L45/MeXm/6DBvfKksTNNfaHQL1eenX/ku2
         O3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700820987; x=1701425787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TvMhLdgxzmvHjkFyHLWsZZ7IOFCpPNkXdifeaawKQLI=;
        b=bCK9h0IV0kzIGVaDogiO2ubgoVfo0XNhU2ZW/g+KvsH3+1W1VljXKG9Klkii8GS1mJ
         2joX//oqnpWtILS9twLlrVJslpzCNL1ryeIp9ArXqg7eH7H5AzZhFbsuCeGIZaDkTT+E
         wFDhgEDe6mDS6soqqns77ztSTgkzLY6guz2gj3cQKZHetBSsFhaAaXHnsByZM9FUiOvM
         Ou1ECQkfPMx93y6vc8KgeIGInPfqcoOyxpiC3s4eBJ9xL+fHKZO1m3ipGUs8YGdWfjqW
         oobdZMVscCGVqFmfuikr6XFY0ixQzhYNffX6cqFaTI25JsvaZ18T3jXid6tYvwSbr563
         FjeA==
X-Gm-Message-State: AOJu0Yyp2XMdrYyCv245YjtKtz+r2WPvWfz3l9NT+q5FaeC4pEfHY4Tq
	PFX5qA+FogldHYyCo/RoGp75Ceutk917tQ==
X-Google-Smtp-Source: AGHT+IGkA02PbfBKunnd6jhHwP56ec1eLpYUxLVppuL6zxrnc1kQN/EcXDZ5EhmwsfyJqj84pfYEuA==
X-Received: by 2002:a17:906:158e:b0:9fd:8d07:a3ad with SMTP id k14-20020a170906158e00b009fd8d07a3admr1465316ejd.17.1700820986648;
        Fri, 24 Nov 2023 02:16:26 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-72cf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:72cf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id oq12-20020a170906cc8c00b009fbf15cee7fsm1887801ejb.69.2023.11.24.02.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 02:16:26 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Andi Shyti <andi.shyti@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/10] i2c: pasemi: Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
Date: Fri, 24 Nov 2023 11:16:12 +0100
Message-ID: <20231124101619.6470-4-hkallweit1@gmail.com>
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
 drivers/i2c/busses/i2c-pasemi-pci.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-pci.c b/drivers/i2c/busses/i2c-pasemi-pci.c
index cfc89e04e..77f90c743 100644
--- a/drivers/i2c/busses/i2c-pasemi-pci.c
+++ b/drivers/i2c/busses/i2c-pasemi-pci.c
@@ -56,7 +56,7 @@ static int pasemi_smb_pci_probe(struct pci_dev *dev,
 	if (!smbus->ioaddr)
 		return -EBUSY;
 
-	smbus->adapter.class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
+	smbus->adapter.class = I2C_CLASS_HWMON;
 	error = pasemi_i2c_common_probe(smbus);
 	if (error)
 		return error;


