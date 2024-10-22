Return-Path: <linux-i2c+bounces-7507-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 911669AB664
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Oct 2024 21:05:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B72B51C230B8
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Oct 2024 19:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19CAE1C9B9F;
	Tue, 22 Oct 2024 19:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PujlgmID"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2FB12F5B3;
	Tue, 22 Oct 2024 19:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729623935; cv=none; b=nawlyLTjv7G4zGF7lKE9AMVDTFVAtQ1xjbUsCQ1nTh5UEB5zBDDnFZL+JNbFg2rtH1+dxBxDcWWELRkyPTEDQLknrvqlFkznrzNYnoQ74YTrPooejWXfUpVnCMpfsYyQgZ9EGmk9NK69Er+b+7WEUv1TyyawHqB8vfBZLkmSpLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729623935; c=relaxed/simple;
	bh=Qm1SvuTouZbA1KB/4nlKtjP9hezckri+4YLCg3jq9os=;
	h=From:Message-ID:Subject:To:Cc:Date:Content-Type:MIME-Version; b=s6h/BMn1XpANPuaIe/pmgLe9l06v/+oIeKTRVpmu5cJ14P+QQvHHI+wlYgwKldMckra6e7YMR62viZ68EAd2XW9ll0F7gQ+jtuRwPw8fGHpcqm0cJumaaBsozqgAjO16+fFKLUiYRCe6fAwxoHS+8Wsz0lfZY7ZGo1SGcPzTRRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PujlgmID; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5cb6704ff6bso3836718a12.3;
        Tue, 22 Oct 2024 12:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729623932; x=1730228732; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to
         :subject:message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZhqvAiUNzRvD/II9xf+29SDbuvoVtnnw6tqLR/pkTds=;
        b=PujlgmID+qNlejnmDipGTdFWPPdbEvUIGj5EkgaRoGz/Xcl/0rXuHVeYZBgaY9n6mU
         YA/NZHUiIRMfjNyRNXDLrBJQCiUMt/UMKpaK/aDWl14/DMMEWoFXUPRibLRSl/g33Ik0
         b3mj2CoOLZUI8UAc7iYivhkelSvvukddrSZLwz0hlbkBu+/H/GdYlh66y0fTIJmx5Y3i
         V6b/UnABnqX83XzCmgDc60diAMTn+jL91DiaM6ogorw5H576fv5EnVPnsWzko1RHFghM
         7hPWtRc293QjfMZgcg/ugYkQfIY38gVWDUhMMR1DiESXHf4dkJeXTXafRO1XccJkaPLh
         jE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729623932; x=1730228732;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to
         :subject:message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZhqvAiUNzRvD/II9xf+29SDbuvoVtnnw6tqLR/pkTds=;
        b=Wqk8pOVGvQ9knNTDCUl3drP0kfZZdssy1trq+0b27KJWzOeYov1W9WklGje5fbJuab
         Mmyu0W1n5rA3uZc1AGauFR3lR3cuTSypNVEryFf1wMW6/mJdcUpYU+krIUyjuDBlTsnI
         I5WoMlUaeX+Ntadn2JsURHU34GOcoZRQHA/4MWLke+TeeNhAzokv9EGPmXf12UYIYRdV
         Bu0chh/cxRZawcj4m6jOi29ddqaTuSZEDY5tH/TaEEUiGm8Fj0opxYPifbjaYsKeyQZv
         NWmX6jOlPSXCcSDJxpzfIo6+MxNHb2TzgAjme74PTAkX5SBA3n8RRsN9CD8ThhA2wWhl
         POjA==
X-Forwarded-Encrypted: i=1; AJvYcCUElgqXm6O/McHCyZmZI6dpHSdxprV6dioWMxht8Qg+iXIEVdVoyW0tst5I/BI0j7ETV0cq7nh944hdq7c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGMmHXTEntURqzDvkfYOFFZnsdqXjSyzvK+MhiRksOQAJLNw9R
	xZuamV/dOt8bXM5ZT1RKMLvomkZ5IeEu7UM5W1mPC6DsBZwPcDSoqkW2u6wGV6M=
X-Google-Smtp-Source: AGHT+IH0pP0hFsoTKZFqbEN8x96yfyEgQthSaETYnYFhe1pd0unWakC2Bw22cpPgheXkL3NQBzq96w==
X-Received: by 2002:a05:6402:35ce:b0:5c3:cc7d:c29d with SMTP id 4fb4d7f45d1cf-5cb8ae6dd6fmr193292a12.6.1729623932329;
        Tue, 22 Oct 2024 12:05:32 -0700 (PDT)
Received: from [10.0.2.15] (23-152-178-143.ftth.glasoperator.nl. [143.178.152.23])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66a654fesm3458886a12.36.2024.10.22.12.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 12:05:32 -0700 (PDT)
From: Liam Zuiderhoek <zuiderhoekl@gmail.com>
X-Google-Original-From: Liam Zuiderhoek <Zuiderhoekl@gmail.com>
Message-ID: <3e28ba0a5733593d28f34515e13a9e61d1ffd01d.camel@gmail.com>
Subject: [PATCH] i2c: i2c-core-smbus: fixed a whitespace style issue
To: wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 22 Oct 2024 21:05:30 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

From 214adebf7cf37be941f208124fac9ea6bec0f1d2 Mon Sep 17 00:00:00 2001
From: Liam Zuiderhoek <zuiderhoekl@gmail.com>
Date: Tue, 22 Oct 2024 20:46:59 +0200
Subject: [PATCH] i2c: i2c-core-smbus: fixed a whitespace style issue

Fixing a coding style issue.

Signed-off-by: Liam Zuiderhoek <zuiderhoekl@gmail.com>
---
 drivers/i2c/i2c-core-smbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-
smbus.c
index e3b96fc53b5c..6829def15933 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -122,7 +122,7 @@ EXPORT_SYMBOL(i2c_smbus_read_byte);
 s32 i2c_smbus_write_byte(const struct i2c_client *client, u8 value)
 {
 	return i2c_smbus_xfer(client->adapter, client->addr, client-
>flags,
-	                      I2C_SMBUS_WRITE, value, I2C_SMBUS_BYTE,
NULL);
+				I2C_SMBUS_WRITE, value,
I2C_SMBUS_BYTE, NULL);
 }
 EXPORT_SYMBOL(i2c_smbus_write_byte);
=20
--=20
2.43.0



