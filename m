Return-Path: <linux-i2c+bounces-2845-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7893089DE72
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Apr 2024 17:15:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FE1028AA6A
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Apr 2024 15:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C455913A888;
	Tue,  9 Apr 2024 15:10:22 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997AB13A875;
	Tue,  9 Apr 2024 15:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712675422; cv=none; b=FwYJRv/DRpsuWGLd5ZZg+mq8qw/nKzZGvhI3RQ+smHrPKgAfAB50lsbF4jwQCeBNc0ef9tysuNQbcuEXAFO+SpRNSrcuvABpib/KlGYrm1gT1P6z8KExwjB4xPM44WrIroetvo0guLiDw+YseDujD/BztplQ+ewyRF7IHealCZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712675422; c=relaxed/simple;
	bh=OSR3v33z3GyfOGpNy2e2PuZ7HcUErp92Ny0BMAv8boI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GIcU9/whZQmOOrQgvRLiqRR540i9PjELRj46uFhy5Xl4ViUmHCEsddAI27bPoUVNZRtTNO5t3/JvHUDz9LB2b6pKQchWzwoSFKQSyPcJzf3aACXuuGOIfYertC5AG5w2w9LK90dhtAmamJwtvTksMYsr/WTy4ttmwuJoV2Yyl/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dcc80d6004bso5784884276.0;
        Tue, 09 Apr 2024 08:10:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712675417; x=1713280217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CrXgi9emwgSEedtpKFZ9CSpUf1af1pgKd2Pn8tKxkk8=;
        b=E4A15QDUobfZmHSs+6nNSMKK1Hrci8uRmiNCguBtNbNkK+Ns54/zN/+dnP8y1crWLL
         na6PfCCfaJBUg4pYZmLXr06LKcmqTPZDBM3NEWfHRWYWmRaufT7JpOsllngJsbuxJyq5
         QR4xHbOaZfprQ9WQ67/qarfn5MkyfFUhfvAkF/GcHyvgv49jh3ZFmn+7y1Mtxt2b0N0B
         zqJn9cnRjlgSTJRsHatLUIFGeX9NHSbjEX4LLQ9O3MPiZ4aStRHnj8OLvNWfrhzzASGe
         Ru2qAdudEbFIyxH/VLSzxoi1XYy/KD9UodwLNqZZm44h38QpqPlDe2lJ9WqY7fNB8egg
         TXzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkfKI0TUdxgTdm3UNs3IPpB43blBVYbsv7CDszfE8QWYuWPiODqLiO/rzZDtPh7MpSFzaDwmx7IhjPbEvXfTYwkQRdeA8mquHuOwHLaiT8j7lwHa79loMU1WnufRGuSDBUpj2NueztPwUz3WAePG3gEcUX+KWgkv8eLOm9hBO3XToAt5/HQ0VB8Th1uMhhJJdqCLGC0/AdkclhmImmWpNlHd71//+qXerCCRsepODNlgWKqxFS3u65GnQ=
X-Gm-Message-State: AOJu0YzHNFgDfe3q0QXgfCxfYOl4opkJZRjw2gdZx6Ohedk1S538AlBb
	qCTMNilH6nh2tK4Le1DZN0rcP0czoTEXoNnh+4Sy2TqZvx0qGtm8Mi5il35pISI=
X-Google-Smtp-Source: AGHT+IGk8Ka8ZZ0DADYHP7KCjXZs7r2ukE2BDq4B6rpJMA5epwYJh5o4HVPr98i70WeTQ0W/idR+9A==
X-Received: by 2002:a25:9185:0:b0:dc6:4b66:2636 with SMTP id w5-20020a259185000000b00dc64b662636mr31242ybl.19.1712675416599;
        Tue, 09 Apr 2024 08:10:16 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id u12-20020a252e0c000000b00dc6d6dc9771sm1758319ybu.8.2024.04.09.08.10.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 08:10:16 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-de0f9a501d6so2233708276.3;
        Tue, 09 Apr 2024 08:10:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/ILYuJ6MlYcbPGL90tDRbwYzzqLCJ1IGYj2Gkg7T2VO304SYuETXk9UN/nC1ZE0BQdA4TnP6WBlFwPtWIioivK3s75RhLszfl+gcvSNLdX2sj2gN/LYQIezPo+awoWfDrqSIPjxfxenQqwP4Yt7JX+hhyNugyCLHkbr/YdC4BF0OBDSGGPr+rbD4LUTendA17qaqqbqeN++re72q4ps755wpGFoE5w5Ecvgl9zOjqxDCwPY3G6ViXDu4=
X-Received: by 2002:a25:3182:0:b0:de1:1b5d:9599 with SMTP id
 x124-20020a253182000000b00de11b5d9599mr48436ybx.5.1712675415582; Tue, 09 Apr
 2024 08:10:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240409053704.428336-1-saravanak@google.com>
In-Reply-To: <20240409053704.428336-1-saravanak@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Apr 2024 17:10:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVL4xUMARcze=ZyZA=Hi3=nvfZ34juSKG7cgA5ygxASaw@mail.gmail.com>
Message-ID: <CAMuHMdVL4xUMARcze=ZyZA=Hi3=nvfZ34juSKG7cgA5ygxASaw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/2] fw_devlink overlay fix
To: Saravana Kannan <saravanak@google.com>
Cc: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Saravana,

On Tue, Apr 9, 2024 at 7:37=E2=80=AFAM Saravana Kannan <saravanak@google.co=
m> wrote:
> Don't bother reviewing this patch. It needs to be tested and possibly
> refactored first.
>
> Geert and Herve,
>
> This patch serious should hopefully fix both of your use cases
> [1][2][3]. Can you please check to make sure the device links created
> to/from the overlay devices are to/from the right ones?

Thanks for your series!

After applying the first patch (the revert), the issue reported in
[1] is back, as expected.
After applying both patches, applying[A]/unapplying[B]/reapplying[C]
overlay [4] works as without this series, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Note that the state of /sys/class/devlink/ after [C] is still not the
same as after [A], as reported before in [5]:
  - platform:e6060000.pinctrl--platform:keys link is not recreated in [B],
  - nothing changes in /sys/class/devlink in [C].
But that issue is not introduced in this series.

> [1] - https://lore.kernel.org/lkml/CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8x6=
=3D9F9rZ+-KzjOg@mail.gmail.com/

[4] "arm64: dts: renesas: ebisu: cn41: Add overlay for MSIOF0 and 25LC040"
    https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.g=
it/commit/?h=3Dtopic/renesas-overlays&id=3D222a4936b0d3dabd43bdffb3a578423b=
ff97b02d
[5] https://lore.kernel.org/lkml/CAMuHMdXNoYH8PJE1xb4PK-vzjXtOzrxNJoZhsHT-H=
4Ucm=3D7_ig@mail.gmail.com/

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

