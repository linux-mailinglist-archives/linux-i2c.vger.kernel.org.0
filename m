Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F0D54CB8E7
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Mar 2022 09:31:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231395AbiCCIcg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Mar 2022 03:32:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229846AbiCCIce (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Mar 2022 03:32:34 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D054D171EE4;
        Thu,  3 Mar 2022 00:31:49 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id e6so3912264pgn.2;
        Thu, 03 Mar 2022 00:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=erxXp3pM+vmnwt5dCKBDd+mcnjI272utGNSkJjQm9os=;
        b=EvqlPZpK/FhAwCgU46yyCn1/DR/GXNUx31r/geQajYQZTgcBCPj3+oQpGb8LYKaM6I
         Py+oh9eglshOwAen03eu88uDeJwzHpkqPCWBqwRQ6y86lcBdJyZIFcam/xjN5tSRcxlA
         guwfdWsbUJ6OzswbSqjRbXrkbta9iwYbpg+67TkSKMRT5Wm5EuN6jyLj470foW/rhWyO
         llRlA1twHALDUgWHBaFfas/dFJmTjhXcOUXHgKpUw1ymgfzYhjAopf9f2X1qJkAOm4Tu
         O3md6TN6r3DwWnyD0Nb1GgxLZjWTbKcZYKFZqnJyCXAYw8UHhC2ZaohEUrgN0KN0AFIC
         p/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=erxXp3pM+vmnwt5dCKBDd+mcnjI272utGNSkJjQm9os=;
        b=EGYBLVOe7e/AeFhL2y9KBcXI/gYXpyREuqLi32q2dq3KJUTUtgoK7W8kjqW8UX6XZg
         pbnkry+rlRi6UVuzYV2BLQgqYXc7WL1UBveSh1dEpwgQlvfYaAJLrAADLz7PYjzGU0Vs
         b0AcdyHnmFZWKQgYAzmEFZ5WfoRkpH8rvLngkjJmyeII/rU5GKThhvTaECFU8BlsJLx5
         g1+JYKAEfev0oDhwmHz1cMqMET90Mh5GXtOEtCH0DPFJML4bRUMcRNe6Dvs3wBDAKzdb
         TcUkEgECg7+DYX2/O0B3rPLe/lF6DQYVRykyoA5tx+ugWx1mrvrc5GfTVNVBMoQK/z+A
         6oCw==
X-Gm-Message-State: AOAM533aYYTZjAwTCwiruPQ2fjKc7Ub7deFBfloGDNd/WlcVRGNM6omF
        POaxtWXhW3kWpbSQa0nvcA==
X-Google-Smtp-Source: ABdhPJy8KAmbOkAKBXDhMrCYCXH9ke2KfmkfkubbXteCqA2YKtEYeJYD8An3dI4IqGRzwTxSefziOw==
X-Received: by 2002:a63:481b:0:b0:378:9b24:5163 with SMTP id v27-20020a63481b000000b003789b245163mr16830752pga.224.1646296309300;
        Thu, 03 Mar 2022 00:31:49 -0800 (PST)
Received: from localhost ([2401:e180:8860:3b30:e4a0:392a:996e:c525])
        by smtp.gmail.com with ESMTPSA id h17-20020a63df51000000b0036b9776ae5bsm1406174pgj.85.2022.03.03.00.31.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Mar 2022 00:31:48 -0800 (PST)
From:   Tyrone Ting <warp5tw@gmail.com>
To:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        yangyicong@hisilicon.com, semen.protsenko@linaro.org,
        wsa@kernel.org, jie.deng@intel.com, sven@svenpeter.dev,
        bence98@sch.bme.hu, lukas.bulwahn@gmail.com, arnd@arndb.de,
        olof@lixom.net, andriy.shevchenko@linux.intel.com,
        warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com
Cc:     openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 01/11] arm: dts: add new property for NPCM i2c module
Date:   Thu,  3 Mar 2022 16:31:31 +0800
Message-Id: <20220303083141.8742-2-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220303083141.8742-1-warp5tw@gmail.com>
References: <20220303083141.8742-1-warp5tw@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Tyrone Ting <kfting@nuvoton.com>

Add nuvoton,sys-mgr property for controlling NPCM gcr register.

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
---
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
index 3696980a3da1..0fee5fc67e02 100644
--- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
@@ -371,6 +371,7 @@
 				interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&smb0_pins>;
+				nuvoton,sys-mgr = <&gcr>;
 				status = "disabled";
 			};
 
@@ -383,6 +384,7 @@
 				interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&smb1_pins>;
+				nuvoton,sys-mgr = <&gcr>;
 				status = "disabled";
 			};
 
@@ -395,6 +397,7 @@
 				interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&smb2_pins>;
+				nuvoton,sys-mgr = <&gcr>;
 				status = "disabled";
 			};
 
@@ -407,6 +410,7 @@
 				interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&smb3_pins>;
+				nuvoton,sys-mgr = <&gcr>;
 				status = "disabled";
 			};
 
@@ -419,6 +423,7 @@
 				interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&smb4_pins>;
+				nuvoton,sys-mgr = <&gcr>;
 				status = "disabled";
 			};
 
@@ -431,6 +436,7 @@
 				interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&smb5_pins>;
+				nuvoton,sys-mgr = <&gcr>;
 				status = "disabled";
 			};
 
@@ -443,6 +449,7 @@
 				interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&smb6_pins>;
+				nuvoton,sys-mgr = <&gcr>;
 				status = "disabled";
 			};
 
@@ -455,6 +462,7 @@
 				interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&smb7_pins>;
+				nuvoton,sys-mgr = <&gcr>;
 				status = "disabled";
 			};
 
@@ -467,6 +475,7 @@
 				interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&smb8_pins>;
+				nuvoton,sys-mgr = <&gcr>;
 				status = "disabled";
 			};
 
@@ -479,6 +488,7 @@
 				interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&smb9_pins>;
+				nuvoton,sys-mgr = <&gcr>;
 				status = "disabled";
 			};
 
@@ -491,6 +501,7 @@
 				interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&smb10_pins>;
+				nuvoton,sys-mgr = <&gcr>;
 				status = "disabled";
 			};
 
@@ -503,6 +514,7 @@
 				interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&smb11_pins>;
+				nuvoton,sys-mgr = <&gcr>;
 				status = "disabled";
 			};
 
@@ -515,6 +527,7 @@
 				interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&smb12_pins>;
+				nuvoton,sys-mgr = <&gcr>;
 				status = "disabled";
 			};
 
@@ -527,6 +540,7 @@
 				interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&smb13_pins>;
+				nuvoton,sys-mgr = <&gcr>;
 				status = "disabled";
 			};
 
@@ -539,6 +553,7 @@
 				interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&smb14_pins>;
+				nuvoton,sys-mgr = <&gcr>;
 				status = "disabled";
 			};
 
@@ -551,6 +566,7 @@
 				interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&smb15_pins>;
+				nuvoton,sys-mgr = <&gcr>;
 				status = "disabled";
 			};
 		};
-- 
2.17.1

