Return-Path: <linux-i2c+bounces-4982-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 830C9931775
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jul 2024 17:18:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CA361F225C2
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jul 2024 15:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FE6D1E528;
	Mon, 15 Jul 2024 15:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="due/pvol"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEC82AD31;
	Mon, 15 Jul 2024 15:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721056718; cv=none; b=uVHb7x9lfZcbQBONWhafoYsWtRi+V0G8iL/oKnZqglWS6Zm0VhItSbkRQyQPoas9jmiDrWWsvQ40k+oVHPdVR2IeKtpoLAZIh+UoNHVRwMWu+/fNJj/pXwSkAY9m75chU7fE9gRAU2u4yWodyXO+CllbEXqJBedDSs7hum4MeR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721056718; c=relaxed/simple;
	bh=HX9j+NtsGcCDjemXexGc35YSQU3TKNC7TnNWSqPdoTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dq+AsnaEn8+NcyHWWFXO+C9SIQCmR3ab85s7LJQoCEwv+pxrH19GHSheuM5uX13HLGqvkoSxzMRg8RR7k492Z3qtSQDq9LoHFuiWvPmarR11MMH7VGm+WWW0brhlSWu/rIe0opcvlnUZ6rEEzbNXYsJj69GWn4kXhtuOFxVM1OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=due/pvol; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3679e9bfb08so2452898f8f.1;
        Mon, 15 Jul 2024 08:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721056715; x=1721661515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ce5HKGru3176tg37KzVwYW1GSZqa27PAYLpfwOr/uas=;
        b=due/pvol4IsXETOFegoaFOz/oiyYZdlPcvxs/UQ4R+bQdN5E07eUAj09dMH7DybIVA
         0KFskXVqy6ZMQMlTIgNhOyjBjJ5FW0KtrPWjLekhCLbDq6Anv9XlS0z9Z1kgJqHUR9Fd
         PQXaDk3HJ8iY74GE9Ccu//y3rvlqicROunRfsBthG49htiQkGrgqXNeB8Tljs2hknUGg
         oiKUbVo+sLN1HxDlbDJImSl+rQaZEkxvrt5dTqlIxawbtxZaAbKcL/SW8EzDpYDwgV6Z
         hD08cauNP85P/f7AJVVVlt3priMJHHuWLoA5uSOS66fdORjtUQFIweOsA4pFPksEFzAT
         ugGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721056715; x=1721661515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ce5HKGru3176tg37KzVwYW1GSZqa27PAYLpfwOr/uas=;
        b=Ihnvj+UYB5AaoCt+ZTTDMFNWYkJd8zQu0CRKouTlNzfqtQj4AFJTZ3KFCQKEMiGnqs
         DCrIXcldfN+zcb8LzNxrWJI4W87Tf6vAnGRJrm3NlhHyZ/DtuHKQy1QfC1vrmd++S7lk
         /2Xf54L8y9S39Hkgyd+k+IkewsJSN9ejc3mpGXjusXknKfeaAmd48O8KlThjytr89OIl
         R0jzGh/B5JUdM8QI2FFu8FIThWPGx9xdHLtX4OO8F7oMl08hk1WLNFIxLgHxkXfZ4us1
         /VUASy4zt7nf59ShipTyVgxJVCiIPTNU/PkloWIgADcJiiEUkmc9WV+wpv9VboYgnG4c
         lJ6g==
X-Forwarded-Encrypted: i=1; AJvYcCXhnctSMNK9G38exhVnkB/KkLj1SP6EPs0KvzQW6IXnaBlJ4DCw7SrMZ4Tx5XaT4iPLiwrHDvq+5ZSCaKWOtWSqFjZqOg5sb260Tafh
X-Gm-Message-State: AOJu0YxCEj03PnRd4ZHSWJzqu2sMxfGrZCUCjuZlGgEJWTtvYY6jLf34
	L9UOpZ+oz2F+/F7dpfxMUUrpwjvJYrDBHNS2gkJiXui25DlW+VxV
X-Google-Smtp-Source: AGHT+IGbuGcZ320eIDhwquWRL5r+JmXNJtzpqJAy33gfEJ4SEJlISeCaCZaCyiBiVy7I1VVyq8qHyg==
X-Received: by 2002:a5d:61c7:0:b0:366:df58:1fd9 with SMTP id ffacd0b85a97d-367ff705372mr8165666f8f.24.1721056714706;
        Mon, 15 Jul 2024 08:18:34 -0700 (PDT)
Received: from eichest-laptop.lan ([2a02:168:af72:0:564b:c18:f4fc:19ad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dafbb5bsm6682609f8f.80.2024.07.15.08.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 08:18:34 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	wsa+renesas@sang-engineering.com,
	francesco.dolcini@toradex.com,
	joao.goncalves@toradex.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v1 1/3] i2c: imx: only poll for bus busy in multi master mode
Date: Mon, 15 Jul 2024 17:17:51 +0200
Message-ID: <20240715151824.90033-2-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240715151824.90033-1-eichest@gmail.com>
References: <20240715151824.90033-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

According to the reference manual it is only necessary to poll for bus
busy and arbitration lost in multi master mode. This helps to avoid
rescheduling while the i2c bus is busy and avoids SMBus devices to
timeout.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 drivers/i2c/busses/i2c-imx.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 3842e527116b7..1add946e3bc20 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -216,6 +216,8 @@ struct imx_i2c_struct {
 	struct i2c_client	*slave;
 	enum i2c_slave_event last_slave_event;
 
+	bool			multi_master;
+
 	/* For checking slave events. */
 	spinlock_t     slave_lock;
 	struct hrtimer slave_timer;
@@ -481,6 +483,9 @@ static int i2c_imx_bus_busy(struct imx_i2c_struct *i2c_imx, int for_busy, bool a
 	unsigned long orig_jiffies = jiffies;
 	unsigned int temp;
 
+	if (!i2c_imx->multi_master)
+		return 0;
+
 	while (1) {
 		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
 
@@ -540,8 +545,8 @@ static int i2c_imx_trx_complete(struct imx_i2c_struct *i2c_imx, bool atomic)
 		return -ETIMEDOUT;
 	}
 
-	/* check for arbitration lost */
-	if (i2c_imx->i2csr & I2SR_IAL) {
+	/* In multi-master mode check for arbitration lost */
+	if (i2c_imx->multi_master && (i2c_imx->i2csr & I2SR_IAL)) {
 		dev_dbg(&i2c_imx->adapter.dev, "<%s> Arbitration lost\n", __func__);
 		i2c_imx_clear_irq(i2c_imx, I2SR_IAL);
 
@@ -1468,6 +1473,8 @@ static int i2c_imx_probe(struct platform_device *pdev)
 		goto rpm_disable;
 	}
 
+	i2c_imx->multi_master = of_property_read_bool(pdev->dev.of_node, "multi-master");
+
 	/* Set up clock divider */
 	i2c_imx->bitrate = I2C_MAX_STANDARD_MODE_FREQ;
 	ret = of_property_read_u32(pdev->dev.of_node,
-- 
2.43.0


