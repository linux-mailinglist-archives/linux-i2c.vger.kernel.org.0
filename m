Return-Path: <linux-i2c+bounces-7267-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE5399456E
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 12:30:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD5101F229EC
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 10:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DFBE1C2313;
	Tue,  8 Oct 2024 10:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fTrCiN9C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6421C1AAD;
	Tue,  8 Oct 2024 10:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728383393; cv=none; b=sqUIl6Dam1EPTZTfLRGaLxrTN4q800EYHaPJvXYr1w3zwpF/FJe2yDhzVhGZua4CGx+OrhybbWsoW/unMpiuWFeombCmP+kO8Rj0FaxW6CvQ+xaKC4kHi0l/oNsA1yy89PGH0MM0VD8ACxi1Mc/p+1mKfvTqIhcyWawc3lmNFvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728383393; c=relaxed/simple;
	bh=l7tS8eWROa3MwcAh1tj1sjbMaiNYkKpHNBzM7AHJTh0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=n1kMFI/le0jqYz2Y5deXInb4nBOHFLQPIXaMpuBlVKyIZzZ1TBBwDKbLhKjwR0oRHpAvNZj/PZmz9gGpRi3mh2qT4gi380lfoh1ziR3KsoQhXKeAvfLY7Unedke5tKYUPQU6f4Srt4GBeY1sx7xfbJRZ+eLTIwQyf9LQIac+jq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fTrCiN9C; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 33384E000B;
	Tue,  8 Oct 2024 10:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728383382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4UBiSkAGEqIlk6OGBJi+SQVIzbv8Yq+NGeKs31Ac9wc=;
	b=fTrCiN9C+ENCif56EMf+WWlzWHIjkQ5yIq5T5mlg2OYzryTwD0X0Q0qfQLDPL2Z7ZGxp1m
	dM8svdZn7t/7JMIgzriua+lwzJka4q7OWDbfQ/fMviTpjU5nkxe9aay64aBGcgj1lXvrEi
	QKUiTg3KL7pQ+Xq9wvtDV9UgmFEywTqJ6geIY82+R6ubynKFbsk6h7jS9MA4LXREze5xFf
	1dQUyVvwOTE0xWpYbqn2dDF/FBqV/xy05R0fgq7aM/2L4onbi0pP1Mhn2gMCMyEsX3dWe9
	JhkyT+pGfoiPylw6EhesSD9rQgGwuW5zxPqcOAK+SZ9ULhem+4etDpVRBApA3Q==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: [PATCH 0/4] i2c: nomadik: support >=1MHz & Mobileye EyeQ6H
 platform
Date: Tue, 08 Oct 2024 12:29:39 +0200
Message-Id: <20241008-mbly-i2c-v1-0-a06c1317a2f7@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJMJBWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDAwNz3dyknErdTKNkXSMz82TLFBMLoyRLAyWg8oKi1LTMCrBR0bG1tQA
 WVGuPWgAAAA==
X-Change-ID: 20241007-mbly-i2c-267c9d482b90
To: Linus Walleij <linus.walleij@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: theo.lebrun@bootlin.com

Hi,

First two patches are about adding Mobileye EyeQ6H support to the
Nomadik I2C controller driver, in the same vein as was done a few
months ago for EyeQ5.
 - dt-bindings wise, it is only a new compatible. EyeQ6H does NOT
   require the same mobileye,olb custom prop as EyeQ5.
 - driver wise, we are again on a 32bit memory bus, so reuse
   the .has_32b_bus flag.

Next two patches are about supporting higher speeds (fast-plus and
high-speed).
 - Fix computation of the bus rate clock divider (BRCR). It picks the
   smallest divider that gives a bus rate above target. Switch to
   picking the largest divider that gives a bus rate below target.
 - Then support high SM (speed-mode) values. This is not much work.

It works on EyeQ6H HW just fine. 1MHz has been tested but not 3.4MHz
because HW doesn't support it. The theory is there, and BRCR
computation has been checked to be valid with 3.4MHz clocks.

DTS patches are not provided because they depend on the platform's clock
series [0]. Lore being down at the moment, see Patchwork [1].

Have a nice day,
Théo

[0]: https://lore.kernel.org/lkml/20241007-mbly-clk-v5-0-e9d8994269cb@bootlin.com/
[1]: https://patchwork.kernel.org/project/linux-clk/cover/20241007-mbly-clk-v5-0-e9d8994269cb@bootlin.com/

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
Théo Lebrun (4):
      dt-bindings: i2c: nomadik: add mobileye,eyeq6h-i2c bindings
      i2c: nomadik: support Mobileye EyeQ6H I2C controller
      i2c: nomadik: fix BRCR computation
      i2c: nomadik: support >=1MHz speed modes

 .../devicetree/bindings/i2c/st,nomadik-i2c.yaml    |  6 +-
 drivers/i2c/busses/i2c-nomadik.c                   | 65 ++++++++++------------
 2 files changed, 35 insertions(+), 36 deletions(-)
---
base-commit: 6f1cfa7816af8b3286140f1b0476200d5e914eb9
change-id: 20241007-mbly-i2c-267c9d482b90

Best regards,
-- 
Théo Lebrun <theo.lebrun@bootlin.com>


