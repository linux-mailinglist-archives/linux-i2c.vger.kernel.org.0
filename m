Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F55D57867A
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jul 2022 17:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235306AbiGRPfS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jul 2022 11:35:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbiGRPfR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jul 2022 11:35:17 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8509A19A
        for <linux-i2c@vger.kernel.org>; Mon, 18 Jul 2022 08:35:16 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id k30so15818299edk.8
        for <linux-i2c@vger.kernel.org>; Mon, 18 Jul 2022 08:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R+54tAgSF3cGTDz61HzqamFdcjLpGh+UYoWywfQYoS4=;
        b=gKGAbUrp2i1o6fHKC7fTKkfa9px/8vS3N+z1xnJ0B5uJbu3njts3gkG+U+ojFVg1Uc
         jyLO1OZ+AKEsZNU0wEEaKgFurji306xPnY9Px8OfC2zPRER8CkLBkgawJMEc96dDmGWR
         3WwTPjsDzEDzIEqPFuy0V9tuqfVmjwNYGl1bll1Y/Gst9acmoCMp7lCqp4A23+LhN2fQ
         tTusY8Y4lTfM31CLnnXup88W7IfIqe3E4ItvAmBncFIQiSp2dIuCROKsXSa0S74YUeWV
         LWJkrpu2gpwChSecEkmA74icGMl4s1uJdbf3oVCPXAu1mGykIA4MVVUPUTkw/cYoH4GV
         2Zjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R+54tAgSF3cGTDz61HzqamFdcjLpGh+UYoWywfQYoS4=;
        b=UQeREyl3ezg7Y02PmjlTdUhi2o/GeIHo57r7v83sAGGBBbiYIVYV0ojlXr1IbE8uND
         5ryZJAiEbLFfZNFfjLx5PABylNmNZ41QvrqMmaoZbYRhHg7Lp15WkPDuUDlQpWvT+xz1
         w7MoFh0PKCZClOrQDQ8lyU9QWJYDlrZjOfzKjzZaAikBH0B4iqd/JKyskatj1L9F25DR
         S3CblyJUw7WUAASADIDJLcqbUU8ffmidgkcNXJNwaE7MYlefFQGWcbdupdHRbFyjlqmb
         5Fte/fYejBmallNvod/MTDhQPOGSJQOuj2T4+12Nfeovi5GeKv3e6811zLCLJKKb32Sj
         3wVA==
X-Gm-Message-State: AJIora8qPS9FNct93Y5UUDCa2MYI/r6sj/mMMNa8/YnhHYA2Huw90O//
        /MFk63th9Ohf883fHc1+8jWFa6DLWqLkaw==
X-Google-Smtp-Source: AGRyM1t84HI8BLHyG/lWgDoDGBA6ooSq2M5or23euRZgVn0XXIZfSlzcjvNwAdWTdJrS2uMpYU91Lw==
X-Received: by 2002:a05:6402:51cb:b0:43a:e94c:a841 with SMTP id r11-20020a05640251cb00b0043ae94ca841mr37999796edd.212.1658158514962;
        Mon, 18 Jul 2022 08:35:14 -0700 (PDT)
Received: from localhost.localdomain (75-164-183-54.ptld.qwest.net. [75.164.183.54])
        by smtp.gmail.com with ESMTPSA id s12-20020a1709064d8c00b006feec47dae9sm5629822eju.157.2022.07.18.08.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 08:35:14 -0700 (PDT)
From:   Jason Gerecke <killertofu@gmail.com>
X-Google-Original-From: Jason Gerecke <jason.gerecke@wacom.com>
To:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
Cc:     Ping Cheng <pinglinux@gmail.com>,
        "Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Ping Cheng <ping.cheng@wacom.com>
Subject: [PATCH] i2c: Use u8 type in i2c transfer calls
Date:   Mon, 18 Jul 2022 08:34:48 -0700
Message-Id: <20220718153448.173652-1-jason.gerecke@wacom.com>
X-Mailer: git-send-email 2.37.1
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

The 'i2c_transfer_buffer_flags' function (and related inlines) defines its
'buf' argument to be of type 'char*'. This is a poor choice of type given
that most callers actually pass a 'u8*' and that the function itself ends
up just storing the variable to a 'u8*'-typed member of 'struct i2c_msg'
anyway.

Changing the type of the 'buf' argument to 'u8*' vastly reduces the number
of (admittedly usually-silent) Wpointer-sign warnings that are generated
as the types get needlessly juggled back and forth.

Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
Reviewed-by: Ping Cheng <ping.cheng@wacom.com>
---
 drivers/i2c/i2c-core-base.c |  2 +-
 include/linux/i2c.h         | 14 +++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 10f35f942066..2925507e8626 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -2184,7 +2184,7 @@ EXPORT_SYMBOL(i2c_transfer);
  *
  * Returns negative errno, or else the number of bytes transferred.
  */
-int i2c_transfer_buffer_flags(const struct i2c_client *client, char *buf,
+int i2c_transfer_buffer_flags(const struct i2c_client *client, u8 *buf,
 			      int count, u16 flags)
 {
 	int ret;
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index fbda5ada2afc..65c46df51c51 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -64,7 +64,7 @@ const char *i2c_freq_mode_string(u32 bus_freq_hz);
  * @count must be less than 64k since msg.len is u16.
  */
 int i2c_transfer_buffer_flags(const struct i2c_client *client,
-			      char *buf, int count, u16 flags);
+			      u8 *buf, int count, u16 flags);
 
 /**
  * i2c_master_recv - issue a single I2C message in master receive mode
@@ -75,7 +75,7 @@ int i2c_transfer_buffer_flags(const struct i2c_client *client,
  * Returns negative errno, or else the number of bytes read.
  */
 static inline int i2c_master_recv(const struct i2c_client *client,
-				  char *buf, int count)
+				  u8 *buf, int count)
 {
 	return i2c_transfer_buffer_flags(client, buf, count, I2C_M_RD);
 };
@@ -90,7 +90,7 @@ static inline int i2c_master_recv(const struct i2c_client *client,
  * Returns negative errno, or else the number of bytes read.
  */
 static inline int i2c_master_recv_dmasafe(const struct i2c_client *client,
-					  char *buf, int count)
+					  u8 *buf, int count)
 {
 	return i2c_transfer_buffer_flags(client, buf, count,
 					 I2C_M_RD | I2C_M_DMA_SAFE);
@@ -105,9 +105,9 @@ static inline int i2c_master_recv_dmasafe(const struct i2c_client *client,
  * Returns negative errno, or else the number of bytes written.
  */
 static inline int i2c_master_send(const struct i2c_client *client,
-				  const char *buf, int count)
+				  const u8 *buf, int count)
 {
-	return i2c_transfer_buffer_flags(client, (char *)buf, count, 0);
+	return i2c_transfer_buffer_flags(client, (u8 *)buf, count, 0);
 };
 
 /**
@@ -120,9 +120,9 @@ static inline int i2c_master_send(const struct i2c_client *client,
  * Returns negative errno, or else the number of bytes written.
  */
 static inline int i2c_master_send_dmasafe(const struct i2c_client *client,
-					  const char *buf, int count)
+					  const u8 *buf, int count)
 {
-	return i2c_transfer_buffer_flags(client, (char *)buf, count,
+	return i2c_transfer_buffer_flags(client, (u8 *)buf, count,
 					 I2C_M_DMA_SAFE);
 };
 
-- 
2.37.1

