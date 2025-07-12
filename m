Return-Path: <linux-i2c+bounces-11918-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E18DB02CA7
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Jul 2025 21:43:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 414CF7B6999
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Jul 2025 19:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 867CB28D8F7;
	Sat, 12 Jul 2025 19:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BzaiWGNg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF8C18D;
	Sat, 12 Jul 2025 19:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752349404; cv=none; b=BspI4UvBQUkX7+yqvVVP5f2xQQkZyq5exQ7xQ542jIBvV+hSvvjuD9Pct51s/z1D9OaxiNhTK79AJg4nHfvNdP0JY32HtvrFTHUT4hsgDSmnJQ70FmS3yxnYFBdDZ/xpRgI34iu6MBVBEHW98gec7sreIp5MSwMXFXlR03MTV9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752349404; c=relaxed/simple;
	bh=qgoSlcEfHPXxIG5r6WfthbCStc0ch6nPvvHnDxAC7jA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dc9emg/eMV0BCDb3K09cTo94ba5nijLfAER0qBX0/k+gRZgbeLVWymV9yOZe0Vba/omr6dnvEn/O1E/whcHOCG8bvwuTN8aTGpdOAOC27LgBEE+529gJbvj2Ahm+I71bvofNYfZFZ60W2NkDYmlm/tlVL7lfMn9Egbhu2bQ+1xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BzaiWGNg; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4560cdf235cso2818345e9.1;
        Sat, 12 Jul 2025 12:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752349401; x=1752954201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nJRjGT347eE5KHYXkVnH2zDF7kOBoPVWDF2wyG/7/ms=;
        b=BzaiWGNgyH6KV3VRsEdbnr18kCrcA/ChB6LXEitWoMPg1/PoHEh1NEp+HGNFR9G3EQ
         P7m/6qSwXkbRi/jsOnVJgZtYbj0RnuFzPxpD5ClDxAJFBat+fdSD0oN/yZF/LXH1gIRM
         vcN+0/mh4CnLSmFjpbARSOa5MPOZnajkXr8CYKweWJPWjsx/bXAx7XazvvFKc91Tpnho
         LqAKSPraVyxlYFRZZLFAvC9Ryt0mJ/SnAC0gTqYODtWcd9fZLonBcUy2fiOLCYuNrgYV
         slEsuFB7UoYrHOZI5aYVZ7fS1uPEn79XmCf8r50PlaF6WaFHUmwUKveJNOwpAv01mm8B
         z2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752349401; x=1752954201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nJRjGT347eE5KHYXkVnH2zDF7kOBoPVWDF2wyG/7/ms=;
        b=lU+LSrub/witAbSp7wUZe8ISCVxH7qj+SSCOMUrifEwMVmPyHWtiQRBG9qGzYCJSLa
         BW+iiCUlgEu4dPp1pCSOtNflydC4LC60nfEM4OKtRp6IHEiT9gSfRX8r0A3ODny6lJss
         FPdBXwgAXeC7fhrazjA7GclP8XTzZZscXeocidBbS1JB2f8Q6CVUqlcnfTAhm0kV+vNW
         EBENPvAWydDlFG/cqdgP/3IMVzTgWmdMN9fj39+tAOWMtqEpix2QFBwkWqVRfonR9LRk
         lYjEz1M5Y3VQe5Wz4Y7moOjPjr7FHmVj+QUUSfOW5ct2f5JcVNyPN/TCZX6D6x9XGY4s
         ksAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkHTOfVXZE88Xyz5SxJ2fXm2YBW5pvg2WxUlpABM8HulcAhaoueyUx+H7LcPhFd+RVDV5MxIDoGTaA@vger.kernel.org, AJvYcCXpNqhAVmCvAzGg9XchZ+ib4OaFT7xQ2vo06iWsF8Rr/OHK5N/emnOfeiMNcSgCFYn5TeRTzLEK7oL91MSM@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhr8wkd4ezPdht2BxyP1iDQZRUSUPwf0SQumzgRh3Hjufj2L2m
	6XHFIBaUm8IvvAN12OzKYjqkYki6D7KnHVlD7+e9Y8DPyFq2qCQNp/1V0x3K8A==
X-Gm-Gg: ASbGncvq8pHCqI//+9D3Kk08yetzNczRLW0Osh1WIpruBxPysvO0b8brvzwOJ3bKEEv
	aCjUUImwMWzCEkKVGOXnYtKpuYV7iGy46G36IeXjbOMopOaZ0/DPlrpu5MJJQUFjMD+CnRWgBHw
	jwl1+HeacYTqsL/NIdnBweP6RjgERvT3g4khNnTW6JyvrgYBtVo7ndyoX3a2cAGhB7qKmAaiuW5
	KOOYZkDoY0A62TdATozt08gM9BlxEHAz8MBG/EGH8TyNZiJquNjTWHi3ljCjLiAD193LUeEW28j
	CQUhEKvhiXlvgkIIKq1BuDVgzPwYvWdSjgk4bedUlZAdYags5GQ2G7exztzoBMTgoQ+DFLE+ONg
	qOinLxr6VfyJKPqQ8FiCfMaXEhRu/aOs+JirxAPS8uSsUIX44zkjM
X-Google-Smtp-Source: AGHT+IHyzB046cNg4vvzKYKydglWXcjAX67CtqrS9ojzsFlwo89yMGOaOMMMQXtJE83lj+53alBvvA==
X-Received: by 2002:a05:600c:c116:b0:453:6424:48a2 with SMTP id 5b1f17b1804b1-45576a7e0f5mr68036745e9.10.1752349400602;
        Sat, 12 Jul 2025 12:43:20 -0700 (PDT)
Received: from builder.. (246-9-142-46.pool.kielnet.net. [46.142.9.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d5032e9esm123422335e9.3.2025.07.12.12.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 12:43:20 -0700 (PDT)
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
Subject: [PATCH v2 0/3] i2c: rework and extend RTL9300 I2C driver
Date: Sat, 12 Jul 2025 19:42:52 +0000
Message-ID: <20250712194255.7022-1-jelonek.jonas@gmail.com>
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

 .../bindings/i2c/realtek,rtl9301-i2c.yaml     |  38 ++-
 drivers/i2c/busses/i2c-rtl9300.c              | 231 +++++++++++++-----
 2 files changed, 199 insertions(+), 70 deletions(-)

-- 
2.48.1


