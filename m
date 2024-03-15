Return-Path: <linux-i2c+bounces-2369-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C995987CDBB
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Mar 2024 14:07:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0741A1C20FA3
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Mar 2024 13:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37BE925564;
	Fri, 15 Mar 2024 13:07:17 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D992C188;
	Fri, 15 Mar 2024 13:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710508037; cv=none; b=uq28esz8R6TGNL3UEZX3do2Q3szF6XV1XHFvml+jqpYOEYuvGpzQVnQX+5yQd2ChD05TI06NxILtjRn4LnWKRRutVB8AWqwLQDnqcBMZUaf/opB/UZlu6Q//QmD4DVQJbhofFk5XStKFIepdaIj5yL3IdX3FK7VXf5PxuEO4+Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710508037; c=relaxed/simple;
	bh=Qr9kR+Tt4+oAHDpJT35SdyDEr+xQzbZe41wY5knNfiI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rfHwSV9t+UtURBOaPxIA6V3WxJl6pPW5UUjkdR5kfR9Nd5NXPXn0GW2AI0tXUWmPZ03r72JlnE2h09QEzaSUDMIRz3J+O3CbNl33h7QaelWYH2q9PwbnjPwZrm5JcSWWIsFEemKxV0/PQkgXYX1f/BBbRNVzEgfcLiIC5FNw0jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-60a3c48e70fso22545027b3.1;
        Fri, 15 Mar 2024 06:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710508033; x=1711112833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9rOBEjwt94At0KX8hgZNX+vcy5XFgHmof560QYmcvh4=;
        b=Hh6JbI3Uwdk+w81qSOWsVR8DcPEs2Hk+tXl8ZAlEDULNVsSB+tI/+AEoTr0MUnIkzF
         sQ+KGAMQ0ZHUMqAq3etA3hPEmmQjsfpMJiTGqjE4wXrT49aJlPtTGMp7f4DxBZ1dt4Tm
         bvT7TJY1pi/4Q52UE020brblra6BybFC5jQasCcmcaJD1KVMmmVp8wnAbmYvzTQbLGXb
         f9QAIujaKniKJPj+d/BegW0Hihuo4QRjQt0FZoXzXOyMT2YMJY85SJT+abBgsGnKX44+
         yMIU2nak0BJY9GAl1eMXkaooVRzEHuPCYHX27T3f+mMVjtE7nWsunwhFbku5cc9zlVSI
         RNKA==
X-Forwarded-Encrypted: i=1; AJvYcCV+LktzYowSfgNv3uWHIGTk0RIHGXzz+cgUgIcbWchFwN5+N1pKA1Sti7V3GUpDB57yt8WEXj/ruCscYP+0oCeodr4a7rvxXnGc3ZiCGLJMVWYcIgdyV1M4I2PKbZT2YbJKR+4LoALcfMqVtX7a/wt21Wcf7LG3hGemYOD1hmsUYbxn6U43AdBKraeEvUdbPNyt9hDy/XJpm/83r/1sZshXfkYgc9XP
X-Gm-Message-State: AOJu0YwaBkv8ZeAic3i1UvixA0eXHuIImjfEP+XsT9z+bP1YQH+ArLlf
	K1PS2gKvg5nRhMzvlZi2p4mf1iZhwWL+RGn+Ct0HEunz/C/I4ZvIVHU6LFY+Agg=
X-Google-Smtp-Source: AGHT+IHseiZ8JEXQOMz0qVOIe8N7n8O00B9o3p6fq2bgWAEUvsnsNCT3hieEku4PYcrTrBEgzdBOBQ==
X-Received: by 2002:a25:be52:0:b0:dc6:c32f:6126 with SMTP id d18-20020a25be52000000b00dc6c32f6126mr4454505ybm.22.1710508033364;
        Fri, 15 Mar 2024 06:07:13 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id g13-20020a25ef0d000000b00dc2310abe8bsm674914ybd.38.2024.03.15.06.07.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 06:07:13 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-609fb0450d8so21908067b3.0;
        Fri, 15 Mar 2024 06:07:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXZwhsxCBi0FxtZ8KOy0RIIwWpLrFVz/+VOjRgo7siVFbb8lbZ9SrTFqGDzW+m6jijdNagMW2ta/jm6Q12qnPjmgH49VMJsyMUZ6/lRAZitOTFi12zHfc433uNc++xWDukF7FE3z4TB3p7OiBtji3UV90UQ9CzQEF2HaRcK95YyunC7po+IwsUoamRGoj7VCGoPt4jcve8pqLjIu5cSXKK6PX/EEwTm
X-Received: by 2002:a5b:24c:0:b0:dcd:b034:b504 with SMTP id
 g12-20020a5b024c000000b00dcdb034b504mr4405291ybp.27.1710508032362; Fri, 15
 Mar 2024 06:07:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240315103033.141226-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240315103033.141226-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240315103033.141226-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 Mar 2024 14:07:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXyiS0tPnoQdQML9EvZtzyELt8bMP07+-xV3E5BjaFWKQ@mail.gmail.com>
Message-ID: <CAMuHMdXyiS0tPnoQdQML9EvZtzyELt8bMP07+-xV3E5BjaFWKQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] i2c: riic: Pass register offsets and chip details
 as OF data
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
> With an increasing number of SoCs reusing this driver, each with slight
> variations in the RIIC IP, it becomes necessary to support passing these
> details as OF data. This approach simplifies the extension of the driver
> for other SoCs.
>
> This patch lays the groundwork for adding support for the Renesas RZ/V2H
> SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> - Dropped family from struct riic_of_data
> - Included RIIC_REG_END in enum list as flexible array member
>   in a struct with no named members is not allowed

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/i2c/busses/i2c-riic.c
> +++ b/drivers/i2c/busses/i2c-riic.c
> @@ -453,6 +461,8 @@ static int riic_i2c_probe(struct platform_device *pde=
v)
>                 }
>         }
>
> +       riic->info =3D of_device_get_match_data(&pdev->dev);

This is fine, as all in-tree users use DT (Linux does not support
sh7752/sh7753, which seem to use the same RIIC variant as RZ/V2H).

> +
>         adap =3D &riic->adapter;
>         i2c_set_adapdata(adap, riic);
>         strscpy(adap->name, "Renesas RIIC adapter", sizeof(adap->name));

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

