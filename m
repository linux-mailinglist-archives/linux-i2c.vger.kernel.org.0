Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 812D22622FF
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 00:43:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730447AbgIHWnU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 18:43:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730061AbgIHWkv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 18:40:51 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E7ADC0613ED;
        Tue,  8 Sep 2020 15:40:50 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id w3so979016ljo.5;
        Tue, 08 Sep 2020 15:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vt074qs5q9X80njl/qgMdrzDxZl3IE1TA/FY/LhUnus=;
        b=GKaIGoW2ALg97bdq3bg3fbgjtxZIIfMy/3fNOq9Q+poS4Q3CgXXiRA1TR760nAdfuS
         OLc9b8Zh8SWxLXgBr4+fOCKK9pwyZoW79ijM+pA9fx+rmP+KK9O0KQlQdqkNhbmiucus
         q1cPRANn44Hp68WIvImEJYwShTXv423IKm60kMqwdkSk0NCjxR4HSfHUybkOZJC1K23e
         vICJm0hKZHwovNFn2sRiBQm/XoRXLrO0rYKL27CizU5JRBPnpq3+Iu1roAwAYNXexoG3
         ob3xajZ8muWsaxCz218eJ174JiQIvm1XawjnktYtmRoMplkeTdL4IAbv83YRlItgZuws
         ymQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vt074qs5q9X80njl/qgMdrzDxZl3IE1TA/FY/LhUnus=;
        b=JRIisf2BUqfKtM2xkLVAoUfU27Cewh07Rm3VfZ+xrYpaUEhxSd4hJtg9bRWCfus5At
         5i3iKIO+fJoDVPssezOD17Ewb9/pRIfHo/xnObzY4kJjmwIgOLKwde8uvgyKby+1OrNe
         E8cxuMfNJGhAe0b7i94ka16eVbmElW3ambs06c8spkB+siDGnKj3en5pYVMfWg2/dmQp
         6OQH8EN0AvbkNZCTOMB3LJdFKOC5ieWh1S2q1OHj8DliDYXJJIU1CXMgjdtve1bamIAE
         kqa6KCS6HgmKwfZbbZPzdfVwRyKBRW3ihTaET9gK3dTjj740/3mzEMjpkBDQsAZYJ+Zb
         IgxQ==
X-Gm-Message-State: AOAM530vZbR1MG3YXYm/SLdto2T9P+Cq00879dV8Zi8CqDjAU4uv0rnK
        gvCQtW6vvEYWrZq5e7YCM84=
X-Google-Smtp-Source: ABdhPJyFsMHjGA/jVCf2SfHIvrcVDY+xUHDE0CnTzJuUxwQNnvvSyBa5kOXPNYDSMBgxbLDh4ol5ew==
X-Received: by 2002:a2e:6a16:: with SMTP id f22mr317724ljc.15.1599604849130;
        Tue, 08 Sep 2020 15:40:49 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s15sm268311ljp.25.2020.09.08.15.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 15:40:48 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 18/34] i2c: tegra: Remove likely/unlikely from the code
Date:   Wed,  9 Sep 2020 01:39:50 +0300
Message-Id: <20200908224006.25636-19-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908224006.25636-1-digetx@gmail.com>
References: <20200908224006.25636-1-digetx@gmail.com>
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
index ab83d1de6c94..fd0d51ec447f 100644
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

