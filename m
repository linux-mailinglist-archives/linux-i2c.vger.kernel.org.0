Return-Path: <linux-i2c+bounces-2200-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDAD872639
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Mar 2024 19:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40DC31C26532
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Mar 2024 18:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B009D17C60;
	Tue,  5 Mar 2024 18:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oGYA701B"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67108175A6;
	Tue,  5 Mar 2024 18:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709661980; cv=none; b=mKHTPzPN3SGcdta2BN8GB/DhFYmR7i2STqUmN+e0gOhO92RtPtTejpUU+pLkHULyTO7TTUC+dqB8dAScSMk7WYOYhOys/GWPM2Ba83TpV3IrhIFWqpF1EE7yZVppeAbDDESS9T/roYL2tNTtWCGyDLxoSZbCvzYiST8mcxpEHF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709661980; c=relaxed/simple;
	bh=2SDHv/6MK1rRoV3gdSoYW4yOT+A2jIAcePxtHgcL22I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=BJXob/mSFifG0HIs5vm6XfFdMde0RcXgJVinEX4blQhZq4BaOP4GobTIrT/z+BNv9tBPrbmnu3k5lZ/w3XurL9eerPKg9Vbmesqg5Pa3KgGDUUC30jsgypP2DRHTjpMWjyVYj0WIC1/qghEItS2x9lUEUqI1J934yQHcbr2gkbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oGYA701B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05BE9C433C7;
	Tue,  5 Mar 2024 18:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709661980;
	bh=2SDHv/6MK1rRoV3gdSoYW4yOT+A2jIAcePxtHgcL22I=;
	h=References:In-Reply-To:From:Date:Subject:To:From;
	b=oGYA701BbkeJVy6WDd1Dok6gueir4mrCJgyRmrI5q8V5NAwhAtJ6rKxBonjk+JAi6
	 H6MgFztln7d1jpo1HqW66ZLUjoBqB5MDG47f2qzn446SLBHl+wAstxzhlW1EcUZS1S
	 PCFdx93Qx8R4dEIIMzaycGodcz6ZNcOU2PBVG9kv0Z9o/N7yRwsB9uQIXt4bkE2dGB
	 cS7F0s72tskoUm80++99jaQb2UKaZWzyZt1rS1TxiOtlDCWGLU5xaHBA6dxe+JCg1V
	 H4vgkZWbvPzYahl3s6XeYAHRp6QMEFDw79V5+pUxlZ6O8lqCFmBs1BWoQffk272cHu
	 YD+xyZDltUCwg==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d3ee1c9ea9so15157451fa.3;
        Tue, 05 Mar 2024 10:06:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW8kWlXwWnMyuP/IW70BKK7c2jgMlsPVRgmvwRAXJc7Y89Bhi62wQl90F67Ntf1Kw9zy3Tm2lcb9+LSf14tSPAlS5L9v9KGNAc9zQ7YryQYhRhKBkf2JseowtrqQbQJy17Desn9oHzfjMcLQvfXxECjANyXdEqPaZGPeVdfWNRjCmZZkQ==
X-Gm-Message-State: AOJu0YxMq1f/oLQYd6CcO2UYy7RdMx8SEtwithgZJjmTwPShWazgTtMP
	1OhM4hbuEaFNi8cyINr2NCF1OhIR3/Dkd1o3NcFZsQejSMlLymC6JSBqPJWPXguksvXc9Cfj6Wl
	lfa9EZOF6l3clbcZN2IkePt0IhQ==
X-Google-Smtp-Source: AGHT+IEFUbz0C8IzXKCEG0xPmqtSc7rWmrnUWonn1WU+SACvNCJUkl4MMM0KR1729CFmdhBDeKny5et1+AhpsahMuNo=
X-Received: by 2002:a05:651c:2111:b0:2d3:17e6:3b3f with SMTP id
 a17-20020a05651c211100b002d317e63b3fmr2426564ljq.39.1709661978150; Tue, 05
 Mar 2024 10:06:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240124190552.1551929-1-robh@kernel.org> <Zb6nBYTkZmXZ0G2X@shikoro>
 <Zdxq4GnRyjC07EH8@shikoro>
In-Reply-To: <Zdxq4GnRyjC07EH8@shikoro>
From: Rob Herring <robh@kernel.org>
Date: Tue, 5 Mar 2024 12:06:05 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLnCzXMsyeAHZUx2_oF5dqvLOWBvoj2Bb_Go6VimCxCoA@mail.gmail.com>
Message-ID: <CAL_JsqLnCzXMsyeAHZUx2_oF5dqvLOWBvoj2Bb_Go6VimCxCoA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: i2c: mux: i2c-demux-pinctrl: Drop
 i2c-mux.yaml reference
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Rob Herring <robh@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 4:48=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Sat, Feb 03, 2024 at 09:50:13PM +0100, Wolfram Sang wrote:
> > On Wed, Jan 24, 2024 at 01:05:50PM -0600, Rob Herring wrote:
> > > The I2C de-mux is different than an I2C mux, so i2c-mux.yaml is not
> > > relevant and shouldn't be referenced.
> > >
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> >
> > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Andi, can you pick these up?

I already did since you gave your reviewed-by and they hadn't
otherwise been picked up.

> Or you negotiate with Rob how you want to handle I2C DT patches. I
> agreed with him that I usually take them. Except for generic cleanups or
> so.

Yes, that is my preference. And how most subsystems work for bindings.

Rob

