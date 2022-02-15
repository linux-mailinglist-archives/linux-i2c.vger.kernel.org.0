Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BBE64B6450
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Feb 2022 08:27:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231809AbiBOH16 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Feb 2022 02:27:58 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230434AbiBOH15 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Feb 2022 02:27:57 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AAAFEF78F
        for <linux-i2c@vger.kernel.org>; Mon, 14 Feb 2022 23:27:46 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id be32so6964251ljb.7
        for <linux-i2c@vger.kernel.org>; Mon, 14 Feb 2022 23:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mwXfURWRRFSQ93MpcoTcwvmUvVA7/3MO8WoXlU+6SNU=;
        b=dc6zN7vCCMwYw7ZSQNxXgT1Qh+ORz16Lj4xvvU54FTUEehUSG3ZMnOeQIZQCafsm/0
         dWkYSC1H8Cq3ULOCUIL4J5p21h5L8MjT1zzNKdjFpvgfvYyT/lhbsWu3b7Du3AakyzWd
         BeOc+pfWnlob66O+Io3LhkbFjFkk6MZ8tmOgiS3VlTxX52PTV0U9XETkOTS5Oa6mCvnT
         mjneO03oAbzVj31OYGDJ+M9eWWKJU1Hpk0tofSD29IS3eeC3ku5+v2a4YbXt1GNGKjqv
         ZiotZTTy+b2M5e7KxXZyMqOUBW3V4M0SjkC7btpWgu10XkCm8BC//EPUqOACA9QtKb98
         l30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mwXfURWRRFSQ93MpcoTcwvmUvVA7/3MO8WoXlU+6SNU=;
        b=fAd3YIlqYXLOhn/JSPYg8p9iTX3NDlM8aH+gQMvSl6QsePg6/8JPMjaQeQ/wbB6C+/
         Tvoj0L8O1jnOQHV6Nbzn4RyegVigSX6gbZLsNWOO48tBqmqPJxq8ebIVYtE+WGV8shwS
         aHb77UqsuEPlhx5vjUxPsO2LlBDaYrEqYqQr/ROVemd3EeZYZLYPb9UJfESTNdGnMEu0
         QqsKpJIETJllWxHXYiRtDWsxxZIDH4/rafOT8x1Gl8TfAsHAp48stVqbRFLVA6CFfXyB
         gYq1E6Bn/WdC4LHT3j9G8X1o7u1jCYu6Hnr0YyLP+HzLqPmE5bsPYiusUDKV3Ed2u8BR
         OEhw==
X-Gm-Message-State: AOAM532LxuHBiWrHBLlPAt6ZIr8nJwn8clI9u13snoW5z/JOBmsqNMoC
        JYzGhNuGxJwL82d4TYVoLSo=
X-Google-Smtp-Source: ABdhPJyABb6eMTTYrFrs2t6P4KNEy1v2OJO7d+6r0KjQtprn/CkyRJZH175YG1z+uXomAazvfQjLfg==
X-Received: by 2002:a05:651c:54f:: with SMTP id q15mr1641979ljp.0.1644910064529;
        Mon, 14 Feb 2022 23:27:44 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id p21sm4315071lja.32.2022.02.14.23.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 23:27:44 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Kamal Dasu <kdasu.kdev@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] i2c: brcmstb: fix support for DSL and CM variants
Date:   Tue, 15 Feb 2022 08:27:35 +0100
Message-Id: <20220215072735.17335-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

DSL and CM (Cable Modem) support 8 B max transfer size and have a custom
DT binding for that reason. This driver was checking for a wrong
"compatible" however which resulted in an incorrect setup.

Fixes: e2e5a2c61837 ("i2c: brcmstb: Adding support for CM and DSL SoCs")
Cc: Kamal Dasu <kdasu.kdev@gmail.com>
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/i2c/busses/i2c-brcmstb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-brcmstb.c b/drivers/i2c/busses/i2c-brcmstb.c
index 490ee3962645..b00f35c0b066 100644
--- a/drivers/i2c/busses/i2c-brcmstb.c
+++ b/drivers/i2c/busses/i2c-brcmstb.c
@@ -673,7 +673,7 @@ static int brcmstb_i2c_probe(struct platform_device *pdev)
 
 	/* set the data in/out register size for compatible SoCs */
 	if (of_device_is_compatible(dev->device->of_node,
-				    "brcmstb,brcmper-i2c"))
+				    "brcm,brcmper-i2c"))
 		dev->data_regsz = sizeof(u8);
 	else
 		dev->data_regsz = sizeof(u32);
-- 
2.34.1

