Return-Path: <linux-i2c+bounces-14401-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A9ACA38D0
	for <lists+linux-i2c@lfdr.de>; Thu, 04 Dec 2025 13:09:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E87E304A11C
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Dec 2025 12:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A1C33ADA1;
	Thu,  4 Dec 2025 12:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cw1y2ORH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE7128488D
	for <linux-i2c@vger.kernel.org>; Thu,  4 Dec 2025 12:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764850090; cv=none; b=XS5tyzoGNai955EA8Qh54DvetxTFZ/NV6MENN6UPC9NS6kDcMGcTzqvEp4CTB6FmveYOGa0Vl7NFTQA9KsTMPNykEbXNWqwiCbbKCj4t+5KgScoOzSj3OUk/h+K0TpLTl7ZNuDg32BQkOcomAiGAQkZzAqA1NPDwxCR1+z7/v4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764850090; c=relaxed/simple;
	bh=N8ywKgvhGfNbTuf59I2eWbO+CBw4hdAqLJ8DaYFh3gQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iyrn2bK0QBU4tLAgR4BK4dtTcA9rieGFKIEMrJhzHfSu06bIZtRqwfOQSFH/z5kAObE26UYeJQVxpWgCgj6mhPPpZFdDME9AuVrDq2yZs1REvUXCjWKd2Jim84e/EtlG6zxpbxR3YRHzjERFpiPgNSBDY/WqA8k2xbhNfHhJ8BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cw1y2ORH; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-640bd9039fbso1321779a12.2
        for <linux-i2c@vger.kernel.org>; Thu, 04 Dec 2025 04:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764850087; x=1765454887; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8ywKgvhGfNbTuf59I2eWbO+CBw4hdAqLJ8DaYFh3gQ=;
        b=Cw1y2ORHAsyVtqbVHK615ibsGbzobflUqc8W0wb5lQ+045MLWY5VIDSzzStEgNBsgl
         cXLjfxmgbV6iznzQH/wexaMzIsnl3lOwizEIE8ODrX3ULr3fU4vebHheVMI5yEGugchs
         JulWuq1UBb6ehjh4vTYHkTV52TRHCKGyRG5U+nx86OOW8PjiTz6lEIHUc3g8Y5OLQ4/k
         tNi1O5M1jhcY4t86RV81oj8beNC11A/Szv9vDh/IiSazPgmLKUANcAEcedz26U6ZFz0P
         XKfvZIFtJon8PzneEUbJ7Pz69B2p3TuSCCkZuzvftiT/2IwrE7LJfzVs7WzIoYncKrsK
         RP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764850087; x=1765454887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N8ywKgvhGfNbTuf59I2eWbO+CBw4hdAqLJ8DaYFh3gQ=;
        b=Q5R400nLUTcClV3uaZYNk8FiMpWmLAAhEXTjRZxhDh980xSOH0wC4V5yevY2yEQGCj
         ZeHLlsipqCZ6VEnA8eT7DEsGVy9w6emROMQrgnV4T9+K1baHLV/yreCa2p48Yhy81fbN
         52DBvDV0Mwg7Cfj3MmghSnLNQ5jjRn2580KviUoAqY9ynYtPDwO/FyqRVC1vUYuLJ1Ay
         8kBDghgDMNSZYQjHVwAKWGFxQ4hKHYRzDljPhlzTLB/YD+xD35/Q3oEkE0hYuxqAzJ8b
         5Gf/6rB2SqhuJ1FDEiBJqvZAiL/XRFFPwKzs2m6dRt1czLMlelMVUKtHiWkoyjUKthVM
         S7Bg==
X-Forwarded-Encrypted: i=1; AJvYcCU5FPwwpprGC9yFXkqsMPDrlRs3dYBR0YDxIgAGDqnViDcIsyBDDToyj+OFbc6XQap8rPzewlUrUcA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVVAc6l9iHSrlr3qVstvKNDCEV0kU1optYWM+7qLRMip/UXSP0
	dfcecm/jlB01ft9WfZBFkeT0EJqwfnXphKf5N3JPi3tVWlI5zHG41NSUz/d9bX7qDUPRV6vL4Mc
	ZaEkcipsBtBOUm3eRPnOBN0BXUGpFvDMn25UAKJs=
X-Gm-Gg: ASbGncviXEoFA0DVhtoPPiUiZQ59B6cLBpqbw+LjIxOMBi55FXGzxr/hRZWZYlzvLt3
	e7rOVF3oHa6Gfwwk7d+QbUvBQsLSYzQjiWLnfSN/KyjpW8PZTuDTs3u4pZcAWUS3liM/JdxwLZF
	yS5ITKO5JgFOekIZJzQQMHGZbN6jrnKxXs4bx3rzNMjk/XgxQKNim5CddOOiJaoPG1jX+Oi1ehY
	oEzoFsV6fhS15hHF9QUcBHRtOlzXhZLACrSofOtoidMs2hLohigq4KGuM1pptFi6lSs1DWu
X-Google-Smtp-Source: AGHT+IEx/PSrrrXYXzdYKjUJ8Vex21sVIz+i3jugwW6yuGWkH++tLjowsyJqC4ofe+dKcMUm24yCaGfbwki6fJWm6l8=
X-Received: by 2002:a17:907:7ea0:b0:b72:5bdf:6074 with SMTP id
 a640c23a62f3a-b79dbe8b05fmr655949366b.20.1764850086694; Thu, 04 Dec 2025
 04:08:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106110935.2563071-1-a.shimko.dev@gmail.com>
 <20251204114129.607200-1-a.shimko.dev@gmail.com> <20251204120036.GC1613537@black.igk.intel.com>
In-Reply-To: <20251204120036.GC1613537@black.igk.intel.com>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Thu, 4 Dec 2025 15:07:55 +0300
X-Gm-Features: AWmQ_bloo1eDhGUaurEH6TgJp24cnu9XonLDvmKiw2bo0CCYxD05qq2d-onjy3E
Message-ID: <CAOPX747Y9Dbzdn2PfSU3wqce5iFx_XfJJa+Zoq30iEsgJCRdPQ@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: designware: Replace magic numbers with named constants
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: andi.shyti@kernel.org, andriy.shevchenko@linux.intel.com, jsd@semihalf.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mika,

Sorry about that, I'm a newbie and might make mistakes.

Yes, I'm confused about the versions myself, and yes, there is a v3.

Am I right? Even though I already sent it in response to the kernel
robot report, would it be better to forward v3 to a separate thread?

Regards,
Artem

On Thu, Dec 4, 2025 at 3:00=E2=80=AFPM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> On Thu, Dec 04, 2025 at 02:41:29PM +0300, Artem Shimko wrote:
> > Replace various magic numbers with properly named constants to improve
> > code readability and maintainability. This includes constants for
> > register access, timing adjustments, timeouts, FIFO parameters,
> > and default values.
> >
> > The change makes the code more self-documenting without altering any
> > functionality.
> >
> > Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
> > ---
> >
> > Hello maintainers and reviewers,
> >
> > Fix replaces magic numbers throughout the DesignWare I2C driver with na=
med
> > constants to improve code readability and maintainability.
> >
> > The change introduces constants for register access, timing adjustments=
,
> > timeouts, FIFO parameters, and default values, all properly documented
> > with comments.
> >
> > No functional changes.
>
> There is already v3 at least of this patch. What changed?
>
> Also can you please send new versions on a new thread instead of replying
> on the existing one? It is really hard to follow.

