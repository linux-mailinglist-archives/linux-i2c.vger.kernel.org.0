Return-Path: <linux-i2c+bounces-9219-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62159A1D84D
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jan 2025 15:27:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 345121881A6E
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jan 2025 14:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0401D1078F;
	Mon, 27 Jan 2025 14:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N/MxKlNW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9E42AD25
	for <linux-i2c@vger.kernel.org>; Mon, 27 Jan 2025 14:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737988034; cv=none; b=sWxmhZc4ZyqrJy16G8NlbvnHPK5iQlzuujSA3Oiod1dAps8p8uqtRpjNGQwYFkSG9DuMO6RomYPkNqnmS99A1xYdTF9WN0Ufrylq/7zgzFbpXpCWFyDmYJFURjGQ6tytpC6KPhUhiqHzoQgiEzKMOSqSjctqijmHz+l/0wvefUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737988034; c=relaxed/simple;
	bh=v86r3EIlz1+h3GOoj/7Oe+SvuDCoWXauHahA8PSsQ9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s9fiXucu01GCAY8ezuPqf2JzPrLkKRe0k3PMO0v0E5m2loD0Z8leQoN4LrvE31Tx2DKlADEJPeRk1V0UbPCnU9EdK/+ll53vbnNjTQ4fVV9lxGMVxdSpXGQKzVVDtuGdPICvkwdUCJ/DcuIkkOiP3OAPcFODyp662bpX4ySrlfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N/MxKlNW; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53ff1f7caaeso4533219e87.0
        for <linux-i2c@vger.kernel.org>; Mon, 27 Jan 2025 06:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737988031; x=1738592831; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tzvLpRdV8RsEmkfgVe41djDQCfra04Tf73tKiUg1ifQ=;
        b=N/MxKlNWmnaK3MPmZ+WC4ILOhFU3ZNQbxT1HssjhXgIYj0GI1fe8N9HnWvpDdKXJcp
         RQyqjR0RQvjOGLiTGjLD4kfH3cAtXAtKDLaLuwan26G2rP3WIAlXU1haB+QgRPbmGJNq
         sDMNjmi5B26TBfPHRtd95cpthOVsGKBdhLYeWQrYtXLLj7Bndw/RG4ISs2YV2PBTR7uy
         H4OrS9uOQ74sELt5al6DjbXzxu0s+jE/kQUC46w2ZXubIOIlT30aShhTXVDWRiMczVE2
         fLldxi74oQgDIA/+0o16jqCHQKCOP64tVFz6Qv0iJFlome98BlIIyIEqJQkJWh31NFEK
         IOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737988031; x=1738592831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tzvLpRdV8RsEmkfgVe41djDQCfra04Tf73tKiUg1ifQ=;
        b=myZelkM9hbr1q0vR8MyVUf1uFEe5pRxMDjHmk+TMJecWmMWPorkg3jhVGiAXoWoB8E
         PeT6RcVsBFZ4fN2Tm2AM1BsfO1gM4Uayqa6R6tHaL2I1VUO7cV/4NSrAdF22CKwOY9i9
         VS0F2ot1YpfF+ZNu1B2wa4m1Y/mf7nQrkIGnkQP36OiU19R5O07NYoA+mDJimn2/mZjP
         R2/l/5EIZQXqT1DcN+Qpt7feOnRYj0e5IMrVzC386LzEUkN/gtf1KiWscb5OygroJAgv
         y8lW3GelwHd6Uew3/I4tSNo1LVXnqpCgLOole482pQcaGOrJPGI7PXJ6GvXJsFnZNQAa
         hbYg==
X-Forwarded-Encrypted: i=1; AJvYcCVVxR3mmUg8qmcRZwRf+OPOsZIqcYY7T20whIm54NO0chsLwnME/unWDPKkj6YBh3bm1VD+Ja0ECRs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7xkj++fMVoaPcceJ6ebTcZlBAro/0qM48GOliDkTNIxXSplGi
	QT/7Z1EkTcI4NJOyu/9W1aU+OOAVS1YuBwEcqXfSdWgWP8/d00AyG0x9P5Pn0AU=
