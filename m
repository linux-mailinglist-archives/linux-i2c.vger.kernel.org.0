Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03A02421B23
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Oct 2021 02:32:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbhJEAeT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Oct 2021 20:34:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbhJEAeS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Oct 2021 20:34:18 -0400
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F020AC061749;
        Mon,  4 Oct 2021 17:32:28 -0700 (PDT)
Received: by mail-oo1-xc31.google.com with SMTP id h11-20020a4aa74b000000b002a933d156cbso5943253oom.4;
        Mon, 04 Oct 2021 17:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M1qcgIHaPDeZOBFimBfle5VA+3VdIMSsVgxkS7mTJT4=;
        b=Ksno/c28MANOAWq2olo4ceUolsouIJXch/i3XT0FPmxuXAOaAOxVcWqpR/hMnCcde0
         fkC8XtI2GROo+nMfYe5M97ILHqD83Linr9vVpIAIWqHCSOFx9b6DBxuH19cKnkB6PB4x
         vn0srxdcf+TOt7ljHdz1q41a7H3hmoXufTuqj8ofov52u6R00dMuyasu2Ev5zJc4TfbM
         34NY/f5ffAek/tzh4d7GQs7nAHUSR4hmjC52eJCpEMqowGGLrVglJjDyKNxGLOUv33dc
         iwLJTChko1WU1wqZ3UuKTXY7LqLI89/iTleiOTbUiITKXSjcyMUKoYgkAGc+a7xRwS63
         c0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=M1qcgIHaPDeZOBFimBfle5VA+3VdIMSsVgxkS7mTJT4=;
        b=dnQMJZ5YV9G4D49AxBqlxwwi7pKPhSACIFMC0Bmd5uZftDqXyR4Lh+5ZeKH/ha9rkZ
         Xk2tFcAuCKXNesRM+70ORmM61ABIYq/XAKQZ7W19K0YJTj9K3qaHn6D6Ljx9QhQas0Qn
         b+8d8k9mmCZfn0fOiRk7bv955PZ1qV7nEBjQvBsmh9u5QfAHDJbn4tKY6R6OO618ir0l
         G1eG5XOkYXtEKbgjgIwlHIPg/WAPcfMlZCOx5ziCKeVHcrXmnjsznUWtBELWroPytr0W
         rMyGqIJ+sIFkwnacUXoRlmED9ZuAUKAd74v+kHPggXf1ib7VPh4AG/aaTXE809VHkAUo
         8WWw==
X-Gm-Message-State: AOAM533/a15KLmzCbDoqglVoPaYQXrP352ImJL+FNVyVu3bm6+Q4ZIYY
        NroePCmPN4xr3HVSLcMVRg==
X-Google-Smtp-Source: ABdhPJwUo5LF/Ewws7Lph7371x+WJMB9viQ1nsgYkhKjddV5NB77w+xq69hGLhIcCQ4yz90fZzqd4g==
X-Received: by 2002:a4a:424b:: with SMTP id i11mr11212055ooj.87.1633393948213;
        Mon, 04 Oct 2021 17:32:28 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id h23sm1119340otl.54.2021.10.04.17.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 17:32:27 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from t560.minyard.net (unknown [IPv6:2001:470:b8f6:1b:1ce5:3fb4:8fe9:30d1])
        by serve.minyard.net (Postfix) with ESMTPA id CB9F71800F6;
        Tue,  5 Oct 2021 00:32:26 +0000 (UTC)
From:   minyard@acm.org
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org,
        Andrew Manley <andrew.manley@sealingtech.com>,
        linux-kernel@vger.kernel.org, Corey Minyard <cminyard@mvista.com>,
        Corey Minyard <minyard@acm.org>
Subject: [PATCH 2/3] i2c:imx: Add an extra read at the end of an I2C slave read
Date:   Mon,  4 Oct 2021 19:32:15 -0500
Message-Id: <20211005003216.2670632-3-minyard@acm.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005003216.2670632-1-minyard@acm.org>
References: <20211005003216.2670632-1-minyard@acm.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Corey Minyard <cminyard@mvista.com>

The I2C slave interface expects that the driver will read ahead one
byte.  The IMX driver/device doesn't do this, but simulate it so that
read operations get their index set correctly.

Signed-off-by: Corey Minyard <minyard@acm.org>
Tested-by: Andrew Manley <andrew.manley@sealingtech.com>
Reviewed-by: Andrew Manley <andrew.manley@sealingtech.com>
---
 drivers/i2c/busses/i2c-imx.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 97369fe48b30..26a04dc0590b 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -769,6 +769,15 @@ static irqreturn_t i2c_imx_slave_handle(struct imx_i2c_struct *i2c_imx,
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

