Return-Path: <linux-i2c+bounces-12248-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F35B215EE
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 21:50:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 910F51A23B3B
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 19:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 880492DEA73;
	Mon, 11 Aug 2025 19:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FfHbmdWy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8A22D97A1;
	Mon, 11 Aug 2025 19:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754941813; cv=none; b=ODdHo0ZUuJqyTFPTQLueOWgnjGcXoMIax10DOJl4rMTpul6xGfeU+AK+NWvE/YR48ziOUk/mNHhNup70DiYe1hMrQkdv8QX3UHt1I8WBpy75YCEpErYqKbOAsg+5KgL3aV5f1iv/mwR0ZMTHWr1NqN5+jUOwntKF0YGisO3B/sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754941813; c=relaxed/simple;
	bh=9jBi72UGIIPP+FPDXzQtUkKAzbd0l4XF5BUIxLpWCHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FZLQitlq5i90SHfYmE9uUjT2/J83mlqOkny+XwKALxxoCAfXT9zWq3rYOVWk11bQHbZLyc5jRS4h1Fe7mDu3qhTmCvew2Vsa6P4w8hpu5oazuSWQQ/3+MDJHIDTZW9YE4NR3BPeZeTuS42BeX6T0uwwNsMoyKhIcOaUqrKV1FT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FfHbmdWy; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b7892609a5so2698966f8f.1;
        Mon, 11 Aug 2025 12:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754941810; x=1755546610; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WSipPKw7P4A06KCm7mnemasTOa9V0fPZ36VwYLVvIxg=;
        b=FfHbmdWy2qrGhVvwdicLBi0Pf5SG09ATQAp7OpgkGOS7m4D1HLsUiBpXsnVtgx+/NI
         iGQjarqK2ET3dy4gZJhBj1DGGEdWtgSspFg6CjkkPQUlLHD5JQzFyBqWDPWn7A0QmJsJ
         FDFd7mI16GB6UUrHWE+8NXn0rgbA9edV7O5gmmudtZ0h/jRt0WpMQKiEMfaEhMPntIIZ
         8f1635PfuqK6VnANK4Urw9vwnGth1spwmgpzFNkqH3XSTSE+Ke++uRqS/kcvfycMyNn9
         9bn0OorQe61NEQ8P9S2bb13AGmSOA8Lub9CU4HQ50919LMBL/PNsY8ducSrEmZlSikLI
         T5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754941810; x=1755546610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WSipPKw7P4A06KCm7mnemasTOa9V0fPZ36VwYLVvIxg=;
        b=FY+Yl5U8t4Wu3hUtKXcCPWC6O2vGA1EzRMTMZvGIzD6LdNnrFGG3PT5O9sBhNiQ5di
         /pJitNpo3ccvNRkc5+qQ57/g/l23xAeq8AtkDXZmC+cSsfu+YDYYa++GUn0R6MNBqbsY
         1PY2DsyNPASLen1aqPX48NaHp4BowyZhAOeB5fd47/C1zzSJyeauEDwxPS6Lbxw61wTA
         jxJ6CjBe83rbjVCtBkbbEoVsVc9mooVvQxz2gW0WnwQoGrYhpnuh+G2KbPaN3dfKBYdC
         RvL3tJj0quYzpzV8yji0z5/NYIdlVlnIVsWuPL5CrrfmU3f8hA7Nw2QfB73B9XignF2G
         detQ==
X-Forwarded-Encrypted: i=1; AJvYcCWazICWjEf46m8KXExMwv1kZdVEhr8Os3xfUR3nRcfMcq6eqQ9amrP3mNSo71EzOCzn8lDKwC7iEAEUNeQF@vger.kernel.org, AJvYcCXKahmbYqCPLFIVC5qHcC5EnBGzaBXvYUefTErY0grKHSrBx3El1PaCfBkJ/nKe3TyNJ9SUxl3p@vger.kernel.org, AJvYcCXr85wKUAMzMz7fvZoTb9kf2vOmBmUHHi5yq6n26Q8JlYqp6sCIyLXTepjhO0n9ArHNYAG78DZtXNk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQnxEEMujxgQ6Gld3093sSfNjjpJAsM0v4UQKckY4hzkZWW+o/
	/swmabOBsNIsusEy22aEJpdUexVSC/cW1eAtd5p8tBuZ8EP6HehgQavMf/9dSA==
