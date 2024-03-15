Return-Path: <linux-i2c+bounces-2367-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBC387CD6E
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Mar 2024 13:50:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B1671C221B0
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Mar 2024 12:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD43024B2B;
	Fri, 15 Mar 2024 12:50:35 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A011A27E;
	Fri, 15 Mar 2024 12:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710507035; cv=none; b=cW8VRpfibzoinNMffTud/4OBNVW+32cIW5R+hU1wD8J4sHS61CtwvUo36UND+noatf2J2P5TO+RbyU8zg0DIL7oj7r0ouh0nQbRWzrWBRcjy1EeYXzBgO2/D08/bXRniuTZJOaZ1C2HBAMvkgHxYLcgBxDTDGRVVRb3NNSa4pWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710507035; c=relaxed/simple;
	bh=yZ++9mZRTWnQ7uIb+cIR8++iDrMUYgLLXOi3IXYJ0Qc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F2BWjx3ImodXWzvzXh4yrerHjFGdjvli3eiHW6gwQKOm8fgFQeqMV1la6nRpHfYDZUZt96FEtwqIucH+uDKUz1p5xSMnOmlouRcKqRmsKsXojyGmYTkyifwXM9HbCqkN6uGxh7B3FGjl7wdL6vuyvpp1hAgLU12LonwrpqnCCGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-609f1f97864so21898917b3.0;
        Fri, 15 Mar 2024 05:50:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710507031; x=1711111831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ivoZmxEALrbzayodyx4CCgfm5Q7S/PrGQ+I3gRQIWs4=;
        b=hQeeEis/7psoi1MTnQ7CtjUJWh99AUg2JxS7UQ5N5UiqxE42fgrR5TFgNpnKgVDwHr
         NXSueefiD7dw9ajUkl9/B7HaniqsKdchPYPNki9Cf0Hk4beB9tCIsa69AxZ0eMRi++PN
         8OVPYNCdeE/UjKPmBFA6BIgrDwfIIkr9kSo7+yfpF6PoJJg2xF1yp2pPe8DrhTHEzy98
         Hhni6KSjm5tQJACGfFi7d0WwclDBtZ/O/cqHEvCDL6x5PbntZyj3+7BmuKwHwPM2XyTw
         Ft6S5AZHIyIkbfqyUNpuax96vLUrAWpkCC4PnxfVh3rtdSP+dDDLGHOHXteiMvhooyJ2
         c+9w==
X-Forwarded-Encrypted: i=1; AJvYcCXMZeBVAEueuWXYC/AWLdYvFXd0G8z12fXjxGwgmRfkqPM3/lSYWVk5XC9/Hu5L0+/cChD0TCaIVcvFNxJw4nLlpUFrx5/YQ+n15KHTFnGpV1Sc7uY8jq8V5ocPW/2EDsM0PaLF8NRDKfRcTnzpUKksk5Ro8uov3DXCsL1HDhUIRP+VPhu7jig0jifmaBDwi3f6ZyMPr16jQNrFsH9RC6eaMCRU85Ul
X-Gm-Message-State: AOJu0Yz/PCaGZJxUx4DC2FDNy0ZBokpqs+AOaLale5xL+4SlL88abohf
	aG0XrJD6j7MbHFZftfdk1lDX8vYK9eUspN7CTqrwouaurp9AanBABdiSdCMyDC4=
X-Google-Smtp-Source: AGHT+IEmS8g2iNeBgyEDXZk2Osy4xNh80oEvdvKlte5F2t6hpD+If6DD3+7RcwGtAw19BciKPC86yg==
X-Received: by 2002:a25:cec8:0:b0:dcc:e187:6ceb with SMTP id x191-20020a25cec8000000b00dcce1876cebmr4836884ybe.17.1710507031406;
        Fri, 15 Mar 2024 05:50:31 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id c14-20020a25a2ce000000b00dcda3959006sm671960ybn.33.2024.03.15.05.50.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 05:50:30 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-609f359b7b1so24140967b3.1;
        Fri, 15 Mar 2024 05:50:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUiosd1+enT/pyUgGY28LlMefvfiGVCrPdqmaUqMwfp77KeaMY9u1HwvzTcsRYqayhftZ8DwnqlRXbIv6yIo67z0xFFapvBHz4tOgEVUXXbRzDE4aTjIFOgrY87zkydfHMzVMnccSdatK7N/XZizos3Tx8fRx8IQ5pyM7H+IRkQMFMuAemGTHAgytbbfmesGTZN8dc24qx3X+ChKlhVfOudf/2eXe6i
X-Received: by 2002:a0d:ce81:0:b0:60b:87c4:2e2 with SMTP id
 q123-20020a0dce81000000b0060b87c402e2mr4717269ywd.5.1710507030599; Fri, 15
 Mar 2024 05:50:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240315103033.141226-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240315103033.141226-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240315103033.141226-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 Mar 2024 13:50:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW_WBaGjYmU_RnMnq2T7PeEafAZqyP9Md9g0VUKzgrecQ@mail.gmail.com>
Message-ID: <CAMuHMdW_WBaGjYmU_RnMnq2T7PeEafAZqyP9Md9g0VUKzgrecQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: i2c: renesas,riic: Document R9A09G057 support
To: Prabhakar <prabhakar.csengg@gmail.com>
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

On Fri, Mar 15, 2024 at 11:31=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document support for the I2C Bus Interface (RIIC) available in the
> Renesas RZ/V2H(P) (R9A09G057) SoC.
>
> The RIIC interface in the Renesas RZ/V2H(P) differs from RZ/A in a
> couple of ways:
> - Register offsets for the RZ/V2H(P) SoC differ from those of the
>   RZ/A SoC.
> - RZ/V2H register access is limited to 8-bit, whereas RZ/A supports
>   8/16/32-bit.
> - RZ/V2H has bit differences in the slave address register.
>
> To accommodate these differences in the existing driver, a new compatible
> string "renesas,riic-r9a09g057" is added.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> - Used a const for V2H SoC instead of enum in items list

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

