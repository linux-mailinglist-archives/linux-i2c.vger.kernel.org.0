Return-Path: <linux-i2c+bounces-10580-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 706C2A98479
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Apr 2025 10:58:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD22A7AECFD
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Apr 2025 08:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0BA322F740;
	Wed, 23 Apr 2025 08:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="N3Zzl0XY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BB722F74D
	for <linux-i2c@vger.kernel.org>; Wed, 23 Apr 2025 08:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745398557; cv=none; b=nPjG4FWfWzXHMxXgFeYI/AO3zACfNlTIvgOs64puFhCdWdy7O/Mr9b0/PhXI2cUz2Q/cpWdm01WSjhXZwx4FD5JBnz9wEc2Klxytk14EkdcszWEYvUh/n6g+FtvY+gAJonrGN2JRlTCVOhrHgE4XS2aMSZjJzkigLkW2Q6xz0Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745398557; c=relaxed/simple;
	bh=Gu/0qJDe/6CF3S+aMzTZR6rxmUbFtqhRKTSk7r76mcM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ubFdiU1e0SmPxVx4CQ7flAZlcKRP9TQ+T3IOwYDSjFi4/0cDEeBDynqPpT+ZG46IQofoGJ8VWYb4i4X3Bds+MfVuZLh/zTXj9ECvJj8AxYMHBjPgHtuwQbVVcf0DYMl70GxXJpv6sx8dzlx6Wm6oVV3ZdjFHlcCKdm7EuDL8Lco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=N3Zzl0XY; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfe574976so45400785e9.1
        for <linux-i2c@vger.kernel.org>; Wed, 23 Apr 2025 01:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745398554; x=1746003354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ccxqgGOTjGbrDoOEv7tkVOvhfhH/R12HzGiWH67Hg20=;
        b=N3Zzl0XYCwA5c2V0LHjxQP6WwN2xX1k73W1bQ/XhiLp5mRgeyuIlPg1ZYHkvV2aCUA
         vNyVsaSDDzlsX97p+WFi8xm2WADcxg8H5UHkD7qI8DIJ/+Vm2X/m+DVcply9Nxq5XUne
         bDJtFEZl5FGMNhQanD6c0pdV6gsGY9xN27LnnKAhzui+W5gBIA9HjIcKIdnGPt6uqK0o
         F121ZpmaX6XPAjhWwwxTGJsTApAwyFRYCaL2+w9z7MYm7rBByyX+d+t0ztTOQdMQ4jI8
         Zu7aDWXGZJyJ7woTjlrh/K6W4PnmuUZQepCiD4luK0K9nZZ4sPz/Tgxw9OfMyu1uo9GL
         UXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745398554; x=1746003354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ccxqgGOTjGbrDoOEv7tkVOvhfhH/R12HzGiWH67Hg20=;
        b=KcA/EYxJFgQGaTYM7RuRcUR6n1MXKpO+i1RujHuwi7MuurWLDdWwoGouTE44HSwVY6
         4RJsJV9rvEQyewa/g43wWXvswr37dkiuMCoeRUOemVT8TjfcXkL2MU2wtg2Xfft5Dghp
         DJVgtqdJylYBgW0G3Zn9bdIbNURljFpZufu8H5bcTxkQHihcdJ7ogeiyCdC8Rf2d/qr5
         7jX0sVpmrH/qgJ0tBZB2chGAYXI2k9uTdQY0cIH/LivkNhhsVrpLtg9KY2KsraJ2F61B
         dl/P+vTrvYGK58WS8w8YKklmx+/WnlPxggkaXW+RUf1nj3rwwIPxCcd/Eiue1vIp6Ihr
         70EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVe7yIFM8gOaxwwNfQQ7ehwfvzLrExr7/sZfRxxT7p11I/Hqs1w4VD9DAUK2mP2/j/x1zQcs3bl6I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ7TBUIj/ql2HkOh+bz/8eZKCc0e+qoBnFO1nUsxOlex1l2ryN
	TiVSZ3w9oQFz9AqIitY/NoBkQRHTLplOswT4LdI/Xc14HvgrmaHY+hV4K3JOS7c=
X-Gm-Gg: ASbGnctu55+mnxmH+tqGBmUHSM4mP1kxoGLsXKYBXtH5TBXT4sZBvL2xJPuyoKvJoRb
	NikC08bKyotYlHYKPXBV93FHQXf2/IHwVdHdeJHutRXP2qsi5c3SS2wIXzkegiglZrwtUOFf9xy
	KpY52R2RuypMFYs/yBpfc3xViylx49bVQQuqxVrmz6WKPBZF4Dez1cx5idzuLg/3THJelhpVCwx
	GTd3Lj2nclR/1M9p46qkS/5MNn0f2TUmvVllBghJch+dk0HHDudk/0HEScEylLN3u6S+AYj5lzP
	EDex1CCux1ptWGuhcjj8NuvPcWJ7dTxKqw==
