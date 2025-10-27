Return-Path: <linux-i2c+bounces-13840-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60535C11AB8
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Oct 2025 23:24:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6732019C8617
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Oct 2025 22:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90151326D57;
	Mon, 27 Oct 2025 22:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iUNpyqXM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A292E329C64
	for <linux-i2c@vger.kernel.org>; Mon, 27 Oct 2025 22:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761603769; cv=none; b=jGzeWOMwYe7r1QyEOY1AlRxzoA2ds4AMrssB9/Brq35u3Us0K8z+FiMTgflREeHiuvEncnlLOwHIuNQ/bcn41MS9PtW6EF5dj+01c7GlygEsTQJGmS/MfxVzALocng6iGERyEb/cbVUi7mt5XRO246UDrdyFeihSFDLNTiQljhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761603769; c=relaxed/simple;
	bh=mXGvcp0mAGNWE9aZLpOmWkJL3jKzf6jiVNyhGirW+KQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QVsRUswO+m1NdOCbGn0v1yMpv3qeWb7UUvxdiGK2bbw6zCCwCh0YleEySkCQY0VqhoduKNlfwqs/H3qQP4q6evZ9K7iigkxjHJHStRcJ/+ToVUq89wya4g2mebeNi69xs5POvhAhTs84NGjXzLW2bWwwqoVJbr0ykHsl3TNYPjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iUNpyqXM; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-378d710caedso57745001fa.3
        for <linux-i2c@vger.kernel.org>; Mon, 27 Oct 2025 15:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761603765; x=1762208565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXGvcp0mAGNWE9aZLpOmWkJL3jKzf6jiVNyhGirW+KQ=;
        b=iUNpyqXM02B6VYUDMj5GtUHR1Q87dnmmhxn+Y2geUKlYuwXG2XYAkJ/gvy9MSpShNh
         damJTtIhjW/K9XqssAu9JQ5x/UQ0ZKHAM8/31lWHLucugT4tVm+/Ls1j+efnsAwYtrKD
         Ex6fLyfWs1UfeLJ7mYK+FdH0Xy9OaDYbeBr+6xhhWbwXWO5kNwUue8BuoV2tGAMmfLGk
         RG84uY/YH4u3qkBfVAqx8jUEcwtTA0+Wpf8gxP6W/s9jb41F9mQPcL2NX6qkhJI5HqsE
         xDpyj/KagzyEZOlJBGJdsM5vxD7hwSzl+6/uqqqqiHRHktDeiAb9OZprzmAkoVuN8Vgz
         EJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761603765; x=1762208565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mXGvcp0mAGNWE9aZLpOmWkJL3jKzf6jiVNyhGirW+KQ=;
        b=eumzXqTYIon7ftIzOPQIe1XehxYaZ2TNXk7kocyc/7aL812sN1nP22DveurOZ92zc0
         GudbAOxXKc13LC5HgH8e8c3wM+CkCAkmsTt+QZP/x0zwVfw+oR+c/CtLcnl09uHEAxwE
         nS/l62lEtyA7p4mwKTNNe8pHHcRWt/bqkP9T3n5p7J6F7rrsk52RdRSdE182vmQIgbRY
         BRLfkwTTVgROiD+SOcIrUIkvxLh6ZDQLGGWY0YIIg4SGtA5Y9okQke6sCsZuSIaTpUai
         IKJEqkVOlx4J3D9xuK2cZKFCnhFS1B1TfnEW9CsYvPSLPVnZyi23AyArKdQiZsuPVIiq
         CckA==
X-Forwarded-Encrypted: i=1; AJvYcCXFKXPXjOQvnnpJL4h2Q335nOXAejepQYbYxGdw3plfCwQLtHxnsSh77VbITqABaP2u3SqE5k3BKr4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNrLTrT29z9a+DgMZ3X4VW+cCXr43KVs6i/Gag4P8aNJW7OMON
	xhC8P9FN6tgx2lxKQc1/xBxsStNvGYXT6ql6LSDVn6EF1Z4JojLAkEdPGARKEsWfVvxAV5sHsK7
	lW17gFqmNDOtcP9wUW+q5fXdj0aYsmh3KebyqlBW03g==
X-Gm-Gg: ASbGncuWQHtBiiQggWrNf6u+W0bOgGT3z1qKEj/Xf+axtAvWTM7Ab2w7ZewRdQBtFkQ
	msbbssubiND/+jPxBxMtJcd1+rEFY01hLG/Kj927W/9TE7hRKZbx/o1JUNfHGROc2JZyfkq7gtV
	4GAxRGpHrPBm84CIVEIqzCi37D7D6XCjmc6dR+zilydjhSiuOmu5w/bUpBXnQ11YPNw+QBC2smE
	qZBBZ+57rn4MkVE1Obuk/QWgI6ayXr/IECr0mbBkgb7bqmGsxM8n51lbUj0ip2f8LWuLQw=
X-Google-Smtp-Source: AGHT+IENAbbZLs2cyhX1NG2TDFVr4DwoM7AOuX8MbllL6Bct/y5S8yxPyMTw8+JJ+2TJ6jnQOkcpn7hnhHqJSRfElWE=
X-Received: by 2002:a2e:87d4:0:b0:376:4c71:75 with SMTP id 38308e7fff4ca-379077ddc2cmr2613171fa.46.1761603764869;
 Mon, 27 Oct 2025 15:22:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251025162858.305236-1-yury.norov@gmail.com> <20251025163305.306787-3-yury.norov@gmail.com>
In-Reply-To: <20251025163305.306787-3-yury.norov@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:22:33 +0100
X-Gm-Features: AWmQ_bmkn6Wyph29A9p5imLlQFIsc9_UvxXx9DMK2tf4nubU3-p4iTlVFjOP3js
Message-ID: <CACRpkdZZdBL4ii-ZR5ATOx-GCw7Un8vEd8koqWK7cbgTXNPmBA@mail.gmail.com>
Subject: Re: [PATCH 10/21] i2c: nomadik: don't use GENMASK()
To: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Cc: Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, 
	linux-i2c@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 25, 2025 at 6:33=E2=80=AFPM Yury Norov (NVIDIA)
<yury.norov@gmail.com> wrote:

> GENMASK(high, low) notation is confusing. Switch to BITS() or FIRST_BITS(=
)
> where appropriate.
>
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Link: https://lore.kernel.org/all/CAHk-=3DwhoOUsqPKb7OQwhQf9H_3=3D5sXGPJr=
DbfQfwLB3Bi13tcQ@mail.gmail.com/
> Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

