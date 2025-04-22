Return-Path: <linux-i2c+bounces-10516-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2B0A96394
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 11:08:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 288B43B5FDF
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 09:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E3341F03D9;
	Tue, 22 Apr 2025 09:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3y1EiME"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5118B19D8B7;
	Tue, 22 Apr 2025 09:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745312508; cv=none; b=L2OOGawpefzP0Qm0GynVdAp4r7OE57GdCJHTGJ1xcz9VSvWbuRrBmcC7OOfFXZpU1k/Usv69eLL8fbbzx2I3Mki5x9puxtYHaSJbFM8Oouc6CHbi4pbR6gHY2RSoCO+rihPDGJd9wYyDavajxoQgNbMA4h0UnbjTsfli/3Bpzv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745312508; c=relaxed/simple;
	bh=xwAiim+BzPpGaX7BSuXBzGYxP0hQVbNoyy/nha9lMnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z+NqTKpPAzkpvI30tkVd27xA/IZAcQSvTlRdV2TPRw3Z8DBgBJqFCgovPhqEIok7XsYz0kAuhKISvTvSWSnTuX4xpcFXHQjt+mapB/K+ldnkZk1rjpJSkgjesj53u2oQFMhvLP3XAMWik9sjm8avtMt0Kps0SnjEgs7vDuJgsiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3y1EiME; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c5675dec99so458005385a.0;
        Tue, 22 Apr 2025 02:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745312506; x=1745917306; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bI4tM5u6hlOmKAY3jmb6sm9muPDkxLfs7d3SJ5djx70=;
        b=X3y1EiMEt9UYslUa1kg5GJxLXlxZpahsIz669QuQ2XdeSS4dNRHLZQ83L1nWko8U7o
         7JI/5YdkZimREjEp6iqnAANmGoo0BAcviaA7NpTwrLkc7BOgyqE6K3VZdzQNw6gc+Q4m
         G3uAV4aVaQd3fV6oM6CjaJGiv44Tzx4mOxjwcAHJ8mkZ7X9lraJC2+BasBmMOw42nw8R
         LWnhLhssrJg1bcRBepDEASf4jKVpWacjs6Bv0IH0S4irfRNjf4Y1u951Y3QKMwwZuQsT
         /v7KpGYu51cNBk7d5dvhWVKFFYGYVqdAeQGOsmkdcoajri/4Leul3Ejmpk7d0keANkzZ
         rkMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745312506; x=1745917306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bI4tM5u6hlOmKAY3jmb6sm9muPDkxLfs7d3SJ5djx70=;
        b=jQ+ZNiIYr1YmNIwXmZFyYnTRmNEd+huOCV6uf3L7Jwh0x722upnRmu2LR2cFlKusvJ
         nulnu+LUh1/J8bi5Kki2isQXzgFEIPAeaTaF6deQYq3bvwqtYwoRHw84NZKqFj+A4dy5
         imYMlRmI7dOqDqsS5ck9Mb3SGej0eedvec2lH5sz5y4RPeL9IwCBCPhElXcVDp3Xqkjo
         YGJww1+oJMnGpxZ9wfD1hnAZUdhBjoTpJbGk+CdTjO1W9rsvLoqIK3AAMBB4wD390Tw+
         S17AD4gUr5mv5HeQLeZ8tGKS/51OZtEuuIqVLJQngsXG4XpEr/U61YCoQkh1Vu3AkQZ7
         zDAg==
