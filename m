Return-Path: <linux-i2c+bounces-8058-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 195869D2F6B
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 21:25:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F6CEB229C3
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 20:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42F941D2707;
	Tue, 19 Nov 2024 20:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hY+1Y8c1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FBF14A098;
	Tue, 19 Nov 2024 20:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732047926; cv=none; b=X6hT06DdgpfONMEeuAYuGIDKh+MOW6FgZP3HbbSybzlK4GrtkupD1U86c0O/TpG15iOF55a7LbvSii3hPpHaBp4pzgVnrp1OmmKxW1cSDISt99ThRJXql8n6HzOZBnmQOCICWxL9sejHSpI+JQ3KuoyHqZE6GxnGtdykoUnFmys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732047926; c=relaxed/simple;
	bh=9CPvK88OV/qNLB+5ATBB+gzFyaWUkpZCuEm5YUbDyE4=;
	h=From:Message-ID:Subject:To:Cc:Date:Content-Type:MIME-Version; b=uMryt5FXcGMmjWG8MfIfpWX8iwuOozdQPrKeERlTTxJrikByZzd2CT0vQ2yoYPb8IeCpmPty7PdqbtRmLbt42IEhNYArtjZEKFBA4NoG9nM6wzw3LlXAV/99Yr+ZsW8Z86M8PItJLcasu1vSsOWhnuv8AGKBPgGsXBSfnKbqjMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hY+1Y8c1; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5cfcf4df87aso3109542a12.1;
        Tue, 19 Nov 2024 12:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732047923; x=1732652723; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to
         :subject:message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YAuKpVe3qBPu3OtLjaPPxU5rhIOwfwNASENV7Eit6MI=;
        b=hY+1Y8c12CCtCyo3VpT1OAD+wT3yCzXkWH7RkcHJDSLmAX+lUg5bbiDT5NwcSLDzrH
         5RCzT4fuDAaX9J51m1nKr3NGn0NtUa6u0dHhcBH7/r5fG5ty6+HurrzfhdtD0syx1nqO
         nf2PjJaHZfpMAvD35CxzuGQMlRzlncIoS9CtiyBpsajuY1iE6rsMj3hyZV8jCuC/pyvT
         betGHybyT6kJ2qPeTB2Rq6LJguaJdmvK4mXs+hHYFxr5WhClgT6zsdraT7OXpkmSCTue
         9bN0mhQLLWdJV0ItQK7CDbPRL7KhSZlu9zt0DL1NQovnNBtqWJBhlH+S7A1ht0dCkDu1
         FbVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732047923; x=1732652723;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to
         :subject:message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAuKpVe3qBPu3OtLjaPPxU5rhIOwfwNASENV7Eit6MI=;
        b=G3CYnbJbVK3n7RVsTuhgXSWzzYRcvIet56dhKA6xjJRs79LIUnY6cIyjtekVth2TRM
         EOOZG3KCmlHZmYu0PHCv+/sTqGp3EwSb/9pTI95nJxClnUXHhFswkmgbi0FDiIe/+E7E
         2EtO4Svr5pDsemYWTPtAUzm2LCOVFVccucf+WBDsflc/cL8+xKxb+s0hkNsANn6ykTZC
         jVAGhjkRYfDgkW6yv8hmf0ZMsjT6ReluvVbOb4xndeaxCHaK08lnS2/waA4oZHATmTW/
         190zFVhezxTJKG2/oZMrLt34qM8g83GPIow3T+S7+fqcsgQcrrlwifnU+BTuf3W8ywIq
         716Q==
X-Forwarded-Encrypted: i=1; AJvYcCXa6megbZciWAvlfBsRizoDoY4LvKeHfTbv+dccit4j5kxzHsJm7WrsqaXqTATxj5ZNe8JvwlZNFofw/xU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHXbe/vHx6qcE/NRhiOpjYU0XcpLsreGFK8GwCE72IudFzczdb
	/gcz9NSYj2FlUOlTwa72Bt/+rC77m9Jx0dEb2mpO6QVRoYBpbyzlXKGHFA==
X-Google-Smtp-Source: AGHT+IGMYIpH/ZnenPMmML9e9ZwGjZXHGivrg7kc7vmurkv4flw+bqs70baBfK8FFhG/SZ19oA8FLg==
X-Received: by 2002:a05:6402:278c:b0:5c9:6f20:4cf1 with SMTP id 4fb4d7f45d1cf-5cff4cbcc75mr4210a12.27.1732047922529;
        Tue, 19 Nov 2024 12:25:22 -0800 (PST)
Received: from [10.0.2.15] (23-152-178-143.ftth.glasoperator.nl. [143.178.152.23])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cff4501bcfsm60584a12.47.2024.11.19.12.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 12:25:22 -0800 (PST)
From: Liam Zuiderhoek <zuiderhoekl@gmail.com>
X-Google-Original-From: Liam Zuiderhoek <Zuiderhoekl@gmail.com>
Message-ID: <2921f50a7e2f112f0c16e116d2992da8a0340cab.camel@gmail.com>
Subject: [PATCH] i2x: Fix whitespace style issue
To: wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 19 Nov 2024 21:25:21 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

From 0107b1649e3f74f1cd4e0695968edb4d81028f91 Mon Sep 17 00:00:00 2001
From: Liam Zuiderhoek <zuiderhoekl@gmail.com>
Date: Tue, 22 Oct 2024 20:46:59 +0200
Subject: [PATCH] i2c: Fix whitespace style issue

This patch fixes a coding style issue in the alignment of parameters
in the function i2c_smbus_write_bytes(). It replaces spaces with tabs for
alignment,  as per the coding style guidelines.

Signed-off-by: Liam Zuiderhoek <zuiderhoekl@gmail.com>
---
 drivers/i2c/i2c-core-smbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index e3b96fc53b5c..473f8ec7fedf 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -122,7 +122,7 @@ EXPORT_SYMBOL(i2c_smbus_read_byte);
 s32 i2c_smbus_write_byte(const struct i2c_client *client, u8 value)
 {
 	return i2c_smbus_xfer(client->adapter, client->addr, client->flags,
-	                      I2C_SMBUS_WRITE, value, I2C_SMBUS_BYTE, NULL);
+			      I2C_SMBUS_WRITE, value, I2C_SMBUS_BYTE, NULL);
 }
 EXPORT_SYMBOL(i2c_smbus_write_byte);
=20
--=20
2.43.0



