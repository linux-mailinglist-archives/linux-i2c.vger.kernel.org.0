Return-Path: <linux-i2c+bounces-12520-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90804B3D1D3
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Aug 2025 12:05:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46E8C3BC378
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Aug 2025 10:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6130224BBF0;
	Sun, 31 Aug 2025 10:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kumTkAHd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B37123F405;
	Sun, 31 Aug 2025 10:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756634722; cv=none; b=gIupoRBUfyGzHr2hacUjHEs7ZUJVA4uljtSozpyHliJcecFDfu8MEYuZAyLc/HzEhXdakjRio8kjGMaY3WSJfTFc2u9k9JYKP3aBmEPP+ZFRvYxq2cmTqCFM4PoWGLmtn9cB3Fo/66gEaBl20J+GBO1oWWzrPqrIto9n+FIvSX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756634722; c=relaxed/simple;
	bh=E4dQhFerXZ9PGlVhTLqM++GlfDLpeZLHAO9fLQqqTTw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gy9j+SbfTI6Dt4swNadHbqi+8+BhoKB8ek1MF2YTbwDV1yn9bN414y9MRyHNS7lpCCZ1OTaHOyDEf/W5FXrg2XSyv2buqpdaldjfQGGODVUGYwiBYLWTs+WurGalVSwf+XI495XOxRPeoGrUUtxp5ILXsXl2sHKZmti7HoOXr9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kumTkAHd; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3d44d734cabso411734f8f.3;
        Sun, 31 Aug 2025 03:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756634718; x=1757239518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gDThXQTj+5QtgF5xxPIAfQaAbHc07RhJdVzt/fhARug=;
        b=kumTkAHdez6kXVW0LEUBYfvEaXmAbQVgvXqTls3BBATsaf/KPJ3eO167d4p6I1g4TK
         O84zRMVqCpXLGJTrGvSeQHi1HLVD8yM65Ipbv/isYO9O6RvcZ/Ll+xUU66eQjuE3d3GH
         /HmEhShJgXw9EvQz/ivOzkV5vbRBPKRHJg5au9ocff1HTaAmSnHGya6tDlHI8m69iVDo
         /Nu2+dVwZCIXIPKnV2nYULuXUMZkvFEVqH0AFe1tMwCPcTZH9+heBxJ6IFkzdzgAK+Qy
         HwFDiCd6+/71XAfYGl6hY+at3TMtStsokVz/kG/9u/83BfIpqmgoXwShCUFvgf8iOJT/
         QwIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756634718; x=1757239518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gDThXQTj+5QtgF5xxPIAfQaAbHc07RhJdVzt/fhARug=;
        b=te/fcPTqRC+HljEVBmAyFVrWZ1umbkmtQYpMiGv6CwhG1pW1G+2iY71ihZn21ZsmSn
         qPzv4BR0m9Fb+j2bB+Y6aj3pwB0V0fbj8Gx6fwsGPtsYLukGfwEPgO9Cz8QF7phjTVGu
         taqK/IiGpjTRDeEbYYL6TPVRoexsfRLEf9GbJAMJSHzH38F4SzFQZAqF1mKJT9Ak62+G
         YqvOjyP6DWdsbcJXMHGHSMEgMgAeYAJcGB7gbnf7VfgaxSL2scrsE1+etX+cpCzLhbpF
         +KDxSa+oWatXV2p07R1aD74anBL2xLP70GRgoFqtJMeZNYFazoGw9FdcUc1mFCFWsL7O
         vHLw==
X-Forwarded-Encrypted: i=1; AJvYcCUIPSSiC1csg/AcghlNfuGXfWi/2LmydDnRGnC8ZCOFFYoQFAOwGdNwvGRya/cRZyeoQLnXaVd1wMSU9c9X@vger.kernel.org, AJvYcCVTBy/KeuGW+KwtSToKiIxWe1G2+PAWkp+/oHTq7YX0b1Z2flHDX2IvktmZMdlbrgvgp18GzTs8XvIA@vger.kernel.org
X-Gm-Message-State: AOJu0YwyAf60xqkrdDVLUQ+xI5BI/ub0S6S1OnUC7P2rbafJEtlGEk1W
	buPbP9VtEhpGbr5sQ1NFlaLymWJgPoovTXQFs8VkcR3nAIGGYx5LPuDp
X-Gm-Gg: ASbGncuONOOKByFGv4yCHrwTGktC3EHtOWOSxv3arRYs6JP92fGcQswZDAL1pP+SOkX
	+/qLZogbCjPEvwBGxIi4Atpal3JDnSmZ3OOj8Mqcd1hsOgjfnIqhmK1lIn4VgxlhwQohQAAAenp
	WyuyPYvbFrzW7wG/Qxb2p8NkNaaMxRp4qK+irZM1K8r8ZCnOFocmpv5I45rcwzr2013ijSq0Gh0
	M4IZ+o7i9eovJOsYGLEr7JFE0qDmATl7U55PLRRT8pVjfqNgx7EOe9V8iATzTWgWMSngIsXMaUr
	bdW9xK2vRS1eCMcBZH8HrLXVQu2Eq0vBslDeR1WLybVVs+wSBb0Zijh+ei2PjtxCb3n998z/mFN
	XlhWAIaRBhhOG18V2VVK2Li4/bqUCEzFfCCzhHAn5QwxYKVfycRy7hPPv8tEiavg=
