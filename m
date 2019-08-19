Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1C6791E43
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2019 09:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbfHSHq0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Aug 2019 03:46:26 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:41900 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725846AbfHSHqZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Aug 2019 03:46:25 -0400
Received: by mail-pl1-f194.google.com with SMTP id m9so566397pls.8
        for <linux-i2c@vger.kernel.org>; Mon, 19 Aug 2019 00:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SVBiffuNEOiaua/CTjF2RYo1EoJ7NdsrEe4WYMvF/Tc=;
        b=Wa6u3zS7y1oEchy5YNujHU8A1c02KBma8nykY/FXeYNwJNqbcVh4TnMluf3DFGkfxx
         hrPARGB/wdyKnuKTHIyfGlrjXcyysOD7upO+jtnMWpu3WrV8PGgCGKhWf551VknPXGkp
         MBm6KiIAb7ELFdDq2qZ5Gsu9gfP4E3rMPBRquKDY5gDhCLaxa0dim3PsyjsZctD+5sTx
         jSm7P4HzBD4LZWwjBL//ov58cpibFEzAvmmgT+Aszoe8sZYFGsdwEcwQv9G8ZYBmVbae
         vHjmdxIWwOht9yhCIOCYSJHvjQNOrvKCMqiEWM0w+fw6rfQnT9HOufFpsd/NXR8rYGjk
         s5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SVBiffuNEOiaua/CTjF2RYo1EoJ7NdsrEe4WYMvF/Tc=;
        b=bwtx4NxBwU/OaIy4gyk0MMCOneI7R5JD9wFvuKDZ13fJLm/nKARghWZVrG6rUcQ9oE
         e395DhUuONlHAiyRwnPe8sCKQhzsPx44s4H2wApYxAMNh1MT8qtXzsPtwBDIu7lJZhbV
         hWZi/+NPjARRyFvJpkZaT3HRyZ6Yg3RZ6mA3VSgZ/jg3jBBQRd6C2T9EVsg/3ursBa2g
         ZaoPWCfp2xTAPDyANnx+yzVmncFGy+zDXK6BtdtWQ7na4w3Vp1e4dTvcKKqtjQ2V9jF6
         Gsyd2QaAq3CMryun2XFDqa3jSdqTTB2g7F7dt675zg+cG3HHA5CsVsdI+9tdXxgbAY19
         btCg==
X-Gm-Message-State: APjAAAXZ1QoQ4y1MqocTvIn1FGNU93635eBLF6iV8ZimkzYvK8wiYSF9
        yDSu7KDsA1o+nh8N3VAwxTI=
X-Google-Smtp-Source: APXvYqysffUYqwO4sp7IX78TDZL7FE1+sxGph+w+B6yhxnnOHDWNEGE51hUtdmWF2esWInQJHpLz0Q==
X-Received: by 2002:a17:902:7781:: with SMTP id o1mr21032877pll.205.1566200785353;
        Mon, 19 Aug 2019 00:46:25 -0700 (PDT)
Received: from localhost.localdomain ([110.225.16.165])
        by smtp.gmail.com with ESMTPSA id q69sm15500435pjb.0.2019.08.19.00.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 00:46:24 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     jdelvare@suse.com, linux-i2c@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] i2c: taos-evm: Make structure tsl2550_info constant
Date:   Mon, 19 Aug 2019 13:16:01 +0530
Message-Id: <20190819074601.326-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Static structure tsl2550_info, of type i2c_board_info, is referenced
only twice: the first time in arguments to dev_info() (which does not
modify it) and the second time as the last argument to function
i2c_new_device() (where the corresponding parameter is declared as
const). As tsl2550_info is therefore never modified, make it const to
protect it from unintended modifications.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/i2c/busses/i2c-taos-evm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-taos-evm.c b/drivers/i2c/busses/i2c-taos-evm.c
index c82e78f57386..056df6b2538a 100644
--- a/drivers/i2c/busses/i2c-taos-evm.c
+++ b/drivers/i2c/busses/i2c-taos-evm.c
@@ -39,7 +39,7 @@ struct taos_data {
 };
 
 /* TAOS TSL2550 EVM */
-static struct i2c_board_info tsl2550_info = {
+static const struct i2c_board_info tsl2550_info = {
 	I2C_BOARD_INFO("tsl2550", 0x39),
 };
 
-- 
2.19.1

