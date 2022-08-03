Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B143588F03
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Aug 2022 16:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236242AbiHCO7L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Aug 2022 10:59:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236097AbiHCO7K (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 3 Aug 2022 10:59:10 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4DE32B638;
        Wed,  3 Aug 2022 07:59:08 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id y11so13096192qvn.3;
        Wed, 03 Aug 2022 07:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5jqs8AHhBgImGBIE7SxgFEppiaXm4rdOvSDueZDLtEQ=;
        b=J7iFFApEpmH/XmKfNn8NMMjeGffryiPx4XCa/yydrPs8YUy4GrSvGHHWWOl/8rJU3t
         eJZIbrlmWFExYI4atGPR4oBVnSE5tUHTQQ/hBc0U002MlGFZisjcj9DU8JbNw+wZXtPn
         x8eVaESQRCH0pSHTO5iSGIa/JLD3TQ7t/lBUa8LVsJA0nL7X6ICCo9rR8ZvH3k4GJJ6+
         bicrLg9PQsgAnAyWxthKeGIW37GKLMKuf9k/efiwxhfAS6OGzpM/k3UTJPv8cw9tu2i2
         /2geaj7Xy2EUrj7esWKiHsrFvkAX80QhPrhDyCV4XZVtifeRskgjrNNkXDY6agJRjMsb
         uvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5jqs8AHhBgImGBIE7SxgFEppiaXm4rdOvSDueZDLtEQ=;
        b=IA6ctcPa7yMQzdKtMDmXjWLtOQyLPN5NyV9jNsJONYPsMG5RPu3LerQqtPXpznAa3B
         Kh7Yq87ocQjaysC0Veri+8bDCelB6hppZQd7SiZ27Fp+smZhJ4bbgqMURJ82rWRsCeTy
         LQx38XapCqk4Nj42r1uiGgagtYzdGOzLWa1wfIucwDc9WzOZSOx168R056zJfI8g8/0x
         SbxlUaS+0tBTkqTqMGEMvzQAVbnbr6rHhrPkXYr6twKDNHu9RCU1ECqnKNnf7h8Q+AqN
         gl7Qz8YFATGM4J9FwB0BLVQIH0tCYxz5TMcM8LsrzuSS8zk1FvjgWgbuEPdk+T1WG8Kh
         wybg==
X-Gm-Message-State: ACgBeo3Je3SEXpsIijdrTRKN6AQ1uh0FQzfa1LYHWOmjM+t3N7AtVHJG
        I6nY4eQ+hBvuozO/Lf3Yka0345BzqAKtBQ==
X-Google-Smtp-Source: AA6agR7lzgeVNFNaoBp35EMn0KFGA+BHcAQt5MkpfwMV1EzlLpl5AVjMEAylWuOjApBxSUAcBUHYzQ==
X-Received: by 2002:a05:6214:20a2:b0:476:9071:2e60 with SMTP id 2-20020a05621420a200b0047690712e60mr12245740qvd.110.1659538747629;
        Wed, 03 Aug 2022 07:59:07 -0700 (PDT)
Received: from horus.lan (75-164-204-71.ptld.qwest.net. [75.164.204.71])
        by smtp.gmail.com with ESMTPSA id ey19-20020a05622a4c1300b0031efc91644fsm11114114qtb.33.2022.08.03.07.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Aug 2022 07:59:07 -0700 (PDT)
From:   Jason Gerecke <killertofu@gmail.com>
X-Google-Original-From: Jason Gerecke <jason.gerecke@wacom.com>
To:     linux-i2c@vger.kernel.org, linux-iio <linux-iio@vger.kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Wolfram Sang <wsa-dev@sang-engineering.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Ping Cheng <pinglinux@gmail.com>,
        "Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Ping Cheng <ping.cheng@wacom.com>
Subject: [PATCH v2] i2c: Use u8 type in i2c transfer calls
Date:   Wed,  3 Aug 2022 07:59:37 -0700
Message-Id: <20220803145937.698603-1-jason.gerecke@wacom.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220718153448.173652-1-jason.gerecke@wacom.com>
References: <20220718153448.173652-1-jason.gerecke@wacom.com>
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

At the same time, update the max1363 driver to match the new interface so
we don't introduce a new Wincompatible-function-pointer-types warning.

Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
Reviewed-by: Ping Cheng <ping.cheng@wacom.com>
---
Changes in v2:
  - Added modifications to the max1363 driver required to avoid warnings

 drivers/i2c/i2c-core-base.c |  2 +-
 drivers/iio/adc/max1363.c   |  8 ++++----
 include/linux/i2c.h         | 14 +++++++-------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 10f35f942066a..2925507e8626d 100644
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
diff --git a/drivers/iio/adc/max1363.c b/drivers/iio/adc/max1363.c
index eef55ed4814a6..ebe6eb99583da 100644
--- a/drivers/iio/adc/max1363.c
+++ b/drivers/iio/adc/max1363.c
@@ -184,9 +184,9 @@ struct max1363_state {
 	struct regulator		*vref;
 	u32				vref_uv;
 	int				(*send)(const struct i2c_client *client,
-						const char *buf, int count);
+						const u8 *buf, int count);
 	int				(*recv)(const struct i2c_client *client,
-						char *buf, int count);
+						u8 *buf, int count);
 };
 
 #define MAX1363_MODE_SINGLE(_num, _mask) {				\
@@ -312,7 +312,7 @@ static const struct max1363_mode
 	return NULL;
 }
 
-static int max1363_smbus_send(const struct i2c_client *client, const char *buf,
+static int max1363_smbus_send(const struct i2c_client *client, const u8 *buf,
 		int count)
 {
 	int i, err;
@@ -323,7 +323,7 @@ static int max1363_smbus_send(const struct i2c_client *client, const char *buf,
 	return err ? err : count;
 }
 
-static int max1363_smbus_recv(const struct i2c_client *client, char *buf,
+static int max1363_smbus_recv(const struct i2c_client *client, u8 *buf,
 		int count)
 {
 	int i, ret;
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 8eab5017bff30..3a94385f4642c 100644
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

