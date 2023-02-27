Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85C206A3F1A
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Feb 2023 11:06:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbjB0KGl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Feb 2023 05:06:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbjB0KGl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Feb 2023 05:06:41 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1024A1D908;
        Mon, 27 Feb 2023 02:06:39 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id q16so5584401wrw.2;
        Mon, 27 Feb 2023 02:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LHUpbKilmk7cv1IdpC+KRbByny6PyYIiDNlZO12FoT4=;
        b=lgKfKNJftgfACpxpYfriycZ3sy6njWYalCTnYyTnqUo2GdVm+9HEMo0ZDNbcFMxcG8
         TqaYPDpD8TTz3F4qaRSrfTaGVtCe5c5vL0QjbicwbUIF95iGpywbu8Q/ElrE++REkkT1
         /9LxllsjaRETEXaVh2EG/Ey6uISlQ3XJNtssQ4ilICNWuacKO+y0dWV9rwq/5umpWEls
         QNsbbrFW6hQvyZS7z56GBJcGfdNDq9aAsrSeiziNyaoEIRVu2ToX8NYBgknWwYH/ZZHM
         LHSVL/N1wckhOrgrtNEvB2QDsDSHiv2deTqMBLH5uKQbJg9Fl1Jb7OwaQr7IOI6Gr5cK
         5A6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LHUpbKilmk7cv1IdpC+KRbByny6PyYIiDNlZO12FoT4=;
        b=JOp7jTY/4enCKC76BLyVM8H5CuDvs/hWQeTnc2x9AG/5QI2+H6M+To5kgVp+Tg8SYi
         1BSYdUr/X5tR4wX/RcCJ8dKvau3MGP0zsLrgxJLqY5mHWzOChoetLXX5uBgVlYkQJH+z
         gROdifA/bsmy8aQWQQjVz57+qnnFIfMxUuIlRdzVRLg3v3QZ0/62Jbcu4dyZ8qQEpRsx
         bqcWLZtmYb1G4ymhLbigmlEjRtb2+HYlrJqjMOQye/t9e/FbTLmorX7gvoMSVwBlzWeO
         vUazCE+ggwq/zutPxL3A3KFEp6+kwhaEtuUk1ONW9vTup1oNr2vUltPGXCtIHJPKUENX
         31GQ==
X-Gm-Message-State: AO0yUKVizoW7YUQXEE9+tR8dm3peK33SbxViEjMuGFaeW0XdmRKGZZaW
        It3Cn8UaGMUFvNNbK74jt6w=
X-Google-Smtp-Source: AK7set+IrbaplolR3MswH0vPZMGtfKW+MMNXJSN9VsL8h4csEg2LUHtg38D6EwSu4UKeQ0MxLP89Hg==
X-Received: by 2002:a05:6000:11d2:b0:2c7:1603:16c5 with SMTP id i18-20020a05600011d200b002c7160316c5mr10590792wrx.67.1677492397487;
        Mon, 27 Feb 2023 02:06:37 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j14-20020a5d464e000000b002c558869934sm6723878wrs.81.2023.02.27.02.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 02:06:37 -0800 (PST)
Date:   Mon, 27 Feb 2023 13:06:33 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Nick Hawkins <nick.hawkins@hpe.com>
Cc:     Joel Stanley <joel@jms.id.au>, Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] i2c: gxp: fix an error code in probe
Message-ID: <Y/yAqRlSTN5VygUy@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This is passing IS_ERR() instead of PTR_ERR() so instead of an error
code it prints and returns the number 1.

Fixes: 4a55ed6f89f5 ("i2c: Add GXP SoC I2C Controller")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/i2c/busses/i2c-gxp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-gxp.c b/drivers/i2c/busses/i2c-gxp.c
index da4c8e5a8039..e2a322813074 100644
--- a/drivers/i2c/busses/i2c-gxp.c
+++ b/drivers/i2c/busses/i2c-gxp.c
@@ -525,7 +525,7 @@ static int gxp_i2c_probe(struct platform_device *pdev)
 		i2cg_map = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
 							   "hpe,sysreg");
 		if (IS_ERR(i2cg_map)) {
-			return dev_err_probe(&pdev->dev, IS_ERR(i2cg_map),
+			return dev_err_probe(&pdev->dev, PTR_ERR(i2cg_map),
 					     "failed to map i2cg_handle\n");
 		}
 
-- 
2.39.1

