Return-Path: <linux-i2c+bounces-15073-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6D8D13D8E
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 16:59:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 595E7304D35B
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 15:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE29834252C;
	Mon, 12 Jan 2026 15:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DundEaS1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4BE3033D1
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 15:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768232952; cv=none; b=HQ6HdzPivsl7PViILQwXAYaHksLEUFkjj7ebF9sAWOEkqbq+rwkp+GAO4GUymIVS3tHEqmWRG14VQGxIVJJy3A7aNBYLkFioPnmJAT8BP01h2HgxIi06veBIA3D1Pw8wntSxeiEXUOt94rlW3oJnc2Dnt2c7YUY0/EOSVw4paUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768232952; c=relaxed/simple;
	bh=g3qVMOf4h7r5oPNNYlK3bIOu73r1qNBGBIVfGAnDN44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WKnLTRnf/14gKRVdeUZFSfzvpjWkcOwhr5pr1UiHmGFa9Ri0kKL0Ux4qSperPA+Q1eEHhZgbsN4J2d2Um+mpM9hoH8uTzj2KMM9SQQE0dVbi660DOkae71z/Rs0wVU16lPOL4Il29cTPF7AiDi7t/HwnrDAPHiHjVoHnAqw5cyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DundEaS1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40C7BC19423
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 15:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768232952;
	bh=g3qVMOf4h7r5oPNNYlK3bIOu73r1qNBGBIVfGAnDN44=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DundEaS1NAS3+LPc/kxdJ2yGGomCc9xbKC9k1YG6fs0A1ILvlzTAtzITL4qvI3l7f
	 p9JgbJHFAiC26fKfk22rPFMWLzp9CQxUPcJZIBpXL7U4pvINJfJX/NHfcOsaf9yX6T
	 y1Un4vS/kayDeU4qkHi2UwVzBuNtTfOaFmilKeHzR7DY0ihKWyt3hwY8VZwrq2wW5o
	 GA+VJ1nDezZ9AoHIP8+sdbfpsgSYX4asdKCLOXj7F0WfKpESQGJ6nslcTlu63g7mko
	 bUa7JW1pwUW74dbDbb6TJErhuDbrjFrex4rdk38C8JNZmDbNarsi0ruW4erNk0EU3t
	 0wgDmSevaugEQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59a10df8027so7767045e87.0
        for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 07:49:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVVRfXSc+gtZrJOozKwmQ7Iu0FBXI7gsSqnrekABTi4B5KsxTze9CbmsilCRm7nVk0LzXC71JzkBYs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLr9/JnLk9W57MUU2l0wVEnUdjdK5/DE8OzN7hE/lNLMz0JwoY
	t6bA3pjVmat2vJBHb9fnLP9vpUXU8h0R97VuBPd+cF6Y9Q5LwWBuqxVskP6pet7Np6K7/dMk6U1
	VP6eDu2mV9qYxHV0tzNGypFh14R9CbkY=
X-Google-Smtp-Source: AGHT+IGrmhpZ8nXRdgojkHsyjUv61lqeNWnDH4LALSgozKK/V99agmF5Af5tLfoDGn/rKgr4N6cPGy0VL/XBPqOTq/E=
X-Received: by 2002:a05:6512:2312:b0:59b:67b9:3989 with SMTP id
 2adb3069b0e04-59b6f01c67emr6662469e87.16.1768232950905; Mon, 12 Jan 2026
 07:49:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com> <20260112134900.4142954-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260112134900.4142954-2-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 12 Jan 2026 16:48:58 +0100
X-Gmail-Original-Message-ID: <CAD++jLkQo_1HM2=FM8uw5FLdGo_dyNi7mq55O+Ea62am8nk-uw@mail.gmail.com>
X-Gm-Features: AZwV_QiRK9ToY_JI65YTXBjF0MrmuQc7bAxxJwuy2RaXI4VD3YSpEG_xcWGIoX0
Message-ID: <CAD++jLkQo_1HM2=FM8uw5FLdGo_dyNi7mq55O+Ea62am8nk-uw@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] units: Add HZ_PER_GHZ
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

> The is going to be a new user of the HZ_PER_GHZ definition besides
> possibly existing ones. Add that one to the header.
>
> While at it, split Hz and kHz groups of the multipliers for better
> maintenance and readability.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This looks right to me:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

