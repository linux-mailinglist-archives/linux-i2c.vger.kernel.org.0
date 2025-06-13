Return-Path: <linux-i2c+bounces-11418-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3982AAD8AD4
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 13:43:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16543189EBD8
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 11:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B65F2E2F19;
	Fri, 13 Jun 2025 11:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="qHGBdf+Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B452E2F10
	for <linux-i2c@vger.kernel.org>; Fri, 13 Jun 2025 11:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749814921; cv=none; b=qIEFn6jYw1bvQ8zTQ1FAZSiIYFH5Xwbve25wCXEqczvfxJi4k8NFICfl56Lk/UfoY6UfYc9MWzDQQBIqXf2HfIlO2miEtZdXwLuZ4478yN5RC+nMpfvr8dfEZJnrPO3cSli2h3i4ZmxiTmwJP616M7zT9DT3zqWSoR1zuNz/LnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749814921; c=relaxed/simple;
	bh=Jkh4xI1xZFk9y2KS3JrFZenLMgrJyYczEnPNCHPbPOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t1E48z6O5yjNXZ06W5E9iWNOdKpu+c6ivX8S81Npr7sOuSR+WKmP6JRtJ1T1nzyIYSKl8NPr1ldV17inUEcIa0it76Tfcd7XEBNiaA4xjuTZKYBy7U+1dL44MBfD4m4013nQ6vkTfrFF8uufFOzfslsfM9OMe98+hCSR/Frc+lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=qHGBdf+Y; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4a58b120bedso23480971cf.2
        for <linux-i2c@vger.kernel.org>; Fri, 13 Jun 2025 04:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1749814918; x=1750419718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gog1CrvxeaBvJs1XxgKi+JJwPn/cN8uX820mkK4YWuU=;
        b=qHGBdf+YjtcW4VY5lZTmf053Vg490Q4jam7CAqIXI8Ly4eTAIxvAiU2lz3NmHvEPBK
         PHlo6RcyJIRFBYVBa1kYLG6z9NjqOdC/coMqD1/VgzkkNp/KFqBIJQV4wGWCu0DeBuYE
         EzyUyepGwVe1TmA4XYFbsEcfjwxmKj8EXHyaroZ3XUIslxIX6I/QP/F276iOpl9T7gP7
         WBRoGLkhNcOPIcZ7HuNqRRzrpWzmZVFn96Ej/uHYOXFIH39jmJt6p19YEX9xULozQQjW
         sFkDMdXUNogsPypUwxUuTWDIt/0tTtj5thFVWSnh9awILgD/7QbnGrRy8tUNHx7KygMz
         vAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749814918; x=1750419718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gog1CrvxeaBvJs1XxgKi+JJwPn/cN8uX820mkK4YWuU=;
        b=kl6jle8TRaXyxqVKOyJxwov65sMu2eEP4lZjcvxnMVSkN+gfq+xTcfPqLLVacS/LQ1
         GBL7n92Yn5Wrsg6wRSyOg5Hkjv4sVVP3PPfwWCu6tjv7E3j9AmhlgOH06Nl/tLGU8d3k
         g1cLrMCxGWSi/G5fUDmk2U2/Nyx0tNjO9uE7dcGv9UIvAlI3luKlZ2lZP+5R9Yl0E0jb
         g5LMaXDlXao3bnbr1jHqUbXwVI2tJ4jPP3mmVbh4qO6+PEJGKHwLeCWyz3/h41T/HAPo
         SJRj4+BxXr1N6R6jAg2hvu1lKeHMWwHIZnlONTgHrfYyCaX6TeJTvvgIZK+376ZZMAd7
         3s1w==
X-Forwarded-Encrypted: i=1; AJvYcCVigMEWtzrM9QWGUobaWeJWiN3fRMm0N4vkufKpRJaIpi9xXSmddFbowBP9TjHPVv2HJsqt8/Es218=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1lWcDj/ASwst/EaEUhXEArw5vAlfH1DdXZraatwPD1v6e54nX
	fnyFJ7hjktJfCSuupoJ+PVTb2fXmgkHP0RHHRzIi2fPJNOUzIUge+VrLC/+nr6b9cXk=
X-Gm-Gg: ASbGncsfzq/qm/6EEYCECe8cuBnQyGRgKGO0rdls4pH7/blIhj3qK7fLgumQ5XIuB2i
	yEpGoLXNpMVOjkxD2cL55kdvSWRF5FcPy/G6poUogzmowWSoF0SK45DQSTnLTr8OFFR+bgCj9yN
	UwAn0DUzdonEOAyFhhc4YL1n7Bo8ikEoF1PhmSdgUaZs57IRxap9zQMNTYxWMShgFm3x3/des9w
	MaKs9QmCKdathuDMg5+baM5r83+nHWwAoGgPPiilA2kERnus2D++EbedD5DD3Ba3fIHh8lo6yuE
	7YN0CiuhQ1k9zuoCVtam0p3d1/Fozb2LFVxo7fYR2eFO5yCvdkJGw0qUUMn6rPC493Mwu7ruYTc
	uKohdrI0pt/AoQyB4nBOq0g==
X-Google-Smtp-Source: AGHT+IHFfRslU2JdUQwTEst4+2qv7pFwoUnipsx+0jTm3bc3ZWeEjmqIo+cvUGJbAhVMc0O3WiescQ==
X-Received: by 2002:ad4:4eaa:0:b0:6fa:cb05:b455 with SMTP id 6a1803df08f44-6fb3e5fda72mr39185896d6.35.1749814918080;
        Fri, 13 Jun 2025 04:41:58 -0700 (PDT)
Received: from fedora.. (cpe-109-60-82-18.zg3.cable.xnet.hr. [109.60.82.18])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-6fb35b3058fsm20558206d6.37.2025.06.13.04.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:41:57 -0700 (PDT)
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
Subject: [PATCH v7 1/6] arm64: lan969x: Add support for Microchip LAN969x SoC
Date: Fri, 13 Jun 2025 13:39:36 +0200
Message-ID: <20250613114148.1943267-2-robert.marko@sartura.hr>
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

This adds support for the Microchip LAN969x ARMv8-based SoC switch family.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Daniel Machon <daniel.machon@microchip.com>
---
 arch/arm64/Kconfig.platforms | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index a541bb029aa4..834910f11864 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -133,6 +133,20 @@ config ARCH_SPARX5
 	  security through TCAM-based frame processing using versatile
 	  content aware processor (VCAP).
 
+config ARCH_LAN969X
+	bool "Microchip LAN969X SoC family"
+	select PINCTRL
+	select DW_APB_TIMER_OF
+	help
+	  This enables support for the Microchip LAN969X ARMv8-based
+	  SoC family of TSN-capable gigabit switches.
+
+	  The LAN969X Ethernet switch family provides a rich set of
+	  switching features such as advanced TCAM-based VLAN and QoS
+	  processing enabling delivery of differentiated services, and
+	  security through TCAM-based frame processing using versatile
+	  content aware processor (VCAP).
+
 config ARCH_K3
 	bool "Texas Instruments Inc. K3 multicore SoC architecture"
 	select PM_GENERIC_DOMAINS if PM
-- 
2.49.0


