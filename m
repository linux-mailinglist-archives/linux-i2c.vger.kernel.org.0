Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B31AF612CCD
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Oct 2022 21:35:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbiJ3UfV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Oct 2022 16:35:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229909AbiJ3UfJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 Oct 2022 16:35:09 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3DF7BC0C;
        Sun, 30 Oct 2022 13:34:43 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id f16-20020a05600c491000b003cf66a2e7c0so2311329wmp.5;
        Sun, 30 Oct 2022 13:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ITcMCaKfMZfpT5FNI3zHkV64gyDtL5X1yd5OeMk6v78=;
        b=ZXKYgW2OmUN+mOeH+tEszk3tevmdmmSH8NV6DLpJ8vDP//0HHJC6J/EuFOsCjnlWmv
         kWknIQTJL5wfogjwX9ZxA2adFQQkVUfARYye1syIM+QUqfKuuixvoZE4oGZ2MH3Z37IT
         5fCrl34VpUmzFHMzuklsoWg45dAxmh//WAmgPbFfsKzR4Vn3Vf8BjRp7dYU06p+sjsAj
         dP/7yzJJfYVi0pS+KznAD/OiG+G3nGrxXzoWL4TbvchSHPwH8kRCSsglyCe2opMsh2l/
         FJadjV9UVYbzdwbS+Dv+w4G6+PrPmNzeWviB4GwLHsDyETI5zcDjxO2w6i5Jj6WILS9T
         dUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ITcMCaKfMZfpT5FNI3zHkV64gyDtL5X1yd5OeMk6v78=;
        b=QUTihgeS5nyu8Mpi5UcrOtptnK4dpkYDdYvAXu7ReUhMyVIta3+u8wrQsdIEAoF6aq
         bzdXE1FCrlZs1qEEtpReQ+NAUI+P24IXBJzFehG1p4ZnAuKrnp8R5qSrnCsEpMknMBPJ
         nNR63f1Pb4kSPOIP+6txTV8gtSsCYZJaAte+DpYxQqFZqnQBCulHby1Yo5kQZKxfKJIC
         9+hZJrJpXaFvYqCNtL8SZGWipHduIO9trxRaUD1AlwFkWYfya8Q1ofzHpDL99wi2rD9Q
         Ylgp8OtuZW9SDtHvl63bp5djN/asNM3nG/CJRzAsuXFDt4RvOpv0jdbKZNhot+OiYiKq
         8PPg==
X-Gm-Message-State: ACrzQf0fG5bJddaBDR6aTA6ovpQlmyT4w+0Kr5KmLvWLzC1KO69WgjLp
        UHoxE3AkVbqeiTsp+IBx748=
X-Google-Smtp-Source: AMsMyM5cS1XXi9FhT0S9YX0QH41H8184CWU4WzeFAJo5pztK7u4CONZRIZbxMTaeIhc1ZvzukelhSQ==
X-Received: by 2002:a05:600c:5486:b0:3b4:7e47:e19 with SMTP id iv6-20020a05600c548600b003b47e470e19mr5929744wmb.12.1667162082460;
        Sun, 30 Oct 2022 13:34:42 -0700 (PDT)
Received: from michael-VirtualBox.. (89-139-44-91.bb.netvision.net.il. [89.139.44.91])
        by smtp.googlemail.com with ESMTPSA id n25-20020a05600c181900b003b95ed78275sm4939385wmp.20.2022.10.30.13.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 13:34:42 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     jikos@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org, germain.hebert@ca.abb.com,
        Enrik.Berkhan@inka.de, Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v3 11/12] HID: ft260: fix a NULL pointer dereference in ft260_i2c_write
Date:   Sun, 30 Oct 2022 22:34:02 +0200
Message-Id: <20221030203403.4637-12-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221030203403.4637-1-michael.zaidman@gmail.com>
References: <20221030203403.4637-1-michael.zaidman@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The len=0 passed into the ft260_i2c_write() triggered the NULL
pointer dereference in the debug message on access to data[0].
Since a Write without data makes little sense in this context,
do not allow it.

Before:

$ sudo i2ctransfer -y 13 w0@0x51
Killed

After:

$ sudo i2ctransfer -y 13 w0@0x51
Error: Sending messages failed: Invalid argument

Reported-by: Enrik Berkhan <Enrik.Berkhan@inka.de>
Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
---
 drivers/hid/hid-ft260.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 00cbe7693ba0..b3f715f6ea86 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -395,6 +395,8 @@ static int ft260_i2c_write(struct ft260_device *dev, u8 addr, u8 *data,
 	struct ft260_i2c_write_request_report *rep =
 		(struct ft260_i2c_write_request_report *)dev->write_buf;
 
+	if (len < 1)
+		return -EINVAL;
 
 	if (time_is_before_jiffies(dev->need_wakeup_at)) {
 		(void)ft260_xfer_status(dev);
-- 
2.34.1

