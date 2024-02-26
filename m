Return-Path: <linux-i2c+bounces-1976-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE02867977
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 16:07:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAFD61C2B0FC
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 15:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAAF012C7F0;
	Mon, 26 Feb 2024 14:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qvO8bHcS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6206B12C521;
	Mon, 26 Feb 2024 14:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708958718; cv=none; b=mSc/GN4HN2eJfPLm+nergrLYlyT9oBiLyyMeMKeFuEh/il0aWuc8TGqALJ/JNWx0Ha81LXlDVZj4t4JSWeiDuxqchmHqsmDKxRs6mXYErEOKu3BCAAiymKyMyIrhNr9ruNE9BgTahfE59DYT1fyk7vGKVPdM5/FFMPcO4Aa9jl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708958718; c=relaxed/simple;
	bh=qqBpgIJh+XSrGEenVQxqM7Ai4RpcSrHI+XiY6MqjRI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=dC91PcGrd8xrgzJ1UrdXTyiJtBgrtipzuq0TpnjYtm6gxno1QD8/1hs951pVvDaZqpljjP3/JZm8hlhPTExWbb1u1Wkri3TiYX9yJhPzZUKbtoGgMzI/90tovRHaxUeLO2eYNNVYFecgBmmHtZUcJ51HhrmO2FBgsGxwxwvWjF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qvO8bHcS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEF31C433F1;
	Mon, 26 Feb 2024 14:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708958718;
	bh=qqBpgIJh+XSrGEenVQxqM7Ai4RpcSrHI+XiY6MqjRI4=;
	h=References:In-Reply-To:From:Date:Subject:To:From;
	b=qvO8bHcSVs3P73AkcBDMkN5iF1BfOBxkL5fHqBKxPZkao9X6lGDBXMhmLtB57J2Y1
	 iERQ5c+3MGGWNKbDvYvj3ZXUSqyD78xc+RL8M26ZW1UXbcEcn4Hlrm//BWSo180Hxh
	 CmGEvWTe2yi/DqpPd0tpzvH/ODLbfi5YaAl6yP/QxSKcTQ6FaNYwxKwgDYLveXwai/
	 5NSP1cpAYRFNa7P1UrKDHXgJvXtCHVsajQOerQOhyE23VRUpRjte8PGsGeSEMpz6kn
	 MmbiE9jiVOKz3+bZ6Tqv1mXxNmZMoDNRjogMACKyA8Rgv/wUKPGcHYJBF7h/2fLuCL
	 JA2fuvRIju8SA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-512d6bcd696so2834282e87.1;
        Mon, 26 Feb 2024 06:45:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXf+lfaObK+bGKjMnRk3VfUxx7dzAoxBcDmk32NJ/JymghAIerj6gPMBtIOH7EFiI9M1QF573h5YcNcnL4nxCh+PA0BVBEQtC9oKuEX6vls0AziEDpPO7rf4+xV0iX6NQUhO2XZ69G+IUaS
X-Gm-Message-State: AOJu0YxaFy0asMg/L6Z+zdDN3EL8eUpnC+hwQdly15zecnaLvfXy2avM
	xB/yOv4N5qb7LsJKlQCfqydJzzeLsb+0kyPHfkhm7v3FhWHAIlqwTDdDhZXSrPHOTI6SN1+/Jj7
	h8WJmV/sQ7oX5Q0EeaU4ohQf/tg==
X-Google-Smtp-Source: AGHT+IGwZvqcMQ2VeEJa09jEXyJRGq3iKl/QPO2dyxhsCm21aP3ssF40pH2Oh/jmbIsOkgjDmh+iZFbB55/98CBniNg=
X-Received: by 2002:a05:6512:48da:b0:512:ed31:3cdd with SMTP id
 er26-20020a05651248da00b00512ed313cddmr2174968lfb.18.1708958716153; Mon, 26
 Feb 2024 06:45:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZdxjGwvGXlDGkYs0@shikoro>
In-Reply-To: <ZdxjGwvGXlDGkYs0@shikoro>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 26 Feb 2024 08:45:03 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKPofALm60XpexAVXj-cYZXyqo-eY0Z+Sx5q4QV0193hw@mail.gmail.com>
Message-ID: <CAL_JsqKPofALm60XpexAVXj-cYZXyqo-eY0Z+Sx5q4QV0193hw@mail.gmail.com>
Subject: Re: dtschema: i2c: messy situation about timeouts
To: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, 
	devicetree-spec@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 4:08=E2=80=AFAM Wolfram Sang <wsa@kernel.org> wrote=
:
>
> Hey guys,
>
> we have quite a messy situation regarding I2C timeouts in the dtschema.
> Partly because I was too busy to pay detailed attention, partly because
> reviewing dtschema changes happen on Github which I totally missed. No
> complaining, though, here are my observations and suggestions to get it
> straight. Comments are more than welcome.
>
> - "i2c-transfer-timeout-us"
>
> Description says "Number of microseconds to wait before considering an
> I2C transfer has failed."
>
> To me, this binding is very descriptive and makes sense. We should keep
> it. Sadly, it is the newest one and we already have others.
>
>
> - "i2c-scl-has-clk-low-timeout"
>
> AFAIU this binding tells that the controller can do clock stretching.
> But what for? I don't see why this is important for clients. If
> anything, then it would be interesting if the *client* can do clock
> stretching and if the controller can actually handle that. But no need
> to describe it in DT, we have this as an adapter quirk already
> 'I2C_AQ_NO_CLK_STRETCH'. Two controllers use it, but no client checks
> for it so far. Coming back to this binding, it is also unused in the
> kernel.
>
> Suggestion: let's remove it

Seems like it can be implied by compatible... I'll defer to Andi.

>
>
> - "i2c-scl-clk-low-timeout-us"
>
> The description says "Number of microseconds the clock line needs to be
> pulled down in order to force a waiting state." What does "forcing a
> waiting state" mean here? I don't understand this description.

Does the commit msg or PR help?:
https://github.com/devicetree-org/dt-schema/pull/103

>
> It is used in the i2c-mpc driver. The use case is simply to put it into
> the 'struct i2c_adapter.timeout' member. That timeout is used to
> determine if a transfer failed. So, to me, "i2c-transfer-timeout-us"
> makes a lot more sense to use here.
>
> Suggestion: let's remove this binding and conver i2c-mpc to
> "i2c-transfer-timeout-us". Yes, not nice to have two deprecated
> bindings, but things happened.

Maybe the core code should read it instead?

I think we should mark as deprecated rather than remove unless we can
just remove the properties from the kernel. The reason being that
every property the kernel accesses should be documented. I might start
actually checking that. That's already done for compatible strings,
but those are mostly defined by a common pattern we can extract while
properties are less so.

Rob

