Return-Path: <linux-i2c+bounces-8754-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACF19FD3F2
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 12:52:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D05053A0F69
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 11:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 642431F2C45;
	Fri, 27 Dec 2024 11:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jf571Xf/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B0C1F2C27;
	Fri, 27 Dec 2024 11:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735300332; cv=none; b=o7wO6utz8FR01Kp3EGMnX0nx6PSCF0X5ITClWgCwviVrcVVhkdfU3Vj60X1TXRjMlzCUiGP9VFP5Sh5fe+EPhi2qCdimwGnMG8HJCwKjZykBtDq2f5VRHC2dX9gvAzqw7RaA/CxJgDGxdF6gVWCQZJx+PCreS5Zf9UNXysAsrL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735300332; c=relaxed/simple;
	bh=r6NwWr0EMAA4jcLLbT4+7BFeJ73HJpxC3n+D0mkfyOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bnanbedlGjQ9btjL8EVZ/UPPCeaV4Jt6pBUpRHBpGSs4CN+LsWHSOcsbKZOEGj7wPDYIlHVuRL7syoDNtN+aMf1MUk7PRitS05+sNyBoDv2zKnAu8pWs8nq8g1iqw6RK9Db+98hSN8dGqsj56sny1Flo36HrGZX5raqnrFEsInw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jf571Xf/; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21669fd5c7cso87991985ad.3;
        Fri, 27 Dec 2024 03:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735300330; x=1735905130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15965UaUMUIQcX8R2+qIbEDBP9ZN9hIvP+Qalpqa8Qo=;
        b=Jf571Xf/d1uSny8gDHis+WmFd3HtvmWnE58e81ira+QZEG69cYFWAdAhdBHArxZsP3
         fakYIV/b92lohVXKOsQv7wo/oP9jvB9YZmL0zgCKpIBXdeHtpOFj3cCEDe2Dbp4ZW+4M
         AP6+yvfjxwoemyy02o1eyfCwxgb0f/SriO5Cwrw16JXVY1m8XU2DYbX4IzgdNrkYbjbU
         2yUqo4A9kcXwOOjaKhbtB+puVRmNqUH+3WXe87jJGPdzUpwR0qBVTj3PPsj4cfdbp8nx
         ou/CWFT4CCclAUsmxEPdBJHZ8pw7mahffDqszwbdo3tarcG5L3IFs6wao5ueFL+eGrZ5
         KNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735300330; x=1735905130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=15965UaUMUIQcX8R2+qIbEDBP9ZN9hIvP+Qalpqa8Qo=;
        b=CEKAV2yI9O7NT5SMzqdO2iJuJYy1ZwtSaHiRwvb6MUp00q8Xubzzo/2nZt4X/UNYL9
         dW9GvWX9itircAKhaxu8VGwVUQ0YtsiaEQfkeHTpj0EpC5o4pUFIgOuhJjMC7lgJNo7K
         gtyTRmP5YIk0btM6+Dj3cWI1EX5Bj6Q0CtDLiYh9bKoQPxs4UXLIy+rCUqcBaAAyj7h1
         0riGaZw8WueEfPdlWjQO7xPY5HUvwz2vG1XA47rI2FkJ03eDMrTN9a3T9gI+/6dmUf/Y
         C4/nOOz2UIvGkrsZ9E+16VMFXWHcmYZ+28qdTY48t6MbXooy2Pjv96VBXanONCZxujiI
         em7g==
X-Forwarded-Encrypted: i=1; AJvYcCU/oQOmxdyGJacGEJ33/XaY0yvuVRVFSgkOaVAjjEqpsTQkuH3Oqq1GzPhCiObOJf+PPSEJn45TS4EddDmH@vger.kernel.org, AJvYcCVYK6miJ95/2TAUT4JAmLMje1UMhQ0i/OhLdWZcH3cjN1DIDoymNP0YVKKSNXt+P9+iUGNTJmob+kk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUbKjpv85SknGuZe3KSKXTiPrwi4aoMNzFv+i4AR8bA1N+2vT7
	PhNBGcb8RbIIQNBgiFE+XGs24KjdPyyf8YKDOyHaCrlDFmK4Jkh4
X-Gm-Gg: ASbGncv5Ya9LDJFvtGaD9PGgg2jfllBkjEhibBIpeyunOhFbb7C/ZMfKOnwI50CN+Cj
	5COmfLGfTmzheVN/t1kUyGE8Tb5jUaoV+ky8EtFY0KWQa5QN4khU5kgLmYzZNeS6cpRsoJUhfat
	q0hwPdj2ujJO+zL2v9uwBDwWgI1KTo3Wf2JSr/2/l4n6MyhnoCan9aboAAu0rC3JAn/Pqbxj3sd
	gVv8g/1Cl8ObBZQEj9p1186+gYMXNryFC9gC0ZAdLda4sA2t8HVCKm3vlqoSJe1JvrDhIbh/XqS
	PyuItzQ=
X-Google-Smtp-Source: AGHT+IHeDK1oFL3avB4RSV1GAEhoTKrJ9m3cdlJ7UqZ7wvUv5W10qtZta9ibPc2BnJQWnZoo3sjnpA==
X-Received: by 2002:a05:6a00:858b:b0:72a:a7a4:9b21 with SMTP id d2e1a72fcca58-72abdd20f03mr39572625b3a.5.1735300329846;
        Fri, 27 Dec 2024 03:52:09 -0800 (PST)
Received: from prasmi.. ([2401:4900:1c07:9010:ac08:3a91:844a:cc65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbcbbsm14363990b3a.97.2024.12.27.03.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 03:52:09 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 2/8] i2c: riic: Use local `dev` pointer in `dev_err_probe()`
Date: Fri, 27 Dec 2024 11:51:48 +0000
Message-ID: <20241227115154.56154-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227115154.56154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241227115154.56154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Update the `riic_init_hw()` function to use the local `dev` pointer in
calls to `dev_err_probe()`. Previously, `riic_init_hw()` used
`riic->adapter.dev` in error reporting. Since this function is invoked
during the probe phase, the I2C adapter is not yet initialized, leading to
`(null) ...` being printed in error messages. This patch fixes the issue
by consistently using the local `dev` pointer, which points to
`riic->adapter.dev.parent`.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
v2->v3
- Moved replacing dev_err -> dev_err_probe into patch#1
- Dropped fixes tags
- Updated commit message
- Collected RB and tested tags

v1->v2
- Collected RB tag from Geert
---
 drivers/i2c/busses/i2c-riic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index e1babd5077d4..01195ffd4c07 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -320,7 +320,7 @@ static int riic_init_hw(struct riic_dev *riic)
 				      : I2C_MAX_FAST_MODE_FREQ;
 
 	if (t->bus_freq_hz > max_freq)
-		return dev_err_probe(&riic->adapter.dev, -EINVAL,
+		return dev_err_probe(dev, -EINVAL,
 				     "unsupported bus speed %uHz (%u max)\n",
 				     t->bus_freq_hz, max_freq);
 
-- 
2.43.0


