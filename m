Return-Path: <linux-i2c+bounces-10364-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DE2A8A6DE
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 20:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C5ED1901FFF
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 18:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10A9D222568;
	Tue, 15 Apr 2025 18:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/EaxR3T"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AC622AE59
	for <linux-i2c@vger.kernel.org>; Tue, 15 Apr 2025 18:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744742125; cv=none; b=S1liMzvSUJkA+WeYK+jd6IFVxdp+t/DQBXiu9wGnZuBS1gjvf1nitZxSqAULYG5T1i5R1y0XVChXtd2xCgbVapOKH+pm2jCZQPFJEOPHtNe9fYeWfolN1JdoECiVhmoNwPnHGw5FvkaWUE5u6v47sxtIhAA6o5SptsUcL5fG2K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744742125; c=relaxed/simple;
	bh=WgTUHtkCSNf9BlsWgSewkafT8xmMbm+tvMELkkKdiIE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PEXGEJLXfJ9U3xKIESqATYXuyFPomu1fhAMVgWtloEMea7/eVKHmgFywX/TJ1v+KCNtzhmNkqRlYpgo7sDybDtpq9mjTgq+2ZhYWkWlrrZhWOayKM45dl0uHG28h3jIv+LKttEsSysOZ9W3x/q1bvpFs+KgV4CS+JiAEzH14nZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L/EaxR3T; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac6e8cf9132so1115818666b.2
        for <linux-i2c@vger.kernel.org>; Tue, 15 Apr 2025 11:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744742122; x=1745346922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MRoYEXb3ghDFOV2uJOk2iitK8xLXwlrk/SeWF4lnfGo=;
        b=L/EaxR3TTlC78qj6Am7DCzp28wUpC0WhQ8yA6J9c2cFBf5RGLpePs+/DFwfyWTCfnD
         W3pJpee9HJ0niKDFt0Vvm9zx2G98tubhbPDez6qG2HufKL0UC/8Ex7QRDdP8afVnBS42
         uq3bR/PODP7DIqtrNS6NPdelBn6pVpH1/HxAT+UYD456blP3/GYkjTS/8yE/hhZH+cYZ
         6eCDzZUbEncwqIiLd6QYO/q7Zka8Sb++bDCNj8jLTU/ezc4h1VeHqimaZORl4Tui2vGF
         Bag/UvAqq44e+zQbQpd3Sq91z7S8kEiSy2uJtGFYt5qz6wFR+1O9upSn0mAeHC5NeSNp
         KaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744742122; x=1745346922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MRoYEXb3ghDFOV2uJOk2iitK8xLXwlrk/SeWF4lnfGo=;
        b=WMLnzPCSDIDFLZh33VfQBXxUirEO/NhFosG+mjXOhLHe9isSxJ8c4ArqhYOHFXgFAc
         fbngKRg5a351xprWVU1h3qA+7iyXTJkXj4Ta35Tafox9rCHVbkjldFLILaSl1+YydAAt
         mMOclGE+DfBaBKXtb7xtzBH1mxMFrCuRqV9qzzenE2RQUCMeMOnibJWn5izPogBCfODE
         XzCHOkzGD0Rhx2//YIq/uZ6ms0xoUM37NJOwgujZeKs+5mEGxnHACQHBgwmK7R8lFFoj
         fpjGdU0vS4/LidPMvy5hn0mBHEDxUmTI2nunUKBZFcGYp3GuCsInkRfLFDX5p6CIWn4G
         wPwg==
X-Gm-Message-State: AOJu0YwZunhgnB1llgHHFv96Epeb4BMreCzoVoLVaTGS5NnErGib1VzY
	B6oaDr12Ergg0o3TTQpQj7RPKO9oF5sXVnF5BSu1PkWP5VGneJiI3kydHVLjPq0=
X-Gm-Gg: ASbGnctLwK2wAobdV4oDCYzIiMouej6NhWnji60tkT048hbINYPM5yj86smle/u17Gu
	0ZdVUnZd/yUwwFfTPdhRjfPfkQsSviY8+8+kbhP8EnITHJdbL6eZKkJ6LE/6GgwO6LiRCG+4hVA
	qSrDMsH/IFbvP+7Nvajw++XWZyDwSWKjIJf4ycKpODObf8O44wNR4oZYetQNGLAux/wdvEsDpXn
	ocuvnEsvfbmnAafHcOlU6bxkhhb/a1cNYMj2It0JLXnciGZQ6WgCvEL84R2Fvc0NGbP4gKnI7RW
	Ad3J3THieDwLWiAURvVfB4oPhq6u6HImr4ng4SeQkGXwYDODD1aDWa9XkU7H6wTjx7nBJD0=
X-Google-Smtp-Source: AGHT+IEuWSLOccLcyfuK1aZkvWgSVugI1w+bk0fdaOIu+9R7U41G5ckF9wnSzID1VgQw+WL+PNPNJA==
X-Received: by 2002:a17:907:1c84:b0:ac6:f4c1:b797 with SMTP id a640c23a62f3a-acb38224568mr11037166b.19.1744742122152;
        Tue, 15 Apr 2025 11:35:22 -0700 (PDT)
Received: from ez-X1.. (mob-194-230-145-83.cgn.sunrise.net. [194.230.145.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccd1adsm1148844266b.145.2025.04.15.11.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 11:35:21 -0700 (PDT)
From: Enrico Zanda <e.zanda1@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: andi.shyti@kernel.org,
	Enrico Zanda <e.zanda1@gmail.com>
Subject: [PATCH 00/10] i2c: Replace dev_err() with dev_err_probe()
Date: Tue, 15 Apr 2025 20:34:37 +0200
Message-ID: <20250415183447.396277-1-e.zanda1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series replaces dev_err() with dev_err_probe() in the probe() 
functions of each module.
This simplifies the code and improves logs.

Enrico Zanda (10):
  i2c: uniphier(-f): Replace dev_err() with dev_err_probe() in probe
    function
  i2c: uniphier: Replace dev_err() with dev_err_probe() in probe
    function
  i2c: via: Replace dev_err() with dev_err_probe() in probe function
  i2c: viai2c-wmt: Replace dev_err() with dev_err_probe() in probe
    function
  i2c: viapro: Replace dev_err() with dev_err_probe() in probe function
  i2c: viperboard: Replace dev_err() with dev_err_probe() in probe
    function
  i2c: virtio: Replace dev_err() with dev_err_probe() in probe function
  i2c: xgene-slimpro: Replace dev_err() with dev_err_probe() in probe
    function
  i2c: i2c-xiic: Replace dev_err() with dev_err_probe() in probe
    function
  i2c: scx200_acb: Replace dev_err() with dev_err_probe() in probe
    function

 drivers/i2c/busses/i2c-uniphier-f.c    | 24 +++++++------------
 drivers/i2c/busses/i2c-uniphier.c      | 24 +++++++------------
 drivers/i2c/busses/i2c-via.c           | 15 ++++++------
 drivers/i2c/busses/i2c-viai2c-wmt.c    | 13 ++++------
 drivers/i2c/busses/i2c-viapro.c        | 33 ++++++++++++--------------
 drivers/i2c/busses/i2c-viperboard.c    | 14 +++++------
 drivers/i2c/busses/i2c-virtio.c        |  7 +++---
 drivers/i2c/busses/i2c-xgene-slimpro.c | 27 ++++++++++-----------
 drivers/i2c/busses/i2c-xiic.c          |  4 ++--
 drivers/i2c/busses/scx200_acb.c        |  6 ++---
 10 files changed, 68 insertions(+), 99 deletions(-)

-- 
2.43.0


