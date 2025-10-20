Return-Path: <linux-i2c+bounces-13649-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AE0BEF242
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 05:06:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D16B53B97D6
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 03:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32B6926B75F;
	Mon, 20 Oct 2025 03:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="edJU7Wfh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC731B87C9
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 03:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760929603; cv=none; b=DXiBJVNkdnydqIgf6vYnJ2lijn5wyM5VVtaB7jb+QKs9lRzaKNNy1XPkkl0YpTYg3TwYr2Gv+xKOYU1BWwHYSIh+ZpiaNbKJrl+Fal9evdaxfJBHgy1FiANj6eRDAX1cnIUGEzJrWMMY3NezE2IiMreJqI0Txgl7L6aecefYzFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760929603; c=relaxed/simple;
	bh=YBjpHWk/OjbuNVrw3LpJ4l5G/Z9oVIc1hegX9iwUI+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n7IJH0bEY+fgPZ01McWRtX7BtRCg8Y6CPrw4qWDgANAyrGnJHQ8WUzaP4Lj1CoTFUBt8SjY55O7CdxlDQsELYe+N5UcGUyW38SPtiG8Rjgwy7WHjuT58dNgxZXovp+e3YRUdbcrT4OM6Ozx1xnxpoN4Pis/IQvGODfy2uYKRqn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=edJU7Wfh; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b50645ecfbbso767295466b.1
        for <linux-i2c@vger.kernel.org>; Sun, 19 Oct 2025 20:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760929600; x=1761534400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1bPrht/7jsBGYQSWDd7TS53BYGn+Ml8MxvPS8eVQKrE=;
        b=edJU7Wfhc3rheRoyPXvBEYqHWKaZGPZzPY5B5aA4WEU4a3lAn/Cw+q9kXVPwyiNY7D
         EpYC205n7QpQn0LKfVImYHkuvGLHNfgeJuSToClzFC3WbfJkGcd5UYK2xVgamCtcpAAl
         tj+RyaC4dn7Y0AZ6FSCsgo4ziDdDuBcoK9Zjr3SMZhPNlSufj651FlEQlN/EMf3H+js8
         2+YHkdf7HX3sl4hLU34rAkH3FQhY5LqXWoqD3I31iSIcj0mieagsjyiWuck4/UK1ke9D
         /SrleaGVZs5ycYVirTUPgSHsiauoZW/lrHHe9r7oyHger6csV8Cjn17+7S10iX69Ead0
         8fOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760929600; x=1761534400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1bPrht/7jsBGYQSWDd7TS53BYGn+Ml8MxvPS8eVQKrE=;
        b=LH4jkdtND0SAfyPY6LneM0mv1GUwqpjaRlGN+sVEPk/hkSPydbHvOn/RSvtskKR49G
         H5FSLe9xBz+FENqWgkfipeZY78vSlU+1yB4gSzcvoqWybloUueps8weZbAHd6UPIL8SG
         nX4le69xBxpXUzKHcE+wBP/NXLiQ8GdMpyE/FMRYssQA0NPXik2CQQ8L/azurTkaThdl
         0ePnmChcSx2nNPNvFF0bDfbnr8xqerwyq8A90BmS4RFMBg4RaVMhupqI1TaE1bfOu26J
         3GG/hcSpdr2RCKwjgQZ+B8sDXfI2EEE1wNIcnVFeJReFfD0NbbZYcQh0Wy8I915Pl0wq
         pHOg==
X-Gm-Message-State: AOJu0YwLcwjEk6u/bfFp25VWvxGDK3dBrPsTeLz0jVV8SkI/OpanqjkJ
	FUtHU8juZx9mQD6JBUwpwuRLtMn4OqP392MEJQewBw3rTZD5eDUxI21P
X-Gm-Gg: ASbGncs63lONAYrJ2O8xAKCnYfdAtOvHFx8c/2Vvo+phSzfpDcdpqpN4nXOJMKX/6sj
	kv0E1jToY9AyM8zfEENMMaRoFY8rFf0M9YzBMdA7lHUhUtqozdbl2h9RhjgWC3oHXXD/4vRJvgT
	ScoqE9E3ltoEzkjDnZb7HtF28bjk6bHeBMzNsHagXoWCDzNp9O3HYNX12x7f4yPTJbP7YmuHydV
	WFMPrnrY+hqgLnMj1Zh3YCBabYVFUQeH5rnj4APGqdrzsEcsukhFIAk8sNgAO4ZHnxFVbMZl9Ok
	AS3YUBWlQkvFmSVd2GnPxp2LUw5Nz9KltOA5tvGJOQXBcpS/QoSo8h7/fuDkTdQUrkmB+e7Uemv
	y67TMDRvg6OWbIUNykClhqpyIlfrhWTJwvx7OY5jWMTB6PD3EiuWYBHYp5A95uBJm8ZZ1TDtj4U
	o7D5zzLcccrfA=
X-Google-Smtp-Source: AGHT+IEQIa2Rgx7bzVTwOpdEVIvCqpvuq3SS6qfKghO3EwkdnvJIJZkgozXupmlLYPPkVsElcWnqkA==
X-Received: by 2002:a17:907:3fa8:b0:b32:2b60:eed with SMTP id a640c23a62f3a-b647500eb13mr1142751366b.44.1760929599453;
        Sun, 19 Oct 2025 20:06:39 -0700 (PDT)
Received: from shift.. ([86.124.201.90])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da25c9sm668375866b.11.2025.10.19.20.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 20:06:38 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: andi.shyti@kernel.org,
	wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH v8 0/2] Improve usage of 'ret' variable and make pcf_doAdress() void
Date: Mon, 20 Oct 2025 06:06:05 +0300
Message-ID: <20251020030607.10219-1-chiru.cezar.89@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello maintainers,

This patch series is a response to Change Requests made by Andi Shyti on
[PATCH v7 0/3] i2c: pcf8584: Fix errors and warnings reported by checkpatch
and more specific on PATCH: i2c: pcf8584: Move 'ret' variable inside for
loop, break if ret < 0.

Change Requests:
 -remove initialization of 'ret' variable inside for loop of pcf_xfer() as
 it is not needed
 -change pcf_doAddress() function type from int to void as it always
 returns 0.

Testing:
  *built kernel and modules with I2C_ALGOPCF=m and my 3 patches applied on
  top of 6.18.0-rc1.
  *installed kernel and external modules generated by build on my laptop
  *rebooted and loaded i2c-algo-pcf.ko without i2c_debug parameter.
  *when loading the .ko with i2c_debug parameter an error is seen in dmesg
  and this is expected as the parameter was removed.
  *No success message related to i2c_algo_pcf was seen in dmesg but also
  no failures.
  *Module loading and unloading successful.
  *No PCF8584 Hardware was available.

Cezar Chiru (2):
  i2c: pcf8584: Move 'ret' variable inside for loop, break if ret < 0.
  i2c: pcf8584: Make pcf_doAddress() function void

 drivers/i2c/algos/i2c-algo-pcf.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

--
2.43.0


