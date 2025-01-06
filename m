Return-Path: <linux-i2c+bounces-8921-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01792A01D05
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2025 02:29:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CE6018822CA
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2025 01:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C4E1339A1;
	Mon,  6 Jan 2025 01:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lL7fJwi2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6675D647;
	Mon,  6 Jan 2025 01:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736126977; cv=none; b=JVXcwDkJ9U7R+qnDbfUs00MjToKCJf6smxBatiBjKcOA5nvcShL0U7YMfTCiSKyFtn6WsBJVhqIyudhFFMcVFBkCJLm03+untkxrN3WVQacWVc19m7hhdVnceyDbFfdUdMlcVbaXp66jcAAUrF3ZeuP+iqvqtezaZfs2FJ4IGt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736126977; c=relaxed/simple;
	bh=yGjdqkeP0eVHV23f9G3Rr6TIJ5rU12NR+dd6zrpy8Qk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g3TcyV9At17oNcLeQxNKo/993JJgM4w1pprx/Pglg08Cd0aJWfeB3csyivZXXqmVpR0Vt+QZmR6GlFF3kayIGWu9uqTz5/wrfbDtfcPj8tevojkJ/qqPN+nqQBB5hh8p0qSCATRisuQAhzBAu6VKQNsL/xNB4Qd/hCLjWX6/hBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lL7fJwi2; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3a7d7c1b190so49194675ab.3;
        Sun, 05 Jan 2025 17:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736126975; x=1736731775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kduibBjFmNFXNP3SSbAzX9SCVe5hZLT75L4Y/x0XbKM=;
        b=lL7fJwi2veVF3b2u4wpdPyAp7yEvpqZhFfH/nRRWraVokcmRpI6Sgl3TbUjuT46M25
         bkMdDqLsRRj3YWiRdbB8gmt20d7jSXQm5D727pKg6jman4uhsBl2gL0GxH90LWcc/hvI
         VA7BhvngZCnAvwMlDhBFuE6c8Ovw18iHMmYPOd8q1iLcgz3/3PQjI5JuXWWBsHKgcn5s
         UudaO2yPIDCz1/CtkF0RCyuW7lYDSPI1oGgHtUGR+HOBiDjZHmfsKCzKDSA+RWnbeVGU
         RqHor2/yTCs5Lbb7b4BmAazSCMZxaYLujqlhm3tddVFd610u5+FoMm50kntMoUDmQyEZ
         /vlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736126975; x=1736731775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kduibBjFmNFXNP3SSbAzX9SCVe5hZLT75L4Y/x0XbKM=;
        b=MWjeORMQAhcyPLS0AnAYQN4DfFh5pMamh/Zb3AuJ6kNw0Js8hlCidBip81XNCODGtU
         DT7auqgDW36SCFHql2oLzJpvu6ckJ0tYIUHpgM7R4wJkexYQ23ICBW0j7xwgRUoCnaQi
         DivEpGvvxQFk72kqkr772aHkpaXMAI3afId6gUBaXIIgk5lO95shb7dMQzNnwD1tZqJS
         9594BCsnKG2MTbOkRyjatcld9AwFMZjeYb6Zikk2yWCmaMXlE7/BZkeBfMKFTqWTHfhS
         qKNL1KC4shD5Uyh/KrdZzxNSnQDvcm8mp1deC91bsPKKiCkNqu3asTQ+0oCD8I43c+pV
         jbFw==
X-Forwarded-Encrypted: i=1; AJvYcCWpc4z8rf3AnmMomocwaXIhRKHdjNCh1XALaHa7yaQ1PL/HVjCFDIfcLcCJfchoXKF2KjFXrLQ/59wN@vger.kernel.org, AJvYcCXxJQEehd/zgZZEXLvIoajk/1LIx3+yfWJLvsRGECIpxp878pKq0IMO1JP6Y2Mk8yi83BT2tadp0kTq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4JtjJ/DxgvVCWXq5ZJ1I4sTYEOiSiwCltY7GuartbIrlWp5FU
	lXFc16rwkNkxQPDFPL98lhZ/nPuiqzTVOyjdvEgbbJiBT+R7yfPX
