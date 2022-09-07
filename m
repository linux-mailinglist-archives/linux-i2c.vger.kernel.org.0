Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BC0D5B098E
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Sep 2022 18:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbiIGQEa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Sep 2022 12:04:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230242AbiIGQEB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Sep 2022 12:04:01 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB1D0BC112
        for <linux-i2c@vger.kernel.org>; Wed,  7 Sep 2022 09:02:42 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id p1-20020a17090a2d8100b0020040a3f75eso10346907pjd.4
        for <linux-i2c@vger.kernel.org>; Wed, 07 Sep 2022 09:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=afSHfpUxnx3q9ntKQjr5xt/kVuSAfsXr+C9GfFVRDd4=;
        b=sseBowAH5ISZmkxAYb24ceYU3uCJmbJT+Fk6bT8rILtssfyoK9sUWy46GJR0Scyl70
         ojH3VejTvM81sbYXTiXGfxT9Z6qbzK/Z41l9gnZuwm6RmWsnDg6tUIgLXHUc4CjY9Fov
         BGxojsGeaNTzBZYDBAfY4S4ElY2Eimf1YztfHgNEs1qdelfX0/JK1uq5kCXWSoBZYHYO
         ZcWvGq17DeS1nmU1SYd3U04WTIsHjYSj4tYMIruH7RdfG3dv/2xiBkZORgZ8mRvpmKTG
         p++sAb/6EYe78tMkhtlMJIh9MoBRGOwC/aeY4r3WJbOnsZICNMGm3rWY2nAL8mR5uE7g
         gmdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=afSHfpUxnx3q9ntKQjr5xt/kVuSAfsXr+C9GfFVRDd4=;
        b=RvCxJib+gFB/3rFnQb2RDOfxFToSX4qK1qpo0IuQVBK83ORqHnotThhheT9KzjISju
         VuQPeRfZOEJSJIa+AcjaU0nss+jgWhXib3D2B+jTObhrbrcN5fjjJwcK2WHD8OcMzeED
         aqA0jc9PvgwCCnONhBNuQR9tF/4Qm1DPbeFDfAOV6Pe8HgXpcYfiknz4f1hTRT5Bv/1L
         XN0gX+7fb1+sS49yxjdnQ7w7xplG7xXnkTh47trxJweLxrj8NYoDg8rYYMbgeazqPjWa
         Jd6pXddx3WJCPQD3rvdBrCydXMgM+w5uEMWp77S7WNDa8XXoLbfR+BJxNmzaZD8TcYRF
         DCOQ==
X-Gm-Message-State: ACgBeo1YMB0AKmxRhb/WQQuWfWuawmemdoYjyc3E9HXHEdsz9dYsRlfT
        xZw0X5wfcir2aIlioki0pcxiEQ==
X-Google-Smtp-Source: AA6agR4EQG/wNWPdbtT/ZZVcElmxLEu6XFTylREBCm9ZmDxny83+bS3kcd0dOR35qD7faC4NwOGf9Q==
X-Received: by 2002:a17:903:2309:b0:176:de48:e940 with SMTP id d9-20020a170903230900b00176de48e940mr4528698plh.15.1662566548714;
        Wed, 07 Sep 2022 09:02:28 -0700 (PDT)
Received: from localhost.localdomain ([23.27.44.184])
        by smtp.gmail.com with ESMTPSA id x13-20020a17090a1f8d00b001f510175984sm14919719pja.41.2022.09.07.09.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 09:02:28 -0700 (PDT)
From:   Jagan Teki <jagan@edgeble.ai>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kever Yang <kever.yang@rock-chips.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        Jagan Teki <jagan@edgeble.ai>, linux-i2c@vger.kernel.org,
        David Wu <david.wu@rock-chips.com>
Subject: [PATCH v4 01/13] i2c: rk3x: Add rv1126 support
Date:   Wed,  7 Sep 2022 21:31:55 +0530
Message-Id: <20220907160207.3845791-2-jagan@edgeble.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220907160207.3845791-1-jagan@edgeble.ai>
References: <20220907160207.3845791-1-jagan@edgeble.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add i2c support for Rockchip RV1126 SoC.

Cc: linux-i2c@vger.kernel.org
Signed-off-by: David Wu <david.wu@rock-chips.com>
Signed-off-by: Jagan Teki <jagan@edgeble.ai>
---
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

