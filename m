Return-Path: <linux-i2c+bounces-4636-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AB292786A
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 16:32:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B5645B21AF9
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 14:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15BF91DFF8;
	Thu,  4 Jul 2024 14:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="C1FL2/By"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD921AE87B
	for <linux-i2c@vger.kernel.org>; Thu,  4 Jul 2024 14:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720103521; cv=none; b=dBuP4fslgrt/1Pziv7Vap5RrjaIUJDWAzRh5PSa434Q+qfDEnmHap+uLqDCTEKaqKqSrRf7BJ5q/c9mVn1adWFcXp2Ulx0kLz3vHqlwoWFcH4pLqjV1/V0RhwL8t+uiW4BAOUJ6QwKJSNHt+270pf/MwdDWZAAJJzHoP1n9DLU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720103521; c=relaxed/simple;
	bh=jTBQHrrwPJ7hkN25XtTLOnubWv4cUVtLBnENNqljAx0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DmHBaiRL0n3KA/JKtTQCFPlrn+32O8Ik/YUwypZMuV8UGV1b0N5OzrNGlGOkr2G6m2fZsSoIgRHV/5ag14mG2Eb9XF3edv1Pc7KHSKQ/lfb7/pkaZA7VqCLFRsSUvE4cheopVvSFAbrEqpEpQZcLad3LSFvIm7MppaENBVPEIcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=C1FL2/By; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52ea2ce7abaso276483e87.0
        for <linux-i2c@vger.kernel.org>; Thu, 04 Jul 2024 07:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720103518; x=1720708318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5NhqaUPaUf7BP0sBBsYRPCStsUyvFYmjk9x1Huz361A=;
        b=C1FL2/ByaJCC6Lid4S9PplrareAnDKcWjMBjF8yUO9kxkIdAnwVKqD4bJ42OtsKNm4
         k/jcjr2nVPPNrkiu3XiKlQTcjZz4V4UXyLr2P/XbjMxXGkoIJyGo4wBQ1p5QZa4X3VkR
         fQGAlADxnzHaYAFg4W2Gwrq7fHkpSWtLkPMH0GQ3gsHRhjLfVjX1VfbtKXJUprmlwfcT
         cP33q5miM0I7s4zTfw5M6X9eNr9+Mz9ARJG35GPbuTvd20wNLmOt4rbmiVk2RqyE5aI7
         OfsEIgTOuvwH7lpRy6vb1qRdJ5StfkzJRq4i+8Ffjlj9PCSrr71vlMofwKx2i8ccdfYl
         /UAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720103518; x=1720708318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5NhqaUPaUf7BP0sBBsYRPCStsUyvFYmjk9x1Huz361A=;
        b=d8ceX29W434Shrx4ZZpG4arcqNCwVxQmR1u7yQSOoq767M0UmvMhYn8mpiiZHYeY0D
         ymn1wqVxHMubS30NPIk19K6GPz3L702Fhka7AVrSy7tO18JggHNYpxITVEKFAQ0VVIGg
         mUMVRfAQo3I8b/c3A3vucfJjdaOz+EqbtL3pt4+r+2bM7wFWvG4T4rykdzhXXyz53uz5
         DDVKUqgiVzOf3qnUJbMYthRXQwHRt8XX2YuugL5GkFSfvIKO0OdsiR4YpXLIvBiyyI3A
         xKFUQ/47Ma9PoB48yYR2IeHEJ2S7GPvjMulU0e4XBVmMlXy9CSiOpEphi45Qnr/ncjAG
         512Q==
X-Gm-Message-State: AOJu0Yww3ISIf494Y5MqYedpbLcOYX0OkfXbPUOk1CdXvpvUZVrIlx2C
	+8N5TanVE4u/39MXawon9/YekyTgH3oQrlRjhiwVgn8wAl+Nem0sAaTKOAAR6Vg=
X-Google-Smtp-Source: AGHT+IGI03Z3uaki5ffx0gvPnmYIweIgyQtHrdxjOPmFp89B/VUhTTddX85DE8zIE3veI1DkGOhNgQ==
X-Received: by 2002:a19:6908:0:b0:52c:d27b:ddcb with SMTP id 2adb3069b0e04-52ea0619e74mr1545234e87.3.1720103517825;
        Thu, 04 Jul 2024 07:31:57 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a7bc:91b4:6b09:23cc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a2ca62bsm26793275e9.35.2024.07.04.07.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 07:31:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] at24: updates for v6.11-rc1
Date: Thu,  4 Jul 2024 16:31:48 +0200
Message-ID: <20240704143148.28950-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Wolfram,

Please pull the following set of updates for the upcoming merge window for
the at24 EEPROM driver. Changes are quite simple: we support two new EEPROM
models in the driver and document another model with a compatible fallback.
While at it: unify fallbacks for two existing compatibles.

Best Regards,
Bartosz Golaszewski

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/at24-updates-for-v6.11-rc1

for you to fetch changes up to 3a9ba4e32230df6c48cda1fd5cbca6facacc74c2:

  dt-bindings: eeprom: at24: Add compatible for ONSemi N24S64B (2024-07-03 11:57:52 +0200)

----------------------------------------------------------------
at24 updates for v6.11-rc1

- add support for two new Microchip models
- document even more new models in DT bindings (those use fallback
  compatibles so no code changes)

----------------------------------------------------------------
Andrei Simion (1):
      dt-bindings: eeprom: at24: Add Microchip 24AA025E48/24AA025E64

Claudiu Beznea (1):
      eeprom: at24: Add support for Microchip 24AA025E48/24AA025E64 EEPROMs

Frieder Schrempf (2):
      dt-bindings: eeprom: at24: Move compatible for Belling BL24C16A to proper place
      dt-bindings: eeprom: at24: Add compatible for ONSemi N24S64B

 Documentation/devicetree/bindings/eeprom/at24.yaml | 18 +++++++++++++-----
 drivers/misc/eeprom/at24.c                         |  8 ++++++++
 2 files changed, 21 insertions(+), 5 deletions(-)

