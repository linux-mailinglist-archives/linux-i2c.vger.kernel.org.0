Return-Path: <linux-i2c+bounces-3099-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD978B06B5
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 11:58:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A556EB25AA9
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 09:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9494F15956C;
	Wed, 24 Apr 2024 09:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k2RJyw35"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C251158DD6;
	Wed, 24 Apr 2024 09:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713952601; cv=none; b=tOqLAL+x0BziEXNUFjPSeqveEMsEq/634RB57nWQsOb1HKQwPOVONWG2low4c/dB2qUFyBFSUTRrGY9GPqVItdW6POTs6rmTnpie56U113iQpsakB+zRikIdx7TLVe3HWlKyGeZARRdeAeiFfXk9rXtQYggNfU3gzqz7n566KiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713952601; c=relaxed/simple;
	bh=YqY//5lBl+yYaGi8/E20oc5trrx5qjW8jCobmFuWfWU=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MsmV/c11MV8UCYHwKf4efCFeXmhyZcbqXs2F1kELeCf+mddFdkrTvcYI+4q3w3oTJnVUBZdyeLXnjV2CgEXloQqJDjNUCljaPoxoJnRQGhjJjwSE+tDkMED4Q/NUmeVtb08WCiGFsgll4NL5HxbBHvaDecBaJwZbKVGyKcuoAmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k2RJyw35; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6f103b541aeso3652364b3a.3;
        Wed, 24 Apr 2024 02:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713952599; x=1714557399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ioz599OIjAnA21zqxg3x3jvdxgxMKSXGk9djrFguws=;
        b=k2RJyw35eogAhvG0WDh/1v9NFNh7uA94+5mrnsyvufAKBEVTU4ZYPtQlnbUjXHDFa7
         /WxPfT3TMi+pQ56evQubmPVD4Imz9FMi+CcCsNaNHCn3xyoGUDX/jqrJ/B+K8Ajz3gOD
         NhzG6WZzciuJVcCEEfzvGSyygSnRvJ1++/XDQkYR0/6f2PYHlYg+geTMOFepk7bm5w9B
         TVpYsRge2yCws2HO7eP849FUozqD9W08CJeRtIVjeEloEzKmfHhXiQNaBaHxfDcgVeJY
         fJVE4Qx+U0gP3oOMGdPgVq+NgqBcD6ga7ogqej7YupzhaQ7qkm91CMxrKgqy6AtLs4P3
         A2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713952599; x=1714557399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ioz599OIjAnA21zqxg3x3jvdxgxMKSXGk9djrFguws=;
        b=v8V3c1mm4SGDskIKzbW8K2calOw6SZ4RswS08tzHSBQUVctQQJNPLJVIBTsj/jzbk5
         BjUrhagwW2Hacv50UA3IlTiikJF6xiJEBopKLrEAYb6SiaN+S4d9BUsgXlVXHPHdyZ1G
         aCIT7mBkd9R/7mMUJLv8AMRc5MQIHuD9kRSaBupDEDpHz3ltyrD7HuwdYILb/WFsQzWs
         R/f7eVg0NsCjXNtZZpS3eHv3uX/MNPmRVUHv0sDcOFTZEGMC73XJ/ZAoOtdanciMtDZB
         syAw1xINv4TOO6cmxalXSBMkypPQiKcFcRwb8vnN3NfaOcAjGxm5wRn5ZybOvGnAz4RW
         30zw==
X-Forwarded-Encrypted: i=1; AJvYcCVroRMS2gOigQf0NhoKNkx+BP90OILnIfazVlZWGYHBekM0PXHpm1j0rov5oimNiid964fXcQ6H/vUiuc/cUgMiXq07jX2VakSd0PCeF/k5nnEWaSLnmC75aL9zddhpowhAnyi5TkREeDb1Yf6clsgmlqShXjfdYnE7nuiiPzy/hgKWKXGZME/SrlaxY9NMxmu0lTzVPv4rOMM3aGvI1wEk18veapIgWoaCPtYpfpPOdhrPIR+Zlee+nci5
X-Gm-Message-State: AOJu0YzGJ47zp1ZKqPI1ap2KwEUpkSSo9Sf/tpmlCX0nFv8LlGDsa+pA
	rsaccHenAOdo6Aw+AmghkTGWY+X2R75evaDLYiZ6uP6DLI5r9Owj
