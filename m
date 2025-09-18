Return-Path: <linux-i2c+bounces-13042-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D9BB837D8
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Sep 2025 10:17:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 015AF162BE1
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Sep 2025 08:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 419AA271A6D;
	Thu, 18 Sep 2025 08:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wS1vbmTG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E454929E0F7
	for <linux-i2c@vger.kernel.org>; Thu, 18 Sep 2025 08:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758183396; cv=none; b=jfdwFNQWsTRbKfPzIKhdq5qVqEH0AeNqgU3rnBPn0S+VeoFaxQUzghIDuRvAVhqdZZZurLJHzOsO07zFH5CLcv3PTNJ9qutk9AQyCypXoOTtxlAjLgfv42kBYoqSEv5dtnC9wUBPmSdY1tn5IHH/QWVySQP5Mzm0nCFB39/CJgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758183396; c=relaxed/simple;
	bh=+utM+JtpRkBji7oJKpKSGUQsL+Dbuy18d/1170/MFkk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b11bmIL/+rTWK1oVhXBDWWjJsrsAknvPEVMfG0979WM1ZmnjW1z2tg0AQtNRi8yVaS32/FWjcYFY/PJCjA2QHoCL/PYb2KJpcvcSHjvlZNkwqTh4/bJxP4ydjx/4pe6d8K4C4ttwMhVGAlZ5IxxG3o/CoTw16TJIxr2gZNJ7gN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wS1vbmTG; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b07c2908f3eso95439266b.1
        for <linux-i2c@vger.kernel.org>; Thu, 18 Sep 2025 01:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758183390; x=1758788190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KtJ/0ByJ05GStS2p3Je8gjz8k/euV0j/2TS01z/+/NM=;
        b=wS1vbmTG4dLVOw8kHzMGMSjDGVvgfmTbPsCEmSkKd/KiE+I8j5UCICx4VTyT5k/kxC
         OE60sOvuGVBGkiIwsb2FTu9T/U7gCeMxZPpk7ZGOqKOcc4xD4c/hkmn8spBBZsmYjo1a
         2QOWbJhPpHQE3e7JYi5QZCgfXxJ+1+Bf+TCyObkH2giBZdhK1nyZwOMw35BSOq9Mc2CY
         3P573Y3eRmqUyhJNEyV8yX/Af46vm8zblKd7N+TiBCF2iBi8zikmSJvREWcPmUL7BnZc
         Knl5HKYGpsP5hmEMe81SnzH+B2Akzf9OfdfznqMyQVefKiwm+uuUbL2TD1b9pxPM3q2X
         B9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758183390; x=1758788190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KtJ/0ByJ05GStS2p3Je8gjz8k/euV0j/2TS01z/+/NM=;
        b=UpIqwrbIyoNz095wHa6c4Z47+KXpEQIqN5ag464vKV15jian7ykN/wcIdSOrwysKm5
         NDm0PqFc+3trsq0SV5HXnWEh8Erw7k5/xX0bWudUD7r23osxlceZX7IpFUqoBLM0f+hZ
         grW92206tBO4Af4IXjOGLZrTFDb5tALHVSVe6PAUqR0LV1tcju1zgn9m62m3IuNcDMqy
         sile0LKDZHzQ/4KsG33KSBZ70XNxXCcEIrS5zI5ffWIg4XYIXcsPVnxL0LTTGLvtFa02
         rKpbdfXxLXqBRZ1od7NB+u6ubCvQ1caZzb+miNQnJ2enfZAuwZeTb9rJKabNZLMaXU+J
         +R0w==
X-Gm-Message-State: AOJu0YzPKqWRxCPtla+or8dmkkPIv915+fYtli+fk9Eu/h4FrjVo+UT3
	+Jw0sesmFg6DeHAFK8mKJT/VVKj3UL99LIUTN2ZVRRSnWN7B3tJozh0EbMNsiZKA+HU=
X-Gm-Gg: ASbGncvwyPXr+g04bAFpTzaDsYQxYryPUDIbNqxaIzXMInEddXpUrCcYhUn4cQEiaBz
	QeX30AC6dVt+rCl3BtFwVJ1jQhjpmfm6//Xlj+H4jBfWt+5/+7OVSDoVisk70Ckn2etHm0U2Yk4
	iZMu+Vr8QiooXybAtwiLhSd95TdoV51HfYiqPOycE4mOlK0gP6u1CcRn9rTG7CMCZfaVkFypjgs
	R1AfnfSSTUfTFtjHaF9QdE5zBZTtJwNTx7AjacCn/bZtsvHUTIyQTx57tXnTGMQbmLl3Viz5daK
	jL94bhq7/aDsjihNjMISmETYfMdEHmw6URL1fmZNe4FyfPzyihuya5zferXXVEyvq3MknamPstT
	1D7iIcgCcBWIDxUp36psTfSUqwFMm7iiugex2bi5ziSYh87Zyx0MHQFwiNCAQEpUK
X-Google-Smtp-Source: AGHT+IFKh4jju2gliQZZ6w9ArlJNL163dIutM9ukVTB1uYfXk/OxM6jLfMpIA+5hGX3XZfzvIAw5Iw==
X-Received: by 2002:a17:907:94c3:b0:b07:c5a0:fcaa with SMTP id a640c23a62f3a-b1bb6ed624emr505633666b.26.1758183389926;
        Thu, 18 Sep 2025 01:16:29 -0700 (PDT)
Received: from brgl-pocket.. (48.13.23.93.rev.sfr.net. [93.23.13.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fcfe88e4bsm141615766b.69.2025.09.18.01.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 01:16:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] at24 updates for v6.18-rc1
Date: Thu, 18 Sep 2025 10:16:24 +0200
Message-ID: <20250918081624.6619-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Wolfram,

Please pull the following set of updates for the next merge window.

Thanks,
Bartosz

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/at24-updates-for-v6.18-rc1

for you to fetch changes up to c7ec58c39b0252e6635dde55e5c708132ab25cfc:

  dt-bindings: eeprom: at24: Add compatible for Giantec GT24C256C (2025-09-11 15:19:02 +0200)

----------------------------------------------------------------
at24 updates for v6.18-rc1

- add the compatible for Giantec GT24C256C to the device-tree bindings

----------------------------------------------------------------
Wasim Nazir (1):
      dt-bindings: eeprom: at24: Add compatible for Giantec GT24C256C

 Documentation/devicetree/bindings/eeprom/at24.yaml | 1 +
 1 file changed, 1 insertion(+)

