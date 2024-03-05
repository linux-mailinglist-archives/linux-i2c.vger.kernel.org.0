Return-Path: <linux-i2c+bounces-2193-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8825C8719B8
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Mar 2024 10:40:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3867F1F2232C
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Mar 2024 09:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4AFF52F8E;
	Tue,  5 Mar 2024 09:40:08 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0713150246;
	Tue,  5 Mar 2024 09:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709631608; cv=none; b=cuzWAMFis7AQUBkZrvTXYYxJFUvYIKzcF8ocdQMhhI5tqZHZZjyhz5o3aPKD8X5WdxO45qyfO5l2pVmvXzS8mgou8kAGjxa4tABUPOBUiPhgY/IlYJuvzk0n36O/8HFLso6d9JqfgTFtptn6lNlw1s77Hrif5bNMDbYPJq+1xmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709631608; c=relaxed/simple;
	bh=aEWbr2WkCKP40snjYGiyA85QnqaaaUKBFkdc5GTF0xE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LWiq0EfqHKT3F1iriwChPq0ZAprDoH0hMTnL7erBALXPrCxMDvrgveKLQKl81qa/VPvDxl4rc7dd1iAR0eR8IKQXxSdAOQllIM0yx6B+RLhVeqUzlqZW1pR4JWimHhu0slIdUL7Pyu2hwHZsLEJM8Y1E7tup42B6/k9GdU5sRhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-607e54b6cf5so37257717b3.0;
        Tue, 05 Mar 2024 01:40:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709631605; x=1710236405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O5XV+PoB/P8Tl2LnlepmC1KderRJ5oKwfMd2xge/y1o=;
        b=vmkd5o51DRXmcw1rrkdpgUKmn15s3c22Tmy3JvH5RpTjIEHDNW4xDpwD/nD78xvE2v
         XQ1cIL5oBPC4jXEZ4wqOMdX74cN8XMNLANo+fK+WLUqAC9wRfS8dbnAJRBPof0jzytwF
         AuiDB2t56oz3K0/da6He5XrQGRJ0YYP9BybzYzsZefsv3wkLSj0r5jtDVbpLC3SFkVFV
         ess2iab/+gFBYcobJGuhNe2BvcBcxjdKTr9d2BkG4p3x7h0oMIQ6Y7c3ui/Y23EQVfY/
         5ZnywxAimKu2RDOPBI+BR/3ZqRtiU3Awtz6WByCDDNW6sLf7zUm6yKkRnGdm/Z4+gOB5
         VBNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNOV9YIyQuZX3ilJ2Exk+4rcHZCPZIbVW2LKGBOQxXWv/UXU9O6xEJEC4MrYFxWj/rk+ecpIltyzoJoc1ifWPZKWLAAGbLxjtlAI0DkB2WiLv8a91gsxBSAszjdpMIJugxr692hKtfuegRprs=
X-Gm-Message-State: AOJu0Yxltcaxvhxw5WNV1/s3gU6YfvkHVuBEPc/8AgyWbOpB/+RHJ1Xw
	Z/xaSGE5dmDKM0azv58L1KEYTe9d1yvitQ/a5MsrvarD1OdcEi/Kp0vPOY6kT+Y=
X-Google-Smtp-Source: AGHT+IHlADYBbQ8ct95e/CtBweb5/sApHlfkTtiT433V5LEgx1D8jVyonoSYsnxDCZkhrCQfExTZwQ==
X-Received: by 2002:a0d:d993:0:b0:609:9191:bf06 with SMTP id b141-20020a0dd993000000b006099191bf06mr1313974ywe.7.1709631605405;
        Tue, 05 Mar 2024 01:40:05 -0800 (PST)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id s63-20020a0de942000000b006097887f574sm2834295ywe.80.2024.03.05.01.40.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 01:40:04 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dc6cbe1ac75so4281513276.1;
        Tue, 05 Mar 2024 01:40:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX8l2/wIv1KyTerfetXNCHcpolGOM9vAoQkmGNW5i/xJPatWInfYyXBv6Uu3QZ3wj63LRfVz7+QPgmrxggK7wD/yJFC02H2Am2oyI1VXtf8bAAgxCGFPZKrC16POo6CKyaCy/9lRALfI1AcQsI=
X-Received: by 2002:a25:d64e:0:b0:dcd:c909:334d with SMTP id
 n75-20020a25d64e000000b00dcdc909334dmr1443367ybg.12.1709631604317; Tue, 05
 Mar 2024 01:40:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bf7b105f7d9728ae5cd9fa99d1cdd278d71e7df2.1704723713.git.geert+renesas@glider.be>
 <Zb6l4PbN3l4SPvRN@shikoro> <ZdeERStL9kkGV5zg@shikoro>
In-Reply-To: <ZdeERStL9kkGV5zg@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Mar 2024 10:39:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW=QFzPdzBHubXLsVpq_q5KNFb1kNWic2B399u2UDj6UQ@mail.gmail.com>
Message-ID: <CAMuHMdW=QFzPdzBHubXLsVpq_q5KNFb1kNWic2B399u2UDj6UQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: rcar: Prepare for the advent of ARCH_RCAR_GEN4
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 6:28=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> On Sat, Feb 03, 2024 at 09:45:20PM +0100, Wolfram Sang wrote:
> > On Mon, Jan 08, 2024 at 03:24:20PM +0100, Geert Uytterhoeven wrote:
> > > Currently, all Kconfig symbols for R-Car Gen4 SoCs select
> > > ARCH_RCAR_GEN3, which might confuse the casual reader.  Prepare for t=
he
> > > advent of ARCH_RCAR_GEN4 by extending the dependency for auto-selecti=
ng
> > > reset controller support.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Andi, can we have this simple patch in 6.9 pretty please?

+1

Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