X-Gm-Gg: ASbGncuRYwiGrkraW+7AUXN1o9J8rxsALf2EcLX3U16jfLatbrWN7N9upmgnaEU7mQw
	pRxHXdy3o106M57IAKaRD5M5HyFBq2luaNf4ANFiyRMSa+pcA4NhKOLhOIya5KH9oeiJ/k5YtKY
	UjqnHq8+E2ypxl9cYdStzAtqyXoUA25huS/OmAyMxiS1N6r9M8G/w2CbtE5+De5DUBasGdPWrTi
	WqgLncrnIT3BakCU9DrSoCxzfKJujJiozNusOyO+6b3T0hK6Rm2jcigaqN+LjLtV56NEqJrsMWw
	b+Vv5i27u80SftuLMXHb42MmPNFzaBhh/xKiPiMsFg7Vhm8aXTzWPlhNpBh61PdJBwyrab5mh5R
	2WEY0XvEAX1yQTW9C16hXcQPSdVu87vybv7J/bbDw8wDgl1lsgjYbBfZ4oXNxdw==
X-Google-Smtp-Source: AGHT+IEMvdMt76tULvaX1DNA9rP7wy9hsoqhDHvOI8Fp0uIBsF401YmUeXKvfshA/CBg6m/VRcfecA==
X-Received: by 2002:a05:6000:220f:b0:3a5:2d42:aa25 with SMTP id ffacd0b85a97d-3b91100f094mr756349f8f.50.1754941809599;
        Mon, 11 Aug 2025 12:50:09 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9eddsm41709246f8f.22.2025.08.11.12.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 12:50:09 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 11 Aug 2025 21:49:56 +0200
Subject: [PATCH v2 2/3] i2c: pxa: prevent calling of the generic recovery
 init code
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-i2c-pxa-fix-i2c-communication-v2-2-ca42ea818dc9@gmail.com>
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
In-Reply-To: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
To: Wolfram Sang <wsa@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Russell King <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Hanna Hawa <hhhawa@amazon.com>
Cc: Robert Marko <robert.marko@sartura.hr>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Russell King <rmk+kernel@armlinux.org.uk>, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Imre Kaloz <kaloz@openwrt.org>, Gabor Juhos <j4g8y7@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2

The I2C communication is completely broken on the Armada 3700 platform
since commit 0b01392c18b9 ("i2c: pxa: move to generic GPIO recovery").

For example, on the Methode uDPU board, probing of the two onboard
temperature sensors fails ...

  [    7.271713] i2c i2c-0: using pinctrl states for GPIO recovery
  [    7.277503] i2c i2c-0:  PXA I2C adapter
  [    7.282199] i2c i2c-1: using pinctrl states for GPIO recovery
  [    7.288241] i2c i2c-1:  PXA I2C adapter
  [    7.292947] sfp sfp-eth1: Host maximum power 3.0W
  [    7.299614] sfp sfp-eth0: Host maximum power 3.0W
  [    7.308178] lm75 1-0048: supply vs not found, using dummy regulator
  [   32.489631] lm75 1-0048: probe with driver lm75 failed with error -121
  [   32.496833] lm75 1-0049: supply vs not found, using dummy regulator
  [   82.890614] lm75 1-0049: probe with driver lm75 failed with error -121

... and accessing the plugged-in SFP modules also does not work:

  [  511.298537] sfp sfp-eth1: please wait, module slow to respond
  [  536.488530] sfp sfp-eth0: please wait, module slow to respond
  ...
  [ 1065.688536] sfp sfp-eth1: failed to read EEPROM: -EREMOTEIO
  [ 1090.888532] sfp sfp-eth0: failed to read EEPROM: -EREMOTEIO

