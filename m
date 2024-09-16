Return-Path: <linux-i2c+bounces-6757-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A29A9799D0
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 03:38:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D66EB22103
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 01:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E46A78BE0;
	Mon, 16 Sep 2024 01:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="USutDq39"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221CD6125;
	Mon, 16 Sep 2024 01:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726450687; cv=none; b=mFb3lajj+nxcvXo+XR63+VjOA6kNx6hKVeNJCq4fC2Cf7CNwMls4TYzinGNj9JTV858NnR29Nn+FoNZhA1oWu3PLFcOnoP2vITMwCP3AuTZZUQ+qbLhM11+yAn9TIO/v2MSiPr+TpCktJU4uC1BeFiHisgNGGFBtOOf7y1nFn3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726450687; c=relaxed/simple;
	bh=8R64+7ovD7gS1c78WgldT/CsUvLDkrI4ZQNFUPdZi2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k9UBkBxx/QQBuGLhSvkO32fnsJxWDAsCcyjumE3zeo2/Y6Fa4BWfMQTF3ENXcfjrZNeYm2KhqT8pu+j0pNOgb872/kkMuWgJPuw6vE0NCakPRLY9AJNUx2fcbXhCu77mF7dSbEmG7xRvPJ3ngnLwraQj3m7A0sGuhryQg6346Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=USutDq39; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a8d29b7edc2so521581166b.1;
        Sun, 15 Sep 2024 18:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726450684; x=1727055484; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJ4zB8iR1KNJGsuoPyhcL4e+N/fRrboA2H80bwmTRig=;
        b=USutDq39kAkkX4qAVtAHD/GkNK5cjHX16nso0QtArrUJK2cnAxSOhOhCkt3avGD8P+
         79d2uYFJUGF+gaslSNGR5q5FWa7vmLDEgZCeWuf+et5SGni3ebgoqIYjHzqnxeJvsTNu
         DNIMUMS1Lok0BNSYIQAXHi4Lphcsm7UbeFjxsHQC6MWtEG3mwqqECYrxRmYGxnCb9pTQ
         DSQe/HfkIAnPU/FSIFZfbYrvSju2gvLoUKozfMpy0QtqRswM/Js6SOjqFif5BrHcd2Vv
         gjVVbV4TNgjWrNHfhv6AH8qNLV6r8+pO7GI1itoSxmLROW7YDNwT/cQDLoKAkB4Ks97p
         /LPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726450684; x=1727055484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJ4zB8iR1KNJGsuoPyhcL4e+N/fRrboA2H80bwmTRig=;
        b=njmZ7P2Lozg3EU8ERodbfIZj53sJnYu81Z73XMVV2IHIfxGSItEYIKoJG7TL3ZCG1Z
         SBYcs96/IL8O5Vrmk+7hStc+WRNoNSKx3fQHnsk+M9xND3AyXJKd2YpsCz3v2vtNUkzI
         f2VT9jtehzZuCmEU3vZp/8NH7Z3+GJqBb2EePWBLPEx1P4EPssrIBeh9bjG287JfdoXL
         6XgQGTsJ/IYRz4qrr6/Bf0cmW6P+zb7ehWbKgLfPM9Oc/4nE/JmfKGLL5r2ZxS+tMzOQ
         /R7dbiY7pRlG7ySGQm5zrV6/FTbk18NwwwTbEYmVRP2iUv7wqT+0FcsR7ecyPhPreLAc
         S0Mg==
X-Forwarded-Encrypted: i=1; AJvYcCVjV6o+9aC3GaLOKWVXJe8b6W80/LgpLU3d/jvBgmYDg4PON2akCjED8bqyk5DHLXFLod/ayHlwg5Q=@vger.kernel.org, AJvYcCVtLhz9oUzQu5cZPc1RDHdgppXedOh7MDh3CbVVT5EXzhL1hnBG59GZalH29eNbLKHdTJqYBxFd2lArTrgg@vger.kernel.org
X-Gm-Message-State: AOJu0YyIL3wEHCMSj7jUkvY1/Qh3Xu4bGhzGe7CLeYlnPO5DxDhg3OVO
	55Fq2k4QaQrhmDhr/NcEiktHLkBmiuheUVtTUEnbpXRd75gtzXVfu90zrvjBtFFRgqdu4XGO9Fb
	1nK9uEz+nifopMIbsyrl+B07e+FaUsus=
X-Google-Smtp-Source: AGHT+IHpIiRR5akklQIihavCSvcDCHn4aF+4W5ECxwJPVWeU7BihsxSe3ukzjhmGP6JhFf88Z8h4KovqUY1dUUD8GVM=
X-Received: by 2002:a17:907:72c6:b0:a86:bb90:93fa with SMTP id
 a640c23a62f3a-a902961ab6dmr1524114766b.44.1726450684244; Sun, 15 Sep 2024
 18:38:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913101445.16513-1-kfting@nuvoton.com> <20240913101445.16513-5-kfting@nuvoton.com>
 <ZuQU2iIZwW4mAumo@smile.fi.intel.com>
In-Reply-To: <ZuQU2iIZwW4mAumo@smile.fi.intel.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Mon, 16 Sep 2024 09:37:52 +0800
Message-ID: <CACD3sJbFyD1OeOX1Fwi97XpJXK6xO7=Ug1t+aMa=bQWwsaT+LA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] i2c: npcm: Modify the client address assignment
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andi.shyti@kernel.org, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, 
	Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, 
	JJLIU0@nuvoton.com, kfting@nuvoton.com, openbmc@lists.ozlabs.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy:

Your comments will be addressed.

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=B9=B4=
9=E6=9C=8813=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=886:33=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Fri, Sep 13, 2024 at 06:14:44PM +0800, warp5tw@gmail.com wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > Store the client address earlier since it might get called in
> > the i2c_recover_bus logic flow at the early stage of the function
> > npcm_i2c_master_xfer.
>
> We refer to the functions as func().
>
> ...
>
> > +     /*
> > +      * Previously, the address was stored w/o left-shift by one bit a=
nd
> > +      * with that shift in the following call to npcm_i2c_master_start=
_xmit.
> > +      *
> > +      * Since there are cases that the i2c_recover_bus gets called at =
the
> > +      * early stage of the function npcm_i2c_master_xfer, the address =
is
>
> Ditto.
>
> > +      * stored with the shift and used in the i2c_recover_bus call.
> > +      *
> > +      * The address is stored from bit 1 to bit 7 in the register for
> > +      * sending the i2c address later so it's left-shifted by 1 bit.
> > +      */
>
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Thank you.

Regards,
Tyrone

