Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BACBB372C83
	for <lists+linux-i2c@lfdr.de>; Tue,  4 May 2021 16:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231694AbhEDOwe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 May 2021 10:52:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231653AbhEDOwW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 May 2021 10:52:22 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 337F2C061347
        for <linux-i2c@vger.kernel.org>; Tue,  4 May 2021 07:51:18 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:1ca1:e52f:3ec5:3ac5])
        by xavier.telenet-ops.be with bizsmtp
        id 0erG2500m3aEpPb01erGGQ; Tue, 04 May 2021 16:51:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ldwOK-002nxc-8B; Tue, 04 May 2021 16:51:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ldwOJ-00HQUW-5L; Tue, 04 May 2021 16:51:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chris Brandt <chris.brandt@renesas.com>
Cc:     devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/6] dt-bindings: i2c: renesas,i2c: Drop "renesas,i2c-rcar"
Date:   Tue,  4 May 2021 16:51:09 +0200
Message-Id: <3628120234ef0fbc26cba14e62ff8468bfb961fa.1620138454.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620138454.git.geert+renesas@glider.be>
References: <cover.1620138454.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The compatible value "renesas,i2c-rcar" was deprecated in commit
ad4a8dc3fec6485b ("i2c: rcar: Add per-Generation fallback bindings"),
and never had any users in upstream Linux.  Drop its description from
the DT bindings.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/i2c/renesas,i2c.txt | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,i2c.txt b/Documentation/devicetree/bindings/i2c/renesas,i2c.txt
index 5762d2d1ab9c9658..f4240fcf28bbf6eb 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,i2c.txt
+++ b/Documentation/devicetree/bindings/i2c/renesas,i2c.txt
@@ -32,7 +32,6 @@ Required properties:
 				device.
 	"renesas,rcar-gen3-i2c" for a generic R-Car Gen3 or RZ/G2 compatible
 				device.
-	"renesas,i2c-rcar" (deprecated)
 
 	When compatible with the generic version, nodes must list the
 	SoC-specific version corresponding to the platform first followed
-- 
2.25.1

