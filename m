Return-Path: <linux-i2c+bounces-4831-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A942592CD1D
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 10:36:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 533EE1F237AD
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 08:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE0613C689;
	Wed, 10 Jul 2024 08:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="SN6+SRSS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D541E130ADA
	for <linux-i2c@vger.kernel.org>; Wed, 10 Jul 2024 08:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720600564; cv=none; b=hWgTnI+cKP49GSsDPJ+t6VaypCwB0tFv3etnVyYGHpEXBVkXtJ0kO+yzQS6s0D2icUrRsvWIN68lHhv95fkW7mFThQZ/T82L/2RwYF98niF2qqMspY6C042mIMBisOxLHHKKUdQNBb+poYdR1pQcmq5big03jGuwzyHXm77FM4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720600564; c=relaxed/simple;
	bh=0DuTUjwKcmoUD+Ke26uRDuGLpnimVtC5VfEgQi4p3U0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=g5TdLuchHyyfhNgYA7TO7RDiHOuVh8DnGw6C01LPKsLxoQCp17CX7Ufe1TNTWW3gOnkCVsrIVqdplqLzCdfZD5JXWXW6/QKK92S+GkHaOfLrROZUGMEZBJW4rwMx/9Ti8cNsy2fpn7dm3EVgE1S3iB+gexKENcNWXJ6M5M0TRmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=SN6+SRSS; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a77baa87743so652269266b.3
        for <linux-i2c@vger.kernel.org>; Wed, 10 Jul 2024 01:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720600559; x=1721205359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QLnwa9y8M8tKEvQAZNZ2w3HnhPeZmNOTX46tGK9rSpA=;
        b=SN6+SRSS1eCPzL7u/6SnA1+sviuYLtGgXRGCRMPouQ2w2bRb11xdTy0DMo8WEo1kDt
         HQ4bnkCzqH55hJc0fiw/GCN8o8W78rh5UfTZgQ/uOWNSwMKe7MXU6ay1bSbDk0ZEVQyj
         KwIlR8yMJ40EmlYskO5p3pOIQH0KiVRlTI4f1vtn0H7/o5j/AOXH9G4mhJQH46xxTeg9
         5uif4UsjCsEhL+nXnFf7VyFEWT4+OV3X5taqL22p+hCZMCfaPTFz7YLVOfWzimtWhUTT
         ORoJ9vAQq93NfrhPapxbtv6YVSkbtv+3aJybNuROgGDFNblHO/mExZbQAOLlIHul/CFS
         O4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720600559; x=1721205359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QLnwa9y8M8tKEvQAZNZ2w3HnhPeZmNOTX46tGK9rSpA=;
        b=ObtWHusxKBSOAKyVU7kmsiaHHHaQOuRSsZCPY4jd5GgJ6D/q6rP/nZsVOSTD0qpHFt
         olb04w+oJES5D9JTds7ATMhfoHLiVb4fwdQtlzK+kjWMpzJUGGbAqYO2O8MzB4FfAvvU
         e1kduLhMoTBVU0OpgHtDXs39uySOwkcVKpCN9rMk6SAk5qwescBM6FpcK2rSNFWEjahB
         eSULkOZU4U7GzpuXzepKdyP5etL/s+w6aWGtuYpelYszdSrX/EbTrZAjors9BrE/ny1n
         51nPyrjQ/7G+dm2FH3l1uv7SoiUc36VmPk0VlfgSTezauy0BUPdCDkqJhdt/cd2iiCIv
         ehBQ==
X-Gm-Message-State: AOJu0Yyh2s4wL3m2UShYhOL3m4qqKHXIIPvMvPZ6O0ZgkmPhCIlpmXZs
	a5zpj/NsPa9qQ9UbNMtiZ1gH4A57OvSPXq5E+IVCXZBrMHhZp4BeYPJo9UeHIw4=
X-Google-Smtp-Source: AGHT+IEFUtftJWnURm9euQd5wYTZtACuxZYzLcX621O/JVpAJ423LEJTYkmjw4xT134ngDHl8bYBag==
X-Received: by 2002:a17:906:c154:b0:a72:455f:e8b with SMTP id a640c23a62f3a-a780b5057b4mr465633866b.0.1720600559204;
        Wed, 10 Jul 2024 01:35:59 -0700 (PDT)
Received: from localhost (p50915eb1.dip0.t-ipconnect.de. [80.145.94.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6bc6f6sm139986866b.9.2024.07.10.01.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 01:35:58 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-i2c@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH 0/2] hwmon: (pmbus/ltc4286) two patches about device matching
Date: Wed, 10 Jul 2024 10:35:43 +0200
Message-ID: <cover.1720600141.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=714; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=0DuTUjwKcmoUD+Ke26uRDuGLpnimVtC5VfEgQi4p3U0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmjkffDrfQJJHtXnrlvW+E3VTUKNuuKVdBRl1MF zTlV3x2jvuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZo5H3wAKCRCPgPtYfRL+ TmFzB/9QVm2ziqfe0y2Ptgw6IKf0pLBWTyuepzUAlEcFTz57HH9cNQEHvXAr1z/Fx6Lk6imTAIq sY5urp7SfQpnGYS2RT2KJooy/VY5M7sPlO4aJk0vnChFPhnosQCdOQzJIvR8EUEZNi80CLXSSTu AbBL385+rrfQTsAqUp8OMr8hKZHAnv1720y6RyOt83gRPnycZr6/id21SvM3l0r0wJjcY02tQ5n SmmyiQfWl3PtIDR4cbI5oe2pkO+7JH/z+epYMEP34ZrGwrnPVUN1oO1Vi7b1DvPzfdtD2jw7pO7 I+g7rF/8s9tKYh1IjhVmXaRKdnNSKshvkuPeIJv9ovEN3yCz
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

while working on my quest to improve i2c_device_id I noticed some minor
strange things in the pmbus/ltc4286 driver. The first patch just
documents the first peculiarity found, so the next reader doesn't wonder if
this is done on purpose (and the patch gives the opportunity to notice
if this behaviour is unintended). The second drops the other peculiarity
I identified.

Best regards
Uwe

Uwe Kleine-König (2):
  hwmon: (pmbus/ltc4286) Improve device matching
  hwmon: (pmbus/ltc4286) Drop unused i2c device ids

 drivers/hwmon/pmbus/ltc4286.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

base-commit: 82d01fe6ee52086035b201cfa1410a3b04384257
-- 
2.43.0


