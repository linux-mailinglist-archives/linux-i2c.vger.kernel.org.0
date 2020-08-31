Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BCC5258273
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Aug 2020 22:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730021AbgHaUXm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Aug 2020 16:23:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730012AbgHaUXi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Aug 2020 16:23:38 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44B06C061755;
        Mon, 31 Aug 2020 13:23:38 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id t23so8246041ljc.3;
        Mon, 31 Aug 2020 13:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5O0l+Bq/1wXJwQvYBDxAgJWZ0eTWjkmkrvvVOAIAir0=;
        b=EZzqYpEO992KMUFaPjDM10IzYBgd2wd1BfoO4qpLA88MEuESOvEuC4k4PhwlB6VGLX
         csjALF/iMczy/bt9yWYAhRDVxsLMKvV88Rq7FOiQJaqekqSBLMy3Lt6fCnp1p76oY0/D
         MDqm8mw6poUaD8sSSVSdVfK5V6T17bl2Mr02WYIqVmaGSZ+/ZHGJtFlSGTWgcvqqr3ZA
         rMVheDSxnfBqiTAxVBa4o0c+3mtzgr0TVib4zRVXjb1EMqp30y+Fa8OuQY9XXcHYgKem
         NhRh7WdHzQe7qpco0xHHcZZ2Wd5OlVYxELWlWhP6MGByLN4Qh8pGUDAY6KcaJk1RJA3v
         KTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5O0l+Bq/1wXJwQvYBDxAgJWZ0eTWjkmkrvvVOAIAir0=;
        b=a53Pc5jbalfo7SFfwbGGzO1RKmGPDxdbL9a5WTlOdUgRKVtUTbxOTFwxhzxGNsTJ72
         Sh0JtrgSVl4BLm7chdITX6VM64WN7iiUqLC4gtejeLlQalPha7bdB9UmrxY8t6XEJ+14
         m0M+e7auoeKen1fdquOUw/RVajflqZqWW5JAYeSYmBseCWJQEv3dIx726sCOMxcu0Ufu
         C4KMhwOBq2kDkiX6NHSEDkzR1PwowPo268szYzVzXHaBAJmp4DHniQAx8MCeUvwI8csy
         0kX4/S0L/Z39kWAOnQHYWH8MvLaqZS2mlacUXOyrM+xoC6YD6p/JlzG50X2SlYGa+j6b
         aSOA==
X-Gm-Message-State: AOAM533CnObwtYrNbU+84wza2INucIB2Zv15adw6UnLiH4xE42Sc0OCv
        CJCsOQVteANsQz53mj7AyFc=
X-Google-Smtp-Source: ABdhPJxkqPcqa95PPehmNojOvbeYBYkWZ/z5d1pbUE1VKbiuLHKegekHB2uGofevUy1PCMj8dop6PQ==
X-Received: by 2002:a2e:7c0f:: with SMTP id x15mr1437701ljc.205.1598905416785;
        Mon, 31 Aug 2020 13:23:36 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id z20sm1769054ljk.97.2020.08.31.13.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 13:23:36 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 12/12] i2c: tegra: Factor out error recovery from tegra_i2c_xfer_msg()
Date:   Mon, 31 Aug 2020 23:23:03 +0300
Message-Id: <20200831202303.15391-13-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200831202303.15391-1-digetx@gmail.com>
References: <20200831202303.15391-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Factor out error recovery code from tegra_i2c_xfer_msg() in order to
make this function easier to read and follow.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 46 ++++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index d9b9fe6b5637..c2803fe9d834 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1161,6 +1161,32 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 	return -EAGAIN;
 }
 
+static int tegra_i2c_error_recover(struct tegra_i2c_dev *i2c_dev,
+				   struct i2c_msg *msg)
+{
+	if (i2c_dev->msg_err == I2C_ERR_NONE)
+		return 0;
+
+	tegra_i2c_init(i2c_dev, true);
+
+	/* start recovery upon arbitration loss in single master mode */
+	if (i2c_dev->msg_err == I2C_ERR_ARBITRATION_LOST) {
+		if (!i2c_dev->is_multimaster_mode)
+			return i2c_recover_bus(&i2c_dev->adapter);
+
+		return -EAGAIN;
+	}
+
+	if (i2c_dev->msg_err == I2C_ERR_NO_ACK) {
+		if (msg->flags & I2C_M_IGNORE_NAK)
+			return 0;
+
+		return -EREMOTEIO;
+	}
+
+	return -EIO;
+}
+
 static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 			      struct i2c_msg *msg,
 			      enum msg_end_type end_state)
@@ -1341,24 +1367,12 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		i2c_dev->msg_err);
 
 	i2c_dev->is_curr_dma_xfer = false;
-	if (i2c_dev->msg_err == I2C_ERR_NONE)
-		return 0;
 
-	tegra_i2c_init(i2c_dev, true);
-	/* start recovery upon arbitration loss in single master mode */
-	if (i2c_dev->msg_err == I2C_ERR_ARBITRATION_LOST) {
-		if (!i2c_dev->is_multimaster_mode)
-			return i2c_recover_bus(&i2c_dev->adapter);
-		return -EAGAIN;
-	}
-
-	if (i2c_dev->msg_err == I2C_ERR_NO_ACK) {
-		if (msg->flags & I2C_M_IGNORE_NAK)
-			return 0;
-		return -EREMOTEIO;
-	}
+	err = tegra_i2c_error_recover(i2c_dev, msg);
+	if (err)
+		return err;
 
-	return -EIO;
+	return 0;
 }
 
 static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
-- 
2.27.0

