Return-Path: <linux-i2c+bounces-7735-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8684B9B9A9F
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 23:06:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3926D280DBD
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 22:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE4E1E260F;
	Fri,  1 Nov 2024 22:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WhvHLncO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08947140E34;
	Fri,  1 Nov 2024 22:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730498758; cv=none; b=QOUJlg+XiDOyyBn9+amN/gooIG88hzCCwbcmK7IZyHyBbjDN/ObGqkfTFQM7VWvsHZRc5rJF4895uA39TblT0+24DmhTV0Nopd73n7qMzJ6Eit6K39MjQrV5Fb1D0TQjPEkqBwCVuT1hOfvFfFzRucpoleDftrUjAQGM64H5kvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730498758; c=relaxed/simple;
	bh=MW1cq/FNnF0J8sho4IZVN0Sw70dB2kr+z56r5SU5vRg=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=A3rkMIvS/i/BtD2fjWLTIk8u3KxTN7IgzQOgF+P6EHSYHhoPZrmMB60iVQuUNLRwR9GB3J460pYh3ief8jFMNAKA6UWcgyS6ZdB0VKd34tHkqrK+oL0FAJwyMn7CGcSJZbHsIgXZIxOYTqresOBGdoVlSccebP/Cvo3nVhBjCis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WhvHLncO; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5cb6b2b7127so3097519a12.1;
        Fri, 01 Nov 2024 15:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730498755; x=1731103555; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eWN/gM1NbXeRAU0HPkKtuyp7eIuVM7PV0SZBv3FEePk=;
        b=WhvHLncOq9qI7gyusLlYh/6GDSM7LqXljaR+8JHCvcbMzYxxB08+4iaVpYiku3nhV3
         VMDecFirC9BQeYEsaase53Iv4+mJgdwhAHjB4UBJ/h9ZqYHishjuTJ0UfTH3Ke8tgEiu
         FHXZJPcvMBIY0I969eip4IdnuehY36flABRT1YP1zwmlf/d43GzY7NnL8jl9YBvCASZf
         gX1K+9qIApdUEUd5cwBhx+lDmsppQnnRSKMvxWPafzZr9Ba9vC4OixtVZi449Y3n59R/
         Kl4XP3vwWnheLVIGg/WhQG9erl6i7kfme5ntYh+EZB/fQJ8ZbT0zYadwpcFOzNztf6cv
         c6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730498755; x=1731103555;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eWN/gM1NbXeRAU0HPkKtuyp7eIuVM7PV0SZBv3FEePk=;
        b=R54QI4h1MMNJ7UxFosE+mK2Wt7uslEt6kyrYcryG8HqqbBkTOXq9az8kCL0gTuS/9n
         YmTFXPAyD7Q65eGR4z85Foi3vsCD9KQn24/UsMzlBP6qZ5BfYhr8ri2EiAaer/zoMwSL
         yo0yP9UZzCIMyimZfqiqic76fhKoT5Yf1oFch7zzJts2VlJW3AEaW+od6D4G96k+zHPG
         1mG3p/uTD0814O07GxoN4upb0BJxQH2yfDlHq2CJuhZmn9NlOSvXyWT1QK1cKjNpWBcO
         z5UuIJ3zkv7+wnhg4c+u3DVlblJlie+SK5Iptlu5Sev7FaTFLXg9KFIrKRdMAXjlVKv0
         RVPw==
X-Forwarded-Encrypted: i=1; AJvYcCVsU6R1RQfWQMbwYMQV1I48n4wfit0tJd5iQJEXG0aud8aiG9HcSIzH6qFT2GsIO8Jb8vBlXUI/dNo0wQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzspL8L+3naIIlIYx0+UvOoaxtOODEZdg0QNJMfx7AF8fZOQjJt
	Pssc1flpacYugZwgkUMndVMJyclZl0QpZ6XUQz4LNDxtH+5WapntvEE+ow==
X-Google-Smtp-Source: AGHT+IH0TeFLIUFtQNlR+U91STz5eUPRot1RHA2xxXcI6+YgVRie5MzvxyxaCEhoq5JRZ0Drx0SHng==
X-Received: by 2002:a05:6402:2155:b0:5c9:7c78:4919 with SMTP id 4fb4d7f45d1cf-5cea9755ecbmr4759802a12.30.1730498755040;
        Fri, 01 Nov 2024 15:05:55 -0700 (PDT)
Received: from ?IPV6:2a02:3100:9dbc:bd00:c5db:e5ed:512d:1904? (dynamic-2a02-3100-9dbc-bd00-c5db-e5ed-512d-1904.310.pool.telefonica.de. [2a02:3100:9dbc:bd00:c5db:e5ed:512d:1904])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac74cb4fsm2029544a12.4.2024.11.01.15.05.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2024 15:05:53 -0700 (PDT)
Message-ID: <97970201-24fd-473d-b20a-d21d2cd468f3@gmail.com>
Date: Fri, 1 Nov 2024 23:05:53 +0100
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
Subject: [PATCH v3 0/4] i2c: Replace lists of special clients with flagging of
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

v3:
- Add missing mutex locks to patches 2 and 3

Heiner Kallweit (4):
  ALSA: ppc: Remove i2c client removal hack
  i2c: Replace list-based mechanism for handling auto-detected clients
  i2c: Replace list-based mechanism for handling userspace-created
    clients
  i2c: core: Remove obsolete members of i2c_adapter and i2c_client

 drivers/i2c/i2c-core-base.c | 115 +++++++++++++-----------------------
 include/linux/i2c.h         |  10 +---
 sound/ppc/keywest.c         |   7 +--
 3 files changed, 43 insertions(+), 89 deletions(-)

-- 
2.47.0



