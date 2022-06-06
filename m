Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1BE553ECA8
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jun 2022 19:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240753AbiFFP03 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jun 2022 11:26:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240742AbiFFP0X (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Jun 2022 11:26:23 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA92C328EE9
        for <linux-i2c@vger.kernel.org>; Mon,  6 Jun 2022 08:26:16 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id t13so20332934wrg.9
        for <linux-i2c@vger.kernel.org>; Mon, 06 Jun 2022 08:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gKndGtfRMJoB9VZHAXJ3155b6Ocgr/Z/0m5W/nSp3fk=;
        b=aJEoKakPceXnbp1/ZlShcjfkeytqJDUAJr7R96RlUzYUysC5vsKDlaQOFn4CuEJOqt
         6lhIxLXlNtmdxeKHk4mesWxv20OXnO5LbD8vF2oZLoegnB2ohozQL4HS3QodkbprZN68
         eZcOZoVKCoZSg2pDCktQ/G5fQsz3dGyKfF1I4rfJgO3VIn0v3Koz48s/4rtU2+lGkcU0
         WMCWFmkoNYTPPCClc4bd6usX25oVt+CHu+IA7WfdTxpBR3jb8GhFQ9pkmZFKu133Y/Oc
         CCPs1nMC/CN2VyBK7h9NZBeAIn3I9T082Zz3ShRxaViE3KN9EEM053orGKLOrGpV8TXL
         DWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gKndGtfRMJoB9VZHAXJ3155b6Ocgr/Z/0m5W/nSp3fk=;
        b=3oRcZPSVaEoHJpdth5rH8m1Ok0nnNyAeC7dUB/iElbzQBJpYq0F9sJvdfdodjbba84
         8hxPad6nY3wZ7vMzYmJeCuB/vq3Xln09/BUinJHq+og8sPeks2KRR4B+kJ7afqSJ9iQH
         cwWSn3RcrU01b/6x7syC/2JEn2YV0u6Q8sOsnQnRGW3dSi2NtLCmG6WQOzhCPitCfbRD
         urVbQzezwXt1I395B4xxdmO5wy4RkmjHT7P7Wzq0SA1GvEeE266HcwBWS3x1zH1OrP8O
         HzL55O/cQEpdezsTTmaQVyX3UZGD3vb2fYpBEgCuDrfWK9ceDh0xgiCjttLfByrLpEBM
         ZLwA==
X-Gm-Message-State: AOAM531Amet536VbdPr0TmTcOMTmczXs70kaD8YxmL05vv4slVsxnZJH
        +c27KQMWsc9pG08QR9yndxyZTw==
X-Google-Smtp-Source: ABdhPJxv5R9KdhXC8FcRfcFRcCDgFBV2z1vjprwaGxWfFLbq88Rm1mz3L9kBxgErlQ4yXKLde/16gA==
X-Received: by 2002:a5d:5142:0:b0:212:af29:530 with SMTP id u2-20020a5d5142000000b00212af290530mr22119805wrt.444.1654529174889;
        Mon, 06 Jun 2022 08:26:14 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id h1-20020adffd41000000b002103aebe8absm15623944wrs.93.2022.06.06.08.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 08:26:14 -0700 (PDT)
From:   Conor Dooley <mail@conchuod.ie>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Steve Twiss <stwiss.opensource@diasemi.com>
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Atul Khare <atulkhare@rivosinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 4/4] riscv: dts: sifive: "fix" pmic watchdog node name
Date:   Mon,  6 Jun 2022 16:25:58 +0100
Message-Id: <20220606152557.438771-5-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606152557.438771-1-mail@conchuod.ie>
References: <20220606152557.438771-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

After converting the pmic watchdog binding to yaml, dtbs_check complains
that the node name doesn't match the binding. "Fix" it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index c4ed9efdff03..1f386b07a832 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -90,7 +90,7 @@ rtc {
 			compatible = "dlg,da9063-rtc";
 		};
 
-		wdt {
+		watchdog {
 			compatible = "dlg,da9063-watchdog";
 		};
 
-- 
2.36.1

