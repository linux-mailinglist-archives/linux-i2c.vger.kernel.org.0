Return-Path: <linux-i2c+bounces-12697-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC362B46769
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Sep 2025 02:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 425315A6075
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Sep 2025 00:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4571FF513;
	Sat,  6 Sep 2025 00:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIHtXqOn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407957464;
	Sat,  6 Sep 2025 00:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757117545; cv=none; b=qA1TCbzgJVkoMmkJgPBy3exKNOIEhZV6oKPYpQQ4/sUJ8jSFWVXa1D4Hq+zurudKpKgtO8pIPqcf3H1c7ir97AS63VDTN0VeQASrwrb7MecKIsb8zC4JbRXia0mbqKq0GFGQfgZQ/D2TiJMEna3Bvck2f4UHnF8DorWx7knLKj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757117545; c=relaxed/simple;
	bh=KauDD5dgjR87qH1fw4hpqdARE8sfkS8OUw19DoeQzwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JcwqAwdttgBhtYeuiFulqZRQ4M7ZXBfU3T1HLRgZRsnuV+UUUro5KebuRyHKkGy3xJpfAESrfSaQMSlXRo0oFeWz8dPBRUJZKz1Fe2EwGt9Kd+1nJqK8U7KneWDkB8Q5+lSyXuCRhQaJt7vJO5Qs32Zr9YnGSVpqMoBsoa+9+Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIHtXqOn; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55f6f7edf45so2746480e87.2;
        Fri, 05 Sep 2025 17:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757117541; x=1757722341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsJZgB3cPv+ucpMmosoEHvYX9lKPd6UmNaeiKS9S6QA=;
        b=jIHtXqOny6+GsG8an86Wwnrg0CncostgecV77N9eH7Ar0yiBFbg8boyQN5Ihdhwaj5
         hjJ3BkRfdgBX4qycMg9Uc7v2dvN0K/l2MZj9KbXmwk8gIUormVt8ZM+e56KtdeEQrmdf
         qMlbYEuPURcuEsw+YrhssE7J6lCP1eLdgNHb+H8rvYwl/znSZUdfIUUxKjkYz9skz3uK
         nF1qWBIn7ZlysT9dzvvCmGktkmtqRPqAXdo/6zayxXfobM000n/pB+7VYgXVM+VpsZek
         oJfraIR5ZrIJbocS1iY2GGpvCq0N/WZJ7LEOfuY8djJF45jrARR1afTThkJPOVm3OkbD
         PUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757117541; x=1757722341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wsJZgB3cPv+ucpMmosoEHvYX9lKPd6UmNaeiKS9S6QA=;
        b=TD/G6jAM0nvnbin8AH0CKeRAjuZC9iRkIlDfxGDEEBjODHBLXsCHUiC/++SzY208pg
         kEzXLanljbyH4MOqoLQbCdKsES0/oSzmPGmXYEPva9t+NHEO4VhnS+OvYeSxlqXPj8yA
         spDtWTf4PQQw42mYZmHRFqsyezMIZEgY84hV1wliDTTynU60gNSqOo0+h4rKzlDj3YXB
         0lGjiH0Qd6/Qdwo9T0mF6PRtqg3GtLmQ69bnvtBhcBuSDOUWHQ7wasj/LS+QdSq3pQ9g
         gAdedvBbRHKpJdzPT3+rda9+VKuTp/X0NzMHDZoLDAfoijh6HhchK5j8hogzg2WHBaUV
         qAfQ==
X-Forwarded-Encrypted: i=1; AJvYcCURX/sLTgKdHtc+JND+ZBy2EbDHL6hpu6iE5iUQMTL0T1L70GkrYvX5EztvR3/psY6efQFhvNy2ISs=@vger.kernel.org, AJvYcCUn4g6VpIJGaoPM1QfNBiS15Y50KABwnSLZ7w9RGWUNHKh3I1NWriHvvcGkGHzjzpH7XZ7qDoRRXXJkJ6p6@vger.kernel.org
X-Gm-Message-State: AOJu0YzQIw9TqVR6RmlAaiIbuWKSHI0FCnLs+4HiVMjknwk4fuOoe3JD
	zXJCEO3pvLj7vYQq2WjLbwkxy4Qzgr8Gu6O9JZzeZ6yKuTEC9QjxmL2rGN24XFllq3Q=
