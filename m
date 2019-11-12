Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEB5CF9AC0
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Nov 2019 21:32:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727312AbfKLUbm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Nov 2019 15:31:42 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45264 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727302AbfKLUbl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Nov 2019 15:31:41 -0500
Received: by mail-pg1-f194.google.com with SMTP id w11so12576686pga.12;
        Tue, 12 Nov 2019 12:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rv3NgB/HI4HOG6PeUsJv3rPgClgEcZt4wiNXEd63Cgw=;
        b=bswZwNR7sRmVA3WWoPIHeJJIu1Z4xq/oDcvC/1osBDKlvgVxOyEcZ8YgDtjf8xjusN
         6Err1SFQbWaWqlRrtkdnR25r/Iec126QRoW8Rm2s079btBpfNpwAZsZTocwFMxuy18im
         inyMBaaV1xDfsh8kxoLqZ9JLhOYlEhTo7A9L2A33Ug7+XtbxvM43I1KUtwJvSNWzarwu
         5GkQs4ytCb5OMAwZ/CVOSiJuYa3KBHJ73eR6CTsbn1TbTBjv6gSohPmXXBf6kWyrmA6s
         9Svhldh1nRgCO+DaNicBNCrP78wU3/F2d3BSNSbN9MEL/69q3ZLUHL/D5G5jYTniqmt9
         0VGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rv3NgB/HI4HOG6PeUsJv3rPgClgEcZt4wiNXEd63Cgw=;
        b=m+DcntiTIEFUdNA/i3wLZH8B1poJPuWn1PRcI7ewLha5vNJkDTAgoNrp30NwuZeBds
         kcJqwRb7+YzCikWGoBym93wiZWdNro0GHfeRUOM8bAFHWhnGf01wzPQyjsI383UEfBvl
         mvgo9VxIK8PwXQpjcfn36tqkkIilAUUVfKmNKh8qoRwG6qo5bUmQAQGdg/vzXQS3I+Po
         pEpQl84ONOnuyh8ndZhX/VPq2E7bvcOTH4yz+iNtXwWJ0/hni+f4zIEAIqkvdfy0u/OI
         QADc4mNie3tb0OXn8yMnIRU3JsHPCPDkUYuJVL8RqC1nfOYZwIEYaTt+Vn0FsTyei6RG
         mWew==
X-Gm-Message-State: APjAAAWhJJ8M7DKj0UA0DVLkw8oDl6iZ3zjqndBn/MoahkSOO8T1t/5Q
        gfMEyakKXSQcSUsdnjBqqCs=
X-Google-Smtp-Source: APXvYqw+QqaH2zk3DQvOgVXtpKLNg/CK4RYGmbqYsj2kGca1XXvsMOc5klvGa+NuoxuMYiI46Z7Okg==
X-Received: by 2002:a62:aa0d:: with SMTP id e13mr39529400pff.214.1573590700755;
        Tue, 12 Nov 2019 12:31:40 -0800 (PST)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id h13sm23264084pfr.98.2019.11.12.12.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 12:31:40 -0800 (PST)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-iio@vger.kernel.orgi, Luca Ceresoli <luca@lucaceresoli.net>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] i2c: smbus: switch from loops to memcpy
Date:   Tue, 12 Nov 2019 12:31:32 -0800
Message-Id: <20191112203132.163306-4-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
In-Reply-To: <20191112203132.163306-1-dmitry.torokhov@gmail.com>
References: <20191112203132.163306-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When copying memory from one buffer to another, instead of open-coding
loops with byte-by-byte copies let's use memcpy() which might be a bit
faster and makes intent more clear.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

---

Changes in v3:
- new patch using memcpy() for moving data around

 drivers/i2c/i2c-core-smbus.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index 7b4e2270eeda1..bbafdd3b1b114 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -397,8 +397,7 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 			}
 
 			i2c_smbus_try_get_dmabuf(&msg[0], command);
-			for (i = 1; i < msg[0].len; i++)
-				msg[0].buf[i] = data->block[i - 1];
+			memcpy(msg[0].buf + 1, data->block, msg[0].len - 1);
 		}
 		break;
 	case I2C_SMBUS_BLOCK_PROC_CALL:
@@ -413,8 +412,7 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 
 		msg[0].len = data->block[0] + 2;
 		i2c_smbus_try_get_dmabuf(&msg[0], command);
-		for (i = 1; i < msg[0].len; i++)
-			msg[0].buf[i] = data->block[i - 1];
+		memcpy(msg[0].buf + 1, data->block, msg[0].len - 1);
 
 		msg[1].flags |= I2C_M_RECV_LEN;
 		msg[1].len = 1; /* block length will be added by
@@ -436,8 +434,7 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 			msg[0].len = data->block[0] + 1;
 
 			i2c_smbus_try_get_dmabuf(&msg[0], command);
-			for (i = 1; i <= data->block[0]; i++)
-				msg[0].buf[i] = data->block[i];
+			memcpy(msg[0].buf + 1, data->block + 1, data->block[0]);
 		}
 		break;
 	default:
@@ -489,13 +486,11 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 			data->word = get_unaligned_le16(msgbuf1);
 			break;
 		case I2C_SMBUS_I2C_BLOCK_DATA:
-			for (i = 0; i < data->block[0]; i++)
-				data->block[i + 1] = msg[1].buf[i];
+			memcpy(data->block + 1, msg[1].buf, data->block[0]);
 			break;
 		case I2C_SMBUS_BLOCK_DATA:
 		case I2C_SMBUS_BLOCK_PROC_CALL:
-			for (i = 0; i < msg[1].buf[0] + 1; i++)
-				data->block[i] = msg[1].buf[i];
+			memcpy(data->block, msg[1].buf, msg[1].buf[0] + 1);
 			break;
 		}
 
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

