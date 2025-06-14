Return-Path: <linux-i2c+bounces-11468-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E396CAD9B45
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Jun 2025 10:37:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E569172B33
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Jun 2025 08:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C04D1F428C;
	Sat, 14 Jun 2025 08:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kw9Qw7gA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93ADF13D24D;
	Sat, 14 Jun 2025 08:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749890265; cv=none; b=jog/ajBGecvTfuVHnEFtnCxU6TbEgnfckM8JZqI/HW+eCMerNSiR8U6plyhoV6Ljotijw9u7H+eKoE4zJvev6PlkLTArd0zujtUDNnb6ibXwy8VcO6TcylKvKNLYxGGmqdUlkv0RM3WOx+jvjQy/1FEFp6bap3jvF40OiTYr3xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749890265; c=relaxed/simple;
	bh=TVquBLuNBJXr36WNR7AmdaS9D8iXaiiGBnI0U0Gk1jM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BMSrWAdzptlulqDWOc/szfoO72/bzpJhGyPqZS2hzpmthP+yHbQcyDbFs2yPt5UH7wJI5OwcGX8u5iiugelURUan7JIFDaQznmqAe+BPqR17GS/herjVngdIURHHvIuKQR7hYZLq4iVM3PhSYHJmkBSPGBmxqT0bOMXNdIo6Er4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kw9Qw7gA; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a5123c1533so1720600f8f.2;
        Sat, 14 Jun 2025 01:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749890262; x=1750495062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DFHg0dGblUI1wXsyidBNRkPn8cZAl+YNomAjzoYOkwA=;
        b=kw9Qw7gAyPiSyTmNp5AdCcfypW6jJpjZZN7stCtuvmib8LZ1pZqbgN9CoQFCpzsgU0
         z+u4fRJfxQK9sPc6s8fffBypNWVUkufWUeoRvCskscGwBBBFMEkRmHtq2uZlNdVRPMmi
         fHuD2EmYFW8Cp6MuqcVDUfBThlTI1S7HcDGHl0DZaIJrCHEyvjfn3q7zILuFL5k1n5oK
         26VSmm0hW11SQd35kNSTy5hclvb0fE8mEVc1TQbWWtddS7JUERrKI+oXCyp0QuS2S/yD
         EejuLG8SQqumAqmDukBtC1R5UJhqZu92AY3Sx7ynsUxkNKzQYYM4miqMp+9Ldcotv6ZJ
         iW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749890262; x=1750495062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DFHg0dGblUI1wXsyidBNRkPn8cZAl+YNomAjzoYOkwA=;
        b=ZyCR3HKjoCz310UyvRD25eW/2tTgZ5/NqzcHh/GARweGNNm+CEmmOHm/NNXsb96JYq
         Crhryg4ZBRGN7vkD6x+v/dKMgMaYaNN+M0mbtSn4GG1p4zLHNJa6t2k8+VlgbUHdUEXM
         nUGk46zIG085VdVoJZp7iDMbluROswbzhSAwQczyC4D6+cz33a6o9FzXZuIGq/GxmBwu
         6tV75toA5vScnPfSr4PBOCVTOvJnlOwLs+teAuq494EYgBibemOe4daHAZwz2qQlpfgp
         6u7LdIf1Pt2iMni5jWlbhJXDgxm3CcUHNqdxp6dOOajEQ7qGypngFMJCbEFOEcv5x6BB
         jwuw==
X-Forwarded-Encrypted: i=1; AJvYcCWQlpP9wXNC2MeP+6E0OjRN8y5Vhns13NDSPfrD4MJmTtbSP4QVnvWTVHUF1yTcPtWVfwd7N6R3HhP3DSM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKGW38EPOuO7Wn2fIED70p9jRgXVTlMktSmXXz+BibCzMa+IPH
	ht8VNso3NtPs7wo+lgsej+ZPYSZpMp8xHmqPjDMXZra89aSdEfWfKKNZOd2sdQ==
