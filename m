Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E86E9F9ABE
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Nov 2019 21:32:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727275AbfKLUbk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Nov 2019 15:31:40 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45261 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbfKLUbk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Nov 2019 15:31:40 -0500
Received: by mail-pg1-f194.google.com with SMTP id w11so12576648pga.12;
        Tue, 12 Nov 2019 12:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6mlu28jucR3FhUlKEOLugpYNISyaantEq1qNa01r0ZE=;
        b=ax7gbBbqGn/nSwxQS8lZLXMRIG8M/VjKChYXSGCcl6dD/kCer39gy70PU/p6Me/hrI
         le/83kDm+i9GrS2I6b5eUkFf/kKbXpaLuavjSXl31pglyUK41Dcrl3pqsSvy0EggN/WM
         l3Qdr5ZnoFQZtmZAzaenh8XQqnfMtqsIisGSf+vqgr1+gRWj6fX0M3esaTl0a0P7fCvU
         5k/qwrt5tgHltjO0AhTBdPkjRLQTbxFmimysQKZR9uKaFJjHsvYid3b0JLA1cZ55H356
         rlCMjPrHA4YZGZKVPlOjv9/ddUZj1q043uCH7yZMINzhwyW8oXe/RS6qulvlU17wit3W
         Wj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6mlu28jucR3FhUlKEOLugpYNISyaantEq1qNa01r0ZE=;
        b=rnVWy4CMD0qTsjbzzlTYMh5yr7gOf9lOvgMyPwssi981em40WvtcsWlB8zVW/fj5Pb
         k9yXY2rZpyvwEN2PnBUbR0xYXCbM1LgtZ/qK9b5aS03+rhQvfrCQxSwnaLzvfqfC0iN3
         hjzPSOx6NynQWXjOgxkNt2S2ocsrg0qSLyaCvvcwnTG+0efuF9Ap7jXMdkWWfs3kmCYv
         ChTfxbhmB7plsukogmjlkhL7cj+yrfYnzsALtgPrmwYWuhPoDi9oiiOy8bruTfNEd1Zt
         cwrK+ZlJ8Ukwvqaj7vZ/azjq9jILOpaE+NsDr8KmoFtbuFjogmDV6hUVPnxsxED4X2pq
         M5qQ==
X-Gm-Message-State: APjAAAUN8Q1R0Qplw4n6/Epxvlrz8TpnM/H7anziygFtNX+vueOrfoAH
        v0N75qlVOorx0qlRc0Wxu9w=
X-Google-Smtp-Source: APXvYqwpgKjpkHDXU54TfXMHHDvFO38zrJRNs0wsCdohYBSt2gsIQc6XdipvCdyjk5m7M0Talrpu2A==
X-Received: by 2002:a65:6208:: with SMTP id d8mr20277265pgv.167.1573590699040;
        Tue, 12 Nov 2019 12:31:39 -0800 (PST)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id h13sm23264084pfr.98.2019.11.12.12.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 12:31:37 -0800 (PST)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-iio@vger.kernel.orgi, Luca Ceresoli <luca@lucaceresoli.net>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] i2c: smbus: use get/put_unaligned_le16 when working with word data
Date:   Tue, 12 Nov 2019 12:31:31 -0800
Message-Id: <20191112203132.163306-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
In-Reply-To: <20191112203132.163306-1-dmitry.torokhov@gmail.com>
References: <20191112203132.163306-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It is potentially more performant, and also shows intent more clearly,
to use get_unaligned_le16() and put_unaligned_le16() when working with
word data.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

---

Changes in v3:
- split put_unaligned_le16 into a separate patch
- more call sites converted to get/put_unaligned_le16

 drivers/i2c/i2c-core-smbus.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index f8708409b4dbc..7b4e2270eeda1 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -15,6 +15,7 @@
 #include <linux/i2c.h>
 #include <linux/i2c-smbus.h>
 #include <linux/slab.h>
+#include <asm/unaligned.h>
 
 #include "i2c-core.h"
 
@@ -370,8 +371,7 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 			msg[1].len = 2;
 		else {
 			msg[0].len = 3;
-			msgbuf0[1] = data->word & 0xff;
-			msgbuf0[2] = data->word >> 8;
+			put_unaligned_le16(data->word, msgbuf0 + 1);
 		}
 		break;
 	case I2C_SMBUS_PROC_CALL:
@@ -379,8 +379,7 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 		read_write = I2C_SMBUS_READ;
 		msg[0].len = 3;
 		msg[1].len = 2;
-		msgbuf0[1] = data->word & 0xff;
-		msgbuf0[2] = data->word >> 8;
+		put_unaligned_le16(data->word, msgbuf0 + 1);
 		break;
 	case I2C_SMBUS_BLOCK_DATA:
 		if (read_write == I2C_SMBUS_READ) {
@@ -487,7 +486,7 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 			break;
 		case I2C_SMBUS_WORD_DATA:
 		case I2C_SMBUS_PROC_CALL:
-			data->word = msgbuf1[0] | (msgbuf1[1] << 8);
+			data->word = get_unaligned_le16(msgbuf1);
 			break;
 		case I2C_SMBUS_I2C_BLOCK_DATA:
 			for (i = 0; i < data->block[0]; i++)
@@ -648,8 +647,7 @@ s32 i2c_smbus_read_i2c_block_data_or_emulated(const struct i2c_client *client,
 			status = i2c_smbus_read_word_data(client, command + i);
 			if (status < 0)
 				return status;
-			bytes[i] = status & 0xff;
-			bytes[i + 1] = status >> 8;
+			put_unaligned_le16(status, values + i);
 			i += 2;
 		}
 	}
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

