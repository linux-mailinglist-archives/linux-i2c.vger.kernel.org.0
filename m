Return-Path: <linux-i2c+bounces-10925-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41751AB287B
	for <lists+linux-i2c@lfdr.de>; Sun, 11 May 2025 15:31:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 952613B0D6E
	for <lists+linux-i2c@lfdr.de>; Sun, 11 May 2025 13:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3777E1D6187;
	Sun, 11 May 2025 13:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+aMfbSO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EA428382;
	Sun, 11 May 2025 13:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746970295; cv=none; b=JjssNn5OH60oX36+SvI0WprgfrqCYO2GNcYP3aW9nDIje1wKjjPS/A9I+9QsGNF3Nq86PZXXbr5ue6dSV7YFT1r85LRDClNpp/BOh2t1wXwx8tntZn0n9c9jIT8QoOD8ydz6yJ8GKF8K2uOr6dj4340xcWsr2sQSF4Kk4F8Iu9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746970295; c=relaxed/simple;
	bh=8i/MCSci8o07v9hng0i71QsBhWS7Rg8Q9NscAaO3yBU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IVJsdou1UHYhkdgLfQSKwJ8wDB1ANp7Mn8+OJI9xk4kv45BKUxviYyO8MH5qhjC5N/RyWwJaHLFQ/7/ocCEq9bixJIAIia9UXwwCYaOZEkFKX/WONvehTT9aWFXLJvExLXq+2A3BBYsdxkymXjt2+MIvfxsYCgJhYs8R8d9tLq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P+aMfbSO; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5fd0d383b32so1400245a12.3;
        Sun, 11 May 2025 06:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746970290; x=1747575090; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qfxwlIQ0tbuPkSHji0HK07mcJx2VL7b27pvCA+Qhuds=;
        b=P+aMfbSO7rNN60WNe4/G6ioCjW1yFh/xOwNkwMBN17qX4dJSrvnqoXCAH07vkASkBq
         VEsVkLtIlmJJ9cgVQZeeLVyBRl/TCbIXWO8KtMHb//BloycwWXtkE27dXLGGLSir4uu7
         mrxsJRzNuM7M4tKF/jZZyvP8LcfY/TJz2h83LA08ssgynZ1eqSAvB0FCsgI8e3lMaBgR
         718cMOF9xnP20SiOKyGVnOECVbrCeYafliFECcwU/E3RRTIHxrdoUXs/yAwISilmicUe
         ARN1JAL0eBu6DYEL249FjG8EfLGtVCPgVRt5Wz5zwaTH/gXCw1ZGZHIT+pgpoLe8ioG6
         ATkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970290; x=1747575090;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qfxwlIQ0tbuPkSHji0HK07mcJx2VL7b27pvCA+Qhuds=;
        b=K97/M9cCR126eOOnSDyr/whVI5i19HD9K9wvqsCHMkO1yp8MEBVCnGNr6aQ+2s8PBN
         ZX+7gjyAJMPSsnkUlTNEVqq/uakqgEZlboVnqvo/6vhl0KENQmool/Hj0qZPvJOYp3d6
         wFNWwc5LIdZ6QyrWiHT6TGu1Bz4M6zu2NT7imhkMW4sV16XbffQPhQSetNqEZ85FwlP+
         f3OamwrpcZNBsKh37KFXaAdIGJUKnQsSy9TIMlRkIu6wOmaufXfqPnuuDgN/5KywiiXf
         6Q+qMpMwtE1vrdROzOgIEX6Bhezb/CjDV+d3JVZYCkl7MJNBicP+hneCK5FpcNyo/ycs
         Dq6w==
