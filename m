Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA04874890
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jul 2019 09:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388701AbfGYH4k (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Jul 2019 03:56:40 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43711 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388666AbfGYH4j (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Jul 2019 03:56:39 -0400
Received: by mail-pf1-f194.google.com with SMTP id i189so22325561pfg.10
        for <linux-i2c@vger.kernel.org>; Thu, 25 Jul 2019 00:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=dVOPmsmstAoEDKTiIIalnKNSCwtrFiFJM+QU0aXv5Hg=;
        b=q3VoDjljk5e6aCPg9VPeTJlpzqq1Wt+sb3zq4UtlLWr5HQQU7OBcq8vmSbYjjSeQgU
         5ejFDZ0kNQ/v4WVI75bNfHVDGNKHgH3GMILwwhCRkKEwookapnslrRCHibZv1jfnJyQM
         eqwZD5iJifsTxEkAT3k7N/flx6qcJqnRW9njkqUZMJhM2I8CIs+rDZ7jQyPAWvRPD+x7
         wvm16SIcp72lqY5UhvcpOEGh9dYOImIHMC58FRsYALy9Zq9vWBEh+juwY6jFnWKFcM5+
         xb9enbHGu07rhJ5mcWN8TsGwsbZ8d0sjzresMdu8QDqhly4Y0p5SONdy7cR5s7y0w5Xt
         95Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=dVOPmsmstAoEDKTiIIalnKNSCwtrFiFJM+QU0aXv5Hg=;
        b=dqchC5bX0wIBy5dlkQIgmSSfhJC7G1nUJiv76OXjBVidsDs3m4D47SgsWDKPcto/hs
         8EbycpZj1y4D4s5Sw26S4yQOAXVe6zRLQxus95gylISPLx0/Se7Qgfo+UUVpaswGlCbM
         +7q8DosidlRwD/QbGnKaodal8FbyzTFowoNZoPTSbjS0Si8JvFg3SxSIxPyg1KV+y9QB
         8mrYrGklfVVRDf9ImL9qWLmqtyHqp17wyl9RzrHf1S0RIkRBsFsdTxlSmLGQx0zenB1Z
         Svk+UUigUeXaNW8EalVrzMEet3Mq8XlWbi/QUd+nf9tKk/EqKUNpziiYYkKhOBgu+xXn
         h4HA==
X-Gm-Message-State: APjAAAXHpbQHNMy39l9vqr7JLCv24pHHm/5z9lpXPL8BZKx/LSty/qMR
        B2MuFLxHx3mOYI+wydg8IlRP4A==
X-Google-Smtp-Source: APXvYqwa4/Ww2exQ29LVKUzjoJMY2ByVqNXS1YvJBVQtvvkrKr4pTPo6wJs6DJAZTDb8y8IyWAKUpQ==
X-Received: by 2002:a17:90a:d996:: with SMTP id d22mr91584319pjv.86.1564041398081;
        Thu, 25 Jul 2019 00:56:38 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id m9sm89021419pgr.24.2019.07.25.00.56.35
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 25 Jul 2019 00:56:37 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     wsa+renesas@sang-engineering.com, orsonzhai@gmail.com,
        zhang.lyra@gmail.com
Cc:     baolin.wang@linaro.org, vincent.guittot@linaro.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] i2c: sprd: Change to use devm_platform_ioremap_resource()
Date:   Thu, 25 Jul 2019 15:56:17 +0800
Message-Id: <29fa51009a97e6b7d8622190810b7505819ac0b2.1564041157.git.baolin.wang@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <c9e2c50b54577e4b5cb7cc424f4c6de5f116cf60.1564041157.git.baolin.wang@linaro.org>
References: <c9e2c50b54577e4b5cb7cc424f4c6de5f116cf60.1564041157.git.baolin.wang@linaro.org>
In-Reply-To: <c9e2c50b54577e4b5cb7cc424f4c6de5f116cf60.1564041157.git.baolin.wang@linaro.org>
References: <c9e2c50b54577e4b5cb7cc424f4c6de5f116cf60.1564041157.git.baolin.wang@linaro.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use the new helper that wraps the calls to platform_get_resource()
and devm_ioremap_resource() together.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/i2c/busses/i2c-sprd.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
index 8002835..bbcb056 100644
--- a/drivers/i2c/busses/i2c-sprd.c
+++ b/drivers/i2c/busses/i2c-sprd.c
@@ -478,7 +478,6 @@ static int sprd_i2c_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct sprd_i2c *i2c_dev;
-	struct resource *res;
 	u32 prop;
 	int ret;
 
@@ -488,8 +487,7 @@ static int sprd_i2c_probe(struct platform_device *pdev)
 	if (!i2c_dev)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	i2c_dev->base = devm_ioremap_resource(dev, res);
+	i2c_dev->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(i2c_dev->base))
 		return PTR_ERR(i2c_dev->base);
 
-- 
1.7.9.5

