Return-Path: <linux-i2c+bounces-11806-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2961AF721F
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jul 2025 13:28:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 513204E0CB9
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jul 2025 11:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 391F52E2F0C;
	Thu,  3 Jul 2025 11:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="l5K7sn4a"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7A52E2EFD
	for <linux-i2c@vger.kernel.org>; Thu,  3 Jul 2025 11:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751542069; cv=none; b=fccMPqtVEm7Wklw3pjuzonT3Nb2aiZRdrIrP5zm0KXT887aTItmKZASpsf+e6S8+a1CqLIJI/ze+Hq61+gGjOJaICQqurxYtICBidymvC77RYEEVpkQh/FQZV0Y44ALgUdG4CyaCC62VBmw9N1nKZt2ohbCogDdewXEOWv1uaug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751542069; c=relaxed/simple;
	bh=UlZ75WOORNs4rZE+VlImTZa7mmm9FlJ031wXRJuG6f8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QFBL1e6JPpp1OSkf1PWSUuWy/vrziYuemZKkq0cMRrHRcZO6DISs0BgyWIDYDBQ2Csk1FIXAhS7Dn4f3Wf6EhdEni/KY+p+CyGDZj84EQkP1HOfuKaxR/KHdD+ruBWEdknjbVc7mKS4Ycr51r02YqMBrSENfADXDOcDpmTHEaSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=l5K7sn4a; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae36dc91dc7so926584666b.2
        for <linux-i2c@vger.kernel.org>; Thu, 03 Jul 2025 04:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751542064; x=1752146864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a6PMMz69qo04D/YT8nX2dE04S7ELr0QnXwz/uN4j+eI=;
        b=l5K7sn4an49hXSu3he2pRlapXvTrBiKvj+FIVPQKXU0QKgqq1ZePud52ttkBScRteZ
         KXf07vm94x6m/BCztn7+b1NfXByAPNtaOF4WgW5PRybd5ZcHmex4Qgt9l4IwyUsdlDQp
         fwrS0yw5nXaNTPLpAayTRgR3ARnJxCT3ug7Jtj3/o1ygmMbAMt1cub+cJjOjfZtVFKLA
         AeQxIDhtiB6JitMDJmtj8b24mgQ6rHhLiyCKZtE4/9ZRKv4yIc9UK9zd2d3MgYY4WYIH
         RANXc/agfr78NopjZLE6iJZab7To9BS5wWfsMRK/k66/NLaCdnY4/rrqvUrIfU8JHFHV
         odJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751542064; x=1752146864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a6PMMz69qo04D/YT8nX2dE04S7ELr0QnXwz/uN4j+eI=;
        b=FMBql6lfsKKdsZDtCGoiL7MJ7tDjLAloqgZaT2DpxDft0qWSfUMibDH3uR7MvveXnD
         0zRUfgyDA3jIHhB6luzY90s6+6gzz15qXbxTG/TvxaQ9kAdTQjuIyUQta9qIksWwXndP
         lz1XV/co75boUIYNEtW3SRmhcyE+J+Nkre50HrEgDaUGwkMFZEMJWUwbjbUCYKgBYV55
         K0juAkI6HyapYOZRvujXeGjBG9iwnT9n+iAwdVIvgvv89E00iWfqxQONt3dqp4Q4Uodd
         ivcG/2sgKwbXCG6MPaMqrHZZJHXQa5sS03S2vnuhL+qNLUHIqJ+06I87QxDv/dv2YGHx
         rtQg==
X-Forwarded-Encrypted: i=1; AJvYcCVLTL6rj3P19KY90PK2hHDOLVEQr9hmpo0zuXsZFGmiFVKRvxd8ANUvi1W13Go/6L2977YXVwxFo4o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yws6I0YUDceurcKtQexBjNX9YZEVSQQwdnsGzBVkTYxAjR1uDc9
	3ouVY87k5BnLAxnX9YLT0FdR1BuprDKOsbD0+Kd4X/rLZVKqHoqf3S+X8ylYYZ0mfjg=
