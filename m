Return-Path: <linux-i2c+bounces-10637-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C92A9DF4A
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Apr 2025 08:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 629753B3B7B
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Apr 2025 06:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5260C23770D;
	Sun, 27 Apr 2025 06:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RfKLc7ae"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C2C2376E6;
	Sun, 27 Apr 2025 06:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745734583; cv=none; b=WtsIdtAagAPPiGnlw2wqo9hAcOw66YiUIA+qzsyQdckOG9K2SJ9H728VDGGbYK1jRmRhGbD6elAMPo3+5eYry7PAl92R81jzO8mE/AFlZ87coKKT4tKuFopqq+xlghNyF/6awFZC7fQxJxkX7MjhFSC7Qky3PxEFl0ES9P7W9UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745734583; c=relaxed/simple;
	bh=DtaW7OP2HYTPn66Jo2Rzozz1dqRdlYrtqq0+MD41MKA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aAZAqvU4hljU+vbNEQ0myx8qdQuEVZ8Nu2WoSsAPFzE+kGx3pY47WRI8wSMBJTHEo5NNn6hDL8OIwzCcgvkT2WcoAnI2Wao9gsv4k/dUgJLnQp0UZXFWTTkWyjbLsSLUi8BRpnucaBOkb02uRNgl0uY2azkjrk/fLe3K8UYiSjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RfKLc7ae; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-af9a6b3da82so2373949a12.0;
        Sat, 26 Apr 2025 23:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745734579; x=1746339379; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sVkOXl+FItqnBG4PWwNvXOPdmDOL8HuWkGunCwBr2+Y=;
        b=RfKLc7aeBoqMFB20O9dG2TGIxdUPTBQKy5wvpZCsTaJRSHy4Jokg+xLR7wmfSbUcmS
         Q8d7ClF5L+DRlrsyVAMmtAZlW+jgIQ5/JqCdH/0Uvfk2hU5h32OMZT/9He7/yldXzSgX
         tyacy2ao6Zf8cmausLSDM2qEUPCP/2V9fVLySCfiPRL4i1ovwYbL9O+2VInTJ4erw+ZS
         UuGyYGBWyY4vN6xMZs9kPH5SU0EfhYXn2wg/MtQ9KiNrcg4Xpoan6f0TmCK7tQ87lsEM
         1FLuPOQ3q5C7n6FPKXxa6KWXHPVAPK+21Z/7yJU3PWZLLk3t1IOda9XYHrnqTlXVoxGo
         ezog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745734579; x=1746339379;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sVkOXl+FItqnBG4PWwNvXOPdmDOL8HuWkGunCwBr2+Y=;
        b=hgLGbYn+d2DL01YCsEpofNvQV7ROV4XhpASwj3zaKzVxbLPTJKGDENNdiXq2w/uowd
         1wWLkwy2K6mSQNpTKcXUzpamRnbkHJBPkGO9SPZMTWeurmkhLNjLTpWyDEjp0BZCi029
         H5NveiB8oMwknOK/n3VFSj3mSUcrMDBEwYa3nYuDDWtgfOIe2xash/2TDJrDB2WnwU6G
         dOni9VZalYx0R1grjJ25KmsbwxJoUxyuFO+FNgIG3k1DpB4IZUFPibdcFUP7xbGlnT01
         1EoEivaHreHtT54FqX2MD6lQzq72mETUbveUMv8fiFbNG3tTB0Tj3sgIkuTp65yb/3mJ
         9LqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoHo9Ph6/JEK+/tMMkHqDgmNRmk20TGB5d6osjVRStiYvy5iaTloYBKTV7sEbGl9xXsH323e+FmyYo7E8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyaT215majCRgluZHle83XRLhaY/O0NjRUtgzAb2Pmw069wbXs
	NVojYTPuojjHiOl/O33cqVYECGCUNFE1ooKasdYPh3eM3+PvTKJhEPY6dNMGkKVVfaZM
