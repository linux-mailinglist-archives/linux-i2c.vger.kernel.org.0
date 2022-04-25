Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D6F650DC3A
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Apr 2022 11:17:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235794AbiDYJTf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Apr 2022 05:19:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241584AbiDYJRO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Apr 2022 05:17:14 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78731321;
        Mon, 25 Apr 2022 02:14:10 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id b17so11297389qvf.12;
        Mon, 25 Apr 2022 02:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=91flSxJRmaGK0ryyqZaGiTUm7eWeBTNwUgCLD8/8Uro=;
        b=L9/rhY2ePaHSSwjdh2A33AILDVsApMM7Ctenn2VhSyYRJ3fiISwNKGfVzE1HyIKKhV
         HyCydbVX1/3CrF8ivT3BVWT9cmWfwSNUoXZoY5BLtqHij5fLwx+4eVpFSRQCSQtG3mY4
         RbijpuYanTqiJdu+31HKaT+e46zNROKwvThGkl2H6sn84brODGHnJV8l8p7b8DqSSPuW
         dvtxQOcdxn4pPmxemgCMc/sZHYpJfYDV2yK6LKjneC9DjEMAKmoTe6oDyPyr/stSzmo1
         eE2/oq9Dede1dFJokr+53OQRxjgMPn0TUkTqWRU84P7/EhUBDwjnjpSmgMECiYHJJpxB
         kDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=91flSxJRmaGK0ryyqZaGiTUm7eWeBTNwUgCLD8/8Uro=;
        b=3D5zX1cF0XeSw890mzeAqDKXxrskhLryMvPvCBwjAfYSnc+PoAQZtVJkZWD/wTYzkS
         K967ekVzBNzY2PgxOOnf/TI7YLHZq+BED/t8nXcclwOVp8ZkyHDpmr2Ty+CbCN94TTtm
         Z8W///BKmMdWvpO2sU5pBUbc/GrpWypur9C6yhU9wLFV0mQL5GKWowMTj5p/+oj9/eYk
         MCOWAaCrvBkA/f8OpwkzMmcNenAHTW5gloyK1g3k/fBhEms/8rDfCXU+gIIDBLi74dpH
         7dXagxDBqXjo2nRa3ntNQW/tSyUins3HS5Uh87iSp6alG+rBS5nMy1xciXuvnULwmMyr
         LovQ==
X-Gm-Message-State: AOAM532Vzpy9WMKwwB6vwabpeF+uAH2kGCVhklqMDFEgqRC3u5hcWE8f
        uBYFL0eC+SIucUtQpE0/BXg=
X-Google-Smtp-Source: ABdhPJyY45oyFv7a9F5kcWk6B4Z5OsbslNhlS7WGnw+lfI2L+vnaW/SdJypqKXT6ac8e4TFniW3m9w==
X-Received: by 2002:ad4:5b81:0:b0:456:2c7f:97ab with SMTP id 1-20020ad45b81000000b004562c7f97abmr6640486qvp.71.1650878049672;
        Mon, 25 Apr 2022 02:14:09 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id b2-20020a37b202000000b0069c7ad47221sm4701011qkf.38.2022.04.25.02.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 02:14:09 -0700 (PDT)
From:   cgel.zte@gmail.com
X-Google-Original-From: lv.ruyi@zte.com.cn
To:     benh@kernel.crashing.org, joel@jms.id.au
Cc:     brendanhiggins@google.com, tglx@linutronix.de, maz@kernel.org,
        andrew@aj.id.au, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, Lv Ruyi <lv.ruyi@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] drm/msm/dsi: fix error check return value of irq_of_parse_and_map()
Date:   Mon, 25 Apr 2022 09:14:02 +0000
Message-Id: <20220425091402.3499657-1-lv.ruyi@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Lv Ruyi <lv.ruyi@zte.com.cn>

The irq_of_parse_and_map() function returns 0 on failure, and does not
return a negative value anyhow, so never enter this conditional branch.

Fixes: bf94ec093d0 ("drm/msm/dsi: do not enable irq handler before powering up the host")
Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index d51e70fab93d..29199e6e15ee 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1873,10 +1873,9 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 	}
 
 	msm_host->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
-	if (msm_host->irq < 0) {
-		ret = msm_host->irq;
-		dev_err(&pdev->dev, "failed to get irq: %d\n", ret);
-		return ret;
+	if (!msm_host->irq) {
+		dev_err(&pdev->dev, "failed to get irq\n");
+		return -EINVAL;
 	}
 
 	/* do not autoenable, will be enabled later */
-- 
2.25.1

