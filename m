Return-Path: <linux-i2c+bounces-4614-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD1F92697B
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2024 22:21:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 255D12893CE
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2024 20:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4544018FDAF;
	Wed,  3 Jul 2024 20:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sk3J19kL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9A4185095;
	Wed,  3 Jul 2024 20:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720038079; cv=none; b=mmT5c3l9oVCDVv6I/Tqxvnt9zEfELJzkL7SIC3h5KIxFhiQ7r0oCqSzSKcQpRXimFE+mT0ua4yryc4WO9wkNHdCuspk//zhwcuPt3z3c+3hR1SwglhTbLZmyRP6Q8tmQcKfnyAVmQ9Djom0dNgRpc8D6dpl5TLmQUOZmo8PIWMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720038079; c=relaxed/simple;
	bh=rPvIWW2IUaIr2Cw4CK82UCHdJ+i1JMw6S82PykL7SKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CCT/cBt1U4So/EJh42o7zjEfk9zP/MJf7ills+3HRacJfSZ1YLOvgrYMp739ZQAm2wb21f1gl4Hn2E6qtpTX7iY2kI0IgEqt5XCcbeK9M8mLIQHZlP64eh+SBFmKywWujgsIUpxaPRGd5/+qKDtWNPtNMBnrXYrMtFLVx65GXR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sk3J19kL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75E06C4AF0A;
	Wed,  3 Jul 2024 20:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720038078;
	bh=rPvIWW2IUaIr2Cw4CK82UCHdJ+i1JMw6S82PykL7SKg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sk3J19kLZOWas8QOHSZltgbRvBLXaonPTXwU1DEW39b1yG0gY34KfKMbtMI3bHEU1
	 yeDKp6QnUxPm3/Z9GWCo7kB4Ri/cTf3ZhDN4eiV4giODeRAp/WrziyOI/mWGY5WEUH
	 QPjPFjd9PBsruzq9WOnYZhAcj7D3yCuS8PMYP3+ImqxuFGFW+36Kx2K7/KLav44qGO
	 CXnQH/lPtIwJa6I/5yccS8fWOgCtWTs1JAQx0zta7B/V8BeBAFKpl3gTLTjkaJkUT+
	 2GyaYA2LOPbL/ggBA3dEyBsFePpVS89NsBo3P6q3vgvCssmhucVEaxI3esqUJh9Oxd
	 xSy/8kohjfzJw==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52e764bb3fbso7754719e87.3;
        Wed, 03 Jul 2024 13:21:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXUKo5xSAu/tkT4Yx5S+tBlEE6b+5vreVeSxcFDPSL8sCuGbStRQS4AYGsyH9S5L+5XlquOKBuIfWyBmAF6oytEemNtP5yu32XNry93swzxOr44mS7B8WoIUVYKIu6QMvHrV2nAetqzDCsPfgTbdoLmDqn6frh4NgquA6Cyf/h8d+c4PgWqBJMOO96vVTqJUaUXxTYxvtsaP9o/VqGNkYtoywtnX+E22M4u2GkK63NEvbB+/a2kNjSFnuvvvUgDyTxkobsZFgjfTEmD1/Ew+rbefH2LTVW2
X-Gm-Message-State: AOJu0Yy3ATx1at4QujPJmsFbVBsO1Jf3oIMZTDJfBbOWcZSgyRm2CAgD
	agkFdkQFxkPepklK4q3lBXBCBGy/u0fwOrmiNHIhWnePNUflNokNtPpzSFsAWGGDwm29flbWl0g
	Mf6j1g0mZ/MksRe8w2Ok/tYUObQ==
X-Google-Smtp-Source: AGHT+IHkJyLufysSPAp6OLlmdgVCxJhhtA7jCjroJG4RfWGCFjmvlqKevKnTA5kF72TY71LMsM29/tv7IaZgzL2wT8U=
X-Received: by 2002:a05:6512:33d1:b0:52c:e3af:7c5c with SMTP id
 2adb3069b0e04-52e82686b63mr8472949e87.34.1720038076812; Wed, 03 Jul 2024
 13:21:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240701151231.29425-1-kyarlagadda@nvidia.com>
 <20240701151231.29425-5-kyarlagadda@nvidia.com> <20240701174227.GA148633-robh@kernel.org>
 <hqlckp6hxvxwkkbiagdb5pm4eo5efu55hwuupdal6lojxj2xu5@5zibskqdbdju>
In-Reply-To: <hqlckp6hxvxwkkbiagdb5pm4eo5efu55hwuupdal6lojxj2xu5@5zibskqdbdju>
From: Rob Herring <robh@kernel.org>
Date: Wed, 3 Jul 2024 14:21:04 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+hzbHKeKM9UnJ=VK8_rKs5HJpZRGH2YYWAvjtf9SbPRw@mail.gmail.com>
Message-ID: <CAL_Jsq+hzbHKeKM9UnJ=VK8_rKs5HJpZRGH2YYWAvjtf9SbPRw@mail.gmail.com>
Subject: Re: [RFC PATCH V2 04/12] dt-bindings: misc: tegra-i2c: config settings
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Krishna Yarlagadda <kyarlagadda@nvidia.com>, linux-tegra@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jonathanh@nvidia.com, krzk+dt@kernel.org, 
	conor+dt@kernel.org, corbet@lwn.net, andi.shyti@kernel.org, 
	wsa+renesas@sang-engineering.com, ulf.hansson@linaro.org, 
	adrian.hunter@intel.com, digetx@gmail.com, ldewangan@nvidia.com, 
	mkumard@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 2, 2024 at 4:29=E2=80=AFAM Thierry Reding <thierry.reding@gmail=
.com> wrote:
>
> On Mon, Jul 01, 2024 at 11:42:27AM GMT, Rob Herring wrote:
> > On Mon, Jul 01, 2024 at 08:42:22PM +0530, Krishna Yarlagadda wrote:
> > > I2C interface timing registers are configured using config setting
> > > framework. List available field properties for Tegra I2C controllers.
> >
> > How is I2C bus timing parameters specific to NVIDIA? Just because you
> > have more controls? No. That's no reason to invent a whole new way to
> > specify parameters. Extend what's already there and make it work for
> > anyone.
>
> This may be applicable to a subset of this, and yes, maybe we can find
> generalizations for some of these parameters.
>
> However, we're also looking for feedback specifically on these config
> nodes that go beyond individual timing parameters. For example in the
> case of I2C, how should parameters for different operating modes be
> described?

Like what? It all looks like timing to me.

> Would you agree with something along the lines provided in this series?

When there are multiple users/vendors of it, maybe.

In general, it goes against the DT design of properties for foo go in
foo's node. This looks more like how ACPI does things where it's add
another table for this new thing we need.

Rob

