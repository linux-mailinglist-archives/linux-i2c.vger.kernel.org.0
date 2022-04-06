Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22A6A4F64FA
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Apr 2022 18:27:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237259AbiDFQNd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Apr 2022 12:13:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237906AbiDFQMo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Apr 2022 12:12:44 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 138D910DA62
        for <linux-i2c@vger.kernel.org>; Tue,  5 Apr 2022 20:23:11 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id kw18so1310440pjb.5
        for <linux-i2c@vger.kernel.org>; Tue, 05 Apr 2022 20:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=matician-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nl7SX+b5OGaSDzvlaBhcoDYJhu7qvmloOq719EKVN4w=;
        b=D0wLjV2hKK8FhkyDepiJad1TNZ7sISTXvrWpTNkxvS5eOnAZZtLOtmlCA98mC1Fj2V
         AMKj9ttDNkzQqKWmulPBZksk/OpBF+mhDohEMZhe3FqBP6tmTzVCNmyzmUtX2ugiuHtV
         KnR0muml6VPYoAG+6yskjbXagoSuGG6ScvZ/9DCZPmVWPRVRcsSZMyqbJTqwro6podjY
         Ft2f6WP3rYAxTMnaapOTK4B90It21X8I00OD52uXusmIuNE+/4LharriC2+5lBiXdJmj
         YQlMBp7dGc7JNF5c+sU6deJl1BQTZ7YtVScxQZgib070UY9mlJ9zDg11ap7OxpfhSFmz
         Tz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nl7SX+b5OGaSDzvlaBhcoDYJhu7qvmloOq719EKVN4w=;
        b=46eE4EI8dndfzkRAM6w66y9FuSxYinrj2L0Qak8Hh3TeWxsHJFg1t9hL+8QSD4V6Et
         LSfGRrxnOsAbnRATosvCAK8TOtFN06LFj4UbKqQZlPTARP+XvtihcL5y4kZzCdeevqT7
         vsvKs8T89G8xE6fJ7B+7xr1aUSPLqgvhmifAN43l2j6g1gzzCSFiCQW3+SzNwxgiWAI6
         2cN8OAMp1Dv0c/6oKD39oUAgAOlgvCYJQMk0/hysT8v/VSvDjuZ+Ed9SBQ3RNCxoCi4Z
         7wwOBZbK0C6NRUrUXF8Ffc/JTHziu1XYqLeqD/QLOh4XXl3IMvLu9lstX5Ya2TbREkFT
         xTLQ==
X-Gm-Message-State: AOAM532ZT68G+Zc9SrOiJPsybxtA/EyUvlNZ3+OD4cJXZrRus7Lc0ZJQ
        mCR81mPsxX1EW1MeE6EpawsH1A==
X-Google-Smtp-Source: ABdhPJz7dqGTm0vgSVyF1U6dobg0vqBl1Pe6bW1rGXJzjrXAwC2GElpy5iI+dXkjITJfkLjEnPX+cw==
X-Received: by 2002:a17:902:e746:b0:156:9eed:d2d6 with SMTP id p6-20020a170902e74600b001569eedd2d6mr6522503plf.144.1649215390419;
        Tue, 05 Apr 2022 20:23:10 -0700 (PDT)
Received: from mtgav.corp.matician.com ([38.88.246.146])
        by smtp.gmail.com with ESMTPSA id b16-20020a056a000cd000b004fadb6f0290sm17973786pfv.11.2022.04.05.20.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 20:23:09 -0700 (PDT)
From:   gavin@matician.com
To:     Rishi Gupta <gupt21@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        Gavin Li <gavin@matician.com>
Subject: [PATCH] HID: mcp2221: fix hang on probe while setting up gpiochip
Date:   Tue,  5 Apr 2022 20:23:07 -0700
Message-Id: <20220406032307.4001281-1-gavin@matician.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Gavin Li <gavin@matician.com>

The driver expects HID events to be delivered to it during probe()
because the devm_gpiochip_add_data() call indirectly calls
get_direction(), which fires an HID command that expects an HID
response. Without this patch, the get_direction() would timeout (of 4
seconds) once per pin, leading to a 16 second delay before the device is
usable.

This patch adds calls to hid_device_io_start() and hid_device_io_stop()
to notify the HID subsystem that the driver is ready to receive events
before the probe() finishes.

Signed-off-by: Gavin Li <gavin@matician.com>
---
 drivers/hid/hid-mcp2221.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index 4211b9839209b..567ef8b93376d 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -877,6 +877,9 @@ static int mcp2221_probe(struct hid_device *hdev,
 	}
 	i2c_set_adapdata(&mcp->adapter, mcp);
 
+	/* gpiolib calls get_direction(), so become ready to process events */
+	hid_device_io_start(hdev);
+
 	/* Setup GPIO chip */
 	mcp->gc = devm_kzalloc(&hdev->dev, sizeof(*mcp->gc), GFP_KERNEL);
 	if (!mcp->gc) {
@@ -902,6 +905,7 @@ static int mcp2221_probe(struct hid_device *hdev,
 	return 0;
 
 err_gc:
+	hid_device_io_stop(hdev);
 	i2c_del_adapter(&mcp->adapter);
 err_i2c:
 	hid_hw_close(mcp->hdev);
-- 
2.34.1