X-Gm-Gg: ASbGnctwWiYqSTELgBGMAxq089q7LhNkyVT5ObaUkrMV6hZ6OSs0xb/4iclcDQO4d4R
	o8DXn4Hx4MhUXvx8DtuDgCFEPfF5vJqbaDNhggUQAToi8Zce8Ezti43CUGn4fo557FV0SZ6LxaZ
	yYaHb0OMZgzYiGGFOfRNT2xL5Wh2pjwYqvyRIP8b8fVT1mz7NJ4iJ5DkR3u63wEWXJJ1kyKhqqd
	qP+ceNik+Qh4VdbjRY7dqvf9+MM5UM5EpkmI++G58Bj8b5ZfJLANjfFirreWkzWz+F4rKNt8on4
	YXfRQrJrJ0zUfdbBmfaoDwWDsPt8Y8JQVLA=
X-Google-Smtp-Source: AGHT+IGBhNvZrPFXBrP6EMdlDeC9iJtG6LNBbpfeI0Y349BALjf9LLYTf9Dnt8oACeh5pZIUz91ILQ==
X-Received: by 2002:a17:90b:3a0e:b0:305:2d68:8d39 with SMTP id 98e67ed59e1d1-309f7ddd52dmr14596177a91.12.1745734578705;
        Sat, 26 Apr 2025 23:16:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a0d:2683:c100::bf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f782d461sm5080287a91.39.2025.04.26.23.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 23:16:18 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Subject: [PATCH v2 0/2] i2c: imx: adapting the mainline
Date: Sun, 27 Apr 2025 14:16:08 +0800
Message-Id: <20250427-i2c-imx-update-v2-0-d312e394b573@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKjLDWgC/3XMywqDMBCF4VeRWXeKkzQqXfU9igvJjDpQLyRWL
 OK7N3Xf5X/gfDtECSoR7tkOQVaNOo0pzCUD3zdjJ6icGkxuXH4zhGo86rDhe+ZmEWQiLgrmqpQ
 K0mkO0up2gs86da9xmcLn9Ff6rX+plTBHIlu21Fpn2T26odHX1U8D1MdxfAGDSpRyrAAAAA==
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troymitchell988@gmail.com>, Yongchao Jia <jyc0019@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745734572; l=1057;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=DtaW7OP2HYTPn66Jo2Rzozz1dqRdlYrtqq0+MD41MKA=;
 b=UQtKorS1lD5nKkZmkn2u6pSa0dlWJkQzqKzsVPpcbHAb8Slpn66/D3G0oDkLFVwsW3schQyFm
 P7g6OrbvRz9CPWLOHqVmAs8/0owueY6zScF+rcKWD8vSwBXI/eVJbrO
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=

Since this patch[1], we have new callback function names.
Since this patch[2], we can use `guard` to call `spin_lock_irqsave`
and release this lock when it goes out of scope.

Link:
https://lore.kernel.org/all/20240706112116.24543-2-wsa+renesas@sang-engineering.com/ [1]
https://lore.kernel.org/all/20250227221924.265259-10-lyude@redhat.com/ [2]

Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
---
Changes in v2:
- Add more details in the commit message
- Drop a useless variable
- Refactor the logic of i2c_imx_isr function
- Link to v1: https://lore.kernel.org/r/20250421-i2c-imx-update-v1-0-1137f1f353d5@gmail.com

---
Troy Mitchell (2):
      i2c: imx: use guard to take spinlock
      i2c: imx: drop master prefix

 drivers/i2c/busses/i2c-imx.c | 43 ++++++++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 23 deletions(-)
---
base-commit: 9d7a0577c9db35c4cc52db90bc415ea248446472
change-id: 20250421-i2c-imx-update-d11d66dd87e8

Best regards,
-- 
Troy Mitchell <troymitchell988@gmail.com>


