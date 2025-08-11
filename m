Return-Path: <linux-i2c+bounces-12246-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06475B215EB
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 21:50:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D23547B3228
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 19:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5999B2D876C;
	Mon, 11 Aug 2025 19:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XcYNZ14G"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FAC27F724;
	Mon, 11 Aug 2025 19:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754941809; cv=none; b=DA3OIJqKszxwU5xv9HbMdIaiQc7TT9m+b1msKfBfzTQjLOGqRfJhHBjpD3pOicNoRYmc7LMgtFyzOt03E0vi5GOJ9ye5wc7Wh+yM5ZHrzzBEL1IjCNtd4yZWMYWaD40+Zi5OJAC/DrRixxoNqqC0q8x35MtW4uLZg9/36W31gl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754941809; c=relaxed/simple;
	bh=Fk8Bw6MA9OkJVdq47gc5L3v+FCeIAny4QBYM5xUaMaM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uq/tNMRAl5DI7Ll5U62+JQYTBL8+3McsU2bU6jZVlHy5+bCExduDbulpL2f4blKFXbbYNOAJqXDxPZ6AqwlmyNzG1+VbiSINGFremaD5zzaxwdhRwZZfhpmF+badk3bzof3McNfQht5Muo348+mgRSDYW3d2qSlD72MhBDa6X6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XcYNZ14G; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b78315ff04so4054145f8f.0;
        Mon, 11 Aug 2025 12:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754941806; x=1755546606; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FNKfzHYbB1ZIWLHm8XS7VDzFjrBi6oFDR5W7bTakxwI=;
        b=XcYNZ14GdlliYCqwjnujhEWh09HLuK+jJW6FFGuVxhfU1o/kV210U8P4B5gEwV59YL
         veJ9ZweL8VBO7FIfoVnO8wGq15/KLPVAIZRCWzHbnVdnnPi8YnTyrqUIekGFio25dF5i
         AzzL5gjyJtfSFZtGlxR3Ej6NSlVnJeAVuF+8qlhfKrSRV/eR137539hfTjmf+hyCmiON
         +oTn4NADcN7Dy9e2b82xufJQ1c2Vnli1DaYO4Xol6xHmid5UsrSIC9vF7Jm42azyr+EG
         FdwS3nxlmEo2hzpatWYa3cgDsjet9CAI41o6JCao0s/YT0gJPX/JO/wkvSlf5mzS9KOu
         eOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754941806; x=1755546606;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FNKfzHYbB1ZIWLHm8XS7VDzFjrBi6oFDR5W7bTakxwI=;
        b=MpiEBcJc7kuHeR+/8orRRv6so1GLuvdD/zDeyU0InSSll35UvEIUYXbZnNXEwmPEdF
         SRIe8L/RNyX4T3cZrOLkdohkr6VdXy9YXJFJ1cgpXf3HzsTcNy2aT5YRU6vBFo0MD/vL
         abUAPjnG87DCKfqrQPUN9YcqmNxVWCUyrNtI8kr3zfA9cKhjRokTpUWwIptOzIwU64Er
         g3B6YFTAk126MTFf/hgFJRbs5DgJC0ai7rs2d+/7gBEJ5h/cFykXhdn0Y7KCWQlg7FJl
         iKL9qeT78kc8VZ32ewIyWOcwHBwfRDsYMt4nnjgj5Qh3pbGjYYap+awJBxckHihj5Kcm
         H8zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVO42Wg0C+hEyWFGxPZdXYH4bzN6JvZ5JeGNBC/wqpM5ucMqSRMz+s7n3EzwF2KzdeOIniXOVB@vger.kernel.org, AJvYcCX7yrAFiH1xBXrJ5bw37axMBzhu6cytRxW78Vd+z+d7iIFeY+k12YiYux4zbiSjil8OTezr6pgTqcU=@vger.kernel.org, AJvYcCXWZ6Ys83SRummF4HbEhCkGBBf9Y/A+W2rnvnlHTOManDVcgLjCt0GspkaaDUNlhRxCV0pUWcextXN/jyk4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6rmSNR77KwAthGdgXVM6U4AGUbkE2NXiBwNhymarVKF8KHNPW
	3PGGGdFpHR8UIDlF2uvMhDbZGv4fT4zSyzBOqdcQAEPcIziDaEU0UJ9DQf3zDw==
