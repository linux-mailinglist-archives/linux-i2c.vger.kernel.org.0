Return-Path: <linux-i2c+bounces-8758-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 185CF9FD3FE
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 12:53:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB296162513
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 11:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967D41F3D46;
	Fri, 27 Dec 2024 11:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZjVNsgTk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010721F3D27;
	Fri, 27 Dec 2024 11:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735300348; cv=none; b=QkCiiqXgVcsLdDLbgE8r5/Ulrpz/FT93a9SLzxrnzes0RtYvLXRouVs6vY9syfAdTI/F6s1RzPbudOQ1i89/w6rplr6TgFNSCvpz/UH+q6+LKmsbnn/3unUxwa20uUR1OK68/oBHLfcA62N/h0IAmxjv1ookENlOdihsdI5Uii4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735300348; c=relaxed/simple;
	bh=D/DsT1pJOp2v92eWJ6q2fpcaxKGx/oBC/neVfd9Jws4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sGIR0uvIrACitsLahYyrm+xO8mXsVVRs8TTXkPWPUDuMA66zv4YNs2Uug2GQF6Xnyzsrv2JevFjHFSqur8gapiPRsbM0tvhX7j7LjVjS7mT90R+P6QBf2RUfV311KT4jYHY+Qbyu4MCIT9+BVQ9AzyCQ2DXw00+XP7BeZ+wacQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZjVNsgTk; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2161eb95317so89874805ad.1;
        Fri, 27 Dec 2024 03:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735300346; x=1735905146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8MX7zL6e/eANjDZsXHEbEpyJVdlNQUXGXrD7nBKxrgM=;
        b=ZjVNsgTkmcGTzEnCYj5B8+yQjftcpoAsYs7FPOPPY74ilbcfdHCYfC0/dom6kZ7p9k
         bOVdKcITA2TrjTAB9LJrXa4Ny32pCx9O0Pj/nbt0iHJR6buApdErbLyGUA9zJsmcG07b
         hCkS2Yd1ManjUm9mtBXVcBkffec1iibD3co/426L9PBFrma4Aqd9v9OFJN8tayc4pLlP
         3t3YqGpsMaial6l+JYNq49KXGcybby+TGjBg2Gcu5ju3mUA1otR3PZAuBKIorNn8vl4I
         elc6KFAYpMbx8i8GLZ+tp4jwzwvmCa/KclEZiPs+zX0zWT+oE0Sycdl2RpogxrDhUryp
         YKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735300346; x=1735905146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8MX7zL6e/eANjDZsXHEbEpyJVdlNQUXGXrD7nBKxrgM=;
        b=vxGHtYRiVP3V45D14X0Gqbh2I8nPbGRUc7Fumus9GAangF1lEJwx7kUgHDQ/rU/2Gr
         VrhELPZddnd4pTs1f0wiSGL2TRiONT+I5sACl2PtPApMtYorkGMWIE28FacPVDJCu8iF
         z3AFHbKK1kXSJco/86xcFtSXXup6WLNd1AWNj/Ju5p9kSAFBITRKe0sEP7czWSBblsC4
         qNkdhdpxp/8S4J2mKemAYmJQF7ME282nylJtUDqPJZ0uBzACigH6Y5ZSFtDvtuTz3Pvj
         le7YCkLfzCiOD7dVl6+UOk9RxZl8r6l+GGWhuHas9oRwm+Ve0NOWHVvSgeNW+pYBbksU
         y1yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgx4tjgyq6Oipc0fL5Yqe+h7B+E1pWVgPvfAhRZUtC1C5FUBeBfcTbt3f2nZPDBC/5ej2DEA3kXb/JMra+@vger.kernel.org, AJvYcCW1sl1z/1gIKFWKYvM3hthtpHflj0Gv7Mz7dGD+tXX/AeHSinSgBhbOw9xbcGCD0sWFS9eSOBV5YZ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwxUVzl+V89w5ziaiMf/h59ZeYFTcE6h83UPqIzTbDWXQECva9
	69BhdW1Wcc1oWxp/S/IKgX4P2w7jPy7tXqmtnEWASvJ4GUQ/Pkdu
X-Gm-Gg: ASbGncu2Mu4HlNlTVKntU6eZJcWLMWUec21h+4JMzZdiOQkorlXo1/gGhETjik51x9b
	jr6quU+HMHWcfyrmID8fCjDtFDEMm5LmlEDX/EH/JJedP+B2S929gXWcb6of+wc+ORqX8LmPyyp
	IUNW29ZfVa9rQijlcm5CE+UYfB4S6STasrr0A1y2tnqztEHO1LGlA/a3nd/6Xfy8IrVrINy4W8l
	pk88dIRw1g7u4zOfKR1iljV6w70x6nwgZHPSfYGNA1ApRFohq/a8BAWsWEt0BlEhphdAPkWHN/+
	8ReNVZ4=
X-Google-Smtp-Source: AGHT+IHVYuJMQbzX2/MmsJlcNCQV6d6xSNOiE++9sMeb34z/sZ8avS7a8K8n+uzFcSL564OuhFGLeA==
X-Received: by 2002:a05:6a21:1505:b0:1e0:9cc2:84b1 with SMTP id adf61e73a8af0-1e5e0800447mr44647770637.30.1735300346360;
        Fri, 27 Dec 2024 03:52:26 -0800 (PST)
Received: from prasmi.. ([2401:4900:1c07:9010:ac08:3a91:844a:cc65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbcbbsm14363990b3a.97.2024.12.27.03.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 03:52:25 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 6/8] i2c: riic: Mark riic_irqs array as const
Date: Fri, 27 Dec 2024 11:51:52 +0000
Message-ID: <20241227115154.56154-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227115154.56154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241227115154.56154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
v2->v3
- Collected RB and tested tags

v1->v2
- Collected RB tag from Geert
---
 drivers/i2c/busses/i2c-riic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index edf2212e96ea..378887b133a5 100644
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


