Return-Path: <linux-i2c+bounces-8336-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0619E4572
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Dec 2024 21:13:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84086BE1649
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Dec 2024 17:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2894217647;
	Wed,  4 Dec 2024 17:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mcGJHurP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E8520C02C
	for <linux-i2c@vger.kernel.org>; Wed,  4 Dec 2024 17:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733333171; cv=none; b=k+Cp9vSKeiaZUvn8uF8lrkcvC17AwLv+J9WhhK/61+PqLiktuRMw4477mVZThnfk+p38XIoWB0NyxDFurWHc0bHC3pLB6/T9Sfc/Q/wgHMJRKdTtyCvtzHwIhoG02YBpNOMksTVWgjBjvKLcmHI0+WnPR2mwxttbierS+EZ7xFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733333171; c=relaxed/simple;
	bh=3XOKyfOtCe+byiVNEcWIU0XMb6iWf0YuG2kDOBxGSKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y43U3HeYD82tB/dWIG+jzm5re7VrVo5Rlvqi9vdEZMZg/U0OyT2BNb4oO0Bdu+FRvIoki4nMIh682JS1XuZM8Wn1u/mFDhYxJz+tb3TFdeGcgpbClprbWKL/a9XRcAq0RiFMTFtfY/lO2ZQx5/P7JmpFQV+xkluX5w57FB+4QSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mcGJHurP; arc=none smtp.client-ip=209.85.208.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f193.google.com with SMTP id 38308e7fff4ca-3001b14d696so5619611fa.3
        for <linux-i2c@vger.kernel.org>; Wed, 04 Dec 2024 09:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733333168; x=1733937968; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wcxUVGNwDSHYT0cP1lB+JvbULa6oEpjDSAOsUsCsW1c=;
        b=mcGJHurPFhyWZrzxsqhe3WqxFJ6pLKqpNZR9oI+eEzSGuu+sDvSvgQMRio6kGjgH6a
         KZ4dF6e1XOqzPO6uGws0h5EMgOQFmNHFxT7lLtBkfc/xsdSL9zJ8Ek+o+/fRT1jHYEmS
         SaB8m20QSdJbwsZkI7de/iKUf5IZGfww3N6JM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733333168; x=1733937968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wcxUVGNwDSHYT0cP1lB+JvbULa6oEpjDSAOsUsCsW1c=;
        b=CEB8jiWn3Yz+us34J0wzKU88R8ThiDtRDEj6IFi3uwRigF6M7h0KiCwaGZ7jPJ4mRM
         qS6pZnkJ0CG/Pi4GHrkmN36wJD2nstNT5lk9lJrtxgg7aYe+Lfv8aVYVj1zfq7o4gGz9
         GBdcmys4Cf0KxHYknmwbW6umltq6fBwoQsLey/V2qvhd+MZrVuzZiR6nv5UF2Tbd8sQm
         T0FdPixWYTNXcmfWdAVkHh4sbg8hFrEWnPYz/rzgI0QDQ4khMXgSQYbHfDrj7VLUAUqQ
         pAKp/afVcxaJGKodMbe8SPtCTcMOIC6PRDgyVTXN/kdfplSFTWJ6kcfucGBx6fNp1xd+
         fRrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwH6Yfa9BztGDNoyvxMIBLE5iOgOiTFoyqpX/hJmOUFf6ICXBbY024DWmHVWr0N9hxa0dz++xahD0=@vger.kernel.org
X-Gm-Message-State: AOJu0YycZF/kZXTEcT2Sqg/ALVe3IR+9Lsj38/RgJFoP8dGGJlHDLbp2
	4yeFeG7lfPIiTycGILMgwu58KLT2+aMvNEmD8B2PeJQEjZIJ0AEIqi/ef6dKDTN1E+sGhbTcMla
	UBPzj
X-Gm-Gg: ASbGncuK65N01vGjs3kL+jX+jV96JEcDlAwO9QCTinQGSzVXQSGdKO4JfXCNssWx1Yl
	RALV/FKZwC/+76Ql/+qZW5Mq3VmL2mA5KazYrOPexaaxVSXFURTp5pQM5dRWz8Gk2JEMUsR0SPx
	qSlm1hC1rZ4xliTh48zW5lYBuMstoIBcvY2QA/mQoVmIWZJJunov+olW5Hv8PuXqXqg6DW7QzMI
	iiJ2SoDvbE9ecp121OU8tGi10FGmJv2pk8UnwbtwKsUGiJQD0RNRbv3DVyFVw2e6IVojDAUh9CF
	00MjdYj6ptBjIS/bRA==
