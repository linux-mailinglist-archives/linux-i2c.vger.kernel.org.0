Return-Path: <linux-i2c+bounces-12188-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA32B1F70A
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 00:08:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0085189D0B2
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Aug 2025 22:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6BDC2C1591;
	Sat,  9 Aug 2025 22:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gKpIEBR0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3412BF017;
	Sat,  9 Aug 2025 22:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754777251; cv=none; b=aoQg3Wbaq3yAYIqpEQPG0SQuD5kVnvmkE0l6cFGngH4w2Cy6LLkDlZDhD4rptZHBJfnEtznFSaIwhez+WxXtCEfNEGdrXu0ba0TvKeUHF20nboIToAn8ogh4tXWKdIDjPQeHtuThGIYGWzCUV76F/xjtunZ9pQttnaQbqTUGJY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754777251; c=relaxed/simple;
	bh=LtAV3Ggmq1MbmbqLhrdnZ1+71rqop14zoDhCouihbSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XN7keV4C+MV2+RmGtrdo2bF7vViSyXrpY5i+qLUyHxnIQ+OVxKE9yyFMhV1RaIsP9v6N2i9UrEBeZZQhqezZEX0nTFKugeV9KUAdKgbEjwPfODkNjVOd7s24Ee9sKgjatAg1OdbMJfmFU67eqXhFUg5fEpRfA8xg9DGFqQFuSos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gKpIEBR0; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-459e39ee7ccso31764195e9.2;
        Sat, 09 Aug 2025 15:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754777248; x=1755382048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZBIwO9q61CBSmV0Wosxz7brI5kc6V0Cyrl6SIW8FpNk=;
        b=gKpIEBR0tg5dKXi6YD+1Z49N0/9F9cSG67/ZKkCDKqJe9Qv1MCfvzUZj6hvBeMUate
         3H++YQ73mKtbFDF4VTfCSMOT0uzLCSokjkEIgrMmQ+puZ3CWiL99RX8Etpf2Vh0iNIff
         j6Z1CXO8FRIx65fzo5nk3wEnRZu74LhgqIVEWKv9Afd0Dhy1fDHX2t9YuFYpZkHOCRFq
         oE3HLehM6DiH1/FYYGuMsEFcFrd5kYtBGjWqbfcBDlLJvr/01ezD+3+/iV+pK0jWRGZ0
         LJ6krWtqZA6zyJNkOsMvbGxLFlV7+762+xi8zCdmtkNw0rtoTARWPxzhxVx0rACPyTfj
         hOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754777248; x=1755382048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZBIwO9q61CBSmV0Wosxz7brI5kc6V0Cyrl6SIW8FpNk=;
        b=SqtUItddt9+EQAQMw3UApX8VV59OcuqS3O9ueLjzYAg2vGN+vrPlVCbmjx5gkg7Xy2
         jA8MMKus383REXGV/GufahxzMOCmBwp95t5/vMHWJy699swmzoGWjTrbkY4DqAvxUywJ
         fyBe+TAqgDgL308LwSt9Kf8jkRbyQpFPpdOiqCvBUuvApML3ah95aF7H6eCfnL6wHHPe
         t95Zuz36m/LSPHpmoHz2BXaN2+Kjz7LHChSP1U1t2+dVQwKG87Jryw5PyZ2hTWtIC7Fr
         XFOWZzE16PJfblG3TfwNLCcwFGzoz+r4SvgkGVO3OlvjRSkb3NiDXHRyHdqXveEdfCRE
         r2vQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1IMUlE1t2K6u6d/md3yPfsNT1Wn7UR3RojLWWLNm6IimJMcD6nLrSgEKMOVA8f1YWH+HG8AubqsrwYOq6@vger.kernel.org, AJvYcCXTwbwKu1tcFjxNFLQS8g4Zb/SjxBxwB92zGvXd+xAQ1AIBCRrXc6Sz4hvKdPd/7wBtj1WLxLOK+8Q2@vger.kernel.org
X-Gm-Message-State: AOJu0YwkuTu4cAWQBMl0XQ29ScqoaKlcFfy/t/53o5txTaNTqZkwGsmJ
	B9ORRknOS0EIPoGp9ERvboQ9N+Wqnjji2Yd7jDX4GPhzD9+qG0FDd98+
