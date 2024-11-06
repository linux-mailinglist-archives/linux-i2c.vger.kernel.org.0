Return-Path: <linux-i2c+bounces-7823-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A669BE1E1
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 10:09:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C82F51C233F8
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 09:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF841DDA24;
	Wed,  6 Nov 2024 09:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="USxt7LX/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DFF1D7E26
	for <linux-i2c@vger.kernel.org>; Wed,  6 Nov 2024 09:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730883970; cv=none; b=tnVqckrGzdbBe4tqDv5fgKUVvhL+dY9og13eAhjUX8EHd0nUcHBL2m8iQPLgUypkXdmO5dBuOOr35CuIgsPfNkKXQuyo2VrnHCaLwEa4pyMf8hvz1KXG7KhmOUAyDBZfSOWNLMzjtQhxzzU2HHQr5MfFCybNokTuZ1oB9xwlmJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730883970; c=relaxed/simple;
	bh=wCNsj/YhUPOTcAwYS7IRRHiB2nJJUqJDNGaQijwOP5I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WnwjJJbblLOFw+UOJIWmxFvRZnhwqmv2RojL/aOlAB00aKWgY4osg4g0uejQhOxLeQZ64KZ01K40Go3MrHWuzOlNfDXtWHjbVbH/8sExiTRNwADBbO7u7tC/8mmeOZpnzJUBNhm1wiS/yElj1ZZlw1J+frMmXVPD5YQ8QHQyIeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=USxt7LX/; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37ec4e349f4so4185003f8f.0
        for <linux-i2c@vger.kernel.org>; Wed, 06 Nov 2024 01:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730883966; x=1731488766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VKsR0nCRVMzXmJdKOHnVcB0gZ1rkme9WtYFEznsN0js=;
        b=USxt7LX/dXPJ6ho8MZXO2WzuulUQM6v0gcBWYBuO1ip8wIuDTqcexPXO7/vr24i+/1
         qbHV3mw+K+jmmpwtPhF8IAEoj3gc53FSeYHUq3af7v8qWDx060QnxOUFAwUYmnXbmvng
         /NUgcuLogB4KF+QdW8UJo32BD3sBmflweVgqmizI/JiISlN753F7Rirh4oVt1JseGaIt
         Fv/3brLkT3KWM47VQn2kOTlgGaSExNBd6fhNM7JyCxPlhrDnezgLl+3XdQb6UHVS0q4s
         TqLCG7UnAfMBaqRIbuUES6Ptv3NdnhBXlV7kzAAH9+A40770NgVwc2zFdbGg3GDNAAOc
         tjgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730883966; x=1731488766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VKsR0nCRVMzXmJdKOHnVcB0gZ1rkme9WtYFEznsN0js=;
        b=NbIsklXCI8UnHjrEZ3iKXzAhB7zgg9P9eRu/4ELxwAN0Lbag6u0COlQhw6/SKCm65f
         OoHQIztdoMUSLX50F2tvr8eCJuASs7qCqJWU/fm+//kIaaDhkfi5wAtpl9g7GBLGVrC/
         s1iFCw8Vb+3Isby1A4cPGwz4f5mezMA7Egzqslp3+6Fzs6fAWaFqcTQd+d9A7V0YRVbA
         G/g1ZI27arFQrXWYYww3+UudQu9seU6rzMSsu8iNYxJFE8JaScSluBzpchU3uBLUNOsk
         L0DI8BGubDRm+UufnYkt132QgSn4ko2kSRBjc91vGxmCcAQ7iLUIePDTpXfXrjvbO+Xl
         CcBw==
X-Gm-Message-State: AOJu0YyW6NFLLjs93K8S1Vo1roGbz4/OTXRmF/XM9GYXTK+wiT3tan/v
	baI0Ba/ao+4L8BFHS6M4ZK1ogZnlIeZ7OwMmHVyvY1IlsvSugG0xyyYh/tnTgkGe5HJydiGXvA3
	6QEI=
X-Google-Smtp-Source: AGHT+IGckyqxYjON3F2j3KX7OE0vlKvlKeXlPUcHojgSCobRnLIFWlzeCDqNy6bNrPFWzfub0TzSTA==
X-Received: by 2002:a05:6000:a08:b0:37d:39df:8658 with SMTP id ffacd0b85a97d-381c7ac8985mr16884187f8f.58.1730883966490;
        Wed, 06 Nov 2024 01:06:06 -0800 (PST)
Received: from brgl-uxlite.. ([154.14.63.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10e7465sm18477203f8f.53.2024.11.06.01.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 01:06:06 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
X-Google-Original-From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org
Subject: [GIT PULL] at24 updates for v6.13-rc1
Date: Wed,  6 Nov 2024 10:05:59 +0100
Message-ID: <20241106090559.4907-1-bartosz.golaszewski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wolfram,

Please pull the following set of updates for the at24 driver for the next
merge window.

Thanks,
Bartosz

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/at24-updates-for-v6.13-rc1

for you to fetch changes up to 339cb28b9ee6679aea359620b0508170d815a1b1:

  eeprom: at24: add ST M24256E Additional Write lockable page support (2024-10-22 09:11:30 +0200)

----------------------------------------------------------------
at24 updates for v6.13-rc1

- add support for the lockable page on ST M24256E

----------------------------------------------------------------
Marek Vasut (2):
      dt-bindings: at24: add ST M24256E Additional Write lockable page support
      eeprom: at24: add ST M24256E Additional Write lockable page support

 Documentation/devicetree/bindings/eeprom/at24.yaml | 2 ++
 drivers/misc/eeprom/at24.c                         | 4 ++++
 2 files changed, 6 insertions(+)

