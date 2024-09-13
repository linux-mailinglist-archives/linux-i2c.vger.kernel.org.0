Return-Path: <linux-i2c+bounces-6741-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3219E978BFB
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Sep 2024 01:49:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 566531C24A94
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 23:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3017193060;
	Fri, 13 Sep 2024 23:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OHLOv1Lj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF59191F8F
	for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2024 23:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726271379; cv=none; b=rxzXJkft8z8MYj2h6u7Wov2jk9csXERvNY5VgeBCoq9xjPJruj43qLz3QPtCLhz7azEYs/QRHjrMudlDztNgnKuEBJ+1tkJiDRyk+ZQ95bUjtKyxsVvbnQV7d7DjA2ulj+iW7lJQ3GqrGbnKOH2chNsWwH31VRMUCYlsOl22sZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726271379; c=relaxed/simple;
	bh=HPCIWNWpBdtqLYZEm2Q7Mjcha/BIoksmpFmSMnXlxFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hUHmVzvRAaL/Z7+YzBv2+GLewSBIw5pm3Xlw26sV7VqnBwDYubwUIGdbYCkMyWWFTf9APWo/x/qeuJFLMszVkDISwP+JZPujSyHCXwlCGhabOpqDBTv32N9s3DLvEF9fcb8NiA/c5YemRX6px//y/SMWE5OKkmaiVBheFlQEXNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OHLOv1Lj; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2d8b679d7f2so2246340a91.1
        for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2024 16:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726271377; x=1726876177; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QgrnQAkPxnP9xr/uHfnesOWhy4bQylWu/nCRFkQoiTg=;
        b=OHLOv1LjWFknDDgGJmX9gZ+0DBRGjeBGcWFheaDqZFb6tsw3xponSgsc6r/zBGxa2s
         UHnRBMSlZ06On07mW/Dxk/5LbDVkOsKaQXgy6QRKivjgFnQpAQTIQvMUMj/DBs3t3LJg
         U9tEDIVHWZnX4FbIM5tDu0i43Qz7X4TlLnFng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726271377; x=1726876177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QgrnQAkPxnP9xr/uHfnesOWhy4bQylWu/nCRFkQoiTg=;
        b=a0D/iMVY+Z+x0UM6OqEpoWIwck2cxAuWS73MJChKgcaMb6RCEGhUWm/QWFA9EunsCT
         DqIZVg4HSoOXNKa8cz9+zTExjfaGjwMTK4Pm43hpe/O2PpyDs72bZwQlsI+mJS5fwltS
         2ECRYQmLkLD4nZXzOJQ85M1AjgqfYX2dXdKBLbYvo0yflwXHDXTB1vAoOZ6+NjWrayqD
         JA5Ifvk39fWJW2O7rnmaLH3QonbbE0PGq/1pNk3719JB7u54Ojus/s+kb/KYBbp7spQ2
         QVrS2fcPj7G090YnM7CBfRDa3sK3sIOYoRY9F6RlBid9Sv4sAq7i6DY5gHg7/o6nCYwY
         Cg2A==
X-Forwarded-Encrypted: i=1; AJvYcCUN161FPHOrrqVjYYZBVrrXwziNwlbL9MYPvPF/xpEY79nsgjAP6xSaVPdhhSN5ynKmmZCCzicD310=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiPPOgzLTD9Gi4ueXqaK+Omq8frZTkNwvZvVoBeIqytqCyvCE5
	EcwEg50twFOpC5Vp1z68AJo/MK1PPxJwBJc2shRDtBofSTa01g2cBcL0NySl1pnugTRjPBaovWk
	=
