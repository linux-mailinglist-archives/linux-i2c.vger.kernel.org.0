Return-Path: <linux-i2c+bounces-8429-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5FC9EB8A4
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 18:49:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6666428289C
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 17:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79991A9B31;
	Tue, 10 Dec 2024 17:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L8shsK9e"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE98923ED5F
	for <linux-i2c@vger.kernel.org>; Tue, 10 Dec 2024 17:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733852982; cv=none; b=P2oNCcLNkTSwbo6mnSHi1+H2VdRcel09PGHbaGgtYBCpLvlTNQp1ELNitnaoch28eXs2xQ/WbAPb10Qh2U/5MBGsstZyHa5Xb0DgzxDXmjQw1qFlIulSmqUnF9SXuZQHyaVUznF3983YjuRw3ozzkZEY5TQ8o4iJP+bTz4HnXyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733852982; c=relaxed/simple;
	bh=zyY+LvfKIlfyAiCLJWS7+1JGxiO0FEIr6sylV/Xgzzg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eNXW+tFMvsu1jsVq4SnRSjj82ENc0xIV2azRC8Whg0SADjQk1hOQdFnnhpHTruqT/OdHL2h6r8xNkLVcgkDFoYjMmOBs3zAFpSqj73ReZv0pY3u5JWe/260p91EwQhoOidqDqTHwVnQVd4m3hkMpsMnPPsbfmBO9KylanlhtgcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L8shsK9e; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d3e6f6cf69so5020814a12.1
        for <linux-i2c@vger.kernel.org>; Tue, 10 Dec 2024 09:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733852979; x=1734457779; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AjuuFtemyP+DI+76rQdawmoZ3eTqeNEd2wfGxX97PdQ=;
        b=L8shsK9e1+QvFx4S24YzNSwySwXuQkmckEKEs80HpC2d/D0cSh7JO5MZZjdPZplwTq
         CvqHjcdd0ssquX4m/4G5RZtA09J2jWhhm99gTX4oMoaMvy2jd/IIMGoWBcFfkYORqCDq
         vRXQBJG7/3MkuTtaHBKm8BD5FEy28GGQb3NYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733852979; x=1734457779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AjuuFtemyP+DI+76rQdawmoZ3eTqeNEd2wfGxX97PdQ=;
        b=kbWPhs9H7db3PB2Y05tMz5//WkqIQzvUwQWr37BHG5jSI+05c1jceUaXWSmaKH94oi
         EhZaZwvkLb7YjaPc24p7xUwOBq8LWKmy1meSUqI7/gkMPXK+HkVF1AkVHi+D6mwLeRVs
         jIwqwvh/Wnm3A1QKvQd1ZgYcJLsu97YhpFaqQREBLi333gTzOHR5q2u0hYZSIXvNeXcn
         gWzKnjr+V9e0c5dSfYd8ec6nATAt2aEP0dVlBEmXpwuwT+7Iq0s28FexLdO+YpxlC1l/
         QK8wymTUCAhrJtU5xVj5l1A22og/ypfgI/byyIks0+SAlJtN9x+peCHEnBshBBIltpTB
         2Uow==
X-Forwarded-Encrypted: i=1; AJvYcCXp+T7ZhbXzIUoiNvSnMvduFBGnGJScW3/IgSL1vhuwUHcygN+LaZ2WjgIg/8MXlfIYspqhoWhDaXg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgZjWq6Ab5kI7oqMeUIPM+ByOKls+xELf8azC3s8uZIds8V7JD
	ATpSZEyZrzHmw31+IaRkjpER4YGug9+KJ75qO3IjcZOSyN6jWRzxVnJsBLWHrZ8GwCPD9YZkWsN
	A+qLY
X-Gm-Gg: ASbGncsO2+mdkwT2Bl2pi9h7s/BCiGbyP0dWTCqyserx12+9eA2SO6bjtou5d80VKTe
	5lf49XBQ1EoVAG5ycY69PzbJVGvHLGhp/dhmmZopaausDdke85783uLWCBECpeq/cKqSfYvJhJX
	gGV6mHl2dBGslrVimAC4SOCgJoWyzfpy56+t20WlJRrOoAK6CK40v+R1LOL1JV4wu+Y2RBzMlX5
	CatcHtBoeKGsSnk2xrlvjgME1A4RWupzN/4lb0Z0eSathOB1ciVUVeImLV5yyNPXRGJ952rKww8
	XK2wh9BzNipmKK5veg==
X-Google-Smtp-Source: AGHT+IFDsAu3n/S+pdqgZRj3+yds/Kya6ckVFlB3iaHLDTAJ2jYJvqR39CBKaMilAqVjD+RON4YDsA==
X-Received: by 2002:a05:6402:2552:b0:5d3:ba42:e9e9 with SMTP id 4fb4d7f45d1cf-5d3be6d69c2mr15650960a12.9.1733852978866;
        Tue, 10 Dec 2024 09:49:38 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3d9e30b7asm5511663a12.57.2024.12.10.09.49.38
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 09:49:38 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-434fe0a8cceso18301735e9.1
        for <linux-i2c@vger.kernel.org>; Tue, 10 Dec 2024 09:49:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUNVOIVXYmuoGa/X1SbInuvQpNgRPtf4Ml3zUoGep8SOuEkb62AtTAnfkIqJFfyHF8Q5R7dc3jVyck=@vger.kernel.org
