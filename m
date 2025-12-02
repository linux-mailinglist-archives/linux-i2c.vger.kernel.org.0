Return-Path: <linux-i2c+bounces-14359-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F829C9A9FE
	for <lists+linux-i2c@lfdr.de>; Tue, 02 Dec 2025 09:12:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ECD714E49A3
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Dec 2025 08:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC2423064A5;
	Tue,  2 Dec 2025 08:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2tR9mKs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D557E221FB4
	for <linux-i2c@vger.kernel.org>; Tue,  2 Dec 2025 08:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764663073; cv=none; b=qKlAtjpY7ecvyEUo+K4FklONPFYAzj8lZpi/nQe9SMzP7t+FuR3e6SbZgWeuZqb36y/feySrJ4i/FPtHvUq+xdYZrAtcwNJF2CjG78R5k3lkgVINgH6JfeuAsFsDSYaCqr2LuTLwEUUrCOdaUDjvnQHCHdtSQ+NSb2EcnfLQ1yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764663073; c=relaxed/simple;
	bh=Nc5M9Z8FNun2aD78Xc5NFxJfLrb5FZRGRBm8Kv/u2lM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kUgxyjkrJUSRgbfnRa7yN6h1W3qI4Cn3q53mK29Pxkb/FzWoLPLP9ceCMSr4IFV3brOe5/7Qq3YeNgXJAYeIIqHkKf3SbimfZpz+dljEqRLxCtO/3Ixk1U5qA87wLQYshSS64gh+Ga0juln28mpexlq7960kf7hHpJf1xGgqe0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2tR9mKs; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59578e38613so3945644e87.2
        for <linux-i2c@vger.kernel.org>; Tue, 02 Dec 2025 00:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764663069; x=1765267869; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hjv89plBIlsGmTTvLKA+ZN//B9WD1brqNLmFgcY68x8=;
        b=e2tR9mKsSb3foVun4gGi2NWsDtprehBo1pCozywJCR4YRlYCpcuuPnbKs5dm6/plfm
         Wi/EugFyazTqwMgmcSLpdgRNCgqD0tqmSZIkU/bISq/aliaXUL+FZubGSbOLMCrvXmda
         416M6B+9v5twQSjo8VNgxIniUbyDNfSIYhcyRnHz2ikxX6bNFwpTVrGGH8F6R7oEnoEY
         pWNZlVy987/MakkMcGyP5vssYBUS+/c2IGOs2na3Qx4cpwyibElZd8cXnZ7jU6gBqL5p
         LmCpEx1kyRKJksshQCcVursoX0xiPvz3fwF44HcLetsHtN3IqX7eZh9BiSC/GXuWjtXD
         TIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764663069; x=1765267869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hjv89plBIlsGmTTvLKA+ZN//B9WD1brqNLmFgcY68x8=;
        b=fRY8xIwA4G9VXABP4XsuzJIK+slDLJScHQPzEpl3P42jdCfXg946GMEBZ22HlYj6St
         yB5ihIBYU1AEnWkS98gWcGEUi5lRNPh/S6s2RcXdhmUAF/d6608LuS4CNfSyTu0p1aaX
         F3HRYbml7vR3ocBmNYfZchY7KUUjcMNoJZ7xsSwPcn3czYJtS9iz7QfAC7ZjTufP/THX
         xuKwqbck3Xu6oEYjLdUiJjQgeYVEqhXO5vPRTcjyPufvspqj6BTw/zlAAsR5zg+IFf4t
         7aLb7CE/PryZZq3zUEdjEmIycqGVPdlqYXfdEwI+RualzuAMX4vPJzUr48GceEZ2vduZ
         1HZw==
X-Gm-Message-State: AOJu0Yygj57CoTzSNyh1NipATCOJpIYyhhJg2UuoIUtJK9N7kVRXvcRx
	93i3RiNbSiqS2d/o+2A7v+1cPgtd5ON87DdQyoDCjQImM5BjiM9BIeBv
