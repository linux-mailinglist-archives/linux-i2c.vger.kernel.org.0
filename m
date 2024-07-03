Return-Path: <linux-i2c+bounces-4601-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D1F925785
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2024 11:57:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 317AE1F26DB9
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2024 09:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B8DB142621;
	Wed,  3 Jul 2024 09:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2wn6T3Ja"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9BC13F45B
	for <linux-i2c@vger.kernel.org>; Wed,  3 Jul 2024 09:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720000614; cv=none; b=Ylt7kuOourKvvIOzmbomx3pTvqGETC7GsRMnVxQDYAtffnrsOvZ0ejNELly8h+CmaB53Q1x6xAvvF76SYY/E4aQp/pI9APQpa+AP/C/QskRWo5zyz/zl+bD0rjEFQHtVNO6JoQraD1TkfZacY66OBEIt3idSUnuIHNU1SJ9eDBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720000614; c=relaxed/simple;
	bh=VRqNg8ZwdNFYMwEZZ15y9oaDxErqj4bO5XutmPE7nnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xfd4V20YLgin97ywpmkIj2p7D7ScC7fV5x8bcke6P3rPvxnhpOpQxCFTOFfwDkpQ9rQZ3AeQnK8+WA3QXp6TD4wIp44vhFuDEwKx6OtH9Tg3DjyBeowdI1drBA/WYTtYKPWT9jWamBB+n6TEQfqG3eKalSZqZ9deNy9eVXWbz2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2wn6T3Ja; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so62951681fa.3
        for <linux-i2c@vger.kernel.org>; Wed, 03 Jul 2024 02:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720000611; x=1720605411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=644p2OqNe2TyfiDk6OFRaYAmlAu9C2CNKeyr0ia2jQo=;
        b=2wn6T3JaeNHqvOS7BSJ17fgtERPLe2qH3ikYGO/YZscDHq9BF0FgfJsKowczXQ4TaT
         yAdLmllo2q2IpLFoW5BrHw2+OA6YHfRlBXny2ZjBkS60VfXNwMxOg2Fh8m5VEPM3iubW
         KdcNkbn27ATiwXTSwOPCE5K8gAPgCtYQ7YamQzxNF4sjE1BCwIFZJfL3iaiT8bpxVhhZ
         kZRbm3BT8iS/RHGZAnYqrjLy7giMHi0cbwCq+ZFoSlWVZjPFD0pnvM8Hk8tbE4XzRdXo
         nXkDazg3t8RckakT4JXtWAjFIb9Z9i2Ndmo6lk7sjK+LAxRhcI21xoli9DFKZYLzScs0
         HLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000611; x=1720605411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=644p2OqNe2TyfiDk6OFRaYAmlAu9C2CNKeyr0ia2jQo=;
        b=iSJnqAQX0CWQwUYEJNxpauRracprrikF7i1P1KFBAQjUPSFh/VPjL80Dlth1ZQy4W0
         28Oy+6setLZlvjEtkXLXX8zMq++wispH7b2Iig3EG1gpjb7uAjlXm9v6WvjP7OuH8p9g
         eZ5TVJEwfjiUxlyq/IiS4u76Rw87xNLvIrnGmr4LGYSUhf4LBESmaHS3mTSzxVJk3SpW
         V0tPQo6KkCNI+rq2NpUvjp2u/lqYIhOxTF8bNaYF4CP0SLHl02dZFfiku2weYT1ZPedU
         1Se7iMxChHR/f/uOVFxH7xibG96Cw8ySv1KkMXMsp72HRjMd8YyjdS7G1PJVXJOM/Bbn
         7KFA==
X-Forwarded-Encrypted: i=1; AJvYcCWHGdyrBiOA5aPhqpqyT07jWi+FjK4VsU3+pWuJOK46Pnz0grPHPAdMA/+EFmJjPtnAqlPfNMVzgieFe+TkLQ0uuHRFC++Mp0Wz
X-Gm-Message-State: AOJu0Yzs60eDkkNRv0aq62Dl3Gs6mZ9bq+mWed06lrDJlz7J6G1uYWVD
	Ug0B8ZNqv/DOk7qg27C+kUUndb/83eIx7Y1dEuFZ3TBPfwRYeaeT3RBZstLcHQ0=
X-Google-Smtp-Source: AGHT+IG0w3E0EYqPeaL1EPJl8rWjAk6xvFAdS0J0CS6iElVHC8biwZiYbyTZBy9yDP3+x2rBjsmnzQ==
X-Received: by 2002:a05:651c:150d:b0:2ee:8698:10ed with SMTP id 38308e7fff4ca-2ee86981404mr8101741fa.49.1720000609610;
        Wed, 03 Jul 2024 02:56:49 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:c37f:195e:538f:bf06])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b0c1018sm231190095e9.40.2024.07.03.02.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:56:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: brgl@bgdev.pl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	Andrei Simion <andrei.simion@microchip.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/3] Read MAC address through NVMEM for sama7g5ek
Date: Wed,  3 Jul 2024 11:56:47 +0200
Message-ID: <172000059532.11489.8300421582989880074.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240703084704.197697-1-andrei.simion@microchip.com>
References: <20240703084704.197697-1-andrei.simion@microchip.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 03 Jul 2024 11:47:01 +0300, Andrei Simion wrote:
> Our main boot sequence :
> (1) ROM BOOT -> AT91Bootstrap -> U-Boot -> Linux Kernel.
> U-Boot is the stage where we set up the MAC address.
> Also we can skip U-Boot and use the following boot sequence :
> (2) ROM BOOT -> AT91Boostrap -> Linux Kernel.
> Add EEPROMs and nvmem-layout to describe eui48 MAC address region
> to be used for case (2).
> 
> [...]

Applied, thanks!

[1/3] eeprom: at24: Add support for Microchip 24AA025E48/24AA025E64 EEPROMs
      commit: b61ea8705095e5d242762268cfebf48c848315f6
[3/3] dt-bindings: eeprom: at24: Add Microchip 24AA025E48/24AA025E64
      commit: c1ec80e54afd0460d02b29a5731fd2a7b31f400b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

