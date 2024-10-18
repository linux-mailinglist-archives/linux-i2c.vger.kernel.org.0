Return-Path: <linux-i2c+bounces-7465-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E619A31A8
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Oct 2024 02:29:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87082284516
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Oct 2024 00:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4CFF2BB1B;
	Fri, 18 Oct 2024 00:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dehxJw9o"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0CB288BD;
	Fri, 18 Oct 2024 00:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729211334; cv=none; b=n5zA2K/oKZr2rQUhLD7rtcp9oIPOlopa+zYqzzBYZ0cX2THkQUNQ+W0xNYH5Ue1AbEGBgoEHa8/75vQy4tyMVq36wM+lNGfYp9qOUvpjB+RvgnSC31IRnqTfSjPNwWecCc3bAeYy2uFjroVYIXEpc+2WdoL7x3RtvvgMQpHh2yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729211334; c=relaxed/simple;
	bh=66JK6/b1M8aQHeHPNU95vd+XneCAyUjXNMq4l7qyCgc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OfeO2wcOjdCIe9x8UUfUooGPphF96mEXpawjTKGf1P7SfxYHiwD4OTs0H4ekcWGlJiUj5LabJKO/WdHkKd6e1rCttXNalXsvxWIT+tXBGtSsayKSgOnDa3h1CUHhvZ/j8o0AJtCzVYYqhRv4v1qFT1+ccibgIMQFA2rtX/WNDWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dehxJw9o; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2e3fca72a41so711419a91.1;
        Thu, 17 Oct 2024 17:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729211332; x=1729816132; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VS42CEOIYrRc+NNmogoeY9NbTxTmXfv18Zco17bkt8w=;
        b=dehxJw9ohxxY+1qoapWZdmy7LGZSPeocEp+o5lX3l2dqR7FOW2JzcKAq5OWrc/6zIe
         lMvS4TackIRbqoz3zEW7YqzQ9BJtl/jYq3nibVkEZPORKXLZ7MosxNQonbnzhzPduhAa
         5ls6MLEESbuxEifi/I0UASEmOJQj2SHFf7JglAfr67Yr/vZgXRT+yFwZWC/m9B5QnyHx
         DifpwRl8fewtxZ3fsc4EDdC9bN1aExZeEKlIuqo5MKjWQCdgbUv/kDG05NvD559rvCAc
         Fve8pf8FHlu5d6Dxh0g6s4hFGW3663Be37PD1xP312K5Cqa9lzaHUw3z3ZmaFf+IQcic
         ZBZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729211332; x=1729816132;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VS42CEOIYrRc+NNmogoeY9NbTxTmXfv18Zco17bkt8w=;
        b=hP9EZM25SxXeMXz5Ah1jUgqq/ISOG2RIFpV8i2h4Op0yEEHZ/0xefyFajS03GiQT+7
         The2rAos0jMNPslLyMhFMuxLSrxaDUd3L+l2gouiYZg24/Db+vpJOTdlSGrvOGSKh1Ur
         N0Uv7QolEQZGWu93AZjFANzPSfJJyAxWnXsI9/Y0NU1qqfuHOyMYivESJVlKHvvKyD8I
         NlPb16fCpgOjZpZ2/Bcb+k2KKImmjU/H1i57Tp7rgdcTgKyLSJvrhcd7sdcGvT6t+pUe
         UDpeMCf+RF0pHQR3LAAtU6ISeEYc09YOIFmLm6q9ROoiE6Q9h3IS7ifhaO3d4fzot4jg
         UTFg==
X-Forwarded-Encrypted: i=1; AJvYcCUgd3pzeB3JxY85ZvFBKj4oQ0ArXc76rRGwGAxNR6wsaJDHytFew3genGqaLwJjHSTiZL+wECjXjbU=@vger.kernel.org, AJvYcCVs6KDSJiEEqmZA0dCiOJ1+XxcqxIp0JLuflyDP9aoFZocX0lPiCwkRMVfAAjSyWInQBwnIu9KxJLus4CLC@vger.kernel.org
X-Gm-Message-State: AOJu0Yzodn5OrNu/8eeOCp/e5daenHmzCQni7P6Enc9p6QpjA4h4Vu+7
	8KACxRO/Kh+YzHRy/uXF9Bl+Fp+VczKPeVQSxFxQzDUEnYldBQg1
X-Google-Smtp-Source: AGHT+IEkRunm2xCYdMhWzONzRfVZrh/svDR8PAIr0bJqnPz6tBPPyU0slKLCobQynF6UYzPxuJfHhg==
X-Received: by 2002:a17:90a:f189:b0:2e2:7f8f:3ad7 with SMTP id 98e67ed59e1d1-2e5615d6941mr981771a91.7.1729211332088;
        Thu, 17 Oct 2024 17:28:52 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:136e:2635:ea46:fe25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e55d8036a8sm541199a91.31.2024.10.17.17.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 17:28:51 -0700 (PDT)
Date: Thu, 17 Oct 2024 17:28:48 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Wolfram Sang <wsa@kernel.org>, itewqq <shipeiqu@sjtu.edu.cn>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: smbus: make i2c_smbus_read_block_data() safer
Message-ID: <ZxGrwObOFkNuCn_w@google.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

i2c_smbus_read_block_data() is dangerous to use because it may deliver
up to I2C_SMBUS_BLOCK_MAX (32) bytes, which may be surprising to the
caller. Callers tend to allocate buffers of sizes big enough to hold
data from a well-behaving device and do not expect that
i2c_smbus_read_block_data() may attempt to write more data than
expected.

