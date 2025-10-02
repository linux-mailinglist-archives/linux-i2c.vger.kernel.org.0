Return-Path: <linux-i2c+bounces-13356-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEFFBB431F
	for <lists+linux-i2c@lfdr.de>; Thu, 02 Oct 2025 16:42:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CD1B19E2E9B
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Oct 2025 14:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF407312828;
	Thu,  2 Oct 2025 14:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kve5uZs5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056DB30FC1C
	for <linux-i2c@vger.kernel.org>; Thu,  2 Oct 2025 14:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759416136; cv=none; b=OgxSXKBDEOHmqMqEvXCBjyIvFfw+AEJaaeMGbCyShNW+Bvp0sUo7Ls0Rh2CrgsT+bXDI04smz2T6lP3QssJsrwayK5MW+hNWtYhBeY8fFS63DF/83fxYL2YRg6KG/n0W5F9Ed6nJ1s4Jwx92WzKVs8TiGKdskVqBkrlT8xJi/Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759416136; c=relaxed/simple;
	bh=5vuOIHtLq7CFaEidcZicx94qxk7qZlaIZNjnBzwUQCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pbYyeX+S2dkZEj3yV8X2l0udUKLwPaNnU8uyrZpXA4sx8MENuQ5bu1EQEoxTr9oZwO+gmt+dg2afO4xPTyhVUbGCMQ+nQkNoh4g+riny1TLqZnIw7yEYaRJPyaJg4AO14BFTCFLjiqBUGtQ4ZW8pSZI+KTeaxMD1HBCUOSwDQFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kve5uZs5; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-57d8ff3944dso1298367e87.3
        for <linux-i2c@vger.kernel.org>; Thu, 02 Oct 2025 07:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759416133; x=1760020933; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lFWIsHcR+hD5XAKLrrYCj9xMsNWxUYwTXzF4H7urqUQ=;
        b=Kve5uZs5z6a1JTW3lT3z0CBheOJeScInJhedo3+QVc1M/9bidZGzfMHWM4zSDusEzg
         9Ww4d7CN1ODlEhyEGJ2v+3JexEJRuq4ZxcbtRc9MwSNnM5FIeCWq5FJn5bSUppOSaJx5
         F3OCWpnP7Kgs7yCEGBtr0jTjtv57dhzZjF6YscKdy8qRhORci377k8uq2f9+yA2iMTMH
         Z8PlH6KUfaf77Nwd2bxd6nerW7QtzfbkCPFVFw2v8nEBApsKEqdoOUG2oXU1tzRKWob2
         FJfv8tNDw72v78L233z2R/tRW93XHQ7s+2bsS38yELvdrtz3+SipIyj+Mt3YfGcQm26z
         wkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759416133; x=1760020933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lFWIsHcR+hD5XAKLrrYCj9xMsNWxUYwTXzF4H7urqUQ=;
        b=t+3QBqqPlFBWTzTmV/KxBcIWWjBWU8CyoZXNRP7U3wi8oLJaW2J60qW5qaBEUYwyWZ
         NzcIIBVGB43Mi8pBVLNojXjMAvY5mRH00Y2KTmqfX5GojWbYotpWaep1JPaheU5v9dwZ
         RNf5pG3WWJ7NQyW+DTk7EuJtj9H2M89qOwvW+IjnHg654Hgji/CaweSrPjWCKYsJWsLM
         uT+5jGIoZwfcxFJOQ3PNhCvE8/p9fwPHYAS6bLk7Po+c+U+0MYv7zWu3tJ8oFJj39mOL
         z+BMQbFdirofFJcmwa8Ot8teMQtHfmD1AJcnp4txcohhNVZFiFK0XbRo0cTQXkrRXo8a
         wzPg==
X-Gm-Message-State: AOJu0YzvQ5Dx2n/j+n38xcYWc6+pDRhLtVilLzCpwgl9F603z7/VoJO1
	qZ4nqZYqF4gcAWTyqNieBc1YzC4+h24L7QP9JWWH44uzI8kXc3bqw3lC3n0RLxpRO/M=
X-Gm-Gg: ASbGncsdiOcMjhTnovdPKsxNiSVqe2nhgccY+YyfqPuhU2Rmf/6mNKrmaoA9dwP3F54
	j9I5uoBo6Dp/Htwt9N8zanOIM9hbmGagh+cZSdMpkB9PTnMlYp3gqU7wvgD8f+rH4AptHaZRHoQ
	8r/tCtyxLD4B9n00SVZnswnEwF4sxHuBj6r6pnNTAcfFC66+TldjeM9eGvUse6JhXCDNXiXSWwJ
	mhXA8mT/LGo0X89IOHfz3kYQWDFpxP5QISP2De2eyjLdI5ZZ5RE7Lj3aWeN5iWOItDGYblp1AX8
	7Xku+YSYL9S4E1oK1NRKdvGm2mq9I6A7P1ecCi8smlgiXMFKo3FJwjq3M+2GUKGKiPla0/LZKbD
	8pvMMLJNPDu4Nc8F2jn0GTliLQGCyn7624U6ZpSG5YT1jzY7ja4eE6bhcoqI7sSIk5+FaePOwmI
	aSxHe1w3mNQiU1sIw=
