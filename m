Return-Path: <linux-i2c+bounces-9566-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD86A43DD6
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 12:40:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4969A3AB27B
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 11:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E51826772C;
	Tue, 25 Feb 2025 11:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OUjvTXq/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443B91A2391;
	Tue, 25 Feb 2025 11:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740483587; cv=none; b=tvZ0nxSF+pz6d2Fhb/WFaTrFmjhDMUs5BWXZkTTUgL0lHfq45pkhisp+37LOqyaU54fMlZQHITERol2vLSLxjMuTqd0V+hNzAezrNDWAX11sf+UviKpGezwmdjIBmRiLLjgY+quELSrXXqjI6+9XhIHmtPtlDAgwoQp3G+Bp7MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740483587; c=relaxed/simple;
	bh=mkDFpDS/5euWQktTm9Qn9yHKvVPbzJNF2VFNVQURYAA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qmfOflm69KfYOTzbTahti2bWl7LCxqwLEJRtcN3oTq2dzJe5lRDmqKbyUTJjGw9LvXPdUiYzRoNw6TpG2f4GKFQfYOFIe15gUKix24bFuCgsNohCvzC0UtQN0R4cAPqKsmdqCpWBzCL14Ny5Dh9i3R5uVi5GDCRxj551YwOa0hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OUjvTXq/; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e08064b4ddso7350503a12.1;
        Tue, 25 Feb 2025 03:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740483584; x=1741088384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QU9KVDejyouKNK9zSOz6rJKcWP9AKvP1Ff8wdKTyMeU=;
        b=OUjvTXq/zDHqimz9C4xUCrPl4t/sUs1m877j8d6n6FNcdD6MyVdOv/PDbuu9DTvJKJ
         GwLaYtamlgex6Q3Pz8gL2dIx+ApIa2OANrBIaCExK8ReCZSjB60jPLF8lqwlHHgq3n2f
         4C2g6Xoo0jfiNm9XQxVugHmuW7lWZeYfxLFcflN69hB5dcKRLYn4HCGOcQk1lgEwZDcq
         8ecY55uSr/NG2py8avCcoT1l2In3X8sYfNjWdy02NxLSy1xDihyPOj/sc6jq2HYq4u4z
         QERDKIcB4R1u7KJzKTvwLnCUixFla1816tKrgKwGVSuOvbG+dBW+voRRWVUVUYXObjuZ
         pzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740483584; x=1741088384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QU9KVDejyouKNK9zSOz6rJKcWP9AKvP1Ff8wdKTyMeU=;
        b=ixibgmzmgYkAI6vZcQDipJHPFpe4YN4M2107keMRwCj6vOKTByCsnmD+ZkIfCnSMQf
         X7DffPwbjEHdWbN20k7fCS3NIkTYiuMe4L3cT/4Fj2EnelVVvG88rnwDl0Bj4i32zJhq
         wCXrkBbC5PG8UgOdlWt1DJSecn1ybWbLWD1hxa9AYltEx5+SItUeBbmhw7BSWnTQ1cQG
         QsZE/H4bxiOiFQQPwdpPwhIDhxoPeMZP/DcmXq8i8LVOI7aPGk4N7DiDzc1p9P7G8o1W
         gBXgRwaWhBhPxYl9P1otUKhVb4BlnaGQ7gNFu4RYBgr0YIPo3hGEgwCEHNOxmK9xw9x2
         Sc6A==
X-Forwarded-Encrypted: i=1; AJvYcCUXzMQBilqOnA+nsgMG+1cv4I361LUutOY0dOBkffScg8Ol4SFDjISccOrSdm10DkdkB3MiGZL8hn0=@vger.kernel.org, AJvYcCWEwZlRJFGt9AdHqAnmhCdofYFQyes8dNbJybxxaxOpvHEZFopioP6javznUBss4lZwJZo9kF47tQOVB7lr@vger.kernel.org
X-Gm-Message-State: AOJu0YxOmbbL24H9JyHpchnsOuxD+ERrDDEDNNzBqf2GIjaV5PnQp1It
	GSoHTx5XFzE5okiTfZzOCmS5sCLybZNmUk5Czj8vHBtW2NGJ37mnp8uoRQ==
X-Gm-Gg: ASbGnctlgkZP8rARcPF8Z6yem81MzaT1Ab66pCva//luDmf2fbxh8lqFc6pTRqxa+bm
	vSfbbPiy1xhUDLHCn+XQn2iItqQr5iOtG1y+9DWoA67Fp71eQt6dHMFrzt1JcHmCcZFezyc2A39
	YJzz+9zArIDqqQMnAONH41nnbvSk7J2mDesaOJ2jGl9HRtls81ddg8xG9/tZv+0rWdV9J1BhWp/
	1SWRJ0ZSZJtn/v5qBdl9FDap0T1iYYaxoGmORQmjaZoPJdM7XJLob36+N+FAzqhfskkPJg/oEJC
	YAiC5J5AQkQ+4RSTFcZcTA/gKIx/KtlwyU+VoUA=
X-Google-Smtp-Source: AGHT+IFqqlHNHcBK7kHbU5xwBRvqN5oeJKA04SYo5x00unenyJXi1dU8zZJP8utotAYnyD3n6YjLvw==
X-Received: by 2002:a17:906:730b:b0:ab7:5a5f:113 with SMTP id a640c23a62f3a-abc0d9df449mr1580472366b.23.1740483584175;
        Tue, 25 Feb 2025 03:39:44 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed201231dsm125510166b.115.2025.02.25.03.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 03:39:43 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Romain Gantois <romain.gantois@bootlin.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v2 0/9] i2c: atr: allow usage of nested ATRs
Date: Tue, 25 Feb 2025 13:39:28 +0200
Message-ID: <20250225113939.49811-1-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For upcoming GMSL drivers, we need to be able to use nested ATRs.
The deserializer changes the address of the serializers, and can only
do that for the serializers, while the serializers have proper address
translation hardware, and can translate the address of its children.

To achieve this, add a static flag and a passthrough flag.
The static flag prevents usage of dynamic remapping by disallowing
creation of new mappings outside of the attach_addr() function.
The passthrough flag prevents messages coming from non-direct children
(which don't have a local mapping) to be treated as erroneous.

This series also contains various fixes to the logic observed during
development.

This series depends on:
https://lore.kernel.org/lkml/20250204-fpc202-v7-0-78b4b8a35cf1@bootlin.com

The previous version is at:
https://lore.kernel.org/all/20250203121629.2027871-1-demonsingur@gmail.com

V2:
 * rename and split up i2c_atr_find_mapping_by_addr() to allow for
   usage of parts of its logic where applicable

Cosmin Tanislav (8):
  i2c: atr: unlock mutex after c2a access
  i2c: atr: find_mapping() -> get_mapping()
  i2c: atr: split up i2c_atr_get_mapping_by_addr()
  i2c: atr: do not create mapping in detach_addr()
  i2c: atr: deduplicate logic in attach_addr()
  i2c: atr: allow replacing mappings in attach_addr()
  i2c: atr: add static flag
  i2c: atr: add passthrough flag

Tomi Valkeinen (1):
  i2c: atr: Fix lockdep for nested ATRs

 drivers/i2c/i2c-atr.c   | 187 ++++++++++++++++++++++++++--------------
 include/linux/i2c-atr.h |  22 ++++-
 2 files changed, 142 insertions(+), 67 deletions(-)

-- 
2.48.1


