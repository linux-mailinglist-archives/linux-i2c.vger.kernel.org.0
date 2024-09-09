Return-Path: <linux-i2c+bounces-6408-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3390971A53
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 15:07:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91EC4285F7B
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 13:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F201B81D6;
	Mon,  9 Sep 2024 13:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N8ND7XjX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC521B3B19;
	Mon,  9 Sep 2024 13:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725887247; cv=none; b=dI+6rFmdlvqnjyzUNknsDrwj51JQ117D4tuXpRKdxrUFlPrJfqSB50KuaGhurlCkVTwPDyQHvjjm3KWCA849NzX6Xn79h5+Y8ogeXuXXgdE848pbhlyQX88dI26X96CEjetjg1THwwONflcS3bfImvLgDj9neEE6y/W2mU7QtOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725887247; c=relaxed/simple;
	bh=ocUGvsi8EaoQ/mQuLJ7GHiw64nOgwqAG+6IpcIsd0KQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fK46In95YsTlWcndPMBkCaSoLWAJgwtslg3ykiHbxToNZYQOVdHmcLaSjzA1huj4b/hJZhvg1hHsMnID+/L263wYhNWGwkwDcCVjPep0lUbYa1ZzDTilrWPGgQd351oHGldv6dclY/0BmbBD4PumPzvuFKg82ttcS05r8DrCaK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N8ND7XjX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A6DC4CEC7;
	Mon,  9 Sep 2024 13:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725887246;
	bh=ocUGvsi8EaoQ/mQuLJ7GHiw64nOgwqAG+6IpcIsd0KQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=N8ND7XjXAV8sZXRus3Y1jVlLTP7UpROW2sWOsGcIoaMJ2qFN/LW4XHAOsZcPMVEc6
	 2NcGdUXvX3PRPDZEREVr2tlEwKVkm1i0tmxyl8yAyVbkZzAnkQKB1GLMYjGBRvxiGi
	 Z9bBPi6UfLWr+QSmjMsX1nSC3skT7DK7hQ2V3vGUYN6WenflW9i56GpEnAMNhI71Ny
	 /ig6MjQjiZoFk9AZXPnXuRPrMbRxeUxexUuSKPQvpwKFRdqC3UiZJDbcFiSiuItvc2
	 +NUhXXnbl8hyRJ5Ez+WKuAxfH119jKw39VDL9EDsdd4/LlAc5YcGi/CQSx6/pU/AdA
	 sOjzVzoV1cgnw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53653ff0251so5125148e87.0;
        Mon, 09 Sep 2024 06:07:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXHX8Cvkr/cQm/mrppGYViZu/wRFckJLukRLAbwSvyVIBwVWIjjtwruhwKmJBVxc4rHI1kf4jQzP7qFA3zXgN0=@vger.kernel.org, AJvYcCXu0dLFEVpnxL0lNbcqy+rVN7bACoZBir80+KmzVcj9uPLPklQbVGhED/kxrdoNjRi+11Q/PvqW+B29@vger.kernel.org
X-Gm-Message-State: AOJu0YwADU00mG3oB9lqRMDHLY2k9bWf9aLgaKCYRgh/d682RbfZlVOv
	u0j6TE2NveJgrxfL9iQL2ngDaP2ys/MT2Si8/Yd7U98dPG7n0Ji2kjaCPlGxLNtrC1UZx909aEG
	sOhGvoffPMq4utJ+NtfZR7MCVbg==
X-Google-Smtp-Source: AGHT+IEc6jfss0Xs7RGRmd+2uE00bQhxJjnT7Pw+/hsEOJy1y7fCKpKb0MCZQUld9qRyWALoDZNxzWfaikgj2A75tMk=
X-Received: by 2002:a05:6512:a92:b0:535:6cde:5c4d with SMTP id
 2adb3069b0e04-536587a79efmr7707595e87.3.1725887245131; Mon, 09 Sep 2024
 06:07:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240909105835.28531-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240909105835.28531-1-wsa+renesas@sang-engineering.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 9 Sep 2024 08:07:12 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLui9=K_LdAoEAibxRo30_2ahdGXhCW50ow8rcqCp6jZA@mail.gmail.com>
Message-ID: <CAL_JsqLui9=K_LdAoEAibxRo30_2ahdGXhCW50ow8rcqCp6jZA@mail.gmail.com>
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

Most GPIOs are also interrupts, so shouldn't the existing binding be
sufficient? The exception is if the GPIO needs to be polled.

>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  dtschema/schemas/i2c/i2c-controller.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/dtschema/schemas/i2c/i2c-controller.yaml b/dtschema/schemas/=
i2c/i2c-controller.yaml
> index 97d0aaa..487e669 100644
> --- a/dtschema/schemas/i2c/i2c-controller.yaml
> +++ b/dtschema/schemas/i2c/i2c-controller.yaml
> @@ -135,6 +135,11 @@ properties:
>        use this information to detect a stalled bus more reliably, for ex=
ample.
>        Can not be combined with 'multi-master'.
>
> +  smbalert-gpios:
> +    maxItems: 1
> +    description:
> +      Specifies the GPIO used for the SMBALERT# line. Optional.
> +
>    smbus:
>      type: boolean
>      description:
> --
> 2.43.0
>
>

