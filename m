Return-Path: <linux-i2c+bounces-2373-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B538587D466
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Mar 2024 20:18:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FEC3284522
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Mar 2024 19:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12F7F51C5F;
	Fri, 15 Mar 2024 19:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cg1pZybu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03181DA26;
	Fri, 15 Mar 2024 19:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710530295; cv=none; b=MCAdY9HMu/F9V81o2wklT0RQUb4lfeG42VOW/goqNbruLWGPvoNjJzvI9ixvli/3b56m2UOW4P/t6CnGue0X4W+xiaPXbEUKijvn4pEfr3f/bpnxmUZ8yi1Lq076NQREDamjUNdCFo12t0EiLIBkKDhwJxJ71bOqoY46pLx/A4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710530295; c=relaxed/simple;
	bh=KAAL2g1Jr5L18tFOJNZQ3FnSiMfqDl3TIkg7X+igEOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iF1PXQnUdMY5tN9UXg56cQQ1Gop6wW7Ns4yh3xXGtLYqCWZxFeAZSjWAogxc2sBif5suAK0IVGbYOG5kBQOK4QCc/tNEZEdgsXdzb/u9zSD+rsKot5DqjbxgnoQ+vvH1thy0AfrbEBNk3DXRg1lsnW2GV6RPcDowP+SM9BycYFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cg1pZybu; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-4d43b8b258aso411653e0c.1;
        Fri, 15 Mar 2024 12:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710530292; x=1711135092; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7IZjuz3DDMkvUwTM0i6q57JxubsfRJ4vJTNG888nZc=;
        b=Cg1pZybuJ+96g4fkkgIst9Vphln4HMTr7z5aldN4xy3YpcH75xMhmTm3nsQQyGkw8m
         FSnVYy45ku6hFj/jP4bfJhTSqtE1r/4uzAwvqwZwHCyhu9/KlnuuC79G9gmWO2z9Wo8c
         AOEgy5900y4VYMQ/xjXbTRsDGmSy9RhnPqbxrC7qJMb+qNqiL/3Sl+7BJf7AJpCu38oP
         +g1UlEf6nlwdCGZROYN8WCdEfZd5yA7uykJs6q+wh9frG9yXm3iHYysEbZ7SCbYM0NQ/
         ltC6HkLmarL+nkym+th+LTMyKVMTkDqB07mEi8YIX84XlqMXYO8ZQ0MEZ6IH+jEfXZKo
         Vtvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710530292; x=1711135092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U7IZjuz3DDMkvUwTM0i6q57JxubsfRJ4vJTNG888nZc=;
        b=ZRDIuQlguAmbkfqiHgvUkrWWHuTKZyChZW+4RsIMQsbTs8S4hgjb+2BX0vfMW9qido
         CaGclccC3wV0k4YbeWIgweSLGxkJruNzk0zx+dvr6s7sKysFPj3ZI1oAdSs5SEu/u/Xp
         uJ8MXAStN6IrArvoOlRea7pBEmOd+KoXfmAsvRyv6PJyl/uEHpxNRYoNc4TPGZ1DVC2e
         OEMm86o5BZQeo3hcRxXXfWOabqa4fLX6Qvij2GYsRwqAo+RBTCjcqmfpos0q98Ae1Osx
         cT46CmUM0a0UzRp5Gf//bLQKJS/s9sMKL6Ha1kaq20DSEfVjlb1tH80IQp9ccvyKbuIJ
         bIAw==
X-Forwarded-Encrypted: i=1; AJvYcCW8YQLtNvb2XsYmEodmrGacv6Qce2uKgCaiAUaumDqJOUxgA2zDXbrQ87SnBWsikV4TV+jQl8B1QCnCCUOfN4sKH5dvbh02GFe7LXygC6XnUZMo4jvIg/+zIOACwqafDem70ecvNQm35ghmpsbOZxXMPP9ge3RhAc+cVomJDzYzc6cxlDHfGaBamUofYEven9cBmk5VG1QJljUqzUHENjSuKG7B/AvW
X-Gm-Message-State: AOJu0YwEprPt7DVxuszWK8/sV24n2pZY0ltIqKHLz4nYmINu+Peg61tm
	7GjdthwKStcX0aKmYg6NwNS3Vk4LgT2H6P7vopZK/IHRoOVUr/nKyI+j1wyB9eDZ+QyVxXUSAWZ
	mBbxOSvH927H/d4ofKme7UejbISE=
X-Google-Smtp-Source: AGHT+IFfc5t+nCvhYPD4KLfmYBd61W2nuvPXXUBIzaylUUdStKMC2Saoc3vQ+E3J9WoSWIyI6nEfYOfdpygZFq6KQrE=
X-Received: by 2002:a05:6122:12d5:b0:4cc:29cf:a1fa with SMTP id
 d21-20020a05612212d500b004cc29cfa1famr4207888vkp.4.1710530291758; Fri, 15 Mar
 2024 12:18:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240315103033.141226-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240315103033.141226-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdW_WBaGjYmU_RnMnq2T7PeEafAZqyP9Md9g0VUKzgrecQ@mail.gmail.com> <CAMuHMdUZhnf96M2MgLepu04J84jz_B_vZEtQYQZefsFu1rYfeg@mail.gmail.com>
In-Reply-To: <CAMuHMdUZhnf96M2MgLepu04J84jz_B_vZEtQYQZefsFu1rYfeg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 15 Mar 2024 19:17:45 +0000
Message-ID: <CA+V-a8sPgvPC3xng_dHwEaHJEgLKeAM8yNuwZRKfpgV+AKueQA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: i2c: renesas,riic: Document R9A09G057 support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Fri, Mar 15, 2024 at 6:35=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,,
>
> On Fri, Mar 15, 2024 at 1:50=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Fri, Mar 15, 2024 at 11:31=E2=80=AFAM Prabhakar <prabhakar.csengg@gm=
ail.com> wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Document support for the I2C Bus Interface (RIIC) available in the
> > > Renesas RZ/V2H(P) (R9A09G057) SoC.
> > >
> > > The RIIC interface in the Renesas RZ/V2H(P) differs from RZ/A in a
> > > couple of ways:
> > > - Register offsets for the RZ/V2H(P) SoC differ from those of the
> > >   RZ/A SoC.
> > > - RZ/V2H register access is limited to 8-bit, whereas RZ/A supports
> > >   8/16/32-bit.
> > > - RZ/V2H has bit differences in the slave address register.
> > >
> > > To accommodate these differences in the existing driver, a new compat=
ible
> > > string "renesas,riic-r9a09g057" is added.
>
> As it looks like there will be a v3 of this series, please drop "in
> the existing driver".
>
Sure I'll drop it.

Cheers,
Prabhakar

