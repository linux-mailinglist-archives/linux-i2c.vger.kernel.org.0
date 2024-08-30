Return-Path: <linux-i2c+bounces-5963-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E62966462
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 16:45:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C47B4B23519
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 14:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E61531B2EF9;
	Fri, 30 Aug 2024 14:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X8hU75Rq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627131B252B;
	Fri, 30 Aug 2024 14:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725029096; cv=none; b=csvKFWy7+Ba7Lqv2oTQ/ExD4ND9bKlrSWg62sIEnZDjOcqqtXtLRuowDFmb29szoj9dgZv14zYgsX/ArFgNhKt9+2VyJG6jdTLSd0GEV0vIihnV8E2F31RoeNbg4nxpDrED2B8lS+uqtdku3fALjEzwx9iCPJD+DU6FD0Tt6pqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725029096; c=relaxed/simple;
	bh=6f2WgrwM+oBYMEbFA/A5ogXzYsctqgEAAF3bpBkOzoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U0+8JWN6f2jlfnE/CKfxCUwLg7427Ll8/09EnwO9VnUlAE6l3Ob0qAT8TdzG3KJ8UqctI97oIjWXiaWO8EQL+TyIs9+OEaXeBy0bsLdt9JAvi1DIfu5IvgAcPljdJBUbcMmJiK5wAzTD7NXoNY0n1PT+FAtmNO4YeJpVe+mSa6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X8hU75Rq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05761C4AF0C;
	Fri, 30 Aug 2024 14:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725029096;
	bh=6f2WgrwM+oBYMEbFA/A5ogXzYsctqgEAAF3bpBkOzoI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=X8hU75RqiVjleNV2CmnO+SkF/2Gn01NxdY0DInl/ArQXvSPxnVAj8dDUcEFMn66zY
	 +3mmWMmWZuwLV241PoaoXTaVJN6okrGd3xlKS4iiQht/2gZ+1eTIyGBx9wKZXvlFGj
	 3piz2KI5T5BE8Udz0v/zWytv1bJWYexgTAtDXUMV7dcCSEhWaBr6Ymnh52s7xOCWi/
	 Rzjurj2cPgwlqVqTjF29w/qxo2ErO2qxkd24o/C9u7tWMTtApIvh7CqiRO5LgTiebA
	 8qN3SyuOnxabblpMgVOvpH7hOYdVFa/2TWorxZVq+PRS7XYrxC5gzClsWNBrdcaet1
	 WKbMGJrZBR2WA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53346132348so2451821e87.2;
        Fri, 30 Aug 2024 07:44:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUtHGLGGQWB4NpN8+TFkHv3tKgTwHMCshJBAdYevdzcFRElqDC3thtrdv/4O/cVhMkgkdiA/Gb6ULw4@vger.kernel.org, AJvYcCUvyLGVtg70+qCaIqX8e8tgJjW5aXUKbTBvOD02f7EEorzw9VpKd+VAr6pnKRnHO9ig6BUg2T42MKEfd9imCDs=@vger.kernel.org, AJvYcCV2yfXRoNw9qOYLx6i7NolXZpPiuZRqAaXsFOUfYNv+XaVZoWZOWeuH51kbMmUqnqllONJ/CgXQMNy0KQ==@vger.kernel.org, AJvYcCV7c23bkeml06Z9T03kidlGbx1icDUCo3iw/q6PtS4Emt5F9ZrH2NQIycCkvzcj7Mz8/1JbSJbdq2U=@vger.kernel.org, AJvYcCVj9FYbbAIT/qwUTYwWdKplR5JfFZDyTepXswF7toh9Kogyo6lXQrpPR55auYH/kpgpkgTGycnNJIaR@vger.kernel.org, AJvYcCW1Bty/9LPUwre2I8eSsqkkbVrU+OIaOQYW6AeO5eU72KsPub8Ri3LMFTjIwwLg/nJCjvpqUGypc6kg+NAc@vger.kernel.org, AJvYcCWDvZ+g2Tc0eU32cfS2KZ7gKKiNNQyjJIVdd627HHTnZDXnumsIusG4hO/UDsBvM9OSN7wJwy4P07/QfQ==@vger.kernel.org, AJvYcCWJde+cuo4yUft1e1TJImgMJkKcstpI1+jYOqrYCvNQyEKX4a3ix1DVmOrtbsvM6gxQXpQq1PI07rHHYZZnVA==@vger.kernel.org, AJvYcCWPmZvJo7dz5Lm+3B1YPMT+nJf8wFoFHKuOLrtVNYpneOisOXl+gDNnfiaiOJR8hYjg9QlVC1dZMAwB+0aK@vger.kernel.org, AJvYcCWUYQyeDAWBGcGe
 VV/ekxnSJMvKmjuEeY5zkri4zwyxEsVpyIXzT0EgDpscv+uO3X1AxNBc8/KFBsm0DkR5@vger.kernel.org, AJvYcCXuNDzqObOPbbapyj+yS64zEkVGxCITQF1cVUXX2lYww86JTMnzmeM1vg0w9lae5MVPmYtXn/UZlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2/V7vkaptSvwm/nhuzNK3FZiC3W+SsM9b/3OjNDKreR3qx7Lz
	DojmKY4pqyBsOCmblwmMYtaRqbwHiAtJYZZaTfo9sXVfyNebgJrowoiNly/Nl+n09uyzXZIq+s3
	CloeRYEOplWbkM/vKwYutQzUIcQ==
