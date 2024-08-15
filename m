Return-Path: <linux-i2c+bounces-5436-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1453D953B87
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 22:37:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2FA62873FF
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 20:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0CE149E04;
	Thu, 15 Aug 2024 20:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JS2lryZU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D021448C3;
	Thu, 15 Aug 2024 20:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754221; cv=none; b=oPvFQVFOwP1fruCSpIbIoWPT8Szx7iOZ1TwNvUYHCSEzWXl3WDeB6I9FkvqjBOQJkLbSu3sngW0dK5oB2TzSadVqi6McKZCDyGA6+coJIhVKs039KQ6Ci8kaTIhOJxYaB7yoggulsZJL3ziUhJX3W/+2fU4nGf1DN4QmyXKHcyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754221; c=relaxed/simple;
	bh=J9J7t/t9xTCyh2sPhdf798PkaKOnhKQUZCG8mzy8+KU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=WU7dbLruB/SCAbvNHbZLenmtvUg3OyLUVQgjhcjyFJqMNsizq6cEkcmx2Xj++BQgYEiz66Id4qrYApiWoiIHOOhmTtnx2aglWYCGsH4n+EruS055yiw8RufJj2zNB96KTeymRdY0Y2mZf4Y9g3gBcok4izx60xoSonTDX7MPJBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JS2lryZU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 520F5C4AF09;
	Thu, 15 Aug 2024 20:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723754221;
	bh=J9J7t/t9xTCyh2sPhdf798PkaKOnhKQUZCG8mzy8+KU=;
	h=References:In-Reply-To:From:Date:Subject:To:From;
	b=JS2lryZU67U9xufssl7+d25Yb5LIcMpioiuDQFl89K5JTtHUt9dD9wtrc6vphITif
	 n33gqJoO9Vc8+kwcuWHqkRJdoE8UTmTFkwpt67Iv/OZsOuzo+8U66/EzAtcVpgnEc0
	 MhqpGDfdbacUN+0Xss552/RNdLlIHiK3ZrvsufeMeal0cUTkySfgFEM88IKOQNu6bN
	 C5yspqeXJvlSJO4A6Th6fpaV3+na/f73TC2ljlZjvxCpy2NFgeF7clk7+3sx+THvcL
	 dMioDH2qSLuKrKLxxtbI/0MQA4gbeS8jCReAkWc4QfEKhvg/0uoHPlkqb4ff4qhw0f
	 qx0cFEs1d0nyw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52efbb55d24so2400243e87.1;
        Thu, 15 Aug 2024 13:37:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXWJvruHNbxjgRvG93HB6RZHDYN6buVaotgeZ9+cXZxhzjztdExu6dBl79KNMb6heuErsKsJepRdd9nvnhISOuKexFbP4LwSgJDM1SmFRU0Hb/SW7A+jUnonFraWkS7rO8lq6oxj5TvtWqROrgfPnmr4n7fSCialO9tX+eZESlAwZ6K11a351Tjzw6W7vY=
X-Gm-Message-State: AOJu0YwLSgkg/ZUJisc804dlRji37ZEHeSkGVYXffg1N0CqKTzMjRf5I
	cKhDnrq9mKeqYxaUP5BXccxic4Gn6Uu9zfg1bbIHZcH6FA4Iefu8j4hdaOfOxuvfBuDtBp3KaS4
	AaeYniAjqJTmjGMnzVRc+duLUKw==
X-Google-Smtp-Source: AGHT+IF6ug9EjQ7lgvnADFFXEH8FmirmJFE6J25kcEYLm4VnJDqP4JyZ0qa2OOYT446ibd/btb9KFOlsBaAUkMNiA78=
X-Received: by 2002:a05:6512:2346:b0:530:ad8d:dcdb with SMTP id
 2adb3069b0e04-5331c6a1931mr509570e87.19.1723754219562; Thu, 15 Aug 2024
 13:36:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815120935.5871-1-wsa+renesas@sang-engineering.com>
 <CAL_JsqKJRhq9UzsjqbOAam0GSkm4R7m82FZ0zzYFp-mY2HS+Yw@mail.gmail.com> <Zr5KnHR-Qjukqt8K@shikoro>
In-Reply-To: <Zr5KnHR-Qjukqt8K@shikoro>
From: Rob Herring <robh@kernel.org>
Date: Thu, 15 Aug 2024 14:36:47 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+n96kzS9gpNb23d698pi0M1unfOpi1YvSGzDB+7VrENw@mail.gmail.com>
Message-ID: <CAL_Jsq+n96kzS9gpNb23d698pi0M1unfOpi1YvSGzDB+7VrENw@mail.gmail.com>
Subject: Re: [PATCH dt-schema 0/3] schemas: i2c: fix "smbus_alert" handling
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Rob Herring <robh@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree-spec@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 12:36=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > >  error: Multiple top-level packages discovered in a flat-layout: ['pa=
tches', 'dtschema'].
> >
> > Do you have a 'patches' directory? Not sure why that's a problem other
> > than python having specific ideas on directory structures.
>
> Oh, wow, yes, I had a 'patches' dir and that was really an issue. Weird.
> Thanks for helping out. I got one step further, now I get:
>
>   =C3=97 Building wheel for pylibfdt (pyproject.toml) did not run success=
fully.
>   =E2=94=82 exit code: 1
>   =E2=95=B0=E2=94=80> [14 lines of output]
>       WARNING setuptools_scm.pyproject_reading toml section missing 'pypr=
oject.toml does not contain a tool.setuptools_scm section'
>       Traceback (most recent call last):
>         File "/tmp/pip-build-env-5v1x378l/normal/lib/python3.11/site-pack=
ages/setuptools_scm/_integration/pyproject_reading.py", line 36, in read_py=
project
>           section =3D defn.get("tool", {})[tool_name]
>                     ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^
>       KeyError: 'setuptools_scm'
>       running bdist_wheel
>       running build
>       running build_py
>       running build_ext
>       building '_libfdt' extension
>       swigging libfdt/libfdt.i to libfdt/libfdt_wrap.c
>       swig -python -Ilibfdt -o libfdt/libfdt_wrap.c libfdt/libfdt.i
>       error: command 'swig' failed: No such file or directory

You have to install 'swig' which is a C to python binding thing
pylibfdt uses. You should have a distro package for it. There's also a
pip package 'swig' that will download and build it. There's actually a
MR to make that a dependency I need to go look at.

Rob

