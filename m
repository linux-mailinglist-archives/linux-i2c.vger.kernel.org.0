Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF0C55F8A8C
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Oct 2022 12:24:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbiJIKYB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 9 Oct 2022 06:24:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229909AbiJIKX7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 9 Oct 2022 06:23:59 -0400
X-Greylist: delayed 437 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 09 Oct 2022 03:23:58 PDT
Received: from mxout4.routing.net (mxout4.routing.net [IPv6:2a03:2900:1:a::9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C0372D764
        for <linux-i2c@vger.kernel.org>; Sun,  9 Oct 2022 03:23:58 -0700 (PDT)
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
        by mxout4.routing.net (Postfix) with ESMTP id 7197D100760;
        Sun,  9 Oct 2022 10:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
        s=20200217; t=1665310600;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QXyT5YJN3+YDge821n8shwosjTB85QzSw4HLxnCUVGs=;
        b=U2yzhoSTMA3GyM1JtA1oLJCzofHTxU8KUHrqOAxhzydQlvcMEW/FsGUg+0c8QAYnb7tme8
        kY6LyVSZo9T3yvqo9Hf+hsAsynu4HYYHJW4fGaXnkCvwov1zfkSF09vfLaKQ4MQ5m2Af7e
        7P3BPuacBCysuRDxt+aAwoqm115uWdU=
Received: from frank-G5.. (fttx-pool-217.61.145.235.bambit.de [217.61.145.235])
        by mxbox2.masterlogin.de (Postfix) with ESMTPSA id AF9C410072A;
        Sun,  9 Oct 2022 10:16:39 +0000 (UTC)
From:   Frank Wunderlich <linux@fw-web.de>
To:     linux-mediatek@lists.infradead.org
Cc:     Frank Wunderlich <frank-w@public-files.de>,
        Qii Wang <qii.wang@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: i2c: update bindings for mt7986 soc
Date:   Sun,  9 Oct 2022 12:16:30 +0200
Message-Id: <20221009101631.82380-2-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221009101631.82380-1-linux@fw-web.de>
References: <20221009101631.82380-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 2c477d1d-b694-4206-b5ee-c08fdc400734
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Frank Wunderlich <frank-w@public-files.de>

Add i2c compatible for MT7986 SOC.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
index 4e730fb7be56..421563bf576c 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
@@ -23,6 +23,7 @@ properties:
       - const: mediatek,mt6577-i2c
       - const: mediatek,mt6589-i2c
       - const: mediatek,mt7622-i2c
+      - const: mediatek,mt7986-i2c
       - const: mediatek,mt8168-i2c
       - const: mediatek,mt8173-i2c
       - const: mediatek,mt8183-i2c
-- 
2.34.1

