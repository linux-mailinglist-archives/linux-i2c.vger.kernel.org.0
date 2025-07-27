Return-Path: <linux-i2c+bounces-12045-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB259B12F5B
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Jul 2025 13:48:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA9AA1898A3A
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Jul 2025 11:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47091E2838;
	Sun, 27 Jul 2025 11:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JpIgKpNu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D620B1F95C;
	Sun, 27 Jul 2025 11:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753616888; cv=none; b=sTQ/5fKcW5I7ZUkBa3sxO6358A65+Wt6v58YE1dLtpr0WN3bGVD224mWhZwawDNyqDCCa2BDyFRtc36WDlQ+09C0VvhbT2VgijIGP8rScNE60Q3XqnsZQjueXxHLsvNj87IEjjeJry7yYDs9uDgtCWZo7AgD63g2aDCq+7I66Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753616888; c=relaxed/simple;
	bh=l5mXWPkCVwawwX9SoiL1xL8eaODLJelNHat8jR0vFJI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sAweXbIutdvbsj0f7kSC7ZHH/ak5f9nPfwfZVc1ZY+S6t9lny/McRdlEqL2zgFHzlKnmSWJvxC5EZhMIyC72WmEtb73NOEOCu4Lsr1fexTFbJ24tx1e5+TuqRl3+CNB1NtIh5ZcOeBlANTbt+RbO7W0yBYNUglWJ3TC5mxu3dlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JpIgKpNu; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b7746135acso1405317f8f.2;
        Sun, 27 Jul 2025 04:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753616885; x=1754221685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sMQBpNZSUQDy6K65ntO3bsCKa6J7GqRvgZAdyhi1X/0=;
        b=JpIgKpNunSDD/ulNHpuP13491bopq/ooT0MUjJ1K5YXLBYIm9jtmyD8kDUcWmLzwbx
         eAh8i4H3w8DDBVDI+aDonvIzarcyrRZuhwG0kcfuiXM+xYoO/84OnAtF/tDJmVl+xB1B
         wQdnHGWKRKE6EtD7Gmn9x5DHs8v80qGBK20MH6EZ0zwymMxZOUV4VQ2sNCBUlCbexuym
         kSEXr2NCaeE5N+uWtkcfqnsF2kqESoWPvRBqZyY7yhANs28v6QiRLfw72d6ADMzjSSqG
         BB25kRedTxPEn09Ipi3ORwdB9ZJLQ/qRA2CNcYZbtQjV/fq1PhPZS3wi/VLSEm9GnP/d
         a1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753616885; x=1754221685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sMQBpNZSUQDy6K65ntO3bsCKa6J7GqRvgZAdyhi1X/0=;
        b=xGf8/0u9iRkE3+uPk+nus3xztpv0SP7hrYiCyfK7/yW6bcm+RpFyjRAybEItRQyx2Z
         pfF5LpNQT4rtFb28JlnY3mclC7wBKnh9Ppbl9IuEw4oUYRzHyydN/IEAt1i4Vh280R/I
         S5iJMe7uitACIPyUsfAqpdMS+/JIp3nQCyr5w7HhKzrqzMNrfTUPvfXTh2T9Qj/2vT4P
         8wzY9loZnWERkMZGrQN98wlnLGO0JF0CEHBX1AkYuiVmVsAXIwx1jUYQdhOpRuXjApSz
         mV9C+qatro5stQ3WEQH8D71gjuJxtMOucwLlcvHo+0TmeKV7XL62ap4KY2Hof2jOW4KR
         BCyg==
X-Forwarded-Encrypted: i=1; AJvYcCWnu2PrwTVsMG0hNnALRil4Cq46JkA6cuBxHGsXPKUjZIZt2cWADiA8c/mo9b8GQGAL628Gd212eH14RCGw@vger.kernel.org, AJvYcCWobwYjFPFHvib7qz3HOeizQUf7OCDCH5Dr+wzXfpmUMjzvhLEFGQJPJR/yPP3wGINSGZSod92h2cen@vger.kernel.org
X-Gm-Message-State: AOJu0YzI9yhX0R57YaYc0vwQpsCBXm944dRxuMJgVC4+t0Wj9xkZ7IO5
	naQO8qNHZOMXB8c1u5tPqNaKnue8fEV2n8n4vuyIY4Kg0I/z0y6EcNihO2TWuw==
