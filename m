Return-Path: <linux-i2c+bounces-6009-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E99968E11
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 21:01:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBEEE283D46
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 19:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE6A824A3;
	Mon,  2 Sep 2024 19:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="foLOvnJx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F521A3A9B;
	Mon,  2 Sep 2024 19:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725303681; cv=none; b=hHSv/EX2KXlsEhzBJszEwFmDTA4TMPTo8Qi6SQhRokiAcYQTQM+++NOd9ILE1D3NJplOCwiuuleZl3eLwK/Nod3Iy0b2+INN1tyb+CfrTpQksttR+/gesl2uG9WhUgMFgqBUM3jkzWW5pNrLbyz5NLmecFIiB862iVpo52W/tDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725303681; c=relaxed/simple;
	bh=RhAcVVrFGyE4DDo5KKO8+2qi2CZR1nFZg/F6HQIch3Q=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=dXJzAaoNgwqtqKO+ZuKWXHfRo0WOuEFNadrFkuUklkDELXCxxfMXHMomHISHxGKRvfo7RFlRVp9XONfNiy0ErdlhH6+7BPSJFCrZl4/bvuJK+HArD16iSKc5P2DVWHmUqULR+odzB39JDBTKriHkYdA1toT2xC3YEB0zVFubsGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=foLOvnJx; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5becfd14353so4392017a12.1;
        Mon, 02 Sep 2024 12:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725303678; x=1725908478; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/Ps7OSQ+/WWYlgzbouGxWDfS7QZCGq6Wzthb+kXHT6c=;
        b=foLOvnJxBXF6WOZXRtPtSMWqDkA2kmelxvYCJ9A9vVKK3yakyx6zDfeULKM3pZ9UVi
         aHTiTfZbGDciLD0j3Q4DkcDAtVonm434skdcwGiA7RV6VOFfV2HlBGcUP4Os/LZsUULP
         GArzvW8dlr1C2Kqsjcc7z2tBvYPL/UXNEmCHpxffXlc0QaCv9P4eop2yQevdoCCreCJA
         a2wES42qOBYO+78VScu3O4BUnAJp7VF/u6FHZbxZfSNrs5tgp/oFPceYH5TzCvRux59k
         hhsBA77aFkoqEwrBevt4NyRlEl3m91fJ+hPLhgCMfvZj+89R1vZrV48QfYsIr8YPntuS
         1DDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725303678; x=1725908478;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Ps7OSQ+/WWYlgzbouGxWDfS7QZCGq6Wzthb+kXHT6c=;
        b=UARcFGslepvhfeO5XEVfDhNqs6mUR5xbd1XpMJo0tbSIRVJ9uM+gjAWa+Pl8gX3wdb
         pAO+7mdjY9KMrBjt120x0c5VgJSmXdBHrN+BInJYIoCEFH+RBpGwxTHjWfEEVvjPx2kT
         Y6jykqTJUBvLYE2KRyNe0nP1EAIUJZNCiWX2YFajxROP9HpGROVzEaLzw/HhIDfCafO5
         BMXwcJSYdOONfbhUvOKI2JRuHiPGrCuJxe1BB7Wcmn0xKifpMZZqCJX4ieKTWGrJKoBx
         9uANbZtc2OEnEbyDfzTU61gtsXo5q47w+zJFT3qYp2YmgFG0Nt4usufhOE4il8y0DnCZ
         SZJA==
X-Forwarded-Encrypted: i=1; AJvYcCUF5qvcNH8ZzXUFfVMmuK1mCiHYNBmWbBwJjQci8XXH/Phq0DCA5Py1vDoOnwvg5NxSZ9Ae82JL1WwfFHQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrRJZWZExgz8i6a/VHHzf48nmM+K96YpsvQNfqRMOJ61obbSVd
	hehzqtFTWGQZc0gQ7GnTRhUyh7DT9jhtYAOvLlbfaxzwx59UfIi+
X-Google-Smtp-Source: AGHT+IEi///57DMhb6MpeOFPSUdEkV9pTZepKkM805G2PL1pzM7sZHb1tVGtvyaU1ip4Pr/uP0Kz+g==
X-Received: by 2002:a05:6402:909:b0:5bb:9afd:8d05 with SMTP id 4fb4d7f45d1cf-5c21ed8bab1mr11279160a12.24.1725303677359;
        Mon, 02 Sep 2024 12:01:17 -0700 (PDT)
Received: from ?IPV6:2a01:c23:bc00:6b00:fd2d:3fc2:a936:4a81? (dynamic-2a01-0c23-bc00-6b00-fd2d-3fc2-a936-4a81.c23.pool.telefonica.de. [2a01:c23:bc00:6b00:fd2d:3fc2:a936:4a81])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5c23bcc0718sm3672454a12.22.2024.09.02.12.01.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 12:01:17 -0700 (PDT)
Message-ID: <8e618f52-413c-41c1-9ac2-0260a1904792@gmail.com>
Date: Mon, 2 Sep 2024 21:01:18 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/2] i2c: core: Switch I2C_COMPAT to default n
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <4660a46b-9128-4407-8baa-f257245784a3@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <4660a46b-9128-4407-8baa-f257245784a3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I2C_COMPAT has been considered deprecated for 15 years now.
Therefore make it default n, before we remove support for it
in the near future.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/Kconfig b/drivers/i2c/Kconfig
index 44710267d..e5721cebb 100644
--- a/drivers/i2c/Kconfig
+++ b/drivers/i2c/Kconfig
@@ -42,11 +42,11 @@ config I2C_BOARDINFO
 
 config I2C_COMPAT
 	bool "Enable compatibility bits for old user-space"
-	default y
+	default n
 	help
 	  Say Y here if you intend to run lm-sensors 3.1.1 or older, or any
 	  other user-space package which expects i2c adapters to be class
-	  devices. If you don't know, say Y.
+	  devices. If you don't know, say N.
 
 config I2C_CHARDEV
 	tristate "I2C device interface"
-- 
2.46.0



