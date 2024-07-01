Return-Path: <linux-i2c+bounces-4513-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6606A91DA65
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 10:48:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 243481F217AB
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 08:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2D1284A28;
	Mon,  1 Jul 2024 08:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Oy0nN5QB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE70F12D74E
	for <linux-i2c@vger.kernel.org>; Mon,  1 Jul 2024 08:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719823629; cv=none; b=fYXeeayln4gbpQD79pkIzFyTd+Fkkdt2xKr9L0Hsj1pFmUw8/LlP09yrRuIOfFcr4BJ+YX7yroAN3MpsBHbr/tg1HwOzZ/dRRuSZoIZABJP+Nt1zcymV8VI1/gW7jGrUX0rCADO0emsIJ4N20p9cd/nt+geobblB07pWc1Ffbvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719823629; c=relaxed/simple;
	bh=J80nLZeZGFfK8pG+9YlUTYaSTzxaU2ZIMPTzngHBP8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=svcJjyzFKjS6ZJBPlvbs2jkVsmpnH63rxiHZbH755GJP3OsqqnfyVTPGpAtVyMaq5JdnfS/FauVTe/oKj9EsFv7pxEePWFaytWqOZXRfxXC3mfCc1KxrwXgk/fBwJwwgFB31DNhyq1MjwZ+Kqx+S+BZz+1UngJvyJadk9q9pOJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Oy0nN5QB; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ebeefb9a7fso31762031fa.0
        for <linux-i2c@vger.kernel.org>; Mon, 01 Jul 2024 01:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719823626; x=1720428426; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J80nLZeZGFfK8pG+9YlUTYaSTzxaU2ZIMPTzngHBP8Q=;
        b=Oy0nN5QBODmwJ8nHAohQ/YLmEPveQl1kccDscCDwh2VaxtpAmaYdYTpOo9IsS6hzWv
         jODEAB5cznuSUdSDw2q0J3vEqDkbO50q4jr1A7bDQ0TdjCunuojA9OKCBssyJ7G0iSD0
         iSv/xWEzys6wBZTN/lwuyw63CeS5wgsJDKp/5R8dVkJE90xkFLpCTKv6gq1h5kKhxJtC
         IjQtCZQsqVTdeNd6wWhyz6CVGAI2tTfXlwvY58GvNbMzRAsNUnjns6e42SSdJElMnELM
         kpSqat8jxfErzqOeWYrUtFfkzFxNu9+DVOyK9LfmNik16CuTvgpc652jugppsYnpC9dd
         4pMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719823626; x=1720428426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J80nLZeZGFfK8pG+9YlUTYaSTzxaU2ZIMPTzngHBP8Q=;
        b=seMNySL0mBBpKahawl93QbgkLavs5VUA/FMMpJkpBNQ3xu/nfkTMozi7v4/JPRic2F
         nilchk4gE+3DG7xi87tX/hRcTTsST+cjEmJUmxJO548XuopSMFE0ahMEeN/wTTcd3l1I
         cA8wM4+7o7SRqZ0sbPQngSgm/HGmsuKs8zlyagFucuPOkgeEfF5hKe0Xc1HZEn8ruvHb
         bn8ByyZS6+StDWQ8ewnaAH8BB+uPYG6tD7uDKhxh4ttLns1ItcjM5b4nHbket3damQbG
         XHwKj4Bwr5H2gKyMquVo3LVS921b+tevJvhUL+e9KPCXg/AhFNC4PMV9+kA7Zt7A16Pe
         zLGg==
X-Forwarded-Encrypted: i=1; AJvYcCWUyRRCt9u09M7LxQ2TWcD1PEFlCHMAuQ4FjxMbvkpexgg10/Ca7nEYVeVjmCtZ+BDOwcHdvf8jlizBppL5f2t9cH3bxrmPjNMA
X-Gm-Message-State: AOJu0YyQXmUqEqa5r93FNaHXMZud6iKZlNg2vL9G7m5m1tqT79PbIq0k
	lTviB6gpu/sk5NUHl1wr7IEnTMjUjkD05KQjUHolMC+S48klgZM50Sr0LlJvNxWobdk/uBL+zJ5
	oRGgtlt/ffgfS+C0bOafYOiK2R9JYjcSLhdpH/U8y8CqQ3zvSMtg=
X-Google-Smtp-Source: AGHT+IHZzhPL1bKVGPiXe8Dh3Q3HBIQDIiL2qqpYO18rzYiBiZCgigcg19dFmv1YMa3eNChS4ZAzrtshCj/BZXUawAk=
X-Received: by 2002:a2e:a889:0:b0:2eb:dd0b:b9ec with SMTP id
 38308e7fff4ca-2ee5e3a30e0mr38212871fa.20.1719823605163; Mon, 01 Jul 2024
 01:46:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628080146.49545-1-andrei.simion@microchip.com>
 <20240628080146.49545-2-andrei.simion@microchip.com> <CAMRc=MeJyByMvcFT2aJDK87bz4=+UXEuMtQ4G4MZUAUt39SS1Q@mail.gmail.com>
 <67d3646f-1b84-4d2d-9e36-be898f13be90@microchip.com> <CAMRc=MeJM4LmczCbZ8bKytLZKY_mP=Q8eaUprLMmO8BYHecStw@mail.gmail.com>
 <c1b53308-d1d5-412b-9558-9f40dd237397@microchip.com>
In-Reply-To: <c1b53308-d1d5-412b-9558-9f40dd237397@microchip.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 1 Jul 2024 10:46:34 +0200
Message-ID: <CAMRc=Mewx0NAdFBX6hpes_oa62M_Jp=LtzAPK73tZv+tKxnScA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] eeprom: at24: avoid adjusting offset for
 24AA025E{48, 64}
To: Andrei.Simion@microchip.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, arnd@arndb.de, gregkh@linuxfoundation.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	claudiu.beznea@microchip.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 9:23=E2=80=AFAM <Andrei.Simion@microchip.com> wrote:
>
> >>
> >> For those types of eeprom 24AA025E{48, 64} adjusting offset is not req=
uired (at24_get_offset_adj()).
> >> So, indeed, it is an entanglement in logic.
> >> To keep the implementation as it is:
> >> adjoff (which is a flag that indicates when to use the adjusting offse=
t) needs to be 1 for old compatibles but for these new ones needs to be 0.
> >>
> >> I think that is enough not to break the existing users. What are your =
thoughts?
> >>
> >
> > Wait... is the adjoff field effectively a boolean? Why u8?
> >
>
> struct at24_data contains offset_adj which will get value calling at24_ge=
t_offset_adj()) if adjoff is true (1).
> Yes, adjoff needs to be treated as a boolean. I will change it in the nex=
t version.
>

No, wait. Why can't you just do:

AT24_CHIP_DATA(at24_data_24aa025e48, 48 / 8, AT24_FLAG_READONLY);

and avoid this whole new macro variant entirely?

Bart

