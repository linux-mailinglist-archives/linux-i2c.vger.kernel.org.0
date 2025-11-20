Return-Path: <linux-i2c+bounces-14195-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B535C7468B
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Nov 2025 15:02:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DD58F346115
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Nov 2025 13:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 228FD340D92;
	Thu, 20 Nov 2025 13:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iZE+9/I/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13A6340A63
	for <linux-i2c@vger.kernel.org>; Thu, 20 Nov 2025 13:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763646878; cv=none; b=N8wMdMKcS2m0ecLaZHFct5qwknH471PjqCzJq6wuD9aPaTYUSqRKwXdaOR8Gpx3M/UUrgylV2RsNLNB2dD8tLx7V6bCAIZ6lcEh6zCu5K6OZREYaPZV8QGOkvT7yRmnbX0p8RO48QUoXKUJWmpXgwleiKs539zjiKthGNAQFe6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763646878; c=relaxed/simple;
	bh=X4L0Go7cenDlFNKxMmnI9n93MBp1ugSaHUazlkliGno=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ABKdKk68dVE48vjJ8Uw2vHowcWiUJ5J0ZUD7sjHqy6MSwUu3IQOd6nECgr2Uyr9pdhlYYbQz4WmgnIXH81+BxYZqQLMuWCrnagSsrSRfl9tlW6zf3/YivtpzGLrKmF//fMgGVRRecDtgQLo+B1z2sAQvcKq11O1vpjBmctuoP8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=iZE+9/I/; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42b387483bbso619266f8f.1
        for <linux-i2c@vger.kernel.org>; Thu, 20 Nov 2025 05:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763646873; x=1764251673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ooxVuxnAEiDOd/dQjzQ0gTd+K+VG4fjlugRKAPbfNnQ=;
        b=iZE+9/I/lYGtXC8+4Lgj/3T59mxxxSE99r7erL/brfcGqaT5vHT9KXP7ASYff3llwD
         Q9sgddAED9MzTiuP/QWkQAoRbhUfWg1UEM/J+P0A8EdMnqWxLYkPDJM1msOkeh4Vo2g7
         qIZ6yBDS03mtZzYICJMnxI/ibZQ2aaSK7h7fJzD1lAjZurxlbeoWI9GZWh46Syouti6g
         7KEhmpuoZh7pdSNmj4FG1wqG/DI/YEIfe676qGXbrN3/r8vp3idSe2FbjbGzzDhjbomi
         /UuSXY3d7sS2Mts48l4Aqvogm5AwbKfklZk11DVXycVQf+DMddioE1IQ/ty63kxR+EXY
         UANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763646873; x=1764251673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ooxVuxnAEiDOd/dQjzQ0gTd+K+VG4fjlugRKAPbfNnQ=;
        b=ruPc5Z6aLEr0KXa6GM65p1vAPsMmcGHTwa94dQvCKGCq6wZhV/p4mtzUyimhoyOqoE
         sWm88PEE36Lw7Teeuikgd3lwlsE/TJpvgFzv7fBqb6BMkYPBWPiDMWp8opF6MYsKyveF
         xE3EPKJaDJ6TxK+/l39kZqchMN6iQ9TCIyWFYNcYLGs7AZplRC0BokV+eAQ8CkuXH+2X
         MaVc2qV67+NuZKA2UDgs9eNX2y0PP7Mb9fPunw/EjyfER+KLUryskvX4uhAuAq6v+1L3
         sE9YQI0u7IfcOYaeBtNqsOcewPHufRJL7EdtEPIdkj+1wkDgEhkSNxEFgzNRNCU3/D4Y
         9jIQ==
X-Gm-Message-State: AOJu0Yyf43CNJzHeaHdn7oyXd02RB3qMfwEDzc5iUxRKmzMfFcU2fieC
	r03XfwIWp7mVTDdKBG6EnFf96hED7szi6gNwnr1N+BgJ8rLbc441rtWOlecCQ4Woi4s=
X-Gm-Gg: ASbGncvcK1sIBIVnI5FUQ53SRVqp54xQEOsn3m6CtPWMyz1QoSFRQ1LDBntMmY35Oyy
	Kj9IY6eYTrEvLeAn1NaNBb4Yq1D784j1sD1TNnsXBI6AdWE7krDAjMXRFUQ+oHOGMFZSqlERoJy
	gErlmv1z64INk114ikpB7yvxe3fZX7gj95WW62ShvAsnJix8McPLF3Ir3zuDMcISftFNpLZF3u/
	thIUYVrXAM8rUKib9PSuGJtqGtvRXNt9YJ19c9AOzBLzwedJ0+HvkKRKFwVfkZzCBxDppar1wDx
	EfqI/nJDCYJIhFavQjd68hDhfmxLoVy8IX2A/Z1QFnm8tM+oL9idiM7lqsyc/4ac+9w/iJjB+NH
	Upkky75zMVqTcgcURJ2JNbsOnPZ+tptoE5PX93KrPZlRsJFiqnARlGibpRKy3HXR/acJncJWLSb
	f34kbLV/+8XNsz57yq0FlelnxpdHa+WHp7obSIfA==
X-Google-Smtp-Source: AGHT+IEPCjOCio10VEqHPbRLqJHNDudfFt401fyBPJFvG2b2AacAlu5/60ghtSnaHIKqDcyc4csdOA==
X-Received: by 2002:a5d:588d:0:b0:42b:5406:f289 with SMTP id ffacd0b85a97d-42cb9a0dff2mr3160793f8f.3.1763646872851;
        Thu, 20 Nov 2025 05:54:32 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:37af:6c1f:28a:47d2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f363e4sm5593874f8f.12.2025.11.20.05.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 05:54:32 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
X-Google-Original-From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] at24 updates for v6.19-rc1
Date: Thu, 20 Nov 2025 14:54:30 +0100
Message-ID: <20251120135430.33476-1-bartosz.golaszewski@linaro.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wolfram,

Please pull the following AT24 change for the upcoming merge window.
It's only a single update to DT bindings.

Thanks,
Bartosz

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/at24-updates-for-v6.19-rc1

for you to fetch changes up to aef72ebe9c86b516c6e126d4b453c96496547f0b:

  dt-bindings: eeprom: at24: Add compatible for Belling BL24S64 (2025-10-29 11:41:44 +0100)

----------------------------------------------------------------
at24 updates for v6.19-rc1

- add new compatible for Belling BL24S64

----------------------------------------------------------------
Luca Weiss (1):
      dt-bindings: eeprom: at24: Add compatible for Belling BL24S64

 Documentation/devicetree/bindings/eeprom/at24.yaml | 1 +
 1 file changed, 1 insertion(+)