X-Gm-Gg: ASbGncum+R4Sn6TSYu/tG1SNfpECOzTRHWpc2mrPyCgUwVvohjZoLAgqT5OPmu6A1ZW
	bQONfkQqBv1wlQSrKQWG7hIUeor1fdlus1Zya+efa427Fy8+X/CLb3Jz/hiRz458pStZce+y+pQ
	swvz/LcsV8mMWWb5MYaZM4zhH2X+8acLmAoK98WdNlNRrFJQcYmwzpon2A1yuyR37ovF46Zn2vr
	hty9ZQ8twVRsVpexI0Qp44uDT3/UdRN5GbhWhJxo1e5zW9w52nXt8MSIuGu2WRBq5ZWm14c+gac
	0nbmmTbp842+iFm408gPBaIV3q8canqUo4+T06XDr4ZsX/mf+WdIrDvR6Vp1
X-Google-Smtp-Source: AGHT+IE7G8wjtK979b4O6Nuj0hnM9/BLca8MZ6bqkJGxgYjf9X4Ezr5Qy4KlAM4toJWld4WHK+gA0Q==
X-Received: by 2002:a05:6512:b24:b0:540:2a92:7daa with SMTP id 2adb3069b0e04-5439c282032mr13583417e87.42.1737988030790;
        Mon, 27 Jan 2025 06:27:10 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c8368362sm1297614e87.124.2025.01.27.06.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 06:27:09 -0800 (PST)
Date: Mon, 27 Jan 2025 16:27:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Viken Dadhaniya <quic_vdadhani@quicinc.com>, andi.shyti@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.or, andersson@kernel.org, 
	konradybcio@kernel.org, johan+linaro@kernel.org, dianders@chromium.org, 
	agross@kernel.org, linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-spi@vger.kernel.org, quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
Subject: Re: [PATCH v2 4/8] dt-bindings: serial: Add support for selecting
 data transfer mode
Message-ID: <dudqd2y42wy6iq2k73aphd5ol4mtq7z4c54zhd27rl745rrw5x@p3oummf2jke7>
References: <20250124105309.295769-1-quic_vdadhani@quicinc.com>
 <20250124105309.295769-5-quic_vdadhani@quicinc.com>
 <10060d39-87a4-4565-a2a6-80c93ac2266a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10060d39-87a4-4565-a2a6-80c93ac2266a@kernel.org>

On Mon, Jan 27, 2025 at 08:02:12AM +0100, Krzysztof Kozlowski wrote:
> On 24/01/2025 11:53, Viken Dadhaniya wrote:
> > Data transfer mode is fixed by TrustZone (TZ), which currently restricts
> > developers from modifying the transfer mode from the APPS side.
> > 
> > Document the 'qcom,xfer-mode' properties to select the data transfer mode,
> > either GPI DMA (Generic Packet Interface) or non-GPI mode (PIO/CPU DMA).
> > 
> > UART controller can operate in one of two modes based on the
> > 'qcom,xfer-mode' property, and the firmware is loaded accordingly.
> > 
> > Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> > Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> > Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> > ---
> > 
> > v1 -> v2:
> > 
> > - Drop 'qcom,load-firmware' property and add 'firmware-name' property in
> >   qup common driver.
> > - Update commit log.
> > 
> > v1 Link: https://lore.kernel.org/linux-kernel/20241204150326.1470749-4-quic_vdadhani@quicinc.com/
> > ---
> > ---
> >  .../devicetree/bindings/serial/qcom,serial-geni-qcom.yaml | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml b/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
> > index dd33794b3534..383773b32e47 100644
> > --- a/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
> > +++ b/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
> > @@ -56,6 +56,13 @@ properties:
> >    reg:
> >      maxItems: 1
> >  
> > +  qcom,xfer-mode:
> > +    description: Set the value to 1 for non-GPI (FIFO/CPU DMA) mode and 3 for GPI DMA mode.
> > +      The default mode is FIFO.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [1, 3]
> > +
> > +
> 
> Just one blank line, but anyway, this property should not be in three
> places. Do you really expect that each of serial engines within one
> GeniQUP will be configured differently by TZ?

Yes, each SE is configured separately and it's quite frequent when
different SEs have different DMA configuration.

-- 
With best wishes
Dmitry

