Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9F75693818
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Feb 2023 16:41:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbjBLPlo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Feb 2023 10:41:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbjBLPlh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Feb 2023 10:41:37 -0500
Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45BE01285A;
        Sun, 12 Feb 2023 07:41:36 -0800 (PST)
Received: from robin.home.jannau.net (p579ad32f.dip0.t-ipconnect.de [87.154.211.47])
        by soltyk.jannau.net (Postfix) with ESMTPSA id B048926F783;
        Sun, 12 Feb 2023 16:41:34 +0100 (CET)
From:   Janne Grunau <j@jannau.net>
To:     Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mark Kettenis <kettenis@openbsd.org>
Cc:     asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: [PATCH 12/17] dt-bindings: i2c: apple,i2c: Add apple,t8112-i2c compatible
Date:   Sun, 12 Feb 2023 16:41:22 +0100
Message-Id: <20230202-asahi-t8112-dt-v1-12-cb5442d1c229@jannau.net>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230202-asahi-t8112-dt-v1-0-cb5442d1c229@jannau.net>
References: <20230202-asahi-t8112-dt-v1-0-cb5442d1c229@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=888; i=j@jannau.net; h=from:subject:message-id; bh=GaccuGqSFZ+kRH1Vtme6IeBfNnC5UeTcePpsKodussA=; b=owGbwMvMwCG2UNrmdq9+ahrjabUkhuSX7CfcDDwtBNkLGA7LdU/+K5KvWZi6g13v7cR/0Yzzl l7q6fbuKGVhEONgkBVTZEnSftnBsLpGMab2QRjMHFYmkCEMXJwCMJFJBxkZFsq0uJh8ERItj1YR bpnWkviPIfb5bKtdcrvXvT0zffpZAYb/CT27l/M9W+WeeYWz+9M926mSka6PTk99PHXN20tmG/1 5eQA=
X-Developer-Key: i=j@jannau.net; a=openpgp; fpr=8B336A6BE4E5695E89B8532B81E806F586338419
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This block on the Apple M2 is compatible with the existing driver so
just add the per-SoC compatible.

Signed-off-by: Janne Grunau <j@jannau.net>

---
This trivial dt-bindings update should be merged through the asahi-soc
tree to ensure validation of the Apple M2 (t8112) devicetrees in this
series.
---
 Documentation/devicetree/bindings/i2c/apple,i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
index 4ac61fec90e2..3f0e94189f2d 100644
--- a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
@@ -23,6 +23,7 @@ properties:
     items:
       - enum:
           - apple,t8103-i2c
+          - apple,t8112-i2c
           - apple,t6000-i2c
       - const: apple,i2c
 

-- 
2.39.1

