Return-Path: <linux-i2c+bounces-7408-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E798599F4CC
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 20:06:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA58C284EF1
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 18:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B471B1B21BA;
	Tue, 15 Oct 2024 18:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lTleCaPP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D0B28691
	for <linux-i2c@vger.kernel.org>; Tue, 15 Oct 2024 18:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729015559; cv=none; b=Gw/YTw2qPXLvOJWMIfWEmWJSlsBHXwzZAqGrRibRO2iUuXJrdXtFR2JMZ/CVviNp7+KXJxiq69jkn3I05PMbKY/c91FYFXmJ9cP9Asa/EaKEYiAKiY8lgDkncI071T2GPMUXIN2r8ncuhe8DVLkfOpXsdRP8Jo9+ya5RSzMRtic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729015559; c=relaxed/simple;
	bh=8xSHcy2PuAPSvZBu9Eml4zzV7wYxfR0IjepjU1wiaRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t/KOMFKByJyrX6spQMkIA9wWTmFQCoxJOjtEzu9CKTcu/Uuh4maQNxw1p+WLccHFS72SKeaOmVkGVv6Tpqg35pgNyVNCtvUkOhBe5nGEf8gFbWLbp0hybTXE4Nasxzi/AYZwGjKtXCpDxfpc/dDmxpvUpsdalrGfwBJ3/e49VUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lTleCaPP; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539f1292a9bso3304308e87.2
        for <linux-i2c@vger.kernel.org>; Tue, 15 Oct 2024 11:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729015556; x=1729620356; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQgdud0CKtJUsCxMGehxz9oQ+EPp7xHVsXi0/0jf+Z0=;
        b=lTleCaPPX1XNfdhl0k9EH6KJ0/5nvj8ftfjfW4D7Jpyc2WgqRf3NgBE6pMPyed2bYE
         sVNgECbbd/vVd5aSwyzInZB/Qqz/tn4HywVdYdMq8HOUrzDCDskOX6TuKa9eufr9M+51
         2yUJX4P3+2XGfFStCGsS9oZj0XryghTDcQ7vo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729015556; x=1729620356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FQgdud0CKtJUsCxMGehxz9oQ+EPp7xHVsXi0/0jf+Z0=;
        b=nQWo1x76/UQ4icRIruWdJ26vk0SLXdXAwWgYUPOyPrdfCmfl9ipFnOfYybxxU1hm0x
         gUTDlqftgPc5CJRW9Hl6ormXsilhrvONvs/ltCumj77PvUohYQpWrnSXy4rH5uk94NR3
         QpWlxBtbl6focbbMGp7tTeaog9VA4MjC+u+/MVlFPH/eVkQFURiNN7WFfQNYZVOX4VFY
         y/V83eZERTvmU6whGoN64OtcaXt3cVCDYQV2Hi64SM1lyH9PBKy79/xUx+L/+uZaZsU5
         qN5kHSbfqZL/XMINodrmQuhBZcWjZ9tKcsy/iRsp/LHpRPvO8E/ebjOvIF5KsCJv14mR
         8D/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUmpD+o2pZKNLb/foG3Vi9Wm8R+DOslDGfbqWvtU4CJJuYtT29C413UG1luDFHgAfdwuyQ65TDL2OE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0CHonjuAwKQ6cEXmYGdAdtslbsbHpea31UzefraFq+lrfWv+D
	nXLRnV8LsRf/OUXHT50GUsghqQsLS0+YC+y3sNFC4ICz9Nb9H3QDBVm1cnWLwRNLBYEHzz3rBtF
	9NpTT
X-Google-Smtp-Source: AGHT+IFloEPGlma3RuxX0rbLhUMzVxeL2SGUE8HnQt4CBTNWjDnXNGT4H5jcIhrTrrnA0+nCKswk0w==
X-Received: by 2002:a05:6512:3351:b0:53a:42d:fee6 with SMTP id 2adb3069b0e04-53a042e00abmr662430e87.11.1729015555607;
        Tue, 15 Oct 2024 11:05:55 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a29894cabsm96559966b.216.2024.10.15.11.05.55
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 11:05:55 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d4b0943c7so3756666f8f.1
        for <linux-i2c@vger.kernel.org>; Tue, 15 Oct 2024 11:05:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXL8+JVWj5S7Eb3/4Jq1q8rvEJkN8RDCGj8/pemHFOiCZyRQNO0Lzm+m9tA5NLISnWUCMkPDKs94Cw=@vger.kernel.org
X-Received: by 2002:a05:6512:1091:b0:539:f13c:e5ce with SMTP id
 2adb3069b0e04-53a03f77ea6mr882102e87.46.1729015152112; Tue, 15 Oct 2024
 10:59:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-7-wenst@chromium.org>
In-Reply-To: <20241008073430.3992087-7-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 15 Oct 2024 10:58:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X+_iYi0_RSakh6bzVYuNpiqUvjHTrL81n8h4dO+WZf9g@mail.gmail.com>
Message-ID: <CAD=FV=X+_iYi0_RSakh6bzVYuNpiqUvjHTrL81n8h4dO+WZf9g@mail.gmail.com>
Subject: Re: [PATCH v8 6/8] i2c: of-prober: Add GPIO support to simple helpers
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 8, 2024 at 12:35=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> +static void i2c_of_probe_simple_disable_gpio(struct device *dev, struct =
i2c_of_probe_simple_ctx *ctx)
> +{
> +       if (!ctx->gpiod)
> +               return;
> +
> +       /* Ignore error if GPIO is not in output direction */
> +       gpiod_set_value(ctx->gpiod, !ctx->opts->gpio_assert_to_enable);

I'm not sure I understand the comment. Does disable() ever get called
when set() wasn't called beforehand? How could it not be in output
direction?


>  void i2c_of_probe_simple_cleanup(struct device *dev, void *data)
>  {
>         struct i2c_of_probe_simple_ctx *ctx =3D data;
>
> +       /* GPIO operations here are no-ops if a component was found and e=
nabled. */

Instead of the above, maybe:

GPIO operations here are no-ops if i2c_of_probe_simple_cleanup_early()
was called.


Just commenting nits, so:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

