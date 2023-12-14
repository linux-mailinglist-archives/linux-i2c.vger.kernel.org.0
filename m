Return-Path: <linux-i2c+bounces-771-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E945812A2E
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 09:19:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 016AF1F21674
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 08:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76578168B8;
	Thu, 14 Dec 2023 08:19:49 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52234CF;
	Thu, 14 Dec 2023 00:19:45 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5e282ec7537so19738327b3.3;
        Thu, 14 Dec 2023 00:19:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702541984; x=1703146784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VPc9UucRRwQsPIIhSc+Zwo7ILNiT77DD2oaIHdq0gow=;
        b=UQcJlk4BFZT5PY4eB9mQRfnmL8/ivfAvE19crMWWde9REl0k6p0MAAQm2XlHIAikVA
         /Y0RoSGcYs2VVBeQLD8Gra23fZzVcB3FQ95HGfdqGngo93MD8S+67U4nzPze8vx0doFK
         Y3fKmwiMaK4hd+oYo200dENeZ+USRQH3IUK3WqkEUJOhaaLzlxclGVVwrrIwoYwlVGpj
         KVrJikumvziTDW4AziWjdErLlBEOEIpXJinvlbJd2iCJQhUOn9pr5RCa76KOttifJjZT
         NM6+l59207Op0Yt1OV+QxctQ2bwvac+QBrBQAkvb9/Ir7cLWrWmz5bmdG9BYwHQhPuzy
         ezAg==
X-Gm-Message-State: AOJu0Yylr2Dmgd59voaCC9VTflCb9ZoeplhvYfqP7ZJ5FuGIV18Oyja6
	evE0m+cy4LVcU0Vce0hKCTz0RSwmfYKRFQ==
X-Google-Smtp-Source: AGHT+IErLVuNeT51nq/c2ikhZIrEUHQnZF3mUanKftBOAb/zlWrmJqh8EG17RQcJ7dMDl27rx6PNuQ==
X-Received: by 2002:a0d:f9c6:0:b0:5d3:464d:18d0 with SMTP id j189-20020a0df9c6000000b005d3464d18d0mr6842189ywf.22.1702541983945;
        Thu, 14 Dec 2023 00:19:43 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id x8-20020a814a08000000b005d3b4fce438sm5271562ywa.65.2023.12.14.00.19.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 00:19:43 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5e2cfece112so14356677b3.2;
        Thu, 14 Dec 2023 00:19:43 -0800 (PST)
X-Received: by 2002:a81:6c4a:0:b0:5e3:6064:e394 with SMTP id
 h71-20020a816c4a000000b005e36064e394mr979772ywc.35.1702541983377; Thu, 14 Dec
 2023 00:19:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231214074358.8711-1-wsa+renesas@sang-engineering.com> <20231214074358.8711-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20231214074358.8711-3-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Dec 2023 09:19:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW3wo5oaSpE5Pf7p6hg-njaQj1mvqwuVfEMc1YuZvisyQ@mail.gmail.com>
Message-ID: <CAMuHMdW3wo5oaSpE5Pf7p6hg-njaQj1mvqwuVfEMc1YuZvisyQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] i2c: rcar: add FastMode+ support for Gen4
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 8:44=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> To support FM+, we mainly need to turn the SMD constant into a parameter
> and set it accordingly. That also means we can finally fix SMD to our
> needs instead of bailing out. A sanity check for SMD then becomes a
> sanity check for 'x =3D=3D 0'. After all that, activating the enable bit =
for
> FM+ is all we need to do. Tested with a Renesas Falcon board using R-Car
> V3U.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> Changes since v1:
>
> * rebased to 6.7-rc4
> * gained S4 specific handling from patch 1
> * keep SCL filters active for FM+ by still writing to CDF
> * if default SMD is too large, fix it instead of bailing out

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

