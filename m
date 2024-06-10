Return-Path: <linux-i2c+bounces-3946-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E11F902441
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 16:41:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E7591C22531
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 14:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F4013774B;
	Mon, 10 Jun 2024 14:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hUvxOG6a"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7F0132138;
	Mon, 10 Jun 2024 14:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718030471; cv=none; b=qrYx0uKF+0d7PajQD/qSep86L9kC3608VQ4/tYrYf0egRJ9Hd6Xv68mn57I3ioTsuab8+eERm+VErAen1qqlHPt4b3JOOrPUh9675gx5Ejff1IlwBn/J+9+aUIHqL1E5eneaBUn1fYHO/ic9H+1b7WBoj+ELsiOWFF9XUCaib40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718030471; c=relaxed/simple;
	bh=Ewfv6BSJ//H6ogPGQXqz9bBUaJFKXlasAB18jtXeIQs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=mawCabcqvPJDOmu1eRoSSotY26nlqgHnlCQ/oj0ajdtuw/SkOaFoS0359G51+Yc/rLxJjT2mhj35Oi6pFdmtDJtX2Nk6WzQTqxljOGcs+lfUsFUMj4APULtvJlzkqDyJLanZlPdal3Ut0vtet9NkE3MWd4zTVGaz689s189Fjbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hUvxOG6a; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-70423e8e6c9so1614948b3a.0;
        Mon, 10 Jun 2024 07:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718030469; x=1718635269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=3Oflg6MelnCBiDbZKifqbBRD3GJwcku6VDqLHLAOzRU=;
        b=hUvxOG6anxbGdEnnNbebiARJayHN3lX8RbTd4mtMDi+I1twoBN0OildR134wQj7dOl
         b+btf6AC/EgMq0cFRrqzgErBeSSWgfU1KXfLeSN3XtD+6zowUPJ7UHC9mALiXFANjh8O
         aM1t877qiO6OYU1OaTG3w4srSvWEc2qH8OjiYhjND90r3ecmMGvaXr698OM+PBjjOvlC
         mWJ55iE5z2D+IwzfJQ8J8cMjk1/1nReDW4O0OMeU9/ltnjeSCua3M+9nH9zrj3XYUmnk
         2IX3y6MUreXSKOVhNwCg032JmTi6gxayks1Z4q1dekbvu/6yBgQXH4FpcD3A8f8h0zHX
         RC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718030469; x=1718635269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Oflg6MelnCBiDbZKifqbBRD3GJwcku6VDqLHLAOzRU=;
        b=THnz6whAnVUppVQaTbB3IhDQ4k4746jkA/babpQiXtt2Rqm9KJjcv9+y0YK8rlqhpn
         YobsKnCDVSQbihv7WGn6x+SrktiJrLMmZOYk0tJCeIpXym1pFGzOBUt5lYifaq2/q54G
         dbMoupwNiCrlv0B7j87IVKZXNXE2WC5/LwFiul/UbLMgvIOqt5HkO4ZIVg029TX2hSY1
         ELiuvascHb3ovEaHTAuMfq/49V30bUBOZOS2rGjunMaznVmRhdOfok8PBspMU5mURcje
         nIx7c75vC73NgVjrMkN4A59SD52RLSeOdDt5sbV63efQJ3vFJXsXMub/Z39txEWXk4zH
         wWNw==
X-Forwarded-Encrypted: i=1; AJvYcCVl/6djBhpbMV6ojmiZBaJjn/as9yo61yGLs5JeiOkbC5oCzArfB90F8mE8tny9eNEY48DXTBGEBAc2MIgILRhf+UiZWmiON+tpsqxfqm3a8eyg6z0L8a/3uaJh9dM3GQxl2VWDfeJgiw==
X-Gm-Message-State: AOJu0YzOT2PU7jwE0AX4Dxy+isg0nNIPLKmjAM33AoUOxzG9sAUBRQ2O
	9cSGbTvPrzVSNr60TJpJ3hsO+zkXO+7c1r91nxdffj/ZvIlRHATScaR3EQ==
X-Google-Smtp-Source: AGHT+IHlqQbt5OVysUvY2U09jYnrvL3FyZ1Re7upsbFSTmKEglk+dvAXI1USFpKkmIp+Mp1WJR3NpQ==
X-Received: by 2002:a05:6a20:9699:b0:1a7:11bf:7b74 with SMTP id adf61e73a8af0-1b2f9df87d5mr8059896637.62.1718030468692;
        Mon, 10 Jun 2024 07:41:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70594077c64sm2081072b3a.6.2024.06.10.07.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 07:41:07 -0700 (PDT)
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
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v5 0/6] hwmon: Add support for SPD5118 compliant chips
Date: Mon, 10 Jun 2024 07:40:57 -0700
Message-Id: <20240610144103.1970359-1-linux@roeck-us.net>
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

v5: Added Tested-by: tags
    Cosmetic changes
    Added reference to LPDDR5 to subject and description of patch 5/6
    Updated comments associated with i2c_register_spd()
    to include support for (LP)DDR5
    Replaced #ifdef with IS_ENABLED() and included address_list in
    conditional code of patch 6/6

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
      i2c: smbus: Support DDR5 and LPDDR5 SPD EEPROMs
      hwmon: (spd5118) Add configuration option for auto-detection

 .../devicetree/bindings/trivial-devices.yaml       |   2 +
 Documentation/hwmon/index.rst                      |   1 +
 Documentation/hwmon/spd5118.rst                    |  63 ++
 drivers/hwmon/Kconfig                              |  31 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/spd5118.c                            | 658 +++++++++++++++++++++
 drivers/i2c/i2c-smbus.c                            |   6 +-
 7 files changed, 761 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/hwmon/spd5118.rst
 create mode 100644 drivers/hwmon/spd5118.c

