Return-Path: <linux-i2c+bounces-14475-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EA0CAFCC3
	for <lists+linux-i2c@lfdr.de>; Tue, 09 Dec 2025 12:40:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A3F830A132B
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Dec 2025 11:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AC202EC094;
	Tue,  9 Dec 2025 11:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="IrZBE7TQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1172285CB9
	for <linux-i2c@vger.kernel.org>; Tue,  9 Dec 2025 11:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765280389; cv=none; b=RF4PixQ9vBSClHmIP5TEK0pcMlEfhTFG0BGLAoygbd2+nxb/fSnW7XE4whZxUpAbVR1dERNBsdIR/544ForDfbXktVgsAWlgAbH5hJQ9QnJIIjQt+mYmBNz1ZpU9yTAV6g3wo50tyD7Kuxcob+dt6mz65TpdiSwODOuZBRV8B3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765280389; c=relaxed/simple;
	bh=hneWfReMr8JUZ1RklsZR8PUJmQmGKj9ACT99gfEf4y4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YOMzRvBMunmB059V8mVar+3F+nOTZjtAGF3ZaRzQ5l9pzX4f/9siwkN17kSaxO7o8C/Dd5Pfjo/DV0VUHzYlyubrZjkXhobwGY0Z/KihB4j1wCq+NccEXGjiTbKLKaRAflPy0ZRhKHDTi4ka1PyxenoLvuq+uRgzzpJAUTlFg/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=IrZBE7TQ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42e2e77f519so3526282f8f.2
        for <linux-i2c@vger.kernel.org>; Tue, 09 Dec 2025 03:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765280384; x=1765885184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1kAxf62pTzqbfwbdvgj6hwDy/PkytkFXzpMaFpR82LU=;
        b=IrZBE7TQY2Q34ybEZWScPdL7zOOHYO3WDz5Y/5LmbvtbfKVG0jf6BbsJWYVu8TECFA
         SG9doypYusncdMCnYBqvh09DGniM9+jaGB2GqXPiGTi86DmJluMj+yPnHOxXq1sKOmVK
         TzSS0iK6NzeALq6gSPgLKqrpA+nZMYgax8EhkL97e8fXtsNmFjEBvM20HpF2Pu8AkTDO
         KmNQBdGoe6sUYT/9dfUJAKx6hSVjfrbXsVL9s4yKR1CM2KKJRHrYjpSWcTYsErNWBfcI
         HHE8q4/FYO1MiQOtKMnBUz8BvL6MMnzRgHoFNrLnEAmO2zIzkLCIX9mNbmach3w/DoIB
         1R4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765280384; x=1765885184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kAxf62pTzqbfwbdvgj6hwDy/PkytkFXzpMaFpR82LU=;
        b=uc+ygdlB+69RxoLqCNew5qxq2WQRYkuEkYE5KNRvXE8c9vJf5XFo6MwzV8F7+IcCaT
         Qcn4VoCTgV+4qnza/2ow6oE82v51G8VaEMC/synCX84a+qcR7+6O1psYKtsfvIalOMZO
         nK6qS0LfY7SusEvXBWMoJq/sTOcvhQP/Y2FGmoyG7zHTRcYxq7CMzc0cPPvNuQQUnElb
         OBNqLmqRa95QZhzhe50/0XXCtgHiMQ46pn+biUB3vhRcOXoca2n4rkqNMGLE/IWybO1b
         3XIOKQJrTr8JczeHYKKLt6wNH3k4YLVzEOLZWXJETWOeY8WMjQP+FeWisbsNVsRCrmn3
         PWyg==
X-Forwarded-Encrypted: i=1; AJvYcCVnXejykZPf0dMIAJv2yQbj3IlPg66ZjQRObCIwYJ0mt28aRy7frhUCXc7RJPXHRjR9Ui5EaXgYi4U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJgEfJDVQzQciFdWAD480Utn6IutSqIi/fsKaRsR/rclU9JAm9
	xQKJ1JEs0Rh0axKIHOiGFfJ7yT0ZM6rrvqLN6HzH1WOAZu5fF11zlUCeVrzX/xQs/x8=
X-Gm-Gg: ASbGncsMjnaachu4/OSTfjPUGURAv7h9qEsnwWIbQQkm+GL/JgJKGxPesNS8PTkrCaf
	vTtGVRQvGiZtt5yBqeCVoGNfSQBe9gDHmfam0lF/+U6kwRvb2ZSAlF+2Ir7cu9hgZf1HewF8sXh
	a2n0Rii5m4HT05MwrP3o0ok6lBWOFJsvKijzWm7lb84Z8jYuF+ObSUqlM+j7bXnSGWCqVii/71X
	j9KnlfYrYIQ2Vbgr5JwaCOx8osC7QaowMyW3Xfxr8cpzm2UpEyvb8SVDRdZE/CIBcqxeqKuYH1O
	PX6fZgvGQ1b5+rB+BFrln4QN0w7xzDJcs3zPsD4QRNevH10lCWPh1BmEN3GdpdRh9VTC6+eno5M
	f7vH3Wy0Kmz0QvP8sSkfjbBzKPdnoPDw5/4dL8x43/Ag5XIgBhgfyi3WZM75J8G7MpuNrWfo5Az
	2Uk7qNalPtn0lyPKmE1npWhY7KcW/l+Njwq7a+UJESUYJfiVz81wU8ZINBbrBYBogb3vAX6TI/m
	AM=
