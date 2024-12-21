Return-Path: <linux-i2c+bounces-8680-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B55219F9FE6
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Dec 2024 10:43:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9975F18877EE
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Dec 2024 09:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CD4F1F238A;
	Sat, 21 Dec 2024 09:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="MCMX5F/x"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5638E1F2C2B
	for <linux-i2c@vger.kernel.org>; Sat, 21 Dec 2024 09:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734774144; cv=none; b=cGxau8jp5sIueBvh7ZhH4RtBLOLGB2EFnuh5iB3hIWe56eJg6AwjHxBRFaIxoIisqxQ61GTe09Ope5oMNkGWGNLOLnzWwQCeqFTCeohbQrVr4gjoGaxiKLCcL6/Kld8BiowL+47mfiPKw7blfwuVDbdBLF/2axGKH3nEDKDA9zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734774144; c=relaxed/simple;
	bh=skAEpd2O5+Df7mgJH3XAIVTg+HFKNYoWDbGYtlf8Xi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FHxg1blgzGr/JMC9guPIT6g0siFk6mD/fqD6MO8W3vNJ/vID6N176ru3palz3KaxaAkbq28pIXtOclu7Lh7xq2Y38upwb+iOKOd1SWE4p7DmBotzy/Or78Qmk9CG2stiR+UjYgwEh7bleHM8nWna9foyeoYQ+a2NPr3XvB859YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=MCMX5F/x; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-436637e8c8dso22773435e9.1
        for <linux-i2c@vger.kernel.org>; Sat, 21 Dec 2024 01:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1734774141; x=1735378941; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s4Nr1VJAu9tAGz/GDFeA54KKO7asXY2wIkKjUTyAcqg=;
        b=MCMX5F/xBJGQBE+bVyVHRp8udWHwTL7+2E+X/UfvrGY9wspDuDL0Q9vgvKVtexsxY3
         GYvyoyukk2SJm4RMK0yRhOMMgWmLscPRR+BBvtREdRPmgy2WyAFwxwy/CRJEcrtjtuFt
         yxh072Ffj7JceMCTl6jY/6HHZyN+rmz7FSXbZtDejTtpnzNBN2TQLjNHx7JRADVCJnjF
         ef6Fuq/UOfhT6E+/yJ4qMMXYl3GAl+FGpXmF4o0KBMVLbcKSd+eHYmUst1Juy7R0clTQ
         wXTZaY0GFusYLVkW1rzlRnO2h+3wZpu/Q2BgpqnffNJm0gVaeuS2zU+Pf9Ts1CLu7yZB
         qBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734774141; x=1735378941;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s4Nr1VJAu9tAGz/GDFeA54KKO7asXY2wIkKjUTyAcqg=;
        b=ISzs7UceKgITPoRIOU6tOV+y7j30VED3LMai0Fh97Rtz8hwkJ/+joNKs9jIf5E+O59
         G82mIGHAgzVyeb6Cw3hNepulapi5fs8+26Ddjp07CfDuk5dcwTwO+LaF8HivJPEHGucF
         1dmdkjGb0iCRwi1QFR1tfqP/Xt3bFAdiXtG/9PuvymxBvw7Nf8uDTKpcLn5SExz7RSNZ
         V9uR7astbqjTxtD2CjA4RSIHL8rFekdKynjXGd3XGYIMLnFo7lttktwWyG7RV/60E/fc
         o7Lp/RdeT1xFmxmucCmZY92mZhC26yjxDnwVIf3J8WIX07AYYACbfU3sG2t+3FkBpr5+
         7BiA==
X-Forwarded-Encrypted: i=1; AJvYcCX1w4c1WwtpVqjFkkQFb/YFrUU52BYzJz+jTuUrFtJ8mIUhIQz/jiuNP6QwiqqH/P0rotSUxMz7uFA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYuMPxgYWlxUm4bri2b5Go/GOT9EjTYsAeLUwgrgdSvRyjHLWF
	q624NGVfYQ3EgD4ovpl0rJnp7wA2yggbcDdF+HAKJuCTa3TPVht9/HXZN3UsN3w=
X-Gm-Gg: ASbGncuOMGMxr4t9mNJCDz+7+iN2dWCk5VZR8Jf3PC2pA32pm7SGpfztckwaPr/D15P
	MO8MjD0V8KJKGyFHQahKbEkCa+2Cse1STIz+VglQRMnCX0rAvj1KKDqiIT2PVGfNC3G1zvNZom8
	023F8kXfrZ3FneeQfdqi0ZWLPDr7qpH5L9p+AUoGHjjrPKa2qGAMC83mWwXkh10ahFUIcve1+s6
	dkNYBNmdVYKmr35LptqDL4H1tVAQmRRpnNmis9GFddbKMQWREbpGtsnXrVhKTdC+A==
X-Google-Smtp-Source: AGHT+IHAz4je9hZ7JBpRIp4B4qjAOQ6GndH21aphqoARGXhR+Vfdr+n34kF6/YR6VTNj/2tZgKzEbQ==
X-Received: by 2002:a05:600c:4f8a:b0:436:488f:4d8 with SMTP id 5b1f17b1804b1-43668643a47mr49276785e9.11.1734774140672;
        Sat, 21 Dec 2024 01:42:20 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436612008b1sm70375885e9.15.2024.12.21.01.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Dec 2024 01:42:20 -0800 (PST)
Message-ID: <15af52e7-c55b-4be0-be45-49d5b031fe77@tuxon.dev>
Date: Sat, 21 Dec 2024 11:42:19 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] Add support for I2C bus recovery for riic driver
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Prabhakar,

On 18.12.2024 02:16, Prabhakar wrote:
> Lad Prabhakar (9):
>   i2c: riic: Replace dev_err with dev_err_probe in probe function
>   i2c: riic: Use local `dev` pointer in `dev_err_probe()`
>   i2c: riic: Use BIT macro consistently
>   i2c: riic: Use GENMASK() macro for bitmask definitions
>   i2c: riic: Make use of devres helper to request deasserted reset line
>   i2c: riic: Mark riic_irqs array as const
>   i2c: riic: Use predefined macro and simplify clock tick calculation
>   i2c: riic: Add `riic_bus_barrier()` to check bus availability
>   i2c: riic: Implement bus recovery

I've tested this series on RZ/G3S checking the already enabled
functionalities and suspend to RAM. All good. Please add:

Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thank you,
Claudiu

