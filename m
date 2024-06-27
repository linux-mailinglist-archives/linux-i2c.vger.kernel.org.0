Return-Path: <linux-i2c+bounces-4423-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 422F191AE71
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 19:48:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECE531F26738
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 17:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E3419ADA3;
	Thu, 27 Jun 2024 17:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="bsirJEYy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E363219A287;
	Thu, 27 Jun 2024 17:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719510501; cv=none; b=fnAiC3qn/TF4+80ZLhLpzELOj6VF22BKo7zibFslJfA6OtImE4xEdHC1jNNkoiMXCX5EPLa8LrlZ3Pg1kAIUkwAZ4FW4FeR3eRECvmQ9NZdd4ZBCN9jNIOXY3PLSB7SjoPq9kfS2tWeDUflCk0R+ee2dboKdRj4rS/wmt4X9T/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719510501; c=relaxed/simple;
	bh=o4UpHb2puBTPOuuRLwTC7QarroJ7D0jptmVsMPvv8wo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ATb0kTF4/WZamvaMJEX9NAZ8+mTW62T3ai/CRtywCxCoiJcSXh0Vte+aE1LNkslTFB1rE+NxMGHGWygyykpf82Rocpm+lz5CaqLQ+/I6Q89IgzRsETixDzyV+Q6lmZz0kAj1z9W1cRUpZlcr/C2m+iX7ABHQ82X6j/udOfPYnCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=bsirJEYy; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1719510495;
	bh=o4UpHb2puBTPOuuRLwTC7QarroJ7D0jptmVsMPvv8wo=;
	h=From:Subject:Date:To:Cc:From;
	b=bsirJEYyResexD4MRysQhu1ZURx1W0hawLJ93+FzItaAfLJK1ihjaaALxyapMEpoi
	 AxiyRIV+kBDbQ4H+ILrCruK9hA7L1IEBlqVVkxBGLhIzjdMhR5d4s9cPPHMQ1HlpJ+
	 R2NgsGCr442Edj0rwqNMwhyRgAdsIiLmFJ50IOVI=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v2 0/4] i2c: smbus cleanups and SPD support for piix4
Date: Thu, 27 Jun 2024 19:48:10 +0200
Message-Id: <20240627-piix4-spd-v2-0-617ce47b8ff4@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANqlfWYC/23MQQ6DIBCF4auYWZcGUJrQVe/RuBAcymzUMEptD
 Hcvdd3l//LyHcCYCBnuzQEJMzHNUw19acDHYXqhoLE2aKk7aVopFqK9E7yMorVemZvT2hoL9b8
 kDLSf1rOvHYnXOX1OOqvf+k/JSihhvQtqcOhCpx5vJGb2cYvXCVfoSylfA+v1MKcAAAA=
To: Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Guenter Roeck <linux@roeck-us.net>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719510495; l=1612;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=o4UpHb2puBTPOuuRLwTC7QarroJ7D0jptmVsMPvv8wo=;
 b=CAzp/20nA8S25tNONecmUf7ThD2TG6CqN3WxGWGA7OYunTjPb2el/N5wUDcTRnaNNo7VmRe6k
 8L9ulSgk0EfCWm0G4YmqlCq29X0AG41293oRumAMLj4iLA6LIuQHfwK
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Patches 1-3 are preparation patches, with patch 1 being a fix.
Patch 4 is the actual change to piix4.

Patch 3 drops the warning about muxed busses.
I didn't feel that the warning only would warrant the additional
complexity it introduces with multiple callers of i2c_register_spd().

If other feel different, maybe a more generic warning/info or a source
code comment would suffice.

On a machine with 32 slots of which 16 are populated only the first 8
slots are addressable, half of which are empty.
Unfortunately I couldn't run a custom kernel for testing.
But manually instantiating ee1004 devices worked as expected,
so the proposed changes should also work.

Tested with spd5118 and two DIMMs.

Guenter, I dropped your Tested-by as the piix4 patch changed.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v2:
- Add new i2c-smbus prep patches
- Only register SPD for port 0
- Link to v1: https://lore.kernel.org/r/20240530-piix4-spd-v1-1-9cbf1abebf41@weissschuh.net

---
Thomas Weißschuh (4):
      i2c: smbus: only limit max banks to eight
      i2c: smbus: probe SPDs on a best-effort basis
      i2c: smbus: drop warning about muxed segments requirement
      i2c: piix4: Register SPDs

 drivers/i2c/busses/Kconfig     |  1 +
 drivers/i2c/busses/i2c-piix4.c |  4 ++++
 drivers/i2c/i2c-smbus.c        | 15 ++++-----------
 3 files changed, 9 insertions(+), 11 deletions(-)
---
base-commit: 4e2600bca665197acb537ae63f24d3075e6bac8b
change-id: 20240530-piix4-spd-39c156b22959

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


