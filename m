Return-Path: <linux-i2c+bounces-12181-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB1CB1F6F6
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 00:07:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65BC7189C9B6
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Aug 2025 22:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A4A279DAF;
	Sat,  9 Aug 2025 22:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iEVKh0bW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114B2239E80;
	Sat,  9 Aug 2025 22:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754777245; cv=none; b=ZXuL/WDannGkJJokDiQFnwaseegW3SDgXgIWAto3kvin9MUoGhSzknIYvhadz/usxaRQaJ51isJOLy/lyx27mQAFCHgZp1dXj2OTe9pqSLQ0e5ZLICk8Sqxgg6dFlqroxASdgIgeurCpb6mHKj8hv2TNM+ni3xWYEiRaGR+WdH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754777245; c=relaxed/simple;
	bh=4EzJwQuBIFM4raNBxPJN0k1uknAHAN8Ud0aTfpRATdM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D1GasHSfSRuZfucIKYmoWxwKt+xswzDa6ehJLYRLkggfIj3IenFSVGzP47Z08g0a3bcaIu2vvoaoHPhdUeGkeH8nUUEPRpOgQNXN0kHf0RZ7qpUOwcrYsuDxv50JtqUsvW366TlImtBWEq4NKHDmoi53p0klCjsHcj1l1MAxBdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iEVKh0bW; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b786421e36so1705338f8f.3;
        Sat, 09 Aug 2025 15:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754777242; x=1755382042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ON51mp/PIZKw7yNbH39krxKEwgXvkrApaUAVnb4qDrs=;
        b=iEVKh0bWkPtct/rXPF09vw2CH7aSy6B6sc+E0HM23S2n9jNEbm+f34Tf65W0r6F9c1
         8/FCMeFGulMzsX/1IJ6ps3OFZrvjOyRIdkId8I9f21rJNtPVbFAGjQrh7ze6Oul7WGiv
         hmyYvvWNqRVPaadvg3/cxbLoVPYbSfdTeflQz7N0qo10GJrSIpTfZyL2gEHVrRsD6sZw
         cFuEyMQlwsRrvxsyzlJC+lhB9jruw+Lrks126e7k1xlJmfh0RBIOGgA4mGcWFSLd/jD8
         B3dOWEX1lEe/cXz7KIzAdOWk+s4++1H2bYz4+dsBfebDkW+ppwjzjKt24FflJYzpcGy8
         ICog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754777242; x=1755382042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ON51mp/PIZKw7yNbH39krxKEwgXvkrApaUAVnb4qDrs=;
        b=SQjOpD0geGbxue2+GAMxSqV1ERwzmsziOopkzhcqhA7N/lul305BU/EiK2lfmo0JNN
         UzaxN0MU07CCLmZEEzeR3F/S3ziCXjkUFQ948Rjnv14gpLvBpY2tGwVNmvCEDIzjrOCC
         AQCgfRoSdy5rPm9rr6Qj72562OttSllOFKpErphIyptpefqWtBQDBBZmB6mwDlZvqjIo
         2ZvNhzsWuyzdRPCooLaxLc2EH6MiCeJXdLdUJL+L7aAywejoReIFAh4lpsmSs199Z3Sa
         MybMT85emMdW+Fq2qz7cRE6rb6ZVhPwUKoK7C+i0BAYZDKG+CY2wFPybP7bI9eAMrn5o
         qlBg==
X-Forwarded-Encrypted: i=1; AJvYcCUiZkCwz/26q/1hDGYFsU2/s1hGsRm2bCvMRvnVF7AZ9dD9UhKIjyaR43+xzU2T6VqIrx2RejL4f40S@vger.kernel.org, AJvYcCVp6ClNXBcbHbjeTlJbpFoCkxrPH+QGXYHyXp8Npifn3WF/5bAwO8Y1NyzayRYmJJVD1JqJo90bPTzsJ012@vger.kernel.org
X-Gm-Message-State: AOJu0YyjNyuQQFWWzx6iehOoxC+nsNd2S5e6B+gRyLZq6KXwbLCTJVEr
	37mQfsd7aGB7WyCxel7pEzo7YK0qIZHCuu2QPrG3xhsf3L7nZW6MghtUbvFffg==
X-Gm-Gg: ASbGnctapZhvrHRSdJUZFsRnGjlpge7r7g6Hlq1653oOowd542QrqHOUH6mlbZeg0Th
	3JBvLYqnc9mgvJ9hFR4gP6kkszMww9geE016WFP73boq/Worpv6LWNPOFAWYqFmndX4Q5qtdfp6
	JLjpXgivLcUqtOiqYm2ZC6zyF4gP7V771ICFJlYTBYWrO+fxn3b/wEcTveL9svD4txwpuzkxTyO
	jqaK8rNUM1PdOyHnOXi2IlgrlmM3jDFRpsL4TVuXo4Dl/l6k4WJsukGX0pIe+giu9Niqk51Q/fh
	F7wlVCspuOvff7f0WubIqAuwr0bnDKJw4laJgyPXF5y3t3VfBnBqYV/4l0uZjJkBmIp2E5BJSpJ
	zaBJWBbpwxmWWCA++RtPpUWyArHi9J2d5WhAB2N5ZYovadTrH8x6z