X-Google-Smtp-Source: AGHT+IFqcZdGhlM5bb2WUFyDPxvKU09dA2xfnEYMM8GJ9dIteNsekJtqKWSAUpk9WriPj/pXAX3ltQ==
X-Received: by 2002:a05:6a20:4322:b0:1a9:e2e0:1806 with SMTP id h34-20020a056a20432200b001a9e2e01806mr2208462pzk.43.1713952599382;
        Wed, 24 Apr 2024 02:56:39 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e380-6057-c341-626e-0f0b-b82d.emome-ip6.hinet.net. [2001:b400:e380:6057:c341:626e:f0b:b82d])
        by smtp.gmail.com with ESMTPSA id b19-20020a056a000a9300b006eae3aac040sm11042932pfl.31.2024.04.24.02.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 02:56:39 -0700 (PDT)
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
	Cosmo Chou <chou.cosmo@gmail.com>,
	Andre Werner <andre.werner@systec-electronic.com>,
	Lukas Wunner <lukas@wunner.de>,
	Bjorn Helgaas <bhelgaas@google.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH v1 3/3] Documentation: hwmon: Add infineon xdp710 driver
Date: Wed, 24 Apr 2024 17:55:59 +0800
Message-Id: <20240424095604.3425857-4-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240424095604.3425857-1-peteryin.openbmc@gmail.com>
References: <20240424095604.3425857-1-peteryin.openbmc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add document for xdp710 device

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 Documentation/hwmon/index.rst  |  1 +
 Documentation/hwmon/xdp710.rst | 83 ++++++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 Documentation/hwmon/xdp710.rst

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 1ca7a4fe1f8f..b2546925fb15 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -250,6 +250,7 @@ Hardware Monitoring Kernel Drivers
    wm831x
    wm8350
    xgene-hwmon
+   xdp710
    xdpe12284
    xdpe152c4
    zl6100
diff --git a/Documentation/hwmon/xdp710.rst b/Documentation/hwmon/xdp710.rst
new file mode 100644
index 000000000000..083891f27818
--- /dev/null
+++ b/Documentation/hwmon/xdp710.rst
@@ -0,0 +1,83 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver xdp710
+====================
+
+Supported chips:
+
+  * Infineon XDP710
+
+    Prefix: 'xdp710'
+
+  * Datasheet
+
+    Publicly available at the Infineon website : https://www.infineon.com/dgdl/Infineon-XDP710-001-DataSheet-v01_00-EN.pdf?fileId=8ac78c8c8412f8d301848a5316290b97
+
+Author:
+
+	Peter Yin <peteryin.openbmc@gmail.com>
+
+Description
+-----------
+
+This driver implements support for Infineon XDP710 Hot-Swap Controller.
+
+Device compliant with:
+
+- PMBus rev 1.3 interface.
+
+Device supports direct and linear format for reading input voltage,
+output voltage, output current, input power and temperature.
+
+The driver exports the following attributes via the 'sysfs' files
+for input voltage:
+
+**in1_input**
+
+**in1_label**
+
+**in1_max**
+
+**in1_max_alarm**
+
+**in1_min**
+
+**in1_min_alarm**
+
+The driver provides the following attributes for output voltage:
+
+**in2_input**
+
+**in2_label**
+
+**in2_alarm**
+
+The driver provides the following attributes for output current:
+
+**curr1_input**
+
+**curr1_label**
+
+**curr1_alarm**
+
+**curr1_max**
+
+The driver provides the following attributes for input power:
+
+**power1_input**
+
+**power1_label**
+
+**power1_alarm**
+
+The driver provides the following attributes for temperature:
+
+**temp1_input**
+
+**temp1_max**
+
+**temp1_max_alarm**
+
+**temp1_crit**
+
+**temp1_crit_alarm**
-- 
2.25.1


