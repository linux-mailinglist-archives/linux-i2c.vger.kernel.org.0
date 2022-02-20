Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D11E4BCBFB
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Feb 2022 04:57:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234565AbiBTD50 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Feb 2022 22:57:26 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiBTD5W (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Feb 2022 22:57:22 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70ABA3FD9E;
        Sat, 19 Feb 2022 19:57:02 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id i6so5712820pfc.9;
        Sat, 19 Feb 2022 19:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=erxXp3pM+vmnwt5dCKBDd+mcnjI272utGNSkJjQm9os=;
        b=DwrEBVmtD6umKXvFbEPmqi3ChydYqF9Do0lV1D7o6JDcbhF0HWZvlU77IplLVNNpnZ
         HGeubBCQyEDrsZsBGwrdHwS2pegxP0pW61+IY4P5EUJQq07Vjo4pa42DycZQRruoX3FS
         msKFOqwv0algQqyxsq7VvsYncb/8y8fbWdOxUNUK/mYzHkIIChDJgPMSqosNUDwIqkpa
         2sJkQocjzguWmrbPW0+uAKWT4u4sAtNxwtDmG1hshX+J0BcX+Hpov4Te/01Eei7ADh0d
         AL55vicQ4F/gwipuvnYAoS51TFt4XzAuD96PRSQFCeyK/hF+qxwgFwDeASdeiMjLQ/uw
         8lGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=erxXp3pM+vmnwt5dCKBDd+mcnjI272utGNSkJjQm9os=;
        b=78EvTaGDFUnE3Tr3GnZ07J3yFr0ZMCPLVwvFwOhZvTFu3BCs4hjL3+dqs+nvPXc95R
         y9zwVK1oTBAnQXnKZBzOObQ9llHJWFnWRe0Vkje7CxsUjil89YfabTH/gpn4e7SXleH/
         qp7jelwqsW1YWU3sn6ph5uRsGdqOBGHINLzlHxnxFc28c2XFRmxCJH7v8VSUt4O0yV0D
         itEixyFU/4dBcS2h+2iM6eH9BwDqlpENgglH1MCfXzt3mR2DzNeOr9OwSfYLUnkAjc7U
         uLqh0iwECN9xq2Op8SP+tvTCCYl1GmHEUrwpZIjJPcwUu1OTfhlZOqgqVrU2+3E4NaAh
         DoMQ==
X-Gm-Message-State: AOAM530GY4A52FW5YZxqwzXn85lthEwViKcjE92Ra11bpUVHH8OwAzz/
        3NLjWM7gCh8E1mjAvMpdOA==
X-Google-Smtp-Source: ABdhPJzGMy+SAIsfp0thxPyF6s6/dL06QnFuRJKnkvyqz1XIaFiwvLSYo7DoTHXKjl3CwgmJAoOwNQ==
X-Received: by 2002:a63:802:0:b0:374:2e45:c6fa with SMTP id 2-20020a630802000000b003742e45c6famr1449715pgi.246.1645329421670;
        Sat, 19 Feb 2022 19:57:01 -0800 (PST)
Received: from localhost ([2401:e180:8842:e799:9593:a6f2:788b:a48c])
        by smtp.gmail.com with ESMTPSA id m17-20020a17090ab79100b001b89fd7e298sm3473916pjr.4.2022.02.19.19.57.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 19 Feb 2022 19:57:01 -0800 (PST)
From:   Tyrone Ting <warp5tw@gmail.com>
To:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        semen.protsenko@linaro.org, yangyicong@hisilicon.com,
        wsa@kernel.org, jie.deng@intel.com, sven@svenpeter.dev,
        bence98@sch.bme.hu, christophe.leroy@csgroup.eu,
        lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de,
        digetx@gmail.com, andriy.shevchenko@linux.intel.com,
        warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com
Cc:     openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/11] arm: dts: add new property for NPCM i2c module
Date:   Sun, 20 Feb 2022 11:53:11 +0800
Message-Id: <20220220035321.3870-2-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220220035321.3870-1-warp5tw@gmail.com>
References: <20220220035321.3870-1-warp5tw@gmail.com>
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

