Return-Path: <linux-i2c+bounces-7756-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3229BB541
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 14:02:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0712B1F21791
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 13:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34121BC063;
	Mon,  4 Nov 2024 13:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HprVWzZ+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1743618A6B6;
	Mon,  4 Nov 2024 13:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730725316; cv=none; b=nIut/UI3jLk6zhdTDqPDO0Q+/I9lTLweaB72/caiNqx4Ru/MY8wSVaGEDy/3vU9Ns6dpAClftqzEKyUHZjaNV2t9XZgJ4zWZNzPp2dtNd0WkrLRCaWVpgiCnu3U/Y2R/POTGuDzxcvGKC3UlyCNV2XwwBBLkW3faY6PoXvlFYx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730725316; c=relaxed/simple;
	bh=BiYRTqlQ9T5SIEINIuQ5NyZrV1T5NtgJq9XawCRDYfI=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Mk+1IKqDObA3y3joDYPALNDKptGorTgNWDHPiLn0A8vNPJ+wo99JRvlduJ2/Wj98nv7lN7hqKc7Ll5ofR86hil60Luo0y+/Ha7AugTLlDecBX0oiZHQKBWRyu2PtX0Y1Gu7cLBYfnwnMvA6q5UxgF/52l4PqLn5V23WQ4ZweAyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HprVWzZ+; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-20cf6eea3c0so31869345ad.0;
        Mon, 04 Nov 2024 05:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730725314; x=1731330114; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y5vDGuAIRKGG7+0YjIAG/Iu7B9p1N90ZoOHqeFvhx2k=;
        b=HprVWzZ+9CYMJDKUa0znRLFswGDL20cXCq9y7prLUke6OnSF0YXtFy2gDoTlojzjy+
         rHTcb/WWXuZcUoQBUgmnQS/hbDmD0395ZGSFeA8BdMcYvaKDuQINcnRx5rjXlW+iiM6E
         uGTiOT6/q0mlLwccnOVP2wV4hafPQTTyYZmiThRqhVvYeDof8mC3q3NM36108HeeSPzC
         iN1cFp4kGHRrkCV9VU/j9zMcmCJZZMxjGCdXHwkhnISQy8N0IR6WyOVQdIu5KZQ/0NyW
         B0pxRyT3z136f3AKmtjy85rdwfnXaDRtv6A9ju55aG8KS7/9H8i7dlNvB1OYtLzqR/0a
         s9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730725314; x=1731330114;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y5vDGuAIRKGG7+0YjIAG/Iu7B9p1N90ZoOHqeFvhx2k=;
        b=Ltk2sEU8y6xUjQKewJfbH4XC0l5Gko1KA+xbi3H/imJWIDYAOreDHqcIk9FJ8G7wV+
         mq4fRhkDrguhWxExGomFADOVdXIzx7JT7rfbxicarA0Ze+8LrrG9NG62uciC4GInZuij
         XDY3LtgEmZfwgGBU6Uc8auwYUVr/+hn2S2QOkBEEruKbza+KMsizv5UpPC3SyV3cHtrN
         xIG88hBV9rv+BlKjXuiKhPR97w2hBGKv+alNkk2VjVVJb7ff3JPztv9fWvWjGP/g/gnG
         SRzBtTP346AU6DHsm30/Qkwlf+ZtSgnS8BBKRYgwx0kCiioJnTW8ILuOaVSHhdYaZDbo
         Uahw==
X-Forwarded-Encrypted: i=1; AJvYcCVjdcVSKPR3TwhBNSSCfFlNWKXpq4v3bzvg6eqT3C+xXt0VZrWsd5qpTo/WelNf/0QykEOIRVpMD/yj@vger.kernel.org, AJvYcCWBU6tkGsFmgzr0wX6A5fVDQ+7s69ge83Xrh1HwO/HIlMGqKcnhhJsA0aM8qzH/zRdDzg/tIGNDjLDN@vger.kernel.org, AJvYcCWiJx+F2J5kYuZSQOm8lzui6XUfd2ksswCh445PrfAbnipUAzuIzjJ53c+0KsbngojxI/9AHTCAQcUaa/Rz@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+AZPpCzDcyICNtqtFLDqbrn+DTYB39bHZXJZXi6lA6VEt3qn6
	t1WafMfrk6bXv6jp9Fu3iDA9BykgawhDZfxC6e2PGzyC2+XbVzv3
X-Google-Smtp-Source: AGHT+IEM0Q3G/62bhXUw0h9w4pdtwquLGh3tZcGwf11n11w13Li3mRc8Taxp/JLIt3CimlmCP4HY8Q==
X-Received: by 2002:a17:903:41d2:b0:20b:7d21:fb8a with SMTP id d9443c01a7336-210c6ce60a9mr370052365ad.61.1730725314268;
        Mon, 04 Nov 2024 05:01:54 -0800 (PST)
Received: from [127.0.0.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057a2bf7sm60238765ad.173.2024.11.04.05.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 05:01:53 -0800 (PST)
Message-ID: <ff300296-daea-4113-8597-62f7a5f61d9c@gmail.com>
Date: Mon, 4 Nov 2024 21:01:47 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: troymitchell988@gmail.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
To: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
References: <20241028053220.346283-1-TroyMitchell988@gmail.com>
 <20241028053220.346283-3-TroyMitchell988@gmail.com>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <20241028053220.346283-3-TroyMitchell988@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 2024/10/28 13:32, Troy Mitchell wrote:
> This patch introduces basic I2C support for the SpacemiT K1 SoC,
> utilizing interrupts for transfers.
> 
> The driver has been tested using i2c-tools on a Bananapi-F3 board,
> and basic I2C read/write operations have been confirmed to work.
> 
> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> --
Change in V2:
 - Alphabetize Makefile and Kconfig
 - Change `.remove_new` to `.remove` in `struct platform_driver`
 - Change `dev_alert` to `dev_warn_ratelimited` in `spacemit_i2c_bus_reset`
 - Change `spacemit_i2c_read/write_reg` to `read/writel`
 - Change `spacemit_i2c_dt_match` to `spacemit_i2c_of_match`
 - Clean up code flow
 - Fix unnecessary line wraps
 - Move `spacemit_i2c_handle_err` to a suitable location
 - Use `PTR_ERR(i2c->base)` directly as the `dev_err_probe` parameter instead of
   the intermediate variable
-- 
Troy Mitchell