To make i2c_smbus_read_block_data() safer to use change it so that
it accepts size of the supplied buffer as another argument and ensure
that it will not copy more data than the size of the buffer.

To allow users to gradually transition to the new API employ some
macro trickery allowing calling i2c_smbus_read_block_data() with either
3 or 4 arguments. When called with 3 arguments it is assumed that
the buffer size is I2C_SMBUS_BLOCK_MAX bytes. Once everyone is
transitioned to the 4 argument form the macros should be removed.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 Documentation/i2c/dev-interface.rst |  5 +++--
 drivers/i2c/i2c-core-smbus.c        | 21 +++++++++++++--------
 include/linux/i2c.h                 | 19 +++++++++++++++++--
 3 files changed, 33 insertions(+), 12 deletions(-)

diff --git a/Documentation/i2c/dev-interface.rst b/Documentation/i2c/dev-interface.rst
index c277a8e1202b..4df5330aca00 100644
--- a/Documentation/i2c/dev-interface.rst
+++ b/Documentation/i2c/dev-interface.rst
@@ -161,9 +161,10 @@ for details) through the following functions::
   __s32 i2c_smbus_process_call(int file, __u8 command, __u16 value);
   __s32 i2c_smbus_block_process_call(int file, __u8 command, __u8 length,
                                      __u8 *values);
-  __s32 i2c_smbus_read_block_data(int file, __u8 command, __u8 *values);
+  __s32 i2c_smbus_read_block_data(int file, __u8 command, __u8 length,
+                                  __u8 *values);
   __s32 i2c_smbus_write_block_data(int file, __u8 command, __u8 length,
-                                   __u8 *values);
+                                   const __u8 *values);
 
 All these transactions return -1 on failure; you can read errno to see
 what happened. The 'write' transactions return 0 on success; the
diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index e3b96fc53b5c..9a076397f555 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -207,11 +207,11 @@ s32 i2c_smbus_write_word_data(const struct i2c_client *client, u8 command,
 EXPORT_SYMBOL(i2c_smbus_write_word_data);
 
 /**
- * i2c_smbus_read_block_data - SMBus "block read" protocol
+ * __i2c_smbus_read_block_data - SMBus "block read" protocol
  * @client: Handle to slave device
  * @command: Byte interpreted by slave
- * @values: Byte array into which data will be read; big enough to hold
- *	the data returned by the slave.  SMBus allows at most 32 bytes.
+ * @length: size of the @values array. SMBus allows at most 32 bytes
+ * @values: Byte array into which data will be read
  *
  * This executes the SMBus "block read" protocol, returning negative errno
  * else the number of data bytes in the slave's response.
@@ -221,22 +221,27 @@ EXPORT_SYMBOL(i2c_smbus_write_word_data);
  * support this; its emulation through I2C messaging relies on a specific
  * mechanism (I2C_M_RECV_LEN) which may not be implemented.
  */
-s32 i2c_smbus_read_block_data(const struct i2c_client *client, u8 command,
-			      u8 *values)
+s32 __i2c_smbus_read_block_data(const struct i2c_client *client, u8 command,
+				u8 length, u8 *values)
 {
 	union i2c_smbus_data data;
+	int ret_len;
 	int status;
 
+	if (length > I2C_SMBUS_BLOCK_MAX)
+		return -EINVAL;
+
 	status = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
 				I2C_SMBUS_READ, command,
 				I2C_SMBUS_BLOCK_DATA, &data);
 	if (status)
 		return status;
 
-	memcpy(values, &data.block[1], data.block[0]);
-	return data.block[0];
+	ret_len = min(length, data.block[0]);
+	memcpy(values, &data.block[1], ret_len);
+	return ret_len;
 }
-EXPORT_SYMBOL(i2c_smbus_read_block_data);
+EXPORT_SYMBOL(__i2c_smbus_read_block_data);
 
 /**
  * i2c_smbus_write_block_data - SMBus "block write" protocol
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 377def497298..799477aea903 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -174,8 +174,23 @@ i2c_smbus_write_word_swapped(const struct i2c_client *client,
 }
 
 /* Returns the number of read bytes */
-s32 i2c_smbus_read_block_data(const struct i2c_client *client,
-			      u8 command, u8 *values);
+s32 __i2c_smbus_read_block_data(const struct i2c_client *client,
+				u8 command, u8 length, u8 *values);
+/*
+ * This monstrosity allows to call i2c_smbus_read_block_data() with either
+ * 3 or 4 arguments and will be removed once all users have been switched
+ * to the 4 argument version.
+ */
+#define __i2c_smbus_read_block_data_3arg(client, cmd, values)			\
+	__i2c_smbus_read_block_data(client, cmd, I2C_SMBUS_BLOCK_MAX, values)
+#define __i2c_smbus_read_block_data_4arg(client, cmd, length, values)		\
+	__i2c_smbus_read_block_data(client, cmd, length, values)
+#define __i2c_smbus_read_block_data_impl(_1, _2, _3, _4, impl, ...) impl
+#define i2c_smbus_read_block_data(client, cmd, varargs...)			\
+	__i2c_smbus_read_block_data_impl(client, cmd, varargs,			\
+					 __i2c_smbus_read_block_data_4arg,	\
+					 __i2c_smbus_read_block_data_3arg)	\
+					 (client, cmd, varargs)
 s32 i2c_smbus_write_block_data(const struct i2c_client *client,
 			       u8 command, u8 length, const u8 *values);
 /* Returns the number of read bytes */
-- 
2.47.0.rc1.288.g06298d1525-goog


-- 
Dmitry

