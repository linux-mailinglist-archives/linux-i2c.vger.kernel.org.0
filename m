Return-Path: <linux-i2c+bounces-7362-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B0E99CB69
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2024 15:18:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C95231C227CB
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2024 13:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7037A1E4AD;
	Mon, 14 Oct 2024 13:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MYFOZXY2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5484A3E;
	Mon, 14 Oct 2024 13:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728911800; cv=none; b=OL2zbXcV3LUm9+VPMs5/APFqOwi1FbPtFHzo44xMX3v5WsqjDVgneCYuWa1SyqUvJM1wQR8kua7cjzBWauALwte93+Nscv3j2Zeqr1XD1BZo4qSFhGBSuLyeJCFQsG0uD9AkgGDQ0bxiUcDyvcHkl5eB6ZymnuyYjUZBX+3va+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728911800; c=relaxed/simple;
	bh=qe08cPMfzQajnQupPuyS8gl/j/iYhFZGr01Yq9ms1Ow=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CNqK5VBDDGGp/Ct8zoKmSOM2jfv5YEPQxZEnu/fJfTh7O/VtjkotoW1kEAbSt8/kfFfVp0KX6oD8h7FLnIou+vcKfwlZexGT7GXO1VwoP25qeuMZ7DpFEU1hgQq1ghbazhi2zGN78vvgnRgskITdbgtA1Va0lEMfOTjPpis05oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MYFOZXY2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-431291b27f1so17660635e9.0;
        Mon, 14 Oct 2024 06:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728911797; x=1729516597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qiu63abS+lcmc+QEZqAra0R6AmKde2YbO88Y6AxKGhw=;
        b=MYFOZXY2ttXV+EtzqOwZ+rN2DEfJ+J38LTgTjx/r+3c9ywGp7fT+cXe9p2q1xsSdhI
         SYvkwPIQrdJZc0cW1OGtG1lIlY+hKjIVdI8KZwPFgaK9g5UIt6PV9KBCB8n5qNyiX998
         gWstbJcjixviwgg8kUhE37Rky98hSM2kVulbarur0gKrpI0H6240scNuX8K/NHaA3P6b
         7aYOMwwEY9N3Rbme+fA3NTWtwXc9erouIIFjBBPO6xD8O38p6cYm5VUjREVVPyvTuqTs
         /gC5f2c88xvLyrLweZGDdV3UQ8aoyDR1aHJF1vMyntclhM9vk8XxGKy2Okl6ZXFDHu4w
         ygig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728911797; x=1729516597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qiu63abS+lcmc+QEZqAra0R6AmKde2YbO88Y6AxKGhw=;
        b=CPu3191X46ewCnFokkJ5I5yM8tAPZ527qfnFOZAYYGBgT6AajQ3ESMDNI4zRmSynm3
         nSgomtC+q2ZqjozZ4r8AE9YBtzIvW7aUkWs7GHX3Lr2eMjQSjsZLpErrowrmucwQtb7p
         wYC+2uOtJ5/PAMy90TAhLnXWxvMU6gvr6rUIEey7cRSrOFim390+dvJtDpQJITVHiI4S
         7VzInZuPUkwjJoIjuvG/YpxHHJalpziDoJ5z04DhCFYnrinmrsQGIjoQOdfDJVPYj3tt
         ErLFoNKIUlpuJd+thwqjwB0KJukXHdxhTR6XIx36knGfIOs5LWKEEerkdv3ZYUVt9F4J
         DUEA==
X-Forwarded-Encrypted: i=1; AJvYcCWsTku47vul9a+BEdmRFNiK8PdDUVQPnPl5CBI1joHpTtHegswTmopQSxsDx5mCaw41ICsxQ2NRJOuIgU0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/NDF1IpuHO5vsDCUctnNn+nxNTCkBG71c97PXNbeoMfF1HgxB
	hRGB65g1preXVlWnAEojtjxUNQJfsF373Ab/t1XbZhJ9tYiD23AF
X-Google-Smtp-Source: AGHT+IFcCp01a+hQ3E59skIEwWoYCKjNqEuIfGS+TTlAmsmQTY97kQB30zIN0dZ9uu9D+NYoMH5lpg==
X-Received: by 2002:a05:600c:1d0e:b0:42c:c080:7954 with SMTP id 5b1f17b1804b1-4311df55bc4mr96397855e9.30.1728911796745;
        Mon, 14 Oct 2024 06:16:36 -0700 (PDT)
Received: from eichest-laptop.lan ([2a02:168:af72:0:d130:f8ef:c6c1:55ee])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430d748d42fsm153420425e9.43.2024.10.14.06.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 06:16:36 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com,
	l.stach@pengutronix.de,
	arnd@arndb.de,
	Frank.Li@nxp.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/3] i2c: imx: prevent rescheduling in non-dma mode
Date: Mon, 14 Oct 2024 15:15:11 +0200
Message-ID: <20241014131635.205489-1-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While running tests on an i.MX8M Mini connected to a TI ADS1015 ADC, we
found that the ADC would stop responding to i2c requests because it
would timeout after the bus was idle for 25ms. This timeout could be
traced back to the rescheduling events in the i2c-imx driver. The
problem is that if the system is under heavy load, the schedule call and
the wait_event_timeout may be rescheduled too late to reach the 25ms
timeout. The same problem may occur with other SMBus devices. Therefore,
this patchset removes the scheduling calls for non-DMA mode by handling
the interrupt events directly in the ISR instead of scheduling a task to
handle the events.

This patch will introduce some bigger changes because the logic for
handling events in the ISR had to be rewritten. Therefore we have tested
the following combinations:
- i.MX8M Mini with dma
- i.MX8M Mini without dma
- i.MX8M Plus with dma
- i.MX8M Plus without dma
- i.MX7D with dma
- i.MX7D without dma
- i.MX7D atomic mode

Because we do not have any devices that use the SMBus block transfer
mode, we were not able to test it. 

The ideas are based on the RFC:
https://lore.kernel.org/all/20240531142437.74831-1-eichest@gmail.com/
However, the handling of events in the ISR is new, because further
testing showed that it was not enough to simply remove the schedule
call.

Changes since v4:
- Drop patch 3 use relaxed readb and writeb (Arnd)
- Make multi master default again and use simple-master as property (Lucas)
- Print a debug message instead of an error if read and write fails. An
  error message would spam the kernel log when using i2cdetect -r -y 0.
- Fix error message in read (read instead of write)

Changes since v3:
- Fixed style issues with checkpatch.pl --strict (Andi)
- Add comments to explain the code (Andi)

Changes since v2:
- Add Acked-by tags from Oleksij
- Renamed i2c_imx_start_read to i2c_imx_prepare_read
- I did not add a Fixes tag because the issues from Flavio have a
  different root cause and are not fixed by this patchset

Changes since v1:
- Add Reviewed-by tags from Frank
- Add new patch to use readb_relaxed and writeb_relaxed (Frank)
- Update commit message for patch 1 with some clarifications (Frank)

Stefan Eichenberger (3):
  i2c: imx: do not poll for bus busy in single master mode
  i2c: imx: separate atomic, dma and non-dma use case
  i2c: imx: prevent rescheduling in non dma mode

 drivers/i2c/busses/i2c-imx.c | 370 ++++++++++++++++++++++++++++++-----
 1 file changed, 320 insertions(+), 50 deletions(-)

-- 
2.43.0


