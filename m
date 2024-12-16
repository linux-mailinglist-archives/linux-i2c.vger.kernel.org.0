Return-Path: <linux-i2c+bounces-8525-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8DD9F34FE
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 16:53:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29C32162BB1
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 15:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F501494D4;
	Mon, 16 Dec 2024 15:53:37 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D059253E23;
	Mon, 16 Dec 2024 15:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734364417; cv=none; b=XuHkE9fGoEUxZvp9Nq/cNpwxtgh6oCDekzleBUpcqYul2WgIR+HmG0zae5F/FcBZ0hO2GErUsLEahLnG+gN3/UISDywj30iWlqVy308iJEOoKrIIVA4kNqEfJGADCpsgl9D02XPN8Pcnb/Qxoeyqip1spmem+4GlVr+A/3OEtTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734364417; c=relaxed/simple;
	bh=wUZ1i9lVo2VGEudmDjN/iE/ECduHc1tifU6tFVvAPOU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SnzAc9It6rz7SUSijr7HTJH96//QO0viagKOEs1THLCvvz5nzbKg1XlMADWNrctDMz6G69EKfLkDDGld5q6Jr/aYuXZ6mOzajTZ2VDGFKXCYWx+GxHZr3I+S51XVKjsry1EoqO/f3K1grlVAsPWujA1NS/CebdgkZZzgcqeuF8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-85c5a913cffso2155599241.0;
        Mon, 16 Dec 2024 07:53:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734364414; x=1734969214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1kDmFioBDMA7ARCl1RhR8kmWJ6/lD1Q6R02mYTOsXp4=;
        b=uGwzbk3VuAc1DqArnq9b9kWSILVQ72OPdttZtZtrObZ16NWd+VsBLJ7zcz29q/j+XX
         7YkO2MR9Xxc2jlLSMDnPIJeQV9NK9GgY/7jRcTR05KMcZoFcEHnw2v36HDa4z9IpQ0Dv
         b3/cfvu53z3fbKMRewzjhEGWW7hJBD8o5lxWFBWVjzCA3en3S9U05l6etWo32nLVpb4x
         kmoYPiwcGajdhSmfveWMw7EEivZUNTfI1YsrrI0gRa/4DIRwonY1lAxybvHVLPB5+M1U
         Bmo4J2E2aVq0Y03jG4VBjhRGw6SnNrJF8QBHqBgJY3zMihGkGLVZakY/xsSk0F5ypF3E
         t1Cg==
X-Forwarded-Encrypted: i=1; AJvYcCUuizyDrzKeTwD7nZu3sApyxeDO3aUkOZmU6KBIIeu1yEU4a9wEG2CMbvuJqbF1KVvXmbAtc4T0tKgjkXCo@vger.kernel.org, AJvYcCVinNr7LAsfTq+n7uRCxbOeDOdEVjujQYThlchUoQewunOkwLxBE4t3z8GtPioRXptAUafUTFoQtcA=@vger.kernel.org, AJvYcCXG5f0GDemW5AM4Fkl0TL6CvNhf/of0nLUB/d7f1eRsQXv1HhL6QmYHXJz8G6JJ5tNc9VulKEDg0Jm8v6m6UVLRdNU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+PItlFYcOexJzfZ/NxJEin/j4bF8ij6vVMIoMcJZvMzOfjjD9
	EKywwOfaRI01z2vfRc309AZ161UXPAH9Vn70MGNMWYwZ2Gg5/pF9b7dLsc2S
X-Gm-Gg: ASbGncs1CzaR/Gxso18JPliv/Yvki8TvKUhDUGES63fMOd3Df5BS4dtWuALCrJ61gfi
	P3N357f0Ah4oo2qCO3AZihLJRz7/m4c1zhvBg/lMnhV5os8nyjGHSdy9dzIAEa3mWOxFbPU4Wes
	Bz4aK8SEtkv9JH3yfA25n46lm+q0zLObQ2hb4TSYgv59sCDkJVPe22eyUCTc+Mq0lrE3P8UJy50
	S/ED/99mffVIKYtHjf5b+awX12GJhTuwT9obzQ9X+7dHrl6JPJDEL98kiRQ+FCbLNOSetQh8ogq
	MDmZMIPpTcHa+y+xgmc=
X-Google-Smtp-Source: AGHT+IFcDMjt6MzwD6bBEYCK1PRi7WVqEgmBSCyY8J5DOj6WHaoT68sVn5viBInFhOM4FYCWV6X7/A==
X-Received: by 2002:a05:6102:148c:b0:4b1:102a:5834 with SMTP id ada2fe7eead31-4b25ddc652dmr12570834137.21.1734364413964;
        Mon, 16 Dec 2024 07:53:33 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b270233605sm839418137.9.2024.12.16.07.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 07:53:32 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-85bc7d126b2so1912479241.1;
        Mon, 16 Dec 2024 07:53:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVoQQbQbSuPmA10i8QDcj2ecEzh/990AQhqz+chl8Sbp3NsqAyy3PfiG6ZLyH0r/jraDV2jxW12ZYmO7cF3@vger.kernel.org, AJvYcCWlKfqaZVttIZGJz8cf6rX+S4Ptf9mP+m69ADn/NY8vWI5V8j34htpFRLnWCerUEoVxImdfH52KJeo=@vger.kernel.org, AJvYcCXNVu3zZdBQuH417WA2W8zlsoxTfxaazqBopJdErdyrDzgF47Q95RjCfx3Eokm7Iib5vu5M1TN728U+ais7av7XeFw=@vger.kernel.org
X-Received: by 2002:a05:6102:c05:b0:4b1:1b07:f7c3 with SMTP id
 ada2fe7eead31-4b25ddbefcdmr12758278137.20.1734364412440; Mon, 16 Dec 2024
 07:53:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213175828.909987-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241213175828.909987-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241213175828.909987-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Dec 2024 16:53:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW00-c_=KzfhQdA5Z3eKKeU911sCjGJqft89e--_Tp6dw@mail.gmail.com>
Message-ID: <CAMuHMdW00-c_=KzfhQdA5Z3eKKeU911sCjGJqft89e--_Tp6dw@mail.gmail.com>
Subject: Re: [PATCH 4/9] i2c: riic: Use GENMASK() macro for bitmask definitions
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 6:58=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Replace raw bitmask values with the `GENMASK()` macro in the `i2c-riic`
> driver to improve readability and maintain consistency.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

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