X-Forwarded-Encrypted: i=1; AJvYcCUUZfib64LKeYo/8C4gL9cBWF/i0zTtBI6GNaE6IE1CVb/9+qPDmoufvrnt6WC2EaE1b7PALO1x/B+N@vger.kernel.org, AJvYcCVIXf463i0d5xm5KvwvTnNA5RtvWDY3+XE+Xg8kSJ8zBXigDHJ1vsZMJVYXYpR2ETpeG83gpl8axfjJ@vger.kernel.org, AJvYcCW7pQJagTqNh3mjmn7isvA9qTTdoLiUTuMHlXFayuBQIe2O9t6cqn39SXi6SD7I6NO3cl/khslYxtek@vger.kernel.org, AJvYcCWgwa0UCnn1RTNUVeNhyW27K57DCJRX5ilpKAnOJdNgeovCNsHZWcsydck+RPdep5Fapm7GUt7W@vger.kernel.org, AJvYcCX5Suh7zeF+y3iMoq4xKPoyw5PWa1R2/HpsCxiWfxeqCLU5QdyQe0VDVzhezkzVGw2tIN500TQ2KqAJ@vger.kernel.org, AJvYcCXV/I+cAC3ybTHHn4h5rr7lzLIjVchDg6/i3jjOhX7pHfpRKoLj2MFu/nNEuQ23RNjFiCbu26TRXfmjPP5m@vger.kernel.org
X-Gm-Message-State: AOJu0YyeGm7eVLm6XUyFg2Zc3Wsi+kFcg2caP9nEkmiB3KaTOxmSx0Hr
	zZI0n4WtO192hoR8JteG+16veYHKSo4uhmbW7wcaRY+D+qn/t+np7duE0Po9CyDCOUVy6Dn9+TQ
	geZw4U4rnB8XaDD2TyBW7OxU83vM=
X-Gm-Gg: ASbGncs0ARJqzrwVxfQVOA4fhvoo2W/pR1t5LgWpkKq+8bMgPBD+OdIIylN8QxAgS6K
	1r20SvH1DZp36BDFbjyH5MPEchB2PmxX0IumiNEKrXwdI4Q2W0plpbVK9GWrZ2Eioyc9bM6/HvI
	LUMDFNTo2PMzTfRGpArVCytCOaV32bO2lX+I1f7LvhbiCdzsAijZ82rQ==
X-Google-Smtp-Source: AGHT+IHPgdQcr6+EJ2c2GBm62vKYoe1rNLruGx6vpyIyteGjKou1apc6OLDwP+NZ9T6S5hjDnfeJTmR8mETK+wK+bzs=
X-Received: by 2002:a05:620a:2684:b0:7c5:5909:18e5 with SMTP id
 af79cd13be357-7c927f6f84fmr1960081385a.3.1745312506200; Tue, 22 Apr 2025
 02:01:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
 <20250416-wmt-updates-v1-3-f9af689cdfc2@gmail.com> <20250416201407.GC3811555-robh@kernel.org>
 <CABjd4YyTKquLcYC+DVg_koi3p7AhqwBNiazCiC713DQKjCaBSA@mail.gmail.com>
 <CABjd4Yxi4SLqsAk_fb9C=1BW6XjnZ8LQ_JKYu6KZ3TtMS0fnhg@mail.gmail.com> <14de236b-e2a7-4bde-986d-1e5ffddd01b4@kernel.org>
In-Reply-To: <14de236b-e2a7-4bde-986d-1e5ffddd01b4@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 22 Apr 2025 13:01:44 +0400
X-Gm-Features: ATxdqUGmp6GiWAgqNWbO-0WSin1O6yJxUf9gHQTl5ZTyEce7EbX-dkQTVJBozo4
Message-ID: <CABjd4YwpKYr3q06E7H3upFxyUT6uGg-Jzt2_FiyfS8R=j0ye8w@mail.gmail.com>
Subject: Re: [PATCH 03/13] dt-bindings: mmc: vt8500-sdmmc: Convert to YAML
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
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

