Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF83E25B7E3
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 02:55:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728089AbgICAzE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Sep 2020 20:55:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727850AbgICAyE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Sep 2020 20:54:04 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5176EC061258;
        Wed,  2 Sep 2020 17:54:03 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id w14so1425478ljj.4;
        Wed, 02 Sep 2020 17:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VamW4g68C5b6NPnr1l/ygTA7JsnogO0OP3lCYu1cXgk=;
        b=frHZBORw9/iOe8CqIH+ikgHkZzww05tHNg/giOGrn/27AF6nhu03t3N3o57xXGPENy
         IPXYBcuKckAwR3IlDUa5RN53+k3FeNJJCuQHDvYZWHXYyfBxDPCrVSTHtY5llw4A58F7
         gfU7FP2z5dadpHouCXofUSh6AjGWhhEbmL41X9QMfKD0t+P6XSH7pwPPul4gGoou3Zdz
         ltsDkxtiy+ju+kjcKuxlXfyBt33ZBSNqEazf8AK4DBJ9R7EyecpRB9mqBtt3KpyGXjfB
         dbTEfllb2PjkV4e8zpbAPRh47vllLrgVmK2vcZY+yB5AgoQQd8UB9VaS/RjbBSMu89TY
         QKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VamW4g68C5b6NPnr1l/ygTA7JsnogO0OP3lCYu1cXgk=;
        b=lfrUfxlk1k/8UMK4eYYfTw0VrpeiT9bcfxkJ2dvyvNp/MhvwbxKJHALUb9Mu6UAGLz
         jtGpjudAHUbKx0VDZmrvc2vFYIoEYMC3DhZXltnbM9Et6/zb2S2HN2M8dTL5qIuWEnI7
         Vsnmnr85WDTQsaH4wwN1bTf74HtrfLPOT9zsTOkPNs+NmxRknQCvxlXeU0fWzRIWgEeA
         zhYC/0I8H9nB2iWhHe3YcbpUvPF1knzgwGY8JusA6B8FQD16UhAPRe3HTU4+031NUnGr
         e9J+9JFpQLv9v/MzriAwH0HfVts4aZ9EheOsF5xDegQRnQQ9/DBU/x/PaaJjvGtH5AqM
         lw/Q==
X-Gm-Message-State: AOAM530Svqr1DlhmOgBZwj3jAPaKy2ieUoKqhbAw9N0XAayKcwWy/TDO
        zLRXpjw9QJU30xj/ypoxA8cZbNNKZmg=
X-Google-Smtp-Source: ABdhPJzNWkKAnDMwdzFMccVeeUpfP/qOhd2xxweByKzEzgnaL/wvaM7U7VfQ/J/+CQG110ICHU93Vg==
X-Received: by 2002:a2e:7c14:: with SMTP id x20mr292181ljc.220.1599094441779;
        Wed, 02 Sep 2020 17:54:01 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id g1sm250321ljj.56.2020.09.02.17.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 17:54:01 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 11/22] i2c: tegra: Remove likely/unlikely from the code
Date:   Thu,  3 Sep 2020 03:52:49 +0300
Message-Id: <20200903005300.7894-12-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200903005300.7894-1-digetx@gmail.com>
References: <20200903005300.7894-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The likely/unlikely annotations should be used only in a hot paths of
performance-critical code. The I2C driver doesn't have such paths, and
thus, there is no justification for usage of likely/unlikely annotations
in the code. Hence remove them.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index ca43eb86403b..f6b9345b8dfa 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -921,7 +921,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 		goto err;
 	}
 
-	if (unlikely(status & status_err)) {
+	if (status & status_err) {
 		tegra_i2c_disable_packet_mode(i2c_dev);
 		if (status & I2C_INT_NO_ACK)
 			i2c_dev->msg_err |= I2C_ERR_NO_ACK;
@@ -1351,7 +1351,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		i2c_dev->msg_err);
 
 	i2c_dev->is_curr_dma_xfer = false;
-	if (likely(i2c_dev->msg_err == I2C_ERR_NONE))
+	if (i2c_dev->msg_err == I2C_ERR_NONE)
 		return 0;
 
 	tegra_i2c_init(i2c_dev, true);
-- 
2.27.0

