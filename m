Return-Path: <linux-i2c+bounces-10951-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9440AAB4C15
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 08:36:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C73323A5DFD
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 06:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E81551E9B2B;
	Tue, 13 May 2025 06:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ShDiaBFx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567DA35976;
	Tue, 13 May 2025 06:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747118197; cv=none; b=W0iiDChtZu2UPVOLf1SXp2xBLA3DIcdoCfwBLQAYMRkcOsbL47IpWbpPt2qQoCzm0v1oYiIXvenhTn7A5bg9NNdi6oxGalxyWlvjhoWSJQAYDAfgmhwArSU2zvtSjFXSazGTQ8Adv1zN4UELE21WKflcdwhxX9Ie0wPAeFVhCgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747118197; c=relaxed/simple;
	bh=Zc6yQyorlVRgdIL0rSi1mnvWlZcO61DoFG74OAaARg4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rBi7haNUHseJLcBpY9doofVZ2gzKG7CIm74xPjx6n4Fqjig4JgSdE1ysauZdaVJbVIFZq1kJNhdn05VvUTIpTzW+eUoMRBM4xfmpF3I2THkLGWU+XZ2bknkhZ2aI3j3tvFm8TL4ylX5V3JVuIf/ek+RLS2mTMU90LrFsfKIksW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ShDiaBFx; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-736c277331eso5554995b3a.1;
        Mon, 12 May 2025 23:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747118195; x=1747722995; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JAfYIBnKYpDLRaIrWgcSn8A7MH7EEr05jrz93Ajb9cs=;
        b=ShDiaBFxYRQeXbwpcsg8YcEhu2HPSv7sMHFoS/3PXqlIbqutJGeF/6Ih4cCR2hzdcR
         93iHtySZkDkqLJttYn2z2o8Nlf6F4AYTIFtw268vwYAS1i+z7HIXf6m7RGnNK3N2aeRK
         GdpipiYw4GEzBc1LZXCKNLY6N1jel/Q6Jx0PxwgDiH0LZHdT9cRDWGOUEnp3QcKVGmoM
         oEhLfNBY7kwei3FZ9yOIIm57G7Sw9v5G5La6CVqJLqRlAlu6caEJoGU4La6KgeTHg327
         nIO822TtiNnY/T/lM6BBqXYsu20bIYqybn1gKC47CRBtafbSV/Y7fgbAi52GDlhQPcoP
         XM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747118195; x=1747722995;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JAfYIBnKYpDLRaIrWgcSn8A7MH7EEr05jrz93Ajb9cs=;
        b=e4J12n+9VzFusio18FWFcf5V+ELEP+6tJx64dBsZm9dqbCXIQOTqwDAuGIBDXK0GmV
         E3y/iq8p3pOiKwe2nI27Pi6Q5PzlYc9zwt7txChOp/sJ+HaCdUjfbOVivPWghWuHHjzC
         4eS+0QCVyBdKH9gaHH/I1dGMWpavb2oLRaEgoQXBKSTKuQK6EAmw/yaxszRx07KmLwIi
         3G67AKo7dUGn3Ph04AFt4wYxQkzByqe8DWjh3X6ZlH0evCM2rd9IM8nrVwMAckt1tPHu
         Z/GisFXy1XmT7GurkWedV+4Jj9qaxUoZgduZaBIZ8gVrGypbH6T92PFx6VeW3ImZ8d+s
         DUiA==
X-Forwarded-Encrypted: i=1; AJvYcCWqHtuYDMx75bkkMeiGGNbbwvjZmU/hrc5JlYsl3c6DJq6ETrINKhx2fhx3L3D3CdpyEkYG8x0n4h0/SI0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2haWaNirNvlTRREOPSLX67BNL7JjsyBjzpR5b9CLCDioY2ShI
	sE84tUg5UOr0SlW/qpFXARjC2T8tEkDoBRJdoo4G6Ws3vxEviTu2Ch1fFwWZBg/WDfR2