X-Gm-Gg: ASbGnctO3MavlY6/+dJjm+/h9WgFfze8qT44TNkWQMkl9StBOZHHLcc7SCQKOIFkZRG
	4eLp87Vc3hJwFS2lRqGjnSxkFMpY4zwE2ukmon3PqiQsyPZ3IpOO0j8a7Afdiz+MBBSRhFvF/+L
	Cq8q8FIxy1KrhTA6hmK5qLFx5YQFdLqpFkRujxNRsHQ4GOVzkuSFbHPZmPj+jSiWGI+HtMv/bz6
	QozFGgtF7Hp1b3X46HFiC8ywh3VpvciRpIkin7JoOS3Uq/SeCRps05V+DzL83BfLegM
X-Google-Smtp-Source: AGHT+IGNspJDPgCh0KDla5JcCqiJVIczUHgHNbyKE22M3WbAX0IVcYacHOZ5JzwKaSHyJtY05NbJUw==
X-Received: by 2002:a05:6e02:3687:b0:3a7:6d14:cc29 with SMTP id e9e14a558f8ab-3c2d18b43aamr515787525ab.1.1736126975409;
        Sun, 05 Jan 2025 17:29:35 -0800 (PST)
Received: from localhost.localdomain ([71.201.112.51])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3c0e3f36354sm92712785ab.52.2025.01.05.17.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 17:29:34 -0800 (PST)
From: Randolph Ha <rha051117@gmail.com>
To: mika.westerberg@linux.intel.com
Cc: wsa+renesas@sang-engineering.com,
	linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	trivial@kernel.org,
	Randolph Ha <rha051117@gmail.com>
Subject: [PATCH] Force ELAN06FA touchpad I2C bus freq to 100KHz
Date: Sun,  5 Jan 2025 19:28:35 -0600
Message-ID: <20250106012902.212850-1-rha051117@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250105083358.GU3713119@black.fi.intel.com>
References: <20250105083358.GU3713119@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a 400KHz freq is used on this model of ELAN touchpad,
excessive smoothing (similar to when there is noise in the signal)
is sometimes applied. As some devices' (e.g, Lenovo V15 G4) ACPI
tables do not specify the 100KHz frequency requirement, and some
I2C busses (e.g, Designware I2C) default to a 400KHz frequency,
it is necessary to force the speed to 100KHz.

Signed-off-by: Randolph Ha <rha051117@gmail.com>
---
 drivers/i2c/i2c-core-acpi.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 14ae0cfc325e..8ba167f59db1 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -355,6 +355,19 @@ static const struct acpi_device_id i2c_acpi_force_400khz_device_ids[] = {
 	{}
 };
 
+static const struct acpi_device_id i2c_acpi_force_100khz_device_ids[] = {
+	/*
+	 * When a 400KHz freq is used on this model of ELAN touchpad,
+	 * excessive smoothing (similar to when there is noise in the signal)
+	 * is sometimes applied. As some devices' (e.g, Lenovo V15 G4) ACPI
+	 * tables do not specify the 100KHz frequency requirement, and some
+	 * I2C busses (e.g, Designware I2C) default to a 400KHz frequency,
+	 * it is necessary to force the speed to 100KHz.
+	 */
+	{ "ELAN06FA", 0 },
+	{}
+};
+
 static acpi_status i2c_acpi_lookup_speed(acpi_handle handle, u32 level,
 					   void *data, void **return_value)
 {
@@ -373,6 +386,9 @@ static acpi_status i2c_acpi_lookup_speed(acpi_handle handle, u32 level,
 	if (acpi_match_device_ids(adev, i2c_acpi_force_400khz_device_ids) == 0)
 		lookup->force_speed = I2C_MAX_FAST_MODE_FREQ;
 
+	if (acpi_match_device_ids(adev, i2c_acpi_force_100khz_device_ids) == 0)
+		lookup->force_speed = I2C_MAX_STANDARD_MODE_FREQ;
+
 	return AE_OK;
 }
 
-- 
2.47.1


