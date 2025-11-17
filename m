Return-Path: <linux-i2c+bounces-14107-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B738C630C5
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 10:08:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3EA81364549
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 09:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C67793271F9;
	Mon, 17 Nov 2025 09:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ux+j8YHz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A89324B35
	for <linux-i2c@vger.kernel.org>; Mon, 17 Nov 2025 09:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763370339; cv=none; b=hab5fxqKSuSa5vPb1awoHxFFlLGzILCpJGdzZp0wTKcBuF9l3H6RDgfFfhiIB+WxQA9iugFKZhKZ6FYWBgmuJ8D5F4cj3EDyopv7u2WiEqDM3SLc1mWf4CvjHGfVRWGbxB6kiItu+GMWFUl7OuHylqlvCszA0x3r+VF9u3TaM3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763370339; c=relaxed/simple;
	bh=Nc5M9Z8FNun2aD78Xc5NFxJfLrb5FZRGRBm8Kv/u2lM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N1GWBE2/Jq8oQWkYSYaW04UfmHSzmCXSvrs6SIBGkU9e/FkM8qHEyZ6raF09xkvsbB1Zmav3A2zcUgLzzvA/riMdCDrb/ljiwOr5P99uwMzjeljA5h9Ua/QZAEHvfZKnEaHXwMVmzisWExXYK0XnMg+Ut3zPPJTxvMzm9/DohaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ux+j8YHz; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-37b495ce059so34599591fa.0
        for <linux-i2c@vger.kernel.org>; Mon, 17 Nov 2025 01:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763370336; x=1763975136; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hjv89plBIlsGmTTvLKA+ZN//B9WD1brqNLmFgcY68x8=;
        b=Ux+j8YHzyJDM6db1w48uO1tzXNbA38BGll2L6TnWNbH5Oh0JF4zbRluHXJEgiQWMkk
         ive3pUQ7AStGXVqEE3G2Z/Nw3uO5APbRlspofxImblbZCT8AOWEda32GpGxO+JOZcNb2
         ZiQS6GnAWlYuxF+l71xQWIWy4KWQArNWYJ9DmAwwz8L4oabnubckK7XTm7F6KojBtAnH
         3/3E65vC7A+1DNKkny74+qwFgD2JjFM5QL/MAq3lU5dKzMGjYw0aSWnMbekcZLLsLQJS
         HEO6542Ys4TX7F3fNcV8TvrToL/kXhlQRiq35nTZXAU7kZ2y8ENLe+4Zmnv3ShAtlTc5
         HeLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763370336; x=1763975136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hjv89plBIlsGmTTvLKA+ZN//B9WD1brqNLmFgcY68x8=;
        b=N7iQJuLD3tozMQSa/6ZLAOeamqVAGDSIn7pucGO069HtnkntNli2AfK61HWXlbSBTu
         gwyBbb+bSO0MADyB7cTYcAmf0xr6QmL1jJmbO3XT4eR7lWiKijp59liFVVMZlEM3mL5M
         KDTs04+FJSBr7kPcWreFPYd9KnrEcJYdOYyr+itEub+Zkpzlj2NzBJP5wOYtVQDghqjE
         i9Y36y97KlOv0foCp/tJA0ZRkEtU55M+egLXV0C64DvsuIo15QC49K6mE+j/eQ9KrXGe
         RVuhkNekbnB7HrJEpIcyZuL9f2rvoZ4ln9n4OIjgHesQRA6GP7bNT75WslSpoLi8Y2Hy
         NLOA==
X-Gm-Message-State: AOJu0YxNlCLsJtOuvf8NR6IMcezcJ8IC4LPpQCKhzCz7snDbZrw7ngLe
	5z9COxhn1XAza/irGjiO91rQs4bx9IMs9xJqjiJe/Cxk/yHVNDVnGtTuCMByASbl
