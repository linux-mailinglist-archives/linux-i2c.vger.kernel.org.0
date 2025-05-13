Return-Path: <linux-i2c+bounces-10968-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2680AB5F1A
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 00:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A36E19E53B0
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 22:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3EDB202983;
	Tue, 13 May 2025 22:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WmSzGKPn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6123202C48
	for <linux-i2c@vger.kernel.org>; Tue, 13 May 2025 22:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747174275; cv=none; b=S5H1hMWMZpkmYQyxWmru6DDVVXwl23ExTNP9HQPxlBSzyllhrktjKiyTFi8egrAT8PHI3Kewt2njTZ/wwKMrUHUxJXPv4SwkK1MjRaf7L1pR+SUdy2mXw1s/O38Z0PJ276Fp00ZdIHqqhdkI6zXOhtvD40b9MLCFwS0YpGdWEZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747174275; c=relaxed/simple;
	bh=B6SmBreUkX3+60JHN1tYU+3XaeasrQxdRfJLg0O0vxY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u/zPg3qRnkm47vSYPtELP3bS6tHHp6adNC7hkT/OIgv2JgT9wfdGGqhgSYgesFP0X/jcFS6wIssYLswpvMz7Zh91J8lOMHLP98EJ7FNUqGtCvNJvXqfsh3aBFW8oX7gEN6RvJ7QD4YbgyK8qZps/2mA1yjUXpxB0THzrfd/Dm5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WmSzGKPn; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54d3ee30af1so6547077e87.0
        for <linux-i2c@vger.kernel.org>; Tue, 13 May 2025 15:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747174271; x=1747779071; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yS05p68RgCm1KQM4IVX709VfhyCpRxVf4KbxCq5pBmU=;
        b=WmSzGKPnvO31jHdaktHDWf+j7/1vXdRcGumfRmXcVREYlLMnQsbtR6V+woIs6sN1LP
         hdVVDOuSjosqzr3juEFuK6i7UVwS0gCSJpy0z+8TB2nwxzBIAbBFNboUxvLWG2SKMBnw
         09SoqkImVahr88YiMapf+AznSnifJSYzRT5yBIrkh6eS4SF5s/dgDCAiLJfWEX2tBr57
         9QivdhSkViasjTwRCS4+Td0dIrqEOU+5XMVJW/bz8rxtitXgBRv4Iz1LL02CtxsDsFcO
         9svoYd2xlGXNbJTPI4VgiUvBot2R62ESBGOZQvqyoelJbYEmKzVJsYP5VeWClw4awzXf
         +h9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747174271; x=1747779071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yS05p68RgCm1KQM4IVX709VfhyCpRxVf4KbxCq5pBmU=;
        b=JHSWaHCRyp0hY6Jqtvt6Aa4lg+ylQUw63oSqu1qC7t+BwWrFMCgy7SKC1MnSgeBAmK
         mG5PXASf9Ko8w9pcELi5rP+Tix9Ewtv+ym/GaAe3jUZW+QG2d4lrJz3hF5tTsVOg2Pnq
         /bRUXDFpSNJ5AT1PQME6Pnmu3HN5Il7nOnyu3Gtvg/BbzM8BXxyrv+lGBdJQn5FICAea
         UT5GJ0xceLoAFt4/Ta+LynmNzuqfWBqJLiUqhTw2cx4QbyqWCGYqTAhhVCtzGw+dNQRU
         mZJkjl8KL78oXpAm3l0YA5gn+NbUYyNe4/vgsNS7SZ8SDmUuNHga6H1C8BjKbpS9fj6O
         GEpg==
X-Forwarded-Encrypted: i=1; AJvYcCXyFmb9BEVb2dCpVPqC4U+1u10bqge44bpIQnIDtKRZRXB+f+V0Vra8C5UNMMhuHiOfWichhPTMfW4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOaTkaZfCkFeK1jvzWaGVJfCxvrqxp4m4QO5U18qAYpaY5YAAH
	lHQLHChJsSfPvP3tfHVFu2vg1iT+PmmF7H2IP0B961QDjhYQiDm/nGZmiD6L1r691LvfA6TiYdT
	oqGBUMYeda2IwxXkNBjpbYtY1OlKOJgC2b9cCRXrMGknrmm++oOE=
X-Gm-Gg: ASbGnctIyKGZZ5hjz+IBq1+HTlbtqzF2fswe7s3YRQWMTtrjKk7Puj7XoRb1W8BelKc
	b/dg6ja8kx0gH8XWgrAn78i0W28TeECMxDgpOaUh4j7iysmzvYtFxTXrfhS2StIHV2IUn1dm5cJ
	MsvnWsGvjxNg07zqaPSzkIDanNLPY6gwtD
X-Google-Smtp-Source: AGHT+IGRr3T8GwayN3B9LjUytrEPhRn7z0HDPerWlpLmMyRvIP8vTM2O9gtm1A9BosvwTtPlXZUNuV9j8XNEy8jjR3c=
X-Received: by 2002:a05:6512:3c87:b0:54e:859b:b9c7 with SMTP id
 2adb3069b0e04-550d5f94c3amr421155e87.13.1747174271003; Tue, 13 May 2025
 15:11:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513123754.3041911-1-ruc_gongyuanjun@163.com>
In-Reply-To: <20250513123754.3041911-1-ruc_gongyuanjun@163.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 14 May 2025 00:10:59 +0200
X-Gm-Features: AX0GCFuQngwboZEBCreobt93CRa_6UNA_ClKESOHzGvUNvwNyFMuQb938KmpX2E
Message-ID: <CACRpkdb6-cjyvXornKcVrYSRqJLE3LqtzotwapHwrYGVm4RNDw@mail.gmail.com>
Subject: Re: [PATCH 1/1] drivers/i2c: fix a potential null pointer dereference
To: Yuanjun Gong <ruc_gongyuanjun@163.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 2:38=E2=80=AFPM Yuanjun Gong <ruc_gongyuanjun@163.c=
om> wrote:

> Add check to *priv to make sure the input *dev is not NULL,
> and to avoid a potential null pointer dereference.
>
> Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>

Why is this a problem? Reading nmk_i2c_probe():

        priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
        if (!priv)
                return -ENOMEM;

OK so priv is not NULL.

        amba_set_drvdata(adev, priv);

It is unconditionally assigned to the AMBA device.

Surely runtime resume isn't called before probe() has commenced
successfully?

I don't understand when this condition can occur.

Also including Theo on this, he is the major industrial user of this driver=
 now.

Yours,
Linus Walleij