X-Google-Smtp-Source: AGHT+IHNK+9MXGVAZLBYt9qXZDqL92+9Mw4J9z0N2JZfmchRYYjKoFr1fQ6DbSfpa5bXY7t46hBzKKVI680zgd+zxWw=
X-Received: by 2002:a05:6512:2345:b0:52f:c833:861a with SMTP id
 2adb3069b0e04-53546bb06dfmr1793360e87.51.1725029094340; Fri, 30 Aug 2024
 07:44:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240828203721.2751904-22-quic_nkela@quicinc.com> <20240829185240.GA914553-robh@kernel.org>
 <de0c40c2-3627-4c63-9112-4eb13cf75c0a@quicinc.com>
In-Reply-To: <de0c40c2-3627-4c63-9112-4eb13cf75c0a@quicinc.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 30 Aug 2024 09:44:41 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKS1pB9GMjEwji_XO_DmrKs4J6GkcxpRkUqcAAHwCseQg@mail.gmail.com>
Message-ID: <CAL_JsqKS1pB9GMjEwji_XO_DmrKs4J6GkcxpRkUqcAAHwCseQg@mail.gmail.com>
Subject: Re: [PATCH 21/22] ARM: dt: GIC: add extended SPI specifier
To: Nikunj Kela <quic_nkela@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org, 
	herbert@gondor.apana.org.au, davem@davemloft.net, sudeep.holla@arm.com, 
	andi.shyti@kernel.org, tglx@linutronix.de, will@kernel.org, joro@8bytes.org, 
	jassisinghbrar@gmail.com, lee@kernel.org, linus.walleij@linaro.org, 
	amitk@kernel.org, thara.gopinath@gmail.com, broonie@kernel.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, robin.murphy@arm.com, 
	cristian.marussi@arm.com, rui.zhang@intel.com, lukasz.luba@arm.com, 
	vkoul@kernel.org, quic_gurus@quicinc.com, agross@kernel.org, 
	bartosz.golaszewski@linaro.org, quic_rjendra@quicinc.com, robimarko@gmail.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	iommu@lists.linux.dev, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel@quicinc.com, quic_psodagud@quicinc.com, 
	quic_tsoni@quicinc.com, quic_shazhuss@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 2:02=E2=80=AFPM Nikunj Kela <quic_nkela@quicinc.com=
> wrote:
>
>
> On 8/29/2024 11:52 AM, Rob Herring wrote:
> > On Wed, Aug 28, 2024 at 01:37:20PM -0700, Nikunj Kela wrote:
> >> Add interrupt specifier for extended SPI interrupts.
> > What's an "extended SPI"? Is this a GIC spec thing? If so, what version=
?
>
> Extended SPI is an extended range of SPI interrupts supported by GIC.
>
> Excerpt below from
> Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
>
> "The 1st cell is the interrupt type; 0 for SPI interrupts, 1 for PPI
> interrupts, 2 for interrupts in the Extended SPI range, 3 for the
> Extended PPI range. Other values are reserved for future use."
>
> "The 2nd cell contains the interrupt number for the interrupt type. SPI
> interrupts are in the range [0-987]. PPI interrupts are in the range
> [0-15]. Extented SPI interrupts are in the range [0-1023]. Extended PPI
> interrupts are in the range [0-127]."

Looks like you should add EPPI define too while you're here.

Rob

