Return-Path: <linux-i2c+bounces-7776-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7489BC604
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 07:50:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D38D1F21D0D
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 06:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 577EC1DC074;
	Tue,  5 Nov 2024 06:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HxsRFJU9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEE31714A0;
	Tue,  5 Nov 2024 06:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730789451; cv=none; b=nqSZDMav3Wav2n+D4AtJNpSfcAKpHIpeGdgZmeRI8WlleAFNGrxAVnYuk81IGHySLp6o6iWWLa2lR+xKRorcFd5pCTf7HKv3Eo5hqfjUFrqCLf3GNA00B8OBL2AvU88tJLe1SYmsnXhKPbNAt6iOWby021iR0YMTqboItim0/5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730789451; c=relaxed/simple;
	bh=x0DYJtiXwn1M4MUDcSn9XfBtjJmPlOBwkt91uuXlwDk=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PFJ+H8UkdKSw19FrwrLWrIQtdC4AT/g85Wyt2G+c7I32RAX0x2M3xlpAl86X14GnJ56oDwxVuD0YUok8W1OcELXCk4Fst4fUoYkeBrMRryjUArPIsxEBGVuvH4QME9bKxiqH/x5BV9GiUvGGwqjuUHDw7q2J7Vhi44f+SgnZ3Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HxsRFJU9; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-20c7ee8fe6bso47564455ad.2;
        Mon, 04 Nov 2024 22:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730789449; x=1731394249; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UNkZaCw/31YBcClBozl3MeNiHCGcM8jgBNaEsZtPWE8=;
        b=HxsRFJU9CdK9VdM+C5d0W2eYF7hraS47p8ZBeCoapgRVzWMCVA+x5zLez0Wu8l4HpN
         Qytcf282ATUNA1Q7ipdtetc0Wmcp/hBHdABqgpjpKL/nZrFaKE7fQzQkUyDyKhl50o+F
         kPzOFeOBVq/DzNQ8TvlxScezeWe6gJdMPyuzAwURY8tL54iQA8iXTbUPt/sCefzR6usH
         KxvuzSvLtxlGypG7mnMinXjyP/gyBJH7KBXyhoteeSMGIXbbpwxmMzQIbcijsStBYSwe
         EGEW+z5p8BpZIU4qcwc7nxTe4TZgjpDqR840/vxsqIBp3oI/owApb9ZwLEzzFmFvQ+5Y
         ArSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730789449; x=1731394249;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UNkZaCw/31YBcClBozl3MeNiHCGcM8jgBNaEsZtPWE8=;
        b=HdleioSqYcB1s8HT24PBwEu/w4/YYmtLy6GDpVej9acajOlvefWDj0heVbTP0cRUAl
         5pLrDF6N57xkkHtACcZXpV5ZgGZ0BqoSwvvE6iqC7zetnVg4zr3f50i/mALt6WzmKyuG
         rQL687qI1a/oSRqQ7hK2rJAMdZUN3vTONNjt6j8tbeM44O1cXV6oSfSWP0JGzaHNW13T
         HQgyPqwrS1OP6+A5TsXN5UGzybxW/vMW2kJszVJP2GyWc+/idff0Dhb5NM4cnQ1e3Ojy
         r7bu1y8J5s3KN0+l1o5FGg/NJzPdGd1KCXoMtEgSSouNqd4RDpvnpSxt+rGrHWvk716C
         y2qg==
X-Forwarded-Encrypted: i=1; AJvYcCUYN7aEsoPsa0/wHaPPhMI5zRCWcPlNPhFvOKnvGk/XUnEzyNzue7+holJqIYj2dO/NWmHk71all1pV@vger.kernel.org, AJvYcCV26lz/PVemfHFudcUZexzgjLJJqdRt55FjVtf9MCq7YbEvt9PYT9n6CbLIfUrX2oZqgwZ4u1UjHQOB@vger.kernel.org, AJvYcCWumaZ/5uBGiXKdAE4ytkQ9wbilao1pyv1ROSDykDv12mUrmVFO7Sl/tyNkzRNBQWtoLVZVZD5qB/980oFO@vger.kernel.org
X-Gm-Message-State: AOJu0YyxEHv2wNiKa1bY+1wDW+mFsmjN3BJWuzy2ms4PoD/XbMq6E+Mm
	S1bD2rKNQBNL83bRUvHd1LWweHRq3GYZKTlqtz1cftkDDm7qdT6Y
X-Google-Smtp-Source: AGHT+IGTBwrP1TkZSWIk2X4RRAt1w4GHZKgD+eXUX0HaC7TrWd54lpAGhJvId49iQUorzmnQX3zI5A==
X-Received: by 2002:a17:903:32c8:b0:20c:e2ff:4a50 with SMTP id d9443c01a7336-210c68786dfmr456157215ad.9.1730789448763;
        Mon, 04 Nov 2024 22:50:48 -0800 (PST)
Received: from [127.0.0.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057c51e8sm71623745ad.210.2024.11.04.22.50.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 22:50:48 -0800 (PST)
Message-ID: <84d07d21-54bc-45eb-b231-8f800a2afed3@gmail.com>
Date: Tue, 5 Nov 2024 14:50:36 +0800
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
> ---
>  drivers/i2c/busses/Kconfig  |  18 +
>  drivers/i2c/busses/Makefile |   1 +
>  drivers/i2c/busses/i2c-k1.c | 658 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 677 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-k1.c
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 6b3ba7e5723a..38ebfd38dc41 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -779,6 +779,24 @@ config I2C_JZ4780
>  
>  	 If you don't know what to do here, say N.
>  
> +config I2C_K1
> +	tristate "Spacemit K1 I2C adapter"
> +	depends on HAS_IOMEM
I think I should retain the depends on from v1, like this:
depends on ARCH_SPACEMIT || COMPILE_TEST

Krzysztof mentioned that there is no such thing as ARCH_SPACEMIT, that's because
this patch depends on the basic DT from dlan:
https://lore.kernel.org/all/20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org/
> +	help
> +	  This option enables support for the I2C interface on the Spacemit K1
> +	  platform.
> +
> +	  If you enable this configuration, the kernel will include support for
> +	  the I2C adapter specific to the Spacemit K1 platform. This driver ca
> +	  be used to manage I2C bus transactions, which are necessary for
> +	  interfacing with I2C peripherals such as sensors, EEPROMs, and other
> +	  devices.
> +
> +	  This driver can also be compiled as a module. If you choose to build
> +	  it as a module, the resulting kernel module will be named `i2c-k1`.
> +	  Loading this module will enable the I2C functionality for the K1
> +	  platform dynamically, without requiring a rebuild of the kernel.
> +
>  config I2C_KEBA
>  	tristate "KEBA I2C controller support"
>  	depends on HAS_IOMEM

-- 
Troy Mitchell

