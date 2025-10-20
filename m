Return-Path: <linux-i2c+bounces-13657-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A103BEFA34
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 09:18:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13FFC3E40A3
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 07:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD5562D8DA8;
	Mon, 20 Oct 2025 07:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kp3MTYtF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9E52D23A5
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 07:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760944680; cv=none; b=MvQLafo/+XJHoeZPAdJ/rzrL64epEl4kXUe5r7yr5schMIItBsTruEWlHPdahS6XRYfU3Q9qelTMXo0cr+H+M4w4sZKyFiSVKjAyPIkHFAHLTcclhUWg6u/s8LbTGpOfEdPw5U2r6c8gVhUBESy5CDR3z2uXJa2yufpDmtF8n6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760944680; c=relaxed/simple;
	bh=4QBKB6Il0FtSYd/ap/LeXMOphioqXNw9dMPyFWJ8QJI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OdRexVnkBO4mN8cyskSy/6+VuBIVjmmzHTDA6+H+i33UR98kThZz7wVRyUskJ2FxwtEGulAPlEsV4JMlf0Ijtfx85gCjxewgjgEhFAqUVO+WvHPopMioGHOr56MYG/DgiLnCOiLD6BxM0Sr0k7tH04wkexmVdgJeoXSAm3o4tjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kp3MTYtF; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-367874aeeacso49228271fa.1
        for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 00:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760944677; x=1761549477; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dc0V6uSK5r5A6NQwmKa55NukJxjqQrLEAaKU2mAU2+s=;
        b=Kp3MTYtFbQWv9evS7ICdGO5yTpVshRKROtwczbTJS4kABgjbCeRi18QOYLd8n2fjK6
         vqg0KF8uTquy2FH0xg+ssPGkTH6SJA7nsuGKXf2chIu9cPhUNS7EcIVXCX71ruY8Kx33
         2d7ZIakaeHxOB9Syt2dU7yZ+w9WIBD/2BQUVtS/x4fNhK0YU73RO6kN0CtdeHUAF7fgi
         8AuJ4SRzOt6bhUHE6KZcDMYIw93ML3l3/s9L+w+KRQyvicyzT3S2f3UY/3ogsAtOPDIz
         10HthIYF/vupwVqlLWZ1qqJKuxcMYlIrs2s2Hnx3chd119MaiIbaMc/mUGgRXmu4X566
         9zmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760944677; x=1761549477;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dc0V6uSK5r5A6NQwmKa55NukJxjqQrLEAaKU2mAU2+s=;
        b=pu+Eu58qEguHV2m8Fy3YmBWaV+eiFokB5Miix89RzwzmPVr0hUkrcAf+/FJQI/Bv6h
         cN2ZXm1ly3aVCbY3LwtkaTx4r4fBWPpdLsXGNvL1NTMrFA581mq5ql14XfdSYYmN2Hgj
         aXQO5ojRuff8HaNUWMP8Ecx6+XEA8hA1bWH5/6itpHXYqloHtkcvQrAAzE3gpOvhERTL
         XkB9JEJ8+J4ZYVERm0Eq46i9fMeLG6oiDY1vVorwUjd36Y01mt89CNycY+aQ1dD8uHKr
         veSvlTmP2T3CQe9xqMWvPT4TUBAekN8zB8cfa1W34vnjAX4dpU7BClwhanQr+P/pmOrD
         QOSA==
X-Gm-Message-State: AOJu0YxdLmWJJjFbmPlU6jW8duRi7SVnd6KMDTJfcOm0SFq1OtGEv0G/
	a9LYfOSzxQW0UJ3or+cncSrrRKkZWo80TA+wGocWAu78qGGRFOrSgjGY
X-Gm-Gg: ASbGncuK3bgWziwxfGOTt2aL22y8kLwc5aZ7WYJvIa5Q9eubrxtvxtv49/DAFfF+Zdn
	04+Kmgn2GZ7p/93HUSN8gc5CFiEppLwUptehejw82Vdal58vTtS21otnYZPduCxBGejm5a1qhn9
	hVr1ITjegwMI6/96RT/ob8bf9dhFZd/bCJ/R3nTVagje/oasI77+usa/lfTlt+9/BKrlxqwHOmu
	uC3x/1HiXmu2jPEoosZ1oGgyQAZOAvw3VzUHivNWMqf437SknD2bNbLnUr5qIdOssTXPbvvXLd8
	cxxv6VCEwSnZZ8aXh0NEAKu+PwKrATlbutyrN+FaKQ9L2kjOkfZdBiKtI9RUaiLscTfpz0kFdQz
	an8a3EP+FunU/SzmtMYGnO97Lu8lNWQj59staJhABcX8iHMSLhEGOUDN/u4SAtPlti7MQ0nS+vW
	cS/zlFzHwk42wtttBeorC1Vgm2+AjPOhEqkbSYj+aby6cUuQH6QfhhYwM=
X-Google-Smtp-Source: AGHT+IFIUr81RYs1HnZHUDaeh17UXtMO+MIIH4Sl+yVvk+zd3TV85RaBPn3bfogTKTF+CcTwgZ/zgg==
X-Received: by 2002:a2e:be88:0:b0:36d:a459:f0a4 with SMTP id 38308e7fff4ca-3779782374emr39869861fa.5.1760944676478;
        Mon, 20 Oct 2025 00:17:56 -0700 (PDT)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a921ae62sm18863341fa.21.2025.10.20.00.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 00:17:55 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v3 0/5] I2C Mux per channel bus speed
