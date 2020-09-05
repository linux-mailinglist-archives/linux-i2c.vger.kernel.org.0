Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6301C25EA77
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Sep 2020 22:42:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728742AbgIEUmp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 16:42:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728718AbgIEUml (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Sep 2020 16:42:41 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8639AC061249;
        Sat,  5 Sep 2020 13:42:39 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id c2so11745797ljj.12;
        Sat, 05 Sep 2020 13:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HxuDydUSZoNI1+yqMsxkzReEarnq7zj4OINQ+mfVftk=;
        b=j5qNZwmzjvOCpiECSExMfb+O0OOPERaXVl7QgSzXSOq48f0jKrmM2R7YHOusPdm05d
         BDY/QyyEQjyMyGC/Ti0/MXOHWvBbKwwNR58oAj1oB7hJ8AFE1KctkeezVz30viCDZsBU
         M9KUhkHsyv/U5XrLYlQzY4AE9hvYGPATVPZlCVRnA2EE3JbajPYcBp7n64uLxCj/Ej+L
         rUizkebfgdWLS6u0lTrMn3FPmpnS21daRTxWXvWaCpsNXftCRws4UlrQCWnhkAMV+HTS
         lK6U61nWxrmRUjS1CZeF9WqwCD3cEcMrha938nyE26C9H1duRtlXa+9plo6oetNjT8RY
         EDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HxuDydUSZoNI1+yqMsxkzReEarnq7zj4OINQ+mfVftk=;
        b=XMrW2gijpadGOXm2usVqEXpUNZwdXX+OxzKn0SIe8fFMzjbh4hwapj6okUszJpyhJk
         xzQ/TTlX2/Z3oaEcTPj+a4M/nlG193wgu0JLo6cSkxOaP9x3RDwSTtNBGqiuTKfa48PX
         eeHqH8nvNHb8OLV0PqluOlsqjfA0pi7760YqXmbNRIw3cRXSuuA+wIJ2RxgcFPJb/QLY
         rir7f4WgPgAY/9ia3KpLiPI6FoHhukB1BynY8/SUm5WcAeCx1jwpS20PHIu1eW8/OKe1
         t4AFYbf7TqVLSMTEZ1iL3D/I5B4Sf4wQAOlBrf4x0nbQZ1ubKotZS3gQvBXoFQwQ+B4n
         HvzQ==
X-Gm-Message-State: AOAM532NJtUCE+hRZpC+Q/ZK4ODT3rqxeJe/xQBzS4fK0DHJ4Q7dNWrB
        2mpmfqsrXIrq4ad1/Z53Z+I=
X-Google-Smtp-Source: ABdhPJzmcCMPtkC0n/mcrr/vCOS0MR2k7/LTSEX6mRWWdd9iUzDkGrJIQhh7BvPi47NOPhQTYJVZqQ==
X-Received: by 2002:a05:651c:c6:: with SMTP id 6mr6925349ljr.237.1599338557668;
        Sat, 05 Sep 2020 13:42:37 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id e17sm1677763ljn.18.2020.09.05.13.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 13:42:37 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 14/31] i2c: tegra: Remove likely/unlikely from the code
Date:   Sat,  5 Sep 2020 23:41:34 +0300
Message-Id: <20200905204151.25343-15-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200905204151.25343-1-digetx@gmail.com>
References: <20200905204151.25343-1-digetx@gmail.com>
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
index d8b7373673ea..33d37a40fa83 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -890,7 +890,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 		goto err;
 	}
 
-	if (unlikely(status & status_err)) {
+	if (status & status_err) {
 		tegra_i2c_disable_packet_mode(i2c_dev);
 		if (status & I2C_INT_NO_ACK)
 			i2c_dev->msg_err |= I2C_ERR_NO_ACK;
@@ -1330,7 +1330,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		i2c_dev->msg_err);
 
 	i2c_dev->is_curr_dma_xfer = false;
-	if (likely(i2c_dev->msg_err == I2C_ERR_NONE))
+	if (i2c_dev->msg_err == I2C_ERR_NONE)
 		return 0;
 
 	tegra_i2c_init(i2c_dev);
-- 
2.27.0

