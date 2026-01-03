Return-Path: <linux-i2c+bounces-14891-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFF6CEFE96
	for <lists+linux-i2c@lfdr.de>; Sat, 03 Jan 2026 12:57:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A4FD3028DA9
	for <lists+linux-i2c@lfdr.de>; Sat,  3 Jan 2026 11:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8909283C9D;
	Sat,  3 Jan 2026 11:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXans+HO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6021F0994
	for <linux-i2c@vger.kernel.org>; Sat,  3 Jan 2026 11:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767441416; cv=none; b=hqAVpIMviIPi00uFrmX94eyEljl4ldn4KBrXJq7Hif3OtE+F0jXVQJoRW+1GNjrvv5uqO21YX0puV0VsAU8V24Z9i9WL1HEY7RhP4g0M9YppMcDwOK4ExS1FG/qW8n2qYBfe8QxmOO6Hdsahm4C/hlL2/n6agEoOvSPFDL8cMvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767441416; c=relaxed/simple;
	bh=gmnAKAfv29ulmMb0BC0UKs0MVt+IkK2zMRYsdR6rhaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YKsHqVKPm3FRou8EVf9+gk89Ko3P1A5laklxdvBrvpRMtZlKtGhBLJcIGw6sAPDz7SptLNxr6IoVM7a8FQieEAA/GRv3v3W5wDzpZHV561PVhTcrqhRQNKtT9gkGNTL3VJUKDxGqe+V0JzuGkUTUExtQ/wszuqqPFJkAwRsw6eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXans+HO; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-64d80a47491so1342854a12.1
        for <linux-i2c@vger.kernel.org>; Sat, 03 Jan 2026 03:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767441413; x=1768046213; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmnAKAfv29ulmMb0BC0UKs0MVt+IkK2zMRYsdR6rhaE=;
        b=VXans+HODO3A0hzkgzV/H2RZ1jm6MPx45vymaa+R869XKL+WKqSSIdzFamYInDxS7x
         2tVQbllbLd5VPDgmHfi2nMvllrIO/v5k8g6qtpl1qg7OUY08wUFfkz+03DI15wc1zCr1
         HzbXXXdhFyrcRCI1zpRzt38wwkQuVcmxDrdRkv2tU72ETRjTC1VK2/4F69S+w1l/2wta
         IU9smS5fqF9A+KGEGQluJ+804mZSAXGezEEKedr4fVMD8voCkn+8RB7weDQvt4L54/GD
         IyinsIDSTjgXmB9JnquaHEoTE2YV/HnySzaerIZNiVdCODd/kyJqNVxhIvyyqZ8MEQxZ
         js9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767441413; x=1768046213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gmnAKAfv29ulmMb0BC0UKs0MVt+IkK2zMRYsdR6rhaE=;
        b=IbNlJdoTOoSAJe3hC8gh1QF+JCCsdksZp0tLP2zMMm5k5zP2/4/fITIsGav/MZMdfa
         1T82a/tqeqGJFX1D08LegR7oFX5GcKXx1xOu35f+bnXR3HLGV+ZBjPkBNoM/fIyUhhTZ
         Y6FeXwbei2qumGL4bFfGD9uSlu7RaOBWw3Y2V0MOGjt/SgyqSIvuKs9lq9vENyaLAJx2
         Thhjtjui2Zm+o+bstkGlbcr71/3B8pQTPGBvGN5jBFeAB7RcvfLDBmZfeSgog1l6RBa4
         a6BhM9vClEhzMsteF6YvVjJFvY86pYf1nACq/StCmS9PkMhYSvBFFB/o8ifZ/ULwychN
         IZLA==
