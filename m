Return-Path: <linux-i2c+bounces-10427-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7389A90BBC
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 20:56:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39E6D19E02BF
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 18:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 986C622371E;
	Wed, 16 Apr 2025 18:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQN+hU/5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F11217730;
	Wed, 16 Apr 2025 18:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744829759; cv=none; b=f5atSjiyzgPCGdsQZ88dGSsjQTE0hNmOlCnvVEZxB3ZHmVkj1dL+++GzUVYu5BQ7Te9d2886CnckeQgXdnPcdEpw5YJGA262AvvAUsrmUi6jeeSlFV1IIr2TWgxfOi21tPYe1taL8fEHb0IX5aWK9GyibRnt8sPyGJGyxjb6ue0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744829759; c=relaxed/simple;
	bh=nbzW/q7jAGCn034oEPhKD2FwAJYqdTNP6gTuBa+nUn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eq91PUpyijDBciWpBX417HjbH1yQhlAdPFqE6ymXeRG6FaORzYmGV7RLNyxZs52wKQSi6eceV9XpmaT90fAA2e+XclIL0Shfb6KsLzOkBnzMPs0HeYHeYk56GX5cPG/k22HO+8LBtzbSsWoRE9OJrS6KxWB5tNWv7t682JMHpPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQN+hU/5; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4769aef457bso71536891cf.2;
        Wed, 16 Apr 2025 11:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744829756; x=1745434556; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWNHRRlLGAtt8jzmaA+9D/ojUTlN4AK1HzcVBXaO6JU=;
        b=fQN+hU/5uDWMAjE+EHXj7nY8pErXOO2S4rqy4Zx4xUDZdGXzvidb4VuyJGwWncilH5
         h3ZrfVgRYcig34qigOOzodxx0FttRMicMTbKDVBUgcRY4xrj+xu6hw289izK9xy6Nh1d
         HMnUY4USpFtu0oK7oGalJe1bnkpRTmcTTMnkS6czbVLhhB3ZyUOEofkMvZ8lJQ5OyD9n
         ZMDHydTIEVL5KGnBqibS69NTc659nDd0l/kOvYBVb1OLNqNzkyXePvNFPfGogT3bKmhT
         Eie1yEKISe556ZgKE8OFllYMe750whbUr0kgRVEIN9qXc/PX+yFx51emiXEx8Y1LP/QG
         lXgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744829756; x=1745434556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LWNHRRlLGAtt8jzmaA+9D/ojUTlN4AK1HzcVBXaO6JU=;
        b=HMZ0i+9dfpP2enIQSd19glxSGH7BW4HVakv6//YPaQlhi3BJ8rvfzzwNGPbc+jOP3/
         ZccwnutihSosn1M8j4jY3mHsIjlombj20VccXXiILf8crSCr+guz1RtbZ4n12a63jbJc
         sfj35gmwrwW60f0K6JYNb1kY1yBBx5ueju4G066wPsBrrvaZyOZAgJxwuN4O5+kPU5gF
         y1r+Acdp7kU1tpsaSTQqa00Hfl91GGpfmsFJuZaGuSUMs3RyToHzyLBp0Tx+dWjavWYB
         vT5er/sX2qsLlaB8AM3CzjWW+uyEar+UORODrgiEDet/9lxZb44w5NZ9H3hT5KY4jc1w
         YtzA==
