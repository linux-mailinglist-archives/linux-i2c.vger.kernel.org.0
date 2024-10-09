Return-Path: <linux-i2c+bounces-7296-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AF59968AC
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 13:24:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5CAE280DD2
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 11:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D216B198E93;
	Wed,  9 Oct 2024 11:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YQzP9/vA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38DE198A37
	for <linux-i2c@vger.kernel.org>; Wed,  9 Oct 2024 11:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728472929; cv=none; b=T6HeCi7PdFxzfqF6W/vCMnuW8JeULRqPvBt5l98UBe6fcVL6eerXq4CiG733BFqhKUNmlFsvK6YW9vOXG/4nsgmSSwpkpQ19xWpbzGk1GZiu9vtHGvGE2Pg05mfI3a+aP8dRtqvvhpqb9TjIRVYZ1LKrRXOXg8diVUalN00TmAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728472929; c=relaxed/simple;
	bh=ToMkMJEJ8rJjCBH2FI0bPgN3A3AyN0+TDY69ZKIJIQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HjgjbzGaVxfKlpvy1pzy05glv0Xlb0XZv1jSCjFWayE0n/HYKapQqyhNM5qJ5ukzPoBc3u6c62TX7fqgGx6+Tsj3zOIARofF6KyLo11RvVCIym53VsunK1yIJeh++bKQ6GtJCPnfws/DERJwPssJoAVaCPVObjTmytGElZgy+20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YQzP9/vA; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb18f14242so7407681fa.3
        for <linux-i2c@vger.kernel.org>; Wed, 09 Oct 2024 04:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728472925; x=1729077725; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ToMkMJEJ8rJjCBH2FI0bPgN3A3AyN0+TDY69ZKIJIQM=;
        b=YQzP9/vAoFOUNF13hDBTEzwlMu19jCVGil3pZIvfd4fzNS71UAG6a7f4/2CAVXxEli
         g/DB25sirC18Hv9nI6rR6Biz5ZENEDAaH9+nKHXK72MNSH1MuYlsgqCzRnygaN+p+Rzu
         sKVKXMKmhyYTRKnY2NqjT8H9G2gQlaWK0Cozal9VQH6UZoHlWcaNez7iFrBpljtga4W7
         tAkIGatP8eASU1MxocFvMd1FbXXMHxZr2HAf+80Kbs4EAtSpWLA1BCt0m2pqo3VlwEzn
         QKwxJVLwCEWNxAZl2Qly41Qk4zjYIu2ovu7BFJFuwN5XcGTxaw1ShNx3sGLg6VRWHFSV
         NZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728472925; x=1729077725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ToMkMJEJ8rJjCBH2FI0bPgN3A3AyN0+TDY69ZKIJIQM=;
        b=tWQos0ImRw/4by1P7W+f8NDqNq7DaIaT8PN8P2gY/2qZFGZlwhpP7hdota538ka1dd
         QZ3wfe4gdbpzjrieTDp/PSP8IgYsXM+baPVJiEfKs5fkkNC/UViVpK2RhzjtV/YfLUd+
         ZLCmfP6hpgV6XW+wdo/78reE1pxMo4bci9qAj1pWq3Y8DqYflHPk80CjTjKZB1PUVaLn
         wn3/hTo0qHqR3JSwUNV+lvQvK6q0+91gwxWiv/+eJ1k6LkkgZ0UBRnM0Dbjifc4mlAw1
         PqIAoqsIQFODaERe6+GZLFd84Xrl/wVH5NJboynpLk5VtFbzpdn6ymnyRJbeQQ8IpEY9
         QadQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqm53E0lDYplInRgUL/106V9eDj6XfiCMadxITkwsRYMNLQHtDVvG9vRtddgLIm3oyHBZc5WJxst8=@vger.kernel.org
X-Gm-Message-State: AOJu0YySAKQwrOZ8WEUWaflDktrebrDV4SlAHzdT33uy9REmLL2ch65A
	JI5G9slh0F1y+pKSRwARBoxgv1wMyW6M2yoLFht4D9wj+X/z14qbpWDAVBl/Ao3RtFUemtD0ivr
	IHXtax0uW4AcaXSHSjhafkTWYoPa7/ARlSiwYpBosLSKf3RFnizs=
X-Google-Smtp-Source: AGHT+IGQ3Ws6eewLXWXtNZ6Xp4qHWJ76HWt0M0Bzk6+R7EJ9OthHCsQrJfXtS7q4gWbrCHhdM6uWqQ2/WrrmEzIWnwA=
X-Received: by 2002:a2e:bc19:0:b0:2fa:cf73:a2fb with SMTP id
 38308e7fff4ca-2fb1873f1d8mr13097621fa.2.1728472924856; Wed, 09 Oct 2024
 04:22:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009-mbly-i2c-v2-0-ac9230a8dac5@bootlin.com> <20241009-mbly-i2c-v2-3-ac9230a8dac5@bootlin.com>
In-Reply-To: <20241009-mbly-i2c-v2-3-ac9230a8dac5@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Oct 2024 13:21:53 +0200
Message-ID: <CACRpkdYRPSYd0pX_QR6mAa8kjwFLhA=FVqxYQa=9PSpNb1jFHg@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] i2c: nomadik: switch from of_device_is_compatible()
 to of_match_device()
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	=?UTF-8?Q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 12:23=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> Compatible-specific behavior is implemented using a if-condition on the
> return value from of_device_is_compatible(), from probe. It does not
> scale well when compatible number increases. Switch to using a match
> table and a call to of_match_device().
>
> We DO NOT attach a .of_match_table field to our amba driver, as we do
> not use the table to match our driver to devices.
>
> Sort probe variable declarations in reverse christmas tree to try and
> introduce some logic into the ordering.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

