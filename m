Return-Path: <linux-i2c+bounces-2847-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A6689E70A
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 02:42:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27376283A7E
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 00:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B7F96ABA;
	Wed, 10 Apr 2024 00:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RXi3DPw+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E358524C
	for <linux-i2c@vger.kernel.org>; Wed, 10 Apr 2024 00:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712709729; cv=none; b=ELVOuCdRlZhdmJzv0uLKkhtk1LSeTMv7rautga87keAcKX1Fbn1uMa1WI0RMzdU+UDiwIHr2nPGxEImh8UH+ICMJCBBsRa0Wg03vB5A+TFbritMy5f3TDmkKmKrVMPIqnd1i/C4Pl8ZfVCfUfFV5GCMpoFsb7BHkl0bVx7vBenU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712709729; c=relaxed/simple;
	bh=6n12Zu2PXd66Y71IlQLtaUfwzP6yoiw9IUKTbil8GRo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i3ROy964gin03eJ9ng08Yb6UaLjC4uVSinP91oT7Korae/NjUusSpBDE5yWGl1vT5pl/uTZcA30gzbX3UF1GiIWel5OzzOjb01EpQHWERuc0yWq0MS4l3VzzAf3fMxUB94YhiuPvLDyHI14/2slH4EMID6NBbPgWPwm6WQRVWLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RXi3DPw+; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4348110e888so109851cf.1
        for <linux-i2c@vger.kernel.org>; Tue, 09 Apr 2024 17:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712709726; x=1713314526; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E707FZfqJXCBcA2uPBas1hK+jmqbfEZiGJ11/cbpPtU=;
        b=RXi3DPw+8a609DGiSGokomsp/tcC/Zdkvf174NC0Xl7hdBOmEzriLAA39/Z44B2AVc
         x+k1vGgAzOyzmkE0KKB/VGAFH4OY2DcPaHwKg1TR0tIFjs7p3spuBc80Qn2qUo0/ESJ/
         R7pUVuWO/BlRknRQo6Yr3g/E9P9KFLwtun1g1aONN6++2rPp/+JFTlkPK+dxP12IXhGg
         nmWbqK9POhXZgUaCNI9yzTgtxd/b4Km7aIfgyF8YkxkSyO3kBbCZ7I63vmazjRq5phV6
         OF0uglWOZkm5x9NBsmdyf/pmdFarHAcqP2cUun4I7+x49Kdf68A4GJz3dJwVd6JitA8M
         aYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712709726; x=1713314526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E707FZfqJXCBcA2uPBas1hK+jmqbfEZiGJ11/cbpPtU=;
        b=pqJI0NmhKE3Rdj68ojra0fQ58i0a45Q5hGPnH7Z7jXdDk0sqLY85UOwzIJkr9EuLsF
         gZ5/zRM2UsFqrqQkoqn2RO8hjwnPfOO8T/aktwfR7CoTu+12YvFiAIJnUAgIp9AkfHdh
         1WgYWFbnumCMbR46XqLZnJfPY1u5EKx0nkQnhylYPGjKY9SpMKeOTsg91vqNYSUG6CQs
         0evaAxapAoMbCRGzlu/c5exJWW6lYxXDaBsILLo1FrtLO9yd3oLup4mQ3QgYuWYa7Yls
         c9IYrP4GwRrND2055jxWAk24Rfq4zj8s7tkyoDCggNuKJzZZ3k6SIRHADK3vHmEZpNLC
         NUlg==
X-Forwarded-Encrypted: i=1; AJvYcCXRHDsUKKBBajwKTLLX87oGoOeW2Z1i+pDaEP2jHEshQqPhKbcIX2Cjy4UXctC+ZkaWQcp5BN1qb7Fn4W1wVnCp25jkOe74qVsE
X-Gm-Message-State: AOJu0YwKTrUDqOsvgAseha7lWPqnmf0ltAmYvrYeH7Ty/Vf5ZhUbTkrb
	OndCMG5wd8gkTILnLgLIcuzil9CKEXEOIu9s0deXfJQWmcXE8n2q3YDLrBG/tpow4LDVf2W64Ha
	gvL7KtS1zm3uMvgpMdjhuM57m+paP2Sn0mLeb
X-Google-Smtp-Source: AGHT+IE6pOiRvKwazX638Ih8wKd7cvEo05JqQcXWWafVxMVp5G/KiIGH74/vCv7oIW4NbZNraz/tqKumu97CziTEeuU=
X-Received: by 2002:a05:622a:1cc3:b0:434:6677:7311 with SMTP id
 bc3-20020a05622a1cc300b0043466777311mr50389qtb.17.1712709726223; Tue, 09 Apr
 2024 17:42:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240409053704.428336-1-saravanak@google.com> <CAMuHMdVL4xUMARcze=ZyZA=Hi3=nvfZ34juSKG7cgA5ygxASaw@mail.gmail.com>
In-Reply-To: <CAMuHMdVL4xUMARcze=ZyZA=Hi3=nvfZ34juSKG7cgA5ygxASaw@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Tue, 9 Apr 2024 17:41:30 -0700
Message-ID: <CAGETcx84fpe4KgrbOr15DYmCKLqdDVHn1DdkVRT8FjBW3qBLXw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/2] fw_devlink overlay fix
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 9, 2024 at 8:10=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Saravana,
>
> On Tue, Apr 9, 2024 at 7:37=E2=80=AFAM Saravana Kannan <saravanak@google.=
com> wrote:
> > Don't bother reviewing this patch. It needs to be tested and possibly
> > refactored first.
> >
> > Geert and Herve,
> >
> > This patch serious should hopefully fix both of your use cases
> > [1][2][3]. Can you please check to make sure the device links created
> > to/from the overlay devices are to/from the right ones?
>
> Thanks for your series!
>
> After applying the first patch (the revert), the issue reported in
> [1] is back, as expected.
> After applying both patches, applying[A]/unapplying[B]/reapplying[C]
> overlay [4] works as without this series, so
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Note that the state of /sys/class/devlink/ after [C] is still not the
> same as after [A], as reported before in [5]:
>   - platform:e6060000.pinctrl--platform:keys link is not recreated in [B]=
,
>   - nothing changes in /sys/class/devlink in [C].
> But that issue is not introduced in this series.

Thanks for the testing and additional info! Looks like I'll need to
make more changes to accommodate more cases. I'll send out v3 once I
figure it out, but it should continue working for you.

-Saravana

>
> > [1] - https://lore.kernel.org/lkml/CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8=
x6=3D9F9rZ+-KzjOg@mail.gmail.com/
>
> [4] "arm64: dts: renesas: ebisu: cn41: Add overlay for MSIOF0 and 25LC040=
"
>     https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers=
.git/commit/?h=3Dtopic/renesas-overlays&id=3D222a4936b0d3dabd43bdffb3a57842=
3bff97b02d
> [5] https://lore.kernel.org/lkml/CAMuHMdXNoYH8PJE1xb4PK-vzjXtOzrxNJoZhsHT=
-H4Ucm=3D7_ig@mail.gmail.com/
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

