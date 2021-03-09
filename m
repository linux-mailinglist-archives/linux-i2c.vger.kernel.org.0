Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38AC0332737
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Mar 2021 14:32:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231473AbhCINcO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Mar 2021 08:32:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230508AbhCINbo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Mar 2021 08:31:44 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B978DC06174A
        for <linux-i2c@vger.kernel.org>; Tue,  9 Mar 2021 05:31:44 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id nh23-20020a17090b3657b02900c0d5e235a8so5205217pjb.0
        for <linux-i2c@vger.kernel.org>; Tue, 09 Mar 2021 05:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sICRVh7f2CnaIXch/ljbyTh/YiC3SaJQVi2yY8F3cEI=;
        b=H12N7b5h918WXCPFRBD3eFjypWHlemJ2NEedlhsK4Y+jW/gPKmGoNQc/PuaNJZysRR
         O9rPB4lDgPsuLYfCGmP0oD9DK35lxHEK089L1VvuXMX7OjlJxtqglA1b6npGAoY+vCuG
         Iv4K2qLnYtfQP+whL2ahLwhq8K/2r4b0YX+HU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sICRVh7f2CnaIXch/ljbyTh/YiC3SaJQVi2yY8F3cEI=;
        b=hmM802Fw6BR9zlf7ID/61H492Gutnyfb0xwxJ9WEH0nBlCT8x3XCW+St0ywqRnqSEJ
         QASTczfkDB4K1G8U+I/dZErd58sA2pDMI+HDhuHpDjQ8wYbgIrYAck+Fqnx1fm1WPmtI
         13tbkpwlERYe11F6zCjOVwLhbTaIF4p8nou5SSDe9dn53krLJp5zFT3QANuEOcVl7EBo
         70IdqgNpENGuqtvO0q+cWts8peoEBUkpkF8DX+qtuZwag3v2nHoiWaQfWbebp9mh9k93
         1MzjsHq5WeUnfGRMCTDmUWnLRLfDjENo0DwNjn8Vhst8XWGSpd8JVvC1nv3sRlUT72AN
         OWgQ==
X-Gm-Message-State: AOAM533lJ4rvgSiJvfDpnFATjy7yKd53qR+9i0eeJUCaFWhH0JhrMCyD
        x/huHfxA1OSghhMPm3OrUyozog==
X-Google-Smtp-Source: ABdhPJxYtfPzJ7zMOJQNlO3kd9jxglEEHuxGkZlj7HUcxp/hZAfpbUv7ryxiLwxa9+QzytyaAMsfJw==
X-Received: by 2002:a17:90a:5413:: with SMTP id z19mr4622848pjh.137.1615296704224;
        Tue, 09 Mar 2021 05:31:44 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:f936:57e5:154d:e0d9])
        by smtp.gmail.com with ESMTPSA id 138sm13678649pfv.192.2021.03.09.05.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 05:31:43 -0800 (PST)
From:   Hsin-Yi Wang <hsinyi@chromium.org>
To:     Wolfram Sang <wsa@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v17 3/3] i2c: mediatek: mt65xx: add optional vbus-supply
Date:   Tue,  9 Mar 2021 21:31:31 +0800
Message-Id: <20210309133131.1585838-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210309133131.1585838-1-hsinyi@chromium.org>
References: <20210309133131.1585838-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add vbus-supply which provides power to SCL/SDA. Pass this regulator
into core so it can be turned on/off for low power mode support.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/i2c/busses/i2c-mt65xx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 2ffd2f354d0a..82f2b6716005 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -1215,6 +1215,13 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 	i2c->adap.quirks = i2c->dev_comp->quirks;
 	i2c->adap.timeout = 2 * HZ;
 	i2c->adap.retries = 1;
+	i2c->adap.bus_regulator = devm_regulator_get_optional(&pdev->dev, "vbus");
+	if (IS_ERR(i2c->adap.bus_regulator)) {
+		if (PTR_ERR(i2c->adap.bus_regulator) == -ENODEV)
+			i2c->adap.bus_regulator = NULL;
+		else
+			return PTR_ERR(i2c->adap.bus_regulator);
+	}
 
 	ret = mtk_i2c_parse_dt(pdev->dev.of_node, i2c);
 	if (ret)
-- 
2.30.1.766.gb4fecdf3b7-goog

