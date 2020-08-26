Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58D2025264A
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Aug 2020 06:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbgHZE3z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Aug 2020 00:29:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbgHZE3x (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Aug 2020 00:29:53 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6AC6C061574;
        Tue, 25 Aug 2020 21:29:53 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id t11so292769plr.5;
        Tue, 25 Aug 2020 21:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pi0catYqNzkYSSivKbggUmIHwjnMzzc8ktMg8BgXxAA=;
        b=gxri8hV0nt+jjTV4B8FpNrMlZAyGsQAsOmqzyfpz9Uj7MsFyQ8+5DLrpundAp7lKx6
         L5odZMtotUbfBj0gMr+xY7n+uJ/zdegLqA5SjvvdPgyYprodr1gIufLn7bxmW9dPzCnQ
         kkITETpY4voXHwfXCizc+agj4Y/wUinqKtUI4eVz3lKG3YISYjFsaJjI2ndUuZnOpPIi
         xs7KehOqYjUdvBtg03peCiavMB7Yh3ATLv01uIXepOoarmyQL2wQ5uDv4EMoCAMWufxd
         tUsDId8/ntRyq4vwBo1Bv022vhuqToN2FvbZowd8IDMCLvGZnJJC1yWBarMcJ2iCHM1d
         Tssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pi0catYqNzkYSSivKbggUmIHwjnMzzc8ktMg8BgXxAA=;
        b=ElIuFf9mkfLASYXVbmzdzXRmnNnxEiEhVTO3RYfvUblQvSZw6rPhsHBC2MGwAGENe/
         GjSCied4m3Gd7VWyzTB4y3pt1aFM1+Ziqw+VQJvxZAGDhqFsQP24JocWtPOpCaCYc7TK
         ccF7J+EXdswcTctcN1ROQMz0ZVt9hJeNl5d8T1gNTZlGW5GpL0bFrPcElQrSesn4xJLg
         gwzNPyxCXn1Z8qpoYleQ9cA69JKSiIRarQ4t/4jEX3En06Zp9l9UlsoFvTsKY5OQF45I
         AGxWietloqYCFtLgne2J7ibwFPMAgR2aR4FOwuaZwXnnIayIL9bdZJODafUNdkSFbNWG
         IrKQ==
X-Gm-Message-State: AOAM53132NrCWQ2u4y5zVfSG0R91xz3vkZQVINDKUe5jz645Yx7oWit6
        MCmjGUJ2G50LIt26L6+W5JenqQ5/8MA=
X-Google-Smtp-Source: ABdhPJy1b/HzwYz5c9kaxdxM4TJSDJeX5uOMncrXxGYbvK155/ke92WSh/Oc+xRvFQhPSIlt1bE1Lw==
X-Received: by 2002:a17:90a:dac5:: with SMTP id g5mr4243423pjx.5.1598416193390;
        Tue, 25 Aug 2020 21:29:53 -0700 (PDT)
Received: from localhost.localdomain ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id a25sm885761pfk.151.2020.08.25.21.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 21:29:52 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: [PATCH 2/2] i2c: do not export i2c_of_match_device() symbol
Date:   Wed, 26 Aug 2020 13:29:38 +0900
Message-Id: <20200826042938.3259-2-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200826042938.3259-1-sergey.senozhatsky@gmail.com>
References: <20200826042938.3259-1-sergey.senozhatsky@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Do not export i2c_of_match_device().

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
---
 drivers/i2c/i2c-core-of.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index 3ed74aa4b44b..77faa9cc05c9 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -223,7 +223,6 @@ const struct of_device_id
 
 	return i2c_of_match_device_sysfs(matches, client);
 }
-EXPORT_SYMBOL_GPL(i2c_of_match_device);
 
 #if IS_ENABLED(CONFIG_OF_DYNAMIC)
 static int of_i2c_notify(struct notifier_block *nb, unsigned long action,
-- 
2.28.0

