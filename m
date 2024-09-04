Return-Path: <linux-i2c+bounces-6217-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C363996CAA5
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 00:57:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45C6D1F27321
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 22:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AEEC17920E;
	Wed,  4 Sep 2024 22:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aEnPW06e"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7911714D8
	for <linux-i2c@vger.kernel.org>; Wed,  4 Sep 2024 22:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725490659; cv=none; b=AaBqwvck3A3HdMdrp874j3m05oSJnbrZ3zkmVvNkjZiOx+xXGISQjnz7CuL1/cCYBQ/y0wx9qdAWrUggMK1GAFidhs2zW6hg6n5KiPaElJyZuPR4Kf3AsnzEGMITtIwuyfN4C50PT7tUVM1jNaK7aLSgfIjUuisntTa1SAvS5V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725490659; c=relaxed/simple;
	bh=9+gChnP5+JN/xcDHFnljOqSBOGQpXqxh0GSV4CRi4i4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XF4z6D/3ogi8rxwvdiuKU5b7WgQmSAMA4tPQAnYv5lDvijRXylfpRpwhCbWB3g9lek/y4U21SkomSVFAJ9VrakHeep/cJzO8cyoxAaTFbIomOw6b/31qG5xzc81ZKQPuYeyCBBbqi8mXNAOUZklwjJlPQaYjFrYaz0BRgrMKOyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aEnPW06e; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7a80511d206so7682185a.3
        for <linux-i2c@vger.kernel.org>; Wed, 04 Sep 2024 15:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725490655; x=1726095455; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k696Bg6R54WASMTi+pz+LZlGCRBSQtRYcr6+VwRcm/8=;
        b=aEnPW06emms+sZDb7+JXwCEiPms3yPFO8GUw2UUqV9S0Cn9XMVgR7n1Fxp4HtUrsud
         4qSLegdgDm/AEN4i1qJ+XiWJXla7PGyhRdfUhEV1nSoiswVM/z7ohrXy3/Mhwa7OxGqE
         gtVEN53Opuif/hubhs8rehsj0k9r8FmaQPbQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725490655; x=1726095455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k696Bg6R54WASMTi+pz+LZlGCRBSQtRYcr6+VwRcm/8=;
        b=psKTWRz7/QDC7INwXxOaVT74wxUIVTseQv5Zvp45yKrVAHdjCscmFwwYpm3nNCOzi0
         Kf0JjOQhTfe3BXH5JeFY4vcgZR/H0hZwkZiKiJgEeKSsO5ODi5o0nn9OA+flgoe9dPLl
         wRyqY6lRDabfi8noMdkhAGCj+MytEfr7Pzy9sORgbTgcZBYeB3hcVR+Vcd5kZu2uNDIe
         koC317Z/myjW1LJgixTFW99xsMmhxqw7T1TmEnKlCibEQMawkNzjYHMCeb2L2hfXDCDc
         SEBrCpAIAjR41t5PK49iH4eYiGEsRqNetKK2tmojNQPFoFAFLa1W4EnDSdge+agsnx1V
         9sqw==
X-Forwarded-Encrypted: i=1; AJvYcCXrW7j7tMFxQRjTBo4ed36CB6MSI0FSmSj2oLwNu7itTNTgtot/Gq9/SUMiRyasl1ti6XsPDRb5Kaw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCFOq4qRFzKhdzuwYUFvm7Zj/otFlZSFZTpdr6L7BFJyekQIK2
	geo12hX2N4MnYFszf/3IGT9YvhLYTycEqyd7i6XA5CxKTCrkBxeuM3GgkaV1K4J5tNXfa1dPnd8
	=
X-Google-Smtp-Source: AGHT+IFqs/XPXON9RRr/D/faxrUOJ2N5iNgPOY+nxh3JYcc58XAbSAluRxUJBZhuhoZvCRgbSqqREg==
X-Received: by 2002:a05:620a:28d6:b0:79f:16ec:92d with SMTP id af79cd13be357-7a8a3e3c0bamr2096621185a.27.1725490655000;
        Wed, 04 Sep 2024 15:57:35 -0700 (PDT)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com. [209.85.219.53])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a98ef17c1bsm27271485a.26.2024.09.04.15.57.34
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 15:57:34 -0700 (PDT)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6c35427935eso822136d6.3
        for <linux-i2c@vger.kernel.org>; Wed, 04 Sep 2024 15:57:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXtDIYX9VMaTX5setm8NU9DikeceGfA3gnEVPlFAkVkrf+bFD2o3oxtRHyXpXudKtAxK7Yo0znscUk=@vger.kernel.org
