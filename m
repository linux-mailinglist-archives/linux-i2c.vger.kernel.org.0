Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BC1DCB599
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Oct 2019 10:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730723AbfJDIA2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Oct 2019 04:00:28 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:51618 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725932AbfJDIA1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Oct 2019 04:00:27 -0400
X-IronPort-AV: E=Sophos;i="5.67,255,1566831600"; 
   d="scan'208";a="28064819"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 04 Oct 2019 17:00:26 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 67F834007544;
        Fri,  4 Oct 2019 17:00:23 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] dt-bindings: i2c: rcar: Add r8a774b1 support
Date:   Fri,  4 Oct 2019 08:59:58 +0100
Message-Id: <1570175998-50891-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Document RZ/G2N (R8A774B1) I2C compatibility with the relevant driver
dt-bindings.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
V1-->V2
 * Rebased on top of next.
---
 Documentation/devicetree/bindings/i2c/renesas,i2c.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,i2c.txt b/Documentation/devicetree/bindings/i2c/renesas,i2c.txt
index 3ee5e8f..0660a3e 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,i2c.txt
+++ b/Documentation/devicetree/bindings/i2c/renesas,i2c.txt
@@ -7,6 +7,7 @@ Required properties:
 	"renesas,i2c-r8a7745" if the device is a part of a R8A7745 SoC.
 	"renesas,i2c-r8a77470" if the device is a part of a R8A77470 SoC.
 	"renesas,i2c-r8a774a1" if the device is a part of a R8A774A1 SoC.
+	"renesas,i2c-r8a774b1" if the device is a part of a R8A774B1 SoC.
 	"renesas,i2c-r8a774c0" if the device is a part of a R8A774C0 SoC.
 	"renesas,i2c-r8a7778" if the device is a part of a R8A7778 SoC.
 	"renesas,i2c-r8a7779" if the device is a part of a R8A7779 SoC.
-- 
2.7.4

