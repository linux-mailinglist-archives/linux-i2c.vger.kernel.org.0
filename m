Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FBA17488D
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jul 2019 09:56:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388696AbfGYH4m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Jul 2019 03:56:42 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:38957 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388726AbfGYH4l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Jul 2019 03:56:41 -0400
Received: by mail-pg1-f193.google.com with SMTP id u17so22604677pgi.6
        for <linux-i2c@vger.kernel.org>; Thu, 25 Jul 2019 00:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=eNURmCt1o5sob1QOowvJXr5pL73KlOzcHKdzSxjtEkQ=;
        b=U7zeKlTbIuS5u7DJxz9XnFhiBxEa+BpR7S41Ci+3WJQgscfSV6So2gzcTVQd+R96nf
         5bg7QLcpx9FMCe/bbTeQ9qWon/c3Em0JdujbSKBovxMrHDRMbHPFUuxE0ZuVlhEoZbul
         Yxwj3ky3V06UmwsFaveXirOuoElDv2qXDcZPJ4pPMn2QK//CIoDzMdS3l0BHFhBW+NfI
         FLBhyvp4e5tBqxKQWI9M+VaoMfn/DaN4MOm+qzA1OSHnWH38gCy5D5VvVwS5psNckamW
         Wv79LKVv8TX6CrbAJq69u9WQIvlYR068FfnYjuIthjm0VOqh8SMh/KR3z/GyrC2TfUTF
         K0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=eNURmCt1o5sob1QOowvJXr5pL73KlOzcHKdzSxjtEkQ=;
        b=V2vkuDUqh/LoqQOYLiFcnuIGAX4w6Aqike0jdvKvhwXTyVNhBNWVBVgqvPKGWL/rIc
         0i0XLgGvURS74nRNgbeDZuJ6o8hRlyAKXmo+mXTX8h/gzPF5MYk1157vxJ81rQ9Hem9i
         Fz386rGmTREVeOo7pwk5giJBSyPOh2XdAefBUBTXN56cVInsxFpyhyvhSjG7PMXyXkh9
         4ib94eQF/GxHp/hepJRFoXDE7DC5YQQilL4e0azNaInAALeafunauRnEglpehsPBMqtw
         hnJzDUZsuM86pG5Aau0w0Zz70s8swR4uK1s3uIGPz4D2vUJN+JbuIJFJUbzxN1q9Ctjy
         NjFw==
X-Gm-Message-State: APjAAAVsMN8zHg727z+WYb4j19X+205ao0eTpQfbN3OpISTO572YOByr
        M/QKImDNU6kgGzwYpfJbdCp1Hw==
X-Google-Smtp-Source: APXvYqyJPqgPtJ4rP4vnZuSNTDajTkR1hdJpE9/IIWEaIshG7QNHpFMpfiQpbiIXEMcNVudMOd5AhA==
X-Received: by 2002:a17:90a:8688:: with SMTP id p8mr92850220pjn.57.1564041400592;
        Thu, 25 Jul 2019 00:56:40 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id m9sm89021419pgr.24.2019.07.25.00.56.38
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 25 Jul 2019 00:56:40 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     wsa+renesas@sang-engineering.com, orsonzhai@gmail.com,
        zhang.lyra@gmail.com
Cc:     baolin.wang@linaro.org, vincent.guittot@linaro.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] i2c: sprd: Validate the return value of clock initialization
Date:   Thu, 25 Jul 2019 15:56:18 +0800
Message-Id: <5f64dc0eedb348b15442f31f2f22f5bded7cd6ef.1564041157.git.baolin.wang@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <c9e2c50b54577e4b5cb7cc424f4c6de5f116cf60.1564041157.git.baolin.wang@linaro.org>
References: <c9e2c50b54577e4b5cb7cc424f4c6de5f116cf60.1564041157.git.baolin.wang@linaro.org>
In-Reply-To: <c9e2c50b54577e4b5cb7cc424f4c6de5f116cf60.1564041157.git.baolin.wang@linaro.org>
References: <c9e2c50b54577e4b5cb7cc424f4c6de5f116cf60.1564041157.git.baolin.wang@linaro.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The 'enable' clock of I2C master is required, we should return an error
if failed to get the 'enable' clock, to make sure the I2C driver can be
defer probe if the clock resource is not ready.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/i2c/busses/i2c-sprd.c |   11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
index bbcb056..b432e75 100644
--- a/drivers/i2c/busses/i2c-sprd.c
+++ b/drivers/i2c/busses/i2c-sprd.c
@@ -466,9 +466,9 @@ static int sprd_i2c_clk_init(struct sprd_i2c *i2c_dev)
 
 	i2c_dev->clk = devm_clk_get(i2c_dev->dev, "enable");
 	if (IS_ERR(i2c_dev->clk)) {
-		dev_warn(i2c_dev->dev, "i2c%d can't get the enable clock\n",
-			 i2c_dev->adap.nr);
-		i2c_dev->clk = NULL;
+		dev_err(i2c_dev->dev, "i2c%d can't get the enable clock\n",
+			i2c_dev->adap.nr);
+		return PTR_ERR(i2c_dev->clk);
 	}
 
 	return 0;
@@ -519,7 +519,10 @@ static int sprd_i2c_probe(struct platform_device *pdev)
 	if (i2c_dev->bus_freq != 100000 && i2c_dev->bus_freq != 400000)
 		return -EINVAL;
 
-	sprd_i2c_clk_init(i2c_dev);
+	ret = sprd_i2c_clk_init(i2c_dev);
+	if (ret)
+		return ret;
+
 	platform_set_drvdata(pdev, i2c_dev);
 
 	ret = clk_prepare_enable(i2c_dev->clk);
-- 
1.7.9.5