X-Forwarded-Encrypted: i=1; AJvYcCUj++UqrnKty5bOsyav+jap0NOfJAx8BiDflEPiRQG1RhhI3j1orKKcv4fvtHMDPMiSKEs6ySPHC7RlTzpW@vger.kernel.org, AJvYcCUpOxOO8wrMo6I3yfNJY6ixbQtvssZyN6MM1Co7KWerr7tM+E99ba3WT2XPTgXKw/HnDbx3S6eGOa3m@vger.kernel.org, AJvYcCV9pOWmXCPggBJT7LLaPyLYCynMMl3WQTnbxkazscr1VVVrjWvcOuXIFf9NMzjDNu88/EPutzeeg+OS@vger.kernel.org, AJvYcCVGQretYQIuYjRqfC5BFeOoXe7zjpW2/tcNQkmZp18OXQgZ9ydl5ktztvUsQ3he9ig60wTOOAbUg0aw@vger.kernel.org, AJvYcCW2YN6FFfySaY36orY3AOs4+1r41edpviJlf3m6phmW/jTU1gleg67yTENowJXwQi0NhT8XVorj@vger.kernel.org, AJvYcCWBWUJ322QC1HqZvcqINp719KsW7pohZTi1JXvZP8eytwnQCLuiR+7dLFVppMKnRr5q14juDpdYlhKm@vger.kernel.org
X-Gm-Message-State: AOJu0YzJNn020XVbdcMOnO+5w2O/4C1X3xpXXYxPF0xya4eYOrY07FTQ
	GDz31cZ+a0LvKYb5ZEQNCKf1Ygc0aMac35/zPw9d+YUc1/Vcs2xcusTts5ZbYzbLicnhkr6RQea
	DDsG7arn41q1KMfpCSWcBn2vqEEs=
X-Gm-Gg: ASbGnctSVxQ9dtEzCdFi2GRCPsPGsGemrLG+QnYGdYtqq9BJAaidoMInU4vtgAAaOzF
	DoKAUXDDsv3nNSSuiojHc7tHbpWvoAWHB+Y+UguqYHur/Q3375ND7DEXfcRUYAbRcdDX4mDg6uA
	99TebTVA12YrTM64FePns9f/CZUhSalmAsf7r332iLaFysIAy4o/z9gcuiPMUOgAZMQQ==
X-Google-Smtp-Source: AGHT+IEhXho+Wj3++MUDdbSnogTiFF+Hc7VltlvllgRmDoZ0RCwCinDjkFA7Fi5dWwvFAGxwURkTH52ruMHAO7zWqFI=
X-Received: by 2002:a05:622a:8cc:b0:477:419a:a3bc with SMTP id
 d75a77b69052e-47ad80c2674mr42168791cf.27.1744829756648; Wed, 16 Apr 2025
 11:55:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com> <20250416155442.GA3255418-robh@kernel.org>
