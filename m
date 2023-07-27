Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D85D76588B
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jul 2023 18:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233669AbjG0QXV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Jul 2023 12:23:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233472AbjG0QXU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Jul 2023 12:23:20 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A1E81984
        for <linux-i2c@vger.kernel.org>; Thu, 27 Jul 2023 09:23:19 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-307d20548adso1195100f8f.0
        for <linux-i2c@vger.kernel.org>; Thu, 27 Jul 2023 09:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=devtank-co-uk.20221208.gappssmtp.com; s=20221208; t=1690474997; x=1691079797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=icyg0XscLKxI4QWuQt/SdZeKJtNG1h8hw2HHWKc7NR4=;
        b=F8eEU8TBgKD8Nht48axdQI0b0VmKbMKvLLtB3Q86QwwDeoIeAy5DPjO/LTRYWTS7R5
         TwQneady8od5YDlwDvKOUpayRaaS911NEbhJpalQqK8T6E2Jd1WkVk5epd76U9HmvZxl
         X0Jzqx9nYeDcB4vEdv4sbHpZMIjYomDSwcnQQTSb7CgBH6ejTOZz0MVSqJmtXTECBaV0
         tLCQPztSlUdfjuL39jsmrapAhIFXSVcOLfPohJ8QPWBHUWEmo9FUkjq0OT7lj1e//ezs
         Kuk+sGEchy8QR4JErJZEvlN6pXNjrWYtkL6TuaSahioBbI7+FfiKFbDhGcv9RvA4oNmK
         cTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690474997; x=1691079797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=icyg0XscLKxI4QWuQt/SdZeKJtNG1h8hw2HHWKc7NR4=;
        b=JboOtVU+KYpnySek1Fljon5NiLnbaw2z9ksrOFwOAIHxwwO6ZTmXhFcfI+iWfnPpBP
         cxEipKhdYLpsqrWasNLBDR23dLHGfAfelGurkqiB1V6GktWfPvcK3kq5J/mjwAWvMkwJ
         VNWMp7uLQhI9L3jx2awuqnvVUZn6RNbOKuI3z2btLoJPUdpk0XOr7sZr99jIvA42LtxX
         zl/ZQA3nzRDq4pu7LBX0L8+yQ0MuoheWr8Gmqf1PO1Q90OlHvAGhFQtZW44072kaRSaR
         LTsOwHexDzd+4GPhvd6V7P2PAZUchE/6IZxL95vjS0e54CASDIrxRSqE/oSEBMhi0vF0
         hXdA==
X-Gm-Message-State: ABy/qLYrp2K1XqjqCnCgOlEUV5sUfes6azqG11XQxs4YhjTuXisgT5tt
        C+wT2C9p8rkQbwoJHUrbiZtRzg==
X-Google-Smtp-Source: APBJJlFqohS2m5V3lRrkMKFRIOkHjfeXJ3OPqdIcs3pm8+Mly+oqVlqkpRppepO3noovKCPLlAkfkw==
X-Received: by 2002:adf:db46:0:b0:30e:5bd0:21a2 with SMTP id f6-20020adfdb46000000b0030e5bd021a2mr2030931wrj.52.1690474997374;
        Thu, 27 Jul 2023 09:23:17 -0700 (PDT)
Received: from DevTop.lan ([212.82.82.3])
        by smtp.gmail.com with ESMTPSA id z13-20020a5d654d000000b00314398e4dd4sm2457471wrv.54.2023.07.27.09.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 09:23:17 -0700 (PDT)
From:   Harry Geyer <harry.geyer@devtank.co.uk>
To:     Till Harbaum <till@harbaum.org>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     harry.geyer@devtank.co.uk
Subject: [PATCH] i2c: tiny-usb: check usb base class before assuming the interface on device is for this driver
Date:   Thu, 27 Jul 2023 17:22:55 +0100
Message-Id: <20230727162255.21551-1-harry.geyer@devtank.co.uk>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Patch allows usb devices with multiple interfaces to use this driver without
this driver assuming all interfaces are i2c-tiny-usb.

Signed-off-by: Harry Geyer <harry.geyer@devtank.co.uk>
---
 drivers/i2c/busses/i2c-tiny-usb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tiny-usb.c b/drivers/i2c/busses/i2c-tiny-usb.c
index d1fa9ff5aeab..1bffe36c40ad 100644
--- a/drivers/i2c/busses/i2c-tiny-usb.c
+++ b/drivers/i2c/busses/i2c-tiny-usb.c
@@ -222,6 +222,10 @@ static int i2c_tiny_usb_probe(struct usb_interface *interface,
 	int retval = -ENOMEM;
 	u16 version;
 
+	if (interface->intf_assoc &&
+	    interface->intf_assoc->bFunctionClass != USB_CLASS_VENDOR_SPEC)
+		return -ENODEV;
+
 	dev_dbg(&interface->dev, "probing usb device\n");
 
 	/* allocate memory for our device state and initialize it */
-- 
2.34.1

