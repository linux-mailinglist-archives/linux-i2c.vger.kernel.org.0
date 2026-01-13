Return-Path: <linux-i2c+bounces-15094-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB22D1847F
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 12:01:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1F20F301D494
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 10:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E049738BDDF;
	Tue, 13 Jan 2026 10:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aoiv5E+R"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF8F38B9A7
	for <linux-i2c@vger.kernel.org>; Tue, 13 Jan 2026 10:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768301980; cv=none; b=BJwZonBnz8E7JwzruGh2YDFnkq9tJyfx6PmhyyGAQhULP5JcoNgyozrHn9E6jRfFMXlGessEAytS+qNycbxhaGNGM5hl0kIxbEnk6QX/TdpKOfpUxjHMzDG1kWHiP9QRC5ATB5xZ55N41OwDk9NGjalP4DP1LfMHFvYvVKpkuWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768301980; c=relaxed/simple;
	bh=2Hm3klV9uiE/Rwd0k0xCU9t68/lMBtjH2KuL+woZfe0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YrgUUXuK3YOpPF8PrWRDiPOOQTzxb+FLceAkbA6eCKEpbdCRU7y2yNb0Hfwe5E23KiTD39biZvGQ3B6GyFgyvtZ/+fWv1Z6MKR8Es7EQQ0te+dpguAR14a8nYNg1e5O/LzC1FXlplEOk6KKMEwN+Do1iqSB2BItiEqkByoSL17s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aoiv5E+R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D83AFC2BCB6
	for <linux-i2c@vger.kernel.org>; Tue, 13 Jan 2026 10:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768301979;
	bh=2Hm3klV9uiE/Rwd0k0xCU9t68/lMBtjH2KuL+woZfe0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Aoiv5E+R9+G7mpJeLR17EVHEbcaIcE5tMs4+TBsdIKCiRQjQVEVRqGs5g3waT3akg
	 w8QZerZ3vBJTV8qonXkbxcbxNEThv1+LcLSOPlAnnnVAhYjYQAb5yWBuwiTnuwc3yG
	 GwJ6t4PnMcu3DXyl5BvDAaqbBleSvsGCIpHMZ+LSPRIbBd3eypW4re99On5m2yn2rz
	 ZegKHtb8XeQAv9NUmzryx9fW5UQ2xNGWzWrPVr56/2wHXYFx+PdkF8niAbj0IccPpQ
	 9YA1SlLHIdbEjnw6NsbS8S/vsql5tBag4/hyMnET+SMhCqTuKs3n45Mv4P49wozYEc
	 aJC7rSM7KaoTA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-382fe06a9c4so54816921fa.2
        for <linux-i2c@vger.kernel.org>; Tue, 13 Jan 2026 02:59:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXQUAYDHtkk/ZHWIcZmvsPDKC1dH2BsprlLX2rCH4BVfqmtDIIn39LdzGV2jCNTg1Tsf23bT/Cu5D0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5iZiTQxB3l3XTvB/B/s6IUBLAZMho21uxYhYR95zfwGxcAcjQ
	0hIwYYDqLnxKIoZSF8WKS6UQz+VUa8qlE+m3Qgq7Aj5MdFSELs9VMnp+PEcyzWn7GcnaAMTDVC/
	R7MXcHqPhWSHWDSZ5CqJu68M1wjAWDFRIaPvhl5PvYg==
X-Google-Smtp-Source: AGHT+IGcmwmSIyLMyyShT8GjGLmzzGIi3k+GcAB52Nf27mmBCIl5woR+Nq0F41SPuLO1vsApeIkdFdNTDNszbvq1ee4=
X-Received: by 2002:a05:651c:2212:b0:37a:584c:23fb with SMTP id
 38308e7fff4ca-382ff6dd8eemr58925311fa.20.1768301977156; Tue, 13 Jan 2026
 02:59:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com> <aWYiJbtueA8g3srn@ninjato>
In-Reply-To: <aWYiJbtueA8g3srn@ninjato>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 13 Jan 2026 11:59:25 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfseaLWfYuhz=5MxRw9dtBvOM4X6brPwT2PJ4Fq7rGbfg@mail.gmail.com>
X-Gm-Features: AZwV_Qh-1r_ecwLNV2XfQsZ1XcvcpdCoswobPzSyba32xUDeV7eWsZEVfP38rEk
Message-ID: <CAMRc=MfseaLWfYuhz=5MxRw9dtBvOM4X6brPwT2PJ4Fq7rGbfg@mail.gmail.com>
Subject: Re: [PATCH 00/12] i2c: add and start using i2c_adapter-specific
 printk helpers
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 11:45=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Bart,
>
> > can be *revoked*. To that end we need to hide all dereferences of
> > adap->dev in drivers.
>
> I haven't actually tested the code yet (but will do so this week). But I
> already want to feed back that I approve of the general concept of
> abstracting away drivers access to the struct device by something we can
> then convert to SRCU in a central place.
>
> This mail is to discuss the timeline of these series. My preferred
> solution is to aim for inclusion right after 7.0-rc1 is released. That
> gives me enough time to test and you some more time to address review
> comments. Bold wish, but maybe we can even get dependencies into 6.19
> before (like the i2c_dbg rename for the saa7134 driver. Is there a patch
> for it already?).
>
> Does that work for you?

Yes, I agree it's too late to queue it for v7.0. I actually wanted to
rename my macro to i2c_debug() to avoid a conflict with saa7134 but
you're right, I may submit a patch for that instead for v7.0.

Bart