X-Google-Smtp-Source: AGHT+IF9MQnvymX2UBcPqmvq6WnxuskdWJziDDwgzIHwI92cjwq7fVsB3tPWu9GZWiJ/0/eRrIUtTA==
X-Received: by 2002:a05:6000:459d:b0:3d6:1dee:3d9a with SMTP id ffacd0b85a97d-3d61dee410cmr195422f8f.19.1756634718202;
        Sun, 31 Aug 2025 03:05:18 -0700 (PDT)
Received: from builder.. (39-10-142-46.pool.kielnet.net. [46.142.10.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e68c83asm117505565e9.20.2025.08.31.03.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 03:05:17 -0700 (PDT)
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
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH v7 00/12] i2c: fix, rework and extend RTL9300 I2C driver
Date: Sun, 31 Aug 2025 10:04:45 +0000
Message-ID: <20250831100457.3114-1-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series for the RTL9300 I2C driver:
    - fixes issues, one of them in some cases causing data corruption
    - reworks significant parts of the current implementation
    - add support for the (quite similar) RTL9310 series

Goal of this is to fix critical issues, improve overall code quality and
simplify maintainance and further extension of the driver. Moreover, it
should be brought on par feature-wise with OpenWrt's downstream driver
to be able to drop the downstream version.

The first three patches address bugs in the current implementation, on
of them being critical and causing data corruption under certain
circumstances. Although the hardware doesn't support SMBus Quick Write,
the driver claims to support it with a broken implementation. This
causes to execute a 16-byte Write instead of a Quick Write, e.g. causing
corruption on not-write-protected SFP EEPROMs and soft-bricking them.
These three patches are also sent to 'stable' because they fix critical
issues.

Subsequent patches introduce various smaller and bigger enhancements.
These include:
    - use regmap_field + its API instead of macros + GENMASK + shifts
    - refactor xfer handling
    - variable renaming to avoid confusion
    - move some register operations, calling them somewhere else and
      less frequently
    - use guarded mutex instead of explicit mutex_lock/_unlock to
      simplify control flow

Finally, the last two patches add support for RTL9310 (mango) series to
the driver and adjust the dt-bindings accordingly.

Simple operations have been tested successfully on:
    - Zyxel XGS1210-12 (RTL9302B)
    - TP-Link TL-ST1008F v2.0 (RTL9303)
    - Netgear MS510TXM (RTL9313)

with Byte-Read, Word-Read and I2C-Block-Read. Other operations need
testing from people with devices available.

Compile-tested with Linux, run-tested as backport in OpenWrt on the
aforementioned devices.

--
Changelog

v7: - included given Tested-By and Reviewed-By from Chris Packham and
      Markus Stockhausen accordingly
        - except for Chris' Tested-By on RTL9310 since he only tested
	  on RTL9302C
    - fixed typo as mentioned by Markuf Elfring

v6: - patch 'i2c: rtl9300: check if xfer length is valid'
        - renamed to 'ensure data length is within supported range'
        - added I2C quirk for zero length as suggested by Wolfram Sang
    - reordered patches to have backport-worthy fixes first and
      enhancements/others after
        - patches 'fix channel number bound check', 'check if xfer
          length is valid' and 'remove SMBus Quick operation support'
          were moved before all others
        - added CC: stable to first three patches
    - fixed commit message of 'dt-bindings: i2c: realtek,rtl9301-i2c:
      extend for RTL9310 support'
    - added a patch to use guard(mutex) instead of explicit lock/unlock
      as suggested by Markus Elfring
    - added Reviewed-by: Rob Herring ... to dt-bindings patches
    - added Tested-by: Sven Eckelmann ... to all patches (except the
      new patch in this version)

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
Jonas Jelonek (12):
  i2c: rtl9300: fix channel number bound check
  i2c: rtl9300: ensure data length is within supported range
  i2c: rtl9300: remove broken SMBus Quick operation support
  i2c: rtl9300: use regmap fields and API for registers
  dt-bindings: i2c: realtek,rtl9301-i2c: fix wording and typos
  i2c: rtl9300: rename internal sda_pin to sda_num
  i2c: rtl9300: move setting SCL frequency to config_io
  i2c: rtl9300: do not set read mode on every transfer
  i2c: rtl9300: separate xfer configuration and execution
  i2c: rtl9300: use scoped guard instead of explicit lock/unlock
  dt-bindings: i2c: realtek,rtl9301-i2c: extend for RTL9310 support
  i2c: rtl9300: add support for RTL9310 I2C controller

 .../bindings/i2c/realtek,rtl9301-i2c.yaml     |  45 +-
 drivers/i2c/busses/i2c-rtl9300.c              | 488 ++++++++++--------
 2 files changed, 325 insertions(+), 208 deletions(-)


base-commit: 57774430864b721082b9bafd17fc839f31251c7b
-- 
2.48.1