On Tue, Apr 22, 2025 at 12:08=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 18/04/2025 14:38, Alexey Charkov wrote:
> >>
> >>>> +
> >>>> +  reg:
> >>>> +    maxItems: 1
> >>>> +
> >>>> +  clocks:
> >>>> +    maxItems: 1
> >>>> +
> >>>> +  interrupts:
> >>>> +    items:
> >>>> +      - description: SDMMC controller interrupt
> >>>> +      - description: SDMMC controller DMA interrupt
> >>>> +
> >>>> +  sdon-inverted:
> >>>> +    type: boolean
> >>>> +    description: SD_ON bit is inverted on the controller
> >>>
> >>> This implies I know what the non-inverted state is. If you know, plea=
se
> >>> state that here.
> >>
> >> This is a tricky one. The only answer I have is "it's inverted in
> >> later versions vs. the first version I saw in the wild, and I'm not
> >> sure if it's board related or IP version related - nor if the original
> >> was active low or high". No docs, no schematics, no vendor left around
> >> to chase for answers.
> >>
> >> Will dig around some more and update the description if I succeed in
> >> uncovering any further clues :)
> >
> > I've found some extra clues and would like to consult on the best way f=
orward.
> >
> > It turns out (if my understanding of the decompiled binary-only WM8505
> > vendor driver is correct) that all chips before (not including) WM8505
> > rev. A2 treated their "clock stop" bit (register offset 0x08 a.k.a.
> > SDMMC_BUSMODE, bit 0x10 a.k.a. BM_CST in vendor sources, BM_SD_OFF in
> > mainline) as "set 1 to disable SD clock", while all the later versions
> > treated it as "set 0 to disable SD clock". Which means that there are
> > WM8505 based systems that rely on either of those behaviours, while
> > any later chips need "set 0 to disable". This is not a board related
> > quirk but an on-chip SDMMC controller revision related quirk.
> >
> > I'd love to switch to a compatible-based logic and drop the
> > "sdon-inverted" flag altogether from the binding I'm writing, but here
> > are my doubts where I'd love to consult.
> >
> > * Looks like WM8505 rev. A2 needs a separate compatible string vs.
> > prior WM8505. Can we have something like "wm,wm8505a2-sdhc" and
> > "wm,wm8505-sdhc" respectively? WM8505a2 not being an actual chip name,
> > but something discoverable by reading its hardware ID from a system
> > configuration register at runtime
>
> Then maybe it can be fully detected runtime? E.g. via soc_id driver (see
> drivers/soc/)?

Thanks for pointing this out! Yes, it should work. A separate
mini-driver to identify the SoC based on the system configuration
register readings and a match table on soc_device_attribute inside the
wmt-sdmmc driver to differentiate between different controller
versions which are all identified as "wm,wm8505-sdhc" in current
device trees.

> > * If I introduce new compatible strings for "wm,wm8650-sdhc",
> > "wm,wm8750-sdhc", "wm,wm8850-sdhc" and "wm,wm8880-sdhc" in bindings,
> > DTS and driver code, then the new driver and new DTB should work fine,
> > and the DTS should pass schema checks. New driver code won't work with
> > older DTB unless I keep the logic to parse "sdon-inverted" which
> > wouldn't be part of the binding. Old driver code would not work with
> > newer DTB except for pre-A2 versions of WM8505. Is that acceptable?
> > * Existing DTS doesn't differentiate between pre-A2 vs. post-A2
> > revisions of WM8505 and is bound to fail on the latter
>
> That's an old platform, so we should not break the ABI, thus drivers
> must fully support old DTBs.

Noted, thanks.

> > I realize that breaking backward/forward compatibility is undesirable,
> > but frankly these systems seem to have few mainline users, and those
> > people who do run mainline on them ought to be compiling the kernel
> > and its DTB at the same time, because the firmware doesn't know
>
> There might be other users of DTS and anyway what would be exactly the
> benefit? This hardware aspect is already documented via sdon-inverted
> property.

The benefit is rather cosmetic (to properly describe different
versions of this controller using SoC-specific compatible strings, and
to avoid defining bindings for random vendor-specific properties such
as sdon-inverted).

Best regards,
Alexey

