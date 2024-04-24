Return-Path: <linux-i2c+bounces-3096-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB878B06A4
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 11:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B7531F21609
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 09:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D746E15A4B2;
	Wed, 24 Apr 2024 09:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zgd78pDZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492B5159207;
	Wed, 24 Apr 2024 09:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713952572; cv=none; b=Fq5qyo7ngdDhwSo1RKp7cTOuEefF+gbrIINxXrdFrEciTsgqyx8w6eVAWojkLZBhvaZaFhUrH3yEz6TTippdUoa9NwzijMNyatU/0DlUp6ZqbG0zYoSeAOrQ/R0HFJJJCfvMD+Q+Q0nWG7YWaaxqyC3JaAzcqrYT48OB9TIkF9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713952572; c=relaxed/simple;
	bh=MtFx1+EqOrECslXdwHjR5nOaxti3uqGZiS6XZ4MqKkk=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=Rh+BaIudbR3NW6bAvUDU6pVd0NF6Sdkk0KZG3fejgNHwX7dIFhsZZd+iiolSwwClubFy0PdPm9kVWOThVN/XmcYWKLtrVrDEut72R/ZgxOJN78ONvCglRXdKRQnVnssrVSJ6UBHSW70ZuVAf5Q+sZm/WRL5nUu/7oi1bSIkiprg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zgd78pDZ; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6eb82af305dso3753208a34.1;
        Wed, 24 Apr 2024 02:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713952570; x=1714557370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fxBElgRjRaymuIs1s+uM5vpwsj6dpLB783JzlXGXne0=;
        b=Zgd78pDZUm3CduvSJY3yGeWztVMsbemVDkm4EQQaYzxoP7iZXwY4InsvohqeaS/me+
         XTvNuaV8FGDBYrtRnqoZuGYBTEWzQoaPV5OKY7je0sdM0eX9uFDJuBKvFy0EoFZ557A6
         T84FIBaRvYbb86kovaciq5hGYOUorF0tugy+AYMPWMaNRwALl2Du7bjeuti8I71s26IW
         OnxGBkgLEwPiNfdJGe0eEgf8OCFsAtdszwsVmLD9pdEiGSEgMBX85B+Cg5YoJ36dbbMU
         hcvBWf0UH6BuqxWw05MBsrYN7m9GqUkw1d1NfTpFr62vWjt3tc07M2VwABUtfPzmpKit
         PkdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713952570; x=1714557370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fxBElgRjRaymuIs1s+uM5vpwsj6dpLB783JzlXGXne0=;
        b=fg+0l8A8AhOCzlRR9E5rYeNSKTddkQLYH499InRQAXsKdzjia7Wi90UwRBvFqWX1Gy
         DNOtkjKan8fUsoSsKHyqSz+H8qawKHOP3g2sMFXB2WwgAz3m6hC4GdR2j5cZXy1vizh1
         Vmc9on0J0za/1lbAQzpCmyLDPC03QtUgo7Nuecqdv4CST0ybPdjGPAG6/vnxaKecL737
         aRz/0qMXOQm7sdjlaDCW0xg+Mxmh1PQw+wlfcxYiy4uG/aaMKdxFwk10QnfX7M5IdxCN
         PN2qZtPlPkur93AGRzAZCdv3B+eGHOjmvx3asJWqZKYWHIdTGtIrGH/V7TQUI8iBI8dc
         303w==
X-Forwarded-Encrypted: i=1; AJvYcCUpjsu+zjMFzaNetITXXaq+BrsGxoe/NX+R/DV6EDVHDQ+Rk4YsO7hHbw8aSlp8ejUqDY/qHJ40uQa0y1QCKukZorbxmnm3z5jhixxw8lJ224KUha2MdHGmME9+1c3Zx0kCFsyGNloVGslkKzDjivLTc9TaVJ7JC4FdCSj4MS+XDFM1PN+BPMIxfESLH23j4psoh4/K98WyYfLJhbqK1lRITQm8FrZaABhlsSiGHlMpFCeaKZnuWdKDlKaz
X-Gm-Message-State: AOJu0YxDwRt7oQNaq1zGGCyBZXEGugTb/i0x2FZJ6iELMw8flKC5DG2W
	9x6rmLGmOm/VFvlmNx1LW3boKpTE2+u222XO2pUy+98wDy66dlbg
X-Google-Smtp-Source: AGHT+IEqAGrz0YivmPWI7Mpo+rJcEAwAQlYad+nAfnh88jP2bbpJnWoxWU2f3Pp0zdCZfvdEtRmM1Q==
X-Received: by 2002:a05:6871:8e8a:b0:22e:e1e5:b8d with SMTP id zq10-20020a0568718e8a00b0022ee1e50b8dmr1570608oab.51.1713952570183;
        Wed, 24 Apr 2024 02:56:10 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e380-6057-c341-626e-0f0b-b82d.emome-ip6.hinet.net. [2001:b400:e380:6057:c341:626e:f0b:b82d])
        by smtp.gmail.com with ESMTPSA id b19-20020a056a000a9300b006eae3aac040sm11042932pfl.31.2024.04.24.02.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 02:56:09 -0700 (PDT)
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
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Lukas Wunner <lukas@wunner.de>,
	Bjorn Helgaas <bhelgaas@google.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH v1 0/3] hwmon: (pmbus) Add support for Infineon XDP710
Date: Wed, 24 Apr 2024 17:55:56 +0800
Message-Id: <20240424095604.3425857-1-peteryin.openbmc@gmail.com>
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

v1
    - Add support for xdp710 hot-swap device from Infineon vendor
---
Peter Yin (3):
  hwmon: (pmbus) Add support for Infineon XDP710
  dt-bindings: hwmon: Add infineon xdp710 driver bindings
  Documentation: hwmon: Add infineon xdp710 driver

 .../devicetree/bindings/trivial-devices.yaml  |   2 +
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/xdp710.rst                |  83 ++++++++++
 drivers/hwmon/pmbus/Kconfig                   |   9 +
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/xdp710.c                  | 155 ++++++++++++++++++
 6 files changed, 251 insertions(+)
 create mode 100644 Documentation/hwmon/xdp710.rst
 create mode 100644 drivers/hwmon/pmbus/xdp710.c

-- 
2.25.1


