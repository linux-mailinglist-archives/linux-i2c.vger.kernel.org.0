Return-Path: <linux-i2c+bounces-8867-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EE0A0038A
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 06:20:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49F2F1883ABA
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 05:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 178D9154BE3;
	Fri,  3 Jan 2025 05:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EG6lFiA9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538B620E6;
	Fri,  3 Jan 2025 05:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735881607; cv=none; b=Si/a1OCPMeTYL3sbyDACd/RSvuVIZ3ZAG6jYTqZKVaiOZfgn8PbjyJWkM+l901HUBG/1GXG2aVKnu57wtrtmeiQNo91fMrugYOwwQwvDjCmoTqKywA9DOqmvhr0Wbw3itziI3DLas831h7ON2qkdSRC08X4h8gB3FaA0WvSFHls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735881607; c=relaxed/simple;
	bh=6UpWg01v3CsiziufVPyKXRgSHUgPpJ25VS+DYlYAvGw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dZDisBuEHV8WwczI7kQaFyrKNcF1M4Zhfg2uqGcrsM8Iqyt/+XDN1uYtxnj+drdDjDvYT5wQEUfALtJ6cO4rTcs3+D6CE9MONLpaIc4eEHtx6HtY06sYOJji3ZNut+DqmnyF2jdLw7JV2L/dTdvQVeTcIZp1BWiZLz8aQypujbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EG6lFiA9; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-844dae6a0caso377388639f.1;
        Thu, 02 Jan 2025 21:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735881605; x=1736486405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XauNMjsaYjGgbKb96Ht8SzqvlUlPl6+4tCn2QWW5rqg=;
        b=EG6lFiA9IbTuxGFpCkfvJX5MTS154JWYHucXocjizTV052Gvs9fAclyWHxVa5vO/zH
         NT4cKcbfQlKdvxz4E9JcrYE6YF4wN0DwiBJdrmiHI/mzAN0OQP5ywQXWknAT1QswO8CW
         cFga8p6nDS5YIRpOvLsARlAtt194S7LDMAu0l+B1Q/715LtDsqqEIkXTH+ow8pMXIqVj
         EbhkeR/g8N3rudI9nYgnVnfAG8co/QmpbvKrePYD7SanMNynQ3oktRARCcrUGSgwviI6
         nqWYH2mdLE8rBXyaK0IExW1WShxcyXgqCjPkYdmQhRMNJ2KirICGTi4LqtJDime5OCYE
         D/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735881605; x=1736486405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XauNMjsaYjGgbKb96Ht8SzqvlUlPl6+4tCn2QWW5rqg=;
        b=Oozs3gYxtxmftG48ts0BugtswQBzFp4WsVQgtUdUt3nJMSVeNiVfCLZRDWh3TMOlv2
         UIKq2EwFKCusZJozLOZvvtk/O5nXlwb74HzivQDTOzqCT16lvHVTxWL7iEQeTRvFYgzE
         X5lPeHhJ/erYzU7OeTlHyWB7GS69nW3Ddn6SztpOILWCuB4pueKpEqh9klrv8w/g70Eu
         TWVwsGxzOnherjQGtaq75NRQI8aTXHo8uOuHreZtErCtEDvAZGXZStJn7MVn2TRje5/D
         7i2ztFiXIIvuGl6BpKCqGXWw8E1FRucSM0I8a6G6kHWxPGcdCLWLhom7/G4HEjwNInbw
         rXGA==
X-Forwarded-Encrypted: i=1; AJvYcCVLiR95I/9hw05/kM12HlUXVHvJqL2MJ4EDW1AkYSr0la3883GMhvjTrpwLJqcRhkzU9REW9kptJzER@vger.kernel.org, AJvYcCWB9Yer+Bp2v4uC/xGY3JT4H7pxwv8T++/Qrrmyt2IeYeYHFG10BLmB1qQOntsIV08blNIlkX/xxb+b@vger.kernel.org
X-Gm-Message-State: AOJu0YxlY8/g7Rk760bJNuTAiQb71809kuBYJmSErDkaHsoTLIlUlGPk
	AQnXaujqxSfvSlEPdBw6mr+fUbMKalUix8e7ccbgCeeyKnBEf+XF
X-Gm-Gg: ASbGncui0StD4VUDaSjZ8m+X8PRYUXvUHWDN/df1mPbQn2F7VVWRO3elqcOEFXGwwue
	aDP6mqCtbKGvoGutWUU0Vni20EM+XXB3hx0OdHQYo/VW3RL4pi7+iGKdkcaBGUWgtdTfYYcFERo
	JQBpcG+PYvdZ/FthQQ1Mzmvgsxbhdvskf4SpTaMKuqaOtUZ9Bk1fM5k+i9d+JjUgrCNHAGWkHwC
	cgn5zeSgPqu2XZu7azgoZ71ZkQvV4wrxkOuU7I5FSzUslmS8LRBYPlqbi9O9J9YMmru
X-Google-Smtp-Source: AGHT+IEAMD7vnsotcyyLuZtZVKJE3sshilnB5LtLb0OS/Z9WwiDtY81wFGGpj+S3UpREGG/pg6UfFQ==
X-Received: by 2002:a05:6e02:12cd:b0:3a7:6566:1e8f with SMTP id e9e14a558f8ab-3c2d48a32bcmr333209945ab.16.1735881605350;
        Thu, 02 Jan 2025 21:20:05 -0800 (PST)
Received: from localhost.localdomain ([71.201.112.51])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e68bf4f43esm7427972173.21.2025.01.02.21.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 21:20:04 -0800 (PST)
From: Randolph Ha <rha051117@gmail.com>
To: mika.westerberg@linux.intel.com,
	wsa+renesas@sang-engineering.com,
	linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org
Cc: trivial@kernel.org,
	Randolph Ha <rha051117@gmail.com>
Subject: [PATCH 0/1] Force I2C bus freq to 100KHz for ELAN06FA touchpad
Date: Thu,  2 Jan 2025 23:16:51 -0600
Message-ID: <20250103051657.211966-1-rha051117@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In my device (Lenovo V15 G4 IRU) it appears that, even with the latest
BIOS update, the ACPI tables do not specify that the ELAN06FA touchpad
only works properly at a 100KHz I2C frequency, with other frequencies
causing excessive smoothing to be applied intermittently. On some
busses (designware-i2c), the default frequency is 400KHz.

This smoothing causes the touchpad to be unusable under Linux, and the
support request I filed with Lenovo was ignored. After adding a device
ID check to force the frequency to 100KHz for this touchpad, the
excessive smoothing disappears. As a similar patch was previously
accepted for the Silead MSSL1680 touchscreen in [1], I hope this patch
can be added into the kernel as well.

Additional Notes:
1. I speculate that this issue was caused by the touchpad firmware
interpreting the higher clock frequency as noise, since the smoothing
effect is similar to that caused by using a noisy third-party charger.
2. Based on the coil whine emitted by my laptop, it appears as though
the driver is ran at 100KHz under Windows by default as well, so I
believe this is the fix, not a workaround.
3. This fix should also apply to the Lenovo V15 G4 AMN and the Ideapad
Slim 3 15IAH8, but I do not have the devices to confirm.

[1]: Commit 7574c0db2e68c ("i2c: acpi: Force bus speed to 400KHz if a
Silead touchscreen is present")

Randolph Ha (1):
  Force ELAN06FA touchpad I2C bus freq to 100KHz

 drivers/i2c/i2c-core-acpi.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

-- 
2.47.1