X-Gm-Gg: ASbGncv5swKfvLZrknDEQkC1dDw7PxLr8EO3ADbZHaGqjwMNbfgQ9+wlnt0o6wT7SXn
	8AWObgKr0BUo1LfJm+Rh5hfHztK3q5k6aTVRBUONYqsCiq3K6bqHJ960TR71Uu4Lbu5ItvFDLGv
	X3BR3Iu4H6r9yCzpxAPSJYX8xcId9N4k8h4CGrMmAM3M8lft+CzKN+jv4w3Ryv1aIRk1hTsTst8
	iPcoy6uwJxGgBZlEhFIUyOeyZsvuNyF4fjT7CheWhW9lEUXW1A4nelKAsUH9Bq/en9HkPFLGey0
	TOzR7m0Ro4EN/EeClKJaC//TI5CMsZ9wfEke8WSBjmgYJIA1P9dveB06RQD57WB20WLTsqCO9F1
	T0sUGBBSs7uNVjkCzqwQGMWkMGB3hZq9CljkHyHdj6owmHyRdNAH2uidQ6ntKxQ==
X-Google-Smtp-Source: AGHT+IFHbn4y9hfGTMN6NHymhuhRV3bgWXUmWSsnPpSR+XutWW+nNtL9qKWYLtipZOMJQNrXZXOc6A==
X-Received: by 2002:a05:6000:26c9:b0:3a4:e7d3:bd9c with SMTP id ffacd0b85a97d-3b910fd1214mr707538f8f.17.1754941805587;
        Mon, 11 Aug 2025 12:50:05 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9eddsm41709246f8f.22.2025.08.11.12.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 12:50:05 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: [PATCH v2 0/3] i2c: pxa: fix I2C communication on Armada 3700
Date: Mon, 11 Aug 2025 21:49:54 +0200
Message-Id: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGJJmmgC/4WNSwrDMAxErxK0rorskJR01XuULIytJoLmg52al
 JC7Vw103Z3eMPO0QeIonOBabBA5S5JpVLCnAnzvxo5RgjJYshVVhlCsx3l1+JD1uP00DK9RvFt
 0iSXXgQ2XgXwN6pgja/Hw31vlXtIyxffxLptv+jObP+ZskJAbai6BGkemunWDk+dZW9Du+/4B1
 5RsgsoAAAA=
X-Change-ID: 20250510-i2c-pxa-fix-i2c-communication-3e6de1e3d0c6
To: Wolfram Sang <wsa@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Russell King <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Hanna Hawa <hhhawa@amazon.com>
Cc: Robert Marko <robert.marko@sartura.hr>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Russell King <rmk+kernel@armlinux.org.uk>, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Imre Kaloz <kaloz@openwrt.org>, Gabor Juhos <j4g8y7@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2

There is a long standing bug which causes I2C communication not to
work on the Armada 3700 based boards. This small series restores
that functionality.

Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - collect offered tags
  - rebase and retest on tip of i2c/for-current
  - Link to v1: https://lore.kernel.org/r/20250511-i2c-pxa-fix-i2c-communication-v1-0-e9097d09a015@gmail.com

---
Gabor Juhos (3):
      i2c: add init_recovery() callback
      i2c: pxa: prevent calling of the generic recovery init code
      i2c: pxa: handle 'Early Bus Busy' condition on Armada 3700

 drivers/i2c/busses/i2c-pxa.c | 25 +++++++++++++++++++------
 drivers/i2c/i2c-core-base.c  |  8 +++++++-
 include/linux/i2c.h          |  4 ++++
 3 files changed, 30 insertions(+), 7 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250510-i2c-pxa-fix-i2c-communication-3e6de1e3d0c6

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


