Return-Path: <linux-i2c+bounces-13116-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F29F0B962D8
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Sep 2025 16:18:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AC091892AF6
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Sep 2025 14:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D36DC21B9CD;
	Tue, 23 Sep 2025 14:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="m61MBV/s"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FBA155A4E
	for <linux-i2c@vger.kernel.org>; Tue, 23 Sep 2025 14:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758637117; cv=none; b=A1t3xQDg/rMbHt13ZPAA+NRYjTDYS1awt6C8VDv9j4OfcdKu0BuFjQIPGjoFIYrSk+imcvClEGMOv+zqvYGnLSvxgIYssPObLw9oyiiXCy1yjyg+s80a3ewNmMlmnLTdQO5h9bT0iUiNRtFdiscL6sfVpQ92fVR+Fv7LTYaqBpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758637117; c=relaxed/simple;
	bh=dGetF1qRy9QXK0P3a8VW8pHQYytO1lsKqc29yOoYSyU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tff/7+lDGEx9ubsJkLZWpbXfde60TUwA9Zx5nClriLETOkWfasq9tKbvHPZUeiUwmHZXwiD+VAnNy0aUtI1QREJSKR8xjBJFV5i91/QXA/NJoIW7VmK1J1YFTOr9/VtO66r/qjlI1H8fGUjqGu4vE5pAGTaP9lIQKmjPGbq4yag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=m61MBV/s; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3f99ac9acc4so2297553f8f.3
        for <linux-i2c@vger.kernel.org>; Tue, 23 Sep 2025 07:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1758637114; x=1759241914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NFG4tL8lqUh/sVKHN37qHfPMPVZ9QDTBTj4893Vci9I=;
        b=m61MBV/sTq4KrEQzQepc+JQRslZuNMRlDMsyd+DpfKD+ctGsIKwf67kMXHF6AcuHIx
         BS20phdd5i5QJtk8933lRym78Gho+0qBAc1dPIa5C7swHwGbsqgxdf/G1yd6azoLo2IC
         0gSK8fHPPYO/ath+2+tCnL5e1DiPtOJ7p3s8sqBcoF4O2S+DcXNT+YRnF1gEucCsQ0lk
         PGPFjVWwB1LPkRRiVrptyzwDliYVcDl3/4l7ResTdcXdDC32YI8kqKoa3zFOoqwW7BFK
         dvzwyF8Igf6H4rmaygLN4+sNvg4LovAcAeQM2YnrmN5lpwywpKE0xfARbD1iufLwW8eJ
         5AIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758637114; x=1759241914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NFG4tL8lqUh/sVKHN37qHfPMPVZ9QDTBTj4893Vci9I=;
        b=c0uNLPuC/IpkOGGquGTzfrlsYhms9XZBAYIDE4eNK2ne1hFRFLbnmyLd1z+02LxhKS
         ZmXrrg+8Ax7tY24ITjYOOQY1m21cojGhBO/w+D43E3aUOgI9aSpiGIQtgGbpO8iBosc0
         hVba1xm24V4/ZiqcOUjZPH5DsjrcSp0G4jpISAq+qDYglnyNWPzE7E6J5R5GvPwY1ZmK
         p02BXxXfq4YGUAcnao3R3rTHPDHsuCR8o0MiYqH6AM8ic2c9uo9z2z6Wi7RH7+T5p9Qn
         G72PXICDPz7o8OqVD1QTfd/AIDu8De0sIBbDU6SA+RIVoI3u+8V05C0PmEENkpms4Hel
         AIPg==
X-Forwarded-Encrypted: i=1; AJvYcCXJejEzQxMVHHTBeLHtbnFmLygYvw45NAVjhLrkDRfKwMtR08E3K1cKRBM6CxtxkmU6+UJu35Ql3Qk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwggCzb2tsuObqA1xUMWs7Cm77kAk4P4F/Id0oFkFBFNYfsLpHB
	OrAk/mvO2/Fn/mc9dlKBo1f62/DSXvCvVyix4YZ7D92NaMfVveWaUi4XbsPIyjDB0eo=
X-Gm-Gg: ASbGncs1d5flG2DEx9CfLdAqEHCNCBe1YFwvSCOvncyBodSlOv3Im24HRXXbGPzAdLB
	PAZN0M4FlxsLI9yDtEAwNcgg522wf4DPbXo5fjlY3zCpfVb6MILdFGvQMGjyVjZ9agPLzwcwdai
	XptVIC8VW2gWAALWFrAOPUxoK0L78asR13M/EHpE1zzRPTkE1aaZuaDMvYRuATXSmq3CUyrMHaM
	/szohUavM1XhlnGRGBW42dB71XWIkUJDZqoKTQh5q/suxIK9AzaISnE3Fga/cnAMBa9Gmbr2H//
	gmyMWPtw33wfAFG1cZLs7CueV7cZCkeDZdUbxRa9UyhwLNpRe9SiXPhENs6GVbwRWmu2KwlvCUG
	GkGV7LRxYcMBWdEYc4HOL7Kgb0eNzRa0cf7l5t6TdoLc+NK7RpbxP
X-Google-Smtp-Source: AGHT+IF4vqcfWEYZtZ/S8nA08HR0jyyV0IaZblTvH4YW512bTSjwjlBru1lEZAr3DAhQSemddQNZLw==
X-Received: by 2002:a05:6000:1866:b0:3ee:b126:6b6 with SMTP id ffacd0b85a97d-405ca76faa0mr2014826f8f.34.1758637114129;
        Tue, 23 Sep 2025 07:18:34 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee141e9cf7sm23617713f8f.12.2025.09.23.07.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:18:33 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	wsa@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH] i2c: riic: Allow setting frequencies lower than 50KHz
Date: Tue, 23 Sep 2025 17:18:26 +0300
Message-ID: <20250923141826.3765925-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The MR1.CKS field is 3 bits wide and all the possible values (from 0 to
7) are valid. This is true for all the SoCs currently integrated in
upstream Linux. Take into account CKS=7 which allows setting bus
frequencies lower than 50KHz. This may be useful at least for debugging.

Fixes: d982d6651419 ("i2c: riic: remove clock and frequency restrictions")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/i2c/busses/i2c-riic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 9c164a4b9bb9..b0ee9ac45a97 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -386,7 +386,7 @@ static int riic_init_hw(struct riic_dev *riic)
 	 */
 	total_ticks = DIV_ROUND_UP(rate, t->bus_freq_hz ?: 1);
 
-	for (cks = 0; cks < 7; cks++) {
+	for (cks = 0; cks <= 7; cks++) {
 		/*
 		 * 60% low time must be less than BRL + 2 + 1
 		 * BRL max register value is 0x1F.
-- 
2.43.0