X-Forwarded-Encrypted: i=1; AJvYcCVcwh6H7E2h3R68ER8zVzoOP+tGAh2uFFbmintdyhSxb9WFd69XvbLdxbxu1J0u4+uAz1F3n88k@vger.kernel.org, AJvYcCVv/VXX09SNw0dG4qhCZdqYKzCHpY4wrDCuRkIKvBQUR4hEXt4CT0FdKTDiwNfU6Dt7Pw2PeaD92F4=@vger.kernel.org, AJvYcCWxqY993QQSyiIp5HHfFtd/l7V2b6kaXLjXhrKaouOpQJr9Uzi5i/V/CKEBSBiXjpWvjz/S9VYnuVFswdTO@vger.kernel.org
X-Gm-Message-State: AOJu0YwdKIS5GdZluOBTio6gccCA4rUT7pSdLAAfwUVf6f+8G8f1B/h6
	kfxqPfu7NjqfPd1nlcLWCeyLPTpHhxqmvLzSWQ9ZUg6g87nDmwgRDr9fFA==
X-Gm-Gg: ASbGncsle9x7g4/iugUSdQ06DDEjovfSidxuijC+lY8e4z7y70/57Ho8XFA3ExvRenH
	0q+iKC8SVjJSRQhqJsdVAnfk2znFbGs/XpANXAI0Qp6p3j8gidXk2zO/SdJ8XgG0xdeuwOxIrDz
	OuSU5UTLbaXRUczN7owEtL3zjt5e6ebc+gnXs7m5peNoK4eSSanGLZ4han5IX8w7pd/ewSeuK2F
	rBMxqT3eJiodVqE9U0/61/xKoth5ah+PoE7GBMKBWZls5gd2G48kR7EojqPY9d3h6B50sjPl6Rz
	rgQ9t+CIt+NAJaXUSiHfrVn1m0fi43/e1vK2evZ8XhlgJu+ReGA2Yi7CtTpHj3awWvW1H6Iy4Pm
	rU7xX
X-Google-Smtp-Source: AGHT+IH7yl7XmxNilX/kpFITQRuEskSKWUC3Vt7HAESuFqH2J9O8p35Yu7FQrAMijfsU9DPiUrNnMQ==
X-Received: by 2002:a17:907:1b1c:b0:aca:d6f0:af0c with SMTP id a640c23a62f3a-ad2192d4a49mr949942566b.59.1746970290354;
        Sun, 11 May 2025 06:31:30 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ad2197bd398sm466765366b.152.2025.05.11.06.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:31:29 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: [PATCH 0/3] i2c: pxa: fix I2C communication on Armada 3700
Date: Sun, 11 May 2025 15:31:04 +0200
Message-Id: <20250511-i2c-pxa-fix-i2c-communication-v1-0-e9097d09a015@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJimIGgC/x2MQQqAMAwEvyI5G2gr9uBXxENJo+ZglVZFKP7d4
 G0HdqZC4SxcYGgqZL6lyJ4UbNsArSEtjBKVwRnXm94aFEd4PAFnef5N+7ZdSSicamLHPrLlLhr
 yoI0jsx7//ji97wdJTByAbwAAAA==
X-Change-ID: 20250510-i2c-pxa-fix-i2c-communication-3e6de1e3d0c6
To: Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Russell King <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>
Cc: Robert Marko <robert.marko@sartura.hr>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Russell King <rmk+kernel@armlinux.org.uk>, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>, Imre Kaloz <kaloz@openwrt.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2

There is a long standing bug which causes I2C communication not to
work on the Armada 3700 based boards. This small series restores
that functionality.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
---
Gabor Juhos (3):
      i2c: add init_recovery() callback
      i2c: pxa: prevent calling of the generic recovery init code
      i2c: pxa: handle 'Early Bus Busy' condition on Armada 3700

 drivers/i2c/busses/i2c-pxa.c | 25 +++++++++++++++++++------
 drivers/i2c/i2c-core-base.c  |  8 +++++++-
 include/linux/i2c.h          |  4 ++++
 3 files changed, 30 insertions(+), 7 deletions(-)
---
base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
change-id: 20250510-i2c-pxa-fix-i2c-communication-3e6de1e3d0c6

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