X-Google-Smtp-Source: AGHT+IFRKApxu3bWZaPqxp+WNcN40e0BoDsG9va8+J9T+ZnqxqgQVE8OmCPB+owSoSUA3sHnHW7cyA==
X-Received: by 2002:a17:90b:3904:b0:2d8:f0e2:96bc with SMTP id 98e67ed59e1d1-2db9ff73f88mr11259530a91.4.1726271377052;
        Fri, 13 Sep 2024 16:49:37 -0700 (PDT)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com. [209.85.210.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dbcfdbd8a9sm238335a91.52.2024.09.13.16.49.36
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Sep 2024 16:49:36 -0700 (PDT)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7191fb54147so1928315b3a.2
        for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2024 16:49:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWCOIp0X4n9NqLVzXqzvti6mzcAryWW02dj2BZvCzOCPuz6oXqxKc7cVkzrAidnjGxgMQFv4ZgLHug=@vger.kernel.org
X-Received: by 2002:a05:6214:5f07:b0:6c5:de4:3edb with SMTP id
 6a1803df08f44-6c5735881a8mr122878276d6.29.1726271012120; Fri, 13 Sep 2024
 16:43:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240911072751.365361-1-wenst@chromium.org> <20240911072751.365361-10-wenst@chromium.org>
In-Reply-To: <20240911072751.365361-10-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Sep 2024 16:43:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WtVSQ5GX6H5CtxNPTdOAJVMj_xNRvG9siZB6_ePZr7CQ@mail.gmail.com>
Message-ID: <CAD=FV=WtVSQ5GX6H5CtxNPTdOAJVMj_xNRvG9siZB6_ePZr7CQ@mail.gmail.com>
Subject: Re: [PATCH v7 09/10] platform/chrome: Introduce device tree hardware prober
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

On Wed, Sep 11, 2024 at 12:29=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> @@ -8,6 +8,7 @@ obj-$(CONFIG_CHROMEOS_ACPI)             +=3D chromeos_acp=
i.o
>  obj-$(CONFIG_CHROMEOS_LAPTOP)          +=3D chromeos_laptop.o
>  obj-$(CONFIG_CHROMEOS_PRIVACY_SCREEN)  +=3D chromeos_privacy_screen.o
>  obj-$(CONFIG_CHROMEOS_PSTORE)          +=3D chromeos_pstore.o
> +obj-$(CONFIG_CHROMEOS_OF_HW_PROBER)    +=3D chromeos_of_hw_prober.o

"o" sorts before "p" so "of" should sort before "privacy"?

I guess it's not exactly all sorted, but this small section is. Since
it's arbitrary you could preserve the existing sorting. :-P


> +static const struct hw_prober_entry hw_prober_platforms[] =3D {
> +       { .compatible =3D "google,hana", .prober =3D chromeos_i2c_compone=
nt_prober, .data =3D &chromeos_i2c_probe_dumb_touchscreen },
> +       { .compatible =3D "google,hana", .prober =3D chromeos_i2c_compone=
nt_prober, .data =3D &chromeos_i2c_probe_dumb_trackpad },

The fact that the example is only using "dumb" probers doesn't make it
quite as a compelling proof that the code will scale up. Any chance
you could add something that requires a bit more oomph? ;-)


> +static int chromeos_of_hw_prober_driver_init(void)
> +{
> +       size_t i;
> +       int ret;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(hw_prober_platforms); i++)
> +               if (of_machine_is_compatible(hw_prober_platforms[i].compa=
tible))
> +                       break;
> +       if (i =3D=3D ARRAY_SIZE(hw_prober_platforms))
> +               return -ENODEV;
> +
> +       ret =3D platform_driver_register(&chromeos_of_hw_prober_driver);
> +       if (ret)
> +               return ret;
> +
> +       chromeos_of_hw_prober_pdev =3D
> +                       platform_device_register_simple(DRV_NAME, PLATFOR=
M_DEVID_NONE, NULL, 0);
> +       if (IS_ERR(chromeos_of_hw_prober_pdev))
> +               goto err;

FWIW if you didn't want to see your prober called over and over again
if one of the devices deferred you could just register one device per
type, right? Then each device would be able to defer separately. Dunno
if it's worth it but figured I'd mention it...


Also: as a high level comment, this all looks much nicer to me now
that it's parameterized. :-)

