Return-Path: <linux-i2c+bounces-11541-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F06EAE2109
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jun 2025 19:35:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 394CE188E26F
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jun 2025 17:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA02B2E3B14;
	Fri, 20 Jun 2025 17:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EDF6BpMq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031B018E20;
	Fri, 20 Jun 2025 17:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750440913; cv=none; b=GC/ibMYBmFG/J+9Bl0AiyxXcSKBtPlGffFMya8++tZXn4cTLyIXnCxqahFS7RwK3w/LXEXVPecfkfOQcqQ61LVRct5z3KBekwz1xudorm4MDAves+Wmnmsde2Mw/Lb3jcsEA4W/A2IpUcO9+Pa9KWJwc2b+PPKu3CMUJEIKm2+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750440913; c=relaxed/simple;
	bh=AgDsktD0a5AkGVgIpm4akmO9rDfL6WCNI0qCVJifB8I=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=LIXQPGG40SnM+4pB3bEw1Ovjo4KDJsZg78GnLblxbHR5nqt8OhdiGEXC84OJgFAJn1K0/NQdesUU0ctHAmFjbuKtWWQOlsU6B7RmFGhYzTZTUrtwZUjPHQra1Ga3WDS6h5WtKAvJA0VJlvRLEkjeqWXmNyRB4/RxmgVD1EPz8vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EDF6BpMq; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60707b740a6so3151135a12.0;
        Fri, 20 Jun 2025 10:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750440909; x=1751045709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mg3yw4vaCMy+lJRKgBJCUBFDQZaT3XMALMfqYzvwLVc=;
        b=EDF6BpMqlRrm8Mg1CmFObIl0veJeWviLXTb91wABwQRzN6M6hfbhb8J7lfE3LDnH48
         l1B6V0Sx+0CotEQ0o0+feUq4wqA2G/6rJAt+opxweph9+W9f6tMPyZzZxG8I3e7Z5Kud
         pon8BcR48tsfwFHGgIZoq8MhztL2IJ+GlxbfYEWv3LwahKc6COcQoiIrYeCw7up+urit
         r63BrnBQ9eY5c3AfTS/T12TbXOuSO3GSQDKE1XPax6x5PciyKE+dFNFP43q5dnIa153S
         KV3QneAYXHTM3i/Y8N4C1FcPpYCV2/PjlEx6SaSMzY1bl3sxlFNA2hhbRbztoK6wrepc
         PM8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750440909; x=1751045709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mg3yw4vaCMy+lJRKgBJCUBFDQZaT3XMALMfqYzvwLVc=;
        b=kqtBSfmWAAEn9T+VAMOrjdhsmaLL5T+F5Avk1EDkVq5Au9nTJ8YinqMccMU2ZJ2F6a
         VtdFVJrO5gzJ2DRsSVgx3GYUhU59qgRKYmetws+ccB9ZDyrUEX7DnRJq2wUHHcSWvgIa
         zFpC1VQYR2H4q3pe1j9P4wh9m8R9/h0wsbeA6kp2utwR1NXCLtIvuvPz+J3lUtkGDb3o
         2uaxCdctiiP0rQYXFC7HUEqgyjvtCbhn7O/Xg5iOCJi8MOIYUFeirTrZr67v7nH9LOLp
         eErPuh6GHPMuLZ3akcedf4ofCvX9kaBoKWKyl7xji+yPdPGNPSK9hzoSOh7OiOs8Wffy
         DQ7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWLWKf/pcWuLkC9Mn5DcnHXxIJ3ZX8uLsd3fSq776yDvN4bwBc0UQsew3h72xSMTnMmx9artiPv9f8=@vger.kernel.org, AJvYcCXc6q3LADFU26/OcDDCQJszKJPRe+LJJHMuJU4oyLn2gw63ycK9oy4W7yJXvAXfqWzJtFJdBgsxKDnasnM1@vger.kernel.org
X-Gm-Message-State: AOJu0Yzslz5x/6taFn/tIaH7LBO/PNd8dBmXrOhrd1MMQz3uBAflczeP
	3TznEQhtFXKQNNqgCDBz1EixHtuA7EnV8UI9/CW4dtTjyyNwB3IUAe8loV+oQQ==
X-Gm-Gg: ASbGncvivoz1qqvuyKxivk+POTdKuEmVAYeIAm8lK26hMAEeXevJ1a0Gnhx9FajIlbq
	b3HGqz0vArwRL/28+q5/o/68I6CUor3TeEFNbrjBeKEKCEoo1Q4RPAhY6eBBoC63wxci+L/mBAQ
	mR8uTYYqIgItAbCJileLbqKLmWs0xn75RiR4DJD68fqc9qehM5dh7yUevFvZ3EaP0dbs4bGBnLD
	rUtpl7FINNqDEL45R0Caz/G39iodiTZwnBBw98JSv+mlxtE+jHFG0Hli6AoiZRlF2WTf3XjULdp
	jPcIYhg4urZKobadJDeJJzCPZ2aH4HJjYdcK7yHf/ikBMnfxX2ipnW1fUbZ/UYpiPukoFD/GIg9
	RZyYV8YjyQxA+/d6rels7K+iPf/QHDU2aBoGrxwXZfA==
X-Google-Smtp-Source: AGHT+IHST8t81MCtxY4AMugTj8+KZTk5dCvc7no0T46qRYJ/lTm1HFaW77DCtJbEy9i6uLRW2VFUew==
X-Received: by 2002:a17:907:9816:b0:ad8:9b24:9d16 with SMTP id a640c23a62f3a-ae0579cd970mr352011866b.6.1750440908981;
        Fri, 20 Jun 2025 10:35:08 -0700 (PDT)
Received: from masalkhi.. (dynamic-176-003-044-193.176.3.pool.telefonica.de. [176.3.44.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a1851449asm1698953a12.2.2025.06.20.10.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 10:35:08 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: wsa+renesas@sang-engineering.com,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC] i2c: Skip i2c_for_each_dev() when detection is not supported
Date: Fri, 20 Jun 2025 17:31:21 +0000
Message-ID: <20250620173121.15752-1-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While reviewing the I2C core, I noticed that i2c_for_each_dev() is
invoked in i2c_register_driver() regardless of whether the driver
actually supports device detection, as follow:

    /* When registration returns, the driver core
     * will have called probe() for all matching-dbut-unbound devices.
     */
    res = driver_register(&driver->driver);
    if (res)
        return res;

    pr_debug("driver [%s] registered\n", driver->driver.name);

    i2c_for_each_dev(driver, __process_new_driver);


However, the first check inside i2c_detect() is:

    if (!driver->detect || !address_list)
        return 0;

This check happens only after iterating over all registered I2C devices
via i2c_for_each_dev(). Unless I am missing something, this seems to me
just wasting processing time for drivers that do not support detection.

To avoid this, I propose guarding the call to i2c_for_each_dev() like this:

    /* When registration returns, the driver core
     * will have called probe() for all matching-dbut-unbound devices.
     */
    res = driver_register(&driver->driver);
    if (res)
        return res;

    pr_debug("driver [%s] registered\n", driver->driver.name);

    if (driver->detect && driver->address_list)
        i2c_for_each_dev(driver, __process_new_driver);

This would ensure that i2c_detect() is only called when there is an
actual possibility of detection succeeding, making the driver registration
path more efficient.

Please let me know if this change makes sense. I would be happy to submit
a patch.

Best regards,
Abd-Alrhman Masalkhi

