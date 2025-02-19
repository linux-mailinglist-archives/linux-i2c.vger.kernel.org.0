Return-Path: <linux-i2c+bounces-9493-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FC5A3B858
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Feb 2025 10:23:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48EC63BABA5
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Feb 2025 09:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EFBE1E835D;
	Wed, 19 Feb 2025 09:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTItAjl2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C091E8329;
	Wed, 19 Feb 2025 09:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739956328; cv=none; b=ekTjBVxtQN0n7FcTVVo7Xck//qkYJ5fel3LEDpsuXL2ZX1PamffyGjqr2yPttH/WSAOUIG7kCUvueJ2YAP1oNPia4MqxoVlidLjlP009Iq7IpNJ0HqdgURUkHubUvEhBDYroB7vJoPcwbuOAMNaaKTS9Pny1bdi/qZHNOQ7af08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739956328; c=relaxed/simple;
	bh=1mDmGlQiTjrTM9JA4bPSMWae34JasEkJOVEndkM6ZvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mid40fwRGob01G4FpUZKZVxjBxmnujzk033bx9DkS8MAC8COZKyQcNaKVbIN+OkLI6pVerzUd3h60zQ3HbhPe59KDIA8RIDi6H1kYflqP0uL1hgbpUmRJHXtCsmBV5lLZXv+g/Hpu3j1O6quS2rqbVbBByxFeJZBDR+xQGI+W14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTItAjl2; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-abb90c20baeso448906666b.1;
        Wed, 19 Feb 2025 01:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739956323; x=1740561123; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dBlQIQZTyl+c9YJhOesoDPaG6Lk+JATvxoUqF2ZkP5g=;
        b=NTItAjl2TB1JZkFE5RZJHn4pbmcPMxA0pX8ybuSsSaIW4sRw16kd2zR6tgTzq3rBHu
         wdDFdmURY4kJPLa//Ab014fOhW+ts62QB2ZFUKOCD9RiBybqI6yc2nwtj4fCn64l3NHe
         roT9UgajHM1g+f6xnn3XqWOv9u0ix/3Qf0NUNKyX68Qfn+WDHuWHNgs6Kl7bOyX/kn9F
         rTW16XqTtaFUFmdh8agVICIc+mWnuve11bTPDexikN1eUsDeCBzva5OZwq605o1IItya
         uC/GlNsJR1jllrksaZo/wPXtDKVx785uHTWeP02fi3FQu7NxAwHJj18hocF0pQOkB0g2
         UKzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739956323; x=1740561123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dBlQIQZTyl+c9YJhOesoDPaG6Lk+JATvxoUqF2ZkP5g=;
        b=SI4rknlM7nVG0aq84932FPPYNEmtPIS6rmMZ2rhgO82Fj6M0Q2JGVeW6GQm4r2JC9D
         YMPTJQqLI6Ly/n7ik9Rp29S1lstFPNysx3oUNE7vNz5K/ImISlKWIakXpYcBpazJuhOP
         cJyyB7I4iaNoYSDl7spePE0fBl0GpYA5OTNIY/PqWpNpbaac0ZziKkMmcE2vIqO+hwL9
         LPnD3RPfcIEqmUoDZnfvjie0PWw7XiIdqQBR2yqMhAzPEoMRtQ5zWIeS4q98ykxlF3Ll
         xRaJGplohHNBz/+9b8DL47MBM8hJ4AmH5tg+T6GomeNVRTwQk3FfuSbO67E02OxbsF+S
         gSTA==
X-Forwarded-Encrypted: i=1; AJvYcCUuf/cBMdcvSpKlKhVE9P1PPtiemUBozGbNhrUhUwwUbQzeLxJVQnCtndRl1n71ujxwMRbYoM+T@vger.kernel.org, AJvYcCWMnOI+MdrVleJA07jPqhhDd9Nrgh3ah1Dx8I2FUhZAo1ZhWii+PPkIY5JgjbdBd5ZbrrY8Lka0QrE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDTU2FUYrRA6gzIMi9SLQEWsZ+IyNDZmvZB21gdSaK9QIguB19
	g4MKpRgN+WcimJda7XvD3N8T9nnOY7GksPlqkvGSe35bmNGdSBTL2BIR6fALFid84LzWDkm4Ig+
	p0RCg6Mqa9GzfKKiNWIAQ/JLvuRc=
X-Gm-Gg: ASbGncvGNBN9T5KeL8QJOfw3RBAY0i0o/QL9B0vxEd3ZoeOM4jSr3ZZd8pMkbie9zrn
	I5ClGmH5lqEC5nUbjs+3xxzeY01ixecjRW3w9KjNXaP+5+K/H7wxa9FsShRuDeyvayXLlc+rU
X-Google-Smtp-Source: AGHT+IGuIK/CQy8bOdyilmjVVAnjbdAlGWgVtHcOdZyL7b2VSZoGr3Oqwi/oJeLhkyY9/0jyPhsCU2sPtKBUq41RyoM=
X-Received: by 2002:a17:907:7fac:b0:ab7:cc00:4d4a with SMTP id
 a640c23a62f3a-abb70d95cb3mr1810038166b.35.1739956323370; Wed, 19 Feb 2025
 01:12:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250219020809.3568972-1-zhoubinbin@loongson.cn>
In-Reply-To: <20250219020809.3568972-1-zhoubinbin@loongson.cn>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 19 Feb 2025 11:11:26 +0200
X-Gm-Features: AWEUYZndSh3zP-0TVudcjduNMhtOO5FnyJN-FotaI3FwFJihJXCAoNLkXbk2NmE
Message-ID: <CAHp75VdSqFhEp_Xt=qtBNDDz984N97pZmS684oS137dFi0o_pw@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: ls2x: Fix frequency division register access
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-i2c@vger.kernel.org, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	stable@vger.kernel.org, Hongliang Wang <wanghongliang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 4:08=E2=80=AFAM Binbin Zhou <zhoubinbin@loongson.cn=
> wrote:
>
> According to the chip manual, the I2C register access type of
> Loongson-2K2000/LS7A is "B", so we can only access registers in byte
> form (readb/writeb).

readb()/writeb()

>
> Although Loongson-2K0500/Loongson-2K1000 do not have similar
> constraints, register accesses in byte form also behave correctly.
>
> Also, in hardware, the frequency division registers are defined as two
> separate registers (high 8-bit and low 8-bit), so we just access them
> directly as bytes.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

...

> +       /*
> +        * According to the chip manual, we can only access the registers=
 as bytes,
> +        * otherwise the high bits will be truncated.
> +        * So set the I2C frequency with a sequential writeb instead of w=
ritew.

writeb()
writew()

> +        */

--=20
With Best Regards,
Andy Shevchenko

