Return-Path: <linux-i2c+bounces-9265-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BE8A25923
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 13:17:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA5EC3A4292
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 12:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69BCC204582;
	Mon,  3 Feb 2025 12:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E2L6MKQ9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB731EE014;
	Mon,  3 Feb 2025 12:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738584995; cv=none; b=s/m73gXjRwxCkQlfiXPqraehzeWBsrAjjoA74Tjef3UCVatJ5dCNu9saU2aBk7dT9CdWrO+nzAGeAr2EiGK378LqBwEmnY9FKmjiK5lOh+N78dbRgeoJj9wvN8gE4Q3Yr6+cFA11GefWMGqs/SZQv41lAz4FS2S4ZL8b4uBqtUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738584995; c=relaxed/simple;
	bh=ktA6AJJes+J/bgmktA+dvoWuE8RUy8fAT26kPslgIYU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hb72Z9ds+OCNrNUSGX+9gQBsXlCfM+8lcsYCvv6lGKXwBFkiOHDcZQ6g4gxqQts9+tqwyL+H9xcxLwS7vHilxQNaLbqfVyx063merRtNfUnMwV0fdhpNBOgWgUTeLgj6dASn/HaN2yH08pdt269FrGnIVfHJp2zVFqMGxbt5jHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E2L6MKQ9; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-385de9f789cso3324524f8f.2;
        Mon, 03 Feb 2025 04:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738584992; x=1739189792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WbXmDpLdiA+Og/CQeqQFMSPaEHHwzRUVDqlR1pFP0jY=;
        b=E2L6MKQ9iDRwGHcjI8TxFrhotnMqQ3x388mIVzz6Np3HBtAtv53fLLr5XGNj2GM95S
         J0iGRs7IH7j4ckqf95i4Je4cvqUwftVoBQRmPuXXTdgGW3EekRLrTT7K1wuoTHoJorij
         lh/zBJGVkhvVU5zKifJeK7sqk9m4GDy/y6povUdJEXLNDJ2W20yUlwWzycNiWEwMAnzk
         BnoWg68v3xQR1VkeWjKMVbPT5yIlKIqGxyzA6lfeZRHkkm9yhvG8aSnQMXmXh+ZMqtkP
         fRr4Joz+1s1pje9tC7xKnOCqT4KhxmgwM2+7zm9KZmj7dPOjJJ1No78RSXhZk/jBEkzp
         2vSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738584992; x=1739189792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WbXmDpLdiA+Og/CQeqQFMSPaEHHwzRUVDqlR1pFP0jY=;
        b=uIQ4BNvIBPmTfTVMh1p6txXealZMBhGNFMJfDMfbyncb8b88F54lCXxhFSGZiQ7133
         fRunVODXvwdLMtcD5jr7EDlgpAHqgsVFPiqmoFjREK4rbLi7zdQte9+KFcUoi37c6rcI
         xkXuIGLl4+qaichkugocNV0AKx7Ir3hpqK/z8wJBI31vjYk+TF22qLRY3sTYLtPyG7xA
         3PU242mt5ySuHVkMUuIHi/fgW30wyCQA1wr/UWe5dh4kvYW+bHJD0QIGOh3JtvU5u5N/
         WKx28G8l174sm1hw2Rr0114bv5X0m2IBUXHbSoR06MQ4rY2UymkKlsL+Lx7CH/tYKXLX
         1nOg==
X-Forwarded-Encrypted: i=1; AJvYcCUXzeJJlArvcfO+0e7VNyFO9O4QrqHdHIV3cQTehsEDYkufwRwYJ8+Hfz575fMxoM/WQ1Yuims2h1/q5gzw@vger.kernel.org, AJvYcCW11Rfe7BdJjF2JknSAflbJJwqM6uZral5DaytGu0k0ArGIZuRq7bhNHcbsWfkSgQRPNg5zVCt8pag=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSJHCEaadgst8gGX9whN6bAIKxM5zMGwHXmqIXh6K8Be89x072
	kPUBmb8viVjsv34G+rvHPvu6IxTgM/eSfM7v3WuEY9qaSgSDno6l
X-Gm-Gg: ASbGncsWUrTAG5UAOqtKjk6aPNOBCoWVLExvLPWGHxMILIVojIKKQcNnenXQtsK3UfF
	PBJy5feISO6w7bEN8sebnWGzNH2NTUmpgG02yHDmKPQ4K1QifVKiwyvJZf/sDDxSofRVvgt6CMp
	P8WT2bwyFfBDMOsk0/KgALGJWDjhgYJ911IxdOQqaJ2M1pOQeV5MURAfNlHV/Ouj5TBTJ1CK8PA
	yVSnovGAoTE5cbjSsijhrHvXonrkJve3vWYGmdRwMRBV87syloB0JmkczlJlrIZyuJyf9Hlqw4x
	vC9pRfClDoTYrpU36WTtxUDwPrg=
X-Google-Smtp-Source: AGHT+IG9Em/EkcmTe2AkU6gUXCexFtTMhmC7X313xgzojPvh6wJZaIm65xwCTkn0EnjZOYKn5VSlaA==
X-Received: by 2002:a05:6000:1ac7:b0:382:5141:f631 with SMTP id ffacd0b85a97d-38c5195ccc4mr14422787f8f.29.1738584991506;
        Mon, 03 Feb 2025 04:16:31 -0800 (PST)
Received: from demon-pc.localdomain ([86.121.79.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cfa3dsm12805326f8f.93.2025.02.03.04.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:16:31 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH 0/3] i2c: atr: allow usage of nested ATRs
Date: Mon,  3 Feb 2025 14:15:14 +0200
Message-ID: <20250203121629.2027871-1-demonsingur@gmail.com>
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

This series depends on:
https://lore.kernel.org/lkml/20250115-fpc202-v6-0-d47a34820753@bootlin.com

Cosmin Tanislav (2):
  i2c: atr: deduplicate logic in attach_addr()
  i2c: atr: add passthrough flag

Tomi Valkeinen (1):
  i2c: atr: Fix lockdep for nested ATRs

 drivers/i2c/i2c-atr.c   | 78 ++++++++++++++++++++++-------------------
 include/linux/i2c-atr.h | 20 +++++++++--
 2 files changed, 59 insertions(+), 39 deletions(-)

-- 
2.48.1


