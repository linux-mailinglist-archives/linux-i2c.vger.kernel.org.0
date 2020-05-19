Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CBF41D9A3C
	for <lists+linux-i2c@lfdr.de>; Tue, 19 May 2020 16:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728647AbgESOn4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 May 2020 10:43:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726504AbgESOn4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 May 2020 10:43:56 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8793BC08C5C0;
        Tue, 19 May 2020 07:43:56 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id x10so5716198plr.4;
        Tue, 19 May 2020 07:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h+eGPpRR6jS7JbQ7gKvWLA9NkPn3/BFF/n/Sa2VGbts=;
        b=pBNoVHNQaZgmrxDCEA+MqLIeHIL92AcM9T7/grd00MyQ8mDM2qFddLWCjeM7A9CPh5
         ty82Mu+quQqBvMGpU25lI3HoP4EMSPQTM7v0N1qPgK0iJvat0FNXjnPpq938uzYUU2fg
         BFnwsNKhWWhvvT+7ybnSoOk2nR9b8SocPoqbBtrKGLH7t96wBz0hAm/rLPobk5f8vmda
         EczsWjkvrU6HLpTGHZrli0HTzYXxdx7+vqeB1KAQ2Pc1RXIJoT82qJ5FoFtkSeL6tn8K
         JABwebzTA+W/aVyWkzht7pF1cGec5cPPp71DhMXiWkOUqA1QcmsvY68fb4H/pweyu9Bj
         XHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h+eGPpRR6jS7JbQ7gKvWLA9NkPn3/BFF/n/Sa2VGbts=;
        b=cYrbz3pmpSfMg2Gv39JKHnzKcrSNWvdxHoFAslum3jvkl2Hdtf1nph37uj6YqVozg9
         TZ8mbY+Bk6+OSAEnjMBzfMvgGzyWxcPvuGgfSwBhe4uFVn1BesKp4jGuv7AuRPki0/k/
         rvQHe4l8pTZ63pfK6PXvyOc4yEu0iz8uTto1DB496PjdxUR9gJgn+a64f7jeT0kZKvz3
         gmpeR1iXsXPfsGtUSn7UC81Wbrj5qPX4uS+ZJ31X6G6yTugmnipIPBMENmPkF/2x2ez3
         mAatX+1zFrgNc+VsdUtvq/2DKUfBJ0JKznd5Ir2epI7DY0CVkv3np6gy6nvnpbBOCeYm
         Ni2g==
X-Gm-Message-State: AOAM5322uuraSWIDdU2QFqw8yg2aEjnOWzQc0upgqx0aJk1v+GG8IPVB
        QKpBvXd+0Z90u1bXq+hkAvwJAYee
X-Google-Smtp-Source: ABdhPJw9Nmz3nsLfXj064B9slnbSSXBUrxrermjCTg+ltCASNzuwQY3DUsQbxIJyQesPrcxu2WcUrg==
X-Received: by 2002:a17:90b:3650:: with SMTP id nh16mr5601271pjb.135.1589899436117;
        Tue, 19 May 2020 07:43:56 -0700 (PDT)
Received: from localhost ([176.122.159.242])
        by smtp.gmail.com with ESMTPSA id j24sm10472995pga.51.2020.05.19.07.43.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 May 2020 07:43:55 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     wsa@the-dreams.de, michal.simek@xilinx.com,
        linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v1] i2c: cadence: Add an error handling for platform_get_irq()
Date:   Tue, 19 May 2020 22:43:21 +0800
Message-Id: <20200519144321.27483-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The driver initialization should be end immediately after found
the platform_get_irq() function return an error.

Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
 drivers/i2c/busses/i2c-cadence.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 89d58f7d2a25..0e8debe32cea 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -912,6 +912,8 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(id->membase);
 
 	id->irq = platform_get_irq(pdev, 0);
+	if (id->irq < 0)
+		return id->irq;
 
 	id->adap.owner = THIS_MODULE;
 	id->adap.dev.of_node = pdev->dev.of_node;
-- 
2.25.0

