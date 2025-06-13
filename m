Return-Path: <linux-i2c+bounces-11422-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2352DAD8AF3
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 13:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1DD93BD110
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 11:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3480F2E62A1;
	Fri, 13 Jun 2025 11:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="rS089sCC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E496A2E62D3
	for <linux-i2c@vger.kernel.org>; Fri, 13 Jun 2025 11:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749814936; cv=none; b=u2GpAPEN2weE9FQU3MjpjyogZSIOgQd5tJ4zujMRJVkCbHMJchy1REtd1OixOMsznU1crni7vyipTNhQRFoAsUA9f39DGO4PmT5ajxTicF/4c0LJBpJtY/MfcITfQ6UQhY65Mt7aoUCPxjGrzLRILEB1QYX0byK4hVbAWLaOQZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749814936; c=relaxed/simple;
	bh=NeAtc85pNHGt2Bai6eksDz8QG2jTguYaO2Sb/fwRluw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cFmHpaEa4Mx1zYcEd0LU1UNXdchgMZonvi+VT0L9LXzpDuAbH8X8goTZhNSdK0g6zGSs6BVDMuIN/TDvpSSFpG3R2b+F0E67xYVmUhMYFkUhrlnHUoXwLdrkP2jTwpJLtgFbmjlMpFZgmNenoDAyfWfliYSYBqSx6jqRzHiPpNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=rS089sCC; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4a442a3a2bfso36413381cf.1
        for <linux-i2c@vger.kernel.org>; Fri, 13 Jun 2025 04:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1749814932; x=1750419732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hP34e2q5Xb/n9epu9K3/GerhfTkPidCRzY+znM8yDWs=;
        b=rS089sCCi7q9xklN7ra53x1njs+9nCw8pf1r+Zu0GXeLIgkFtWC3a32IswDYXj7DAT
         bjiBjlsBhREhb/0VbNe6x+uC0vDQn+5bd/Wyc9f0THQTkUm2Y+ZmhfOGrWdqsuOiQKph
         cH22pL4cCUVl/90jYWSp+rrtB+QdqE3BzvXPIVs7c8xIWKygA63uV99M9CE1xntGRMOG
         9daASeLc4cH4AyAUofnGXi2EQRObXsITNqeK+gDSsYCpFLJcHzZ5wR0ET3fPqZ7EjaA3
         HFwkL/N39MH45MD8+KUoCQ1YgAi+tMjdrv+hhVBJsOV0GZElAyOp0Q0GGfcmvVebm3vG
         JojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749814932; x=1750419732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hP34e2q5Xb/n9epu9K3/GerhfTkPidCRzY+znM8yDWs=;
        b=rbT4wJfIYma+tNVFH7xD7FvPZOxhL7/Njgcu/jWihp5x2khPZ9caThZjjPJwzvgkkM
         MU4yGM7q2QKZ/uv7Bvlyvcvkhf5cOuZZnEG6NrON3li+Do4UGtLOQpbmUChTVPk6ohhd
         4TNTUxVgaWjQeWnBLJHqgLqLGFJBkl5v3Sln2ItrNozTq2hs27bW0qVWk7UD6ozoAOCt
         XBrMJwfRAS2f31c6CEd665A2RILiAEwskn1HIlXvdTaIRNb2XZkjdxy3oJ+E0Wd3rswE
         gGFCM77Wgb60t4uy1GiMJAS0bYkBawqq8uDEZBGxxllLRw94yaS26XZP0CQvg3A5lZE6
         VvtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbkbRQMk+JoFwBGQYStLu7HSEO3n5dKHbkmMAXtGuCSASJNz2pkclzvWVpaWX8U9KXyy7RDWUNL2k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgBzKgloSk2E8A+yEuSn/PEDvpNc/wG7Q5zLkaGGGGiSGUae7l
	n36fgPz+dSpoYvO9lT+QM3p2gqXX4AYm+mRSfs/gj1N2unhunMTyIaV3YzTrdPqaHE4=
X-Gm-Gg: ASbGncsqf5fuMdfSEXDaZB9GJW6vnE8WkYgU4PB8++ukBReQd422wybuzmzHgb6VBIG
	qhssO+5DMmOnHNNmFF5pCWRf8/5aI7xfMBaGXd34Cvb9LSyT+i73EzFVUoDputiZ4J8RUSqmOvz
	sgP+iCrpO7/YQpDFg36za61ElkHxFnqQVp3lV7rtRhmmgwlzP9yiAiLZa3K/iL3cskOJF6cYqmI
	LMAYq83EukTrnMdxpukmlDkb5VklZFRfc1dKF3/oPsTNcxSAxPCUZHKaRddMFOZlYBVu1ls+bh8
	APeoJIEWUOPIXzveUHIXLNBBDcZgt/M4jl8Vd2vG9BIeGvOBY36fiwiJgTG1FxnKPB80LB9IV+E
	Vyay8VW2twWgBtdlZ1lrt+g==
X-Google-Smtp-Source: AGHT+IEvwSeOVrcJVMZPPA8Mgajhh3j4DaXHPn6mHw+5/rNyArLRJaLGgxD9f3JE53WDOm92ws1YcA==
X-Received: by 2002:a05:622a:4807:b0:494:a447:5bbb with SMTP id d75a77b69052e-4a72fec2119mr49140131cf.16.1749814931845;
        Fri, 13 Jun 2025 04:42:11 -0700 (PDT)
Received: from fedora.. (cpe-109-60-82-18.zg3.cable.xnet.hr. [109.60.82.18])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-6fb35b3058fsm20558206d6.37.2025.06.13.04.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:42:11 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: catalin.marinas@arm.com,
	will@kernel.org,
	olivia@selenic.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	broonie@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org,
	kernel@pengutronix.de,
	ore@pengutronix.de,
	luka.perkov@sartura.hr,
	arnd@arndb.de,
	daniel.machon@microchip.com
Cc: Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v7 5/6] char: hw_random: atmel: make it selectable for ARCH_LAN969X
Date: Fri, 13 Jun 2025 13:39:40 +0200
Message-ID: <20250613114148.1943267-6-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613114148.1943267-1-robert.marko@sartura.hr>
References: <20250613114148.1943267-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LAN969x uses Atmel HWRNG driver, so make it selectable for ARCH_LAN969X.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/char/hw_random/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/hw_random/Kconfig b/drivers/char/hw_random/Kconfig
index c85827843447..8e1b4c515956 100644
--- a/drivers/char/hw_random/Kconfig
+++ b/drivers/char/hw_random/Kconfig
@@ -77,7 +77,7 @@ config HW_RANDOM_AIROHA
 
 config HW_RANDOM_ATMEL
 	tristate "Atmel Random Number Generator support"
-	depends on (ARCH_AT91 || COMPILE_TEST)
+	depends on (ARCH_AT91 || ARCH_LAN969X ||COMPILE_TEST)
 	default HW_RANDOM
 	help
 	  This driver provides kernel-side support for the Random Number
-- 
2.49.0


