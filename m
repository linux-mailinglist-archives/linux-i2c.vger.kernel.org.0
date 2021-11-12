Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F46A44E78F
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Nov 2021 14:40:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235003AbhKLNm4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Nov 2021 08:42:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231436AbhKLNm4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 Nov 2021 08:42:56 -0500
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 730C8C0613F5;
        Fri, 12 Nov 2021 05:40:05 -0800 (PST)
Received: by mail-qk1-x734.google.com with SMTP id g28so4608899qkk.9;
        Fri, 12 Nov 2021 05:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uzZyUma5p9ds/38tNYS+sIv6Uq4e934H7mXIASfQ7lA=;
        b=WgIBgVJICAzaJUo6f+8dcZwd8fb24GbfgdeQT0nlTgDl6AWlCpnNv5U0O/sWzvNs0P
         AoaCgPjIVXnnal7UMzWMvbLjvmdeOteDzW1nxN+9aHxS5fi5E21wgI4HD8dgVjDvaO/c
         LCQL8H92/YwbqmAINdEak4A/WtgtEXFYRGFiWxZ4M83Ydp+1BNxcd2P94+NaHalJtkKD
         iQ5p+FKIZfwQp12eXj8J7lsPjsHOeAmcbv2CTiwmMmdRHZxA8rr0P0gJKyUUetx90IIU
         owLEy8XhmMR+5fra1Q+gee7OFJj9iagxjht5lOkrhNmoc1Micl9zMTPyaUIdACcIz5Y4
         0RVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=uzZyUma5p9ds/38tNYS+sIv6Uq4e934H7mXIASfQ7lA=;
        b=7vZWsM+UR69LfLC7RJVqyaXjO+8zu8pcsuHom23WnkBMZQcFXu9xR7o1aiA1yAm+GM
         S3/k3exUWbMemhJkB5uGlDJI/ieomo/kVwXY0VUDV7mKtiRnxQ5iCIgBV+2ERcu9YmVY
         BNHCEa4RbZEeaKu0DomWrN10lHet7CLV/vIrjdGYhQhF8eFdQ00eAWRWpIosOFZbPICx
         m0Bga30dLC+fYbdWtjmNB15RYenp6YYCujeqgv9ONNhweizMlhkB8uRLoKpgUUh6VqtJ
         BF/bDByAO+i18BMiYcWoMVgaKraMnA7KdC/ih19DE0zNsGh36ItV+B7B3ELJpIGFHdem
         kQfA==
X-Gm-Message-State: AOAM532JirddfivywmTB36FeusZaXOztc8QEzF1GiWBUWbKrydWsD2W9
        2YzgAOskkVrUSPGKofXGQQ==
X-Google-Smtp-Source: ABdhPJzLPoxprwTwj30iu1WaOXTQLHMFS1pcAV/DPSsctPV1lRdXDUDLpfCLDU1oWb9VeQCR2G8Sow==
X-Received: by 2002:a05:620a:1585:: with SMTP id d5mr12078013qkk.96.1636724404584;
        Fri, 12 Nov 2021 05:40:04 -0800 (PST)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id m4sm3019642qtu.87.2021.11.12.05.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 05:40:04 -0800 (PST)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from t560.minyard.net (unknown [IPv6:2001:470:b8f6:1b:3da4:ae9:63f5:5ac8])
        by serve.minyard.net (Postfix) with ESMTPA id D432A1800BC;
        Fri, 12 Nov 2021 13:40:02 +0000 (UTC)
From:   minyard@acm.org
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Corey Minyard <minyard@acm.org>,
        Andrew Manley <andrew.manley@sealingtech.com>
Subject: [PATCH v2 2/2] i2c:imx: Add an extra read at the end of an I2C slave read
Date:   Fri, 12 Nov 2021 07:39:56 -0600
Message-Id: <20211112133956.655179-3-minyard@acm.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112133956.655179-1-minyard@acm.org>
References: <20211112133956.655179-1-minyard@acm.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Corey Minyard <minyard@acm.org>

The I2C slave interface expects that the driver will read ahead one
byte.  The IMX driver/device doesn't do this, but simulate it so that
read operations get their index set correctly.

Signed-off-by: Corey Minyard <minyard@acm.org>
Tested-by: Andrew Manley <andrew.manley@sealingtech.com>
Reviewed-by: Andrew Manley <andrew.manley@sealingtech.com>
Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 drivers/i2c/busses/i2c-imx.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 27f969b3dc07..41355fc8bff4 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -771,6 +771,15 @@ static irqreturn_t i2c_imx_slave_handle(struct imx_i2c_struct *i2c_imx,
 		ctl &= ~I2CR_MTX;
 		imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
 		imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
+
+		/*
+		 * The i2c slave interface requires one extra dummy
+		 * read at the end to keep things in line.  See the
+		 * I2C slave docs for details.
+		 */
+		i2c_imx_slave_event(i2c_imx,
+				    I2C_SLAVE_READ_PROCESSED, &value);
+
 		i2c_imx_slave_finish_op(i2c_imx);
 		return IRQ_HANDLED;
 	}
-- 
2.25.1

