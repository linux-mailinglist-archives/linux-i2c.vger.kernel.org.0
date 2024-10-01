Return-Path: <linux-i2c+bounces-7157-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5B398C927
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 01:10:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 016C62885B8
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 23:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87B651D0F76;
	Tue,  1 Oct 2024 23:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YpA5qeCo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA491D0943;
	Tue,  1 Oct 2024 23:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727823946; cv=none; b=dFNlh28sCvJZ8GImvKwHiLrZWmYmPJBv98/V01Z21JoJXmMeMXhCAOnGdeOfE4+AoC8FHde6k9wp2vo4VREbXurkFGqOl1MIHHTe/QTEx2gf2aS4M6jIWnJ0Pa4vx/GCqzaWySYU/pCN/uAm/hsn9tApqpfX40pieDcz/5GIYJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727823946; c=relaxed/simple;
	bh=wpshmwB6VkHtdKwNBCKAevlj9A5uw8FmmNrgqjxZwlQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jLV2hwohzZn2z/DJUrAgY7L2lMsh52d3nGBXL2YpjldQTdHKq5v3lornBOtRt8bzCRA9H6vWlNs8Osf3W57Z9wPvC7tzFb353zwzqet6n4YlaaE03E/7hK4GcaAswlohNM2SuY6jlEJhctHVV/DAq7+EPLzWCluGMCbqMg6T1SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YpA5qeCo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCC7EC4CED1;
	Tue,  1 Oct 2024 23:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727823945;
	bh=wpshmwB6VkHtdKwNBCKAevlj9A5uw8FmmNrgqjxZwlQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YpA5qeCo7Bc8w/odgKCruYxtYJfbAWRy/E1OPyPYlMhiA7CfqHEd8HnKhEVWoW4Bw
	 ATFGyIlXspCplDAasYSQ36j0ac56rilnS5dfg/Vy2KP7AKREi/EjHAPeNRw+WDtmyl
	 /TjQ+pG3Izho2nndhZkFeTmC19mWdlOHbN3t7KhZeIR3dcwQbmr28/E/fXk27zvEMX
	 85tz+7eIsLGCUoN8i3GZqs7e/dNuWIHF3BXrDcqBg98AOkEUQBu2I/x4LaEQuWmPFr
	 wOwJFomcVana4TlTAZlUTLtXB3QNTIOPkSHhbBmaCQP7+FI0JI38mztV3qtQvV21lr
	 qWAF1IBDgEQPw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5398e33155fso4325835e87.3;
        Tue, 01 Oct 2024 16:05:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVxshY436LZP8diTmHhuLtlCcMV6lULgSC8jbfufFqPWz03sKuCg4bJQRKzQQO9ViMt6BKrNATScbyj@vger.kernel.org, AJvYcCXmyVJx0YlzcDqtDTD5qMiAQYMTbzzW+hxqeJnuRZU0Km8+A4KfknwTlGsxH9Q+RNxzBkX+FxjnNSDoGWCAq+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhCKslqGwv89YPOMXZJVFR3/TVo7HtvkrSKyzVHB0h9cuaGPvl
	O7rRXpuohE3K4Ukl+4hPFADz78R7aJUjdRphyulyYaR+363fZGMVUm1W6Hze4I1bjT9JuPBubPp
	A2g5LengY3hbR1Kz766M7EOmhlQ==
X-Google-Smtp-Source: AGHT+IFH7ioAgfOMUhVPg1kRaVOz8AQm1o/RUZ35K6Vi2CVpKIgmSHbtXdTjF6RYMTSQac1N+p+l9V8yd/CMyrwUSg4=
X-Received: by 2002:a05:6512:2399:b0:539:91b8:edb7 with SMTP id
 2adb3069b0e04-539a07a1d5amr619489e87.42.1727823943884; Tue, 01 Oct 2024
 16:05:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240909105835.28531-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240909105835.28531-1-wsa+renesas@sang-engineering.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 1 Oct 2024 18:05:19 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLsX_QYuhEe30n6p36GdjXTPgWAzNNDAmxXb3j-mB=wQw@mail.gmail.com>
Message-ID: <CAL_JsqLsX_QYuhEe30n6p36GdjXTPgWAzNNDAmxXb3j-mB=wQw@mail.gmail.com>
Subject: Re: [PATCH dt-schema] schemas: i2c: add optional GPIO binding for
 SMBALERT# line
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree-spec@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 5:58=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Most I2C controllers do not have a dedicated pin for SMBus Alerts. Allow
> them to define a GPIO as a side-channel.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  dtschema/schemas/i2c/i2c-controller.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

I guess GPIO rather than interrupt is fine.

Will apply it.

Rob

