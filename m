Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F9BF493F39
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jan 2022 18:44:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356479AbiASRoG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jan 2022 12:44:06 -0500
Received: from mail-oi1-f182.google.com ([209.85.167.182]:41651 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243905AbiASRoF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Jan 2022 12:44:05 -0500
Received: by mail-oi1-f182.google.com with SMTP id q186so5284265oih.8;
        Wed, 19 Jan 2022 09:44:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y+0PjJbidKk9Y7mKUoUqIFxDDH6yvugcNTW6S97CIU4=;
        b=t/fA6gLXGRyERBiIPvjRnIwUAyG+/s87SY829dv3otnoFYOzKud10ZiBXxmFU75cl2
         3QqNd/MII5Ym8ICf217IKI2zOFkSFBRrvTTD3eO8d5n7Ki3/6gr/ZOkjP5b89H8eEMoy
         Rwt6BrbZrHs+IxM04c9f4ePx1wG83DiYfay9hIApFmzOOHa5HYfkM2xl5QkMgazqp4e0
         m5aY11/DTid1fVRCWkJgR03XGqB8Jmx+Ue5CN4w9RY5W2CVu+6SeyKdp5sOoh5viqcU7
         DVKemxlwcKvThaaScAf4JDf0w8iXxA67ofQzQTj2IIlbhVTuX0fclsgqASKoZ59xajHf
         IjeQ==
X-Gm-Message-State: AOAM530Sfl0MlplqQFVeA2Jlky6Nyqnc/GQV51eBD045H8hE7s+xohYk
        usQAn4HqkNbvE2A9zMLGL4FO6FQJ4Q==
X-Google-Smtp-Source: ABdhPJwQl1/ek4+VKFaMEEsQnQ3yO3CfP8EsFNFnBbKBtq2R2TXi8NCUlkNUTGD0ecYmQ9fZ3xetKA==
X-Received: by 2002:a05:6808:21a3:: with SMTP id be35mr4153261oib.115.1642614244587;
        Wed, 19 Jan 2022 09:44:04 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id e6sm107902otf.58.2022.01.19.09.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 09:44:03 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: ingenic,i2c: Rework interrupts in example
Date:   Wed, 19 Jan 2022 11:43:49 -0600
Message-Id: <20220119174349.3809513-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In order to determine the number of interrupt cells in examples, the
examples will require all 'interrupts' properties to use the same number
of cells or have explicit interrupt provider node(s). As the former is
simpler, update the Ingenic example to use 2 interrupt cells everywhere.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml b/Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml
index febde6cc5f69..af6d64a6da6e 100644
--- a/Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml
@@ -69,8 +69,7 @@ examples:
       #size-cells = <0>;
       reg = <0x10054000 0x1000>;
 
-      interrupt-parent = <&intc>;
-      interrupts = <56>;
+      interrupts = <56 IRQ_TYPE_LEVEL_LOW>;
 
       clocks = <&cgu JZ4780_CLK_SMB4>;
       pinctrl-names = "default";
@@ -86,7 +85,6 @@ examples:
         compatible = "nxp,pcf8563";
         reg = <0x51>;
 
-        interrupt-parent = <&gpf>;
         interrupts = <30 IRQ_TYPE_LEVEL_LOW>;
       };
     };
-- 
2.32.0

