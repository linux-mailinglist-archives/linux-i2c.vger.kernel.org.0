Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC19EF85BA
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Nov 2019 01:58:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726910AbfKLA6b (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Nov 2019 19:58:31 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:34514 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726908AbfKLA6b (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Nov 2019 19:58:31 -0500
Received: by mail-pg1-f194.google.com with SMTP id z188so4720854pgb.1;
        Mon, 11 Nov 2019 16:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=OerEaKIzY52CJsgsFua8s4hgnNWjTX/Tlc+maFlXWYo=;
        b=jYBsewf1QHQ6mEufL5qpWh0Z3PPEYpSmQ7jBu4PvhsL10HCQJYFrlsYwyxY0D7QdGW
         tq1cJ3F2heEip8nsypA76s2uRkFZWr/2wEMQgo52hIJW3s9TfyEbd+tCJkSHKUTup0op
         6dL0IsHZFfPRN2Evvp15lSf3WCJpCjWlDjyp8UzacNHKkItY7+DdU9xqqbNN0zh7k9+L
         fo3KUgHT6ErvcF7usd6lX1TEPnob1kPqS6ZZMpJ9wP1WqbcQYGPPsZjSYuYYdw+1GFfo
         stAn5BO+1SBNud/J8jD2Ys21kRzXezBgJ05FGcKWZc20q/nTqhRJttH19VTq89VyNPMU
         1uwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=OerEaKIzY52CJsgsFua8s4hgnNWjTX/Tlc+maFlXWYo=;
        b=JW8Vm1EwxFOYvCNivt7wmqJKF7D870ytVOZM/Nt1Rg/c6Ld7LkIb4+mZTNzEujDMUR
         GHH3EGD8S9V3WZ1xb3a+NwE0yX2d27cALohejHgx4bBTga14KtCe71VJn+EsEIDDDQky
         HwWrBHriASVByhtQBqDjs4Q9/QonGQCMRns5k4yh+DBRymqcke5Vu5gLRlGid3hKKOif
         KlTVIfp1V09CYch8KYRDNzGr1OencyqKNvTArC4UAvt3shP+pB/0S9Mk1lpgS8X9fnxp
         E0jYAT5E+mVDlQ6N28GLJZ3r+idQpkhkrHWy37tynG7WfZoJnjxbKkjlQad7JX5GE97d
         VQag==
X-Gm-Message-State: APjAAAWxGv6Th1mIjwM45e1ZLIWQxQ0g3++WYbkkcwA9i/0xvw1SIb8J
        AKZeGAN+QBINRNFacryv49A=
X-Google-Smtp-Source: APXvYqxZCDue9zRM3oJh9ziib4fXTmz0hfO7Ghn5vc+kgPiYyz+d7LT+LyOxFR9a7wx7rYZtbS+ajw==
X-Received: by 2002:a65:620d:: with SMTP id d13mr32858019pgv.64.1573520309435;
        Mon, 11 Nov 2019 16:58:29 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id v63sm15680668pfb.181.2019.11.11.16.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 16:58:28 -0800 (PST)
Date:   Mon, 11 Nov 2019 16:58:26 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-iio@vger.kernel.org
Subject: [PATCH v2] i2c: use void pointers for supplying data for reads and
 writes
Message-ID: <20191112005826.GA96746@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There is no need to force users of i2c_master_send()/i2c_master_recv()
and other i2c read/write bulk data API to cast everything into u8
pointers.  While everything can be considered byte stream, the drivers
are usually work with more structured data.

Let's switch the APIs to accept [const] void pointers to cut amount of
casting needed.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

Changes in v2:

- adjusted max1363 to the new i2c_master_send/recv signatures

I sent the previous version of this patch 04/01/17 and kbuild promptly
noticed that it broke max1363. And it took me only 2.5 years to get back
to it ;)

Given that it is only one IIO driver that is affected I hope it can go
through Wolfram's tree and we do not need to go through staged API
rollout.

 drivers/i2c/i2c-core-base.c  |  2 +-
 drivers/i2c/i2c-core-smbus.c | 16 ++++++++--------
 drivers/iio/adc/max1363.c    | 14 ++++++++------
 include/linux/i2c.h          | 28 +++++++++++++++-------------
 4 files changed, 32 insertions(+), 28 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 6a5183cffdfc3..aeb4201ef55e4 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -2065,7 +2065,7 @@ EXPORT_SYMBOL(i2c_transfer);
  *
  * Returns negative errno, or else the number of bytes transferred.
  */
-int i2c_transfer_buffer_flags(const struct i2c_client *client, char *buf,
+int i2c_transfer_buffer_flags(const struct i2c_client *client, void *buf,
 			      int count, u16 flags)
 {
 	int ret;
diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index 3ac426a8ab5ab..4172f8e647f81 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -15,6 +15,7 @@
 #include <linux/i2c.h>
 #include <linux/i2c-smbus.h>
 #include <linux/slab.h>
+#include <asm/unaligned.h>
 
 #include "i2c-core.h"
 
@@ -213,7 +214,7 @@ EXPORT_SYMBOL(i2c_smbus_write_word_data);
  * mechanism (I2C_M_RECV_LEN) which may not be implemented.
  */
 s32 i2c_smbus_read_block_data(const struct i2c_client *client, u8 command,
-			      u8 *values)
+			      void *values)
 {
 	union i2c_smbus_data data;
 	int status;
@@ -240,7 +241,7 @@ EXPORT_SYMBOL(i2c_smbus_read_block_data);
  * else zero on success.
  */
 s32 i2c_smbus_write_block_data(const struct i2c_client *client, u8 command,
-			       u8 length, const u8 *values)
+			       u8 length, const void *values)
 {
 	union i2c_smbus_data data;
 
@@ -256,7 +257,7 @@ EXPORT_SYMBOL(i2c_smbus_write_block_data);
 
 /* Returns the number of read bytes */
 s32 i2c_smbus_read_i2c_block_data(const struct i2c_client *client, u8 command,
-				  u8 length, u8 *values)
+				  u8 length, void *values)
 {
 	union i2c_smbus_data data;
 	int status;
@@ -276,7 +277,7 @@ s32 i2c_smbus_read_i2c_block_data(const struct i2c_client *client, u8 command,
 EXPORT_SYMBOL(i2c_smbus_read_i2c_block_data);
 
 s32 i2c_smbus_write_i2c_block_data(const struct i2c_client *client, u8 command,
-				   u8 length, const u8 *values)
+				   u8 length, const void *values)
 {
 	union i2c_smbus_data data;
 
@@ -628,7 +629,7 @@ EXPORT_SYMBOL(__i2c_smbus_xfer);
  * transfer.
  */
 s32 i2c_smbus_read_i2c_block_data_or_emulated(const struct i2c_client *client,
-					      u8 command, u8 length, u8 *values)
+					      u8 command, u8 length, void *values)
 {
 	u8 i = 0;
 	int status;
@@ -647,8 +648,7 @@ s32 i2c_smbus_read_i2c_block_data_or_emulated(const struct i2c_client *client,
 			status = i2c_smbus_read_word_data(client, command + i);
 			if (status < 0)
 				return status;
-			values[i] = status & 0xff;
-			values[i + 1] = status >> 8;
+			put_unaligned_le16(status, values + i);
 			i += 2;
 		}
 	}
@@ -657,7 +657,7 @@ s32 i2c_smbus_read_i2c_block_data_or_emulated(const struct i2c_client *client,
 		status = i2c_smbus_read_byte_data(client, command + i);
 		if (status < 0)
 			return status;
-		values[i] = status;
+		*(u8 *)(values + i) = status;
 		i++;
 	}
 
diff --git a/drivers/iio/adc/max1363.c b/drivers/iio/adc/max1363.c
index 5c2cc61b666e7..48ed76a0e83d4 100644
--- a/drivers/iio/adc/max1363.c
+++ b/drivers/iio/adc/max1363.c
@@ -182,9 +182,9 @@ struct max1363_state {
 	struct regulator		*vref;
 	u32				vref_uv;
 	int				(*send)(const struct i2c_client *client,
-						const char *buf, int count);
+						const void *buf, int count);
 	int				(*recv)(const struct i2c_client *client,
-						char *buf, int count);
+						void *buf, int count);
 };
 
 #define MAX1363_MODE_SINGLE(_num, _mask) {				\
@@ -310,27 +310,29 @@ static const struct max1363_mode
 	return NULL;
 }
 
