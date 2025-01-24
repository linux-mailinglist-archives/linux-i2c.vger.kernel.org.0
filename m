Return-Path: <linux-i2c+bounces-9190-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFBDA1B9BA
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 16:55:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78C523A576A
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 15:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F80158A1F;
	Fri, 24 Jan 2025 15:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s7zZ3quV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DEB158555
	for <linux-i2c@vger.kernel.org>; Fri, 24 Jan 2025 15:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737734134; cv=none; b=BS4znLYgUyztYrUYC0vTZc3hFrOzfX0IUyw6J2JqetjJ30t6rBzMz3vLZGVO7KYNAMwUy/uQt/+z2XtfIYZtPhSEZUtAXfpPy5pdmpgKGeE2rIHSlDSzSDZWsOo+wu87e9AiQZGLTQ1sLUp7nnKZlg48pPWbmiv12g0gb9muJds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737734134; c=relaxed/simple;
	bh=s/jO4NPWKOieyxzi6luyHh+P5ju9zoKIC7bH0SB8o4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S9yr+Y73MpXrfR9hX1ttiMssqiY1mWrTjRVJoww3vul3v/2Pa41us8/38RYosvIxLgXA/CZHOpkYFXaITbJX99WhdFGz2yFFz0NTJmb9vUnar8JRagLVwqfONWgsDcqNBwwYCRbWdNY+LDvqayElCMPgUiZ4DDInRNKnB4Evz0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s7zZ3quV; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e5447fae695so4077411276.2
        for <linux-i2c@vger.kernel.org>; Fri, 24 Jan 2025 07:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737734131; x=1738338931; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ilPZPULNnLI6UK/uv5dVV+2Dss3A/uBmwkDVQdaY3K0=;
        b=s7zZ3quV6sSGQi23hJ8dEM4EP7tlS0VnAiaxBv3lK2wpY8qVBS+nv0u+LtSgG3zm7a
         3jC/AeebNiMJTjl0CVRjs0C+ZCprv/VSwLRNaAB+dBzP91o0J1unli1foSINTUIjCnrN
         WHlsm/odmDIZNdqV4J+p6YtC9wuZ+t6FP+ZlBqLaLju/eWO3BGhQmaL8HMcSn3NxA5uM
         wozOiTvrTWMH9N0FeRUT9N3m3ZjyqmTfRJlH4vvuzIdATqdDi3VjBVvW1VdVijcrWkOK
         N5FZhjLj2bhGl8EF8f1n+WVssM5PB9NIxCkKwnRfCaN37YqkH2LBT4uq39WZsLnGIbfF
         Dgpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737734131; x=1738338931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ilPZPULNnLI6UK/uv5dVV+2Dss3A/uBmwkDVQdaY3K0=;
        b=hmanpxaVNcXppsRgwmaohsOF+kPZ2pIY/Hylmi13KWjsik6bEyzITxjmhf9a2VrMjf
         aKLj7YLOatun0qopK/dJcooGxFZ4c7+LwYekWU3wa70/nhwKhx8KJhZFdqVmPUr5bgeY
         SouKKtJ+eM/QTE5jB0Mk5ksryW2DMTCUTLNPZnCYH3q83y/KGq9esvF6OE2Bs0mFwneO
         yFFXuAW9NOvS1h9KxWKtNp3sKT3SbhIw+D15fZnR9JfkIjyS5hChs5ERfolTcRUFbezj
         K833mB8U8qZu/fM33qdmUHkMvfVec1x7FQ2tFEZ8dFF006DQQ1YJSkL3kdvnB7Ssitf1
         hl6g==
X-Forwarded-Encrypted: i=1; AJvYcCWTC1LGFIKfJumvlVeDZpUhOFyb7UT4q6QdrEUgzwuWHqNlvQ49kBAKM98dSKDIYC/Wo54eFyjqlpk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8J9Xh/nIHeqHheZ/VM2m02wndMWcksrJMwlgQmANeewgeGrm7
	eg9Iw7Bk9q3GWWuUVi6CoapxpQhdXdfm1GN/QmQG6B+y5SSOtJr9bEe9xrFoPFc4topU6PiFvvC
	usroHwGJzoKxUWiBKv5fxfPD4H3yJ7oAxV6nvVg==