X-Gm-Gg: ASbGncssjRV3EzILX8jLs+37RLxUkk8Lbcxvc3V9oa73tLbBlj+tqYGrQs7DAHd54cV
	HWpht2wbKJp9gV7oFEr3gViWfoLe2BU7RO/Y9TEM4xYG0SkseFtdXILnixjZhlvnhZklgweIjuj
	ZSMETwcYa54flwmhJhdlIE6bCHxrjwWNEkQV+YDAgNGG9KLxxiMQaV6WtkgcDcUwhADE1JDYwrx
	MxQ8tlifWNxUs3LrRmjDwTibIdrwRVUZoQGSxRZJVXMPcPJhzFfj2NBRgegaqjU3P+9oCahrFXB
	53UToXOx6sgxdncRFx7lHzJpeK60AQV/RPrg6ivzT/RclOSW9/FK6pnSHcSiPxxbJDXkSZ3i0bI
	ME2eRIvKMlbpD6O3gbW+IrZqi4KkPH+9S2uuWROBhOtcRTyST24YNMh7G7oF5msCuElBC/IlyJk
	mrX5NqjBPfPhq8kxAGJKt0wE1u21vjmBLCnep4WhT+a7YGGVociRLkPZP6YhwZcYyJV1A=
X-Google-Smtp-Source: AGHT+IE1iJj7SbJwoQiYcFUkDL5bk6OUrmSnL1kBvIgwjRcUBEEuS/lPd1BXU/0MQqrPwB2wqvR9Vg==
X-Received: by 2002:a05:6512:3e1b:b0:594:25e6:8a61 with SMTP id 2adb3069b0e04-596b4e58cd7mr9910048e87.16.1764663068727;
        Tue, 02 Dec 2025 00:11:08 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa4f8a2sm4342412e87.88.2025.12.02.00.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 00:11:07 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 02 Dec 2025 09:09:48 +0100
Subject: [PATCH RESEND v3 1/5] i2c: core: add callback to change bus
 frequency
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-i2c-mux-v3-1-877dcf478a9f@gmail.com>
References: <20251202-i2c-mux-v3-0-877dcf478a9f@gmail.com>
In-Reply-To: <20251202-i2c-mux-v3-0-877dcf478a9f@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1616;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=Nc5M9Z8FNun2aD78Xc5NFxJfLrb5FZRGRBm8Kv/u2lM=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpLp8BuoM+ud571wc8WeRvvqmjI7EUERjmmX1g/
 2H3AuZw3zOJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaS6fAQAKCRCIgE5vWV1S
 MrdHEACMzdOg6XFCeOjNi/bb7yWReiTy65HGhwvQgttKUfXWESp20pbKKcalCYnCq1wkYhfE/SW
 BrPuXoltmEYqeSCWcQ566RR2Zhfvi7/EA8234WwAkPyjRs5IxYr521xbt1iQuKo4q9+jv4ANBnR
 0dxWN4jmjdSdEtoH/aDkTec9/SuHZV3rZJbXdep3p7LFZ45Zj0vklwC87WUPfFNTjlC6B+islG8
 pM92OG5ld0on7Bc7tcSbFx0hSsFK+aRLPJ6Gw3XLNNVvQ0I91/TVJVBMn9rwbW+gkFLB9dVTBYz
 lY5kR4bZVTqxsOCDhqnYWSKxp52lZHbv+wYJDXhtwQTIcvkL4q0eBcB0UVU+QBAZopZbyYfbZaA
 YsffxVwpsKKZr45SRziL9Y7Kun5JiFHLM+GT7rBBvYep4fOikfw0PZ9am70zczzkRwAB/EvRzS8
 IywYCdkGDl8Yzxq3SWWcBK+aVs0HpL8+Zp7CHa9Tr5hXVPK3FgqL1CKBaQI3Rn0bkHcvTJj+TDR
 5q8DNHeh64aOmCGGoo7NhD6k3SYsTg91V5NUm5+UxVyyPqVF79DfHtbfpYvNObQSlYEacz3yyX5
 0U98NyxEQtdw0a9o9kpoUr7DIFBxoawrYo/8E8aPG0jMCCf72Pl8mpzDEOzctRiGP81bTYQkMFw
 eiDjGlwptz58ttQ==
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
index 20fd41b51d5c..d147e388dbab 100644
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
2.51.2


