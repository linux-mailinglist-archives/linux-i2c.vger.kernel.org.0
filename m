Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82A7A29E4D7
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Oct 2020 08:49:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387744AbgJ2Hrs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Oct 2020 03:47:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387809AbgJ2Hrp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Oct 2020 03:47:45 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A764C0613CF;
        Thu, 29 Oct 2020 00:47:45 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id r186so1679758pgr.0;
        Thu, 29 Oct 2020 00:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uv2FWQlSBJFmE706ogx6rH+lBxHwtXvvktU8G7mdeHE=;
        b=UkuEIBksTIBEx0rU9xx8YSrprU5SuhUkN7XbFd8Ss4WqdzUiRKgQToHyt959jtOKzE
         descPPhCAOW0XNzIJF1XRtujK2NMKSeIKOais3aepphrSUfUB3jAs7x01P+pOrYsaygI
         tksDMUUbjLTMKxTbn4Cb5pdlHLDgNO0QF4+tJM9jsZ6ThxQ7y5mXMg7ujImMn+wzmyRR
         8i0IxBH/r//xZ1LE6r79PribG82uJ0XwUtm05Dd+IXedix0wIz0c9GdQkKf0oNQ3vD5Y
         elnrMVaYVrgf9Fb4wuKD93ftXMWvP7e9uCX8HlzzQ/4hXezZp/iJaHbuaZ1IQDyaoEUH
         xBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uv2FWQlSBJFmE706ogx6rH+lBxHwtXvvktU8G7mdeHE=;
        b=DAH6224FMVUeZ9gxFYFIeYVx1SF7cJjungQyeufiTrHW2wZZJdi8wtLVcck6WjYSrt
         AuR10kweLVeEoV5pXVaQVsBlMtf9oIA2/L46dq32jSREe1VhIyXE+mX5xEVTCyskQptS
         9qCagr3zRd3Kd/nwl0ts8neEVfO4VHR/HC8KvmHT76FBmKSzT7Hr23e/rDb8AGYCyIqW
         MwZG/NrMfR6hx8iEG8tXvWgOhaSA0/4LPw8GjqnMumtB7+0FQ2sN4zDsgJqtpfjVTMtn
         d9WVgTp2zlRr6lW6TtGXxPsukZRMjyUZkxCvfpbI+GKRQO8XuHmGf3R/c9DpKkHaCZgd
         evwg==
X-Gm-Message-State: AOAM532SPF2vcYbmkfyir63ozfpWrmMubI5dYDdvzfrLzDmCV6K5oNeO
        J3B1+srwDUawV8IUitH7EbrzU5FeqC79L0tr
X-Google-Smtp-Source: ABdhPJxKwsyEZXm+NRlnPeeDS94chF16rqocvuwXKW/X+8833uLeRKJCpBpQq0NAIMLEiiDLcXXemA==
X-Received: by 2002:a17:90b:17c3:: with SMTP id me3mr2716736pjb.56.1603957664762;
        Thu, 29 Oct 2020 00:47:44 -0700 (PDT)
Received: from localhost ([160.16.113.140])
        by smtp.gmail.com with ESMTPSA id z5sm1834680pfn.20.2020.10.29.00.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 00:47:44 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
To:     linux-i2c@vger.kernel.org
Cc:     Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32
        ARCHITECTURE),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32
        ARCHITECTURE), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 5/5] i2c: stm32: remove unnecessary CONFIG_PM_SLEEP
Date:   Thu, 29 Oct 2020 15:46:54 +0800
Message-Id: <20201029074654.227263-5-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029074654.227263-1-coiby.xu@gmail.com>
References: <20201029074654.227263-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SET_SYSTEM_SLEEP_PM_OPS has already took good care of CONFIG_PM_CONFIG.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index f41f51a176a1..95ac9dfdf458 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -2262,7 +2262,6 @@ static int __maybe_unused stm32f7_i2c_runtime_resume(struct device *dev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int stm32f7_i2c_regs_backup(struct stm32f7_i2c_dev *i2c_dev)
 {
 	int ret;
@@ -2356,7 +2355,6 @@ static int stm32f7_i2c_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops stm32f7_i2c_pm_ops = {
 	SET_RUNTIME_PM_OPS(stm32f7_i2c_runtime_suspend,
-- 
2.28.0

