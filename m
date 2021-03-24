Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D1DC347A2C
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Mar 2021 15:05:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235686AbhCXOEv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Mar 2021 10:04:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235859AbhCXOE3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Mar 2021 10:04:29 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37ED0C061763;
        Wed, 24 Mar 2021 07:04:29 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id q3so18070762qkq.12;
        Wed, 24 Mar 2021 07:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CpPLSn6SC+tjm/MP07tit/iX5OAxIHrELjJluCN4+Z4=;
        b=gK5Mfehw83CQNoo5eO1MGPKzFRwSFCx1vqAA28oFXLRTV77chR4gF8N12l9TMcl97r
         cWvV5XnWYoGjF6ouRwSJenqexpLsuARyB0/VwUZmMxruLd8c8kxXLjQzV1x1mubb8UGX
         1aU3vVsN/vvRK0/ygLinYq36Q7Oxr09rXYsAkWHsgc4phugCighwF47+TdD4h8VNYFzv
         7BsGHqcprnPLKvo/sc4vKNFTA+m3a4VySXoulxk5pmA3cDOZWwdzg6rgVBFQFZEXmdVs
         2sx0muI+K5n2Eqvp8Ds9THCqMm2lfsC2MCg+NKWQCb6ThIcqOPdEITvJFZnaADU/Opbw
         z6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CpPLSn6SC+tjm/MP07tit/iX5OAxIHrELjJluCN4+Z4=;
        b=l7bjn+IdtXucBCTNWsti8b62OvhBNG7rU9/QlX3KEW3GlmQ+9WYy4OwvPAfcPEpGLf
         qIEddQocHMeQVlK1cDWz4x3CrYdmFMKBVDfj8ygkLYGz5qPbjBwVa9z3Ha4uy2p2J6JH
         zx10iGvSO+C7TsKijHrQ4ig4/DWCC9AneZ/HNBKt9fQe7nzmDSs7geUFTXQnk/JKXKmY
         xVplVEy3nbJvxoqDUaEfyBmGJEfL9QcKb7o29kkHS2ExQXaiAeRDwXXRXiWFjoY5BY8t
         iDIwJJRr6tx7i4H2CX+4h9HzDLqYQo80pBwQ9AmR5ERYyOsbB+smzgxCUAJGKCc24Rn7
         wEzQ==
X-Gm-Message-State: AOAM531RV2f7UHerV1BSDGhGg2ClQd7HwVCee+cE53NEnz3+4sEddmT5
        +I8QuwluIWdI2h8+KWaYPXs=
X-Google-Smtp-Source: ABdhPJxvFiADFOynFmLKf93cGd6AwCKXxls8SlNl74wx2zHm5MoUxa6OiY+hjvXImOw9EEkuYUg7Uw==
X-Received: by 2002:a05:620a:2013:: with SMTP id c19mr3175599qka.403.1616594668546;
        Wed, 24 Mar 2021 07:04:28 -0700 (PDT)
Received: from Slackware.localdomain ([156.146.36.138])
        by smtp.gmail.com with ESMTPSA id s6sm1524096qtn.15.2021.03.24.07.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 07:04:27 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, p.zabel@pengutronix.de,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] i2c-stm32f4: Mundane typo fix
Date:   Wed, 24 Mar 2021 19:36:10 +0530
Message-Id: <20210324140610.32385-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


s/postion/position/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/i2c/busses/i2c-stm32f4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
index 937c2c8fd349..4933fc8ce3fd 100644
--- a/drivers/i2c/busses/i2c-stm32f4.c
+++ b/drivers/i2c/busses/i2c-stm32f4.c
@@ -534,7 +534,7 @@ static void stm32f4_i2c_handle_rx_addr(struct stm32f4_i2c_dev *i2c_dev)
 	default:
 		/*
 		 * N-byte reception:
-		 * Enable ACK, reset POS (ACK postion) and clear ADDR flag.
+		 * Enable ACK, reset POS (ACK position) and clear ADDR flag.
 		 * In that way, ACK will be sent as soon as the current byte
 		 * will be received in the shift register
 		 */
--
2.30.1

