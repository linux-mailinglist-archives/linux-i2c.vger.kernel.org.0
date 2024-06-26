Return-Path: <linux-i2c+bounces-4376-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A24589180DB
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 14:20:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 579801F224CB
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 12:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B84A7181BA3;
	Wed, 26 Jun 2024 12:20:01 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E402313D89B;
	Wed, 26 Jun 2024 12:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719404401; cv=none; b=lud2LSo/P8xrinDbgSan2mO0qTT3Q7NWdqe4Ly0S89epz9FbOYLIK2RJji5WG/VnsbsjV4OTTNc7V/THZMai5g6lc1gK24eClb0R5B2LqflPhQvl6uu45bCmzYDLJbiZIOeNEgBP4BH1oJdF5A84/6fdlDT5rQUCO1QDrcrbMHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719404401; c=relaxed/simple;
	bh=NhwS/0jPcbT+SWSnFrU9D7JHNSM/dl5lWw89NP0DRpM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jh94BsK1lYd0KYq7vBGaOexRCI6ZFOixlm2F2s9CK0IbXUH1Wd/PKsbSnRzsKwl9leZyQdjpVbMvHq10YKg+aQJEKTmbOY4K3u1ATpPiPZ4Z58+jwTeAXGKlQdogzh3mDSRZ5y4zRW485h3Gw3aSM5qOeqrxdMgUmRnDc/vP4Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-64782323bbcso13134177b3.0;
        Wed, 26 Jun 2024 05:19:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719404398; x=1720009198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MDggygSOa6ZhSXSfpTpfRxS2RKvuyCdAPClaKesG9Ro=;
        b=aocncRJys4RQWvmUit1Uy6wIuX3VdKDeSz5zL0XU7DlJnH1SMN3asTzeEUzqlRx/gP
         ELNlHmMHRdiHppIHmpzi3GvRpIvXwE9rJ8JXoKs2UAhASzXyt34oIQg++2isI1YtWANz
         uljflKbqXxIqD+z9qBVS7p9J7ACsY87P5q7H6xcSmz2s/CRE4nfPKLqvlGgoksvDkogA
         TqtVrcyf+l99brWcimFzsyaPnVWYxX2ozeieVQxYt0VaFyS6x/pl+4wbgj3PDJM0yTdV
         orp4SbgJr066FnXCfOV7y3sryKtm5m20cGWw2UHD0ktmjxMfEoBKEm7jPN5le6MfxoRV
         hZlw==
X-Forwarded-Encrypted: i=1; AJvYcCWasaTASBUFrmZ2zzUHLg44bT5p9nAqeHHVJD0W4ZTY43MsXzrxhnsUoe9GiGldMb2fqkKPdX3rK/HU9bsXhchJMark96FMsFUVAn1sCjFV5fMA/w7KQMMODzz6yfMKIb+MhFnb0rj3jelFsolHQnnkrWgrvktHmIsta3kEE8kqFME+3ig6OcPFhNZiXfIsCBJGmACI8TWolOQExqOKo5cc8y/H3+NsX9rsBT6tayOA7Uu9JrlYji+VHRIrCNUDByKL
X-Gm-Message-State: AOJu0YyX6+lBYpxwetL0YOmyLO/Py9tNobS7ASWyYlZGkG8J4eYy84Fz
	rkkT80/NEElWEUT43owhsVGjilOtVM3qyLRq+wDYuER5YHGb8BWG3ySi9uh9
X-Google-Smtp-Source: AGHT+IGSU4qqzy0xMvoO4iDq9bk/h2bGl017/7n0ndbc9zZM0QvGHD4HWgPbc/FuX7go8vomx7jFIw==
X-Received: by 2002:a81:c10c:0:b0:631:51f4:f3c6 with SMTP id 00721157ae682-64343ff1b0fmr87164997b3.47.1719404398275;
        Wed, 26 Jun 2024 05:19:58 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-644bb43d712sm20014207b3.136.2024.06.26.05.19.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 05:19:57 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-643efaf0786so34306907b3.1;
        Wed, 26 Jun 2024 05:19:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUA1sQ5oqDoL1CL9lUqf7hGgxpilAmdcfo6HZD9ynOnc2ha1wBuniB5s/BFpvvLtmLT31ceKGx8FtqfMZe6lTdPTfOhIRA32Q5COd02H0eHeoANCMUPbLwoD76gQ1vN/gKQwMM4HXLY8mOsPd9zqAoNWenmPF5GwpNqXm+3+RPxjt34ZlrCeEeV3DjQdWzktVxXF/3GOYByJK8GYwtMQ59fYZKhYDGHpFC7/aiJ8dxRI2fUGRxzlytu3HT7HKu5cUz5
X-Received: by 2002:a05:690c:1b:b0:62d:1eb6:87bf with SMTP id
 00721157ae682-6433eaf087amr116831527b3.5.1719404397679; Wed, 26 Jun 2024
 05:19:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com> <20240625121358.590547-2-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240625121358.590547-2-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Jun 2024 14:19:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWd1jyvbiXZBOBL9Gzxp94HLV7D6LjKRdW8VVK1W6MVKw@mail.gmail.com>
Message-ID: <CAMuHMdWd1jyvbiXZBOBL9Gzxp94HLV7D6LjKRdW8VVK1W6MVKw@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] clk: renesas: r9a08g045: Add clock, reset and
 power domain support for I2C
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: chris.brandt@renesas.com, andi.shyti@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de, 
	wsa+renesas@sang-engineering.com, linux-renesas-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 2:14=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add clock, reset and power domain support for the I2C channels available
> on the Renesas RZ/G3S SoC.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v2:
> - updated clock names to match the documentation

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.11.

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