X-Gm-Gg: ASbGncsgt+TzdxtsIEe01wdtDfWJ+P5kdxClco3U1kG2dNCJuItKk0v2jffzi85ruha
	/O3gGkJfW1jQ4Efnp+Q5+S+Yc5CG24EMnUu7hnXxAjBPmXUq9K+Roueoz/YQRE/OS+T4mQkEQ62
	IcI0wq8hih6jNe0kQxWO7eS3a0sYIeiHJr+j7ntC4kseUj3xa6cDafMPkSLMraYiIUOiHZHLwut
	kqr9IWX+DYZPtdyQjOl/3AkXSo19nmBcJouYjX6fOahxnbc8ZuDDix6rGyQ/s7WCF9jttaWjr0h
	6jNeEs0YT+W5JPKMxQCeU6tKT9Eg+eq0FtI35NQb1xy/uuv8Ul1QbzXk9/6k0lILRGa647cCk4y
	Hf/nqxju3999WMpCXeiDAWXFDPXnHkxfz8IkQ3sH5BGNOlFa65Dssa6w=
X-Google-Smtp-Source: AGHT+IEoZoh1zX9m/SWxq30NR8WQw/WsE6JtkdMRskPgD3woMffROYsKSaIBHJZqb9xFWYdqeRj8hQ==
X-Received: by 2002:a05:6000:381:b0:3a8:2f65:3745 with SMTP id ffacd0b85a97d-3b7766764admr6113621f8f.51.1753616884868;
        Sun, 27 Jul 2025 04:48:04 -0700 (PDT)
Received: from builder.. (190-11-142-46.pool.kielnet.net. [46.142.11.190])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b778eb284fsm5621555f8f.12.2025.07.27.04.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 04:48:04 -0700 (PDT)
From: Jonas Jelonek <jelonek.jonas@gmail.com>
To: linux-i2c@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>,
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH v3 0/3] i2c: rework and extend RTL9300 I2C driver
Date: Sun, 27 Jul 2025 11:47:57 +0000
Message-ID: <20250727114800.3046-1-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series reworks the current implementation of the driver for
I2C controller integrated into RTL9300 SoCs to simplify support
extension, and adds support for the RTL9310 series.
Goal of this is to have RTL9310 support upstream in a proper
implementation to be able to drop downstream versions of this driver.

The first patch reworks the driver to use more of the regmap API.
Instead of using macros, all registers are defined as reg_field and
operations on these registers are performed using regmap_field and the
corresponding API. This simplifies adding support for further chip
families and avoids potential redundant code by just providing
chip-specific functions for every chip family.

The second patch extends the existing dt-bindings of RTL9300 for RTL9310
support.

The third patch makes use of previous changes by adding support for the
RTL9310 series, providing the correct register definitions and a few
specifics. This also uses a new vendor dt-property which was added by
the second patch to properly manage the I2C controllers. Having this
property is necessary to properly describe the hardware and allow the
driver to correctly work with the I2C controllers.

Both has been tested successfully on RTL9302B-based Zyxel XGS1210-12
and RTL9313-based Netgear MS510TXM.

Compile-tested with Linux, run-tested as backport in OpenWrt on the
aforementioned devices.

--
Changelog

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

Jonas Jelonek (3):
  i2c: rework RTL9300 I2C controller driver
  dt-bindings: i2c: realtek,rtl9301-i2c: extend for RTL9310 support
  i2c: add RTL9310 support to RTL9300 I2C controller driver

 .../bindings/i2c/realtek,rtl9301-i2c.yaml     |  58 ++++-
 drivers/i2c/busses/i2c-rtl9300.c              | 231 +++++++++++++-----
 2 files changed, 218 insertions(+), 71 deletions(-)

-- 
2.48.1


