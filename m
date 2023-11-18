Return-Path: <linux-i2c+bounces-243-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C209C7F01D7
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 19:05:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62FC2B20B69
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 18:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E33E7101E1;
	Sat, 18 Nov 2023 18:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VxjVD0jU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCD1BA6;
	Sat, 18 Nov 2023 10:05:13 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9db6cf8309cso402009966b.0;
        Sat, 18 Nov 2023 10:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700330712; x=1700935512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TvMhLdgxzmvHjkFyHLWsZZ7IOFCpPNkXdifeaawKQLI=;
        b=VxjVD0jUoPbrMJcrPHMUImbdU75PDwjy0z4aAoFwhHZEz/G1qQj2iiMjK+b2V17Buk
         h+zYKK5TEXErteSmwdZ9ab00qYmrckbicwqts+mA23KB4neeDTAG2irtvsplINcOCjwt
         QQYCSgssPXecm9gnpGYjfAjYdV/2f001Wwf7NOOYwVpGKytrAKo1v7TtBaBWAEfK79bs
         eAGa6oqL4mM1+a+3bi3sshuh0KS7u3fz0wyGIhjfJOCeLiX2Zc7O6OQML4xkxlg3pw2b
         t+9yuvz6mqKzVI2l8uICmU/GlbvWY+AwhOj8hN86v5UitQzh1nQghrU/7CCg0Y6TNHOc
         vLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700330712; x=1700935512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TvMhLdgxzmvHjkFyHLWsZZ7IOFCpPNkXdifeaawKQLI=;
        b=KmW9mPAfebVObG+7UliNi4f1R6G3ysSII38xxDlsckwF/VIy6r4nNNamlMVojtxHI0
         Rvrr4RfW0i5/QlM6lHbZje3C5ZR28Xhc1Fy3GJfc5dPU1+NYWDYdhHPtnJ7f1vZPXwZY
         ntHaRAP+BD8dHAlNjib+iwCAqaJeIx/6+IuakP8W0f4v32/mJCOUpjX44GCyLEKBjVKg
         tkG+w1vgmxPE6sJOQ+qWpEAR7KHkmQVyWqHpjeZpiXS3PUhd+mYuCBVFXJV87XfriHXO
         PNkivZGR7YB/9ewvJJVzGCgy/ZtTvYyweQaD2Z/1ynwEegUZKI1jc7CrKaFJSl7zRRIo
         ibYA==
X-Gm-Message-State: AOJu0YwaE+Xn+Cu4ihDIEcut4hP8E08jSAPlpt5zhQ3UnnXvobvSazSi
	BxEv9BdNdaNEVOmAtJr3qDE=
X-Google-Smtp-Source: AGHT+IGmY36vyE2njGaUXhkxvF2ffP5gHcb+uEcsV4u6HxS9Gv0SaqYqLLEs3KVtE4jvzvFYDygO7Q==
X-Received: by 2002:a17:907:84d3:b0:9e3:ef19:7205 with SMTP id oh19-20020a17090784d300b009e3ef197205mr1849277ejc.3.1700330712142;
        Sat, 18 Nov 2023 10:05:12 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:77bf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id m20-20020a1709062b9400b009f2c769b4ebsm2079456ejg.151.2023.11.18.10.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 10:05:11 -0800 (PST)
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
Subject: [PATCH 03/10] drivers/i2c/busses/i2c-pasemi-pci.c: Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
Date: Sat, 18 Nov 2023 19:04:57 +0100
Message-ID: <20231118180504.1785-4-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231118180504.1785-1-hkallweit1@gmail.com>
References: <20231118180504.1785-1-hkallweit1@gmail.com>
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