X-Gm-Gg: ASbGncs/EL5M3S1h6q0uu0OXbHA0E4LCYcQQMIqd/Gl5e0a+p7kOcK5a5Tql6Y6ZPFZ
	HxfPEDovMOU5VRHqJopEh3fQ5k3poN+4GIMVbR6eKKstgQ1b1GMJm0Qw9wJiHzuydaBIRNI64sO
	8+dD2pNZPBVcHPNmsnQ+tVWdgWdTajKGaOTpNkH8rU7u4IyOoy1BwmbBuof93acSie2ieGBzwq6
	pGG7LZkbcucfht+bP7B6wwXOZ1i2c2LchAvicg7iLVyyR6bONDS4DSuZVcYEImeaWjxQauGh81N
	duCoyGv8RIGZqu7fS7z0NS4mMHWLoWhffyfAzUUxtLXBjHK+xFxBXlroBPe+Ljt0ztolyq0FHBj
	8u9QO26abiCuFf8j4c8YNS5HMBn0QpCnrKmQA61ufZZE5PCKGv9ZWhAWw+SbVNTW4XeZNjTtS3b
	mRIYN8rngCJF6vfYHb6txBAwH3PK8ac7jmL7SsPmiETPOtrg==
X-Google-Smtp-Source: AGHT+IE1CtPf1rDZdOPLypfOYFlt46lPsgZtKbCXbF1dxdxjZCZ14KCSOG9O7CUC2DPpuH+w99ZeEg==
X-Received: by 2002:ac2:4c49:0:b0:594:3399:985 with SMTP id 2adb3069b0e04-5958427b020mr3894196e87.52.1763370335743;
        Mon, 17 Nov 2025 01:05:35 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59580405693sm3023727e87.76.2025.11.17.01.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:05:34 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 17 Nov 2025 10:04:58 +0100
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
Message-Id: <20251117-i2c-mux-v3-1-696c83e3505a@gmail.com>
References: <20251117-i2c-mux-v3-0-696c83e3505a@gmail.com>
In-Reply-To: <20251117-i2c-mux-v3-0-696c83e3505a@gmail.com>
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
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpGuVFrW23F6KDDqm3v1Ilac9N1yPAMHUpHzQM0
 bbw8To85+iJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaRrlRQAKCRCIgE5vWV1S
 MrbnEACu/uxioQ6+TkrlS0EEn6+1px/r0vxSiOUMk2P8U+bxuX0sy6xRUyZTXym8cJUtk7NqRL1
 mvkGwQdlirRlO0+kQOozvcp8J88K0Eb5YPK20KspKYKDtQ3XOCEjrWDpZnS9U1tQ/X5q9AlrUcC
 d7irlNXTX/HY6Yr0C+G54T7qRHXMaw0nWYnHU3H/OcBaMw9M5es93OkfA2pg2qXqcQmkZAnpeHJ
 673FvgvLyW5TYPwhZwSqoRD07LEuY8tlzx7SbpPOYrNKMZEypfXS4DP210kQRnJTLdujSBgL1u5
 /GcJY8tAgpZw5IGeK86T8qAnKIp7vrtJszeAhgU5K3J9+1yTvHLiomo/ElgzsvmYzddW6FGog9U
 ia9nweqeh7mhNBcF8ANXkZxUNkZTTaFymE8eh0lzHcbFswymyI3BqxsxzvCH3o/0N3yEbZPpjOy
 slLFscuJAmraVQy20Pb4g9OAjvrkH/ysz/9i88SzG4tz4u/fez6tYbtWi4BygMIuB228kCJxsii
 ZlpluCYXr6ln8KRFCCFuobI05WoNZMnmKRVYSz0n8UGHC2rmHTjacs7+ur7y42sCxU8SXW1DJXN
 2lHRK2ZCZxJkMn38xdhvkm1inavo3p5QDGJduk1Vij+6TuL7BKPo3GlR2P7nmuBtxMg0UhunrhK
 mZusgymXusIdCeQ==
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


