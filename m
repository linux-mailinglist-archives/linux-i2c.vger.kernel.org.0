Return-Path: <linux-i2c+bounces-3149-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B928B253C
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 17:36:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEC6E1F21B8A
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 15:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0540E14C58A;
	Thu, 25 Apr 2024 15:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7pW6ddM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3E814B088;
	Thu, 25 Apr 2024 15:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714059391; cv=none; b=NtuFkiPtwsst2H/WPeiiPEwhICvcvAdq21ooX1uQNDuoXF+Newg9+1+o8dpzFj35rJDFY5XvDUtK5aEGbKSPMzejL7DeyhkRX4csXMeedK4dAVPRgv2UKu3f+XdN05AXnD8s6Cyq7Xj1fQ//qIVrX0H8LAZkcHGYgDhbTDVJvE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714059391; c=relaxed/simple;
	bh=+aPFoqgCJiCF8M7Yr4hYUX9uwXga+n9jEz+TsIPCY1w=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=QAOe1Tn2/O6OEx02bkkZhYo974SdAh+lJv0LxBzKxbizQ4VgmOvee60bFahfoYYuKdCQ5TCKnZs6t9Q2u6cXdZbVa8g2ZLgbgA47EkkisB9RNZp9DK0ZHHhQL3YvY+DlD8Q7641WS6WyGD+XF9zHCuVKBUfJNt2c8yDhzuc247Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7pW6ddM; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1e65a1370b7so10391945ad.3;
        Thu, 25 Apr 2024 08:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714059390; x=1714664190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GS1z28aJanup/6e1AA7r2VX25gfbel/TmqZZU+ll62s=;
        b=a7pW6ddMPgUsrd98BZr9Mu7Eaa+vHe4YdFFFQ/AI+0g97SLeam5DHbcQgZoiHDEntM
         UbgZRFK9up+H9rYB9+WuynWR5GjAcyZNVhBcTvE89bonchBRMzZh/a+QIhTmVlKjMqb0
         AWoA5nWngqrhsVFrqg+VnciGo2CuMHA9iFRVSVOGMjcKe2kfgREmMyQUoD9DVIK9LcUH
         bO3igtU/IZUjUPT4hgi0mQyJmH8+Ocheyxzen6UIQC3zbQMzzHEf1ClzPodllH+F8+QN
         5gD8P3o469Hf3FxtX4N7Q0Xdj2ovLxrivaB7do2278y8lUu3nM+Qj4cnT7eQpj4EzE45
         9X7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714059390; x=1714664190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GS1z28aJanup/6e1AA7r2VX25gfbel/TmqZZU+ll62s=;
        b=iPduJjlsr8+iq4OAafeAJXoLN9vThOwZoTnac2uDfvJRn0NwtHbSnlMUIxFlaKhrBc
         4zwEt42rdgIH17puOfSZfa3ZYnR8xFgzzlR5j/d/5xb0lGtS6rIEKq25XX0PBKBH9V5I
         yMsHN+VrJuMtXizPGQWr4g9QnE1JXfdK268X2Wiz0+f6G1FTIYs20yAPCtsfCEVB0sCC
         jkdO9yLLaVg89aLdNJyFCv2soizCuz4IR3Wvd+cNtj6DHEJlApNVvc2cOkUhQk/ebbcD
         9VR5pYdqggFzRJruS/OPm5rk2o1Puo4dJREX9CGwy6RWE1f6udFBXjCskujRHGpZTx6y
         ZM1w==
X-Forwarded-Encrypted: i=1; AJvYcCUbC5jvtw5Fb7SShDo0L4O4/fywZvDnKowp+DZ9AZYg/k/eZBKsTFXFCXllIJKp4xHU/F2DZPTilMTI8OIN05q+inOgbD6qsZSOHyLueTe537oXAJetADcWg0fZTXUROVWu0AaFBxUCoyS98fSE/pFFPEY3FgfYDg6efOHPXusuQ29WDd6J4z2SzA2V72rLoqfJKn62sX6BjNOyONg2Iv9QEJk3ugUtC40MVFPp8WtCA+ieaOCC7+nKLHwX
X-Gm-Message-State: AOJu0YxwkXrB7HkNxxyU83zULNE4hnbVTdp6wX08QOZSYD71YJcyo8hi
	TFKBXJRDCY+wSb6R759oxwXBerVixsc35IQS3qzz/geNVPdISN4O
X-Google-Smtp-Source: AGHT+IEtJbhAjxpnnQqboxzHuIy6txTTUH7xBz9RLkcu4O8HBERS80H4hbPWdi3yLllYxjSYxfHtWQ==
X-Received: by 2002:a17:902:ec92:b0:1e2:7717:d34e with SMTP id x18-20020a170902ec9200b001e27717d34emr9132797plg.58.1714059389744;
        Thu, 25 Apr 2024 08:36:29 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id bi2-20020a170902bf0200b001e27ad5199csm13852586plb.281.2024.04.25.08.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 08:36:29 -0700 (PDT)
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
	Andre Werner <andre.werner@systec-electronic.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Michal Simek <michal.simek@amd.com>,
	Lukas Wunner <lukas@wunner.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH v2 0/2] hwmon: (pmbus) Add support for Infineon XDP710
Date: Thu, 25 Apr 2024 23:36:00 +0800
Message-Id: <20240425153608.4003782-1-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for xdp710 device from Infineon vendor.
This is a Hot-Swap Controller.

Change log:
v1 -> v2
    - Merged patch 3 into patch 1.
    - Modified comments.
    - Fixed the microOhmRsense array.
    - Improved operational accuracy.

v1
    - Add support for xdp710 hot-swap device from Infineon vendor
---

Peter Yin (2):
  hwmon: (pmbus) Add support for Infineon XDP710
  dt-bindings: hwmon: Add infineon xdp710 driver bindings

 .../devicetree/bindings/trivial-devices.yaml  |   2 +
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/xdp710.rst                |  83 +++++++++++
 drivers/hwmon/pmbus/Kconfig                   |   9 ++
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/xdp710.c                  | 132 ++++++++++++++++++
 6 files changed, 228 insertions(+)
 create mode 100644 Documentation/hwmon/xdp710.rst
 create mode 100644 drivers/hwmon/pmbus/xdp710.c

-- 
2.25.1


