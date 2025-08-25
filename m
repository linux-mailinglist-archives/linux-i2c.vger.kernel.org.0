Return-Path: <linux-i2c+bounces-12411-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59ED6B33472
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Aug 2025 05:14:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 105AA3B8417
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Aug 2025 03:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55D3223A9B3;
	Mon, 25 Aug 2025 03:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OrawLOzm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC50188580
	for <linux-i2c@vger.kernel.org>; Mon, 25 Aug 2025 03:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756091686; cv=none; b=pye74RnhUGAu91iZlNzwx+oS6nBeNBGiTLFfZ1oLufhqPY0btEqfSfc4WiG6CJoHGNbqt4L8POgSdd7sThRu6nBrYBjKiUHSikVbef9Es9UxoyB5hInvMrgC2Ihw9cQNPd2dri9Z7aAxVQVpo49+zzXtWkJ86urRGqO17Es8BNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756091686; c=relaxed/simple;
	bh=7ispcaVyIRZ5/+9jltafMh3K9aVRjMx0ix02kFpxxYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ry6qniIrp3FcknPuk+CMK+YIZJb41hifqrs42AS3ZTzXs/jd/zy/EIY0nr3Y7Drt+P9yAVYXgMhWjn0R2QIE84xWHMzlu8I+NDmfzq6QAa7DUwIKNcgR9kcLgkJl7iLaHcRO9Af+O5Cxirtdr/ftuUYXhbhk00mN7yTyHBDo+gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OrawLOzm; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3253f2a7679so2308099a91.2
        for <linux-i2c@vger.kernel.org>; Sun, 24 Aug 2025 20:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756091684; x=1756696484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbDkfYYEsVLJhNP0a8Qpsz+hz60XktfWQT+eId+bxvc=;
        b=OrawLOzmF1V/59Ti1Mmmp0uKu/s+PIT78bGm1tzEj/qZN0Y6ZgQ43eycJUA9SXyAZR
         YLJi0iSHdkmkMRcp51/kIvX92jfk66IBzKafWRLw+Z+f+efMGpp69Ewy2D7bl/hXN9Iy
         2RZiUQjqsAv9Sk/ap2e/9iHOlPJzC+PZO2pNpxx+MukpS3nJS8ghdGpsTE6ldR07s5QE
         44Iy8ofMHDuOqwfA9RQkB1yvQ3thLn8hPQaXoBpbcKsY6hQM1g3jBMJlpD+IQ2r0Phre
         RG1r8GanMySNuHLD+aA56/gO+nwokY4QC2iB7ra0tYgPfj0fUTtubp3AlH2cG8R9rskr
         Xjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756091684; x=1756696484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbDkfYYEsVLJhNP0a8Qpsz+hz60XktfWQT+eId+bxvc=;
        b=ajmdo4cgWUqnpFztHWmpi4SaOJRblGfo8bOCxCth7cnNI0pI3K0J3isX/6BQBpb4Ll
         4BBmvhAPXnyCqKwndYOkaRihZ86quEdUuwgkxLebY3PIipiytnpskemam3afuBNUzs8H
         aaQrVWd7gu6QHt2SYewdMh2urRlsFtMeFoIIJ9ZZ755FC20ZL5HuWZitrxhjUftgf5vx
         4LJbvqzLt/nMUP8/YDj4Fib+Nul+Yhw4ux2pXSOlz5pJr0iBJL1kPOHVlvTW/oIq+aNL
         4hSkVJ1+Ca12Q0vlqmI3AYaYGlTtHDFmUf7Cp53dWwZIZ9QCDJTrUtWXCNE/Wnl41Wn2
         7FjA==
X-Forwarded-Encrypted: i=1; AJvYcCXt5E0J72ZIgHZQYglbSZzmhh6NGtG/v1UJFJhxT+RCE0AZaHxLiZoYF6dJXrJcuhhOT1CInt/Ic2c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl6KJhrIi814IF7Jx+T3z55pzb1ieozc7zjLhP4FNvcuJFhyGZ
	wtRUT8AsgYQeS03rYYSioeyhow8GwfkDZwnE7JwQq9AvpUbbA3EXpNdFp4eZKD0nwQg=
X-Gm-Gg: ASbGncvKmsmsZhqvFLG0MNaTtKluQMYM6zSTAMG/nTOvp0SsTt0fRHqkCzvCPxIgvRw
	WoM13p3cljZfjDwp9Tk/1zvMj22ZbxBr/rs9z0RbMbDKy9O5XlpaLDDdyeMHCJYht2oEStgWUtA
	FXUMDioF3T1Xt1lRgUqCiqPZhetQRX+JGeOQkcBzUIRRWYaLuYoY5WCMHN3tGentvEgSJFaN6Dk
	dArkFUfxgovZnxWft7Aeb7pcugoRobE3rZfA59pdeVcbPTAoldPMKxQjmsxtdYxWjGIq1RSsPRN
	8262i6YHExPx8E6tYpZrcLOYk5wPyIvJJMaXibpgEQYhYmheqbaIT2gtFvay7PHkX5tozBNfBcx
	mdl3qzvVA2eSQDpMIcL74p3EOj/28p8ERQg8=
X-Google-Smtp-Source: AGHT+IGj1na0x2IMhWwnhwZtx6tPkKNpoFJ4Sadg4K9MqcpgWZjrlDL27dkztBwCKtrKl6GJR1OSgw==
X-Received: by 2002:a17:902:ef06:b0:242:9be2:f67a with SMTP id d9443c01a7336-2462ee0bec3mr148071585ad.11.1756091683819;
        Sun, 24 Aug 2025 20:14:43 -0700 (PDT)
Received: from linux ([223.181.105.16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3254aa4fc14sm5693904a91.18.2025.08.24.20.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 20:14:43 -0700 (PDT)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: akhilesh@ee.iitb.ac.in
Cc: peda@axentia.se,
	wsa+renesas@sang-engineering.com,
	linux-i2c@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	I Viswanath <viswanathiyyappan@gmail.com>
Subject: [PATCH v2] i2c: i2c-mux: Simplify boolean assignment in i2c_mux_alloc
Date: Mon, 25 Aug 2025 08:44:30 +0530
Message-ID: <20250825031430.3001-1-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <aKu8tBBOWqltEstx@bhairav-test.ee.iitb.ac.in>
References: <aKu8tBBOWqltEstx@bhairav-test.ee.iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor boolean field assignments of the form `if (a) b = true` to `b = a`
in i2c_mux_alloc

Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
---
v2:
- Converted the assigned expressions to 1 bit values before assignment to make
the bitfield assignment more explict according to Akhilesh Patil's suggestion.

 drivers/i2c/i2c-mux.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index 4d8690981a55..d59644e50f14 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -241,12 +241,9 @@ struct i2c_mux_core *i2c_mux_alloc(struct i2c_adapter *parent,
 
 	muxc->parent = parent;
 	muxc->dev = dev;
-	if (flags & I2C_MUX_LOCKED)
-		muxc->mux_locked = true;
-	if (flags & I2C_MUX_ARBITRATOR)
-		muxc->arbitrator = true;
-	if (flags & I2C_MUX_GATE)
-		muxc->gate = true;
+	muxc->mux_locked = !!(flags & I2C_MUX_LOCKED);
+	muxc->arbitrator = !!(flags & I2C_MUX_ARBITRATOR);
+	muxc->gate = !!(flags & I2C_MUX_GATE);
 	muxc->select = select;
 	muxc->deselect = deselect;
 	muxc->max_adapters = max_adapters;
-- 
2.50.1


