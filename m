Return-Path: <linux-i2c+bounces-5732-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E179D95CBA1
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 13:43:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57109B25AEB
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 11:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5455E187FFC;
	Fri, 23 Aug 2024 11:43:00 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD74B187FE1;
	Fri, 23 Aug 2024 11:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724413380; cv=none; b=cNXCrrAQ7xrEp+cn7qww3AX9siCBkj8T0kjNVndZRo/XTVC7BkhnhxP+j/d+EcC1lGxzepIrDprOTgdYiT8zTLHNjxtDTBruf4w9D9+ymgIakmYhjyTPAm7De9vdQ7Y530qm76gtjvr6yshHYw5m6qrS9N/6dAKl28bCL1kxhYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724413380; c=relaxed/simple;
	bh=de4sSGgK/JfuIiF7rPZg3T9szUVyXwDQ7eUTFYV74hw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DKxceuaetdkYAVA8cqQa6gfoFUZyApTLodwfhJflQwSEY0Ws/cY5C5fV+rZSuS+0d9qSyC6iinaz/FlI5S3wpsJ5+ywJbqE/67bDfa/RCU5fMCB42dICl0BmPR7hhHS2vWelmzVJmFR/kxr3gMNuPwMLYcfgkMleEIUaCjVKA7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e179c28d5e8so1449517276.1;
        Fri, 23 Aug 2024 04:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724413377; x=1725018177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q64X2Z9uUa8iiu0OnuXm3o7cbkb9WLeS/msXrQjm13E=;
        b=nmXnLt2S7jQry6feGm7ykouWgsevg6lxhuleUhG9c0KCOeEyNwH2lyJmwuD/0quTYg
         766Xza2/os6z6lGaUk5mq6cVoFLIe8etleF2Eqjv7Mk0RN2TFqjuRpXNSyZvoZ1MoLez
         gSefeIT2K7CroiM6r737EiMKZYH6WIGWBlkZdRqtfFeVsUn4ZYdOtfwQyabUArNGnchI
         xP208oYzi75H/wnVKHI7ueQzMKp0k84hEY6QdzRNDoUxbi2CeGWiWhJ/NFpeyUyY5I2q
         8TIVmQXUbQCm01lUxV+o3mAYWhpIgvxMbNcWt0mpaZ3HICLwjegVOqiW3MV/2owXGMzO
         BuiQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9pe/okY7mD6Q+uWEBILXYJlheMb6TVLtAgdOIDQRoMe9kUxj8zZ2VQP9RV91lBasb7Ntn+KmfiFKE@vger.kernel.org, AJvYcCUSdeEzVDwRefXwAubZAXNeAZkT2MZSlHbHj4lyKe0xrbHmgAm3OapieNVhi9Y4x9Gwf2or9v2faeD3vFHj@vger.kernel.org, AJvYcCWNC8CkpkvMa6PFlOPZiGWNQwrnC5XGOo7P56vIHy6TxVocHKt0ifi8ladvNHN/wCZeTaMKoNSLl5DK@vger.kernel.org, AJvYcCWvQ1CfafbqBoYGLv+qdH2GpaYyjmANBM6vjDlpjhAtRwZwvIVnD1sDUpzOZtoq16TLaXVWXRyibGUmE79YhMz+BKo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn/0rBhkrQXAD9W2OAAN31NepXAqInlry2TGD/3EUY+CY6/BAy
	d9p8nXqaCX20Kqur5Flj7zB9S3Fa1HzrHtlrQrBvjpxQrsUXpMoHdi4sHHF2
X-Google-Smtp-Source: AGHT+IEEmnlE1LJXJD6ZpiA1Hj2mE0JiG0725MxD2lblUBB5y3Zxcl+HpBIYPxNThtxRlK68zbujbw==
X-Received: by 2002:a05:6902:2191:b0:e13:e674:5530 with SMTP id 3f1490d57ef6-e17a864dc44mr2183648276.40.1724413377280;
        Fri, 23 Aug 2024 04:42:57 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e178e4637bfsm647628276.23.2024.08.23.04.42.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2024 04:42:57 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6b8f13f28fbso16707327b3.1;
        Fri, 23 Aug 2024 04:42:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUpLkpmAbuBF5nK4HMo1FMxuOpt3FPHzjpnYbzDttwxhU+jaK/eD1N4urTkE8HwN9XD7kfgBqEUStLuGsyCa09I6js=@vger.kernel.org, AJvYcCVSxTrL1L7mVdQxMnX1+J/2hjlfYWQumyO5rDzv23C2XWENZHRdUunVur42C/wXjTAxLGu3oSTvmnsq5Vpp@vger.kernel.org, AJvYcCWX3qbvc0CbTbC1LrcgfTU5Fguliv4FwTGj97ulUqY3w7ypctVRT2vCjLyPsxYaoGXNkl6rtLswVSKy@vger.kernel.org, AJvYcCXqUm8DnAVXwI0pSNuG8D14VRL+Ute1LeYxXg4tMs9OKW1weVOBNF/ryon/Dg0ZAeke9dIDFAyBxJCb@vger.kernel.org
X-Received: by 2002:a05:690c:768c:b0:6b2:7bd8:d7a4 with SMTP id
 00721157ae682-6c629fd7875mr20458467b3.41.1724413376825; Fri, 23 Aug 2024
 04:42:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240820101918.2384635-1-claudiu.beznea.uj@bp.renesas.com> <20240820101918.2384635-10-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240820101918.2384635-10-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Aug 2024 13:42:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUkHfEwMy+FNGXppdLW32nooQc7-_V_g7C77Lq1pTGeqw@mail.gmail.com>
Message-ID: <CAMuHMdUkHfEwMy+FNGXppdLW32nooQc7-_V_g7C77Lq1pTGeqw@mail.gmail.com>
Subject: Re: [PATCH v5 09/11] arm64: dts: renesas: r9a08g045: Add I2C nodes
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: chris.brandt@renesas.com, andi.shyti@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	p.zabel@pengutronix.de, wsa+renesas@sang-engineering.com, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 12:19=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev>=
 wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The Renesas RZ/G3S has 4 I2C channels. Add DT nodes for it.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.12.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

