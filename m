Return-Path: <linux-i2c+bounces-2032-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D26448691C6
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Feb 2024 14:28:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E5DBBB251EC
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Feb 2024 13:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EC1C13EFE4;
	Tue, 27 Feb 2024 13:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YiYsfqrN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222A913A25D;
	Tue, 27 Feb 2024 13:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709040428; cv=none; b=Nh5FtIS1vq3Mjx2AEPAhaW7qUEByV9pMMQBDxjjEhMFX8j/Cb6fFAWSpM8msDCnCwaCoG6ZYz6wNcPsRGMhqVUq8R8gCw0hUQnHexIEssnFBYfvKkQX6rzGkE/zPx3ZjNHdSrbIwsXATycX47DtkwbzvYWrCkyaRHXFGtYWZ3k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709040428; c=relaxed/simple;
	bh=mQuoPMjiuf8ynXjuDbiiuc6MSut0kX4NXC2fBVQm6FQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RqYVIs7BLwIEROh3UN3Cc+DJlndYlC8P3k2XFlYhsaPW8MP1+yQFTT9/kD1xPhrQqqAeCum2SLDK5z7VoTrOW3XfeQ1hGDEpkMlHku8HuUAqmxPtQCLko9cp6WwIU5FYzHwUgtXoB/lzjxDY97uuRLBqRxqQM6FC59g1OXS5F7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YiYsfqrN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C53CC43390;
	Tue, 27 Feb 2024 13:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709040427;
	bh=mQuoPMjiuf8ynXjuDbiiuc6MSut0kX4NXC2fBVQm6FQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YiYsfqrNmxelw6OLCadO4d24dF73YVqv4GXCnzuNjZu47FB3rTy1hLVSKKAefEn1s
	 ZMDN8gvO4BI8MI5h5oSI9qx85Gz8zdwEdyk5aGSjNSqYu1swE/C6/dcwxG2Ssf/V6p
	 XH2rJg1Gc/o2ziShAi0h6jOS0LMybeZg5kh1ao5XhYDLQh3aICvvUNI7NjFpGLeW7u
	 X5l5k1SHu5oQ2RzsIRiRv47fR/9KGDtu3DeKi7G+RXf8Dg2gnwpuJv/NZCdkH1BCD0
	 85J66xJ7KqCX83NhABKxeyFSWFJHqZObxs8XA1oRVABAdLOzaeGmnowo8GwAvfctE+
	 IU+Mjg83pNh8A==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-512fe342841so1770883e87.0;
        Tue, 27 Feb 2024 05:27:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVysh9KTj7+CwVyW2d8AJbZqez+bRdfLq2PvE4eI6DJBrEhoOr4Dj/PXISrpyOMtJLOdrLOaBStyo6ODZ/i1Xw0e6a6mpYeLIbp22PdwJcpjARlF4/XDQnLocx7rrErruJqqIkZHzB/r8djJu2A2iKgzrKX6P4dVompyJpIH6xQ1XkJ11gVOkwAIUcRTJfLjxOrIiPWwlRqTxBbRz4BlYvB1HW3cKe10qF2AtIwozTWhwrCU8zo+OaYLcm1iDy21Ji992M/U2JB2gIujvWb9IQEHe5VMDgmQbOn
X-Gm-Message-State: AOJu0YxmAxNKZNPuYfZvSQ5Vjveg/uKVOFtFjdsIJRBle3omyhOESyQm
	T5G1SBqZhgS7r9JYZ5YJb1wW+jlWUw3p7dfUC227j0BzNDTzOb2SYH1EbWX3ZPWLj3yy4gNWofR
	oYO0/sJreaY/i6fhgmZjkJPPBtg==
X-Google-Smtp-Source: AGHT+IGSECgtfha3Slu/bp01d2++70z6Ndl3JBsL88LZ7J9E4A1ZYVnx89bJzdpkH8hy8sv4XeL5Ccsb8VUnBLV0130=
X-Received: by 2002:ac2:5611:0:b0:513:7b1:848c with SMTP id
 v17-20020ac25611000000b0051307b1848cmr545044lfd.18.1709040425849; Tue, 27 Feb
 2024 05:27:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240222174343.3482354-2-robh@kernel.org> <ZdemsdGQE0RtilCd@shikoro>
 <CAL_JsqKpn6jqktRLQUx7HMrJG0PZeiOZ=hQnHpZK6AHcM22CLQ@mail.gmail.com> <Zdkda5jf072mENvK@shikoro>
In-Reply-To: <Zdkda5jf072mENvK@shikoro>
From: Rob Herring <robh@kernel.org>
Date: Tue, 27 Feb 2024 07:26:52 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+Wus0CFpD3+b1Ewfv0e7iCE35gzsAwahBxErex6tY5Ww@mail.gmail.com>
Message-ID: <CAL_Jsq+Wus0CFpD3+b1Ewfv0e7iCE35gzsAwahBxErex6tY5Ww@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: i2c: Remove obsolete i2c.txt
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-i3c@lists.infradead.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2024 at 4:34=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Rob,
>
> > > * In the schema, "clock-frequency" has a minimum of 1kHz and a maximu=
m
> > >   of 3MHz. Why? The specs do not say anything about a minimum freq an=
d
> > >   fastest speed mentioned in the docs is 5Mhz (Ultra fast mode).
> >
> > IIRC, the high speed mode originally topped out at 3MHz. I guess
> > that's been revised.
>
> Hs-mode has a max of 3.4MHz...
>
> >
> > We can drop the minimum.
>
> ... but I see you changed min/max now to 1/5000000. That's what I would
> have suggested as well.
>
>
> > > * new binding "i2c-scl-clk-low-timeout-us" has a description which I =
do
> > >   not understand. What is a waiting state?
> >
> > Shrug. May have to look at the MPC h/w that uses the property.
>
> I will also have another look. My gut feeling is that the binding is
> okay, only the description might need an update.
>
> > >
> > > * new binding "no-detect" is broken. At the least, it should be named
> > >   something like "bus-fully-described" and then the OS can decide to
> > >   leave out auto-detection mechanisms. If you are interested in the
> > >   latter, you can simply disable class based instantiation on the hos=
t
> > >   controller. No need to describe this in DT.
> >
> > I've reverted the property now.
>
> Cool, thanks!

I don't think there's anything else to discuss on this patch, can I
get your ack?

Rob

