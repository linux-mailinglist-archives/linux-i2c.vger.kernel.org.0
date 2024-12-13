Return-Path: <linux-i2c+bounces-8498-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2549F148C
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2024 18:59:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B112188C830
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2024 17:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8EA21EE01C;
	Fri, 13 Dec 2024 17:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WYujAjVh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8731EBFFD;
	Fri, 13 Dec 2024 17:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734112721; cv=none; b=nCYfm1h/THQuTv91oNebPpAhaa2W2049a/R7mdJSxsP8XWDD4xmzIlD151xz2nkUCjGOCJJFwpovyHrgRxxZBzdlG2MIb3EYDG9vhUtww12snioz8S57RoD/ka2yGjV3zPU0ijyI+/3LjG4SkZsIod8iK9RIgCxHScWsqMN2Ey0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734112721; c=relaxed/simple;
	bh=VTDFUkxwn4kqGox0RWUxsUygIOXtAgoK5fkkB8ExnlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SBXx2yjL+ktFSHMqcun7R4MbBF73llLSrIgDPBbJG7I18L9RJJkUGfpra5bBNYKOWhpUF+B0SRA2SVSce23S7I4PEPB+tgl3KqJnZgEQxUSnVXbLHFheXCZJpNAxDDVxoMt82Xr400WkLtxnwlOMA/nUKWyZM0/U04fYoRbPU5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WYujAjVh; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385e3621518so991496f8f.1;
        Fri, 13 Dec 2024 09:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734112718; x=1734717518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lPNf7uIBjeieW0BTq46/mfPY9Pj6if/ReihPK1Mbj2k=;
        b=WYujAjVhl3aC1KZOBYGEFTxoF8KsLyRb4hmM8aPVVWGoK9CwW15GiB9BJdNcOO9cPs
         RjTC7H1aVahNUPamT0i80L1tqI3yzVl1Xh86d5/j1prXTKH8o39ATYKxCrv4A7gKkV0O
         E/cUmQQ/j10s/2XplRqPTopObkJLp4Z41pYItyCg/3umOoWwMLiZ016Vq/xVyxSd4OCY
         LYn5ByLHnptCzFIBl97oYa0tiGiFKXozITtZTbvjTpExpmSQkyiT4JAN2MF8r2GlDg7u
         s3rdj76OTeOgC+PnRoRhC7uIXLA1dWitmyZzoMGRVOZyqlsz2nhGx/bW1xThXvmSg6fy
         CgRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734112718; x=1734717518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lPNf7uIBjeieW0BTq46/mfPY9Pj6if/ReihPK1Mbj2k=;
        b=Ab/pNdGJbR1WpKfRnIUgnKS6n60Ed3hb/OV+QCUsxiJgMZs34bRKqWU5LZWw+Ks74S
         gjP6vVYOD6Li+IigRbaLJq4d/EMsM/m2Z8xyYRox080n0G5iNEQyLFb7jpdYmAhAg9ea
         GYQyZtgJe8+ZFxJAThsW/fhr8MHqE2UkFFt1fwiEAFLJvENoNUrDL4vIbf96qo6bQYl3
         /R3LnscQZk9BSZQBdwA863CevecGB9m4/ktnURGG6t5uBNbg2D+b35RNfH3FL75ggIIC
         MQoXacvqklf5PCOsX3s9C2hIwXZ/vG3UoFv1bGXcLcjcjradgHAZjOcXRdeVO8hh++Ib
         bdhw==
X-Forwarded-Encrypted: i=1; AJvYcCVu3zPqusmDSyP1NSObPqNP9kj/KJyONbrhB340GEbg1KFJdWIXaOE7lQaaeJyBxVPSa2sY/bfmi5iXrxGK@vger.kernel.org, AJvYcCXLopjyhEgpJpe4cSwTMuir+Djyy2iiLMczryaHTBqhlwk9I5cuxoXg14HRiPUnzryVla33a33kpWA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKE44X4HrZRhjI1wcWUQSPbvxf3G8EN0NJ4nMZX82jQiFvYEHm
	gSiiMXwv0oKt61iMpvwUPPMTitvGLIXKoDqfuUOT9QP+OZFAQDft
X-Gm-Gg: ASbGncvCoT7W/quhcW6Ps2lXsYpqClq0WuLgDX1iUiyFHxT9/FAgDUU0RpGA+nj9lC7
	EKsSJjv9QCgRQfh7Uyu7gt2ivMvaZSaTLwGe2d7m04RIX0SWEGZShvs5Ziul0yRZD+qDiBLL7Kd
	NrKviMeERt06z+XqI+PacR1w0yFhEtj75Szge+OJuY+j8hoPeVXZ1vrkFVhq9iGlJEytj0U2kst
	QUANO3Z4+cjXpbF8rfNHbNKFvx6nVTyq8hXDgpuPwC9DRR8r8akr6SgcYiy5QEkOf1D83o74RUD
	R4dccWQ3Tw==
X-Google-Smtp-Source: AGHT+IG7mFRd97FR6mYhVVvYhtoBaFRLBuOIfm8PF3a9P3XL2Bf0khZUZ97iR4gF4s2kVDoMz5aKNA==
X-Received: by 2002:a05:6000:2a3:b0:385:f1f2:13ee with SMTP id ffacd0b85a97d-3888e0b8b9fmr2813398f8f.46.1734112718112;
        Fri, 13 Dec 2024 09:58:38 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:4eec:e99c:89a6:d7a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c804d573sm119088f8f.64.2024.12.13.09.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 09:58:37 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/9] i2c: riic: Use GENMASK() macro for bitmask definitions
Date: Fri, 13 Dec 2024 17:58:23 +0000
Message-ID: <20241213175828.909987-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213175828.909987-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241213175828.909987-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Replace raw bitmask values with the `GENMASK()` macro in the `i2c-riic`
driver to improve readability and maintain consistency.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/i2c/busses/i2c-riic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 659b0702293a..487fa26264b0 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -55,7 +55,7 @@
 #define ICCR2_RS	BIT(2)
 #define ICCR2_ST	BIT(1)
 
-#define ICMR1_CKS_MASK	0x70
+#define ICMR1_CKS_MASK	GENMASK(6, 4)
 #define ICMR1_BCWP	BIT(3)
 #define ICMR1_CKS(_x)	((((_x) << 4) & ICMR1_CKS_MASK) | ICMR1_BCWP)
 
@@ -73,7 +73,7 @@
 
 #define ICSR2_NACKF	BIT(4)
 
-#define ICBR_RESERVED	0xe0 /* Should be 1 on writes */
+#define ICBR_RESERVED	GENMASK(7, 5) /* Should be 1 on writes */
 
 #define RIIC_INIT_MSG	-1
 
-- 
2.43.0


