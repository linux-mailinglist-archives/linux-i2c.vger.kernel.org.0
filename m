Return-Path: <linux-i2c+bounces-3818-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 977F18FD4B7
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 20:01:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CB0E1F230AB
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 18:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6AA514EC5A;
	Wed,  5 Jun 2024 18:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pfblUWIw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E4B13D62E
	for <linux-i2c@vger.kernel.org>; Wed,  5 Jun 2024 18:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610413; cv=none; b=ZkBcDjBHW+BgpIHoP9fGSfh84scHve8UG+SQT5duPzmHF6hYXvEDJ903rmoJOapiknT9TDehk1b2bTXpnO2gptozmqOmpS49mmlgWcuIOOqRjVTEP1Fe0JwRh8eS2Pj1YCo1jpUSPx/ta6gNn+fEUZHV9xM7ijdErr1PAUkHcSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610413; c=relaxed/simple;
	bh=8DJQonJqq5Z4yQRN/sDPNHSxx9pC4pBa8VVN/l35RYU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uNxNt6YYV/beYB2nqXk2sS5Re9tuNjZ2h1k7S17Lnmp0HvSdJkmQwtu1IQf1RH3sV013EBMS92YUeu/yw+lnwD9QcB49hH6XtmOKKtO4VQmvSQUPbSarodIbrSnRxuMw37TlOluXQ9fJwtfEbmqnHdkYqIoSoWun+fnIiK5GDHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pfblUWIw; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-62a08436241so312877b3.3
        for <linux-i2c@vger.kernel.org>; Wed, 05 Jun 2024 11:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610409; x=1718215209; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fOg+UnJ80V7MsfirTppZcqaQfW4UzyZaf6xSdj4zJek=;
        b=pfblUWIw3blD8wOp8WE8gt5Jq65lZWQ22oCeXFtUbZiptDqJ6zCGgQUbQ2cMmjfzOR
         YVY9lArA0jnY76ycsaDtnO0iySMxqBGUbKPwgSWLfmMjWDRqCqa3D4FivtdXwR2W2/rA
         PSMm2ZF1GAOgMvv4+jSZpC37R0p+9VLq5xjajPi9vrxJ/OSKjc7CmguroB+GyCDanVKd
         z/R4xPxhbGR6jwsUIC1ZIlDHMi9vBxK5m72lvAMghxlet3dTv2t6Ool24D5MKrdks4LC
         Wylen1dVC4VFLkiJdOno6Gy+Tt2EIltv91lvc+7T5XSjAT91a4fUKLkQJNYRn0GggObz
         T0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610409; x=1718215209;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fOg+UnJ80V7MsfirTppZcqaQfW4UzyZaf6xSdj4zJek=;
        b=VXZCFCTJX0QedZOQfYcnnhcMVI8iQbnM5O6PUOy0sxonl7dZFtpR+jlLpdXJk9Tel0
         EA6iL9rCWmpiC91zVRlBcVnI7MIMuUqhcHAak63vid+YBZf2Hw0Y1FnFsyRevPIasUL7
         Z5VcLMn9QPnoFxLLPlN+/qAYc5R3oihCmYhAYqvzeS/x6f30t4V7Da8V8WeGtGMmvtJi
         UsfPvpf3UG1RlWl5RoyU6O7CF46mTM5yl1I5jP8kih+7t3wm8FUThUevoBSonuDGRKVA
         eVxavkxemvzfyXs9V7VV1YVavxykcYbnUgGkhju3jJHx9RFGSy/e6NE7hbMBipaUKAZu
         gBDw==
X-Forwarded-Encrypted: i=1; AJvYcCWB6N4zJISHGjr8bzGfAkTpGkzhQ4SoplKzbiYX6aeu8K+GcBWI9iyAoxtQRXvl+qoA6/cbvgt3XZ1NAPtZBMR943kt992orln2
X-Gm-Message-State: AOJu0YyZWi+J4YGW5QkgjIDn4oY+h+zIURDaX7nru+HY7RTwxqXBUDY9
	yw9HhuEXd8/rNmxvMuuVjHd3xK/M7vebIDbzhNIS0Yzjo5rt7UqCFkoDSU7iXgmkdXQSnnMRybc
	aYwO54cChxw==
X-Google-Smtp-Source: AGHT+IGVqeHwMyqXKI282yIc4vrmNhlrddNc8SUJnwKBYMg45bAMjkiEv9ztSUrQcKvlvHzhm96dBXxGRdgPkg==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:6902:b12:b0:dfa:7282:d6d4 with SMTP
 id 3f1490d57ef6-dfacac47b9amr605485276.6.1717610409394; Wed, 05 Jun 2024
 11:00:09 -0700 (PDT)
Date: Wed,  5 Jun 2024 17:59:46 +0000
In-Reply-To: <20240605175953.2613260-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605175953.2613260-3-joychakr@google.com>
Subject: [PATCH v1 02/17] media: i2c: ov2740: Change nvmem reg_read/write
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
 drivers/media/i2c/ov2740.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index c48dbcde9877..0101ab55a5ef 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1212,8 +1212,8 @@ static void ov2740_remove(struct i2c_client *client)
 	pm_runtime_disable(&client->dev);
 }
 
-static int ov2740_nvmem_read(void *priv, unsigned int off, void *val,
-			     size_t count)
+static ssize_t ov2740_nvmem_read(void *priv, unsigned int off, void *val,
+				 size_t count)
 {
 	struct nvm_data *nvm = priv;
 	struct device *dev = regmap_get_device(nvm->regmap);
@@ -1241,7 +1241,7 @@ static int ov2740_nvmem_read(void *priv, unsigned int off, void *val,
 	pm_runtime_put(dev);
 exit:
 	v4l2_subdev_unlock_state(sd_state);
-	return ret;
+	return ret < 0 ? ret : count;
 }
 
 static int ov2740_register_nvmem(struct i2c_client *client,
-- 
2.45.1.467.gbab1589fc0-goog


