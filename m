Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96D445F6A0F
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Oct 2022 16:55:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231386AbiJFOzD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Oct 2022 10:55:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231146AbiJFOy6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Oct 2022 10:54:58 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F3E31D65A;
        Thu,  6 Oct 2022 07:54:55 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id y100so3200641ede.6;
        Thu, 06 Oct 2022 07:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=OcCFlsb0UPx35nzupcdQ+Jsu6S5hmDruOOCDGL2tRQU=;
        b=LcRWZUjkVaSzP+xw32qY5UviScr9vgmwxKrpmL6rXsiGeRGuK/+g14ELWGxCZGrORm
         qJQyhwScy4Th0H0aVlk809B5IzEBbOCmLeZrOu1R+4sBTjdFmzynVe0RrHAbWHP3Qaso
         q+T9yYaigi7Kt+kKlkmQ2hxeH+rchg1Vaj0qSdQS9+PNaI2k3k9WEQNWxXOHP1AhlRdk
         JKchX4Zqv234hqNXB9SjiKxKRRugT+Kir8XFBrqnpx80CBJX3PM9ES67z9/SsjXDgn4O
         vVjQB1DNCpVKkfJUYaav9xL/U/Eo4R9GWJ3zj5cpYyypEf8HmdBabdhiW5Bg/4MrT/jy
         /lKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=OcCFlsb0UPx35nzupcdQ+Jsu6S5hmDruOOCDGL2tRQU=;
        b=59iETLQzjYaVp/rV1EuU0Y0y8dGBehMuj93euF4CP2TelMEm660pqOdJiAmen0sZKp
         64+EIHGRzDlS0LvmLCXidm9jQsp3llL1M412qldukCBWQYK/DeNhBK1V6qa6bEN81XBk
         Ldf/ieNeZALNsTA8JILIylGJLhJSxpfWyC+IDWDKdFn1yUhEexo2FqnBlnMYYOEvlLPp
         x2Pc6/FDz28W8l7pi0OwwVQrATbJ8bRoDOTbqE5RSLS4oVHR1ESZY5CZcCVLfVlAV8vl
         r171hVcyXNaf7zqWMthWGy2wfX0rGlg9FvbUiSmnM0pMWo5qwmZdOGRYdKat87W69mkE
         6pVQ==
X-Gm-Message-State: ACrzQf0MSba2vEwxfrdAGmH45LYbiLDguX2gnFLX1CvmBm1Zgqya8w5u
        Op0eW0bgPo03CIfBya/IFKPVr9fuDt8=
X-Google-Smtp-Source: AMsMyM7tAxRlst56qjcRjNPVAyBRK+EA8IHGDVRjg4uDfYiWRqaFMqbCok7sOPDfm7TIJjWbJl0I4w==
X-Received: by 2002:a05:6402:2804:b0:439:83c2:8be2 with SMTP id h4-20020a056402280400b0043983c28be2mr161904ede.292.1665068093904;
        Thu, 06 Oct 2022 07:54:53 -0700 (PDT)
Received: from localhost.localdomain (wlan-247051.nbw.tue.nl. [131.155.247.51])
        by smtp.gmail.com with ESMTPSA id i15-20020aa7dd0f000000b00457c321454asm5957591edv.37.2022.10.06.07.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:54:53 -0700 (PDT)
From:   Nam Cao <namcaov@gmail.com>
To:     jdelvare@suse.com
Cc:     namcaov@gmail.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: i801: add lis3lv02d's I2C address for Vostro 5568
Date:   Thu,  6 Oct 2022 16:54:40 +0200
Message-Id: <20221006145440.10281-1-namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
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

Dell Vostro 5568 laptop has lis3lv02d, but its i2c address is not known
to the kernel. Add this address.

Output of "cat /sys/devices/platform/lis3lv02d/position" on Dell Vostro
5568 laptop:
    - Horizontal: (-18,0,1044)
    - Front elevated: (522,-18,1080)
    - Left elevated: (-18,-360,1080)
    - Upside down: (36,108,-1134)

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index a176296f4fff..e46561e095c6 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1243,6 +1243,7 @@ static const struct {
 	 */
 	{ "Latitude 5480",      0x29 },
 	{ "Vostro V131",        0x1d },
+	{ "Vostro 5568",        0x29 },
 };
 
 static void register_dell_lis3lv02d_i2c_device(struct i801_priv *priv)
-- 
2.25.1

