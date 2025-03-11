Return-Path: <linux-i2c+bounces-9776-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA60A5BFC8
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Mar 2025 12:52:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 041063ABD51
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Mar 2025 11:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B68B254842;
	Tue, 11 Mar 2025 11:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BwS9qSvY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC1924169E
	for <linux-i2c@vger.kernel.org>; Tue, 11 Mar 2025 11:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741693964; cv=none; b=BZXDg7yvlHIldDMpxSVw22eOhpDdqbGwgolBSFZpSCUTnBenviKvtTnrOB8leNmTHiiWFTjagdQSKtiGg57yOIJd0EU2MqtfPvBfckh/DerIzgG2497NZMqfA8dR/5QqJjx35bAS7GxLUcNz/0GUuyEpLR3Eh9eQotonHwjDSR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741693964; c=relaxed/simple;
	bh=YQJdb6+l+Fy6Eeqo/YYTMaPtDfdMMRzp1IEcWxSGfXE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WSiJWZKD9zL+G3iUGP9l/8kIhnjm72zMMQfM4J42qCqpLXXn/Eovocif5C6vjpU4LdtQEkKMRqTUyYH+tR1ixyTNO9JkB3pkxH3z+mSKSdpRYG9FIMGho9hwFrcfyAbhXuUrd0H2pbeFR3NOEP9jOS3D4nB8IFIgbykvU86+5Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BwS9qSvY; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3913fdd0120so1614585f8f.0
        for <linux-i2c@vger.kernel.org>; Tue, 11 Mar 2025 04:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741693961; x=1742298761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Glf0KyQ2GM0KL645M/kOhQowIcBTKc+oCES69shUQA=;
        b=BwS9qSvY+VXeDy8n80AHfmI1AAKeqKFyEYgNyokRADu5msS049zZc0kRKioYJkSKmU
         +EzTt4IsSi39LVx24KAhkLdGPZ3KLFrYs3/P9LOBZN4r+xqzh17JJkhpKOjfpPC4Hijg
         NtXQjrn8Ga4O3nRV7klw3XNa36aEjswDY3YJbDyF4+4Zc8/6WnjfGVbcSq9TbkNtZHFT
         WJ+eGmtUArUSA3CMRacVfOy0He1mDXIVeD4VakNRU+ikPO1HY4OmwgZHO16HgH6izFOM
         Y/OajyyZcHE1aVeOkbyYNm6gbvVASUueLu5wiaf4uVNFWnjqN+xqWnGzyCUlf7LHuF+Y
         QYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741693961; x=1742298761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Glf0KyQ2GM0KL645M/kOhQowIcBTKc+oCES69shUQA=;
        b=P/xi3DoSTaXm1BYXLBKASwyPTBNK33vgCR0usypclHfRILp4G1ilvgAFnOOCNC37Ro
         JLKkOyh5Qpl7bohUcZdamcTDZglh4RBoEMyUj1PrGOBtz0FxDtjJu9WOjfa2NyZo9DjW
         KW7+QK0gdcMQjd1KkaNgFREOMYMp1af1NxJKaobKO4p9v1XrCcV/IZfJJZzL7IjamHFw
         xsQGxBATnG18EJau4n3qUzc2K+72SGPnk4JNhK2d5HGUhhBa2683s+rEgE6RhedGyOZ+
         N1w7qzRTcpggvnnO+bQL17XlOIYDRSwx7leo7SEVChE5Wes+CLeb1RAlr5LbuwbDM99g
         Oafw==
X-Gm-Message-State: AOJu0YxiievFFkSM6mWidWl7hhFOkRF9MZ/RbTwAX754dLjHBVrwgLk4
	tiwbyPjEV8u3nP/XQy2XLSGjz9jAjvfaw9ACKMcmTYwN4VAElnh0HFMdzJFO0b8=
X-Gm-Gg: ASbGncvfN7tz0E/xUiR687TQIif5oj/kfNGVeK7QJdPXMdiNxIq/0EDaSstAQ00mwGg
	CTvzjv/UjANRgXsg8QFQXq/AXVjfjJ8kLwvTBVgwwMWDhjP8bNgAG7/X5pXAJOWsoDsvlSW4bWH
	6HB68YuIlAGbRjvYkOZB00QIqPbCFEMwp5nd/gdMcW3JqzQvsFwPZcufBFhanSStx9nl+3cRiF4
	MTy8+EmSDHawaGLsghRpgHSjYfMLEgcnGGG0qEC8Czg3eR9lKAphYTBaNjYnpN8AJkeyewaJp3V
	pTKCmEFpk2+5/VDxxV4588x0GfymdeKr2Y2a92jZyleRSAlBxOvwh+yYlK28OC5NMA==
X-Google-Smtp-Source: AGHT+IEQzzut8xri3vaH16DqJeNAqoCBWRkStCjI6a3MKRCvYBaSCGpbK8g9y219rhHM0dzdlkDa+w==
X-Received: by 2002:a5d:5f45:0:b0:390:f832:383f with SMTP id ffacd0b85a97d-39132d05b37mr13065989f8f.2.1741693960947;
        Tue, 11 Mar 2025 04:52:40 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:5946:3143:114d:3f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c1037bfsm17930443f8f.96.2025.03.11.04.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 04:52:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
X-Google-Original-From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] at24 updates for v6.15-rc1
Date: Tue, 11 Mar 2025 12:52:37 +0100
Message-ID: <20250311115237.39627-1-bartosz.golaszewski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wolfram,

Please pull the following set of updates for the AT24 driver for the
upcoming merge window.

Thanks,
Bartosz

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/at24-updates-for-v6.15-rc1

for you to fetch changes up to f25f405d250fdc7e2e67be8d1732cbbc7cd782d0:

  eeprom: at24: Drop of_match_ptr() and ACPI_PTR() protections (2025-03-03 12:08:24 +0100)

----------------------------------------------------------------
at24 updates for v6.15-rc1

- add two new compatible entries to the DT binding document
- drop of_match_ptr() and ACPI_PTR() macros

----------------------------------------------------------------
Andy Shevchenko (1):
      eeprom: at24: Drop of_match_ptr() and ACPI_PTR() protections

Danila Tikhonov (2):
      dt-bindings: eeprom: at24: Add compatible for Puya P24C64F
      dt-bindings: eeprom: at24: Add compatible for Giantec GT24P128E

 Documentation/devicetree/bindings/eeprom/at24.yaml |  5 ++++-
 drivers/misc/eeprom/at24.c                         | 10 ++++------
 2 files changed, 8 insertions(+), 7 deletions(-)

