Return-Path: <linux-i2c+bounces-12448-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E6DB38863
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Aug 2025 19:14:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA5FC1882766
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Aug 2025 17:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1768430DD39;
	Wed, 27 Aug 2025 17:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SRJEmWno"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAF62FFDF6;
	Wed, 27 Aug 2025 17:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756314867; cv=none; b=sOmWUOX5VAgCJ9BEDgkrLCpMokzptNACvHhth+Xsf5gU8AkmRdMhzd5wu4FRz3SChInW6FT3T6UnVZXn8clM8O1iHESyF26uAydV3aUZwMPkuP1Pm2XffAtOtnGsLvsu1cIaW2Sf6Od9GalytsJT7woBmjrjdwmE+7NiFNAtiTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756314867; c=relaxed/simple;
	bh=mODA++ZTfdF2gwxfNJ8uMV9AcRZ62KJGPZV+apzvLWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nwbn4XrL3HT+Mf3yXDfB8Itc2Aw+37jtUfmNyU1HPANiizo1pThxq8orDtlG0IfgekTF0RFrOTkeVR3lZEW61bQTdE25SoU15I2IME1NBXE3c6MDr3Z2V/PbkB1rqrW37xQiq7rq4dUYefkDhimK15qIeWNYj6Zu5hDlU0BK5Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SRJEmWno; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45b629c8035so135505e9.3;
        Wed, 27 Aug 2025 10:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756314863; x=1756919663; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PT0DXhXRplrJw52i8Fj3GYlgwoA1mKFpUTHY07GBlv4=;
        b=SRJEmWnoFScXUGB5loNEn3tyqTcOBrutxKjAz5iHbyMakYiWV3+nkyEiFjV1RZfBsn
         ZAbg04LGM+iEefTMGZ5J9sDCJBEFFM4ZPGf3VzEtR6ZNzZITbp7KS8YrZ6fvnPM+/WFQ
         9tY5pnmjuqjOkqzqMAAC11sKCkKPesu2yJiwTw2XOQndYOqsNCB8oLVSGiaG7kXObdBW
         9MibnofYjl1NUl0r2dSEUqaI4F38p1RyUJmu+Fq2hBDdk6Je/AQb40fahiQy00HkRmtP
         TZThiIKj+kTnorIQdhgBuUqMRU/u5lVxnKTYlPo+6KdQwvrTx72PWgbscVqpqLiyHCj1
         APYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756314863; x=1756919663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PT0DXhXRplrJw52i8Fj3GYlgwoA1mKFpUTHY07GBlv4=;
        b=ARRbWg+SPFkNjnTSPi//wXyMwV1dzjriMQm7MeyvLWpavqQ6usRUcoTPjeRkIj14KD
         /d+NgTVSglB7oJv5IKB4Tfw4HdSu5+caArI13pe76AkI6NE2JqX8Lod1iQJwffiANsmU
         jlUNS9ROcRrkzIQLERDpQla9WYPNeJI/VUeWcNcZZOsmQdxMS0evDn8S0Nui2Qfo3E38
         v/qrnWdQy+0Pr788he3WpT9aC9W24C5Moi6kEj8yTJIcLEX2ZgdWiR1jGwm3EYV0b5Md
         OGkV0BXuXfgOGsvCH6gzqzUYnExXTKYXvFloo0O4Z3Qro+H4U3L6vSweqKTlEXW+EqVc
         1nNw==
X-Forwarded-Encrypted: i=1; AJvYcCV1UYAGEuplbQLBX4Jea/yvOLeNwJoDw8IPNLlpyydPJUExDe8rOeB3pfYqnx7bCwxiEb8rHhEI@vger.kernel.org, AJvYcCVELgxeHlmO8T7q3lmsvx+yPqjQT3fFaEjL5NinAd5zNAIGK8OcoaCG60Qxj9uCwGqt9wEb+eF2ISglPjFh@vger.kernel.org, AJvYcCVpekZ5iMeGaSuRUXCjNEiLCTjL1ld8H7Ai2TXFQMzOLN18qunIOfV6OnCMjBeRA12mf8MJS0UpSiM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yze4TKCXel8RMnJ0ptxN8++3TB2215xw4KLA5zHuDfEwaUZUf/R
	6dYTeFAy9b7omqcgrt2ButogsPFWrowzI74IeZ8TTV8xwicAoQnvJSiqXtd+vQ==
X-Gm-Gg: ASbGnctAirnJowvrNrpQH2ZK0u6j05LzEW4mKvb78mB0sYz5moXagQav1rTopx3KnsX
	lyN46SxgHRxLShqfUzPgqtsPcosewIoysfggnWOYHBSITPM1UXmePzzSnI/dmj9etlGQhZDgZNT
	xEOFDkYs5qZrgb/bzfELetWw5W8lsblz8ISODU4csaW1TuvDFA0Ma4uoSDx0W4mAsBi9MTl4SqE
	8DSAg1evZEj3mvnsQhQOpBIiO/PR7pPpZ0BEXNdWY9OlDdoRFGaod873xb2ZvjmSGot9UTTpLjA
	4zeczw89jbe+RF0XcTgOhoyennBYM67FV6453A+Y8UTYLqD5oHlR/Yywcvrvt68kKBn5zlLVFIs
	YGjlaxzCcxpHIK29r+cBHcoDIvqBJ5PLrsg42gqtlboHEP2witgQ=
