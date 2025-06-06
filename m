Return-Path: <linux-i2c+bounces-11261-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86786AD02C6
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Jun 2025 15:05:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15B741899655
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Jun 2025 13:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED37288C8B;
	Fri,  6 Jun 2025 13:05:14 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46213288C80;
	Fri,  6 Jun 2025 13:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749215114; cv=none; b=TjlAQW4TkahnFD70xG0AXkuGfIEOqZQzjuu6Arb/OqDG2dpsHiVIbvsZzPoZ6ts1HVQPUomtGzunU4ZXp3i2tSqZlj0UlpcFYdOG+E0RVPHIhVPTp6Ps4+eMPApn8b7OfWHzPYYlcrNskiWqA/NS20emKv5Y5HUaBOXq5TkbHY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749215114; c=relaxed/simple;
	bh=4OB8rRNnYyxfAn7/3hyYL1XNoSisYk8DCDF9QSdxXWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YrkaXUWF7Ctu/v9ct8mOUWyMPonhxJydKMnj4jY0LrQ9AlnvmaEfpOJb8LKchu7sZHEOUv2iC3CGilBLvMTmKSj1WYcWiJ5FOATNsRyQNkFaIvHq+G70Onht4mf9cYkC6byI+e4JYDAJ4PYEsY7CFlzf8sueOccMTZKghidk/pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-408e0986303so1572184b6e.2;
        Fri, 06 Jun 2025 06:05:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749215109; x=1749819909;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P4smyQ+8WqK0jxifR87KRhifMuRayG5/N77gUPFqbRM=;
        b=czYqHBOJGa3AHoLWi48JCmxeXHDrfg5szWUef+4IcUSiY0o/cm7DFYJPiqs8RVv2MX
         POr41VPwQo4W/OLojRp+L3RJriEbT0niITvmfY4SZ0yQf0AXXbwRP6SgEJ/bhOBFt4JU
         tyKWfGsbdxx6gNfKaW4dY9+/1gQpNxk/DfxQR1VcgXJpNhtXk71Yv0fl9fKdyfOZJM/N
         MJgs5u2yE4K4cukbvz9dMvIHUD6kzVxKBWaX0yuBldbPz0uEkhWbhuq6TWYNM+OjWCCn
         RyWa0ziG0vnYZu9V5dXE9HS8bmDx9j8rP3g7fnth8ke68iZvzaY0GuQtCUz8YaOeRtyO
         QXkw==
X-Forwarded-Encrypted: i=1; AJvYcCUoBysI3oPN6mLuX0odRAF16nvXyYAAcNoSYnrMARUzNvQqmtOWCfOlS/fbs65dvvi7JEgHPnTCsHkN+cZNhk9jDvs=@vger.kernel.org, AJvYcCVdcTFfX/DGb07aOv1gukNjQRmkj9EwsNX7pRR/c+omNFwbRTv3DM2TY5zBdk4WDdjownp54aEihPahlqYH@vger.kernel.org, AJvYcCVk2OkmjGtjlyNujYMpQrogg5MyB6pWL6uXvKQASYB58YxBR4mWFRNBgGNAHaUJVYuS3Wt5/46hjD+v@vger.kernel.org, AJvYcCWMPnWAtBmGwMA6CrYuGO1e5G5j4xsAkGafwDRMg7+LMwythnlQ6x3qtPTk1yFDJ95bojiq9qU9v/iB@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg0Y8xNcoXCPmDuBax2K7BVORHClmhRJ1I9rXspUgLokisQWzZ
	86CIPc+cz1BrzybYwhit3r2Rqiz230a0GReG1bMlHveqpsqHycbVxKOl9t/AzJVQ
X-Gm-Gg: ASbGncuuwQr8CvOz/OzxXmyog8N32vUuqb/M7lkJllhsm+UEpK0Zn0eLYrlzU/nt468
	V19J6yN/Fn9J4DqtJwfkZXMl6H44DEC1DiXsoh2oo1aelgfXlYBrgpnTm4peE6gZw17ecCuZEMq
	VnvU85nlng7AhEpmCJ+Tq8WqJA3Yeb/k4PXDr1z0+vOc/OCYWVuoBhK1qYHyHdebTpX0uu27Ras
	GJo+uaxNkYmnW0uzht4B3aFe5sCBfugSTy+VPiX87AAqb8pQZIxpj8kH2hYUxcQn1hV2uDn8c/v
	F3F0llh6erdKJxhUoM4y/+XuJZxZ2v1ZgMvHms5AGG6DsK0jRE7j9lKg3gywMLKL+O57WQnraM2
	iZJkfn7VERMjbWQ==
X-Google-Smtp-Source: AGHT+IEmuW2nj1cLyaotcR1JMQ67J+dMe0mE4Y/SpoqVoE9+UQfXUp3ChqvjyWvlG5a2rMPARV4P6g==
X-Received: by 2002:a05:6808:30a4:b0:404:f4a0:7fbf with SMTP id 5614622812f47-40905134ec3mr2517084b6e.31.1749215109352;
        Fri, 06 Jun 2025 06:05:09 -0700 (PDT)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com. [209.85.210.42])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7388a089859sm270017a34.63.2025.06.06.06.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 06:05:09 -0700 (PDT)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7306482f958so1324643a34.0;
        Fri, 06 Jun 2025 06:05:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW8ntkU3G26yamwe2NBmXgIa833ehiPgTbLoBs1RWiwwE+MiNGUfCOZ4VMjiC2YLfcNS5OdAh13Kytr@vger.kernel.org, AJvYcCXYYj90O+N+UX20WyUVoyp/FOiBCkNpEmL30vKk9trY6sQgJHQRQwwuLfsFh1vkWkTLQzpj5C2Au/XsJBvEKGpSf+I=@vger.kernel.org, AJvYcCXcNqWrSS+4bQL64D2KlHSJ82xOaev2asyNqiF0mrti/s+/1KoJmb6PaTS2SA1O8H2RY47kaOVAgmCM9Wvt@vger.kernel.org, AJvYcCXutMri7ZeS02so72sx8ILBdBLus7GqczGoC7QzjnM/0yf+wMuseU+v8ycQnAsLs2cUw+XIZCFTUnI5@vger.kernel.org
X-Received: by 2002:a05:6830:6617:b0:72b:9506:8db6 with SMTP id
 46e09a7af769-73888dba453mr1953425a34.6.1749215108231; Fri, 06 Jun 2025
 06:05:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530143135.366417-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250530143135.366417-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250530143135.366417-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Jun 2025 15:04:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW8yP8Ja90YqjmAAUfwc17WnsX4kLhca_UOSMtcx-J7uA@mail.gmail.com>
X-Gm-Features: AX0GCFtMgG-6x_z__UisiUo_L1woOb8v1c-Obt5jD9EezPXLPFEEMdGVNQ-j4ok
Message-ID: <CAMuHMdW8yP8Ja90YqjmAAUfwc17WnsX4kLhca_UOSMtcx-J7uA@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: i2c: renesas,riic: Move ref for
 i2c-controller.yaml to the end
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 May 2025 at 16:31, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> In preparation for adding more validation checks, move the `$ref` for
> 'i2c-controller.yaml' to the end of the file. Also, relocate the
> conditional check for 'resets' into the 'allOf' block.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

