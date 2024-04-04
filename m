Return-Path: <linux-i2c+bounces-2762-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9495C898AFB
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Apr 2024 17:22:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F726283755
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Apr 2024 15:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEAEA12AAE9;
	Thu,  4 Apr 2024 15:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ehmQUfX5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F71A5C8FE
	for <linux-i2c@vger.kernel.org>; Thu,  4 Apr 2024 15:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712244086; cv=none; b=Y+sdRryk29zVF8yyHAbbbivE0EBMbpzlApNTmwfkKPtnzdTCINqL9AZELpjGbUNuxScb4Vro0ABJEe/iDrtYFOBipXTqUkSNCmIiN3cxlLoomEvET4eVHAygpt7gwvFtEywJTWz5MMc4HW2q0tFjxMkiX5o1vmld1d6ltRGgGTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712244086; c=relaxed/simple;
	bh=8dKs5ZPZVpW9D+5Yj8nR2HNqIHHUT6vlrkoaz46GbBc=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=qiKHZrhd3H7bQLAMLtTAoXi2ZJdMA23xD6SLngyxWKP3UKMQv58XrkDThUpby99vrCX9RwrKcGaV+OhiVjiM9huxWnV9c2EvQw+EygKzeMitdnD65ObBpi8Aec8bEdiYjxSkeOpT0uvGFYYiV59JaQK9Au5YQj3V28rx0WFihZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ehmQUfX5; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-563cb3ba9daso1170348a12.3
        for <linux-i2c@vger.kernel.org>; Thu, 04 Apr 2024 08:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712244083; x=1712848883; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uRoYqiDn8k3kRrFYDGNnRYWDJ9vLQpPPndN9eHhQKgI=;
        b=ehmQUfX5ep93RvrYCZ0Oylw+p9sbND6tPlpCPPY781JoqzU0ezbfWpOA6lVJHko0gh
         Xezoy2CxiW76wWijdd7kbIhVZ7a8L047qtqgwJNlCh4JPQWLl4Pg64euqUtXGVss8VAh
         lNZXuG9LOFgAThcVA7irzKyhSEKZMXtM8FPXfe8LTTJHAzpotnqYGjazE6W46XKjJI+b
         rYWwEk2x1kBeX+m/KcLiOUQdqjE/P50db+Px8PY3ovvKC1u92c/QuIkMDqF/W/Lb+M4q
         vLcnY3+7KOlgyABGMU2M8hklvwGOGL/tGDYfHUAbWwBx8XjtkGR94rms7+FOZP5ZmyWq
         3lwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712244083; x=1712848883;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uRoYqiDn8k3kRrFYDGNnRYWDJ9vLQpPPndN9eHhQKgI=;
        b=W1Pg1BqnqxMkvoA/vFQb5rsWJcr+pnfyyiUmHZOsUaxC2ZJHlQBCH10lYljteMFMZf
         y+cVWIDVMSW6IdRrjUV7VXngI3i4N62g790ejGZel0RP+Fy0J20r1F2B9AtN4p756+qL
         CWxIZWk5lBxOdeilizgKSCXxjS0QfmkH+Bq/HAQ8a6i/zrbgFSNJjDLQTBx/OmgSx3VJ
         eFpMw6fUdh2G2mNuFXvYf8mqr0bySJxqA2G5Dvkk5+PbxV/YJ9O1uYGukHMLQbFeXRCZ
         n1Gt9dwLwO5Eo/J9VJt9mhwBxLvg9mPx6ckHGDpT6PIsskyi75P5IzcuW0vwI8uKzioE
         6rRQ==
X-Gm-Message-State: AOJu0YwbiGgJwHrOeLTa0gyHWMKYoVzFtv5l62vEvhoEm1HD/8t+Cv6p
	sDsCVuMJXEjxZrP2GF5iGfr/p0mzoMapxcgAVijhcwbrLHhDHp96
X-Google-Smtp-Source: AGHT+IFOJNTVylleOUAiJl3agcUCnBVZ7GZUVuUHpz+NENl4NRyRzHM3nEMvAyNdEw/6LBnn+zkNew==
X-Received: by 2002:a17:907:119c:b0:a46:22a3:479f with SMTP id uz28-20020a170907119c00b00a4622a3479fmr10622ejb.21.1712244083106;
        Thu, 04 Apr 2024 08:21:23 -0700 (PDT)
Received: from ?IPV6:2a01:c23:b917:8300:853f:3a79:973b:a77f? (dynamic-2a01-0c23-b917-8300-853f-3a79-973b-a77f.c23.pool.telefonica.de. [2a01:c23:b917:8300:853f:3a79:973b:a77f])
        by smtp.googlemail.com with ESMTPSA id x18-20020a1709060a5200b00a46ab3adea5sm9129802ejf.113.2024.04.04.08.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Apr 2024 08:21:22 -0700 (PDT)
Message-ID: <c5eb2644-8c05-47a5-84ef-07f8ef750e1a@gmail.com>
Date: Thu, 4 Apr 2024 17:21:22 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] i2c: i801: Fix missing Kconfig dependency
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The original change adds usage of i2c_root_adapter(), which is
implemented in i2c-mux.c. So we need I2C_MUX to avoid a linker error.

Fixes: 71b494e043d2 ("i2c: i801: Call i2c_register_spd for muxed child segments")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202404042206.MjAQC32x-lkp@intel.com/
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 97989c914..201c5fc17 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -111,6 +111,7 @@ config I2C_I801
 	select P2SB if X86
 	select CHECK_SIGNATURE if X86 && DMI
 	select I2C_SMBUS
+	select I2C_MUX
 	help
 	  If you say yes to this option, support will be included for the Intel
 	  801 family of mainboard I2C interfaces.  Specifically, the following
-- 
2.44.0