X-Gm-Gg: ASbGnctHKxZNTawX8W8LkEoeFVXy61Iq6cwzLacfxpN8IZtZ61VviEuD/FOqmmkKmgW
	O7qcjSDzVb8JzTqPsG90zsq9ICbS/y93nptVOgphnm1+h+ZJTUOfd+NbAdVTxh7uGS00AKqqgJs
	7yTanDnA3Kz2pm0ze60N6HQEMZKu2P3lS+OrXdZUgQEWqekWnOsUJIpFHjX9iFv6aKkKevudhUQ
	vEKKmh/jyFayZJ9SgaHqdGlx5bWsR11809nZATZ/WB8kp6YxrEmlHoDkKi699fPmHN8pnrL1Oy6
	gMXwAjaHWf1V3wbw1Ram0gQDDTzwxG3HronV/NHISGfKWiBUIj3VYI4B8bvS1v0Tjw==
X-Google-Smtp-Source: AGHT+IHAzcJWPedcZbhkiu5M1cagox2tF+zXlSND/8z+TRNJWT8nZ3aHFKNr8Qq+zyYM82VNJEGSQg==
X-Received: by 2002:a05:6a21:150a:b0:1ee:5fae:8f6a with SMTP id adf61e73a8af0-215eb6dbd7cmr3827294637.1.1747118194892;
        Mon, 12 May 2025 23:36:34 -0700 (PDT)
Received: from [127.0.1.1] ([91.124.30.36])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b234a0b76ccsm6657936a12.27.2025.05.12.23.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 23:36:34 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Subject: [PATCH v3 0/2] i2c: imx: guard and drop prefix
Date: Tue, 13 May 2025 14:36:12 +0800
Message-Id: <20250513-i2c-imx-update-v3-0-817b7426a67e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF3oImgC/3XMyw6CMBCF4VchXVvDtJSiK9/DuEBmgEnkkhYbD
 OHdLaxIjMtzku9fhCfH5MU1WYSjwJ6HPg59SkTVln1DkjFuoVJl0kyBZFVJ7mb5HrGcSCIA5jl
 iYakQEY2Oap734P0Rd8t+Gtxn7wfY3r+pADKVANrWUGuj0dyaruTXuRo6saWCOnL7w1XkqEGRv
 mRPY/WRr+v6BbXPuUnrAAAA
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troymitchell988@gmail.com>, Yongchao Jia <jyc0019@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747118187; l=1186;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=Zc6yQyorlVRgdIL0rSi1mnvWlZcO61DoFG74OAaARg4=;
 b=q9clC7BV7yQN12t9Wb9qmMCulgBg+RP8VyfC4iP7GyDFUeDvCVNVajzQDZyDIgsMVxU8yBsdq
 blP52SIuTgBCGH3U2by9e+djgC2nV65clel6gFiWKkG+k/Bnec9xulx
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
Changes in v3:
- use scoped_guard
- Link to v2: https://lore.kernel.org/r/20250427-i2c-imx-update-v2-0-d312e394b573@gmail.com

Changes in v2:
- Add more details in the commit message
- Drop a useless variable
- Refactor the logic of i2c_imx_isr function
- Link to v1: https://lore.kernel.org/r/20250421-i2c-imx-update-v1-0-1137f1f353d5@gmail.com

---
Troy Mitchell (2):
      i2c: imx: use guard to take spinlock
      i2c: imx: drop master prefix

 drivers/i2c/busses/i2c-imx.c | 41 ++++++++++++++++++-----------------------
 1 file changed, 18 insertions(+), 23 deletions(-)
---
base-commit: 9d7a0577c9db35c4cc52db90bc415ea248446472
change-id: 20250421-i2c-imx-update-d11d66dd87e8

Best regards,
-- 
Troy Mitchell <troymitchell988@gmail.com>


