Return-Path: <linux-i2c+bounces-4293-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C478914334
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 09:10:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED3B92849A9
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 07:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A86B83A27E;
	Mon, 24 Jun 2024 07:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CWy3qw4C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F583AC2B;
	Mon, 24 Jun 2024 07:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719213014; cv=none; b=UFU67thfp60dpX8d3sInNSh1nrYzzP8M4AjePbI0Wgm8/uXMGnfmkwvDA4VMZ+oYIE1RtmY3eMueZxE3OPADXHrD/Y8yJK0nfx3ov1HpDu252oAV6lAvf1O3H9j5ImwnZWyDKyd96kq2/fwPoewLzOw4bB36fAJ8TyaBeNLSsGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719213014; c=relaxed/simple;
	bh=HBCjUsYTDIVsStQ42c/crGHKv/Sq5eTsiD6VzI41u04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IdKoTuzKEtri86cZdWlvUzsQb74kSfJNZ923kte3VHnTJId6zcI6OHsiVQY1+1rtDs+mkmCJon42KlvOEAR2UkwjA75YOlFwQ7GS+F08RABYbl1fvMNCUTLyy/r1nSuROm0GbGfSSrGNc9J8e/p2Ca9fO6jjEOpljBLLkSwr+VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CWy3qw4C; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-57d0699fd02so2031771a12.0;
        Mon, 24 Jun 2024 00:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719213011; x=1719817811; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4qDW7s+qlBBL2Paxw11bXPIks8QSc7Gri0w+bcYvP8=;
        b=CWy3qw4CQ3C/EPqY4uHyBqBPfacTglQCTX7N8sz+Z/rBjWKsmsZz5a7gVOB08v+NqG
         k01GtNO6raVyFUs4vhbpufhVKEVEt5/pYvJQd8UKvgDtrEhrDWnmgCmB7aA4xgazdGy8
         TXms4q2owVdfDQyQRwKG9qErwsYT4xKeH7xTwU0NqsL1SF8O10RfH2whqYKSnudYgMug
         2ZzusuttlZvpBz+dlEfBqJ6H+rDEuQ/Vyn1rrHWkeEm7SjB1qED8a3w9NIqsYmmNYXH1
         fYFuNMolgcSSLonUuj6MPovEcrF9fyBVcw6617k+qhJwKDVzN05yblJj4OUzotW2HlZr
         zO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719213011; x=1719817811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4qDW7s+qlBBL2Paxw11bXPIks8QSc7Gri0w+bcYvP8=;
        b=QH56x7gqPs2s9Hoacl/2XOq5Kfl6Gt5XNIl2SJNgRvjrpgARyOzG7URazeMIsqOzXN
         N1jp4h0sxSE/4f4oeAqO1ioEUyknNzEI7+Mn9Gab2dahUiJSYfnjBvKOyTt1vB3kkLmU
         Azh+44iMLquxdzGTwWIFyUIO7eQ43gBiBe03eEvE8sGkDlv+mka8DdcdQoVhcXvkDRKu
         hRRAQqsuUmspPEcgH+r2hDKzRg0EGruhPaK3jtEculaBgydk/bmp91RCcMwhSOa3K03l
         HBvASm0jChrW5bKAEnuRDLnECTLucYAGi/3edGswugK7N9qhA63d2dKLxgds1Nb4estU
         Cb+g==
X-Forwarded-Encrypted: i=1; AJvYcCWZhHo7Hjz9oI6hG8qzY7XJe1eY4cZaB7qMMF5Ua++w3ZmTOTiktrFjyzTypJG2i3K4M2lNBw97xPSspCQQS17SGuxM3+Xkg1kZNSSeLFs3ZRl5pWUVIdwkMsPlr4CjUNVJTuFRPlXGv5l49Qq/Yy4tl9gkkYdTIfRWOXGSVbzcpXxlUQ==
X-Gm-Message-State: AOJu0YxBzoPekA53Mpj+rFgEULqWeil3Pp7uSu4QIOQU1pgpLNFrgt/C
	L7qkPLBXiOWEGkbWFn2w+camObT1Swdko0h+OHxYun9wQLEuwe7XCeLq4RTnM+V7A3Oq3EbWSjd
	ijFOabl8zicFuQIkqo3AyYLaddW0=
X-Google-Smtp-Source: AGHT+IGCwvm4fU7C/inQehbuThRxMqiaMf+6I5oQHFjehZBe1jdhyTY9kV3vEF5IWV0jJ4w9Ll+EXIMb8Mo0zTpqh7Q=
X-Received: by 2002:a50:d697:0:b0:57d:3df:f881 with SMTP id
 4fb4d7f45d1cf-57d4bd5a1femr3013313a12.3.1719213010929; Mon, 24 Jun 2024
 00:10:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240620054024.43627-2-kanakshilledar@gmail.com> <d613221e-f026-400a-acec-921ef110ac29@kernel.org>
In-Reply-To: <d613221e-f026-400a-acec-921ef110ac29@kernel.org>
From: Kanak Shilledar <kanakshilledar@gmail.com>
Date: Mon, 24 Jun 2024 12:39:58 +0530
Message-ID: <CAGLn_=t+GyhGvtfXO=VmXB6iC3XAsAexOpqGt6AWdMNW15Lf8g@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: i2c: nxp,lpc1788-i2c: convert to dt schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 4:27=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 20/06/2024 07:40, Kanak Shilledar wrote:
> > Convert the NXP I2C controller for LPC2xxx/178x/18xx/43xx
> > to newer DT schema. Created DT schema based on the .txt file
> > which had `compatible`, `reg`, `interrupts`, `clocks`,
> > `#address-cells` and `#size-cells` as required properties.
> >
>
> Thank you for your patch. There is something to discuss/improve.
>
>
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-frequency:
> > +    description: the desired I2C bus clock frequency in Hz
> > +    default: 100000
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - "#address-cells"
> > +  - "#size-cells"
>
> These should not be required, because you can have an enabled I2C
> controller without children in DT.

You suggest removing the address cells and size cells from the
required properties?
I saw a few i2c dt-bindings and these had the address cells and size
cells in the required
property.
>
>
> Best regards,
> Krzysztof

Thanks and Regards,
Kanak Shilledar