X-Gm-Gg: ASbGncsJ9E28mBQdwijuUdb0vlpK2EruoSt98wF9hn7STEhsvwB0d473CHpICPoeaCx
	kn2nAHoDJVDWpfpcFBH0XSYSufIydhk7RuVb96uuIbHs0sVuLGmzsMsF8LRNX0LSxW2u4IeM0WG
	fEnAGNvxV+dKCIdqySsQTNj4hXMHH0IRBJll0E/FUuJkJLoMmd2k1Z5ryqbQEZV9tph1JTw81MR
	WOzxiZGaUJpu4psHkrjBCocW29C394O16NoGsW+5r4cny00de5gxb7OuNJ2LmqWR0JTfJEqgmox
	FFu5fS25Jo2u77kMHeR6Mxsdx8jN4GuXIhv8VjCjEv6HwylTC/RMusWjtD4YsNQX16NhGOyGNQ3
	8mfrYBaRcWUm/Vho4UZwmDVpIjrVmafjjW0CuGW+e
X-Google-Smtp-Source: AGHT+IHVl5JOTgW5UbceYb7FQK6+W6O/5WSR5Z9EAZdcAf0pM8B1F6RLdJUCv5bHCOaUZ0miH+9lmQ==
X-Received: by 2002:a05:6512:2313:b0:55f:33d6:6d64 with SMTP id 2adb3069b0e04-562603a0f09mr152227e87.2.1757117541165;
        Fri, 05 Sep 2025 17:12:21 -0700 (PDT)
Received: from NB-6746.corp.yadro.com ([88.201.206.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2033530e87.85.2025.09.05.17.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 17:12:20 -0700 (PDT)
From: Artem Shimko <artyom.shimko@gmail.com>
To: 
Cc: Artem Shimko <artyom.shimko@gmail.com>,
	Elie Morisse <syniurge@gmail.com>,
	Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] i2c: amd-mp2-pci: Simplify PM code using DEFINE_RUNTIME_DEV_PM_OPS
Date: Sat,  6 Sep 2025 03:12:08 +0300
Message-ID: <20250906001217.3792723-2-artyom.shimko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250906001217.3792723-1-artyom.shimko@gmail.com>
References: <y>
 <20250906001217.3792723-1-artyom.shimko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify the power management code by:
1. Removing the redundant #ifdef CONFIG_PM guards as the
   DEFINE_RUNTIME_DEV_PM_OPS() macro already handles PM_SLEEP
   dependencies automatically.
2. Replacing UNIVERSAL_DEV_PM_OPS with DEFINE_RUNTIME_DEV_PM_OPS()
   which is more appropriate for runtime power management.
3. Using pm_sleep_ptr() for the driver's pm_ops to allow the compiler
   to eliminate unused code when CONFIG_PM_SLEEP is disabled.

This change reduces preprocessor conditional complexity and ensures
better code elimination for non-PM configurations.

Signed-off-by: Artem Shimko <artyom.shimko@gmail.com>
---
 drivers/i2c/busses/i2c-amd-mp2-pci.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-amd-mp2-pci.c b/drivers/i2c/busses/i2c-amd-mp2-pci.c
index ef7370d3dbea..8f148c4d641f 100644
--- a/drivers/i2c/busses/i2c-amd-mp2-pci.c
+++ b/drivers/i2c/busses/i2c-amd-mp2-pci.c
@@ -379,7 +379,6 @@ static void amd_mp2_pci_remove(struct pci_dev *pci_dev)
 	amd_mp2_clear_reg(privdata);
 }
 
-#ifdef CONFIG_PM
 static int amd_mp2_pci_suspend(struct device *dev)
 {
 	struct pci_dev *pci_dev = to_pci_dev(dev);
@@ -431,9 +430,8 @@ static int amd_mp2_pci_resume(struct device *dev)
 	return ret;
 }
 
-static UNIVERSAL_DEV_PM_OPS(amd_mp2_pci_pm_ops, amd_mp2_pci_suspend,
+static DEFINE_RUNTIME_DEV_PM_OPS(amd_mp2_pci_pm_ops, amd_mp2_pci_suspend,
 			    amd_mp2_pci_resume, NULL);
-#endif /* CONFIG_PM */
 
 static const struct pci_device_id amd_mp2_pci_tbl[] = {
 	{PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_MP2)},
@@ -446,11 +444,9 @@ static struct pci_driver amd_mp2_pci_driver = {
 	.id_table	= amd_mp2_pci_tbl,
 	.probe		= amd_mp2_pci_probe,
 	.remove		= amd_mp2_pci_remove,
-#ifdef CONFIG_PM
 	.driver = {
-		.pm	= &amd_mp2_pci_pm_ops,
+		.pm	= pm_sleep_ptr(&amd_mp2_pci_pm_ops),
 	},
-#endif
 };
 module_pci_driver(amd_mp2_pci_driver);
 
-- 
2.43.0


