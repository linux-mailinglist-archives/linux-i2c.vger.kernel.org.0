Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14B0827DBE4
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Sep 2020 00:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729761AbgI2WWR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 18:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729078AbgI2WUz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Sep 2020 18:20:55 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAE96C0613D8;
        Tue, 29 Sep 2020 15:20:54 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id z17so7386754lfi.12;
        Tue, 29 Sep 2020 15:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uYSmj1/dcGbylfwNSM+OH0tTMKHeXga9gkMf1+bHFxo=;
        b=tu3vkZi7QHQkhlrYbY8QmRIZ/8WbtAWLmK9SRTZL8+Nv1qEE2NtHDhBIBRhyWfDzbi
         Tlc/ij3HVgfVmbLAcmm8aoVM99eOxHW5cfZ9wBtFpjc7Tq9KaT9tcAd18TbiThsyt/Bi
         lQVp6yV/gcxAFyu7K3mDvuvf+3IOrkJQx2jUgz0/bZhu/M/NEPJsGoX7CfCdTBmR4qN1
         K9t91oY8DRY1xrE8UI1BWub1R+YuV188zcMASnH+h0HkfRlDrl9a+eq/YG7KGsJOsn/s
         v2+xDDknu65n6N7/u//UNUfcVqGyzifhl0y0UUmQaFpla1/2enVSa1zj1Tik7R68kCV9
         aKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uYSmj1/dcGbylfwNSM+OH0tTMKHeXga9gkMf1+bHFxo=;
        b=HbiVbXFCLN5Q7MaY/JlInkFIPFCvY6s4N/oae2GSFKEt0sSCQ61xNzbTYt9LeU2jGE
         uModaUxlIOtwwAjVYDo9tohIlmIpUesaqW1TpQ2exj4XHlA5fQuabQB19u7CzK4lPAvC
         fjFTl9TE3VdDLQHg+ceNso2pJnfgVthbv8GzkeLH13ZtcX2NZgNbNWiYcmfW7b0Z5Hxn
         az2LzB9tD/AwcSTVyG5np/kucNSuf30TNtBd/Qc1PqodcDFZwMgMiQNUTkKdwZiWdLfe
         JYeRuJOXNrn3AJbFE7vzp9Pr41oR/8M6UCF1K9A0T87H7vyO8R8xqXTlNI906OeFUHo0
         aooQ==
X-Gm-Message-State: AOAM5329ZWStW/JJALZfM4vE3QD/dW1EHwcXjuLoMe/q7MMcI5HEAh49
        16QNogHtMxquqg9hoSrhdXc=
X-Google-Smtp-Source: ABdhPJxnfPvKabhK/vXlfrTkT9VDxW+6znyvxLefjahLOIyIJcqgzji0jbg6xQgEz/exs2I9uy+N2A==
X-Received: by 2002:ac2:48b2:: with SMTP id u18mr1832752lfg.185.1601418053385;
        Tue, 29 Sep 2020 15:20:53 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id q18sm3379750lfr.138.2020.09.29.15.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:20:52 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 18/32] i2c: tegra: Remove likely/unlikely from the code
Date:   Wed, 30 Sep 2020 01:19:01 +0300
Message-Id: <20200929221915.10979-19-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200929221915.10979-1-digetx@gmail.com>
References: <20200929221915.10979-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The likely/unlikely annotations should be used only in a hot paths of
performance-critical code. The I2C driver doesn't have such paths, and
thus, there is no justification for usage of likely/unlikely annotations
in the code. Hence remove them.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 347651401cd6..dc25578adb6b 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -852,7 +852,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 		goto err;
 	}
 
-	if (unlikely(status & status_err)) {
+	if (status & status_err) {
 		tegra_i2c_disable_packet_mode(i2c_dev);
 		if (status & I2C_INT_NO_ACK)
 			i2c_dev->msg_err |= I2C_ERR_NO_ACK;
@@ -1294,7 +1294,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		i2c_dev->msg_err);
 
 	i2c_dev->is_curr_dma_xfer = false;
-	if (likely(i2c_dev->msg_err == I2C_ERR_NONE))
+	if (i2c_dev->msg_err == I2C_ERR_NONE)
 		return 0;
 
 	tegra_i2c_init(i2c_dev);
-- 
2.27.0

