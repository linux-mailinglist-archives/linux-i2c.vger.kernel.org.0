Return-Path: <linux-i2c+bounces-10927-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9DFAB2885
	for <lists+linux-i2c@lfdr.de>; Sun, 11 May 2025 15:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D49993BA500
	for <lists+linux-i2c@lfdr.de>; Sun, 11 May 2025 13:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3961257425;
	Sun, 11 May 2025 13:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eG24KnbC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E352571B9;
	Sun, 11 May 2025 13:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746970298; cv=none; b=XOjkr60WRZENyQY1F2ZmACDxDrZtWuN6LhCSU4iAT1obq8HNnze+DBkurmzWclSieHrMyFF7FiswYIgLLvkd2dGFobNO9Ath1Gk2ltSsMYhbgrwgqScOoR0LtPaXNkg87UcKS+KCUTT1/3HhdSGboCTOGKGCLV+CAbqpMW6NNpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746970298; c=relaxed/simple;
	bh=pYZ2CMXqQr0dmcuNKig1geqz1YxbWzgtv1tCWka6B+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P/vxFhxVG0icNczFzSb4ocsWw9eGdaVGpkkbWAl2YwcPdHOc8p0H8w5i5U2KkGQRQ2tv69CeVN5ffpoKUlmED3lhVP3MwRhv2HiLemNsoVuh1QNuZwIAbwWbeVwNo+1dYGPvMKYIyNbP3oCcIICljEIoZdg8NdLwqF+p5DMuGn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eG24KnbC; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad220f139adso372314066b.1;
        Sun, 11 May 2025 06:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746970294; x=1747575094; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BySnXAIGhp18eRP0sg1mjpdXdHwBsus0rtjMi26U9uM=;
        b=eG24KnbCF2BpaI20SDbEkcp/K9Wp+3AhOv7y/9eLGMAKuiOl2ESOspwPX0n1ynL05N
         5NnZ3bPvakw0v0EYkjk0nWUtKW7Sybjj0URmhGN4zM1BFGprPGDAeBDW/Ds+c+EvifsP
         O0c0gJJ1qKdy/2dp1uOpa8dMzmdDepup26A72wlgHkrfR1m7pMdxtbuwoVNSo/EkZqj8
         F5typmUPVLAqr1NDLPCQvFxFltrFQIMPKJ7NosMjCC/NAya/3fJDMFdhLaP9WgPtUnVC
         lo5iWkstbb2HXKagVX+eI5db43gB0x+Hpp+Rj/yfFMDXVcz1VxNbKdMkgyiHeuHlsOt2
         VNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970294; x=1747575094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BySnXAIGhp18eRP0sg1mjpdXdHwBsus0rtjMi26U9uM=;
        b=iYAgRRJqm/N3HYSLHp+ZlGGHJMpru4mF5mwoptDs75tmZ9Vvtq2QHTpMrNik3I606p
         5WqeK/04deqEHtXTq48TNI3HDjPAH52D1Nc/oX94Y3dcd3l8ZULc+4lRowTKVPhN9Tsn
         Am7+JB9c7foxpyJP6Q/XJV6FGsd+5Jljh7dJUAkCBj30cyoPGl4kBYgqiVRcEAGgJ5UB
         00hCRz342nWupSnacqRYaRml9wLOZyGBD2OzRVztDmG5pgSdLaYknR3/zhyKCHfQhJd6
         +hKrITwXfWEaEE43nCUAwnaP9UDEFZM4YtdwBUY0iaeUeAOQgviwmlRFG6d+X9EfO0oc
         raJw==
X-Forwarded-Encrypted: i=1; AJvYcCUEmRBA9OBj7fckTIqj9qN1sgAIVEYKGpZIYsKUwzPIO2erJ6GOx9KGY+xgJmtO5+gP0Jeu4DqdXPA=@vger.kernel.org, AJvYcCVXmSW8WUteN5L90xwvdl7lOf1QxSi2DkaYUId2O7KXN361ehEXXdifayswhhhqSghIE2sbkq7N@vger.kernel.org, AJvYcCXkzaj8C0/s6U3kGQW9SY3Fdb1AMsrezpG2SQaeEFyq5NcCl1C2FvrFj7UmwnaU4zBChg3s4O/f+fYQn4WE@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr+UnI2xgYj4Cr+OGu8dKjI+lQTvHHsxUzRP/km8e1Onb3mhaF
	nvMgwnrJZbSFa5EVzJ6F6DjwpBcy1ZoJeiV+xD4b5KYeQ1Nm+hrz
X-Gm-Gg: ASbGncvqpqRdpSeROzGVoF1A0JRkTjqBfQxSzvtI6DUHQCngJpIOMPbgobPAhdCQyKo
	QA8ehqTZ0087rYaYAARTdxbboAMi+ffHAicVNpx8DljiJiohacYfpiDMg0xhLkxrReQNwc3BXT6
	UC1UPORIf5RjNGmYayrUZez8kd93McMN5bci2sZo0qmiJoecxM5vLRGiRsV4zpdLSg+w2xu9SeH
	3DOmRzplQ2/3TPp2S1PGgfwxeF7MOAQ+7uLczkVIx63bEk0Me9lvaQsMAOq3ap1ZZdF4xXoGtCQ
	MsqNd/kHWId5jQ7aqz0W/RKkh8J0s9uYtF4zQuW8vPTyw5oj+Pgen0QF+78Hnq1YjEqyXXo7j+s
	1yp1m
X-Google-Smtp-Source: AGHT+IG8Y/7VNg8lhY275mIfLbq8EaG9jCRvvK1wX7rlbuoMvEUYYC3k7sZOxh3RPmKhAB94Kfvlwg==
X-Received: by 2002:a17:907:7b04:b0:ad1:fab8:88ab with SMTP id a640c23a62f3a-ad219085c07mr897192766b.29.1746970293535;
        Sun, 11 May 2025 06:31:33 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ad2197bd398sm466765366b.152.2025.05.11.06.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:31:33 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Sun, 11 May 2025 15:31:06 +0200
Subject: [PATCH 2/3] i2c: pxa: prevent calling of the generic recovery init
 code
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250511-i2c-pxa-fix-i2c-communication-v1-2-e9097d09a015@gmail.com>
References: <20250511-i2c-pxa-fix-i2c-communication-v1-0-e9097d09a015@gmail.com>
In-Reply-To: <20250511-i2c-pxa-fix-i2c-communication-v1-0-e9097d09a015@gmail.com>
To: Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Russell King <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>
Cc: Robert Marko <robert.marko@sartura.hr>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Russell King <rmk+kernel@armlinux.org.uk>, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>, Imre Kaloz <kaloz@openwrt.org>, 
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
 drivers/i2c/busses/i2c-pxa.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 4415a29f749b927ce96e54cfbd229e1f48fa8623..a36fc30e6f262f0608e0bc77d02771d13d0e0921 100644
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
2.49.0


