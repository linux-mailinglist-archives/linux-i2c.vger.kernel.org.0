Return-Path: <linux-i2c+bounces-14744-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFD2CDA782
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 21:20:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE55D304FBA3
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 20:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6C834CFB1;
	Tue, 23 Dec 2025 20:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="HUqO414M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE3D34CFD3
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 20:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521191; cv=none; b=Ss9zK3YCWToLaYje3JPIH/UyJZ7tKoCoO17fvQikMFKcSxtouhwDzeG5E0ty8+Ex1cNCiGXim5GcbUugA5dIRxhnK1eAC6Q+JZW0Ugd0mh1venyP94VMt+5YrETP5WAr3tzlO6PqzRXHDhCSUyM5kixSdpko5gzNWcBKUIpR0qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521191; c=relaxed/simple;
	bh=k/Yd1BmFzU0e9UFcJv9URIkTbmDEVBM0hOo+JTGIPAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VYMV6+GYXngiJz6nVXdxQNIrQic0w8ZxZoxTzwV6DZQ7NsEHkexuU8F2GyfRsNOKj8N/aSgTBFwGCFCIsNFRNSmFsYWn717wtzbWfMyXuVHBY62meSfL/VF1P9ew/mvLknUbQHYNYMXBwez3hCirHHXoy2EveID37Bgof5hT4BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=HUqO414M; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7b9215e55e6so3443016b3a.2
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 12:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521188; x=1767125988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cnKll+Mu3yr6wHuUg3E47hI29XfbMlTNI5VvcSPHEnI=;
        b=HUqO414MlgCB7zdxZlWKiA66FDKd7L0u1wR8AN9ttDrPg9lwMIj47NTBgAoPJEAAGa
         cY1T3OZEINElj1MhmU2gxplQO8bFLFVDU6XbeVOYavY58iOVkKZf1U1X6nA8d7ohZJjP
         qOZOYs8Gk6SKZjC85XLNMOWKy14Ax1T0wBXDOvD/yRP6sJE5+mHIVqXh049rbUOT7k9A
         TGrkqHVnIbg3geGjYDRD4LUaxT8ULeHfCeq28+wx1lfol7YmRNs5cTPUjVgyqHHlP9rO
         NNbWDDETwJXC3GEsUN1k+/pZLLqOQBCukXd3Z9lwPHHtk+UefNn1nqfNCX5qRs9AshBw
         g3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521188; x=1767125988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cnKll+Mu3yr6wHuUg3E47hI29XfbMlTNI5VvcSPHEnI=;
        b=gGb3xvwL9jXe9uX0ssBLK/He1TKWOtsqgszRc8jlgYekboXRoGUZ6ODXfNap0QUyGz
         GbJyUYUl/X9Skyj9ZG1XcGL3mEJi+0OuaHAvsxq6ePdA0itF3PH2/xrg/bMjuHNmRc73
         VSlmLTQNYgQJF9kpGdjizuZFfLm5kDW+7GbFNVyErpc/FwivAdpYHwOKjJ7ZTUwdwhc+
         LqOA3+0soSn13OArn89G1s2fXmJD9GtnRnIyshSaL9UA9edHTyys5JMS4h3MXJMH0DdA
         Z7NS6gOGu0gjp5N+GLDsZ/7KX3Uxf2W2oAC+MC6zY51ifWJW2ljSsaUvPTZu+HR5aOqs
         zRJw==
X-Forwarded-Encrypted: i=1; AJvYcCVnGhDFLrCAhIXp91LrpU5PdFaP0wgpkdWvC2rCf+dThEwsleLREW9RhL3NZ5n5VbANRRRAJX1HFZM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKR7Vs9CBgjG0kWSIGKhIWSumFzU49VG7mHwC8eixnXiQH3tcI
	ZZZYvzqQJXT4niBsHWvTfGEasjwETxG0wUro4OzTPsxJjtfU5nvxdb5eLkqyzmAxa6U=
X-Gm-Gg: AY/fxX7BP11vV5zPQ0PJwswrqQL9upTQfYUTxlFxcFGGal5XSMgoeGTmpu+D1WKOkgn
	wr9ht6BEXKRw1znWMcL7yoFHpvghVUUkEl9vq82dKQrv6hWBhyywRuHj2tEFDF75niQb89imkz9
	qKQYFHJzafpzdzMDrfJyRic3AoLT70HU2dQ/ITmqKg43fQ6Hj1L5UZSYBrKacDVU+gLWlqolxdd
	QTjDgGYOakqQrd1bF5swUj+odM6JO5pTz8vUIXmmjtaqlMweyqjvInjmN7tdWmdDV/8ArUnNl0R
	PK93D08MSvFAYexvKicvk9+eYYRJBoisF2Hq17b0424DrdVgW9cScAUy/GUSd/mU7gZoY2wymve
	oVjIHZA6G6r9mpZ8vwvxzdWQnE5pfiZ/9NOtlPGiYPTS2YYpLsbQxWy5RHuL1k8dUTodi9WuCC0
	2Hq4OBBTuK6RGIe0tUupyJqoztx+/Ebj2cochKKk2m2JUZTeTzbwI34HEgshYvnp6zG2wls/txy
	tpnBIAW
X-Google-Smtp-Source: AGHT+IE+Anjl+JtTMJZqrlQreb+g+wMpx+gUdAmyeFe7d/HK4xJHxIHW6brkXbwTDShJoU/zn1Vu9Q==
X-Received: by 2002:a05:6a20:939f:b0:366:1fea:9b54 with SMTP id adf61e73a8af0-376a96b9a4fmr12941961637.39.1766521187944;
        Tue, 23 Dec 2025 12:19:47 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:19:47 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linusw@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	olivia@selenic.com,
	radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	broonie@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	lars.povlsen@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v3 01/15] include: dt-bindings: add LAN969x clock bindings
Date: Tue, 23 Dec 2025 21:16:12 +0100
Message-ID: <20251223201921.1332786-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223201921.1332786-1-robert.marko@sartura.hr>
References: <20251223201921.1332786-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the required LAN969x clock bindings.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
* Rename file to microchip,lan9691.h

 include/dt-bindings/clock/microchip,lan9691.h | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 include/dt-bindings/clock/microchip,lan9691.h

diff --git a/include/dt-bindings/clock/microchip,lan9691.h b/include/dt-bindings/clock/microchip,lan9691.h
new file mode 100644
index 000000000000..260370c2b238
--- /dev/null
+++ b/include/dt-bindings/clock/microchip,lan9691.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_CLK_LAN9691_H
+#define _DT_BINDINGS_CLK_LAN9691_H
+
+#define GCK_ID_QSPI0		0
+#define GCK_ID_QSPI2		1
+#define GCK_ID_SDMMC0		2
+#define GCK_ID_SDMMC1		3
+#define GCK_ID_MCAN0		4
+#define GCK_ID_MCAN1		5
+#define GCK_ID_FLEXCOM0		6
+#define GCK_ID_FLEXCOM1		7
+#define GCK_ID_FLEXCOM2		8
+#define GCK_ID_FLEXCOM3		9
+#define GCK_ID_TIMER		10
+#define GCK_ID_USB_REFCLK	11
+
+/* Gate clocks */
+#define GCK_GATE_USB_DRD	12
+#define GCK_GATE_MCRAMC		13
+#define GCK_GATE_HMATRIX	14
+
+#endif
-- 
2.52.0