X-Gm-Gg: ASbGncsQnwoJmGy5WOXuY75ki94wtoxU/UPeiZGoOknDSGTokxk9VL7vYELNBVUhewc
	E8Oz5ush3ilejbb8Kfa816sJiZIrq+2X27mMo0tntT4qaBsjOTRyE0oLGLXPcoo9bXY85+AZWAU
	9KgZ7NRKB/pdNMK+ZnYPBYvKih8+/IN/5OsHguSNHySkgezawyw937aPovbVUlVy3Hvw8vYO2t1
	mjhuT+rGdtQBVA9/F5w5RlxJzbEvAzages4c0nscbLD4reqsIy9O2ZBqHrUu0/ZznAZ5XZnIsZa
	HrOP1d5YVspHMCOIYmaoBLXi3ae4k5mfjZ++hQ1lNR/SJA6U33lxowFjOe3r/G2CplfqMDNesFL
	5rpigNtEjMlB+5vo=
X-Google-Smtp-Source: AGHT+IGodommfjTvSu9SmK2+f27lr5klD7Mc1oDRjQm+BoxfNtWb86krYFjqI4yPBXvjQSq606lSUA==
X-Received: by 2002:a17:907:2d94:b0:ae3:6744:3661 with SMTP id a640c23a62f3a-ae3c2da6359mr600970466b.44.1751542064239;
        Thu, 03 Jul 2025 04:27:44 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35365a75fsm1247016966b.67.2025.07.03.04.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 04:27:43 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: linux@armlinux.org.uk,
	gregkh@linuxfoundation.org,
	david.m.ertman@intel.com,
	ira.weiny@intel.com,
	leon@kernel.org,
	rafael@kernel.org,
	dakr@kernel.org,
	len.brown@intel.com,
	pavel@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	wsa+renesas@sang-engineering.com,
	ulf.hansson@linaro.org,
	mathieu.poirier@linaro.org,
	vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	broonie@kernel.org,
	robh@kernel.org,
	jirislaby@kernel.org,
	saravanak@google.com,
	jic23@kernel.org,
	dmitry.torokhov@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	bhelgaas@google.com,
	geert@linux-m68k.org,
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	fabrizio.castro.jz@renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 0/3] PM: domains: Detach on device_unbind_cleanup()
Date: Thu,  3 Jul 2025 14:27:05 +0300
Message-ID: <20250703112708.1621607-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series drops the dev_pm_domain_detach() from platform bus remove and
adds it in device_unbind_cleanup() to avoid runtime resumming the device
after it was detached from its PM domain.

Please provide your feedback.

Thank you,
Claudiu

Changes in v5:
- added PD_FLAG_ATTACH_POWER_ON, PD_FLAG_DETACH_POWER_OFF;
  due to this a new patch was introduced
  "PM: domains: Add flags to specify power on attach/detach"

Changes in v4:
- added a flag in dev_pm_info that is saved in dev_pm_domain_attach()
  and used in device_unbind_cleanup()

Changes in v3:
- add devm_pm_domain_attach()

Changes in v2:
- dropped the devres group open/close approach and use
  devm_pm_domain_attach()
- adjusted patch description to reflect the new approach


Claudiu Beznea (3):
  PM: domains: Add flags to specify power on attach/detach
  PM: domains: Detach on device_unbind_cleanup()
  driver core: platform: Drop dev_pm_domain_detach() call

 drivers/amba/bus.c                       |  4 ++--
 drivers/base/auxiliary.c                 |  2 +-
 drivers/base/dd.c                        |  2 ++
 drivers/base/platform.c                  |  9 +++------
 drivers/base/power/common.c              |  9 ++++++---
 drivers/clk/qcom/apcs-sdx55.c            |  2 +-
 drivers/gpu/drm/display/drm_dp_aux_bus.c |  2 +-
 drivers/i2c/i2c-core-base.c              |  2 +-
 drivers/mmc/core/sdio_bus.c              |  2 +-
 drivers/rpmsg/rpmsg_core.c               |  2 +-
 drivers/soundwire/bus_type.c             |  2 +-
 drivers/spi/spi.c                        |  2 +-
 drivers/tty/serdev/core.c                |  2 +-
 include/linux/pm.h                       |  1 +
 include/linux/pm_domain.h                | 10 ++++++++--
 15 files changed, 31 insertions(+), 22 deletions(-)

-- 
2.43.0


