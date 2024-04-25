Return-Path: <linux-i2c+bounces-3142-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C90F8B20CD
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 13:58:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3748D289A74
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 11:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC18C12AAEC;
	Thu, 25 Apr 2024 11:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lcAHyaS+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A523012AACB
	for <linux-i2c@vger.kernel.org>; Thu, 25 Apr 2024 11:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714046332; cv=none; b=QRy/vgj6S2flvqmzdSfEwNQw66j2uVrI5Gj/2Eo0QYO7F1hzau32Zcpnj1vGF5EbiP1HKOZOY9FjORZ5fjW3ahkHmPtt9OFNj74GC+m+x0F597KKj9j/ZrYRDbSNiQl316W6HQly/fGk/TJU7aYA1wUH62rEUgysdqtSBE9TxmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714046332; c=relaxed/simple;
	bh=sONgGESMNeVONuj82l8tZ4PzED781jENmB15zqmUHLA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GZGe8+Bm63RWyoDeTx9XAXmllD/l0Hl5bfKr0mtZ0xo4MoiFkY+py1CNR06p6shTPF7n+Es8b+JH347ICT3YAsYmcZXsjbH30sHd/gtool5TgFilot8cTAtSuhG/Qrk+hpncar3Z1FXJ8V/WE7JRD75KGEGm3IVFx68gpwUvKKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lcAHyaS+; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-343d7ff2350so722054f8f.0
        for <linux-i2c@vger.kernel.org>; Thu, 25 Apr 2024 04:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1714046329; x=1714651129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dhma2yfH5SZBe3kEN00FTKI6hl2Mzri7rVoXIq1fbco=;
        b=lcAHyaS+5kMeRKtm6KUP8e090+b8dPbMlvowBD0/RHv+3IYZpkalDQnHQtCB3c6VHt
         7TUCnqGKd0NT8wMSgUvEiWA8qORtWz6Mf2WriidA/c5+Upnt/pKVVaeHy93HdTZQFBtT
         192+uf+8je2LtEaqQeSKYjTqbAcOyzViXDQz11yLVh2mlTwf+aRbrhSPQSHGhbL0QTry
         esq7dMcnoclxLPRtvrYFdZtFAt/xn7g8bbcEafQk2o884H8i6LkLEPGsOshcgP99Xdi3
         NbupPjyZM7/tVJEsUsBRVtZ+WEF9H9HOhZoHGgZU/nUMAQTz+QivIWyCEDatAM2iBJmF
         rzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714046329; x=1714651129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dhma2yfH5SZBe3kEN00FTKI6hl2Mzri7rVoXIq1fbco=;
        b=pnjUAESYoGYKlQThYjBkkYISe6bVI7Ki+j0wvZjmmzghhQOnmbowuyqB6WI9le+EVt
         ql4xC6JdapAZQ0HUHpP9IvTIVXqLIHx+zudQicdDmG2fgF8lP93yO9fG6jR95vonIlDe
         pSn2O5wv6b6vr2IKCQJQAuC1x4cd/AxhU++umS+6ildhPu1hvisHmzmoovTdTMWfgqAT
         8MHWMgyGvJ6LltaF6nkvIxAMSATSL/wPaC6/TfnOy2EyZds+xWh0gtZacoiCzSGXWxMs
         nUftn7nsdMFuQX2/HGj3y1c41f5EddfQ6/m4DFH9z1h+X9gdZsPjWnkl43WfNDfkPd2Z
         M8hQ==
X-Gm-Message-State: AOJu0Yx4naqlmR5y2pBOV8EBwS1jHm5wCH/3frW9/iFvjXWxLDxAxih2
	UGoTJ8z47cvuQOeZZGANnXMGUH8FNFZuCTaxGnxl70nW8mZHkmLZUxuH2iC2Wfs=
X-Google-Smtp-Source: AGHT+IEEOx2OLIjWO5R6O3FeFhGyBOR3L8ZL2PJPnKQcizSgHv5OHZIZbw02BCUHyZow4yTHKLDg9A==
X-Received: by 2002:adf:f18f:0:b0:347:2055:f49e with SMTP id h15-20020adff18f000000b003472055f49emr3726719wro.33.1714046328774;
        Thu, 25 Apr 2024 04:58:48 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:c52d:c46:dfa4:8b2])
        by smtp.gmail.com with ESMTPSA id d18-20020adffbd2000000b0034b2141dcb3sm9823359wrs.75.2024.04.25.04.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 04:58:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] at24: fixes for v6.9-rc6
Date: Thu, 25 Apr 2024 13:58:47 +0200
Message-Id: <20240425115847.18359-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Wolfram,

Please pull the following set of fixes for the next RC.

Thanks,
Bartosz

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/at24-fixes-for-v6.9-rc6

for you to fetch changes up to f42c97027fb75776e2e9358d16bf4a99aeb04cf2:

  eeprom: at24: fix memory corruption race condition (2024-04-23 10:07:48 +0200)

----------------------------------------------------------------
at24 fixes for v6.9-rc6

- move the nvmem registration after the test one-byte read to improve the
  situation with a race condition in nvmem
- fix the DT schema for ST M24C64-D

----------------------------------------------------------------
Daniel Okazaki (1):
      eeprom: at24: fix memory corruption race condition

Rob Herring (1):
      dt-bindings: eeprom: at24: Fix ST M24C64-D compatible schema

 Documentation/devicetree/bindings/eeprom/at24.yaml |  5 +----
 drivers/misc/eeprom/at24.c                         | 18 +++++++++---------
 2 files changed, 10 insertions(+), 13 deletions(-)