X-Received: by 2002:a2e:800a:0:b0:302:1c90:58d9 with SMTP id
 38308e7fff4ca-30240ced962mr314001fa.16.1733852563643; Tue, 10 Dec 2024
 09:42:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204150326.1470749-1-quic_vdadhani@quicinc.com>
 <20241204150326.1470749-2-quic_vdadhani@quicinc.com> <CAD=FV=XF+9wxZ5xNtO3Uy8QW9UY4tb+KR46jkondvBeQuVLsrA@mail.gmail.com>
 <6736db20-127b-45c3-ac90-3e3e359c343b@quicinc.com>
In-Reply-To: <6736db20-127b-45c3-ac90-3e3e359c343b@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Dec 2024 09:42:31 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VReNQ3nw+wfZizL7JjxEX9z=GwDEJAFzheNkW7rSrB5Q@mail.gmail.com>
X-Gm-Features: AZHOrDkKw2FmHmZQUJPUfL4ELobjfrjI9icl10Uq0FkzH_2PdMnaEbBKyuOx5E0
Message-ID: <CAD=FV=VReNQ3nw+wfZizL7JjxEX9z=GwDEJAFzheNkW7rSrB5Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] dt-bindings: i2c: qcom,i2c-geni: Document DT
 properties for QUP firmware loading
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	broonie@kernel.or, andersson@kernel.org, konradybcio@kernel.org, 
	johan+linaro@kernel.org, agross@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-spi@vger.kernel.org, quic_anupkulk@quicinc.com, 
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Dec 9, 2024 at 9:28=E2=80=AFPM Viken Dadhaniya
<quic_vdadhani@quicinc.com> wrote:
>
> On 12/4/2024 10:55 PM, Doug Anderson wrote:
> > Hi,
> >
> > On Wed, Dec 4, 2024 at 7:03=E2=80=AFAM Viken Dadhaniya
> > <quic_vdadhani@quicinc.com> wrote:
> >>
> >> Document the 'qcom,load-firmware' and 'qcom,xfer-mode' properties to
> >> support SE(Serial Engine) firmware loading from the protocol driver an=
d to
> >> select the data transfer mode, either GPI DMA (Generic Packet Interfac=
e)
> >> or non-GPI mode (PIO/CPU DMA).
> >>
> >> I2C controller can operate in one of two modes based on the
> >> 'qcom,xfer-mode' property, and the firmware is loaded accordingly.
> >>
> >> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> >> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> >> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> >> ---
> >>   .../devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml   | 11 +++++++++=
++
> >>   1 file changed, 11 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.=
yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> >> index 9f66a3bb1f80..a26f34fce1bb 100644
> >> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> >> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> >> @@ -66,6 +66,15 @@ properties:
> >>     required-opps:
> >>       maxItems: 1
> >>
> >> +  qcom,load-firmware:
> >> +    type: boolean
> >> +    description: Optional property to load SE (serial engine) Firmwar=
e from protocol driver.
> >> +
> >> +  qcom,xfer-mode:
> >> +    description: Value 1,2 and 3 represents FIFO, CPU DMA and GSI DMA=
 mode respectively.
> >> +    $ref: /schemas/types.yaml#/definitions/uint32
> >> +    enum: [1, 2, 3]
> >
> > I'm a little confused about this. I'll admit I haven't fully analyzed
> > your patch with actual code in it, but in the past "CPU DMA" mode and
> > "FIFO" mode were compatible with each other and then it was up to the
> > driver to decide which of the two modes made sense in any given
> > situation. For instance, last I looked at the i2c driver it tried to
> > use DMA for large transfers and FIFO for small transfers. The SPI
> > driver also has some cases where it will use DMA mode and then
> > fallback to FIFO mode.
> >
> > ...so what exactly is the point of differentiating between "FIFO" and
> > "CPU DMA" mode here?
>
> Yes, correct, Will update in V2.
> I plan to add 2 modes, GSI and non-GSI(PIO or DMA based on length).
>
> >
> > Then when it comes to "GSI DMA" mode, my understanding is that the
> > firmware for "GSI DMA" mode is always loaded by Trustzone because the
> > whole point is that the GSI mode arbitrates between multiple clients.
> > Presumably if the firmware already loaded the GSI firmware then the
> > code would just detect that case. ...so there shouldn't need to be any
> > reason to specify GSI mode here either, right?
> >
> > -Doug
>
> GSI firmware is loaded from TZ per QUP, but to use GSI mode,
> we need to configure the SE to use GSI mode by writing into SE register
> QUPV3_SE_GENI_DMA_MODE_EN and SE_GSI_EVENT_EN. This register is
> used to configure data transfer mode for Serial Engine.

Can't you detect it's in GSI mode without any device tree property
like the code does today?

-Doug

