Return-Path: <linux-i2c+bounces-2296-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C638769E9
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 18:29:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E519CB230F9
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 17:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8639C5B5AE;
	Fri,  8 Mar 2024 17:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OPJtjOFX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A496C5A4D3;
	Fri,  8 Mar 2024 17:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709918900; cv=none; b=WoGmOOSxya3LNWkP2xRMj34QO7v8/66bY6CWb2qRmH2c7ey92ZTlwAmyWJSghzWg7BVWty2J3svF36GjxTlVXOv5NXP2ew7TR01CDyll8L66832zAvJWKcMsyZ4++co/Vts0MFJXwR6hWs2HIEDPk9UI+1jMFjCv6/89FDCVwGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709918900; c=relaxed/simple;
	bh=ZFyhMebXncZKG1nTfAjv5cXd0xT6hnBUMy6tl1hDMYQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qDrPsPea35abehZiED9vnzBj9ydVUWXpyx6sYLtPWfHe5ZrjifztlokrvvbbcqjbOIxKzRLI46OwlLKrhxlbtn/4PXU4nhY/R7HY7/oFLfwxx3bdlAA2TMfSnOaR7O3Kieh+0cypuqlqwSgUlS9zFkKAkZmyv3CUM9kcgJxhaOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OPJtjOFX; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-41312232c7aso11223755e9.0;
        Fri, 08 Mar 2024 09:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709918897; x=1710523697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Ein8NH1oPEXg+kxZrqFMKuNKb3lh44GWcHeiabOaFY=;
        b=OPJtjOFXMGjaSHWgwGKjm59g+E+OmmrCBedEiOUZbwchawX/e8JJgotWRLHwkPo5q/
         wDWm8iME31gA+4oK+aRtAcVycpDXacLHXpvhNSVpZq0IPTPes2O/B0aGEZJzunUlSurI
         laAqcuXjNlKYsx76D7zCC7u9rDLfYSgFE289GsGOlVkVz4UnNZdL0VKBPRKvUW3TMdSh
         KcOpc7DjQq8V8+SIeaEgu/QP76I5EcqtNhvnHLJOpzBNzw7eyd7o+aO0y/bfBZzAGpQm
         AmPXapYCoshfU6WKv0+tVe2oqr6K/SVd4H7VGU6EqS12iSlekWJRHrn1vHJYDTb8OvSD
         cNAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709918897; x=1710523697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Ein8NH1oPEXg+kxZrqFMKuNKb3lh44GWcHeiabOaFY=;
        b=vcJgPcG5+xBPDql9bID2Ej2QirtxY7fqvbQmwXBQwojyOF0dMemggmrp/Q/2jnSgqY
         QDhdh6kbxlEauhQ7FlTXil9LiFaOKdtzvBpHg7t3SryqR7OSvDhfyd7/w8w/UZjXXXKS
         3/5BQcXS/5aFteuvMWDUAlCHgB9lWRfXUmqp9YYBaNdGRb6Hmv0NUklsqEs9qqswtS32
         xrAoCDI/XcD1tqNVcOQtykwNdohsAzHc/xlhk30jutgojRTzgfSbaJiJt+PH64zU/DRt
         UV1S0Xd+td30608h6NsGa48owWfpbUUqGqtJf0tnAOhynoUdpm3qZ6s9xc9rin1O6SmT
         65SQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO2iq1bfn4Pu3iUaDq8REAGZXPlpXnxvvAb8JkJ5rp1wd7mFSi+qLwwEjwy3HagRwKo+86IK5CCF6cad+oaqxkyuu+fCLEarnfsS3BDUyA6/i07nyOsXEEeBYrwN8KonOu6VuPsctSW8gn8uufGg5xNU1aEPEk/iXx5vIBs9aYoBTgcQ==
X-Gm-Message-State: AOJu0YzAWgkeHFVPnnPGGaROQHr4FLtw0IKXZB3sEXjZWscuS/ebcAvD
	NUVhObobKKRJxpZddjqqA5sZEdmvvnBlTYHOleQHDEWYWxiASSE0
X-Google-Smtp-Source: AGHT+IHEA1lBo+eZJhir2sUKspEOmBhZljzrcl/86cQKA5oYV1dWULlrO77zDuKum9uYDWzQPnayRw==
X-Received: by 2002:adf:9589:0:b0:33e:1de4:59bb with SMTP id p9-20020adf9589000000b0033e1de459bbmr949192wrp.23.1709918896984;
        Fri, 08 Mar 2024 09:28:16 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2500:a01:3c2e:cd45:f50f:f083])
        by smtp.gmail.com with ESMTPSA id jh3-20020a05600ca08300b0041304100fa9sm6445317wmb.45.2024.03.08.09.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 09:28:16 -0800 (PST)
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
Subject: [PATCH 5/5] i2c: riic: Add support for R9A09G057 SoC
Date: Fri,  8 Mar 2024 17:27:26 +0000
Message-Id: <20240308172726.225357-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240308172726.225357-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240308172726.225357-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Extend the RIIC driver to support the RZ/V2H ("R9A09G057") SoC. It
accomplishes this by appending the compatible string list and passing
the RZ/V2H-specific OF data.

Additionally, this patch introduces an riic_family enum for SoC variants,
replacing macro previously used.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 drivers/i2c/busses/i2c-riic.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 3398d639b754..fc814a4f06a6 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -75,7 +75,10 @@
 
 #define RIIC_INIT_MSG	-1
 
-#define RIIC_RZ_A_TYPE	0
+enum riic_family {
+	RIIC_RZ_A_TYPE = 0,
+	RIIC_RZ_V2H_TYPE,
+};
 
 struct riic_of_data {
 	u8 family;
@@ -526,8 +529,26 @@ static const struct riic_of_data riic_rz_a_info = {
 	},
 };
 
+static const struct riic_of_data riic_rz_v2h_info = {
+	.family = RIIC_RZ_V2H_TYPE,
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


