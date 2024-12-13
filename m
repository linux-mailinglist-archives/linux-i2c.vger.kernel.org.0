Return-Path: <linux-i2c+bounces-8500-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3E69F148D
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2024 18:59:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44A2916A27E
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2024 17:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA4171EF0BD;
	Fri, 13 Dec 2024 17:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mlQXQEgJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECAA1EE7A5;
	Fri, 13 Dec 2024 17:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734112724; cv=none; b=PkECeAkvtDq9mR+bva60Ebqvh0M2LijCulw66mlAv05LtX8o0Gy5PIIUGAJk751Zz+d3twWPqdxwNxMTJqZ5tjSUV9ad5mYH0//K5ptVJERp0qNHf06WDx0XhMdfppADuB7AVbPbXKGbXuANgBWRNfU8MoatHaTaPiC7NFqAn7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734112724; c=relaxed/simple;
	bh=ds8NCw46ssQGEQqUUOIbn2Ea79pBKLnCoyHVaH9R6+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=anvJA1iEKB+uBPDN+NSsUhhOE1B5cLSCHaKs/Zl722DWxGdLJqrzCxZig3J1sI2DDKhhPC19yvB2dVkn5XOU7qpsZ/jhcU+qOtb5SdjevFzWPNpqhGqVw9bKuyYzhhPC4Hjeo4re29tdYqF6GweoCPWtOV1J2ywGVbYvYkPeMqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mlQXQEgJ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38789e5b6a7so1061447f8f.1;
        Fri, 13 Dec 2024 09:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734112721; x=1734717521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TiNH0sKIYgt1PPiF5X1cBcEENcf83pWJytTWM8aI9Ck=;
        b=mlQXQEgJ3jf3dNczZa0rUXE3J4ZuNmrwkimkFKYF3kurTm6yPKMmaDd5Qj7BFhCJLp
         fZyxSz22Upl6olDKhEPKFZfmqRWD43cxiRJRu4XTHo2MefUfOMHyUsa2uWqI9zOa9d+5
         wBahb4fPlPIzBKTpANYMje2BkS7ah4Rm09y9PXiK7Tc3c/PKOLeeRggsChZkhEwwZqQH
         bi5wMrFmzQukhI/4ZsqLdMqmCPMY7MG4ffuwYLjxFAhku6M5A/6kLNx4nEtb3AhGRHfv
         Y1BHErQISUrb0rsBP/vLGYiSZ4p6VYWNewU5PEYI5AZiSnDPY5S5G1uj3QHJm7mGfRV+
         3i6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734112721; x=1734717521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TiNH0sKIYgt1PPiF5X1cBcEENcf83pWJytTWM8aI9Ck=;
        b=VF2GYh7fdAjOm9Mg5TFlP9scWT+1D9zbRwQTHdvOjryEc1QYBzQWmMqOEk4dg8qgVs
         1uftMmtLAc4gffYgs1L+JaTvOymt1lkjZrz7Ae/oadmMwmBg2TFJIN09O0wn7yQA7wrh
         zgoLDze6YRUGh/nrvUicqiekJIAJ1w2yuMyf99St78CH2dyegngZsmfOeeBPIMpnVYLq
         715lZRZk0RSLRIO4z2nNpNp/q/QRe532vzNTDX7rvUgeIrbTu7MVBoUxAz2LWwFae9O+
         8WGvot8eKcfqpDO0ZnnuMFUi3U8t196WuKPQQSPqLDZT05VZwOpejK5vJdM+2F8itxhL
         ogzA==
X-Forwarded-Encrypted: i=1; AJvYcCUGUJA8TRtFT5HdptA11AROGccyp1fI2RWTh7tNoQJp+SdmZ0tmXK6y/JA1Xv4ZCXblK608TUW2+qo=@vger.kernel.org, AJvYcCXBOEbiKZ6xU8brcxst1hjMg3Ur56EoxG4FsI+wTeqG61OFydVC4VBNgzUYiWYe48lo/xPmZ2aFNMK9qrEV@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqu45jPhjPwVM7N8pRLwcSZY+arRvEeMkb46VEnkNzQmQ9Afoo
	QQWP48glaqeeF1D7+6IvZP7CAay/JXInYFgCx1ZwJ2oAUMVqjLjz
X-Gm-Gg: ASbGncuows0bgvWgV2ir8aIcittab/6Nsm4SPfVNnO0d1wNbf54PuEZ87TL7f1/i9uj
	RNDxfbHzfHjwi6enKB7jutz0L/8Mdgr4hWNKxjce+3iXh19QPXSRiHdYW1KmT34jdMMsBi522PZ
	BAuxdJKnSToZ1fNdIzdeGMixkPCA3zs2e8OgAYo4kg2UBBChe69tfA82UpQunlSEO1Vst8otu/o
	1DXkB32AFhe3pCiOXt704xK81BZlQWwsCZNC+ZJpoM9EeK7OKoZMYx1TpBceDZr3FLMRkcyg1iF
	/JP1zRkcVA==
X-Google-Smtp-Source: AGHT+IHVBCJt+7+MsngrIntVfZGLihZBqVCT0I+Sk3D782RivAOgWvy/pP1gVjqqVG9bQFQoFA4m8g==
X-Received: by 2002:a5d:598e:0:b0:385:e1a8:e2a1 with SMTP id ffacd0b85a97d-38880af153bmr3219292f8f.3.1734112721109;
        Fri, 13 Dec 2024 09:58:41 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:4eec:e99c:89a6:d7a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c804d573sm119088f8f.64.2024.12.13.09.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 09:58:39 -0800 (PST)
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
Subject: [PATCH 6/9] i2c: riic: Mark riic_irqs array as const
Date: Fri, 13 Dec 2024 17:58:25 +0000
Message-ID: <20241213175828.909987-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The riic_irqs array describes the supported IRQs by the RIIC driver and
does not change at runtime.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/i2c/busses/i2c-riic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 032cf0b1368e..e51bf911da0c 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -414,7 +414,7 @@ static int riic_init_hw(struct riic_dev *riic)
 	return 0;
 }
 
-static struct riic_irq_desc riic_irqs[] = {
+static const struct riic_irq_desc riic_irqs[] = {
 	{ .res_num = 0, .isr = riic_tend_isr, .name = "riic-tend" },
 	{ .res_num = 1, .isr = riic_rdrf_isr, .name = "riic-rdrf" },
 	{ .res_num = 2, .isr = riic_tdre_isr, .name = "riic-tdre" },
-- 
2.43.0