In-Reply-To: <20250416155442.GA3255418-robh@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 16 Apr 2025 22:55:52 +0400
X-Gm-Features: ATxdqUFabw8TyNaRZlXev_Uf452FGKx5MvA3J16s1sRuFs46iscEw3eoNHUowzg
Message-ID: <CABjd4YyPzZoX98=FMwr91BG2RhYc0r5=9P-2GGAbR0s043duPw@mail.gmail.com>
Subject: Re: [PATCH 00/13] ARM: vt8500: DT bindings and dts updates
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 7:54=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Wed, Apr 16, 2025 at 12:21:25PM +0400, Alexey Charkov wrote:
> > Convert some more VT8500 related textual DT binding descriptions to
> > YAML schema, do minor dts correctness fixes, and add a DT for the
> > board I'm actually testing those on (VIA APC Rock).
> >
> > While at that, also describe the PL310 L2 cache controller present on
> > WM8850/WM8950.
> >
> > Note that this series is based upon Krzysztof's linux-dt/for-next
> >
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> > Alexey Charkov (13):
> >       dt-bindings: i2c: i2c-wmt: Convert to YAML
> >       dt-bindings: interrupt-controller: via,vt8500-intc: Convert to YA=
ML
> >       dt-bindings: mmc: vt8500-sdmmc: Convert to YAML
> >       dt-bindings: net: via-rhine: Convert to YAML
> >       dt-bindings: pwm: vt8500-pwm: Convert to YAML
> >       dt-bindings: timer: via,vt8500-timer: Convert to YAML
> >       dt-bindings: arm: vt8500: Add VIA APC Rock/Paper boards
> >       ARM: dts: vt8500: Add node address and reg in CPU nodes
> >       ARM: dts: vt8500: Move memory nodes to board dts and fix addr/siz=
e
> >       ARM: dts: vt8500: Use generic compatibles for EHCI
> >       ARM: dts: vt8500: Use generic node name for the SD/MMC controller
> >       ARM: dts: vt8500: Add VIA APC Rock/Paper board
> >       ARM: dts: vt8500: Add L2 cache controller on WM8850/WM8950
> >
> >  Documentation/devicetree/bindings/arm/vt8500.yaml  | 19 ++++---
> >  Documentation/devicetree/bindings/i2c/i2c-wmt.txt  | 24 ---------
> >  .../devicetree/bindings/i2c/wm,wm8505-i2c.yaml     | 47 ++++++++++++++=
+++
> >  .../interrupt-controller/via,vt8500-intc.txt       | 16 ------
> >  .../interrupt-controller/via,vt8500-intc.yaml      | 47 ++++++++++++++=
+++
> >  .../devicetree/bindings/mmc/vt8500-sdmmc.txt       | 23 --------
> >  .../devicetree/bindings/mmc/wm,wm8505-sdhc.yaml    | 61 ++++++++++++++=
++++++++
> >  .../devicetree/bindings/net/via,vt8500-rhine.yaml  | 41 ++++++++++++++=
+
> >  .../devicetree/bindings/net/via-rhine.txt          | 17 ------
> >  .../devicetree/bindings/pwm/via,vt8500-pwm.yaml    | 43 ++++++++++++++=
+
> >  .../devicetree/bindings/pwm/vt8500-pwm.txt         | 18 -------
> >  .../devicetree/bindings/timer/via,vt8500-timer.txt | 15 ------
> >  .../bindings/timer/via,vt8500-timer.yaml           | 36 +++++++++++++
> >  MAINTAINERS                                        |  7 ++-
> >  arch/arm/boot/dts/vt8500/Makefile                  |  3 +-
> >  arch/arm/boot/dts/vt8500/vt8500-bv07.dts           |  5 ++
> >  arch/arm/boot/dts/vt8500/vt8500.dtsi               | 12 ++---
> >  arch/arm/boot/dts/vt8500/wm8505-ref.dts            |  5 ++
> >  arch/arm/boot/dts/vt8500/wm8505.dtsi               | 14 ++---
> >  arch/arm/boot/dts/vt8500/wm8650-mid.dts            |  5 ++
> >  arch/arm/boot/dts/vt8500/wm8650.dtsi               | 14 ++---
> >  arch/arm/boot/dts/vt8500/wm8750-apc8750.dts        |  5 ++
> >  arch/arm/boot/dts/vt8500/wm8750.dtsi               | 14 ++---
> >  arch/arm/boot/dts/vt8500/wm8850-w70v2.dts          |  5 ++
> >  arch/arm/boot/dts/vt8500/wm8850.dtsi               | 23 +++++---
> >  arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts       | 21 ++++++++
> >  arch/arm/boot/dts/vt8500/wm8950.dtsi               | 11 ++++
> >  27 files changed, 386 insertions(+), 165 deletions(-)
> > ---
> > base-commit: 62db22c2af6ce306943df5de6f5198ea9bd3d47b
>
> I could not apply this series for testing. What base is this? It is
> unknown to anything I have. Please use most recent rc1 unless you have
> a dependency then use recent linux-next or a branch in it.

It's based on Krzysztof's linux-dt/for-next [1] as mentioned in the
cover letter above - it hasn't yet been pulled into today's
linux-next. Specifically, this patch [2] from Wolfram is a dependency
for patch 10/13 in this series - the rest should apply cleanly on top
of 6.15-rc1

Best regards,
Alexey

[1] https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git/commi=
t/?h=3Dfor-next
[2] https://lore.kernel.org/all/20250330193833.21970-12-wsa+renesas@sang-en=
gineering.com/

