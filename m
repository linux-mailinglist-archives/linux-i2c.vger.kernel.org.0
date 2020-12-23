Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 134BB2E1FEA
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Dec 2020 18:26:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbgLWR0D (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Dec 2020 12:26:03 -0500
Received: from www.zeus03.de ([194.117.254.33]:42310 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726855AbgLWRZu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 23 Dec 2020 12:25:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=bFZHVNr/wLE5t3
        3ExpleTFxbiH3fS6rd+dcM1J0TmwM=; b=P5sr6/6A863pAt6pc72yscDf5LxWoB
        1vdLcD+JeR60pvsn/U7QTXcMfDYIiBktIWxC8f+IuPcbz3mtJ6oO5/ojrs4CrAIY
        iyUgGdR/o/7BbPkmkEBPrkpq6sWdAM665rOtHOULB3dN1LmBivJhLoG3Axwjc3AS
        V7Q9zfwjYDsBw=
Received: (qmail 544577 invoked from network); 23 Dec 2020 18:25:08 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Dec 2020 18:25:08 +0100
X-UD-Smtp-Session: l3s3148p1@tdkH+SS3yOdUhszw
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: i2c: renesas,i2c: add r8a779a0 (V3U) support
Date:   Wed, 23 Dec 2020 18:25:00 +0100
Message-Id: <20201223172505.34736-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201223172505.34736-1-wsa+renesas@sang-engineering.com>
References: <20201223172505.34736-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/devicetree/bindings/i2c/renesas,i2c.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,i2c.txt b/Documentation/devicetree/bindings/i2c/renesas,i2c.txt
index 96d869ac3839..5762d2d1ab9c 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,i2c.txt
+++ b/Documentation/devicetree/bindings/i2c/renesas,i2c.txt
@@ -26,6 +26,7 @@ Required properties:
 	"renesas,i2c-r8a77980" if the device is a part of a R8A77980 SoC.
 	"renesas,i2c-r8a77990" if the device is a part of a R8A77990 SoC.
 	"renesas,i2c-r8a77995" if the device is a part of a R8A77995 SoC.
+	"renesas,i2c-r8a779a0" if the device is a part of a R8A779A0 SoC.
 	"renesas,rcar-gen1-i2c" for a generic R-Car Gen1 compatible device.
 	"renesas,rcar-gen2-i2c" for a generic R-Car Gen2 or RZ/G1 compatible
 				device.
-- 
2.28.0

