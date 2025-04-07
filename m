Return-Path: <linux-i2c+bounces-10127-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD64A7D56C
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 09:20:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD501173C0E
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 07:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36742228CAD;
	Mon,  7 Apr 2025 07:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SXahJSac"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E922288FE
	for <linux-i2c@vger.kernel.org>; Mon,  7 Apr 2025 07:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010240; cv=none; b=Msj9SFfaEqOVWOBBFwO7h8wdPnQb20nlBjn1Qrz6sskpmNslflLmrInMCTDb/pZRXi/RAkmaH7Q73lo7QbZPDNkMQ2/OUlJoIMy08J7qDKL448yB6h67Kx3csOIzcKJWTsEPDlAZ29NJ62b2aHUIor0awcubbpOnO+jMomxoY+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010240; c=relaxed/simple;
	bh=1O8lqW8cS1dNqbfy6OMrbFG9L0GlTpQ+kAMyz+Y1LR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ocOI+sOeSCozxixxdyilXSPt8qMVO9YD7/OwD9UF8Kq4KZfvrZm6D/Z73oyVVPYaOAV1hwAUbznUqumfYZXXJPbUp2Aumxf7Q42NcU+4v8ZCdMjfBWP+z9VFjAC67Uv26BhBhpCMub5C55RnbwKXcC1BxUUSDp01lQMb/L6rPxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SXahJSac; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so32529045e9.1
        for <linux-i2c@vger.kernel.org>; Mon, 07 Apr 2025 00:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010235; x=1744615035; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fJ5k9V1gZZBaoixqt8Dqhche1ximAkFV+Q8ydYzr4lM=;
        b=SXahJSacAdCF0QL1Y7mi05opQvJLK1XNfktIWE0ClizuYk9wH0VmlJ8OZkTQDmu617
         MKuD5iHlullw7amlsouTK52DaeDQGboS/vlnhKFkx5AehWGTmf3w2dCJ6JXBGiuQVI+u
         o9fwjSJOS8bpQa6ne+VY4BZYlhK/9QnxwsyQZmWmFGgm0qZCdgCozg+0aBwsZ3z6SIax
         /PlSI94TfRW5K2fTlJ5TYZQY983VxeoeXHkYVA22crYcF/fWhs5Mj1a7Rga75jrVcglB
         eU8jvilnr5uIRVp6ob6YCwTvaRtcJZ+sAjQU+zcfVf0SL4k19kjM5sa2CiVPFpSMJG0a
         +B0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010235; x=1744615035;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJ5k9V1gZZBaoixqt8Dqhche1ximAkFV+Q8ydYzr4lM=;
        b=tPgmMmAG8mAHEOcH+ASVD51otLcVZvUZc4UFoAGwOZLcBJoQnNwCW2/a0/al/fQTAK
         0dlyS3QSoKEK8CwgWVNVlJoAvLoK6z1dL9WYDc4Wk3zN32OKGVD3mBa05Z4XuZL5ixvv
         XarlZDEYulW78U7hrxAKERgSyPAYyFSHi+Wym4Z179tMjBQQkGXbhiVriO/Xxq4SH8z2
         5Jar93zNZh/GK+iF3RA8jNx6RcE6U6mqTmWqFLuww0h7kbM1hPhe4JHAto+p6zvG8z8t
         NPpuDO1azA51dwizMjQ9uawaRpXRg2rDOkJDXGsQcmoD82gROfc8Jdl2sj3B1yYxhE3j
         6bGw==
X-Gm-Message-State: AOJu0YxTRpW4kGGQELml1gzLDSlIJ/fVhUs3b10LHGMpjIQpX+bfnoTQ
	pqw0HN6cASRhIv1RaMoOWay6pZ7kxfGSZdMply9OjfM0n8MJbYdXpmrLZR14c7g=
X-Gm-Gg: ASbGnctifDfJmN/D35cI4AUSXSHsjLRbcGJJ3sPvezBkFfdzn+Ivd6r19osJ9K+w/5E
	ZPPBYJTdhV1Gk4+/ArdSe4Pa2Y0Pi3JFU1bB0mLP7Wb3aUWx6+ndOeB+4LZP19D/kYNFUxGAEr4
	vu85hjiR3jp6Iz+silvm4gxf8984mIOjdRhZ8KwV7a6/q069/LLJVnO6M2hNSrsJEQihMePVCvc
	XqD7cmJLwUL+dOnI41OCvJwzWPGDlmCEwDvA4Efof0a3bmFsWrz457JDhWhjy1eCAxnMEFK1VFo
	JyIRFkocAWqSaIr7gz73SjoMkc/WAKRAv8pZCGhO8gjijDT0