After a discussion [1], there was an attempt to fix the problem by
reverting the offending change by commit 7b211c767121 ("Revert "i2c:
pxa: move to generic GPIO recovery""), but that only helped to fix
the issue in the 6.1.y stable tree. The reason behind the partial succes
is that there was another change in commit 20cb3fce4d60 ("i2c: Set i2c
pinctrl recovery info from it's device pinctrl") in the 6.3-rc1 cycle
which broke things further.

The cause of the problem is the same in case of both offending commits
mentioned above. Namely, the I2C core code changes the pinctrl state to
GPIO while running the recovery initialization code. Although the PXA
specific initialization also does this, but the key difference is that
it happens before the conrtoller is getting enabled in i2c_pxa_reset(),
whereas in the case of the generic initialization it happens after that.

To resolve the problem, provide an empty init_recovery() callback
function thus preventing the I2C core to call the generic recovery
initialization code.

As the result this change restores the original behaviour, which in
turn makes the I2C communication to work again as it can be seen from
the following log:

  [    7.305277] i2c i2c-0:  PXA I2C adapter
  [    7.310198] i2c i2c-1:  PXA I2C adapter
  [    7.315012] sfp sfp-eth1: Host maximum power 3.0W
  [    7.324061] lm75 1-0048: supply vs not found, using dummy regulator
  [    7.331738] sfp sfp-eth0: Host maximum power 3.0W
  [    7.337000] hwmon hwmon0: temp1_input not attached to any thermal zone
  [    7.343593] lm75 1-0048: hwmon0: sensor 'tmp75c'
  [    7.348526] lm75 1-0049: supply vs not found, using dummy regulator
  [    7.356858] hwmon hwmon1: temp1_input not attached to any thermal zone
  [    7.363463] lm75 1-0049: hwmon1: sensor 'tmp75c'
  ...
  [    7.730315] sfp sfp-eth1: module Mikrotik         S-RJ01           rev 1.0  sn 61B103C55C58     dc 201022
  [    7.840318] sfp sfp-eth0: module MENTECHOPTO      POS22-LDCC-KR    rev 1.0  sn MNC208U90009     dc 200828
  [    7.850083] mvneta d0030000.ethernet eth0: unsupported SFP module: no common interface modes
  [    7.990335] hwmon hwmon2: temp1_input not attached to any thermal zone

[1] https://lore.kernel.org/r/20230926160255.330417-1-robert.marko@sartura.hr

Cc: stable@vger.kernel.org # 6.3+
Fixes: 20cb3fce4d60 ("i2c: Set i2c pinctrl recovery info from it's device pinctrl")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
---
Changes in v2:
  - rebase and retest on tip of i2c/for-current
---
 drivers/i2c/busses/i2c-pxa.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 968a8b8794dac3398a68d827c567aa5bb73ae3d7..f4cb36e22077753e21b0260df52b8bdbb85fa308 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -1330,6 +1330,12 @@ static void i2c_pxa_unprepare_recovery(struct i2c_adapter *adap)
 	i2c_pxa_enable(i2c);
 }
 
+static int i2c_pxa_init_recovery_cb(struct i2c_adapter *adap)
+{
+	/* We have initialized everything already, so nothing to do here. */
+	return 0;
+}
+
 static int i2c_pxa_init_recovery(struct pxa_i2c *i2c)
 {
 	struct i2c_bus_recovery_info *bri = &i2c->recovery;
@@ -1398,6 +1404,7 @@ static int i2c_pxa_init_recovery(struct pxa_i2c *i2c)
 		return 0;
 	}
 
+	bri->init_recovery = i2c_pxa_init_recovery_cb;
 	bri->prepare_recovery = i2c_pxa_prepare_recovery;
 	bri->unprepare_recovery = i2c_pxa_unprepare_recovery;
 	bri->recover_bus = i2c_generic_scl_recovery;

-- 
2.50.1


