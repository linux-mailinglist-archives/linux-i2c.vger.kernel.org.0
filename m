Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7D3781958
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Aug 2019 14:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728681AbfHEMbw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Aug 2019 08:31:52 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:45801 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728144AbfHEMbw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Aug 2019 08:31:52 -0400
Received: by mail-pl1-f194.google.com with SMTP id y8so36439474plr.12;
        Mon, 05 Aug 2019 05:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=sqV3s1K4ns9GNRz+g3OmEaOqbEW74Ump8unGoU9qEjg=;
        b=f6z1Pblsnub+mS8CYJfFLKu4rUlG4HLRKLG+TwMtUylc6+JoSJuziEDRFVwjAwiQh4
         2ZAvhgAmyYdrkzKEOSyG+aT/rl3meCnWQztBVsX9b8kwrdutRO/d/qqQFoI2oSra2JW/
         04hfJ9nF12lsZ0MqFLh6AWLHYNnN/Sf8A/sg+JOjhkg7Gdhc4veFr7txdwB2ztjdbSQZ
         /rM4Ely7QK6C6a2d4h1rPmtpj1cax3Ql+7nVt1fZfmUNmoUiW/0F5uYO7Xd7RAks+Ni1
         RKMHxYjbja0tMgbSwsD4dQ5lCJyKwet0F4aS2XKORfa+JerJo506DQhe2aIizLGs9BTu
         +XKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=sqV3s1K4ns9GNRz+g3OmEaOqbEW74Ump8unGoU9qEjg=;
        b=S0cNFVgr+Z8uWKQ/ldAJe3iaGibrGu8TPwYwGaHzPgCi9bDhi0hvIzdNF63IkQsXTG
         0nHz70mr8hXf0tQAErfROrEnMGv8fW8UfXn9LE2Ekzon+KkUxoetcP9FdjJ/L01HyQ+P
         r1L8e5ndO9Db5A+AfDh22lou8BsvS3E1vXDJV3HopVMvN3Z1h016kMQxxxuAT45V22MU
         sPGZg9sA9W85eOWyQXz1S8ked64r3afCkCwzi5QSIknlLC595WFLnrq1b5/QTfCTIjjj
         Jg9naTP6DwFgbl+zvTQTNvG0lecKuyF5Id6+ibMpN+PSx+wGTWpePJfqRYrhH1VP3ELF
         fMjw==
X-Gm-Message-State: APjAAAWbBOcW/jyTxsv9NsP4n7CiwjFunWjrZkWMmH+XMIudj8iHTnWg
        vFM8tUS8eMIWgXy8FlzTA992S2FJNtM=
X-Google-Smtp-Source: APXvYqwUXaGe1XPCUVLysfhJwuZu+MPxpvv5ljQ0VMfEZzHTo9f81Bll8bj+CXZ+ds+14JP2az45Cg==
X-Received: by 2002:a17:902:8a94:: with SMTP id p20mr143610300plo.312.1565008311500;
        Mon, 05 Aug 2019 05:31:51 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.googlemail.com with ESMTPSA id u3sm18958550pjn.5.2019.08.05.05.31.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2019 05:31:50 -0700 (PDT)
From:   Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fuqian Huang <huangfq.daxian@gmail.com>
Subject: [PATCH] i2c: avoid sleep in IRQ context
Date:   Mon,  5 Aug 2019 20:31:34 +0800
Message-Id: <20190805123134.23199-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

i2c_pxa_handler -> i2c_pxa_irq_txempty ->
i2c_pxa_reset -> i2c_pxa_set_slave -> i2c_pxa_wait_slave

As i2c_pxa_handler is an interrupt handler, it will finally
calls i2c_pxa_wait_slave which calls msleep.

Add in_interrupt check before msleep to avoid sleep
in IRQ context.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
 drivers/i2c/busses/i2c-pxa.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 2c3c3d6935c0..b35a0e8efcb2 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -443,6 +443,8 @@ static int i2c_pxa_wait_slave(struct pxa_i2c *i2c)
 
 	show_state(i2c);
 
+	if (in_interrupt())
+		return 0;
 	while (time_before(jiffies, timeout)) {
 		if (i2c_debug > 1)
 			dev_dbg(&i2c->adap.dev, "%s: %ld: ISR=%08x, ICR=%08x, IBMR=%02x\n",
-- 
2.11.0