X-Google-Smtp-Source: AGHT+IGnIdA58HLe06/y5cpSUerJqWbTKFt573XZNazP6B7C+ck+83uTMNNVP9muAE+gSqdEIwXl0w==
X-Received: by 2002:a05:6512:3ca4:b0:53d:d431:74fc with SMTP id 2adb3069b0e04-53e129ecff2mr2730337e87.10.1733333167802;
        Wed, 04 Dec 2024 09:26:07 -0800 (PST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e216e847bsm16095e87.211.2024.12.04.09.26.07
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 09:26:07 -0800 (PST)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ffd6af012eso82352091fa.2
        for <linux-i2c@vger.kernel.org>; Wed, 04 Dec 2024 09:26:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVoFlZZevg8wt8yya74Xx3Ged1d8Q7hmj5n9nPY2H1j3Bhb+cA5clf1RKSycy0QYeFZ8Kl3FINiyOg=@vger.kernel.org
X-Received: by 2002:a2e:a108:0:b0:2ff:c027:cf5c with SMTP id
 38308e7fff4ca-30009c3f871mr30428561fa.16.1733333166812; Wed, 04 Dec 2024
 09:26:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204150326.1470749-1-quic_vdadhani@quicinc.com> <20241204150326.1470749-2-quic_vdadhani@quicinc.com>
In-Reply-To: <20241204150326.1470749-2-quic_vdadhani@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 4 Dec 2024 09:25:54 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XF+9wxZ5xNtO3Uy8QW9UY4tb+KR46jkondvBeQuVLsrA@mail.gmail.com>
Message-ID: <CAD=FV=XF+9wxZ5xNtO3Uy8QW9UY4tb+KR46jkondvBeQuVLsrA@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] dt-bindings: i2c: qcom,i2c-geni: Document DT
 properties for QUP firmware loading
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	broonie@kernel.or, andersson@kernel.org, konradybcio@kernel.org, 
	johan+linaro@kernel.org, agross@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-spi@vger.kernel.org, =quic_msavaliy@quicinc.com, 
	quic_anupkulk@quicinc.com, Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Dec 4, 2024 at 7:03=E2=80=AFAM Viken Dadhaniya
<quic_vdadhani@quicinc.com> wrote:
>
> Document the 'qcom,load-firmware' and 'qcom,xfer-mode' properties to
> support SE(Serial Engine) firmware loading from the protocol driver and t=
o
> select the data transfer mode, either GPI DMA (Generic Packet Interface)
> or non-GPI mode (PIO/CPU DMA).
>
> I2C controller can operate in one of two modes based on the
> 'qcom,xfer-mode' property, and the firmware is loaded accordingly.
>
> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---
>  .../devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml   | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yam=
l b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> index 9f66a3bb1f80..a26f34fce1bb 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> @@ -66,6 +66,15 @@ properties:
>    required-opps:
>      maxItems: 1
>
> +  qcom,load-firmware:
> +    type: boolean
> +    description: Optional property to load SE (serial engine) Firmware f=
rom protocol driver.
> +
> +  qcom,xfer-mode:
> +    description: Value 1,2 and 3 represents FIFO, CPU DMA and GSI DMA mo=
de respectively.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2, 3]

I'm a little confused about this. I'll admit I haven't fully analyzed
your patch with actual code in it, but in the past "CPU DMA" mode and
"FIFO" mode were compatible with each other and then it was up to the
driver to decide which of the two modes made sense in any given
situation. For instance, last I looked at the i2c driver it tried to
use DMA for large transfers and FIFO for small transfers. The SPI
driver also has some cases where it will use DMA mode and then
fallback to FIFO mode.

...so what exactly is the point of differentiating between "FIFO" and
"CPU DMA" mode here?

Then when it comes to "GSI DMA" mode, my understanding is that the
firmware for "GSI DMA" mode is always loaded by Trustzone because the
whole point is that the GSI mode arbitrates between multiple clients.
Presumably if the firmware already loaded the GSI firmware then the
code would just detect that case. ...so there shouldn't need to be any
reason to specify GSI mode here either, right?

-Doug