X-Google-Smtp-Source: AGHT+IERyyKNqaNT87ECbJ5igCLeF2vmtOluPcZeTEexFXRyoqikIqVU1Kihwsqb6e06ppVs/cqtPA==
X-Received: by 2002:ac2:5144:0:b0:57c:2474:3743 with SMTP id 2adb3069b0e04-58af9f3fbdbmr1909198e87.32.1759416132486;
        Thu, 02 Oct 2025 07:42:12 -0700 (PDT)
Received: from [192.168.1.166] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0119e60fsm884712e87.94.2025.10.02.07.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 07:42:11 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 02 Oct 2025 16:41:32 +0200
Subject: [PATCH v2 1/5] i2c: core: add callback to change bus frequency
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-i2c-mux-v2-1-b698564cd956@gmail.com>
References: <20251002-i2c-mux-v2-0-b698564cd956@gmail.com>
In-Reply-To: <20251002-i2c-mux-v2-0-b698564cd956@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1672;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=5vuOIHtLq7CFaEidcZicx94qxk7qZlaIZNjnBzwUQCQ=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo3o8oVrt5yyWpCE40+l9t5c9Od5JLxFteQjmrX
 kRLdZyjpHiJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaN6PKAAKCRCIgE5vWV1S
 MoukD/9SOOM6WikhU2lmPNMj4+dJCYO99J4XPsNEowIK8TxfnGgdELVbwsZNKv9adrAE4yB14I9
 +Jr4kyZBfn5rd73hUyjEkLRSwJkH7cd9XvT4Wl3Sn2bcBpHZn2K8TVmnnsB4sPm9el6yyXrp3nT
 wu5BVfPzO20IEb/T5H+04MUiO7xP5FzOuNGH+HEK1/Yh/D2ob4rXLTrumyE27fykyH1kflc3LeZ
 Ow8SA8JZNH5eIGFynPvqUn7zkgGhO+xcTz31ZEkdfOQGRRQxujw7A48ETiSYd6wEVbfxFYY+ux+
 qPGO2w6Q0TsrVgZS7DsRVKnCH+axdzBeQe+/uytOA5xwNVxykQwgwQifLDIdmWZGQWrlnN2Ha16
 CJfzHEuhp7UO7xPfEJLbwdrHgsu038kstxWa/aBvc1EDpLVUR97Q+SkiZRDlNZZdFjBb1+UxYYb
 4USWj4ouQdYRoqsOUGcO/IwhbwFBFhLP9EN1mS7GogUthsn+9BQJoIHMHNQp0pLO+DrTGo1reQs
 lgC6+EIakcViy6S6j+dkBadSx5A5uNUl1L6B9Vny1OI20er6Zokk1K7ydsoy3rJ7VvV435wjWq1
 EtrScWdMBQxLhCIFXh1EM6Fc8InxDkULWWtcOLtWM49qrkeuClh0fjBorrkvDzcKJV6cd48TeGk
 vngX1nqXomPLx+g==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

All devices on the same I2C bus share the same clock line and the bus
frequency has therefor be chosen so that all attached devices are able
to tolarate that clock rate. IOW, the bus speed must be set for the
slowest attached device.

With I2C multiplexers/switches on the other hand, it would be possible
to have different "domains" that runs with different speeds.

Prepare for such a feature by provide an optional callback function to
change bus frequency.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 include/linux/i2c.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 20fd41b51d5c85ee1665395c07345faafd8e2fca..d147e388dbab27966beb4dfbf869928b429e082c 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -742,6 +742,8 @@ struct i2c_adapter {
 	struct rt_mutex mux_lock;
 
 	int timeout;			/* in jiffies */
+	int clock_hz;
+	int (*set_clk_freq)(struct i2c_adapter *adap, u32 clock_hz); /* Optional */
 	int retries;
 	struct device dev;		/* the adapter device */
 	unsigned long locked_flags;	/* owned by the I2C core */
@@ -835,6 +837,17 @@ i2c_unlock_bus(struct i2c_adapter *adapter, unsigned int flags)
 	adapter->lock_ops->unlock_bus(adapter, flags);
 }
 
+static inline int
+i2c_adapter_set_clk_freq(struct i2c_adapter *adapter, u32 clock_hz)
+{
+	int ret = -EOPNOTSUPP;
+
+	if (adapter->set_clk_freq)
+		ret = adapter->set_clk_freq(adapter, clock_hz);
+
+	return ret;
+}
+
 /**
  * i2c_mark_adapter_suspended - Report suspended state of the adapter to the core
  * @adap: Adapter to mark as suspended

-- 
2.50.1


