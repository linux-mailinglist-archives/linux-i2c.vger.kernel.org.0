Return-Path: <linux-i2c+bounces-11157-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 492DDAC820D
	for <lists+linux-i2c@lfdr.de>; Thu, 29 May 2025 20:17:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1281D4A602B
	for <lists+linux-i2c@lfdr.de>; Thu, 29 May 2025 18:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9FC822DA1B;
	Thu, 29 May 2025 18:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JrvIA3RN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5B91DA5F;
	Thu, 29 May 2025 18:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748542669; cv=none; b=a5YvFx6dNSdwB56qyp6QlhON5rn8cQLPKOw8uUCHm5Epm335/yXoEQFEwxgIIPAUF2ASAXvF0jgQ94Lct4krrEoXqGGe2behFIMrbT16G21hzEUynBuyWFYiwZKaZI+OwDM2O0fe7LMvbOTheb+Hf092svI683mi4rlMgbCnV+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748542669; c=relaxed/simple;
	bh=E7t4ziTT3wF/689+gwT++HqhjP1/cK2PxAJ+YqFkDgQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sENaqtnWHJhQRbRLPMKI0PszPC5Wm5tMPJWhQJSIv7TKHfUOAFwO18NixAqPgf0AL5ElJJfRef525sQ+HuZYroTg7cFvQV0LFfo7SRM0cbyCJCff7DhZq93K7AjqSDs8AQuXCOJFIK59J1aY+3jL+arbjRDdKoqZ34fPv9LlaCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JrvIA3RN; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso980319b3a.2;
        Thu, 29 May 2025 11:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748542667; x=1749147467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wECMIUhZX+RAEutiSlsIQW+PxVMgIoUiBXiClAXqQgA=;
        b=JrvIA3RNrdTgNWUigvXz2wA2oKsXFeOtR5A+1jYv5KcDg0cZm8SW8NbnlhVRMjhHwp
         +OmoJUH1zHT23brZZRKYFvmP+3e2VJZ7QoZZ+8mhGKnnjFDNCmUZyfvKpwjF3l9JWytz
         6niIgCimrTD+cqJuz91q/gl2UgCuXZZNW7b9ImlLoMSxrTAh79nb+F1//18DXZWjfQYT
         r4Mz6iytxO7uUA1bgFqKpwVZjZoU2BqWAYdEw//IMPN/ewESa6Snk47vtlrIpGSXlyBp
         rCx1vXYj/q0xuZ+8saEyBr31bHyagJq59BsLFdQxRH1kP61R+Qv0AzGmp070P87rUKqp
         Ddcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748542667; x=1749147467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wECMIUhZX+RAEutiSlsIQW+PxVMgIoUiBXiClAXqQgA=;
        b=CBhpKNswgJndvydmY/Id3hvSifQtH3qQs6jLtfor27eS9PjpQ2lc0bToDibbkashVn
         ieDTPmvBA/dqer/IuL+hWgGkD6MRL7WPv65/4Sxl8mARwoz9RDZtbDfS6iILe4/Y8Y0y
         njpxlVjivS+76Jr2l00Oo600Z7MMA4z6qiXj4TxDcMLxONFjMbTAnGYLZQHH2mVVCz07
         +gniC+p3Rx7ORFaEAzvPAJobjYh1llvEwUDRFRQhSyEJx6S1AL4jtyDF9/IQH5rrEggZ
         WIkw9yqx0hu3TJj4RtsroOhmZzcjgENkhUx8F1xGAcCb6cyMmZ9REEWlOX8PylVhKtQd
         y37Q==
X-Forwarded-Encrypted: i=1; AJvYcCXkMl4EQfdRD2we7EJbK9+IOh5sV97ia2ccTHsUKBpGH/sTBTycBaWwJ1PU4WSzWlCNufKqnkVyoc2pSdI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3LjJ7eK9hoejGc4++kVvyCeYLq1i8ICIsztOlBYCN8sGN+ddp
	LiBKxij6QkIAKTihZfCpJQm2w3WT4+HtRfTrOmQ9C93jlTs/xGhhFUB2
