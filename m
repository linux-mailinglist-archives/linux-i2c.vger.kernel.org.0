Return-Path: <linux-i2c+bounces-10711-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D45AA54F8
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 21:47:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 395484A8177
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 19:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CF49264FA0;
	Wed, 30 Apr 2025 19:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJS2cowb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B0019E975;
	Wed, 30 Apr 2025 19:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746042418; cv=none; b=uPo6d5Wp0EyNmn/XvYPFOEVx4gKKlTzrLo0loQTbLEP0+HEe5kjO98LVJ9A1IrTl3obTrCevPuDRC1pg8WXkzGl446MJKqFaLGss5FDIWymPHcAc8XJ3yILBzYASmZOp502oWEj18qBXxVTlrcu8D4lYv17p5gUh1NcFoXG6Pdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746042418; c=relaxed/simple;
	bh=GX5C6YvsCu+EBUbpKmQBqXw0Yu76VrzRQ7r6A05DWrk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W5K/CJMMERZO9iocGhkZn3XTV8u4XpyMkiUgfAItGoznwaYBar4528H93b3+xfNQBFkxyqPkoowyKKPunqB2tBITHO4UtBSqlHWNUE8cc6rYeMOLKzlAiAIwx4Fkw9klsnsLNr1wsV4UfvQWPwmIbFji78KftnFylioMgti0uOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJS2cowb; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso113869f8f.2;
        Wed, 30 Apr 2025 12:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746042415; x=1746647215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w6VM5yZCiGPsQ1kp4lNQceR7CwmZ9L8PLfYEjNVglVg=;
        b=KJS2cowbcwEPbVFfnpKolf5TPtY/P1bLCVG90X5cND43bJ2RL2p9zAdx4Npe2R+Fb8
         oLLJ1/EujE/RvdvgePIXcDQ1VilhHYmIzait2Sm9VC1oEWvPPvdnIHgke7yR4w+Ni26H
         FyfmaMNZTYZ1KpOA6UV8DCfN/Tey8VueULNv+p6yMaqj0IP/K/UZdy3ALQq0vfyRPfkO
         M49XZaLbZmcuU23CLYq3UpvttkyqDzeKLqPMw6LtrVhEIbHuecVNirxiXrOFXvg0GEjq
         QRsWh/QTuO3Z169FUCDa5MtHvDqN3JzYOmECFGc5jl3OdxGcLvF9EfaqC2lCbrID9RxC
         Xc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746042415; x=1746647215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w6VM5yZCiGPsQ1kp4lNQceR7CwmZ9L8PLfYEjNVglVg=;
        b=jxed27yeaE/U3y6P2xR9v5ZAhkFh11bRPzo4gtpMW/8AYjccsHuCLYRcaw/5oRnaYN
         Pn5MT2LvAF5JkqrkD41vcwKUHGWRz21nmcF9fFsXNCbQzjakmAVQGnhEamFTpZNDpjWq
         cTFUXvRN7PS28RWK/jbRB9S1D9ZBdxlJDiUwMPZPTA5nU+wC39WhDSJZ9kn9F+F/Ao38
         WRGUxR28iOJ9eU19JtSfQMdhAOQ1ySFIhtZgVqfu6Z1h/YL7Cr1b6LMJ+OHDdM2Smnic
         KFtAFnYO6F0XbbPJ4fysjaLJSRcipckaLe+gsG2fd2xlfec/uaJc8MrE0GmbAdTOrhRc
         nuOQ==
X-Forwarded-Encrypted: i=1; AJvYcCULibrrYbFRutgtzTgkHBQDXwqEiLIa14zqx+nmNo1QjMJlIB+k1uHyNNsYnSi/G1tmDyxwzdu27yTndgwv@vger.kernel.org, AJvYcCUhRHOYedJBjqv5BxuL25cHT8uQwuOKI9e5k043qONnRjI0xFx0YU2zSCKx01pmpf0jnYfh9eDL7t8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjD4rGGkEgrIyZTnkuxv/rHu38BMj6uSlZKb50vd0MCYsy6YmO
	eVgmwxRWDOuOUPK9tK2mjLh7X/SschgeQ8XbyW5TWQ9poCQmsSLh
X-Gm-Gg: ASbGnctmXS8q9dCgLBWmG/evYqcTa7yLJOnRPu+CvQfpqrIp0Eg9zW67KsY78k8OTSP
	4o5GltEREWGKJrdn40pzwr+QPIXV1PcfuzJ0oDBgcE4WEYgZlPFO7L4oRnE0TfHX7/6aC84otpk
	NCk851wCApXTHYhb18a10DwbtvHPEHQqB2w6eXVORZgehsNpVJ+7mUZgIhNk7hSB+/A+uekx9Hc
	TO4HMwH2+nkHSbwUkT5Ni+IlA9LCNqdvCUDwVg7iFT/EwSUWJz8CHgv8iCfpHoovTf7EMpyDH+k
	lzN0zQFt5g7LUatKnSp+u9yi80Acm+R+CUDN949tGQh+PxThcO/lm1nMUK5njJ3BdHnaNsIEdnA
	=
X-Google-Smtp-Source: AGHT+IFS6s4pQkekvr4E7ar/yaribrrnkpCbKjCd0EQrZvFpzyIkUy5/HV51UshdJj0g57RRmd6fww==
X-Received: by 2002:a05:6000:2509:b0:391:3fa7:bf77 with SMTP id ffacd0b85a97d-3a08f77975amr3327227f8f.31.1746042415182;
        Wed, 30 Apr 2025 12:46:55 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c5ac:bf15:f358:81a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46517sm17861646f8f.71.2025.04.30.12.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 12:46:54 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v9 0/2] i2c: riic: Implement bus recovery
Date: Wed, 30 Apr 2025 20:46:45 +0100
Message-ID: <20250430194647.332553-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series implements bus recovery for the RIIC driver. The first
patch implements the bus recovery mechanism, while the second patch
handles arbitration loss.

v8>->v9:
- Dropped Tested-by and Reviewed-by tags from patch 1/2
- Updated commit message for patch 1/2 to include the new approach
- New patch 2/2 added to handle arbitration loss

v7->v8:
- Included Acks from Andy and Fabrizio.

v6->v7:
- https://lore.kernel.org/all/20250203143511.629140-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

v2->v6:
- Included RB and TB from Claudiu.

v1->v2:
- Used single register read to check SDA/SCL lines

Cheers,
Prabhakar

Lad Prabhakar (2):
  i2c: riic: Implement bus recovery
  i2c: riic: Recover from arbitration loss

 drivers/i2c/busses/i2c-riic.c | 63 +++++++++++++++++++++++++++++++++--
 1 file changed, 60 insertions(+), 3 deletions(-)

-- 
2.49.0


