Return-Path: <linux-i2c+bounces-9515-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 907BDA3DE52
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Feb 2025 16:23:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5CA837A829C
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Feb 2025 15:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C90761FBC8E;
	Thu, 20 Feb 2025 15:16:27 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958321581F9;
	Thu, 20 Feb 2025 15:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740064587; cv=none; b=jyXD6fFTX4e1M67VKJ35wJxnu3067Sp1nA7Emi4WX01Itn+LbCuA3X1LsVnUobk2BRW44X7Vjh5bka4BJpavU+y0nfLK+Cgz30DTitkbddeMrUwm/dCbxEEAdd5m2oSRXKTKtPfPFRtFRvo3fts1bsioEP7Klr7P8JcMtelTZHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740064587; c=relaxed/simple;
	bh=IhOY9/JCO1dbKVVIDtcJEfxOlSnCBKZ/CY5HwYzvdxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DkKADMJuR9S6sCytl3STru2ifr4VEk3RbFJ0FnwQOQSjXR8JVILJ1mYOZys+zRMIwcyEOQKMCYVw2k6CIDbAqoUxl4ZRo01dBHFt+nTfdIjfFHjpk5rJwBgAadRkX3qBq+hmJ/l7Hw6osF9OV8ibSHUwLcujVuHxMGBiND6bsw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6dcd4f1aaccso14394326d6.2;
        Thu, 20 Feb 2025 07:16:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740064584; x=1740669384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yz9Aa4nJUKQ2wdIGmXFp1QwA03q1/SdQVCjd5FfHE7A=;
        b=vF9f50vbAOIAbUT8kWo5JeFaMgzNBmVpcPfJ2Zm/Z3Wssb2QCT8OpfFyxZuwWwn/Qp
         SlREVWCv5EFy9anoizlU8D2VG6ty2hL/8Qp7g4INZfj8AnTDr6zSVXwUTzPNeVZXmO17
         MoYC0h8I9g7flsakDggDo4doeAzZ2p9PdJ+V9u3iY4tyRAsvlQirR8aX5RZRgzkCD/7n
         /Q7pbQw/t1+u9PwGMPc2twl/zNOVemV9cszIYg0iLVh8r4koKgnXkGjROO5j7Q14LIuB
         IeAP9ryrPeZD8wbJcxoOmEl9YNffKJiLIIKw3+erQs9P02TxRsYLt7gJBi/eeQ5qrLe1
         reGw==
X-Forwarded-Encrypted: i=1; AJvYcCU+/WsDt8F7lZ298uMGK9tCZevKGL8Xpta4eKEqZFLhptQ3gpcoXqOXfsnN0M3RnXijzzOgrbdrJYfX@vger.kernel.org, AJvYcCU1pElzI5ley2+QFCPc4/NAztbmzJNdCVmlt4uv2t7azvBfoRp5pdbWUPSUakbSpC7pYK0ztigJUdYFmi85@vger.kernel.org, AJvYcCXn088o0vtJl1/9p4y2Y1jl0mI9rHML89dIg2a65SSL6rIL7kOKNu4pQKtPMY4fq/sC8mCEpqOqqd0MqVYuAec=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGxjTDxWntN0logEU/i4FoihNye/rrDYXRSf7RhuS3Ud42uPHZ
	Mo9EdFZ1ZaW3n1tQpdBFJjPiGo+nxCapTJbPruFKkWna6OZLarNLtEeBDoTO
X-Gm-Gg: ASbGncuiylbYgeBQCOMnutA9CT3LHFZNZoS/CtehEYE4/cJUsk4gxNYGLX/Y546H43a
	UgwkSQQhVucYS4UKky5y3X3ka3niCVaqVXNL6azTDpxVTF+6lG/Fi5amXXMoNhtCUeTEeMML/ov
	JPwbBbplcwZI88CX2gXOGR9TGKdz696nUQeol0fMl5uzBazrotxyIgtXhVx6e8WVbsFwXXIseRN
	eZTOjRim3YfOXxJ0V8F6puhRqFXSTEtSkAeF9mPA5a6L/ALNBuaNiSHgN0ROqCha3R0XVnVZ/de
	SBzfah6n1XxIbhkZQolJgxMgKQDE61KB6UmYPmJzx/dNQh9clHfdg8UxTw==
X-Google-Smtp-Source: AGHT+IEQlrzTiG6y/t+GMWF9pL1FKS/2u++uRzUK1lgYbNU+nId9lfuz8wAJHQmLJ2rdXWfFh+6ORA==
X-Received: by 2002:a05:6214:dc8:b0:6d8:932a:eaa3 with SMTP id 6a1803df08f44-6e66cc8b647mr368939296d6.3.1740064583930;
        Thu, 20 Feb 2025 07:16:23 -0800 (PST)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com. [209.85.160.173])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e672c1e7f0sm57157276d6.114.2025.02.20.07.16.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 07:16:23 -0800 (PST)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4720cfc35e9so16484171cf.2;
        Thu, 20 Feb 2025 07:16:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUaNWZos6OKYsk9mONpKEHxziv92eBoAqQ5XTsjfO+uCRLjzfekEdJasa7QpbSziddnIsmg86+2I8zM3i7yVM4=@vger.kernel.org, AJvYcCVHQB7+BO8KfkVgz0vIkO1N0GjrCScltpqCmwISlbHSObUWLYxNvlEC7/RwGtXP6uM/yTGRL71Kmfeg@vger.kernel.org, AJvYcCWW7tefqffpeNpSU71sJOXk8qJzSndijRoJ573p25axWhHWa56MXE8WYjWFxCix0V2P9mdpWo8kYHVBsRIK@vger.kernel.org
X-Received: by 2002:a05:622a:1892:b0:472:6f4:733a with SMTP id
 d75a77b69052e-47206f47ec1mr127522361cf.47.1740064583217; Thu, 20 Feb 2025
 07:16:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210080217.2772467-1-suhui@nfschina.com>
In-Reply-To: <20250210080217.2772467-1-suhui@nfschina.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Feb 2025 16:16:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVdKvB1UWc0-opEoAwoOejcwmrFJtSB5EUqVqZD7-vP8A@mail.gmail.com>
X-Gm-Features: AWEUYZkFZeSQptoyIGtmN3cwjufNCJhCIzkLaNlHZVq5Tc7_e1pALN-GSo40qPM
Message-ID: <CAMuHMdVdKvB1UWc0-opEoAwoOejcwmrFJtSB5EUqVqZD7-vP8A@mail.gmail.com>
Subject: Re: [PATCH] i2c: core: mark i2c_detect_address noinline_for_stack
To: Su Hui <suhui@nfschina.com>
Cc: wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sui,

On Mon, 10 Feb 2025 at 09:03, Su Hui <suhui@nfschina.com> wrote:
> When compile with CONFIG_FRAME_WARN=3D1024, there can be a warning:
>
> drivers/i2c/i2c-core-base.c: In function =E2=80=98i2c_detect.isra=E2=80=
=99:
> drivers/i2c/i2c-core-base.c:2507:1: warning: the frame size of 1028 bytes
> is larger than 1024 bytes [-Wframe-larger-than=3D].
>  2507 | }
>       | ^
>
> Mark i2c_detect_address() noinline_for_stack to avoid this warning.
>
> Signed-off-by: Su Hui <suhui@nfschina.com>

I have posted an alternative fix:
"[PATCH] i2c: core: Allocate temporary client dynamically"
https://lore.kernel.org/f9aa39362e918b62aec0567f899b37d8d3c44710.1740064176=
.git.geert+renesas@glider.be/

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

