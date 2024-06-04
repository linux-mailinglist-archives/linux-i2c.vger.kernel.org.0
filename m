Return-Path: <linux-i2c+bounces-3766-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 546D38FA8F0
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 06:02:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D79D0B24E9F
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 04:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F1F132104;
	Tue,  4 Jun 2024 04:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJ8SrO70"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD59238B;
	Tue,  4 Jun 2024 04:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717473764; cv=none; b=evuFE4/WjCHmoLcsiRXnlTcmuDJsZH4Es9vQbsnggdI3/vfquhzcBsW7hNEVWK6hUG99wxYhZN4R21SuZjfYozD1rzDaSNlDtkuifbjFJlUZYq1xAPlY1H59OgLqZyrDsa6Dx7QIu9Njbrk3l7dXz3i56x8vmjFrgwbS0L4Ucxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717473764; c=relaxed/simple;
	bh=g1qqpl96AdAYEBX7DOCPaDYf/Og0BxLUQKggssWSn3M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Ll164m8opo417zW9VRDjmV4aU7SD1JNTI+sx8g9n+lh5SGfqLN9/Uj82N7zdelf0wcrkfaJnfyjeUXgQFwoWJD1l9nIFsaiF28Fpk3ENIcVaRFJ+XwcZygqrcjtuNDOQtENMVDp57tZw+vXRV6FpUzpRpkMb93MQBSZwB4f9L2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJ8SrO70; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1f480624d0dso40660065ad.1;
        Mon, 03 Jun 2024 21:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717473761; x=1718078561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=JlyCTeaCH4Oen+k1b5qm5UwIXUpqadxOqG00edSRfEo=;
        b=eJ8SrO70pmz1VL0NfhEhN6x22JtACLZMMsMVgZdV58sVWCVZAzFV2/GjXEQr1hn1Lr
         0Yg3bgq0+nwGse5YtH4HOdX1J59+XmYMMLSdtEMp0GMHMBoGtV1hrYUy+/eFmae92cH2
         mVkKnbOD/xmIci7CIUAZAYH8x4IphXMEh6UMQ1eNuZz0gEwAcn8Ci0VGgXz3xRYanyVm
         Si1tdhhs48OJRsSSho/EwMm28xQYcMcFMoV51+uF7Hkl3n71aLOKFaTL4hjg4KnXPkLO
         MpS0ybYOMs/0UotVtlHndRpUtJ4JtuX0CcPTou5rwxwe2zeEhu/ha6C4uNihUM/GKjQp
         9qBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717473761; x=1718078561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JlyCTeaCH4Oen+k1b5qm5UwIXUpqadxOqG00edSRfEo=;
        b=HUN89WHLPekZh2BC8rNxsXt4f2e+UEVYs5zyo/oe13NnTfTjhKtaJoxrBVR9+bGb7Y
         Ws/g+LNNbkhNRRmbhzIRJKM/rFj9U1wuw5udj3mdiG9rnO9csYR620BaiuNH56B4T4Wq
         kZS3/rRwR12EPAuVFMPUPLYM7NfsVq95UB8IMKqrbRNevvLkZ/LSLG4PGFttYWVn7ATt
         VnfJEPsCdm5ly8//RRNW8ec5VrAGGtKAJBkGUZdlH6Cf4EYRVThDSGahdJ4UQUe7rVrb
         9x2lj70kqeU+SmQPyyQIF9cZAAAiQMfcHPaaNsQn2fbwDiHOOJ82Gwx0WcZJDpTZyF2j
         lzig==
X-Forwarded-Encrypted: i=1; AJvYcCVuWLTNdwEfDj/g2KEXxzgVr+9GMmT112wJGX5htB0fW2KBHME+rX6Jogef1lj1RU8NDP+pWQIyzA5DxZbpsMx3FIjIAyDG5jbThtvSUck+sf12dlzDcyQC2rKVRkQsx8p30gRNTm0dsg==
X-Gm-Message-State: AOJu0YyulXpDzRaND6ixqS0mpOkjt/1DAQw4KbNU796dcIya1eRMotqh
	eyV5Zn8HTZBApu78jZ8e7cE/fsZb+aEJNxxdkWa0qWLW9SSJi0S1K8bvaw==
X-Google-Smtp-Source: AGHT+IFqdUa+JwtJ+RCDCcGeklgRUk+qu9sxaUHH87jmwn3HEYfBJNaN0ce0pgGxCIRUlgCz57I0xw==
X-Received: by 2002:a17:902:e742:b0:1f6:80e2:e423 with SMTP id d9443c01a7336-1f680e314f6mr52815495ad.68.1717473761080;
        Mon, 03 Jun 2024 21:02:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f634380b34sm71840785ad.12.2024.06.03.21.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 21:02:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Ren=C3=A9=20Rebe?= <rene@exactcode.de>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Armin Wolf <W_Armin@gmx.de>,
	Stephen Horvath <s.horvath@outlook.com.au>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v4 0/6] hwmon: Add support for SPD5118 compliant chips
Date: Mon,  3 Jun 2024 21:02:31 -0700
Message-Id: <20240604040237.1064024-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for SPD5118 (Jedec JESD300) compliant chips supporting
a temperature sensor and SPD NVRAM. Such devices are typically found on
DDR5 memory modules.

The first patch of the series adds SPD5118 devicetree bindings. The second
patch adds support for SPD5118 temperature sensors. The third patch adds
support for suspend/resume. The 4th patch adds support for reading the
SPD NVRAM. The 5th patch adds support for auto-detecting SPD5118 compliant
chips to i2c_register_spd() in the i2c-smbus code. The last patch of the
series adds a configuration option to make the auto-detect code in the
spd5118 driver configurable.

Note: The driver introduced with this patch series does not currently
support accessing SPD5118 compliant chips in I3C mode.

v4: Add support for detecting SPD5118 compliant chips in i2c-smbus driver
    Make auto-detect code in driver optional
    Fix suspend code
    Ignore failure to register with nvmem core if it is disabled
    Use NVMEM_DEVID_NONE instead of NVMEM_DEVID_AUTO in nvmem code,
    changing nvmem attribute directories from 0-005[0-7]X to 0-005[0-7]

v3: Drop explicit bindings document; add binding to trivial devices instead
    Add support for reading SPD NVRAM

v2: Drop PEC support; it only applies to I3C mode.
    Update documentation
    Add suspend/resume support 

----------------------------------------------------------------
Guenter Roeck (6):
      dt-bindings: trivial-devices: Add jedec,spd5118
      hwmon: Add support for SPD5118 compliant temperature sensors
      hwmon: (spd5118) Add suspend/resume support
      hwmon: (spd5118) Add support for reading SPD data
      i2c: smbus: Support DDR5 SPD EEPROMs
      hwmon: (spd5118) Add configuration option for auto-detection

 .../devicetree/bindings/trivial-devices.yaml       |   2 +
 Documentation/hwmon/index.rst                      |   1 +
 Documentation/hwmon/spd5118.rst                    |  63 ++
 drivers/hwmon/Kconfig                              |  30 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/spd5118.c                            | 661 +++++++++++++++++++++
 drivers/i2c/i2c-smbus.c                            |   4 +
 7 files changed, 762 insertions(+)
 create mode 100644 Documentation/hwmon/spd5118.rst
 create mode 100644 drivers/hwmon/spd5118.c