X-Forwarded-Encrypted: i=1; AJvYcCXxlaBXX7CrhCdOCeFANDDH+xDsP08WJ2c1a06wKfwKUd4K/v62H1Yo3qIHE/QCchqTX0bxl/Me7No=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfJ9WPcS3tLhhZEd2soRaADxie1ozv1WQ2c+K9GocsuQcCK+DY
	CKlbEOgjKAFPDCvmfMKsOXZ3ZCZVcdenSPPztw+29sL0Dd7ZAEKi+XUQSybgJ6UW/EUsGZrZy8p
	hy95SDBW25DGaLzcF7Mc1yqsc3Wr2+bM=
X-Gm-Gg: AY/fxX4KOGQ8Z3z3PsPpj5mtiyRUpKOG+akDR412G3VtLkVA1GIOuDIwFzo1ls0sLrI
	KjZ4IVen2lZ3hpqPIZKFHvKD+hYC39pkoNoaXhDJtpDLKDtv61XZIU2//wbhJl7sS2w99lfPA4u
	RjOe0AF9bPfgVknrBxyWmA9Lq1Pw2AVQnLLLt/D7qhSby9YoS+vwOAGmlGuvR0dlUYgUiDfpkPd
	V/IIiQ31Bqnh4gr9Pow7lBGaXZXBQaooRCzc5m+50Kl0BUHfhA7TlOl4vQARMzZ8uQ=
X-Google-Smtp-Source: AGHT+IF2b3MvhL62iZeikJ+ttx+pza0Q8AuLmmDSQvLMMwKTmV2H/BFIvhu8dzQh+T0cfdAPWyIo8+97JC3VbvgZOtQ=
X-Received: by 2002:a05:6402:2750:b0:64d:4149:4924 with SMTP id
 4fb4d7f45d1cf-64fd4929c52mr2235323a12.4.1767441412727; Sat, 03 Jan 2026
 03:56:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260103052506.6743-1-linux.amoon@gmail.com> <1802774.yIU609i1g2@diego>
In-Reply-To: <1802774.yIU609i1g2@diego>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 3 Jan 2026 17:26:37 +0530
X-Gm-Features: AQt7F2ro1kfUI7JqsGT_zw2XVqyjk2_hY7-ZX3rtcNoyAWEVImrlYTmVULYv9uo
Message-ID: <CANAwSgR5RxmeUA-XdTCD5tr9SjPt4EqdH0W305tzsgh+73F7bw@mail.gmail.com>
Subject: Re: [PATCH v1] i2c: rk3x: Add support for SCL output enable debounce
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Andi Shyti <andi.shyti@kernel.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	David Wu <david.wu@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heiko,

Thanks for your review comment.

On Sat, 3 Jan 2026 at 16:09, Heiko St=C3=BCbner <heiko@sntech.de> wrote:
>
> Am Samstag, 3. Januar 2026, 06:25:04 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Anand Moon:
> > From: David Wu <david.wu@rock-chips.com>
> >
> > As per the RK3399 and RK3588 datasheets Rockchip I2C controllers featur=
e
> > a SCL_OE_DB register (0x24). This register is used to configure the
> > debounce time for the SCL output enable signal, which helps prevent
> > glitches and ensures timing compliance during bus handover or slave clo=
ck
> > stretching.
> >
> > Introduce a 'has_scl_oe_debounce' flag to rk3x_i2c_soc_data to
> > distinguish between hardware versions. For supported SoCs, calculate
> > the debounce counter dynamically based on the current clock rate
> > and program it during divider adaptation.
> >
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > Signed-off-by: David Wu <david.wu@rock-chips.com>
>
> Signed-off-by lines are in the wrong order.
>
> Original author first, then yours as you're the one handling
> the patch last.
>
Ok, I will fix this in the next version, with a new feedback,
>
> Also, does this fix a problem for you, or is this more a case of
> "this looks useful"?
>
Actually, I am investigating a boot reset issue on the Radxa Rock 5B,
Specifically related to the fusb302 Type-C driver. So I was looking for
type-c fusb302 module to communicate with the I2C protocol.
I submitted small changes for this, waiting for feedback

> Thanks
> Heiko

Thanks
-Anand