X-Gm-Gg: ASbGncvXpFPluyOQYosXnCN5EuH3FwiJE7tAt1ADsnvADabnqi6fW1oYyigFaIpKyr5
	ixrdaCvvpDH7lJ3hMCst4T7jAaPEJS02XEVnR3jV+hlrWMlH1adeY7Bte4VpetI4p/JENCQpf/D
	oiMACgY0u+EcMs0zhOjQ==
X-Google-Smtp-Source: AGHT+IE5CrP20lwY9b957F+q8FfX4UrWyqpcD5u1RzqaZ3UIpMjXmbJiX0igSbAvphxXL+FBMTlukLRROvc9N2dsUB8=
X-Received: by 2002:a05:690c:3701:b0:6f6:d4bf:d01a with SMTP id
 00721157ae682-6f6eb940fb8mr246220177b3.34.1737734131503; Fri, 24 Jan 2025
 07:55:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250124105309.295769-1-quic_vdadhani@quicinc.com>
 <20250124105309.295769-7-quic_vdadhani@quicinc.com> <d3tydp3m7pehhiphupwybjlol5v2u3sabqotqximxmnswjlczb@jmdzpbrcrgou>
 <08545d45-bfe6-45e4-b7be-503c318315af@quicinc.com>
In-Reply-To: <08545d45-bfe6-45e4-b7be-503c318315af@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 24 Jan 2025 17:55:20 +0200
X-Gm-Features: AWEUYZm4pYCNJdHGiPnsyF_MnRCwaJQzJ4L3pN0DCmSTM3Gxdme16eoXtL4QfTk
Message-ID: <CAA8EJprSZx9Bx7EXA_RpwZdhieOLtrTARqXSuo-gO9sVMdK5Qg@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] i2c: qcom-geni: Load i2c qup Firmware from linux side
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	broonie@kernel.or, andersson@kernel.org, konradybcio@kernel.org, 
	johan+linaro@kernel.org, dianders@chromium.org, agross@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 Jan 2025 at 17:24, Viken Dadhaniya <quic_vdadhani@quicinc.com> wrote:
>
>
>
> On 1/24/2025 8:34 PM, Dmitry Baryshkov wrote:
> > On Fri, Jan 24, 2025 at 04:23:07PM +0530, Viken Dadhaniya wrote:
> >> Add provision to load firmware of Serial engine for I2C protocol from
> >> Linux Execution Environment on running on APPS processor.
> >>
> >> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> >> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> >> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> >> ---
> >>   drivers/i2c/busses/i2c-qcom-geni.c | 7 +++++--
> >>   1 file changed, 5 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> >> index 7bbd478171e0..9ad3b8c9a224 100644
> >> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> >> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> >> @@ -872,8 +872,11 @@ static int geni_i2c_probe(struct platform_device *pdev)
> >>      }
> >>      proto = geni_se_read_proto(&gi2c->se);
> >>      if (proto != GENI_SE_I2C) {
> >> -            ret = dev_err_probe(dev, -ENXIO, "Invalid proto %d\n", proto);
> >> -            goto err_resources;
> >> +            ret = geni_load_se_firmware(&gi2c->se, GENI_SE_I2C);
> >
> > Hmm, so if the SE has been configured to e.g. SPI by the TZ, can we
> > switch it to the I2C?
>
> No, in the current design, TZ will not load the SE firmware.

But that's what your patch is doing: if the protocol is not I2C, try
switching to I2C.

Instead it should be 'if unconfigured, try loading I2C'.

>
> >
> >> +            if (ret) {
> >> +                    dev_err(gi2c->se.dev, "i2c firmware load failed ret: %d\n", ret);
> >> +                    goto err_resources;
> >> +            }
> >>      }
> >>
> >>      if (desc && desc->no_dma_support)
> >> --
> >> 2.34.1
> >>
> >



-- 
With best wishes
Dmitry

