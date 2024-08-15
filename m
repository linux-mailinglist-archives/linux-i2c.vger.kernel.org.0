Return-Path: <linux-i2c+bounces-5437-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B51D2953B89
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 22:39:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7307F287EB1
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 20:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B093A14A091;
	Thu, 15 Aug 2024 20:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uylm+0HU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63893405C9;
	Thu, 15 Aug 2024 20:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754361; cv=none; b=QjVuG7SnvohYs9TF1hkxmdplZNgH5K7jMex0eMBz4n8kBBuj6LA+2xsPfEECT5nlX2tW6bDYmVjzbGr+UwKP6e3xRApGY+Z/j5Ug3iMbdlRvOlGveXqDGRJgZrWmnCq3Lssuzvr1NY9ME5S7hwAHLiigglpI5vzCibFtLgac4No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754361; c=relaxed/simple;
	bh=jJGsALR1uyLncFM2ZgfuBQKQpXFgB5PUbDEB0VXmABk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=OKRIiZvGICWinOPPjPrGIjiAgqq8XqpVSixWbxGjQCJes+d4EHXmgZo316HLm2JAe6t1Zf+UNFC5xRrb7YnljsBHAvMvRA4PxTEjt5wUsgNkzq8IuwSSLeQyYoXEgRDqcow27uJrTvdjCtmK4dlGnOReEmLZ1x2qh8w7Es3zHK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uylm+0HU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAA97C32786;
	Thu, 15 Aug 2024 20:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723754360;
	bh=jJGsALR1uyLncFM2ZgfuBQKQpXFgB5PUbDEB0VXmABk=;
	h=References:In-Reply-To:From:Date:Subject:To:From;
	b=uylm+0HUhMDQG91hVqYLNUQqKlTO3jV2sU9Dd5FpeSN7JohnLx5q2CAht/hh6akUZ
	 c9DoOYh4k1WJnDWiS0V1OCfE7CZ1yzc7tHlWxIWK0Bi7IAkexYmH/AHt1r4HutwWpB
	 HZkjSdoDez1+yRbGUqUxTRcm5RfvaJe5VrqeX73OU9pEz5tuJFpH2FXCGUBMcpufP5
	 ZHyZLLvZmhP3SG3EUjwu/5aijJR9Nk7zw6sW6XLiXslgPKr4jDesc5VxMWoXRvWGaK
	 1WFg7juk+4wp+Lt35YUbDO16cnJpbndGNw79G0VanLhHA4dhMq6aAKSh03NB7IvDxh
	 Sq7FkchJEMq2A==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ef2c56da6cso15212141fa.1;
        Thu, 15 Aug 2024 13:39:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUFVgXiV0lWsRFDsxstojd0vSKa52I+qF6wu/76jwA2nGLDmw0nv2JEN/O3Irg/vZXnMBp/EitPKvJwUvAQG89Vu9OgE+EUETWMoVFhHv7fBs5rrtHNZYlDdFqTWTfRumUU5N72EZ0VvcYB2JiRGb2zgi0cE193GtMgBhervUaVeD8sfkqvQrOZYsJyq/o=
X-Gm-Message-State: AOJu0Yy16HMWoxoHFYeNb8cslQxL24n3lO+KN3fMY5QKzhNbZe+JNey/
	1upwloS0zSpXMSBBV3FuzUlrFg7IdsHlXrbTxld4wZh0H5r4BWqk2fAyEob+S76HfNHxF6aCqHc
	7tUmpX73P2vH9w9AsukfPO+c3pg==
X-Google-Smtp-Source: AGHT+IGAQ/AW7LoNSV8ayoxcODvY196l3IXAvXy/sBaF0eVpsQ35UwgBMNN1f5LMDmOfG6MkMg5Ti2gR98RBbpDRRI8=
X-Received: by 2002:a05:651c:2108:b0:2ef:2608:2e42 with SMTP id
 38308e7fff4ca-2f3be3e1da0mr6130471fa.0.1723754358973; Thu, 15 Aug 2024
 13:39:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815120935.5871-1-wsa+renesas@sang-engineering.com>
 <20240815120935.5871-4-wsa+renesas@sang-engineering.com> <CAL_Jsq+FggVdyJBJ_jA=wfiK87qtwYh42+49Lu2p_mi=_+n74A@mail.gmail.com>
 <Zr5MMrRAw8VhIJri@shikoro>
In-Reply-To: <Zr5MMrRAw8VhIJri@shikoro>
From: Rob Herring <robh@kernel.org>
Date: Thu, 15 Aug 2024 14:39:06 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLPGEQ71coq0v2byx5JAGH+FFapv=MCc-AFCwVQ==6M6Q@mail.gmail.com>
Message-ID: <CAL_JsqLPGEQ71coq0v2byx5JAGH+FFapv=MCc-AFCwVQ==6M6Q@mail.gmail.com>
Subject: Re: [PATCH dt-schema 3/3] schemas: i2c: add generic interrupt name
 for I2C controllers
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Rob Herring <robh@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree-spec@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 12:43=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Rob,
>
> thanks for the super-fast review!
>
> > > "smbus_alert" is a generic interrupt name for controllers, so documen=
t
> > > it. Introduce also "irq" for the primary interrupt.
> >
> > I wouldn't add "irq". It's kind of odd in that we have it for I2C
> > devices in the first place and we don't try to do that anywhere else.
>
> Yes, I am actually happy to remove "irq". I only added it for
> consistency.
>
> > > +  interrupt-names:
> > > +    anyOf:
> > > +      - {} # Any name is allowed.
> > > +      - items:
> > > +          enum:
> > > +            - irq
> > > +            - smbus_alert
> >
> > It doesn't really matter with the {}, but the 2nd entry is only true
> > if interrupt-names only contains these 2 names. I'd use 'contains'
> > rather than 'items' here.
>
> So, just replace "items:" with "contains:", right? Should I also change
> this for I2C targets and add this chunk to patch 2?

Oh, I missed that you just copied that, but yes, if you can update
that one too, it would be good.

Rob

