Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 544435B9FBD
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Sep 2022 18:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbiIOQkK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Sep 2022 12:40:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbiIOQkJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Sep 2022 12:40:09 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B4342CC94
        for <linux-i2c@vger.kernel.org>; Thu, 15 Sep 2022 09:40:07 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id fs14so18318406pjb.5
        for <linux-i2c@vger.kernel.org>; Thu, 15 Sep 2022 09:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=VUS1GEjzoCd9kVvhob+PLFP+IJa0hgQdSUQAFkA6KaI=;
        b=XKxfRwUPhPLapBK4yPuuUoUobIDtLPZO3BDVexaaU9jPj4YWN7PBmwztet4vSbXACm
         2k/1tZdSmydmkcvLNGTJf55PMOrR3VJl/49Az9scItwG8spg9g3zq60W+IGUFfPFtxHx
         X/xz5QjOrCL80QWstHumTpV5OYd0D8K2Ykeq1/+CTHK2nednwnOD3jbmErUIOXdiQApP
         u0YPKX0v1XywzwkGevUb8B+0KJP5qUPhlc5XXkEzL2NM1fxXSEcVeFsD9uxE9rU/F5fW
         qwr90aFRyrpDR7Vmgn1uqvdxeFVvIphV8AxfndSHsDTwLSlJ75l+ybAW/K1gKQor+FGs
         JaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=VUS1GEjzoCd9kVvhob+PLFP+IJa0hgQdSUQAFkA6KaI=;
        b=ef63NVChc55oq6ZQB8KEzLqEKy9ef0f+Bao8aCcbkZVdfDVV0MC6WvxdRQ2zLNTDI3
         yD4+D+Bxd3ENBJXtPR0ZJkY2/8P3wXKJqhbmctzZDJWbPDP2NJLrsNZ+PK7eaqq14vSs
         mJkdKGYiOSnqU6fqHw+YdrFOVFuTicZ+IIku7cLZffxSjTAvKntwRaDaQvrg0E12/oCw
         WE1ff1xuzCMBd0Q04dbi8TPFxHyKNgcG2a13zfjhTGVLuidrIMI+4kzybLSIv43hS4M2
         vHXFnaoKwui5gprwGw2Vy8VD8FKzHmxXrBEkZMDwpe2E9HilNDkRTXV/2PF0wKf4QEDj
         3sgg==
X-Gm-Message-State: ACrzQf18kBxrrIRG4veBKg7LJpAiBnj5B+liC+qMUaVvFBbQ9Kumx85v
        C+HloT3aLSxCUl/HckUc8z5SGQ==
X-Google-Smtp-Source: AMsMyM4kvJ3vL7FeOaqqnVAtuUYgFaL7tV9uQY25zs+tqTsTiQvJiPYmm59R3Kkz1lzBuUrWduI9wg==
X-Received: by 2002:a17:902:edc3:b0:172:8ae3:9778 with SMTP id q3-20020a170902edc300b001728ae39778mr434868plk.72.1663260006999;
        Thu, 15 Sep 2022 09:40:06 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:f820:a732:fc7f:74df])
        by smtp.gmail.com with ESMTPSA id x21-20020aa78f15000000b00540f3ac5fb8sm12841652pfr.69.2022.09.15.09.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 09:40:06 -0700 (PDT)
From:   Jagan Teki <jagan@edgeble.ai>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kever Yang <kever.yang@rock-chips.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        Jagan Teki <jagan@edgeble.ai>, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>,
        David Wu <david.wu@rock-chips.com>
Subject: [PATCH v5 1/6] i2c: rk3x: Add rv1126 support
Date:   Thu, 15 Sep 2022 22:09:42 +0530
Message-Id: <20220915163947.1922183-2-jagan@edgeble.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220915163947.1922183-1-jagan@edgeble.ai>
References: <20220915163947.1922183-1-jagan@edgeble.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add i2c support for Rockchip RV1126 SoC.

Cc: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa@kernel.org>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: David Wu <david.wu@rock-chips.com>
Signed-off-by: Jagan Teki <jagan@edgeble.ai>
---
Changes for v5:
- collect Rob r-b
- Cced Wolfram
Changes for v4:
- new patch

 drivers/i2c/busses/i2c-rk3x.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index 2e98e7793bba..d1658ed76562 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -1165,6 +1165,11 @@ static const struct rk3x_i2c_soc_data rv1108_soc_data = {
 	.calc_timings = rk3x_i2c_v1_calc_timings,
 };
 
+static const struct rk3x_i2c_soc_data rv1126_soc_data = {
+	.grf_offset = 0x118,
+	.calc_timings = rk3x_i2c_v1_calc_timings,
+};
+
 static const struct rk3x_i2c_soc_data rk3066_soc_data = {
 	.grf_offset = 0x154,
 	.calc_timings = rk3x_i2c_v0_calc_timings,
@@ -1195,6 +1200,10 @@ static const struct of_device_id rk3x_i2c_match[] = {
 		.compatible = "rockchip,rv1108-i2c",
 		.data = &rv1108_soc_data
 	},
+	{
+		.compatible = "rockchip,rv1126-i2c",
+		.data = &rv1126_soc_data
+	},
 	{
 		.compatible = "rockchip,rk3066-i2c",
 		.data = &rk3066_soc_data
-- 
2.25.1

