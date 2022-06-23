Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B618557FD8
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jun 2022 18:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231987AbiFWQb7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jun 2022 12:31:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231193AbiFWQbr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Jun 2022 12:31:47 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C01FB46B32;
        Thu, 23 Jun 2022 09:31:46 -0700 (PDT)
Received: from jupiter.universe (unknown [95.33.159.255])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: sre)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 78C6F66017E7;
        Thu, 23 Jun 2022 17:31:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1656001905;
        bh=sn5EgbuebsC5sj9x597tVnHtLZq99Obp6jUYVfxzKNI=;
        h=From:To:Cc:Subject:Date:From;
        b=EssX3KBCfrGxvxrbPBoNpHrV6gvrQguoeot2m5+BR4zgQYfK+gDwT6YrvOmR6CQtx
         PSPH8UnwOn4/lARgGLYi8k0A3EXnbg8FNOHtC1RT3MloKdK8Ddtj7w+7aKo/RwWN/E
         czFvSd6uo1hJ49b7DH6YKPg2Jg2KpKDdbRM7aMBPr2m24zsPiIpQ2wPjLNHpK/7WcM
         pDrauGnmaOVH1OiW3w+BE1Z5lfU6KmbkAskPGQF5juVpnRNwuE3/2pv+lDr9lYXc3V
         ARo954b3WFrPhPj1xAZSnizrLB5BmWzj2Kh/oQdYH7GusjolJNokw6VmOpAOMmjZk1
         3MVWvqFL4Hs4w==
Received: by jupiter.universe (Postfix, from userid 1000)
        id E4A0E480122; Thu, 23 Jun 2022 18:31:42 +0200 (CEST)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        kernel@collabora.com
Subject: [PATCH 1/1] dt-bindings: i2c: i2c-rk3x: add rk3588 compatible
Date:   Thu, 23 Jun 2022 18:31:36 +0200
Message-Id: <20220623163136.246404-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Just like RK356x, RK3588 is compatible to the existing rk3399 binding.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
index 5339dd4fc370..2f79f6d57e2d 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
@@ -37,6 +37,7 @@ properties:
               - rockchip,rk3308-i2c
               - rockchip,rk3328-i2c
               - rockchip,rk3568-i2c
+              - rockchip,rk3588-i2c
           - const: rockchip,rk3399-i2c
 
   reg:
-- 
2.35.1