-static int max1363_smbus_send(const struct i2c_client *client, const char *buf,
+static int max1363_smbus_send(const struct i2c_client *client, const void *buf,
 		int count)
 {
+	const u8 *data = buf;
 	int i, err;
 
 	for (i = err = 0; err == 0 && i < count; ++i)
-		err = i2c_smbus_write_byte(client, buf[i]);
+		err = i2c_smbus_write_byte(client, data[i]);
 
 	return err ? err : count;
 }
 
-static int max1363_smbus_recv(const struct i2c_client *client, char *buf,
+static int max1363_smbus_recv(const struct i2c_client *client, void *buf,
 		int count)
 {
+	u8 *data = buf;
 	int i, ret;
 
 	for (i = 0; i < count; ++i) {
 		ret = i2c_smbus_read_byte(client);
 		if (ret < 0)
 			return ret;
-		buf[i] = ret;
+		data[i] = ret;
 	}
 
 	return count;
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index aaf57d9b41dbb..64cf92e191aa8 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -51,7 +51,7 @@ struct property_entry;
  * @count must be be less than 64k since msg.len is u16.
  */
 extern int i2c_transfer_buffer_flags(const struct i2c_client *client,
-				     char *buf, int count, u16 flags);
+				     void *buf, int count, u16 flags);
 
 /**
  * i2c_master_recv - issue a single I2C message in master receive mode
@@ -62,7 +62,7 @@ extern int i2c_transfer_buffer_flags(const struct i2c_client *client,
  * Returns negative errno, or else the number of bytes read.
  */
 static inline int i2c_master_recv(const struct i2c_client *client,
-				  char *buf, int count)
+				  void *buf, int count)
 {
 	return i2c_transfer_buffer_flags(client, buf, count, I2C_M_RD);
 };
@@ -77,7 +77,7 @@ static inline int i2c_master_recv(const struct i2c_client *client,
  * Returns negative errno, or else the number of bytes read.
  */
 static inline int i2c_master_recv_dmasafe(const struct i2c_client *client,
-					  char *buf, int count)
+					  void *buf, int count)
 {
 	return i2c_transfer_buffer_flags(client, buf, count,
 					 I2C_M_RD | I2C_M_DMA_SAFE);
@@ -92,9 +92,10 @@ static inline int i2c_master_recv_dmasafe(const struct i2c_client *client,
  * Returns negative errno, or else the number of bytes written.
  */
 static inline int i2c_master_send(const struct i2c_client *client,
-				  const char *buf, int count)
+				  const void *buf, int count)
 {
-	return i2c_transfer_buffer_flags(client, (char *)buf, count, 0);
+	return i2c_transfer_buffer_flags(client, (void *)buf /* const cast */,
+					 count, 0);
 };
 
 /**
@@ -107,10 +108,10 @@ static inline int i2c_master_send(const struct i2c_client *client,
  * Returns negative errno, or else the number of bytes written.
  */
 static inline int i2c_master_send_dmasafe(const struct i2c_client *client,
-					  const char *buf, int count)
+					  const void *buf, int count)
 {
-	return i2c_transfer_buffer_flags(client, (char *)buf, count,
-					 I2C_M_DMA_SAFE);
+	return i2c_transfer_buffer_flags(client, (void *)buf /* const cast */,
+					 count, I2C_M_DMA_SAFE);
 };
 
 /* Transfer num messages.
@@ -166,18 +167,19 @@ i2c_smbus_write_word_swapped(const struct i2c_client *client,
 
 /* Returns the number of read bytes */
 extern s32 i2c_smbus_read_block_data(const struct i2c_client *client,
-				     u8 command, u8 *values);
+				     u8 command, void *values);
 extern s32 i2c_smbus_write_block_data(const struct i2c_client *client,
-				      u8 command, u8 length, const u8 *values);
+				      u8 command, u8 length,
+				      const void *values);
 /* Returns the number of read bytes */
 extern s32 i2c_smbus_read_i2c_block_data(const struct i2c_client *client,
-					 u8 command, u8 length, u8 *values);
+					 u8 command, u8 length, void *values);
 extern s32 i2c_smbus_write_i2c_block_data(const struct i2c_client *client,
 					  u8 command, u8 length,
-					  const u8 *values);
+					  const void *values);
 extern s32
 i2c_smbus_read_i2c_block_data_or_emulated(const struct i2c_client *client,
-					  u8 command, u8 length, u8 *values);
+					  u8 command, u8 length, void *values);
 int i2c_get_device_id(const struct i2c_client *client,
 		      struct i2c_device_identity *id);
 #endif /* I2C */
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog


-- 
Dmitry