Date: Mon, 20 Oct 2025 09:17:23 +0200
Message-Id: <20251020-i2c-mux-v3-0-908ac5cf9223@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAPi9WgC/02MwQ6CMBAFf4X0bM12Cw315H8YD6WtsImAabXBE
 P7dQgzhOC9vZmbRB/KRXYqZBZ8o0jhkkKeC2c4MrefkMjMErEALyQkt7z8TbwCUdB6NLx3L71f
 wD5q20u2euaP4HsN3Cyexrv8G4t5IggPH2urSKAFawrXtDT3PduzZ2ki4ewLg4GH2GqXrSpXW6
 UodvWVZfl4u8ojWAAAA
X-Change-ID: 20250913-i2c-mux-b0063de2ae4d
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2666;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=4QBKB6Il0FtSYd/ap/LeXMOphioqXNw9dMPyFWJ8QJI=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo9eIEheq7Rqmcp7HaHOoJV1mtgdBS1lD+tswqa
 CBMXmGlcneJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaPXiBAAKCRCIgE5vWV1S
 MtfnD/9lcCqltRfYcuFLqJaGS85PuVBltcB/MmI4glYwIypiT86qEbIRd/znRNdYvwN5eUJw9m/
 1smtKC9UIIZ0brBXY+kGiNagQ3TZMxVu5tkMPuYWwRsr9Ew8bIQgZ7KDrzKHGjkvLGSg04lV21g
 sahrz1WrWqNkiPYqx+cs14PLmDCejJ+I4cA5CdWItiGHuFWnP5a+A1Y9ybeNYqviGmTZU22v2kO
 rsud7o993aMfWsb2qKz08cPr51wR/qIhoqdLK5vwlNOWXovKcPAYj+xA+w4++hV45tXM/UDnkOi
 DJ0MCxAfBGt1+tX4HgugIDJbCoWZ9m9wwyB9rABvR+Lc+AmvQ9z4uuAHOZl+xehPq1hrG/G34HC
 L3GhqXsuq7DVMdmS/OTF1gXskhLY5vYb+mWWUTiC1/CAlm4Ww7948aiJfZi3byW2cFSq2JSdcpv
 se73CpFn3fAI4jnTqNeOq+UN+JiaRdAaHFSAy+PWTap5YGwEFKaczF04MgpWheKBIcVt19l90IE
 hSYoqKrnOfjvcvWuLY5IrYuCwlEU7/qG4SNjpMNNjOoZcjfErHNzlKiNmuBehPq5bymf1f8eYD7
 uWm6x9IJJSEjc4bGO2cy6mc7bpVr2e7T70dT0uPI/XoOJDpcnnCzYzYr86CLLs5x+2fBTinYFR3
 iUOLAlBmvPYXRHA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

This was a RFC on how to implement a feature to have different bus
speeds on different channels with an I2C multiplexer/switch.
As no major complaints on the design came up during the review, I
decided to submit the series without the RFC tag.

The benefit with this feature is that you may group devices after
the fastest bus speed they can handle.
A real-world example is that you could have e.g. a display running @400kHz
and a smart battery running @100kHz using the same I2C controller.

There are many corner cases where this may cause a problem for some
hardware topologies. I've tried to describe those I could think of
in the documentation, see Patch #5.

E.g. one risk is that if the mux driver does not disconnect channels
when Idle, this may cause a higher frequency to "leak" through to
devices that are supposed to run at lower bus speed.
This is not only a "problem" for changing bus speed but could also be
an issue for potential address conflicts.

The implementation is split up into several patches:

Patch #1 Introduce a callback for the i2c controller to set bus speed
Patch #2 Introduce functionality to adjust bus speed depending on mux
         channel.
Patch #3 Cleanup i2c-davinci driver a bit to prepare it for set_clk_freq
Parch #4 Implement set_clk_freq for the i2c-davinci driver
Parch #5 Update documentation with this feature

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Changes in v3:
- Return -EINVAL if channel is faster than parent (kernel test robot)
- Link to v2: https://lore.kernel.org/r/20251002-i2c-mux-v2-0-b698564cd956@gmail.com

Changes in v2:
- Changed bus_freq field to bus_freq_hz in davinci_i2c_dev (Bartosz Golaszewski)
- Removed idle_state from mux core (Peter Rosin)
- Link to v1: https://lore.kernel.org/r/20250922-i2c-mux-v1-0-28c94a610930@gmail.com

---
Marcus Folkesson (5):
      i2c: core: add callback to change bus frequency
      i2c: mux: add support for per channel bus frequency
      i2c: davinci: calculate bus freq from Hz instead of kHz
      i2c: davinci: add support for setting bus frequency
      docs: i2c: i2c-topology: add section about bus speed

 Documentation/i2c/i2c-topology.rst | 176 +++++++++++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-davinci.c   |  41 ++++++---
 drivers/i2c/i2c-mux.c              | 116 +++++++++++++++++++++---
 include/linux/i2c.h                |  13 +++
 4 files changed, 324 insertions(+), 22 deletions(-)
---
base-commit: 22f20375f5b71f30c0d6896583b93b6e4bba7279
change-id: 20250913-i2c-mux-b0063de2ae4d

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>