X-Received: by 2002:a05:6214:3da0:b0:6b7:b277:dd12 with SMTP id
 6a1803df08f44-6c3558475afmr184722756d6.49.1725490653502; Wed, 04 Sep 2024
 15:57:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904090016.2841572-1-wenst@chromium.org> <20240904090016.2841572-10-wenst@chromium.org>
In-Reply-To: <20240904090016.2841572-10-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 4 Sep 2024 15:57:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UGOz3Xzg7reJKP=tA1LqTxszv5w-CL9krmoXQtXdJLaQ@mail.gmail.com>
Message-ID: <CAD=FV=UGOz3Xzg7reJKP=tA1LqTxszv5w-CL9krmoXQtXdJLaQ@mail.gmail.com>
Subject: Re: [PATCH v6 09/12] i2c: of-prober: Add regulator support
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 4, 2024 at 2:01=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>
> This adds regulator management to the I2C OF component prober.
> Components that the prober intends to probe likely require their
> regulator supplies be enabled, and GPIOs be toggled to enable them or
> bring them out of reset before they will respond to probe attempts.
> GPIOs will be handled in the next patch.
>
> Without specific knowledge of each component's resource names or
> power sequencing requirements, the prober can only enable the
> regulator supplies all at once, and toggle the GPIOs all at once.
> Luckily, reset pins tend to be active low, while enable pins tend to
> be active high, so setting the raw status of all GPIO pins to high
> should work. The wait time before and after resources are enabled
> are collected from existing drivers and device trees.
>
> The prober collects resources from all possible components and enables
> them together, instead of enabling resources and probing each component
> one by one. The latter approach does not provide any boot time benefits
> over simply enabling each component and letting each driver probe
> sequentially.
>
> The prober will also deduplicate the resources, since on a component
> swap out or co-layout design, the resources are always the same.
> While duplicate regulator supplies won't cause much issue, shared
> GPIOs don't work reliably, especially with other drivers. For the
> same reason, the prober will release the GPIOs before the successfully
> probed component is actually enabled.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v5:
> - Split of_regulator_bulk_get_all() return value check and explain
>   "ret =3D=3D 0" case
> - Switched to of_get_next_child_with_prefix_scoped() where applicable
> - Used krealloc_array() instead of directly calculating size
> - copy whole regulator array in one memcpy() call
> - Drop "0" from struct zeroing initializer
> - Split out regulator helper from i2c_of_probe_enable_res() to keep
>   code cleaner when combined with the next patch
> - Added options for customizing power sequencing delay
> - Rename i2c_of_probe_get_regulator() to i2c_of_probe_get_regulators()
> - Add i2c_of_probe_free_regulator() helper
>
> Changes since v4:
> - Split out GPIO handling to separate patch
> - Rewrote using of_regulator_bulk_get_all()
> - Replaced "regulators" with "regulator supplies" in debug messages
>
> Changes since v3:
> - New patch
>
> This change is kept as a separate patch for now since the changes are
> quite numerous.
> ---
>  drivers/i2c/i2c-core-of-prober.c | 154 +++++++++++++++++++++++++++++--
>  include/linux/i2c.h              |  10 +-
>  2 files changed, 155 insertions(+), 9 deletions(-)

I never jumped back into looking at this since you started sending new
versions last month (sorry), but I finally did...

At a high level, I have to say I'm not really a fan of the "reach into
all of the devices, jam their regulators on, force their GPIOs high,
and hope for the best" approach. It just feels like it's going to
break at the first bit of slightly different hardware and cause power
sequence violations left and right. If nothing else, regulators often
need delays between when one regulator is enabled and the next. There
may also be complex relationships between regulators and GPIOs, GPIOs,
GPIOs that need to be low, or even GPIO "toggle sequences" (power on
rail 1, wait 1 ms, assert reset, wait 10 ms, deassert reset, power on
rail 2).

IMO the only way to make this reliable is to have this stuff be much
less automatic and much more driven by the board.

I think that, in general, before the board prober checks i2c address
then the prober should be in charge of setting up pinctrl and turning
on regulators / GPIOs. Given that the same regulator(s) and GPIO(s)
may be specified by different children, the prober will just have to
pick one child to find those resources. It should have enough
board-specific knowledge to make this choice. Then the prober should
turn them on via a board-specific power-on sequence that's known to
work for all the children. Then it should start probing.

I think there can still be plenty of common helper functions that the
board-specific prober can leverage, but overall I'd expect the actual
power-on and power-off code to be board-specific.

If many boards have in common that we need to turn on exactly one
regulator + one GPIO, or just one regulator, or whatever then having a
helper function that handles these cases is fine. ...but it should be
one of many choices that a board proper could use and not the only
one.

-Doug