X-Gm-Gg: ASbGncu4P2q+nweGn4ZyP9tok/m4rD//4+poo2UDyeZ8DcofL6q1WoJalThwixIF6NW
	UKXg04LTxTVLCwi5PJsGHYecrmmY5spFSgwuiNIiOlWlbnWpnPmqwuOkEN+U15XosxO3WhdmH1+
	A115s9Q3aCtBKjwlPfCU1VN8fazWeZsltReQEXztBTYkUOyU2vOmmCljabjMTqONvn8zAlyaZ5b
	5vIDgqwWPPkbcKLl/bVUyZbIJ7aX4CJ1NWV+1f+Mau6i0ZTu6ARbuj30EcHAZNTgAfO3cI9ibpE
	pa+SI4/al2Vhv7TzgwvXEVU3vJ92XSB/yavG7E/tyLkclLuUqlg=
X-Google-Smtp-Source: AGHT+IF/n2OErfZ1Jjo+/rD+yuZf0ShecGAPEnjn9Bm4hpsZ56QyABjH7ecsToaN+1MrSuOTlEwvVg==
X-Received: by 2002:a05:6a21:4508:b0:206:aa42:8e7c with SMTP id adf61e73a8af0-21ad9548831mr956312637.18.1748542667276;
        Thu, 29 May 2025 11:17:47 -0700 (PDT)
Received: from pop-os.. ([2401:4900:1c94:c9cf:cfb1:28a5:fd7:978])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb9d33csm287056a12.47.2025.05.29.11.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 11:17:46 -0700 (PDT)
From: Abhinav Ananthu <abhinav.ogl@gmail.com>
To: wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+0a36c1fec090c67a9885@syzkaller.appspotmail.com,
	abhinav.ogl@gmail.com
Subject: [PATCH] i2c: core: Fix uninit-value in i2c_smbus_xfer_emulated
Date: Thu, 29 May 2025 23:45:35 +0530
Message-Id: <20250529181535.15220-1-abhinav.ogl@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

BUG: KMSAN: uninit-value in i2c_smbus_xfer_emulated drivers/i2c/i2c-core-smbus.c:481 [inline]
BUG: KMSAN: uninit-value in __i2c_smbus_xfer+0x23e7/0x2f60

KMSAN reported an uninitialized value access in i2c_smbus_xfer_emulated at
drivers/i2c/i2c-core-smbus.c:481, triggered during an SMBus transfer via
i2cdev_ioctl_smbus. The issue occurs because the local buffers msgbuf0 and
msgbuf1 are not initialized before use, leading to potential undefined
behavior when their contents are accessed.

Initialize msgbuf0 and msgbuf1 with zeros using memset to ensure all buffer
contents are defined before they are used in the SMBus transfer. This
prevents the uninitialized value access reported by KMSAN.

Reported-by: syzbot+0a36c1fec090c67a9885@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0a36c1fec090c67a9885
Fixes: 02ddfb981de8 ("KMSAN : Fix uninit-value in i2c_smbus_xfer_emulated")
Signed-off-by: Abhinav Ananthu <abhinav.ogl@gmail.com>
---
 drivers/i2c/i2c-core-smbus.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index e73afbefe222..a3ee30b72f75 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -332,6 +332,8 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 	 */
 	unsigned char msgbuf0[I2C_SMBUS_BLOCK_MAX+3];
 	unsigned char msgbuf1[I2C_SMBUS_BLOCK_MAX+2];
+	memset(msgbuf0, 0, sizeof(msgbuf0));
+	memset(msgbuf1, 0, sizeof(msgbuf1));
 	int nmsgs = read_write == I2C_SMBUS_READ ? 2 : 1;
 	u8 partial_pec = 0;
 	int status;
-- 
2.34.1


