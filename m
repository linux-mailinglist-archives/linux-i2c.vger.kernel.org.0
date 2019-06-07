Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24C5638624
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 10:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727315AbfFGI3G (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 04:29:06 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33481 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727610AbfFGI3G (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jun 2019 04:29:06 -0400
Received: by mail-wr1-f68.google.com with SMTP id n9so1260715wru.0
        for <linux-i2c@vger.kernel.org>; Fri, 07 Jun 2019 01:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jzlILgVOq+qa8QnWXtHWObcbjxta0J+JIjopEg5uUuk=;
        b=cOSA5ceD6DU90AczpWWeDFQqT7XMn1TslGtXrC+8Qgjy95ZdnObkBVL8UMmW9IYqFZ
         ly1EA8Xk7mSCU+6Q97tX0JUm4+q68XTAiT5Mh8Stkx6bEhUsxeOx0qdEw45vNnkrBk/o
         /RGAxiHMWRp1LjcUAV0QP4+SMHQaUjIfnlbdXIt5EEi3e6g1JqKnlSvd2p5n9IskMzYX
         O5cxIdBRkHbuQletelSuTniO4lKcrqHCsUaTJOOH/wwIODiqHSs2BZLqtQUKArJK3uEh
         3zDlBQREIzgp71Rt4d6nl5fPxN2UMvLeReBM/2nuGvF5iobsw4ccx3az8ignVslYorRA
         pELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jzlILgVOq+qa8QnWXtHWObcbjxta0J+JIjopEg5uUuk=;
        b=ElB0t2eHojm5k//CPuYfssrELurQEtUxn1FGkaEs3AX+hYwmWy9gGHhzJPFs/1Ok4r
         KBtkRHQaaw8XAV+5Sg3SJpjHA7eREgGZ6OaB0RSn8jtK6v5BLYooxmbwh7ERqCi07rnv
         0CQ4bqiyqF9vJ9hhte/jAkAl0kykt7PczQwweppa/ppAsCgSoQ4VHKH7EH2eyQ93g/cX
         ZMUx/B+zWrdFfHeP5ZbAIN8ubFdS790WKiwmBaxo9xuDI5nlzFxE/HJX/2oil7W4qdgl
         6Nl1SUQ8ffg2LVlFmvlr82DojMStEnJ8DytwqC9ND0s/k4zJ1kfxIxARJTvHYhG0Rj7F
         EK1w==
X-Gm-Message-State: APjAAAVU3gXlAO+Yry5ToYu5woCUdYe2LTi5onncZnpKHdPeKHpmtE/M
        Lk2dK34Kbtm4kdwvioedavOmWQ==
X-Google-Smtp-Source: APXvYqx1YuZGxxKFiVBuD7xZybj8kxKfRJulFeBpjaeUZaRQAyQoPtZmlBqhdZPXDhNc0hnte6SOyQ==
X-Received: by 2002:adf:e344:: with SMTP id n4mr8538433wrj.192.1559896144520;
        Fri, 07 Jun 2019 01:29:04 -0700 (PDT)
Received: from localhost.localdomain ([2.31.167.229])
        by smtp.gmail.com with ESMTPSA id a3sm1092946wmb.35.2019.06.07.01.29.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 01:29:04 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, andy.gross@linaro.org,
        david.brown@linaro.org, wsa+renesas@sang-engineering.com,
        bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jlhugo@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 2/8] i2c: i2c-qcom-geni: Signify successful driver probe
Date:   Fri,  7 Jun 2019 09:28:55 +0100
Message-Id: <20190607082901.6491-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190607082901.6491-1-lee.jones@linaro.org>
References: <20190607082901.6491-1-lee.jones@linaro.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The Qualcomm Geni I2C driver currently probes silently which can be
confusing when debugging potential issues.  Add a low level (INFO)
print when each I2C controller is successfully initially set-up.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 0fa93b448e8d..720131c40fe0 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -598,6 +598,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	dev_dbg(&pdev->dev, "Geni-I2C adaptor successfully added\n");
+
 	return 0;
 }
 
-- 
2.17.1