X-Gm-Gg: ASbGncuhWqqAgcBFGVld/RTd6tQSEU5aTKBBoGsnUZ2JtsBjuEfjV5/6zx5nyoOQXEe
	5d2iNao/NmmHR40PSKcWQiZFTII9gouaXWTDhi3gR7r/v4Tkb+qRT/qrQpV55q14QqG37wQgtc2
	hWbF+3Eela17imPY6zwp2We65NIaYiNjNzEZuBJ0wPVxE/L0v2+KnazSMnXXV65CXZYyhfmCRdl
	CAFXxRhd46jyxQbk2fNjjzSqEKvCEXeMH3Xjfx1YfBgJix5EeGGkBRD6AE9dpRasHQl2ec4KlEv
	pMwWFj0xtu0feoKxVduLwqi/b3PwHdrGc0rYlkc3ONqBAL/okxxAst3pG1I/UXquhGANrZ5lRbk
	j9EcIYIknONDd17ShlLDjFB9D9jUZZh0bH8Lf/8sD3gEZfR5nlAwz08/ddpf7HM4=
X-Google-Smtp-Source: AGHT+IH7Yr2hoTX0VLBd0WE4u3dpd6TdNKmWTv1kHPZkcG+qGNlEYYMH5tTcvNQfzRsyhdyzzk8GwA==
X-Received: by 2002:a05:600c:4f88:b0:456:1923:7549 with SMTP id 5b1f17b1804b1-459f4faf710mr61981025e9.26.1754777248075;
        Sat, 09 Aug 2025 15:07:28 -0700 (PDT)
Received: from builder.. (188-9-142-46.pool.kielnet.net. [46.142.9.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459c58ed0ecsm145592185e9.4.2025.08.09.15.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 15:07:27 -0700 (PDT)
From: Jonas Jelonek <jelonek.jonas@gmail.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Stockhausen <markus.stockhausen@gmx.de>,
	Sven Eckelmann <sven@narfation.org>,
	Harshal Gohel <hg@simonwunderlich.de>,
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH v5 07/11] i2c: rtl9300: move setting SCL frequency to config_io
Date: Sat,  9 Aug 2025 22:07:08 +0000
Message-ID: <20250809220713.1038947-8-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250809220713.1038947-1-jelonek.jonas@gmail.com>
References: <20250809220713.1038947-1-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the register operation to set the SCL frequency to the
rtl9300_i2c_config_io function instead of the rtl9300_i2c_config_xfer
function. This rather belongs there next to selecting the current SDA
output line.

Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
---
 drivers/i2c/busses/i2c-rtl9300.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index ead5aa6e60f8..8e8e98108750 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -95,18 +95,23 @@ static int rtl9300_i2c_select_scl(struct rtl9300_i2c *i2c, u8 scl)
 	return regmap_field_write(i2c->fields[F_SCL_SEL], 1);
 }
 
-static int rtl9300_i2c_config_io(struct rtl9300_i2c *i2c, u8 sda_pin)
+static int rtl9300_i2c_config_io(struct rtl9300_i2c *i2c, struct rtl9300_i2c_chan *chan)
 {
 	struct rtl9300_i2c_drv_data *drv_data;
 	int ret;
 
 	drv_data = (struct rtl9300_i2c_drv_data *)device_get_match_data(i2c->dev);
 
-	ret = regmap_field_update_bits(i2c->fields[F_SDA_SEL], BIT(sda_num), BIT(sda_num));
+	ret = regmap_field_update_bits(i2c->fields[F_SDA_SEL], BIT(chan->sda_num),
+				       BIT(chan->sda_num));
 	if (ret)
 		return ret;
 
-	ret = regmap_field_write(i2c->fields[F_SDA_OUT_SEL], sda_num);
+	ret = regmap_field_write(i2c->fields[F_SDA_OUT_SEL], chan->sda_num);
+	if (ret)
+		return ret;
+
+	ret = regmap_field_write(i2c->fields[F_SCL_FREQ], chan->bus_freq);
 	if (ret)
 		return ret;
 
@@ -121,10 +126,6 @@ static int rtl9300_i2c_config_xfer(struct rtl9300_i2c *i2c, struct rtl9300_i2c_c
 	if (len < 1 || len > 16)
 		return -EINVAL;
 
-	ret = regmap_field_write(i2c->fields[F_SCL_FREQ], chan->bus_freq);
-	if (ret)
-		return ret;
-
 	ret = regmap_field_write(i2c->fields[F_DEV_ADDR], addr);
 	if (ret)
 		return ret;
@@ -244,7 +245,7 @@ static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned s
 
 	mutex_lock(&i2c->lock);
 	if (chan->sda_num != i2c->sda_num) {
-		ret = rtl9300_i2c_config_io(i2c, chan->sda_pin);
+		ret = rtl9300_i2c_config_io(i2c, chan);
 		if (ret)
 			goto out_unlock;
 		i2c->sda_num = chan->sda_num;
-- 
2.48.1


