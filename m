Return-Path: <linux-i2c+bounces-3151-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 324B78B2548
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 17:37:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63A3B1C20444
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 15:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A19A14C59D;
	Thu, 25 Apr 2024 15:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQYc4p2Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18A314C585;
	Thu, 25 Apr 2024 15:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714059410; cv=none; b=aNfz2sr7EhLoCTKKa2LPxrLBVY1lJZ9N0YF5izehFshIsQc19R0+YiKzsPi1Wy/JJd7iHSlLjkZH7g04zmIkH8sKhemzZO498Hm0qiVoP00vEXNVwBeBHQ1sbkebyF/9ThH3CPOL9IIK1qmxudf98k09ZET3uR/GTfWjEbfVXWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714059410; c=relaxed/simple;
	bh=PDmEGB3SrxvZUBnjCVzoTIhpoJVzwszchmK2bG/LP+Q=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EEYSInf7j6NltNi4Td2s0fBFxq+W9cBilANsTmIdkY/kqhoG3XVdiO7i44ouz172bVRnyv0koGLC4mjck3VfQg4ttdPhUSE8W05WFnpO5fjqWsSZBFLxJidllN1XTHxrTdos8oaWvGrP8maM1/MbSMWWFTw0TSGKMXhuF4QAbgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQYc4p2Y; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1e9451d8b71so9945615ad.0;
        Thu, 25 Apr 2024 08:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714059408; x=1714664208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uuLAiBXQO6duyX3a2t5j57OCCXewrqZUvzn6yKvBMNk=;
        b=KQYc4p2YAXN8z/1agMot8kT8/9udqC3lXLnbJiVXSaC4cp+lERi2t7rXD1ybBWfJ9t
         r2UI1/qhNogb4zw4afN/oX5gFn5/zULGJXfoXH6vkiFXWo4GYffiER1MIiCUhXcH7vto
         iOQDVPxMhCMatGuNS4RdHxs3AmwHpKT4NL3fwEGY27iK/mppFiR+59EnMFLOX5qkM74d
         MzMjQxiomBcW4FNB6gudgT1mBBG95ZKrVcZQTILO7928lZVQAPks3pJnV50R3VwOHxOz
         iZhj6i3xE3WeACYVDP3JfkGlaPw4HUkNW1yEFxvChYEd1W4SIEHQ5sxSu43Yk9b8cyfY
         Tzsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714059408; x=1714664208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uuLAiBXQO6duyX3a2t5j57OCCXewrqZUvzn6yKvBMNk=;
        b=Yztu6eUBCCFgLfsYKbAUWuoOvl8m9kftoG6M+7L311A8Bl8Rci+/n5cKdtsjBaJTXk
         7Dp7Ph55jorNYrUZ097OJNlyrgvbEzxaaVG0fZXCwa8FZxS5+xeMVezj07Q5M//Do3M5
         w4lcxdYtJAM6bslw2kTRsSw//zzBTLedXNe8jAzycNweEkyon5D9Qa7r9ojv5qtBNDA9
         vkf/GdFzADycz/jqfkjyv9SnAZ5ZWp8NJNNcb3oMYj/rHJmAsJUe4PqG5Cwo547fWv1a
         s+T7FO5AbS1FhOKcNzEeNh8WGdMEforXYbmj4zjfsFyQZLGsrHTvUOpggY/YqEzGqvRC
         269Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9epNtEuA+Ak4F5kyr6EZS2EZPiDA65isE0vP2nCiNNBInsvPEBmjhBNLR12n/yBA2NwcFRarx+cZ/l7UhmmzqISizv3+FAA4Iro82BlajpW8Ngiz7sQN5XFVH+POxGqP1ZIOnmO/x/kdbWrS6hb/YzMhCZZd7RX3cv5D0+hfqoWMbzTG/jp/MBqZTcAyr81kF2NuFWGtKCgk9n1BJk8/gt2CvidrHPzi7iI/9XAeq1FFFgMoR+8hC9vHT
X-Gm-Message-State: AOJu0YxOSMuhpGqRaFNTI++Z6eIxsqBtoVV3sWVF4vZeoJV3SfpKSO1O
	3JPIjiG7RPA7If+pWr4RXdHfdjeawfvHpJX2cfCjA3LULeKIXGue
X-Google-Smtp-Source: AGHT+IE9vJ8m+kjIx4Dc4HB0h4UKfRc6/ZD+hpDo/CuJ9kwLGxcrYF/dOl57soHdoWkmxhG5AbU+Fg==
X-Received: by 2002:a17:902:f70a:b0:1e8:2c8d:b749 with SMTP id h10-20020a170902f70a00b001e82c8db749mr8602039plo.30.1714059407830;
        Thu, 25 Apr 2024 08:36:47 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id bi2-20020a170902bf0200b001e27ad5199csm13852586plb.281.2024.04.25.08.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 08:36:47 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Charles Hsu <ythsu0511@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lukas Wunner <lukas@wunner.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH v2 2/2] dt-bindings: hwmon: Add infineon xdp710 driver bindings
Date: Thu, 25 Apr 2024 23:36:02 +0800
Message-Id: <20240425153608.4003782-3-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240425153608.4003782-1-peteryin.openbmc@gmail.com>
References: <20240425153608.4003782-1-peteryin.openbmc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a device tree bindings for xdp710 device

Acked-by: "Rob Herring (Arm)" <robh@kernel.org>
Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index e07be7bf8395..f982de168c4c 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -134,6 +134,8 @@ properties:
           - infineon,irps5401
             # Infineon TLV493D-A1B6 I2C 3D Magnetic Sensor
           - infineon,tlv493d-a1b6
+            # Infineon Hot-swap controller xdp710
+          - infineon,xdp710
             # Infineon Multi-phase Digital VR Controller xdpe11280
           - infineon,xdpe11280
             # Infineon Multi-phase Digital VR Controller xdpe12254
-- 
2.25.1