X-Google-Smtp-Source: AGHT+IGX8S2LLnbQSlxaUpZMAgFZh0mRyIm+QfdT71UA9bzgkN27ugYZRhxwwy0GRoAlORtkGkQV1w==
X-Received: by 2002:a05:600c:8b47:b0:456:19eb:2e09 with SMTP id 5b1f17b1804b1-45b521ca71emr197311705e9.8.1756314862304;
        Wed, 27 Aug 2025 10:14:22 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3c7113fdacfsm21272365f8f.35.2025.08.27.10.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 10:14:21 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 27 Aug 2025 19:13:58 +0200
Subject: [PATCH v3 1/2] i2c: pxa: defer reset on Armada 3700 when recovery
 is used
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-i2c-pxa-fix-i2c-communication-v3-1-052c9b1966a2@gmail.com>
References: <20250827-i2c-pxa-fix-i2c-communication-v3-0-052c9b1966a2@gmail.com>
In-Reply-To: <20250827-i2c-pxa-fix-i2c-communication-v3-0-052c9b1966a2@gmail.com>
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
 Gabor Juhos <j4g8y7@gmail.com>, stable@vger.kernel.org
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
it happens before the controller is getting enabled in i2c_pxa_reset(),
whereas in the case of the generic initialization it happens after that.

Change the code to reset the controller only before the first transfer
instead of before registering the controller. This ensures that the
controller is not enabled at the time when the generic recovery code
performs the pinctrl state changes, thus avoids the problem described
above.

As the result this change restores the original behaviour, which in
turn makes the I2C communication to work again as it can be seen from
the following log:

  [    7.363250] i2c i2c-0: using pinctrl states for GPIO recovery
  [    7.369041] i2c i2c-0:  PXA I2C adapter
  [    7.373673] i2c i2c-1: using pinctrl states for GPIO recovery
  [    7.379742] i2c i2c-1:  PXA I2C adapter
  [    7.384506] sfp sfp-eth1: Host maximum power 3.0W
  [    7.393013] sfp sfp-eth0: Host maximum power 3.0W
  [    7.399266] lm75 1-0048: supply vs not found, using dummy regulator
  [    7.407257] hwmon hwmon0: temp1_input not attached to any thermal zone
  [    7.413863] lm75 1-0048: hwmon0: sensor 'tmp75c'
  [    7.418746] lm75 1-0049: supply vs not found, using dummy regulator
  [    7.426371] hwmon hwmon1: temp1_input not attached to any thermal zone
  [    7.432972] lm75 1-0049: hwmon1: sensor 'tmp75c'
  [    7.755092] sfp sfp-eth1: module MENTECHOPTO      POS22-LDCC-KR    rev 1.0  sn MNC208U90009     dc 200828
  [    7.764997] mvneta d0040000.ethernet eth1: unsupported SFP module: no common interface modes
  [    7.785362] sfp sfp-eth0: module Mikrotik         S-RJ01           rev 1.0  sn 61B103C55C58     dc 201022
  [    7.803426] hwmon hwmon2: temp1_input not attached to any thermal zone

Link: https://lore.kernel.org/r/20230926160255.330417-1-robert.marko@sartura.hr #1

Cc: stable@vger.kernel.org # 6.3+
Fixes: 20cb3fce4d60 ("i2c: Set i2c pinctrl recovery info from it's device pinctrl")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v3:
  - rebase on tip of i2c/for-current
  - rework the patch and use a different approach which does not requires
    modification in the I2C core code and update commit description
    acccordingly
  - remove Imre's SoB tag, it should have been a Reviewed-by tag, but due
    to the rework this is an entirely different patch so that does not
    apply anyway
  - use Link tag for the URL of the referenced LKML thread
  - Link to v2: https://lore.kernel.org/r/20250811-i2c-pxa-fix-i2c-communication-v2-2-ca42ea818dc9@gmail.com

Changes in v2:
  - rebase and retest on tip of i2c/for-current
  - Link to v1: https://lore.kernel.org/r/20250511-i2c-pxa-fix-i2c-communication-v1-2-e9097d09a015@gmail.com
---
 drivers/i2c/busses/i2c-pxa.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 968a8b8794dac3398a68d827c567aa5bb73ae3d7..70acf33e1d573231f84a1f09cffb376a8277351d 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -268,6 +268,7 @@ struct pxa_i2c {
 	struct pinctrl		*pinctrl;
 	struct pinctrl_state	*pinctrl_default;
 	struct pinctrl_state	*pinctrl_recovery;
+	bool			reset_before_xfer;
 };
 
 #define _IBMR(i2c)	((i2c)->reg_ibmr)
@@ -1144,6 +1145,11 @@ static int i2c_pxa_xfer(struct i2c_adapter *adap,
 {
 	struct pxa_i2c *i2c = adap->algo_data;
 
+	if (i2c->reset_before_xfer) {
+		i2c_pxa_reset(i2c);
+		i2c->reset_before_xfer = false;
+	}
+
 	return i2c_pxa_internal_xfer(i2c, msgs, num, i2c_pxa_do_xfer);
 }
 
@@ -1521,7 +1527,16 @@ static int i2c_pxa_probe(struct platform_device *dev)
 		}
 	}
 
-	i2c_pxa_reset(i2c);
+	/*
+	 * Skip reset on Armada 3700 when recovery is used to avoid
+	 * controller hang due to the pinctrl state changes done by
+	 * the generic recovery initialization code. The reset will
+	 * be performed later, prior to the first transfer.
+	 */
+	if (i2c_type == REGS_A3700 && i2c->adap.bus_recovery_info)
+		i2c->reset_before_xfer = true;
+	else
+		i2c_pxa_reset(i2c);
 
 	ret = i2c_add_numbered_adapter(&i2c->adap);
 	if (ret < 0)

-- 
2.50.1


