Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6758172E99
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Jul 2019 14:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728121AbfGXMQX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Jul 2019 08:16:23 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:49252 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727786AbfGXMQX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Jul 2019 08:16:23 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 1D68C25BE4A;
        Wed, 24 Jul 2019 22:16:14 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 0C254E220F4; Wed, 24 Jul 2019 14:16:12 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chris Brandt <chris.brandt@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 2/4] dt-bindings: i2c: rcar: Rename bindings documentation file
Date:   Wed, 24 Jul 2019 14:15:57 +0200
Message-Id: <20190724121559.19079-3-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190724121559.19079-1-horms+renesas@verge.net.au>
References: <20190724121559.19079-1-horms+renesas@verge.net.au>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Rename the bindings documentation file for R-Car I2C controller
from i2c-rcar.txt to renesas,rcar.txt.

This is part of an ongoing effort to name bindings documentation files for
Renesas IP blocks consistently, in line with the compat strings they
document.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 Documentation/devicetree/bindings/i2c/{i2c-rcar.txt => renesas,i2c.txt} | 0
 MAINTAINERS                                                             | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/i2c/{i2c-rcar.txt => renesas,i2c.txt} (100%)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-rcar.txt b/Documentation/devicetree/bindings/i2c/renesas,i2c.txt
similarity index 100%
rename from Documentation/devicetree/bindings/i2c/i2c-rcar.txt
rename to Documentation/devicetree/bindings/i2c/renesas,i2c.txt
diff --git a/MAINTAINERS b/MAINTAINERS
index 4c8262837da9..b8c1181baea9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13650,7 +13650,7 @@ F:	drivers/iio/adc/rcar-gyroadc.c
 RENESAS R-CAR I2C DRIVERS
 M:	Wolfram Sang <wsa+renesas@sang-engineering.com>
 S:	Supported
-F:	Documentation/devicetree/bindings/i2c/i2c-rcar.txt
+F:	Documentation/devicetree/bindings/i2c/renesas,i2c.txt
 F:	Documentation/devicetree/bindings/i2c/renesas,iic.txt
 F:	drivers/i2c/busses/i2c-rcar.c
 F:	drivers/i2c/busses/i2c-sh_mobile.c
-- 
2.11.0

