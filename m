Return-Path: <linux-i2c+bounces-9484-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B66A3AA7F
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Feb 2025 22:08:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 061DA3A11AB
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Feb 2025 21:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C111E2862A2;
	Tue, 18 Feb 2025 21:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GuDLjxdN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9EB2862A0;
	Tue, 18 Feb 2025 21:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739912848; cv=none; b=T0aEGqfwGHLLrzuYCPnCx84ovYr9Bi+yan+qsFVQtxAGmUr66z6gw4jTlDMa2x7X2jHIbb+wwrap0PT5WCT+RtN/ykPkXG/z/ljocE5O/rVc7kBwmZ5/X1T4bs9Hk04Dmip7aAi+tEw2myY890EF7Lozk2L5XXi9Qm3uEmUkKCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739912848; c=relaxed/simple;
	bh=un1WmHqXukfmvrLkFiLVRUbAP7Kc9NnfZJdv/1KC0c8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fNkZHzlxrmfXZ/1HLSDiv7tDpLZ7dougZZnpQoNVPQK9Ob6yKxF4G0YbFl3vV+7zOPLW5BVF10RNJNJCL4TKfRDN6+X6EutGH4R6TrkQJ0+QnOBWKI16+DFRTZzBWUSTxWjhiHqtsCsgVRc7Z+eyd9gcZPURYUrz2qsoM5+Pnuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GuDLjxdN; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-52099627b5aso132931e0c.1;
        Tue, 18 Feb 2025 13:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739912846; x=1740517646; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUmz9mNlmOFx7fnJvKvu+IO94Ojxss29t7xq6j7B+j8=;
        b=GuDLjxdNa3DewrszWlvGkVoAERun6tTyefKFZd0gZzeQ7AmWPl+tPjD5yyOLxN/c//
         HBVCcbF/AR0R8Ltc0GAQP6aRIYuS1QRRxzeA4Ll0gp9yuzJElpIUdhTjrrPGeIXgSxHA
         faEnAHG2nUKhH44doCkp9V73i3FN3kS/R42FWvGZNsF801mU25hMYCibSvxI4asm2mfs
         6bAf5sX6cpQocHRxY7P3lLavUKolSmonYT61lTHq/BBNNgNU9QFyW0SvEFfJ24scZoe9
         VO96Nx66UTbKjQpSguctJpJkYerGGiwvLyxigYRh/ZATGFOTIe0ryumP16JF9uS6Qr02
         hr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739912846; x=1740517646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YUmz9mNlmOFx7fnJvKvu+IO94Ojxss29t7xq6j7B+j8=;
        b=RS2bVv0Lh2m5ZMcYSv5dK+vUTdXEo2nTVIB4zMXzH7H4aowrBEGvK9GzA28VRaf/80
         tBNevIf94Y6yS5N7x850688nUitBiSaJ85RH8OIG7+aPPU2KMdDN2MovHS08VD7/u2Lt
         hsdIzgrVvZ3ahEL9xqxeswQw1BdGjVr+b7nf/UKAyZyNQ/W2w7K2r9G5jpfF58WOoldC
         IVH5YFNAYugwTGhBPm/g64GJ4+5QJFu0yWA8IvFOqn7L1kfYLGK7eoeZAYPz8fC2sEnX
         lwuG4zG7FOHhxpCf2v9JvFaWcflCpCSKhrmG96YlIiNJiflTrIt3MVp7vYUawOrYndlw
         VMJQ==
X-Forwarded-Encrypted: i=1; AJvYcCU14GNbCnHQ40gNcDWwu0uMGgLJVRNUZzsIhg7IZ11ylU2kNL8B5ug8MPEMfXh3lGBd17we5l6moJU=@vger.kernel.org, AJvYcCWp0NczfhcueAVVFIomdyYVPYUHvh2feP4LdIDEwimj+2dBBcgYD30RDgDRm0htnLZ9ayRLz2kX6BNuQ7vS9XpdBPg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlvMm8UGes6tzDpRO3d/HHeO7poi280FSlLXiqqI9owNuSGZgE
	7kdoEfpfD5JSM5kDJjrhjNlC5ZRmHqO4nQ+RZU0IEnxLDiUoYdlTVRTX4tCtHLUY2t4O52W6Ibf
	gXC66tuNBSOX9MfOvF5xh6m7e2uo=
X-Gm-Gg: ASbGnctb7yZDh4/gfmwRGx/N6012RWToN77jVRSvGy5WHvwzF/jXiUxcq3uiTpzLcxM
	YXYH0pAimlsokYkdyTUluZG0ih7Mgy79A7ot3THqwee9LN+KLfmgoHYFzZFfiCdS6kje9qMIn
X-Google-Smtp-Source: AGHT+IHHg0gJQicqT/YRBfdVUSvVS4oKvqKpZIF+JFNtFeMUtdcvhVDthvk+zUZcJUrCA4deF8WCEbtjZPSb3k6Fgpc=
X-Received: by 2002:a05:6122:2a56:b0:51e:ffd1:67f3 with SMTP id
 71dfb90a1353d-521c33956femr1175006e0c.7.1739912845827; Tue, 18 Feb 2025
 13:07:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203143511.629140-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250203143511.629140-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 18 Feb 2025 21:07:00 +0000
X-Gm-Features: AWEUYZmBfl7qTjIPZlALeH7jw8POlOspLxhblK_ubWh16ACTMZS0xQBQJ1dlTJk
Message-ID: <CA+V-a8uesAcYB4Be1Df9w+K3NbWZBDTq1mXz2KBPVkXBk754YQ@mail.gmail.com>
Subject: Re: [PATCH v7] i2c: riic: Implement bus recovery
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Andi Shyti <andi.shyti@kernel.org>, 
	Chris Brandt <chris.brandt@renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Mon, Feb 3, 2025 at 2:35=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Implement bus recovery by reinitializing the hardware to reset the bus
> state and generating 9 clock cycles (and a stop condition) to release
> the SDA line.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
> Resending this patch which was part of v6 [0] series.
>
> [0] https://lore.kernel.org/lkml/Z4ZCJYPgvS0Ke39g@shikoro/T/
>
> Hi Wolfram,
>
> Ive replied to your comments on v2 here [1] as to why the generic
> recovery algorithm was not used.
>
> [1] https://lore.kernel.org/all/CA+V-a8s4-g9vxyfYMgnKMK=3DOej9kDBwWsWehWL=
YTkxw-06w-2g@mail.gmail.com/
>
> Cheers,
> Prabhakar
>
> v6->v7
> - None
>
> v2->v6
> - Included RB and TB from Claudiu.
>
> v1->v2
> - Used single register read to check SDA/SCL lines
> ---
>  drivers/i2c/busses/i2c-riic.c | 100 ++++++++++++++++++++++++++++++----
>  1 file changed, 90 insertions(+), 10 deletions(-)
>
Gentle ping.

Cheers,
Prabhakar

