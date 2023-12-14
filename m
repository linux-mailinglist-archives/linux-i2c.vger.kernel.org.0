Return-Path: <linux-i2c+bounces-770-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9F98129EB
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 09:03:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 410142825EA
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 08:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD17315E89;
	Thu, 14 Dec 2023 08:03:37 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91B89B9;
	Thu, 14 Dec 2023 00:03:34 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5e2be6dde31so7332887b3.3;
        Thu, 14 Dec 2023 00:03:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702541013; x=1703145813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ISW1CmfanAMiWVZH5SdhMYK/ZmRMGW3YrjonNTWY3Hs=;
        b=Qcm7nenAzlFzQgybJ49j9LuzjRquqN0oSj2D9HElt+uhGGrScnonGoxP+wAz5C6ift
         wHDKTTCJyjutFUVbvscUY5r3QoW8ojhH/MWdDtrGkLXH3NJrpULhuF0Zqzoa+8eggPkK
         gFeEl5uQ7lwfzxS/k0EfJa1JL5wc0MfXof9EUWabxbQP39odwTzVuZ0O09Td2YsRCWAz
         5iVX57D07O/W9QZYl1QeNiPy0Zn3bsfNYjp4D0/CKSsuzhgPED157FlzTu7lr9JTcN9y
         z3u3the964t4qlPnhSV2OYxY+YJ7xOzDJdFFvxrGsYYbRKsy1iZl7FRpPoXaWg3Rig63
         pc1g==
X-Gm-Message-State: AOJu0YxkPGcqJBUsYDNTpddOdN+KcrP2Tfibd5zwid1ltX9UopSD2qAE
	C0Dv5Cvhv1+z9G9fsigj2aWpaErcTmf3Pg==
X-Google-Smtp-Source: AGHT+IGaHpC6z6ImdpxWHmgDTe/+NfA9Dz3GZI3Pp6FNfx2HbpgUJRf8by0zdsGLgUvttnEAVVtrzQ==
X-Received: by 2002:a0d:d684:0:b0:5e2:578c:916e with SMTP id y126-20020a0dd684000000b005e2578c916emr1917461ywd.58.1702541013491;
        Thu, 14 Dec 2023 00:03:33 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id l2-20020a81d542000000b005af5ef0687bsm5282115ywj.13.2023.12.14.00.03.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 00:03:33 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5d8ddcc433fso52954137b3.1;
        Thu, 14 Dec 2023 00:03:33 -0800 (PST)
X-Received: by 2002:a25:aea6:0:b0:dbc:d97d:3b76 with SMTP id
 b38-20020a25aea6000000b00dbcd97d3b76mr760349ybj.27.1702541012774; Thu, 14 Dec
 2023 00:03:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231214074358.8711-1-wsa+renesas@sang-engineering.com> <20231214074358.8711-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20231214074358.8711-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Dec 2023 09:03:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXXAnAc9A7M-qzDceeTZ=pSkzxkZRzFhXKtR2p-UtB5rw@mail.gmail.com>
Message-ID: <CAMuHMdXXAnAc9A7M-qzDceeTZ=pSkzxkZRzFhXKtR2p-UtB5rw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] i2c: rcar: introduce Gen4 devices
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 8:44=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> So far, we treated Gen4 as Gen3. But we are soon adding FM+ as a Gen4
> specific feature, so prepare the code for the new devtype.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> Changes since v1:
>
> * rebased to 6.7-rc4
> * moved S4 specific handling to patch 2

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

