Return-Path: <linux-i2c+bounces-10502-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEE2A94C27
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Apr 2025 07:37:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 500FD16C1DD
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Apr 2025 05:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCBF51EB18A;
	Mon, 21 Apr 2025 05:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cckQzwxV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3031D4A3C;
	Mon, 21 Apr 2025 05:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745213813; cv=none; b=dGhSwYrFQWHnBxnWg7QWQ6IfkihiHrr7LTbeZGnhWxWIw53bceQfVnXtjLxiPi6pAKdIavOEAp/JIAvVGAtae/9MI48YEY3vMPkXYQLkqKdWkDIwYyZPKA9qszYxtzoCtMMRETX3LZWTwp8yT9UonrHnkH0AKWd2XrD8zs1iRWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745213813; c=relaxed/simple;
	bh=jd5oGOx/Si3BQhqWyzuRg6hu/nzPXuQweQYGrnIy6Fk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VA7E0Z22y170cHj1Qk3NCl1iaKW8OiXBVAuIJ+uusQx3lcoF7fY2QnWhG4almehdU2cPB544A4QHURJgO6J4olyJPPqoqVDO5k/Dr78Jobw3iZldtea8tk8RqFpEB2+gFuAOP8xEZklCe3+2zXvRtNh1yYjAM3KOKprzW2ZDh5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cckQzwxV; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-7376dd56f60so2583152b3a.3;
        Sun, 20 Apr 2025 22:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745213811; x=1745818611; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0NfzkN0fnmS5Mofw8S9sgeOeVdElW9vhWvMoUL3Xt0Y=;
        b=cckQzwxVPWWDteUBonck9cz2BnVrw8RIEPSMStSldrBmLukUmNSJQyKUMX0n8FOjTr
         y10Iv35qQe3BHTiMxB5H+NSeNrdchgaT0fGvweOljRnW5l0+7V0mfThJS2mWH1GC3AVY
         029+jODJ3GdwbO10r9/t0pPhorWUAPoJq7xjiQ2X+G9aHKvtlyYS3M6xR7LNOyVSozTs
         9ujSM1LVct5eOvi06c5sK0iMy7NeXc7mIANN7c/EJIr+CPIx+KSLMiwh92pt7UMtOz1c
         2bVbaBGCF8mFSXUAoSD1kMbCcvUCrD5BWjgmQrFSLRtmzXJllOgIavYh5/9OorMMpLQ7
         uBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745213811; x=1745818611;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0NfzkN0fnmS5Mofw8S9sgeOeVdElW9vhWvMoUL3Xt0Y=;
        b=JS44/+SGPLaMC+jG038iQyxbCAqesCK97k605bmi0BIdbkEfDdNd7t+cerDUVUnUPO
         vwthIc1FS1a3H4ogrbb9Fbzwd8IOzSfcBNv2Lyrn3M/odUgDODxkKn+SX0XXcpFCD8v0
         tVYBUhyjMRph8q0dXOswZ3yMvHMVYc8PtYbmAK1wPo6FKarsJdmuWCnGK42nhn4cN81g
         s4Fyn746Shneee8YOC8l7elR2xBmbSbSVEJFBSAsmay42XVeOwpcm0WcaL81Mec6OUD0
         JWDp0wcMbbcBhPkuKD0YeUqitRsP/ZPLZBaJots0upw2J5TfC7chxzXOLSUJKqyu5R9R
         iziQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYS26ulKGiseMckw5N+meZEmJEHgWQGBkC25xF5GOznnld+0yYBkDaj3RaGAQBa86CiSMwEa+s+sIa7ps=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUYw8eFuDiQQmvEn/+4z7rtlAKBET3PnRjuP0WUu9/SmZRW9DQ
	qYEYU/W5H4SYo0MyZJdEzjJOhpIyhhx7G/56nYIGjALjJ0a4GUxA
X-Gm-Gg: ASbGncuGd+iBB73ieFlX2ANjauBvKPIVuEZi4YuttGEGxGCMI3nRvWq//nB7DHUowj6
	fpFX0SYtMmeaNxRkBubNEG3y2tLHM3Si2VvQD5776/2Yx0MB59676UigfXuEa1ZHfRvZj7Wx/Ki
	92WHzg3q2OZmO0OX8UFHLRNfEi7RWNwmX4Fjv8eqYdnSStY1CO1bhek9rfeegTmwCKXoDS/Xk+F
	27PLr+QnLLY2tD+bi2Kv3HU+HZKR4QKF2AKBogvV995+298XfCm2m8w77/JqN0DNObowfuKkaWx
	8h/E9D3z9aWAG01X86rmHiVF
X-Google-Smtp-Source: AGHT+IEqHUOUzK9rh3J+NJTMwGu4gKoRvfeJw0Sh1VhcSH7waFXHAmJiBxIoiBwRq+DUpuFuKqUz/g==
X-Received: by 2002:a05:6a00:4606:b0:739:3f55:b23f with SMTP id d2e1a72fcca58-73dc14d3124mr13013679b3a.14.1745213811299;
        Sun, 20 Apr 2025 22:36:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a0d:2683:c100::bf])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8beaf2sm5634270b3a.5.2025.04.20.22.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 22:36:50 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Subject: [PATCH 0/2] i2c: imx: adapting the mainline
Date: Mon, 21 Apr 2025 13:36:37 +0800
Message-Id: <20250421-i2c-imx-update-v1-0-1137f1f353d5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGXZBWgC/x3MTQqAIBBA4avIrBtQ6Y+uEi3EmWoWlWhFIN09a
 fkt3suQOAonGFSGyLckOfYCUynwq9sXRqFisNo2urYGxXqU7cErkDsZyRhqW6K+4x5KFCLP8vz
 DcXrfDxlXioJgAAAA
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troymitchell988@gmail.com>, Yongchao Jia <jyc0019@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745213806; l=809;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=jd5oGOx/Si3BQhqWyzuRg6hu/nzPXuQweQYGrnIy6Fk=;
 b=TxNveZGO01XjAtbsV0BKVuLJNalcayVMoh5gzsY1Su3nli5TPvpvv7Edu1GqZdmBjy9whtRWt
 Q2gGB+1aSJHD3NMjOf48wZt8iGFb5JQy3/1TcqMGOITcFQvAiSyYTgm
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
Troy Mitchell (2):
      i2c: imx: use guard to take spinlock
      i2c: imx: drop master prefix

 drivers/i2c/busses/i2c-imx.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)
---
base-commit: 9d7a0577c9db35c4cc52db90bc415ea248446472
change-id: 20250421-i2c-imx-update-d11d66dd87e8

Best regards,
-- 
Troy Mitchell <troymitchell988@gmail.com>


