Return-Path: <linux-i2c+bounces-3825-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D02198FD4FA
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 20:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EE571F21764
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 18:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AABC613B5A9;
	Wed,  5 Jun 2024 18:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BoWahOKK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B92613AD18
	for <linux-i2c@vger.kernel.org>; Wed,  5 Jun 2024 18:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610442; cv=none; b=F4v0D4k3uEXKR1m4x62AixiKIDa2X+tnk/hPU6oO0pLZ1EC6UguKKlzPPu9kzwByRGqQ+Az5lCAqMpvY4SVwWe7XqPMqQ7NSIUsJyg26+5YcYb4BCrfaV9Y0PWj6EgIYRa2pTJ7kMGGWGJDDUgSnOucmWDvh40Kqrk49MeTNRcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610442; c=relaxed/simple;
	bh=W5M28gmX2P2bsv2kzALbrb00qFmArQmOjGRUC+k0KS4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SW1+HTmKe/Ky0awDZp1qIW7NqdWBcDNb65Od2JYyuom0MD2I74d5OLIFrDRZoMQpIbNbqFIVin6psj+rmP+5Vk4fv6lQ53KVtl7N2iySDzlaDo2VZ/j9tBzNyOT0+t5Ru5qKRBsk6oIjY0KUR1M83KRvAP42nV16sC6CfibQMy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BoWahOKK; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-62a08273919so324387b3.1
        for <linux-i2c@vger.kernel.org>; Wed, 05 Jun 2024 11:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610439; x=1718215239; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+5/Bg969zZ0eVFu5myprHh5fQqxMXbek8nDgGOBzWoA=;
        b=BoWahOKKkJ1D7kfGtrnP0cUxpIrNaZ2suLddLewzR2oz4u7CWziBpzwFHQ+ftzncIs
         eFtpB/1H9zyQlzicoMJtoEWPK3DPjQzpefAzkEwD6qaiDFV3B0gWZlDhSKPFv0kyzLES
         mK3VwWf9UebiINpOs4Y5YKaafb1YFVHMwQk3QrRe8v5CIiNxI1jeF5dttXUDVWoM7CnG
         Marjrxai/k2CObkQx8B/L/3vNKpz1bxj4bvREXGRI3sEGkj1WJCLGHIzNySao6ORHqDb
         qzF5yPhaXQSrvk1jdn3p9DrUhYQfLvZ2MNZglt0siqP5RZkjDQWbJGwgpmIA/iYYcKMP
         XYxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610439; x=1718215239;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+5/Bg969zZ0eVFu5myprHh5fQqxMXbek8nDgGOBzWoA=;
        b=QHwQOS+3XD8X6QdKXPluHJfusxNX4NerZ+lWHAsBsGAv5gao2qx4FI10Zg8pUEOF7v
         mpq1KJe5TYPDOmJvsaMQPJnC7Z233xXWanZzlQbtcGyPESNQUrPcaSBCi9OnDRYQvBX0
         XtMTw10RT20afZdwTW6oMps8UYJDYdg2tiPULKhq2vqsQ7R+FeiTCnJBhZgaxf+TLOXT
         7kjD2neCz66OtOgwgSCsEYFXlDUezRohD3IpwPcSnuh/X+zTk0lFyziP6UW1d3zYTsgM
         cYw+ZBYSsrqgfkyrojEaLV1wpaKCuAUQ+HqAN+j3CDW//+PA5g7jS2Cv9U3PzGIZUoLu
         i7wQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSaXqm/KhiVA0GzBWMa3N/QywOrPcMQcuBZdU/OHlp08kKsIQW0sYL1voBYKeYn3QvPFwf7BYSorr5qn5Olv+3cN/0ncriH09r
X-Gm-Message-State: AOJu0YzCd9Nmi3PA/VqSihlWlCES3t9T4hQTWJXynEEAPU6vrT3QD4AF
	NBAqIPP+Tv9CNHdIEBHr5w/8Jogj+eITijjaf5eOl5jJdUpErDueFwNM6VZCax5bvtmrw/Pcrd3
	m47vlBjHMjA==
X-Google-Smtp-Source: AGHT+IFfzGEzBdG0mJIzkY83NzFi7HVUzu/maRQ4zPj2TdB+TSZFtwNCtZCm0+GEQSlNaviP1mxKnEiXfVn+VQ==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:690c:d90:b0:62c:efc:38b7 with SMTP id
 00721157ae682-62cbb4a22a0mr7561267b3.1.1717610438615; Wed, 05 Jun 2024
 11:00:38 -0700 (PDT)
Date: Wed,  5 Jun 2024 17:59:53 +0000
In-Reply-To: <20240605175953.2613260-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605175953.2613260-10-joychakr@google.com>
Subject: [PATCH v1 09/17] misc: mchp_pci1xxxx: Change nvmem reg_read/write
 return type
From: Joy Chakraborty <joychakr@google.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, manugautam@google.com, 
	Joy Chakraborty <joychakr@google.com>
Content-Type: text/plain; charset="UTF-8"

Change nvmem read/write function definition return type to ssize_t.

Signed-off-by: Joy Chakraborty <joychakr@google.com>
---
 .../misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c    | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
index 16695cb5e69c..817382c342d3 100644
--- a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
+++ b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
@@ -117,8 +117,8 @@ static bool is_eeprom_responsive(struct pci1xxxx_otp_eeprom_device *priv)
 	return true;
 }
 
-static int pci1xxxx_eeprom_read(void *priv_t, unsigned int off,
-				void *buf_t, size_t count)
+static ssize_t pci1xxxx_eeprom_read(void *priv_t, unsigned int off,
+				    void *buf_t, size_t count)
 {
 	struct pci1xxxx_otp_eeprom_device *priv = priv_t;
 	void __iomem *rb = priv->reg_base;
@@ -159,8 +159,8 @@ static int pci1xxxx_eeprom_read(void *priv_t, unsigned int off,
 	return ret;
 }
 
-static int pci1xxxx_eeprom_write(void *priv_t, unsigned int off,
-				 void *value_t, size_t count)
+static ssize_t pci1xxxx_eeprom_write(void *priv_t, unsigned int off,
+				     void *value_t, size_t count)
 {
 	struct pci1xxxx_otp_eeprom_device *priv = priv_t;
 	void __iomem *rb = priv->reg_base;
@@ -214,8 +214,8 @@ static void otp_device_set_address(struct pci1xxxx_otp_eeprom_device *priv,
 	writew(hi, priv->reg_base + MMAP_OTP_OFFSET(OTP_ADDR_HIGH_OFFSET));
 }
 
-static int pci1xxxx_otp_read(void *priv_t, unsigned int off,
-			     void *buf_t, size_t count)
+static ssize_t pci1xxxx_otp_read(void *priv_t, unsigned int off,
+				 void *buf_t, size_t count)
 {
 	struct pci1xxxx_otp_eeprom_device *priv = priv_t;
 	void __iomem *rb = priv->reg_base;
@@ -264,8 +264,8 @@ static int pci1xxxx_otp_read(void *priv_t, unsigned int off,
 	return ret;
 }
 
-static int pci1xxxx_otp_write(void *priv_t, unsigned int off,
-			      void *value_t, size_t count)
+static ssize_t pci1xxxx_otp_write(void *priv_t, unsigned int off,
+				  void *value_t, size_t count)
 {
 	struct pci1xxxx_otp_eeprom_device *priv = priv_t;
 	void __iomem *rb = priv->reg_base;
-- 
2.45.1.467.gbab1589fc0-goog


