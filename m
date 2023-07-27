Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 615A5764E2F
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jul 2023 10:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234055AbjG0Ixt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Jul 2023 04:53:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234672AbjG0IxW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Jul 2023 04:53:22 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DEA842F4A
        for <linux-i2c@vger.kernel.org>; Thu, 27 Jul 2023 01:34:43 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-31765aee31bso739782f8f.1
        for <linux-i2c@vger.kernel.org>; Thu, 27 Jul 2023 01:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=devtank-co-uk.20221208.gappssmtp.com; s=20221208; t=1690446872; x=1691051672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T+RffnyX1C3jwfJk0PWLmvia5S+Nu7M5/ptHa76gYBw=;
        b=FeXoWvmilpW1hdXzL3FNF8UmBleGyuvtnBmWlMSGvCfmSQyoKL2aTr0nXU1WNBbq3U
         o4mHBaStsMb/aS8Osw9yf5pBA10qmjWbFvlxZr58zyG+vx2zz4ieK7+FD19cbHtCtj6g
         9I9CrXC6YMrnO6/7p97IYUAzIRVv7tJHCBWrSC9tOkX3Vm9nVA94sY003Q+UnQKlemgx
         9fVkLgnEpsMmaw/hfMYe0yAmqhdaYfSm0cWVDagn1mqjA630hpwRTzb7/rPjr/1HyTj0
         XPDr2xlvbijolhVXSV6s+ezhmHEA9bMqO9UdJSB0LxeW4/huleZr9kq8ExozgbYWebcC
         Jy9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690446872; x=1691051672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T+RffnyX1C3jwfJk0PWLmvia5S+Nu7M5/ptHa76gYBw=;
        b=kvny+wE9rXxDZcnLOGnrZORoZCIqv3SKhn9dVxxY3ypiEabSuM12TQp8+//st40bcT
         puKsqvWC36BfI4VO5tBccZEaWmUbwYQAQuU2PmJUv7XC8akrJgMRs/8qZMKV33I5DRlz
         O4XITU9c4gtK+1IVf3X02g3HEzz5/S2FGolqnsNBtjef/qNGSqxWlyupa0Y+ZhPCpBMz
         IXiovFdObuwvz7+3qttYwW+1OvmGX8dAFKAIdnwBRIRvuukm/+2kNW8XpZkVG+YqP85G
         efsSNhOZD9j+SmXLprn8hmTqgutwEKIqYt2V4BlIuuT6lBf/0t04QhOslX70XLlroZ0k
         PAAw==
X-Gm-Message-State: ABy/qLamnFqTPMqRIMbiutrK6eBV8oBt3+3ZAkoHOaMBI3/Lka2LwPJ6
        wO6iWnP67ZAAtpVm6i/imXqedPad8n78bLp7X7zaTg==
X-Google-Smtp-Source: APBJJlEHOF6Ha/hI8jPTkvlVhz5xgjSnWuYcuXmwjzcHWfoWdbiiFTlziaUnxvQuqw4WK5cG59wsFg==
X-Received: by 2002:adf:edca:0:b0:313:e8bf:a77 with SMTP id v10-20020adfedca000000b00313e8bf0a77mr1129028wro.5.1690446872019;
        Thu, 27 Jul 2023 01:34:32 -0700 (PDT)
Received: from DevTop.lan ([212.82.82.3])
        by smtp.gmail.com with ESMTPSA id e5-20020a5d5005000000b00311d8c2561bsm1330079wrt.60.2023.07.27.01.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 01:34:31 -0700 (PDT)
From:   Harry Geyer <harry.geyer@devtank.co.uk>
To:     Till Harbaum <till@harbaum.org>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     harry.geyer@devtank.co.uk
Subject: [PATCH] i2c: tiny-usb: check usb base class before assuming the interface on device is for this driver
Date:   Thu, 27 Jul 2023 09:33:54 +0100
Message-Id: <20230727083354.4903-1-harry.geyer@devtank.co.uk>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Patch allows usb devices with multiple interfaces to use this driver without
this driver assuming all interfaces are i2c-tiny-usb.

Signed-off-by: Harry Geyer <harry.geyer@devtank.co.uk>
---
 drivers/i2c/busses/i2c-tiny-usb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tiny-usb.c b/drivers/i2c/busses/i2c-tiny-usb.c
index d1fa9ff5aeab..d6578e8908ac 100644
--- a/drivers/i2c/busses/i2c-tiny-usb.c
+++ b/drivers/i2c/busses/i2c-tiny-usb.c
@@ -222,6 +222,9 @@ static int i2c_tiny_usb_probe(struct usb_interface *interface,
 	int retval = -ENOMEM;
 	u16 version;
 
+	if (interface->intf_assoc && interface->intf_assoc->bFunctionClass != USB_CLASS_VENDOR_SPEC)
+		return -ENODEV;
+
 	dev_dbg(&interface->dev, "probing usb device\n");
 
 	/* allocate memory for our device state and initialize it */
-- 
2.34.1