X-Google-Smtp-Source: AGHT+IGYt9KIPNXopceY/Wz7BYzncJa/dJtRXyS3DNCe3z15St7GRiEUgi4k0Frpx7QsgvxF1rBmfA==
X-Received: by 2002:a05:600c:4f81:b0:43c:fa24:8721 with SMTP id 5b1f17b1804b1-4406ababec6mr187469325e9.17.1745398553910;
        Wed, 23 Apr 2025 01:55:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44092d3654dsm17731685e9.28.2025.04.23.01.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:55:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 10:55:44 +0200
Subject: [PATCH 6/6] hid: mcp2221: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-hid-v1-6-2e6762b582f6@linaro.org>
References: <20250423-gpiochip-set-rv-hid-v1-0-2e6762b582f6@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-hid-v1-0-2e6762b582f6@linaro.org>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rishi Gupta <gupt21@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1645;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=MEE5NFlP4KmtuHYj7k9R+CBXmokE3edPEZ0O5ma2pfA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCKsSH/VXonHZEwN/oJAifE3FFvtTpHXFAVsbR
 csNJghfdFKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAirEgAKCRARpy6gFHHX
 ckNNEACGFETGqtGc03ttguBEngNRxDLdl4o8bT8wLRRMmsuoZ7GwjeYdR7gJzGUuauyvr25iefQ
 WIJtXrAVJRGdo3ywRWDoAoBkcIhBzKODekM+lLb+TfrxGNihZhZc+poRmZP5NFXpbEUNbG/7rLH
 o+d6KjzKpZh5ScEUwdxphZbuy/OQCcKiIqsxL+Aw32s5oCgFmY4rbuy33ayIW0sfiOTu+r5wTHX
 ud079wGcIS3vwNbu3mSi+86C9yc8OJHpk/3D5aHB9QuR8apzjwfliXcCIPAcdsUctVF3OvhbIYq
 XIpGPy3Gj8AYcg5dvQJRPCLnCS2RHjKBbCp+Iy7tnzwletOS653KSQgAd2GNZn1sQ3RYxPlRjjC
 ARpIH0Xhg5iqg6NCcMfVMrheL1rtNIZdYE5X42rtaIKNRkFTK2ieKSvQ5uVZDCnsjhdtmyiM1Iv
 WZAZQ8s3HJ7mG6nSwOxPce8mQdpuPYPCiAo0kIsQ4a1e0GRwFUdv7eZQq69eVZ6sWE+ZaddPBA5
 NBbV04I/8p2uMrWzHVYb3o1TLsOE3lXREZcQJr0GLIoIxf1Dp/JEfq+BpQ0iTBgmApdrGX8qn7M
 VKWBDRmRvogkCjJx5HfdhzECCJfcL0HQoo1IF+b4pJFVv0uR9Bgao/miwdPHi2hRs8e6E/W4IX5
 H7aKMrZNAetOhtA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/hid/hid-mcp2221.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index 0f93c22a479f..6c0ac14f11a6 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -624,10 +624,10 @@ static int mcp_gpio_get(struct gpio_chip *gc,
 	return ret;
 }
 
-static void mcp_gpio_set(struct gpio_chip *gc,
-				unsigned int offset, int value)
+static int mcp_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct mcp2221 *mcp = gpiochip_get_data(gc);
+	int ret;
 
 	memset(mcp->txbuf, 0, 18);
 	mcp->txbuf[0] = MCP2221_GPIO_SET;
@@ -638,8 +638,10 @@ static void mcp_gpio_set(struct gpio_chip *gc,
 	mcp->txbuf[mcp->gp_idx] = !!value;
 
 	mutex_lock(&mcp->lock);
-	mcp_send_data_req_status(mcp, mcp->txbuf, 18);
+	ret = mcp_send_data_req_status(mcp, mcp->txbuf, 18);
 	mutex_unlock(&mcp->lock);
+
+	return ret;
 }
 
 static int mcp_gpio_dir_set(struct mcp2221 *mcp,
@@ -1206,7 +1208,7 @@ static int mcp2221_probe(struct hid_device *hdev,
 	mcp->gc->direction_input = mcp_gpio_direction_input;
 	mcp->gc->direction_output = mcp_gpio_direction_output;
 	mcp->gc->get_direction = mcp_gpio_get_direction;
-	mcp->gc->set = mcp_gpio_set;
+	mcp->gc->set_rv = mcp_gpio_set;
 	mcp->gc->get = mcp_gpio_get;
 	mcp->gc->ngpio = MCP_NGPIO;
 	mcp->gc->base = -1;

-- 
2.45.2