X-Google-Smtp-Source: AGHT+IHnbJN5CAFOHl5yIC3D6z+x4gkBmfIyYRljTQYBs6sfSX1MkzPOFaqjTYXMTXlpBp3XAwZ3BA==
X-Received: by 2002:a05:6000:2f86:b0:429:d3e9:65b with SMTP id ffacd0b85a97d-42f89f5a0a3mr10300630f8f.59.1765280384112;
        Tue, 09 Dec 2025 03:39:44 -0800 (PST)
Received: from localhost (p200300f65f00660846b2ba6e435ad603.dip0.t-ipconnect.de. [2003:f6:5f00:6608:46b2:ba6e:435a:d603])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42f7cbe8f85sm32187164f8f.5.2025.12.09.03.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 03:39:43 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Eddie James <eajames@linux.ibm.com>
Cc: Ninad Palsule <ninad@linux.ibm.com>,
	linux-fsi@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	Mark Brown <broonie@kernel.org>,
	linux-spi@vger.kernel.org
Subject: [PATCH v2 00/13] fsi: Convert to bus probe mechanism
Date: Tue,  9 Dec 2025 12:39:28 +0100
Message-ID: <cover.1765279318.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2269; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=hneWfReMr8JUZ1RklsZR8PUJmQmGKj9ACT99gfEf4y4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpOAp1/pPT+rAixB2bFh3BY3cheK5rmw3oJz+wj At/GyBqPtaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTgKdQAKCRCPgPtYfRL+ TmC1B/wM/YYo1TOXcEiWASOH6rlKw1tqh7zLAdLMks0AAotRQ++yOzy7G3OUvsr9TSgMiW1hMKg F/mQFh1kQ8I2HZe/9kcbOQtfJzQAyzeV+5rw9coxJh6ZFz2d++TnC2GavExLMDOrXDC/K+p/P+Y U0Gh1Dqr51UUoKX37Q14sYSjYQ2UxbCnhcVdcXo5VUwKsfY2qx5zCVJ5z/3jaqYJ3Trcm5t3MyJ vssC4Wek3oeAJlvx+5PlnVF9DkdcbuAoy+zdk3SbvNOUrO44jWMlPmYnFzoMAkCGHeK83pkl9Ds fZPP79ug44bkn97cLjAqtNC8ErsUcC89a9dU+FwXglLUHC87
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

this is the 2nd installment of the series converting the fsi bus to use
bus methods for .probe and .remove. The changes since the first
iteration---that can be found at
https://lore.kernel.org/lkml/cover.1764434226.git.ukleinek@kernel.org/
--- are:

 - (trivially) rebase to v6.18
 - add tags by Andi (for the i2c parts) and Mark Brown (for the spi
   parts)
 - Add a patch converting drivers/fsi/i2cr-scom.c (#8)

In the earlier thread I thought I made a mistake for (implicit) v1, but
I confused fsi with fsl and the problem doesn't apply here as it doesn't
touch the shutdown callback.

This series is not urgent, but it would be great to get this into
v6.19-rc1.  With Mark's Acks and Andi's tags (though they are not an
Ack) this should be fine to be picked up in one go by Eddie.

As before there are two commit refs that should refer to the commit for
patch #2 ("fsi: Assign driver's bus in fsi_driver_register()"). As I
cannot know the commit hash yet, I wrote "FIXME" and these need updating
when the series is picked up.

Thanks
Uwe

Uwe Kleine-König (13):
  fsi: Make use of module_fsi_driver()
  fsi: Assign driver's bus in fsi_driver_register()
  fsi: Provide thin wrappers around dev_[gs]et_data() for fsi devices
  i2c: fsi: Drop assigning fsi bus
  spi: fsi: Drop assigning fsi bus
  fsi: Make fsi_bus_type a private variable to the core
  fsi: Create bus specific probe and remove functions
  fsi: i2cr-scom: Convert to fsi bus probe mechanism
  fsi: master: Convert to fsi bus probe mechanism
  fsi: sbefifo: Convert to fsi bus probe mechanism
  fsi: scom: Convert to fsi bus probe mechanism
  i2c: fsi: Convert to fsi bus probe mechanism
  spi: fsi: Convert to fsi bus probe mechanism

 drivers/fsi/fsi-core.c       | 107 ++++++++++++++++++++++++++---------
 drivers/fsi/fsi-master-hub.c |  17 +++---
 drivers/fsi/fsi-sbefifo.c    |  31 +++-------
 drivers/fsi/fsi-scom.c       |  30 +++-------
 drivers/fsi/i2cr-scom.c      |  15 ++---
 drivers/i2c/busses/i2c-fsi.c |  16 +++---
 drivers/spi/spi-fsi.c        |   7 +--
 include/linux/fsi.h          |  13 ++++-
 8 files changed, 131 insertions(+), 105 deletions(-)


base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
-- 
2.47.3


