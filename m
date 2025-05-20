Return-Path: <linux-i2c+bounces-11070-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC73ABD836
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 14:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 316093A58EE
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 12:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D64371C4609;
	Tue, 20 May 2025 12:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AEOF1xkA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911B81D554;
	Tue, 20 May 2025 12:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747744181; cv=none; b=aprcmF1fjoVCZXRQzvnJb0wzcd5ocTlsFTofgbsz3ms/ScZcIsZDfT9k4i+EFSkAMgMGZK7SBZHQAf7TU/qZhPFER+h7L2p6jgwycbCNBiSVET0rweNRZdh/noHwihns6WgaabdTsz+57oR4dnMzhAJ9fzIxH+jDppjugQ2iy+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747744181; c=relaxed/simple;
	bh=otdy0gj6v9t3yu2PkIBmFIF6Tt+1vULwohKrUAvm0yY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=sY7d1Wr+j1yt7hUr8fd1GRJ42GvLaEVeEzfQFkXynevZJlCuIvUaqhEle0yyoGWdEVa1Vvip74LDUnfljlOjjpFaW31FFVWu9RXNXwCY6hohYz2Svk6AjBJhH7pwW2oPgrpWOpDBAIYWm/h9wlC9WCvKU7U9xhY6Ek1nYaZU05Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AEOF1xkA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA8BCC4CEE9;
	Tue, 20 May 2025 12:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747744181;
	bh=otdy0gj6v9t3yu2PkIBmFIF6Tt+1vULwohKrUAvm0yY=;
	h=References:In-Reply-To:From:Date:Subject:To:From;
	b=AEOF1xkAvspZIMxlqJU++FoMGMfmrUG3vV3vuDCDhBPk/YY9BuElisiRXMKR6dC4M
	 hj1YCDtfaCYlnW/KP2eVhEvqT1+2D3Ka6AfJyMXZ5xVeQsyu03H1bv5aBlUoie7ATL
	 Kg9ZkmHpi91kQEKefJ4dA7SLbrHxhU7J9XIRny7IdGK4xXxYzRncZHV+Up7nnINsvg
	 fO7WAPAAUY02H6EHPilWqNasqqPj55vrDR4fl/8RxvDG0XioxbXFo8YnmmBvuvX5rg
	 Cz+cyYMLGZScjn9uQQjfGXXtu2uaeLF1OOsgjLRS+MxWHGpysQb0QBWFyUL8P0BWiU
	 1sgiwEkZGkeqg==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5f3f04b5dbcso7887104a12.1;
        Tue, 20 May 2025 05:29:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUKY1uhKH+NnaLFUxU3gFLGYsQ+rnvDEDbXU71P4JAOfI3TQk0QRBy3na/FxIlOJBwqD+t6o88ugwpC@vger.kernel.org, AJvYcCVWZ0wviR6ZR8uM+2eaOKCpQZc+q74fWgvnyHQJ54jqIDV7OQ8rbDqQe8COeyVWCX11ICjMkk5tMcyILKB0MR8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP3VxysuZoH25dnnsPDyqn8E5go7nhq4tkVXoE5mwWtJgGmiZT
	2DCJlNX7pNzuKBjLDPCmmoo4Jrl8dGIMpHGB+kMJq+qkfbh+oPkQX9s1Wz0HmW3QbKPj1JlN/fr
	JgGkbQT7CHVNsVSPttczqFY+uMua+cg==
X-Google-Smtp-Source: AGHT+IHyQN353A/uwLSNuLP227CqS6FWSa1S1hmDkcYfXYkNrY7nLkglTVvVmjhUVaYygP7eRACgyrx4Egh9t13xQt0=
X-Received: by 2002:a17:907:6096:b0:ad5:c07:49f8 with SMTP id
 a640c23a62f3a-ad52d575894mr1569447466b.41.1747744179546; Tue, 20 May 2025
 05:29:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519184530.21845-1-wsa+renesas@sang-engineering.com>
 <CAL_Jsq+UCU8RdAGVPbsFDo6aaAyoAKtjDd4yYfs47YOt__VhgQ@mail.gmail.com> <aCxKlniEUCJq-aqu@shikoro>
In-Reply-To: <aCxKlniEUCJq-aqu@shikoro>
From: Rob Herring <robh@kernel.org>
Date: Tue, 20 May 2025 07:29:28 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL6CdmrCTbvbFEUjhbd+yDtd9Jf9r+OcV0imcoB117iAg@mail.gmail.com>
X-Gm-Features: AX0GCFsseX5UsSVIQcg5aNMvQODxZR3i0B4-8Ft-IxxK46nz9V_LnUTCOzENOMQ
Message-ID: <CAL_JsqL6CdmrCTbvbFEUjhbd+yDtd9Jf9r+OcV0imcoB117iAg@mail.gmail.com>
Subject: Re: [PATCH dt-schema] schemas: i2c: Allow '-' in 'i2c-.*' node names
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Rob Herring <robh@kernel.org>, 
	devicetree-spec@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 4:25=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Mon, May 19, 2025 at 08:18:53PM -0500, Rob Herring wrote:
> > On Mon, May 19, 2025 at 1:45=E2=80=AFPM Wolfram Sang
> > <wsa+renesas@sang-engineering.com> wrote:
> > >
> > > When allowing extended i2c node names, the '-' character was not adde=
d
> > > to the character class. Fixes the following error:
> > >
> > > .../Kernel/linux/arch/arm/boot/dts/microchip/usb_a9g20.dtb: i2c-gpio-=
0 (i2c-gpio): $nodename:0: 'i2c-gpio-0' does not match '^i2c(@.+|-[a-z0-9]+=
)?$'
> > >         from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.y=
aml#
> >
> > IMO, we should change the node name to "i2c-0". While I'm on the fence
> > whether it's worth changing these, I do think it is worth not getting
> > new ones.
>
> It is hard changing the existing ones. They are numbered based on the
> numbers of GPIO based I2C busses only. If we drop "gpio-", they need to
> be mixed with other non-GPIO busses. That numbering is usually unique
> per board and can't be automated.

I don't understand. For arm32, I see 1 case of possibly already having
an i2c-[0-9] name and that's in
arch/arm/boot/dts/samsung/exynos5250-arndale.dts. The non-GPIO I2C
buses are all MMIO and have unit addresses (and also aren't at the
root level).

The hardest part is doing a dtb->dts pass and comparing those before
and after to make sure you haven't combined or split nodes.

Rob