X-Google-Smtp-Source: AGHT+IHpixIBUdkRkSToWyKVB/tbX1BCbXUF6/OprNCLLAnNCeqB+CaznTHWMurcVG7SR9P/g3Xruw==
X-Received: by 2002:a05:6000:178d:b0:3b7:931d:379a with SMTP id ffacd0b85a97d-3b900b576b0mr5156985f8f.58.1754777242110;
        Sat, 09 Aug 2025 15:07:22 -0700 (PDT)
Received: from builder.. (188-9-142-46.pool.kielnet.net. [46.142.9.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459c58ed0ecsm145592185e9.4.2025.08.09.15.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 15:07:21 -0700 (PDT)
From: Jonas Jelonek <jelonek.jonas@gmail.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Stockhausen <markus.stockhausen@gmx.de>,
	Sven Eckelmann <sven@narfation.org>,
	Harshal Gohel <hg@simonwunderlich.de>,
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH v5 00/11] i2c: rework and extend RTL9300 I2C driver
Date: Sat,  9 Aug 2025 22:07:01 +0000
Message-ID: <20250809220713.1038947-1-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series reworks the current implementation of the driver for
I2C controller integrated into RTL9300 SoCs to have better overall code
simplify support extension, and adds support for the RTL9310 series.
Goal of this is to have RTL9310 support upstream in a proper
implementation to be able to drop downstream versions of this driver.

The first patch changes the driver to use more of the regmap API.
Instead of using macros, all registers are defined as reg_field and
operations on these registers are performed using regmap_field and the
corresponding API. This simplifies adding support for further chip
families and avoids potential redundant code by just providing
chip-specific functions for every chip family.

Further patches add some checks to fix issues based on incorrect passed
values, remove SMBus Quick support (not actually supported by hardware)
and reorder some operations to be at a proper location.

The last patch and penultimate patch add support for RTL9310 series to
the driver and adjust the dt-bindings accordingly.

Simple operations have been tested successfully on RTL9302B-based Zyxel
XGS1210-12 and RTL9313-based Netgear MS510TXM, with simple SFP EEPROM
read. Other operations need testing from people with devices available.

Compile-tested with Linux, run-tested as backport in OpenWrt on the
aforementioned devices.

I splitted the changes to my best knowledge, to simplify review. If
suggested, I might combine some of them for final merge.

--
Changelog

v5: - added more patches to fix further issues/do further cleanup
        - remove SMBus Quick support (not supported by hardware)
        - move setting SCL frequency to config_io
        - only set read message format (RD_MODE) once on probing
        - add check to avoid len = 0 being allowed as length
    - adjusted cover letter

v4: - fixed an incorrect check for number of channels which was already
      present in original code

v3: - narrowed vendor property per variant to be required only
      for RTL9310
    - narrowed usable child-node i2c addresses per variant
    - no changes to driver patches

v2: - Patch 1:
        - adjusted commit message
        - retained Tested-By and Reviewed-By from Chris Packham
    - Patch 2:
        - simplified check as suggested by Markus Stockhausen
        - fixed commit message
    - Patch 3 (all requested by Krzysztof):
        - use vendor property instead of generic
        - add front compatibles to make binding complete
        - fix commit message
    - reordered patches, dt-bindings patch now comes before its 'user'
    - properly add device-tree list and relevant maintainers to To/Cc

--

Jonas Jelonek (11):
  i2c: rtl9300: use regmap fields and API for registers
  i2c: rtl9300: fix channel number bound check
  dt-bindings: i2c: realtek,rtl9301-i2c: fix wording and typos
  i2c: rtl9300: rename internal sda_pin to sda_num
  i2c: rtl9300: check if xfer length is valid
  i2c: rtl9300: remove SMBus Quick operation support
  i2c: rtl9300: move setting SCL frequency to config_io
  i2c: rtl9300: do not set read mode on every transfer
  i2c: rtl9300: separate xfer configuration and execution
  dt-bindings: i2c: realtek,rtl9301-i2c: extend for RTL9310 support
  i2c: rtl9300: add support for RTL9310 I2C controller

 .../bindings/i2c/realtek,rtl9301-i2c.yaml     |  45 +-
 drivers/i2c/busses/i2c-rtl9300.c              | 477 +++++++++++-------
 2 files changed, 321 insertions(+), 201 deletions(-)


base-commit: 7e161a991ea71e6ec526abc8f40c6852ebe3d946
prerequisite-patch-id: 603f6da5f9ccbf40aa1e8247144e2413f676ef24
prerequisite-patch-id: 4328bb2802794cbd46f4952a22cbc73e022d0c12
prerequisite-patch-id: 90d8673eb6c9444937ea335ae8a934414e0a9ecd
prerequisite-patch-id: de876ceafb623d95a41af42b3e3dae7538023e33
prerequisite-patch-id: ecc2a415352d9ed09975b06b97b750b5182f4147
-- 
2.48.1