X-Gm-Gg: ASbGnctdwA8wH2XU0A9yKa0QDIJ0VIn5xP9Km1jX46FJ+2RHBRZgCdRD8h3gV11S4ZI
	Ob6st5cHqEyaDCKs4oO6VBWHVkxlon116iAJp5NljFplftL7KhI8p4suQ/im9+fhr+Fmjqxl3u9
	zzrK5aNMzM15ozY74TxtIBEvC88+ghtRHUs2vMLK1tZy8xDOcIM4WST6ujUX221H2szyWiUpSeu
	GJKvyFB6wCTPQWVWloLYgrqPd4Lau7E3ttwJNk7BB1Lbj7ClDtttkc1gEG50OVYZYb+hQETLA4v
	yx9NyyHcr7hC05qpveWab6WZpAR42ybhU0be+qkWEHG9I1sHBxeh4rIVAe/FRpm5lI6gq5D5VHd
	YV35oXv9tbhCGJfKRgg==
X-Google-Smtp-Source: AGHT+IEIrW+l6vT8Io+ifa59NmDV+JtutKZYfxi1mVjhOq/sxxGD0yJDcemkj+COMxzO/M5iqsSnuA==
X-Received: by 2002:a05:6000:402a:b0:3a5:2208:41e3 with SMTP id ffacd0b85a97d-3a572398dcfmr2312574f8f.4.1749890261594;
        Sat, 14 Jun 2025 01:37:41 -0700 (PDT)
Received: from masalkhi.. (pd907d170.dip0.t-ipconnect.de. [217.7.209.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a53f79sm4586328f8f.4.2025.06.14.01.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 01:37:41 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
Subject: [PATCH] i2c: core: Serialize 10-bit client instantiation with mutex
Date: Sat, 14 Jun 2025 08:37:34 +0000
Message-ID: <20250614083734.3385182-1-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a mutex to protect against race conditions when instantiating
10-bit address I2C clients. It serves the same purpose as the 7-bit
address bitmap (addrs_in_instantiation), but uses a mutex instead,
since 10-bit clients are rare and a full bitmap would unnecessarily
increase the size of struct i2c_adapter.

Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
---
 drivers/i2c/i2c-core-base.c | 8 +++++++-
 include/linux/i2c.h         | 3 +++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 2ad2b1838f0f..f5f53d378fff 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -929,6 +929,9 @@ int i2c_dev_irq_from_resources(const struct resource *resources,
 static int i2c_lock_addr(struct i2c_adapter *adap, unsigned short addr,
 			 unsigned short flags)
 {
+	if (flags & I2C_CLIENT_TEN)
+		mutex_lock(&adap->addrs_10bit_lock);
+
 	if (!(flags & I2C_CLIENT_TEN) &&
 	    test_and_set_bit(addr, adap->addrs_in_instantiation))
 		return -EBUSY;
@@ -939,7 +942,9 @@ static int i2c_lock_addr(struct i2c_adapter *adap, unsigned short addr,
 static void i2c_unlock_addr(struct i2c_adapter *adap, unsigned short addr,
 			    unsigned short flags)
 {
-	if (!(flags & I2C_CLIENT_TEN))
+	if (flags & I2C_CLIENT_TEN)
+		mutex_unlock(&adap->addrs_10bit_lock);
+	else
 		clear_bit(addr, adap->addrs_in_instantiation);
 }
 
@@ -1538,6 +1543,7 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 	adap->locked_flags = 0;
 	rt_mutex_init(&adap->bus_lock);
 	rt_mutex_init(&adap->mux_lock);
+	mutex_init(&adap->addrs_10bit_lock);
 	mutex_init(&adap->userspace_clients_lock);
 	INIT_LIST_HEAD(&adap->userspace_clients);
 
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 20fd41b51d5c..1d4d0577b5b1 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -765,6 +765,9 @@ struct i2c_adapter {
 
 	/* 7bit address space */
 	DECLARE_BITMAP(addrs_in_instantiation, 1 << 7);
+
+	/* Lock for 10bit address instantiation */
+	struct mutex addrs_10bit_lock;
 };
 #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
 
-- 
2.43.0


