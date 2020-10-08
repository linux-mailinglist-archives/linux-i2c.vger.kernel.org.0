Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4F02287E3D
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Oct 2020 23:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbgJHVou (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Oct 2020 17:44:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729593AbgJHVor (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Oct 2020 17:44:47 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D72DC0613D3;
        Thu,  8 Oct 2020 14:44:47 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id t25so10145734ejd.13;
        Thu, 08 Oct 2020 14:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KxjygpoA96eOeA02J+Dvf4AQ8zSrWdx9oS+iZ/XJRdI=;
        b=M68C2VOtz/fupoFfHGC+2wx79Prt6iza5lrS8tn7r/ICrZOi0lIVYRyj8pqU+33I9U
         u1ga1G0nE7c42LbAI5Zh2GOH0ycaBwLON14sFH7ks6V/+TLXdv4dmosoByvMdNVA6WwD
         VFByTPYH810XhOqG0ywDJNWXnHTHLNLCH9eT6TuIbH5Ney+U1xEb1OdbcSJMRKjWzWZO
         isM9G5JfS3MdNkX1SZMALdVI5rKUUP6lsNz/RcqLa8Rvn77EZyU9J5GUXs4yWM2abJRS
         atMe/ahRJZ88mfwnj7kQHRejdbG4ZjeJIqsC7+f+iW0syKCwPF0w+jjcVS5q9byk6vVo
         svdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KxjygpoA96eOeA02J+Dvf4AQ8zSrWdx9oS+iZ/XJRdI=;
        b=Tx1sy8jCj0PWh1IGZy2P1z7/gJjW+cgfkocHO0pysQug7XVn5AoIgAkDY4YUtYBZ1j
         3oLJdI6OGDD4oV0koGilImyKNJTjQ05vM5vDjQ03hKK2Qpkef75SrO3IqOqfYN0OaiYh
         8mCTUhnmc3rY80GsNdS8z6lxcldPiWpqQfMtoOO5JeNhlOiczE3YsVzzm9DZKl+aEG95
         Q2pCqow1uW3M4AnYBT99O4T9S0khIrpm94mnUF8ckwbF5MEbXxLpVjwv/3j10iKFv2ts
         bgSRjcb+uSnIhuvFP/rKexDuFj9d3v9MKbngiFF1wpN25GK2J0rs1rYNiqCsrz0EFHc2
         FP9A==
X-Gm-Message-State: AOAM532ALWu5yob31WOeD/Do1t5VkUCVdg1fgn5yq+ZygraT8OCMg/fh
        psd3SjvMF9oZ+AG6YnB8qTpF85OGy0c=
X-Google-Smtp-Source: ABdhPJydkFpIZCSdLrHIJ5lij59RqWh0OjYTThkYVr7RYT46eXnS/e7Vsf3akCiCzjZb9rpJ85i+MQ==
X-Received: by 2002:a17:906:f4f:: with SMTP id h15mr10722376ejj.17.1602193486048;
        Thu, 08 Oct 2020 14:44:46 -0700 (PDT)
Received: from localhost.localdomain ([188.24.159.61])
        by smtp.gmail.com with ESMTPSA id i8sm4831800ejg.84.2020.10.08.14.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 14:44:45 -0700 (PDT)
From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org
Subject: [PATCH 3/3] i2c: owl: Enable asynchronous probing
Date:   Fri,  9 Oct 2020 00:44:41 +0300
Message-Id: <f343802a4b1a8ab6fc78e5db6d24a350b2319495.1602190168.git.cristian.ciocaltea@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1602190168.git.cristian.ciocaltea@gmail.com>
References: <cover.1602190168.git.cristian.ciocaltea@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Speed up the boot process by using the asynchronous probing feature
supported by the recent kernels.

For SBCs based on the Actions Semi S500 SoC, the overall boot time is
expected to be reduced by 200-300 ms.

Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
---
 drivers/i2c/busses/i2c-owl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-owl.c b/drivers/i2c/busses/i2c-owl.c
index 547132768119..ed3942051845 100644
--- a/drivers/i2c/busses/i2c-owl.c
+++ b/drivers/i2c/busses/i2c-owl.c
@@ -521,6 +521,7 @@ static struct platform_driver owl_i2c_driver = {
 	.driver		= {
 		.name	= "owl-i2c",
 		.of_match_table = of_match_ptr(owl_i2c_of_match),
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 module_platform_driver(owl_i2c_driver);
-- 
2.28.0

