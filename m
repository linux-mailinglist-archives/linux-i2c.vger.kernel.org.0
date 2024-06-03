Return-Path: <linux-i2c+bounces-3751-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF318D7D68
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2024 10:34:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33522B22A6F
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2024 08:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677B85FB9B;
	Mon,  3 Jun 2024 08:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GRmfC4BF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20815A7AA
	for <linux-i2c@vger.kernel.org>; Mon,  3 Jun 2024 08:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717403644; cv=none; b=IQ1vSykKGvso4yjfDMDmzXzJ5NA92nmRHVmY0MV9kLW9NlZkLbU66Q/2FyJCru2ogGkn+3aWBySVLH9YY27Jzd+iCKqMfRpHvZrsko8J1EnSKOeUMDc/Ql/9cwYXkRSrNoVEdrNzIon5nD2ZbS/i3hFlKwhZIvmUOqAKSPBqgTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717403644; c=relaxed/simple;
	bh=Ikj/DBN/g9Zt5L5G7xLVPzrxbxEC+dxcwFUKg868Muk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KxRTMD2Zj6CjW9qDGHi5sA7+BR9ic9ohmRUq261R2v9+CO3EI9UFPxJXrxZae1Tgs8PEXnsezzGqgkVUeDIWAAz4IWTDst1Co3hR+l31hY5Z9htkb1YtSd+hhNKlMzubadZRq8m7+P64ZpjB4+Wr7dD5EPkbScJVE5bX8SBW7r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GRmfC4BF; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2e96f29884dso48135261fa.0
        for <linux-i2c@vger.kernel.org>; Mon, 03 Jun 2024 01:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717403641; x=1718008441; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ikj/DBN/g9Zt5L5G7xLVPzrxbxEC+dxcwFUKg868Muk=;
        b=GRmfC4BFA9yPv9NPmjaK/C9/ocYPvfmpmbB45hSEzr5AGRs7MKe6K3Pjo3ZBJ1687K
         ekxBHa6FlJbTzHEyKZyqbSlq2eKpXlQbUlIkHShatQ7O9KUJHWVhbcnfd1irbrAQmbAs
         aFVdLCWajN533bhkvgyt2AaDjpCzLXF0zX2iEf3mlDb/PHKO3sOd/BkBGV8tmWu4IWQ7
         l9amNU1RqLiycPPsNgoPsMVM9JRdppH1VyJbeRsb4HkzXYzo1OhHv4QayN/4/w4MlrD1
         D6Uy76cocWqlS3NaYSRydnNVNRnFW+x6LUSYhGU7SkFghcOizgN1dfBwjvU3MmsQbt/F
         01dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717403641; x=1718008441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ikj/DBN/g9Zt5L5G7xLVPzrxbxEC+dxcwFUKg868Muk=;
        b=I1ZVLKgUZ5ief+0lv3oX3LYIyufQmQLbVwEcKckSPsXNjZulruCJ4/8axfUA7D/u00
         tmZCiV7KHANmkUNpL3L0T75jdat77OTE+Tkg+cUvBC5GfavtZwN1VlcO9Kito5Ucgb46
         u8xOjAoDFZLdQu7nNqba77KXUfmFoIQq2kgEmCI0mV54Mj89rnEzy4ego41EcYVZ6OHJ
         jf12M9pv9p19e9eRdRkSri26mf5+UhCZf1t8iKvkjJYO+ra65o2T3DKxd1DT5XDAULIG
         71x/WOXe1lArtfNjCK/grrXQqdw3fV9BezcV3rgQYk3qvOezZ0C+9qveEnd+8bZ/FGmI
         lNhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnJH6JZ6rorS8X/UBZVhtQ5ykVLacdXC4u+Ef++YdwnAl8xVctq2NhhKaUM3gKXkWkAgufRpO0j3ug5WMfNXe2TLynyfNZmz3V
X-Gm-Message-State: AOJu0Yx/OZfoLOjTqSW49ZtZhFe0k5Pbi+OtIqFbXYtWkvZWYhfj0e2M
	eduswx8GblnEvg3OOnIjfwm/TGP95vP7UFIang9iohsx2fhZWtf+Fp9g+fcOiHOu8R2TqNHiuqY
	dXglU/R2aqxejy5Xa1XFvirZ57f9AiitKGqpyHQ==
X-Google-Smtp-Source: AGHT+IGnNHHMISpzPygIalsotaJP07IzKe4++9Y4RTlc22DVE2oCaNXkvhBDC8IiyrnfA9GfomhAV8qL4SXbYv7PEQM=
X-Received: by 2002:a2e:9141:0:b0:2e5:1dae:1789 with SMTP id
 38308e7fff4ca-2ea9512f6d0mr59194391fa.22.1717403641151; Mon, 03 Jun 2024
 01:34:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-j7200-pcie-s2r-v6-0-4656ef6e6d66@bootlin.com> <42affba4-4600-4c44-ad88-926597cc2225@bootlin.com>
In-Reply-To: <42affba4-4600-4c44-ad88-926597cc2225@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 3 Jun 2024 10:33:50 +0200
Message-ID: <CAMRc=MftX7Sk5OknNhGrZuT1f+w496+jD3pX4LN014L_ojUtqg@mail.gmail.com>
Subject: Re: [PATCH v6 00/12] Add suspend to ram support for PCIe on J7200
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Tony Lindgren <tony@atomide.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R <vigneshr@ti.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, gregory.clement@bootlin.com, 
	theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com, u-kumar1@ti.com, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 6:55=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> On 5/15/24 12:01, Thomas Richard wrote:
> > This adds suspend to ram support for the PCIe (RC mode) on J7200 platfo=
rm.
> >
>
> Hello,
>
> Gentle ping.
> No merge conflict with 6.10-rc1.
> I know the patch for the gpio-pca953x driver causes a regression for one
> other platform.
> But most of the patches could be applied.
>
> Best Regards,
>
> Thomas
>

If the patches targeting different subsystems don't depend on each
other then you'd have more chance of getting them picked up by
splitting the series up and sending individual bits and pieces to
appropriate maintainers separately.

Bart

