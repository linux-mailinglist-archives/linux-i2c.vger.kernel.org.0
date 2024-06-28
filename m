Return-Path: <linux-i2c+bounces-4458-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3DA91BB57
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 11:22:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E4F31C2297F
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 09:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0BA81509A0;
	Fri, 28 Jun 2024 09:22:22 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CBB21105;
	Fri, 28 Jun 2024 09:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719566542; cv=none; b=KSCNkEpeiq82p0uRNJvB+mJHVTGXP2MzvIZ5uKBphKNpQSGS9C+7yrdGPvj2gO+D0AHvnbYBkS5PpOQO8mlD6QvC3yE4ZOQ52fJmKRlaMXFG+IueyFQU2WAwRf/CQBIHEJzLJr4dTXRAtWOw3StRo2h419ICM47BVN3MtDivR7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719566542; c=relaxed/simple;
	bh=s2v0SCtuLdBGXTNA/pzfiqK5TXKCGtl+5CoWL2zIOrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eN+xzs3lu1kIkacXjhQIxPQbLol6vpYITnYTLFNZFgP8wl2EZ2LDjlWIGXY+2EnE6ynUUtJxEu+NMFC9YOhE9IvAjbHFN08IoKfZd0ldlCap5UdzDVpsAUfaHACDslwKZuzVWnBNXcZG4WGcMz5jYrcidyasD2Bl9Wwmu9HiVbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6327e303739so3517797b3.2;
        Fri, 28 Jun 2024 02:22:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719566537; x=1720171337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lPkiiuvvTvf4U3Ro8IqPKqYL9PdIgEp2Zf9jQK+VOus=;
        b=oMPO7I0L4R2LYjIdQ4c6u7uRtIxsaDSbtyiwhlqlOXaTukyIi4HXkXlLTEEX8NtN64
         BqOv5l1aep5FsWmB9kejIAFb4eJdLxjAY9AaCENEjoRJ5MoZCcmJXZ5EzJ9O+pof8Zoz
         SqWcKIFZh47e+CFHSOTcoNLJgZIWnpohM6Q89sVX0XQGExJUbD8OxbWmA6DBtQdn9q4g
         OGgxvQS3dAbEiQerXF26W5A9Hov1ikGspGG2j87X95n6OR44MmOOE4Vo2BVtWr2EatBs
         TZuKq10xs3BPACE2Up2G4UZaqVeV6vA+e2WfRFbrUnY9DfwcRnF9h3/sU7/hdXX0Nh3m
         ldQA==
X-Forwarded-Encrypted: i=1; AJvYcCWI5l5WrCna+LLwqqcEEDE5omLEa/QAz8ip/niAqT9BElXA13rVeh+SNoyn9H0Z8dW5dRDTXVguvzPoeBpN7USxN9IZhwsFz1g6hMNn0sLLF7+JspYAcnkdnnxzwDyePhgzyi1J7uMmnVylhxba2NDz3Et82Z5FEOK9M0cOR25tgwhozMVrLFmgOCZUVr8mo184JxqUJAXOkC1xUzhoxlypUWeDvZiQPD7I7T/Qlua955Pf2zSHBVBmql3k3G7m99gk
X-Gm-Message-State: AOJu0Yy7wVItFMjFayVGbBX7KXO8V4d3WseyuavraBCmGQsFwBGY3MvY
	eZA7PSYGvsASepsyC9CZnNc7tjsKLY2J0lHBxjrHIpgLRMXDc+QhH0sijoNn
X-Google-Smtp-Source: AGHT+IF2U2yL59gFoBHuaQ1ZeXCm8HFBJrGLAq524F2DrTFgDuSmurln8J3OH7v2V5dlY6M32jQHNg==
X-Received: by 2002:a05:690c:360e:b0:64b:69f0:f900 with SMTP id 00721157ae682-64b69f10411mr2105477b3.23.1719566537524;
        Fri, 28 Jun 2024 02:22:17 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-64a9a803a15sm2695677b3.68.2024.06.28.02.22.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 02:22:16 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-64b0d45a7aaso3209207b3.0;
        Fri, 28 Jun 2024 02:22:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUL63FHWF6lOdRcp1BfDlfvNIi9cp+9pS8PiPfA0oh3J48DMFWP+gmmw/2+Yll302Lmr6niy/6qJBgGip53budHEU60ekm+uXj7cq8HY0wcUFmCWcCh6YHTVwKh9igcertpXBYRhj9RR4kVAleBDeQkk0SxVLDBf14oz7B4lka8bGnC6Fby/URj6UmseXjkpyG467OFDKoTXQktBKEFnYiH+DtMXkeVtEF/qhHOoScO72jO09eY96cfcd00HO0RsP7t
X-Received: by 2002:a81:a20a:0:b0:61b:33c8:7bce with SMTP id
 00721157ae682-643aab82cc5mr155916427b3.31.1719566536472; Fri, 28 Jun 2024
 02:22:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com> <20240625121358.590547-10-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240625121358.590547-10-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Jun 2024 11:22:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX4hWou9OtdE8XgU7-U0ghJ6vk2kVqgT90U0ZjsxzR5DA@mail.gmail.com>
Message-ID: <CAMuHMdX4hWou9OtdE8XgU7-U0ghJ6vk2kVqgT90U0ZjsxzR5DA@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] i2c: riic: Add support for fast mode plus
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

Hi Claudiu,

On Tue, Jun 25, 2024 at 2:14=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Fast mode plus is available on most of the IP variants that RIIC driver
> is working with. The exception is (according to HW manuals of the SoCs
> where this IP is available) the Renesas RZ/A1H. For this, patch
> introduces the struct riic_of_data::fast_mode_plus.
>
> Fast mode plus was tested on RZ/G3S, RZ/G2{L,UL,LC}, RZ/Five by
> instantiating the RIIC frequency to 1MHz and issuing i2c reads on the
> fast mode plus capable devices (and the i2c clock frequency was checked o=
n
> RZ/G3S).
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/i2c/busses/i2c-riic.c
> +++ b/drivers/i2c/busses/i2c-riic.c
> @@ -407,6 +413,9 @@ static int riic_init_hw(struct riic_dev *riic)
>         riic_writeb(riic, 0, RIIC_ICSER);
>         riic_writeb(riic, ICMR3_ACKWP | ICMR3_RDRFS, RIIC_ICMR3);
>
> +       if (info->fast_mode_plus && t->bus_freq_hz =3D=3D I2C_MAX_FAST_MO=
DE_PLUS_FREQ)
> +               riic_clear_set_bit(riic, 0, ICFER_FMPE, RIIC_ICFER);

Unless FM+ is specified, RIIC_ICFER is never written to.
Probably the register should always be initialized, also to make sure
the FMPE bit is cleared when it was set by the boot loader, but FM+
is not to be used.


> +
>         riic_clear_set_bit(riic, ICCR1_IICRST, 0, RIIC_ICCR1);
>
>         pm_runtime_mark_last_busy(dev);

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

