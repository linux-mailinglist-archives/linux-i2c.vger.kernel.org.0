Return-Path: <linux-i2c+bounces-9040-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE95A0B0BE
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 09:13:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0D063A39C1
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 08:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BAC6232786;
	Mon, 13 Jan 2025 08:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vkLWJOeO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8AA3C1F
	for <linux-i2c@vger.kernel.org>; Mon, 13 Jan 2025 08:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736756012; cv=none; b=HHdf27A4Ug7ddlux1+4NEOv1OHpo7jmxvMPwZEe78e7X4CzjQpC+GWZM145fDwEj907XzO8OewLGz/kdGcmauMwmwMGsTANwVleJgeMvlqq+kknasRqIPdHwCT+/mPPMwR+mNDXpmVFjmNhucTGE2RYq3AozxhBxld1Ex2oDvn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736756012; c=relaxed/simple;
	bh=cTanNuMLVoTpoDbK/GJtkGmgBRajrRpeisf5cEO/HeU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=te0rWA08v/MtERWm2/0FxTvBqA3DEJNuPIqRxTam84uJddXLAnU7iHFb8q/PlMGGYQ9Mm5U9hEgIvlXueUbrMO8VEq0MAMsiCwC+yWqJa9Ia7IY3mak/UgfuVx7thmqhq12SQs44x02sKpfdc9IDiZagfgYnWiSzAEKx0PnHnEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vkLWJOeO; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-436637e8c8dso42027555e9.1
        for <linux-i2c@vger.kernel.org>; Mon, 13 Jan 2025 00:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1736756009; x=1737360809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IKUBewWkhBE4h6KEbMwZWuoAhwv+Xi80TXPgHOk2ye0=;
        b=vkLWJOeOTcL6NA5saF0RHInGdWN36owFckfIWMNV9wHih6L2DKvgSzat9Fs+7chW5a
         oIZ8cflQeDREYDuCGFHaKJfOQD5kBiPJdgJ2GEIYeKkalk6EoSbG4hzSkAeFJj96Gd2/
         unUfZHzTTrraZNhM8dFyP3E+rarFtUsoF3ZCNV8ZC5i2DCIm60sHQ0JMF7wBvwthQggz
         YYuKNF49MvpvLC+X1E24Xm7AklYjsmFtNVjsU/iiRdjYuV/IxPCGD49jxmePKX4Eyhg4
         F+zBRYSnyqWMemel+V3wp31ifJkiQLnh66hlsngOHUn/9L32yxRASwKp/Cr1ewxDTUCk
         F5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736756009; x=1737360809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKUBewWkhBE4h6KEbMwZWuoAhwv+Xi80TXPgHOk2ye0=;
        b=lwMgvynxNJC7u6/qge96Ll0kg7+TeCe8ZGGq4vdOteGuXk1d1rSGBxwjaF7ERY3HR0
         W4GlVWjXmb9zr/tx92SzC5PV7XAZTIE/lg39S/yUzOB+OX8wep4jQ+zJ8QqRgXPBg/rW
         mi8AwAz3RTpuDUSe6eRH17feIvKzz55CqKkFoQS1uUpDUDlffwoOTmtS7CKxGr2rDGpO
         /fk1vFD3zj2rGhomxvJJBwjGlOVRbASo6kUpM+tiY49n2IXZi3hZEac0zaXSAHz4rCSK
         aJxC3T2VKBeZ67SOy6ftEVYaG9aN6/S41MSEdQPuKgXiCLNmaRNEMm1SBun8CTzY8if9
         f6rw==
X-Gm-Message-State: AOJu0YwATaspigUoPowEaUn7ZltnEY1c+Q7YLd90xRUjEB8RsG3/bx9K
	1ZaWF6yj0f/6T6sjHm44wdXp2E0PD6sNWnjkbEEfLbUBAeyJhVCJw9HYVLs2VUY=
X-Gm-Gg: ASbGncsQaZvmkK/aFFQTAhJHTawxJLWMpZ5IZNwR6f1dOZAGL+SW6VGghUqJ4975Q1U
	n3lbPyAfYxoLovp65cjUNCEIKI22Q5I82Yd17ckp6oxz8VHSJ9aZzL01xeneZ4oNBLZ4GLrXBJD
	03iz2JpfW+wq6z9YPB+NvHZUnFtdpjgOePif6fbh5WcK5U9ClIy6/CbQqoSXXBmyJ9SLlb3emQQ
	PRRYhv668Eb0crNJtthT1l2C9flEIdn6xSmhKtcZhHVqXdR5wePKGSICj+eSwSbvBXsltH6E53R
	CWI=
X-Google-Smtp-Source: AGHT+IFPU0jhDEVFbrtgDAJbvZc4LzIUuL6U+MmxnsQyOVv1zO4/fGxIG+MTVuCUvrJye+9gDeOgrg==
X-Received: by 2002:a7b:c4c9:0:b0:436:f960:3428 with SMTP id 5b1f17b1804b1-436f96034b3mr40595365e9.29.1736756009007;
        Mon, 13 Jan 2025 00:13:29 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ac68:7df4:2dfd:e8d1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e37d3bsm134236045e9.31.2025.01.13.00.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 00:13:28 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
X-Google-Original-From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] at24 updates for v6.14-rc1
Date: Mon, 13 Jan 2025 09:13:26 +0100
Message-ID: <20250113081326.10694-1-bartosz.golaszewski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org

Wolfram,

Please pull the following set up DT bindings updates for the at24 driver
for the upcoming merge window. Details are in the signed tag.

Thanks,
Bartosz

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/at24-updates-for-v6.14-rc1

for you to fetch changes up to 36036a164fac96727ed724a388dae38d2f5f21c1:

  dt-bindings: eeprom: at24: Add compatible for Puya P24C256C (2025-01-06 21:20:31 +0100)

----------------------------------------------------------------
at24 updates for v6.14-rc1

- add new compatibles for at24 variants from Giantec and Puya
  Semiconductor (together with a new vendor prefix)

----------------------------------------------------------------
Luca Weiss (3):
      dt-bindings: eeprom: at24: Add compatible for Giantec GT24P128F
      dt-bindings: vendor-prefixes: Add Puya Semiconductor (Shanghai) Co., Ltd.
      dt-bindings: eeprom: at24: Add compatible for Puya P24C256C

 Documentation/devicetree/bindings/eeprom/at24.yaml     | 5 +++++
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 2 files changed, 7 insertions(+)

