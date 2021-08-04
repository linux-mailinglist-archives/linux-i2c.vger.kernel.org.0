Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46C593E08B6
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Aug 2021 21:25:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239579AbhHDTZa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Aug 2021 15:25:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234206AbhHDTZ3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 Aug 2021 15:25:29 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0073C061799;
        Wed,  4 Aug 2021 12:25:14 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id m10-20020a17090a34cab0290176b52c60ddso4983595pjf.4;
        Wed, 04 Aug 2021 12:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZWomF5/fzK3db4iTJOXBkuDt8WfI66mEwZOt7zpgRsU=;
        b=Vhdd4xnDDMm07B0eakwprt00gDOqJZU6tg+o9WR7fvwFKeSHmyIzGtZqW+gF1Au5b2
         H423GJSa1FH9XgbE1zwTPVa3N9VdMEDQiOJPG2fhvcPWOpMof3Ky8MSUssWdAR83nei6
         alyRKnlBq3u52egXc8mfmW2PXf3qgpqitAJvPM60kllhWEFt0aLE3A5oMK4qyHzD+dTB
         JHVsmPTfOmOAZgRvtXvqtrYQVvnNCe8NCHw2Y6IJNBgKPsUZ0h13t+tkxqVt0uKH62dp
         7kQBnIEUCQ+G7FSjaVsZCcG/HnYyTmtPzkXWMu7WF6wbY8f7lpWm7KhvrPOxM4hfczi8
         0upA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ZWomF5/fzK3db4iTJOXBkuDt8WfI66mEwZOt7zpgRsU=;
        b=L4NvS7uM0ATiPngjW/g+bNh4u09nlgPWjn5hIOGG213Jo5rz6zk4I7kgDnVFkeOIFC
         JA5m7TMvhSRzIb/egYAMlEMe/6up4zwByl/OC2s4n0cpIpzagJZw+Myts17or07jWNG5
         l1mOJxxosCXN5jbgFCTJnA8WCGI0RgjXSry0Y3B+3bnMLx9eqi82f/7Y4eeb+qtLGQ6R
         +cKzC+24JA+6MbNv70G/uE49Ejh2keDXva6TJs7dw2yR+5X+4MpPcomJSMuiQQO3WBk6
         i5mlAJAMAsrkIbbyVH4WUK18/KtS4JSmoOdx8u9JpgEJGGRIX3F1jtV57nCS9b0giGLK
         uqkw==
X-Gm-Message-State: AOAM5300dgw5P5nOlToT5OKyX7yGoTOEGsZk7oiCBkpqRvqxrofxrJi2
        hfx7uzPenqPhGX+4HJj7/EA=
X-Google-Smtp-Source: ABdhPJxZKtQ0om5vlEBR2OnqwEVYpIccXxcMBK3JcLg18N8ZzfFLjdaNDeCWCQJrsjNV31XhxGK5ow==
X-Received: by 2002:a17:902:bf46:b029:12c:75f6:f643 with SMTP id u6-20020a170902bf46b029012c75f6f643mr697560pls.6.1628105114454;
        Wed, 04 Aug 2021 12:25:14 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:2003:b021:6001:8ce1:3e29:705e])
        by smtp.gmail.com with ESMTPSA id e4sm1071027pgt.22.2021.08.04.12.25.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Aug 2021 12:25:14 -0700 (PDT)
From:   Raag Jadav <raagjadav@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Raag Jadav <raagjadav@gmail.com>
Subject: [PATCH v2 1/2] arm64: dts: ls1046a: fix eeprom entries
Date:   Thu,  5 Aug 2021 00:54:45 +0530
Message-Id: <1628105086-8172-2-git-send-email-raagjadav@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1628105086-8172-1-git-send-email-raagjadav@gmail.com>
References: <1628105086-8172-1-git-send-email-raagjadav@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

ls1046afrwy and ls1046ardb boards have CAT24C04[1] and CAT24C05[2]
eeproms respectively. Both are 4Kb (512 bytes) in size,
and compatible with AT24C04[3].
Remove multi-address entries, as both the boards have a single chip each.

[1] https://www.onsemi.com/pdf/datasheet/cat24c01-d.pdf
[2] https://www.onsemi.com/pdf/datasheet/cat24c03-d.pdf
[3] https://ww1.microchip.com/downloads/en/DeviceDoc/doc0180.pdf

Signed-off-by: Raag Jadav <raagjadav@gmail.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dts | 8 +-------
 arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts  | 7 +------
 2 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dts
index db3d303..6d22efb 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dts
@@ -83,15 +83,9 @@
 			};
 
 			eeprom@52 {
-				compatible = "atmel,24c512";
+				compatible = "onnn,cat24c04", "atmel,24c04";
 				reg = <0x52>;
 			};
-
-			eeprom@53 {
-				compatible = "atmel,24c512";
-				reg = <0x53>;
-			};
-
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
index 60acdf0..7025aad 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
@@ -59,14 +59,9 @@
 	};
 
 	eeprom@52 {
-		compatible = "atmel,24c512";
+		compatible = "onnn,cat24c05", "atmel,24c04";
 		reg = <0x52>;
 	};
-
-	eeprom@53 {
-		compatible = "atmel,24c512";
-		reg = <0x53>;
-	};
 };
 
 &i2c3 {
-- 
2.7.4