X-Google-Smtp-Source: AGHT+IEpoa/PZ2AejlY650G8XiTE+W12xCG7yD0eGrhUNC7DsoqDYf34mekXbyvr4lJDgzHkjgQCZw==
X-Received: by 2002:a05:6000:4211:b0:391:2a79:a110 with SMTP id ffacd0b85a97d-39cba967942mr8565795f8f.29.1744010235273;
        Mon, 07 Apr 2025 00:17:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096ed7sm10922620f8f.8.2025.04.07.00.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:17:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:17:14 +0200
Subject: [PATCH] i2c: mux: ltc4306: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-i2c-mux-v1-1-7330a0f4df1a@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPl782cC/x3MPQqAMAxA4atIZgNp/cWriIPEqBnU0moRxLtbH
 L/hvQeCeJUAXfaAl6hBjz3B5BnwOu6LoE7JYMlWVBQGF6cHr+owyIk+olrG7bpxpJpa07BhKiH
 Vzsus93/uh/f9ANmrOb5pAAAA
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Peter Rosin <peda@axentia.se>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1998;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=HUva6KxkFsPb6XhDalpn8pFG6qq9F7QxSjA+2auuqw0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83v6pQEaPrRb+WyfidLqHn+m4WTU6ulxgomxY
 LWL9BPGC1WJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N7+gAKCRARpy6gFHHX
 cgVHD/9TVSPUw0US9f5r+ibdGFf5bnBluIH6R0yTN83DJJx/xGcBBT34JhNgD//8U2QvVoWREFE
 TIfsKr/XgPxjgylbOtA1AS12IQC6aG20ipMfo2ILXFw7cn05vM7xwI0ANyqkYLyth3wd1dnHqOV
 tEYFHwJqrpgjgkb0mzaQdtDCe3OepC2dL2zPcNgJzto/3CXdZNZAIAB+C/P/8odckguo2I1jqKZ
 t9cdVEIHgUHnrU648QNijPK7IFS96QUVRwR9E40PXVXlRTgpnvBhpcTt5LhMh38LDs8M3qCTcvo
 L4rPCJLzTVnpEOXNOtKZxqpZ7olnqlWL8J7K3xxOFzOgDX5s69eqj+oToGAgawq0Hu/ClR5n3Zo
 QYWujeEt9Dge1iX5BDOfveBas/dKjLtUJO3Tq2QGre+H068fGZSLsQsCpCRv5FNOIL011ZUF1bE
 lniRd8Xp8TjwAeMqZK8kbPVFb+VAs/f6E26GWpY+eDdf/DnhQ1LvuXdRT/F/zxQSGJ69rUBSzBs
 NVAQRN52mIsmxCBC17aawjIMxsM/aW+fpnnEMIuEvZrg8p5I0KmabYnY29i5i0bIR3HtdXv++51
 H9lm46t+g4pPvMYWHb7dEkYiXlCLkFALjoJZfGrdF5GzZuWf3u12pgUQJAyiJugH3AkYkUiJ5Dd
 DNhdPNUw0eZejdw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Peter: I know you've not been very active recently. If you prefer to
just Ack it and let me take it through the GPIO tree, please do.
---
 drivers/i2c/muxes/i2c-mux-ltc4306.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-ltc4306.c b/drivers/i2c/muxes/i2c-mux-ltc4306.c
index 8a87f19bf5d5..c688af270a11 100644
--- a/drivers/i2c/muxes/i2c-mux-ltc4306.c
+++ b/drivers/i2c/muxes/i2c-mux-ltc4306.c
@@ -85,13 +85,13 @@ static int ltc4306_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(val & BIT(1 - offset));
 }
 
-static void ltc4306_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			     int value)
+static int ltc4306_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
 	struct ltc4306 *data = gpiochip_get_data(chip);
 
-	regmap_update_bits(data->regmap, LTC_REG_CONFIG, BIT(5 - offset),
-			   value ? BIT(5 - offset) : 0);
+	return regmap_update_bits(data->regmap, LTC_REG_CONFIG,
+				  BIT(5 - offset), value ? BIT(5 - offset) : 0);
 }
 
 static int ltc4306_gpio_get_direction(struct gpio_chip *chip,
@@ -164,7 +164,7 @@ static int ltc4306_gpio_init(struct ltc4306 *data)
 	data->gpiochip.direction_input = ltc4306_gpio_direction_input;
 	data->gpiochip.direction_output = ltc4306_gpio_direction_output;
 	data->gpiochip.get = ltc4306_gpio_get;
-	data->gpiochip.set = ltc4306_gpio_set;
+	data->gpiochip.set_rv = ltc4306_gpio_set;
 	data->gpiochip.set_config = ltc4306_gpio_set_config;
 	data->gpiochip.owner = THIS_MODULE;
 

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250331-gpiochip-set-rv-i2c-mux-a060817c1c04

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


