Return-Path: <linux-i2c+bounces-15074-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C19D13CEF
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 16:52:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 58BCE3002B94
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 15:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A433624B3;
	Mon, 12 Jan 2026 15:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H8UJ8IaE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A77836165F
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 15:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768233142; cv=none; b=Z8UYKVwEtNmlswELdbqxD2DDAM1Ok2nx1DD29zNcEtWh1ApIS6et0fGA+MqT0prh/52BV7r971ZS2luBX/RlxWv7E7o660Pn5PCwq45fI2bgqAH9CBrNBpvVeeNkb1r8iHoYvwGIHoeZPucBhGh0oDsXYqdyrEakY8HH7U+uFn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768233142; c=relaxed/simple;
	bh=ZkcabmcYCcBrxnwKFSNqoTlMq8l5sVsmuZV7ptzpUhs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FS0VOuWV3Ih+Z1XobLdqhWknakgptp+vi5AG8R0H5FzaW9krjKjkpIxYU3LxAW4zSn9LgHYr0YNxKYaccTw3c0/xcSqTbMZ+cLDTLOMsECFs2xMrp7ONTgPvZDzEkioL+iHeJJLbNuTOxTjRWhDWSYJDH09QuXbrDXQZObNsD8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H8UJ8IaE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38FEAC2BCB7
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 15:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768233142;
	bh=ZkcabmcYCcBrxnwKFSNqoTlMq8l5sVsmuZV7ptzpUhs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=H8UJ8IaEpopQ/EXYsnMfDGmckISt8UEqaPIlrsVA9V4pYuvWLdsRW0EkDKUrHwuJx
	 83kZlHNTNvMum/h5bOAws9xHUn2v4fHczgsAmXBEo/vF44IaAChXWJBbn2K1ogLW7f
	 TNoDh9FVoDwG0clkJ732A72BgcdP5JB0pu7qUp7qspza+hZJW5gIdmcdBvcbVrOs2d
	 rp2YAA9rfBU/6yaYdj8TaVVW/a1ME+/cCXj+Y48KZQS+kY1HT5WiDaepDIVyPUwDub
	 AV0+PX3/JHW6P9gLCt066fLSGMuxQZ+vddw1XlNeqMdNeiVzyt4uDG5XCC0vlkfZAF
	 pe7dwOsMs8MMQ==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-382fe06aa94so45861601fa.0
        for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 07:52:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXVHqhoqOPIVLXtXbhSa3fXLgRDisMiDXTCEnZ8NB6sfyKvhIS+kfCDXsv/pNuOxKXu2B0MoePG4wQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvDZQ/8/szmEqMWRPm7h2d98I1F7PrLlMtJwCsVmag5E24lI5T
	C2Mvi+8cx2vxOQLu72YDIkoKm4eOj6gqA5hnemsBBgdyBycCZjIOVvy+nGU4dgy+YhNpUtuVUKj
	70qdvoe9nOjl9LQ1bdi1tYmVvN9MWxpY=
X-Google-Smtp-Source: AGHT+IGvtvpe0+JORzp/Ys20P6G9z09DfGY5vS/3Gm+svovxaEP0U/CWOpHfTeAwgDHpI7RPcWpKuzzFp/hRrSMcr6c=
X-Received: by 2002:a2e:bea8:0:b0:383:1ec5:9650 with SMTP id
 38308e7fff4ca-3831ec5abe9mr31087051fa.21.1768233140744; Mon, 12 Jan 2026
 07:52:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com> <20260112134900.4142954-5-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260112134900.4142954-5-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 12 Jan 2026 16:52:07 +0100
X-Gmail-Original-Message-ID: <CAD++jLmD+50JeZdcpDfhk_hv8xZukjAng15woDE_zFaxh=cRqQ@mail.gmail.com>
X-Gm-Features: AZwV_QjeVsmFIXPVAfMxBTLxxVXBlmyoPLa2yVuN3Ez29-sBYgkr3sMPDrlgVTQ
Message-ID: <CAD++jLmD+50JeZdcpDfhk_hv8xZukjAng15woDE_zFaxh=cRqQ@mail.gmail.com>
Subject: Re: [PATCH v1 4/7] i2c: nomadik: Use HZ_PER_GHZ constant instead of
 plain number
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andi Shyti <andi@smida.it>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Qii Wang <qii.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Heiko Stuebner <heiko@sntech.de>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 2:49=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Use defined constant to avoid the possible mistakes and to provide
> an additional information on the units.
>
> While at it, drop unneeded 64-bit division, all operands fit 32-bit.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

It makes perfect sense, I don't remember why I put ULL in there
anymore :/

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

