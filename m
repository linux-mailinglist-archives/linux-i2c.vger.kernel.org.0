Return-Path: <linux-i2c+bounces-2409-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 751CE87FECF
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Mar 2024 14:27:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B8CA28415A
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Mar 2024 13:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 950C181723;
	Tue, 19 Mar 2024 13:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cwhp4kuW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC1380BEE;
	Tue, 19 Mar 2024 13:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710854776; cv=none; b=bE1PqhuexV5Uzat46v6eyGWWzVv+C331kMq8fee5iQ9v/6NK0iMkXHITZ2Up1aLG09uhdXFjNGTFeBsSLWEDb0+DsG15ttum0CMyYdinAnCrPvGs4PxEZ3T7dSCyX9Z3QZlJqJ7pv8l8XfU6SSkm0niZ4jC/IU3REj1PnE6m760=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710854776; c=relaxed/simple;
	bh=zyf35AWjwJVWN4lSkKVxjbx8Q+WLHTyWySG2Oz6ya3c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fdwEFBazbxSkt2qCV/W8PsrW4m6eCNc4IkKFxYV8/5/H4yZJhDD5SgCLSncl1HiOIyyJhL01OWqI4YEmsqJ7TS10XXTddqt7h6IshsvdcdCmgS/2u+lr+p0Yg7E5+MmKg3sv1gZhn27aTKkVwjSSLh8yshCauzqW9OSDhRm9ZNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cwhp4kuW; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-33ed5b6bf59so2351738f8f.0;
        Tue, 19 Mar 2024 06:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710854773; x=1711459573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3Mhygj/rxLtP2YXUZb1QboMB4GZUYUnTVqg7wvePG8=;
        b=Cwhp4kuWBSolmPN5DNXnjH0GfAUOUrlb7Taw+1MJdRmvMwqKsiUA/zk3hlan37+Kln
         o+TdKkwdJgVIUI8RQ8ikx7D0atoxxtkbMP3FLghiD+d1IB6wVEs1z9w309Gm8tx1IYre
         tfsyjyVeWKo81Kt8QpUXWoOr5ZdUaeiwXawaFSSuTBtm3R2Ra7XdI2Y3TWtsoaUfo3Xn
         239yHmAbDlVqITWdOTgyUyVCj1MUZavwq5G1NT6w1zUULdN2tS5yEVnx6c45zyItwkt9
         iLOcFk+TikolWMU2dzKWvC1pxz4BG22lIBtKO9bfcYhtNH5fEkByO5nU/6TrMK/XMe0F
         Ejdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710854773; x=1711459573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3Mhygj/rxLtP2YXUZb1QboMB4GZUYUnTVqg7wvePG8=;
        b=E0rc51oMyVx4PEU8FnNzKGHDFLpLA7QjWHAAlW3K9zdYqjCLnzXDp9I9CqPq5L2cBP
         JiBWMVUaYFz63VDDefjihQeK6kEYdDMNm00VKZ43TQ7HrgD5dEPVeHOsEFyu0fdnqZMN
         qOpqdYPreZxgyR17tY4n82cHLAU6ADjpozFtqkIrKwL8momUEpwV54IKm8uu6eGCREkw
         KbnrTLw1jLPEbChW54WZSU7kKDdrOVf1tSS5Fe95pxmFJhwfaJh17bOsIpH/nnRBywvr
         it55jpd2PeQyc6aAoQrulBYWJ7m0CnoAVQ2hWmCTFBlB833d79u0yZ7ZuhsWrWJBugAX
         ii1g==
X-Forwarded-Encrypted: i=1; AJvYcCX4nYs9cqUy8HgYdBALUcWOQhAXdlbvOlx1mrTGtc5yu3kmlAoMO9mfqUL7pf6Ka7IZ/d4sHZnQbBlrCUCRyZKHxkVG/oS47LxGqHdogO0othgmu7PXopkXMA8Tdorjb2N9fVeKuZGWgdIb0/K0PlMdjKzY298FxwHLU+Gk0M21EA8dKA==
X-Gm-Message-State: AOJu0YwkZCGT0xyQyfPsdhtwxrdLQZtBiudE3L4LVSDQoZHnx+AQAhRp
	ypXRPCqvqX/Q32lxp1k2oAKn98nKMmkHKzbFIPXOuP1I6/V1PcaD
X-Google-Smtp-Source: AGHT+IFydxC5NuctU+hKbLJWFaYV3qNTT/ku8iDYt845BalL0Iee0cZsmVE4cnw9LW6UMQUdqMKCDA==
X-Received: by 2002:a5d:6086:0:b0:33e:d448:e48c with SMTP id w6-20020a5d6086000000b0033ed448e48cmr8578130wrt.15.1710854772907;
        Tue, 19 Mar 2024 06:26:12 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:3c11:2c6f:3ba9:bab])
        by smtp.gmail.com with ESMTPSA id g4-20020adfe404000000b0033dd2a7167fsm12370020wrm.29.2024.03.19.06.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 06:26:12 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 4/4] i2c: riic: Add support for R9A09G057 SoC
Date: Tue, 19 Mar 2024 13:25:03 +0000
Message-Id: <20240319132503.80628-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240319132503.80628-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240319132503.80628-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Extend the RIIC driver to support the RZ/V2H(P) ("R9A09G057") SoC. It
accomplishes this by appending the compatible string list and passing
the RZ/V2H-specific OF data.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3
- Included RB tag from Geert

v1->v2
- Dropped setting family
---
 drivers/i2c/busses/i2c-riic.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 3cd5033286ca..f608b1838cad 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -523,8 +523,25 @@ static const struct riic_of_data riic_rz_a_info = {
 	},
 };
 
+static const struct riic_of_data riic_rz_v2h_info = {
+	.regs = {
+		[RIIC_ICCR1] = 0x00,
+		[RIIC_ICCR2] = 0x01,
+		[RIIC_ICMR1] = 0x02,
+		[RIIC_ICMR3] = 0x04,
+		[RIIC_ICSER] = 0x06,
+		[RIIC_ICIER] = 0x07,
+		[RIIC_ICSR2] = 0x09,
+		[RIIC_ICBRL] = 0x10,
+		[RIIC_ICBRH] = 0x11,
+		[RIIC_ICDRT] = 0x12,
+		[RIIC_ICDRR] = 0x13,
+	},
+};
+
 static const struct of_device_id riic_i2c_dt_ids[] = {
 	{ .compatible = "renesas,riic-rz", .data = &riic_rz_a_info },
+	{ .compatible = "renesas,riic-r9a09g057", .data = &riic_rz_v2h_info },
 	{ /* Sentinel */ },
 };
 
-- 
2.34.1


