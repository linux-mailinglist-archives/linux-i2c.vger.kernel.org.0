Return-Path: <linux-i2c+bounces-4922-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 698AC92E795
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 13:54:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 227E12881FF
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 11:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11EF3163A9B;
	Thu, 11 Jul 2024 11:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qwfDhuAA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5336A16088F
	for <linux-i2c@vger.kernel.org>; Thu, 11 Jul 2024 11:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720698755; cv=none; b=dkZ+ZaYD3sY1PTHeT9rrNvvjDz/q6UhvcWOTuoblQkg5UbWnLN9/sPmy2z4lsF2CwT+7j6CoCtPfSTBPqKcv2fL/biUs1/YLAb60jLqxCNvzgoj7Af4RoDXi9ex6jcGTPh7f34qu2UPps9UuTDmhVt4ZpVG1vGZnitkeVEpVsns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720698755; c=relaxed/simple;
	bh=0+MicTBHiUKzvnA3rZDDq9j85qpZ09p47HPHzZsgs38=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gR9IekaAuTpW04pIrE1G9z7LglkY8dbCIEBQ6XKfcicWdtimpO6EF5Q2Ah4LbPO16VIVyuOS5WDMmSDsdOUYM1DbBo4tBiuvb3Ilym1J/0vfrY5ozEU8knaV4mOUMpsrKJg5bkqpgtRSMrhPbfQ634LNpAEwXerYryAg/dYFz2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qwfDhuAA; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-36798779d75so620893f8f.3
        for <linux-i2c@vger.kernel.org>; Thu, 11 Jul 2024 04:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1720698753; x=1721303553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZBCyPn7njPR9/TVlgXLD1ap+yXkWFzpRikQNXyqWD4=;
        b=qwfDhuAAmUgYd6kdIbcXojcJsddV+Pj/auMcM0EWiQLQ/ZApnO70JQP8qoU9y232H6
         AHsfYVHH1cnfxM8gt0scrVPMkPFzk54Ib27VCgSVM9+zaTmfmIzwRRtt2TLnn54JYg25
         bbuRyPKjNYeFZqt3vDkUr/6NykMhb3U8LgguAhXCbz8YJtBaF2rQRLycDZxXtaMJdIXm
         8xoYCjRsUJ0IbceJ9f+l50zKu32LvUbWgVXFD0oVFf2SGoNsmvIWVIs41ngDJNdpS0zo
         fYRumkgE3Hznsdpnp1P/62KOlAVybYajTlym7f+NM0mjbJRolcKYAKIBbZfABjX01sPA
         6YEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720698753; x=1721303553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZBCyPn7njPR9/TVlgXLD1ap+yXkWFzpRikQNXyqWD4=;
        b=djfj9pK6gkJuzW8ge+l43ANYQjUn+5BANBcsq8ClRmhbMlfTLJb9Y75dY5WDmpUPQy
         EzQnowyrc2vqCpWTKRDLi2YwdmZI1mpcEskBtDq0PlyRPttkCMVC5TJiP/mphbCVBtl7
         z1RV/an83AHrJEM9jh+EekQUkXTa9IssaXir/nf4TWeowCzAAbQPDgep3Mx14xW4PeDs
         H5/FRadFh86Lq65qrG0Mx0wLhCXYxYUNCl8PoTz5y5zbe+gjjh9uXZtyaYJzSO/TsWvt
         aTAp/q/wJU92jTKdCi8lq+UEifnVDpSzMpBuH87PF2xyIrw9n9ZiFxVpnDrFzu0JCNRB
         DTSA==
X-Forwarded-Encrypted: i=1; AJvYcCUWaqWPJpq+/YuHkyTkzk+vYAfAUJ5sDLY3WOXpgS8of6j2eiYGljRx8lEdMezsjLSFZe6cUN/069SIRaYjxpZmsi1BYDuu0+/i
X-Gm-Message-State: AOJu0YxeCPoBSLmoGNwgJgzdJP3y7z27Ufng+slBNw8JnrS97qAO6g3A
	J8szwe7/nh0P5ifN0q+8AO0RZSzPiEaOgUFEOSTb84fY5JLmnY+0606yXxa1uHHnePMdwIIvz9+
	I
X-Google-Smtp-Source: AGHT+IHCT6dpGR1QFEm4/8GPvCs4Rsey07AX3T4PoUoukEJlV6fa1h+I+5OqhxWN6XoK14pz41/4tA==
X-Received: by 2002:adf:ec42:0:b0:366:ee01:30d6 with SMTP id ffacd0b85a97d-367cead183emr5919650f8f.49.1720698752834;
        Thu, 11 Jul 2024 04:52:32 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde891cesm7615728f8f.62.2024.07.11.04.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 04:52:32 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de,
	wsa+renesas@sang-engineering.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 07/11] dt-bindings: i2c: renesas,riic: Document the R9A08G045 support
Date: Thu, 11 Jul 2024 14:52:03 +0300
Message-Id: <20240711115207.2843133-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Document the Renesas RZ/G3S (R9A08G045) RIIC IP. This is compatible with
the version available on Renesas RZ/V2H (R9A09G075).

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- dropped the renesas,riic-no-fast-mode-plus
- updated commit description

 Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
index 7993fe463c4c..e520f06f2c39 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
+++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
@@ -25,6 +25,10 @@ properties:
               - renesas,riic-r9a07g054  # RZ/V2L
           - const: renesas,riic-rz      # RZ/A or RZ/G2L
 
+      - items:
+          - const: renesas,riic-r9a08g045   # RZ/G3S
+          - const: renesas,riic-r9a09g057
+
       - const: renesas,riic-r9a09g057   # RZ/V2H(P)
 
   reg:
-- 
2.39.2


