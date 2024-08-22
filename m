Return-Path: <linux-i2c+bounces-5701-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 077AA95BF15
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 21:45:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24FD81C22FA3
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 19:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 235661CC160;
	Thu, 22 Aug 2024 19:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RqVVVseF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A0D7CF16;
	Thu, 22 Aug 2024 19:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724355940; cv=none; b=oK0hILxzaXoVx8R7HX7PR/zPsnwHsFJygeKJ81aQaGYrkwspLGNYeJDcnt4+iwRe+F3CB4gygqM8urzDf/e21aRxaCFgAPzkeNN+nEqhu32YtkspW9g3iPF9jhyhTQ1hakkoGfLujF4qNb5bajIBWPj5fUKiqivwMN5eSxC08gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724355940; c=relaxed/simple;
	bh=nLuaHp9c/KLxay/uPGWso/mHvec43cEgGr+Jf7scjlE=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=D3Pszvk5yJ1FRXkZPJeKwL0PdfGxO2obqo4p1ZG3+sruSk8wy4/v/StAWu1yDmnV8vHwO1n2i2eIU1uYl4hRadtCGxdiTZL+0aZch6jeqQkyLQGhKeMMnyfQiKe7Wk8XA0tMFtZ4d7e7CCVtOV4ciS9eYpXTVhoUERWy/P6v5yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RqVVVseF; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a867a564911so164885366b.2;
        Thu, 22 Aug 2024 12:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724355938; x=1724960738; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IeTYTgvLfgiOC9/H2l0kQ7dznzQOo/Hsjud5L+kZ+SE=;
        b=RqVVVseFN1GhGvrLL4uU9dsbkvZvKohJabOm1LERjJUIe1PneR+PtPeyMLqXsUFZvU
         l8rDF3WDbucSGOtEGg1TBFI+afU7QIYkBX9P8+AP3/8mLJRb8OQhQ7vSShbsjqKOgUSk
         5O/+cEl1MeViFfBuhDOCNcG+/k/SDAMHRYrMg5ZT8fYZzNohx8wSvrfdxgJKs1scBHxA
         6UAJFnZYNG0EeFKnaKiRhN5urM5bIup0hJnizIJbTrzulJOA2lr12YIfJzGrMhh4TthD
         4hJyZ9Lpx+GfM7jmJfPxM9gWohpdeC0G5qAZDqR7j1Bpae00PJJqxd6/EYEqe2tr+qf4
         K6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724355938; x=1724960738;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IeTYTgvLfgiOC9/H2l0kQ7dznzQOo/Hsjud5L+kZ+SE=;
        b=xJgoxr4IZ1rQx3NF067SaE9oy0YIjcMFqMYrstr/aAQfnaYCHRlkpWoqDArdSxcNQ1
         HE2Oe0c5XZqVYJTq1t2o5nbWS7najt1Pdz61YMvvUqgpVpyU6oysRQGvUxD9ugE5dQ4g
         DXSkpQp+ISiAV8pGeJyyehmKehFk6hU6nXA/efr00vD29uIchH7wyaQrGjzX46OjA4t0
         9SX8mqAbRgBEEo1BpR/oqxMiVqnwdQ3ngjjDYsio0H+0NYaIDJVPzifpAcP5IV4GdZBp
         ifOTIwLzaiU1VYyo9VKbIIGiFv4mZpcqgQbVU0OhMFP8Hg2qthJI9Yls0fZZIeQJ1uDc
         si6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUhiGpXnfnIF3o6AfItposO9lzN/lyh3EEPvUk/j+LbhlN0bZGIXlhEqlIgjjyub/T0cN/LjW7i9Q6SoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOLT3sAsZunWmFjhI3y5+UIt++96sbS8LtYVoKX7gjAzH6giGx
	H3lNVVi4prNcB3VXUrdV1NL6Nfv8Jwhtk9/FG4JiIa288lcLVxc6
X-Google-Smtp-Source: AGHT+IE9w2I5z7mdnn4r2XniS0jzzD8NBlxnL6j6pYfMTSnNBTnbV6lMJ1Ek7ZQG8JDtSNE0eXMgwQ==
X-Received: by 2002:a17:907:3d8f:b0:a86:a3a6:c143 with SMTP id a640c23a62f3a-a86a3a6c9b0mr2021366b.31.1724355937410;
        Thu, 22 Aug 2024 12:45:37 -0700 (PDT)
Received: from ?IPV6:2a02:3100:9dc4:2200:e9ea:53e6:39db:eab3? (dynamic-2a02-3100-9dc4-2200-e9ea-53e6-39db-eab3.310.pool.telefonica.de. [2a02:3100:9dc4:2200:e9ea:53e6:39db:eab3])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5c0515a85fasm1297718a12.80.2024.08.22.12.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2024 12:45:37 -0700 (PDT)
Message-ID: <3982b2a6-975e-40d2-bf02-2155e5c36c14@gmail.com>
Date: Thu, 22 Aug 2024 21:45:37 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 linux-sound@vger.kernel.org
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 0/4] i2c: Replace lists of special clients with flagging of
 such clients
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

So far lists are used to track special clients, i.e. auto-detected and
userspace-created clients. The same functionality can be achieved much
simpler by flagging such clients.

v2:
- The i2c_driver.clients list is core-internal, however there's an ALSA
  driver using it. So add patch 1 to address this first.

Heiner Kallweit (4):
  ALSA: ppc: Remove i2c client removal hack
  i2c: Replace list-based mechanism for handling auto-detected clients
  i2c: Replace list-based mechanism for handling userspace-created
    clients
  i2c: core: Remove obsolete members of i2c_adapter and i2c_client

 drivers/i2c/i2c-core-base.c | 108 +++++++++++-------------------------
 include/linux/i2c.h         |  10 +---
 sound/ppc/keywest.c         |   7 +--
 3 files changed, 36 insertions(+), 89 deletions(-)

-- 
2.46.0



