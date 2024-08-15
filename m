Return-Path: <linux-i2c+bounces-5429-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FA7953623
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 16:47:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B2C31F21777
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 14:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D46B91AC43B;
	Thu, 15 Aug 2024 14:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ioa417Ws"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899121714A5;
	Thu, 15 Aug 2024 14:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723733213; cv=none; b=ud3QCGKG1JjCULPQKNDEgUb+eow59wZ5sR0tU+epgb247kOjfnH+YeDkMBCmRnXYnx5CRPqHYMwtMjIAq4lRbzuFL89lfJSeanaQwwFWkKXVvCSHRnMKheckffldwd8ezdsD5ApBD2Ouaan6rnQp5/Qtnh2gj8HVqx0hSCLJvIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723733213; c=relaxed/simple;
	bh=LXg2YKKYe4ZHeUhto+8rttrwbZ/5Uqwzbnc9OdSipXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rq9nnQI0wc1+ghLff1bNIi3nhVvhFGbV7RB7vJJtqQUxwo29i1xJSCRMC9JeYOg8BKV4XF4QWn7nV/LzLoPK94CBH/wXcfS4jUichackCieuyMU8rMik7jTCTJNMDspYhAUMUZ5H0/NVZ9EchB6dPA7rc7+0BvKbeimEZ50OaUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ioa417Ws; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 679ABC32786;
	Thu, 15 Aug 2024 14:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723733213;
	bh=LXg2YKKYe4ZHeUhto+8rttrwbZ/5Uqwzbnc9OdSipXA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ioa417WsQOfqzQ7ze8+q8mUQlvNMJmsxqZoyhhR45pYR9PB3EqoQHhu1JMOYXR7Y8
	 y6RlGblWWYQw3oQRuyFZord53ilwuXsSWvIsDS/lFVkzV9OtjOe+Fi4AUc7Vsy+Bmw
	 F2k450xNdnIU0xedbpq5LRtnboOS7At38wEZmAey5eUOs+cN0eTJV+4I4xiUqBmuk/
	 NZi/9rEXXzqHTf3nIDoSIB2ak3vN01LitdvFu/mNPfrt5T1yZQ8q/26nnaS6rCq9ms
	 OEYc6oRubrMUm5yibaM/0N+9GGGnBikFoNkFI+mxdtg+IR+ts3+yqmO7VufJEJ2s57
	 aSaNXZy16aZEw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52f01afa11cso1243873e87.0;
        Thu, 15 Aug 2024 07:46:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHepuvXrL8NJyluHwF8AMfm81rkAqoZtehm2svb3aimEKtZbBGwEv3OQwQoVFRHWN41ZINN9WZFd/j@vger.kernel.org, AJvYcCXttqx6Hls+Y8DT2mXDpSBb5cy7iB74R7IdpcU8AdZdaY11XD8yDmhqBiILM20ch9UkR6F7cm/N15llCc3hu/g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj+RWmjPz+QO16xVwdLS7JimiVrRq28hT6oqMMx87j86gE8X+U
	Dd1KXEJL5NWkFr/8IIHQXfQMHBBWIMCCwxdZXdnUKOEwBJS381PpQIz7S2mTmptHT3pbm3/zfTc
	CPiPH7xKN5fLe7VgVkycKZvgdGg==
X-Google-Smtp-Source: AGHT+IGHdz6/Pimw8uzLCB1lhJ+53+05RgSheafx7bjMaD7PkIr2T0iiwcbsOfir91LpaFaf5Y6+XfOkOgfyoymAx/4=
X-Received: by 2002:a05:6512:3a88:b0:52e:bf53:1c2b with SMTP id
 2adb3069b0e04-532eda64678mr4145730e87.12.1723733211720; Thu, 15 Aug 2024
 07:46:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815120935.5871-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240815120935.5871-1-wsa+renesas@sang-engineering.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 15 Aug 2024 08:46:39 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKJRhq9UzsjqbOAam0GSkm4R7m82FZ0zzYFp-mY2HS+Yw@mail.gmail.com>
Message-ID: <CAL_JsqKJRhq9UzsjqbOAam0GSkm4R7m82FZ0zzYFp-mY2HS+Yw@mail.gmail.com>
Subject: Re: [PATCH dt-schema 0/3] schemas: i2c: fix "smbus_alert" handling
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree-spec@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 6:09=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> "smbus_alert" is currently listed as an interrupt for targets. This is
> wrong, it is an interrupt for the controller. The mistake (mea culpa!)
> was already in the originating "i2c.txt" file in the Linux Kernel. Time
> to fix it. Make small changes to descriptions to use inclusive language
> while we are here.
>
> Sadly, not tested with 'dt-doc-validate'. I tried to install my local
> dtschema repo with
>
>  $ ~/.venv/bin/pip3 install -e .
>
> and got:
>
>  error: Multiple top-level packages discovered in a flat-layout: ['patche=
s', 'dtschema'].

Do you have a 'patches' directory? Not sure why that's a problem other
than python having specific ideas on directory structures.

Rob

