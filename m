Return-Path: <linux-i2c+bounces-5430-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0776E95364C
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 16:54:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E0D5285CA3
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 14:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB3AF1A01B6;
	Thu, 15 Aug 2024 14:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="REQX7sLN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDF31A00CF;
	Thu, 15 Aug 2024 14:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723733660; cv=none; b=uJNYA/vw72/WZCrxwqK6qiykkxuZm+rYwD/HW6kWcv5ltbnVFjRTSXtNnFsXmIYxSo43RYHKGOF2A5NSrIYhtSgHqAfxDNbmHj7TIB4HgXjEUhB2bCwoqQ4w3Gi2lNacCJVXXIREMW4J4mSOfrjj8tsY+UXhBs2YULwZs97zC1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723733660; c=relaxed/simple;
	bh=N5GzAMBwVOVz5Gksx2glmA7xSMoNJDGoS8A+EG3foFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LHI9WGFdq96nLS6kXIt4wt8pea64eO3jg4aMb4vrrxksQtWo5SrmNQ165y91Wq0hN8fODLXHySW0gRH/5SdTpt5AElo6GaO24Gwi7Oa9oWxEv0DwTFQdJmuWCRE+hb5LfTCw5/Izlj7jSiXrTNx+ci5q/0u8uo43gW/+rsBy6Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=REQX7sLN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1521AC32786;
	Thu, 15 Aug 2024 14:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723733660;
	bh=N5GzAMBwVOVz5Gksx2glmA7xSMoNJDGoS8A+EG3foFI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=REQX7sLN0U0s1PFUBXedcXnx1iahNnns4xOHygqH8u/0G/duX5aPbm8j09YAwo27U
	 2gWa9ewWRQFTIbU/pMV6tUX83ijaZr+oQkUB5bujRMq1i8zNHtsWbEZhcvzZx70cyK
	 2gkZDbvdzBQFadLZlxjz24z7eoEGHhxTb3t57NJ8okhCFuHlMabUXH8UmQmklBmdjP
	 qniSN4iXFnuBvcTPCaxlf0zdwwg9VR0+JcavuQviDqKuHRn2iKKY43ImS5nkDdkZtP
	 h2Kdx2/MdaRr8gOw0PIw5HSBJ3ofCEU9f2G+KNSaLUj6SeFYpym1CVZYV0hf3PlKvD
	 f30Hb+N72r3Qw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52f025bc147so1160796e87.3;
        Thu, 15 Aug 2024 07:54:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVhobM70q0KmpQkQ1WgfihKcSdprFixXCzkY8IVhbQ1uUD9dtK8aeRJ6hgUsAban6kqc49Zf2Dm7sPX1U4jGmdvPV+jy1s0GxoQZVb8OZmYUi1ZSkOchBdxvk985NJxSSXdeOJcdZxDnf6p
X-Gm-Message-State: AOJu0YxCGeILllNOW16Fzsxt7pqA4e86pYhEtlzQajZ4caMGihR0xxw9
	VQnesplbo9yJUjMy1k6v1nyfJ485T3iEajSwphedEGESNxGykhUgBdRppBdLy9Uup/7b7mKcNM3
	QCoG/Ei3ihufNW97EzMWypXPB2A==
X-Google-Smtp-Source: AGHT+IH7/GMbav6+xg/QumkgeUPY4dtRGZLnp3m8AMWVTt/pwJDae1lnUGZRtfZNSYRQivABHSLIn2fc3sBkvW41Jck=
X-Received: by 2002:a05:6512:3c89:b0:52b:c27c:ea1f with SMTP id
 2adb3069b0e04-532edbcdb37mr4134340e87.55.1723733658383; Thu, 15 Aug 2024
 07:54:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815120935.5871-1-wsa+renesas@sang-engineering.com> <20240815120935.5871-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240815120935.5871-4-wsa+renesas@sang-engineering.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 15 Aug 2024 08:54:06 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+FggVdyJBJ_jA=wfiK87qtwYh42+49Lu2p_mi=_+n74A@mail.gmail.com>
Message-ID: <CAL_Jsq+FggVdyJBJ_jA=wfiK87qtwYh42+49Lu2p_mi=_+n74A@mail.gmail.com>
Subject: Re: [PATCH dt-schema 3/3] schemas: i2c: add generic interrupt name
 for I2C controllers
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree-spec@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 6:09=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> "smbus_alert" is a generic interrupt name for controllers, so document
> it. Introduce also "irq" for the primary interrupt.

I wouldn't add "irq". It's kind of odd in that we have it for I2C
devices in the first place and we don't try to do that anywhere else.

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  dtschema/schemas/i2c/i2c-controller.yaml | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/dtschema/schemas/i2c/i2c-controller.yaml b/dtschema/schemas/=
i2c/i2c-controller.yaml
> index 7eb6b0f..da277a2 100644
> --- a/dtschema/schemas/i2c/i2c-controller.yaml
> +++ b/dtschema/schemas/i2c/i2c-controller.yaml
> @@ -90,6 +90,22 @@ properties:
>        low-pass analog filter). Typical value should be above the normal =
i2c bus
>        clock frequency (clock-frequency). Specified in Hz.
>
> +  interrupts:
> +    description:
> +      If not using interrupt-names, the first interrupt will be treated =
as the
> +      primary interrupt for the controller.
> +
> +  interrupt-names:
> +    anyOf:
> +      - {} # Any name is allowed.
> +      - items:
> +          enum:
> +            - irq
> +            - smbus_alert

It doesn't really matter with the {}, but the 2nd entry is only true
if interrupt-names only contains these 2 names. I'd use 'contains'
rather than 'items' here.

> +        description:
> +          Generic names are "irq" for a primary interrupt and "smbus_ale=
rt" for
> +          the SMBusAlert signal. Other names are left to individual bind=
ings.
> +
>    mctp-controller:
>      type: boolean
>      description:
> --
> 2.43.0
>
>

