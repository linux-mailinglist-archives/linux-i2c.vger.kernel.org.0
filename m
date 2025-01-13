Return-Path: <linux-i2c+bounces-9039-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F530A0B0AD
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 09:10:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6704B1886D0D
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 08:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2624233126;
	Mon, 13 Jan 2025 08:10:10 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C323C1F;
	Mon, 13 Jan 2025 08:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736755810; cv=none; b=DCaazYPKoj5Ta5xX4AN7KGcksxBZXPV277A3tlufrBWnQqOjF8+HC0gcOv2UleGaClULTbfrv+wdRDz+OJGWTLiK5VoksmN+3WOEsb4nGlkSJYtBSa19TDi/nCeEbE7fFcBJYW5iNfzCoamMS+66mklYV4ahGtq4na+UGkIPTGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736755810; c=relaxed/simple;
	bh=KUP19CBPlWnF4WbhYye1kUyQMeg1o09e0rMpEwuDvZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RQzCt1vb2511b3e3fFIPQxpb4rHqrnxpLMwLExb/a2cNL22kyQjyFLcx7qifhJ2i1ymL37AYjsMDlOLFP4ULageGjwwb1P/G3Efrc/hpTaMWzdfGbm1u3LIOVVpgJFf274IKVZIXf8xfrCCwJhDraRQ7f0MfbLicnxMs48t4K3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5174d53437eso2441958e0c.2;
        Mon, 13 Jan 2025 00:10:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736755806; x=1737360606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cqoflRWAIIvp3iBCoqoyW1G3QiFiry3WkShjso6WtEQ=;
        b=VNjv/KigQcPMUuyhe8DcSJW7Y59CFtWf/C750W4Jx1BYkbXLyBHizfiXphZPWayKKH
         BNPGidZxsJUvM/D5DgoxRi4syaKmtNawpqw8TPSGdKuGxJs1qHNoV68Gz3nXxD5skDpT
         q+WWfppr2413QIjsOr1+wisxgG0KcHywV/EPt2P1NMTArkokpDKh4tuEZzCk57YQ0HBL
         V6OYWNd7nL73qIke0mLe/py1KZDS8IY4hhX0g0QXf8RSey6ro/O6hhA40ntk13dS10lR
         9Ww+rGg8kU4r+3xb6jkKJzZsqrIigpBnaQGs6O/k/4xiDj/PL2JC9QNwp3Z/jeGFi+nJ
         jV3w==
X-Forwarded-Encrypted: i=1; AJvYcCURr90eR71m0dNorOX0+gP7o33pC+qgQG+HPTskB4wAcjOgfdVZfyCtXrYXTNkB6F7yW0VIihdrCbcdjE/B@vger.kernel.org, AJvYcCV6EXLy64FKIN/Y0xGGlfaXz76uUCFY3S5oF6wTHWq7dKyxjM9rLomEaogJtx344g9a88FqdKrnK5c=@vger.kernel.org, AJvYcCX4tnFE45yID0kP3t+kRDG50XWmmX4CAC3h0IkYdlgIMIEm7wcvFwhu5TjrDoFEgRQ2J/eGQERxmWWg5/ez4GnVb0w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDI+hrvEDg6EISo9HFuhHNucStq0TPC6AfJz10VEBmNFs9jzAL
	wODmU4+Anz+MgVWK3MmQYvwIZYR2FqfGjVZvW9mUiBpLOEi4S/u1kmKMm5Iq
X-Gm-Gg: ASbGncvpZbOBHkMilE13W1MJX0iQXeAaoN4o9xTFsZwj/LDsKeh/W5tUEnbMBYBcLm1
	dnh6AoxQfvsCaaFsxiuMjb0m8+9oHEqh3REX+auP6UjjGaZhYBZZwC9N9NPyPUiRh4jJ3hyXIrk
	JzNdQ4OBIc0xJh1d39+u/LQDPg1Bu6v1cgAXd2nrNKlGmep09H/gsfzn11bkxwIzlnJnRqUk4tA
	9pQmd2OIMzcBUv/bYSOUQf0i0aezcEgCahi/mozdgwo5Avahm/ef8kPIiU0eKgdZZGHKIPNsI6c
	Vg5CM0qyLvlLhLAjG00=
X-Google-Smtp-Source: AGHT+IEEvru1B6VRxd+7PB2kTMBp8XjhBYjUQhT5VLqZ+ch9CA8hviA758w6aBVMhE6yKObxdlaAuQ==
X-Received: by 2002:a05:6122:828f:b0:518:a1a6:4642 with SMTP id 71dfb90a1353d-51c6c3049femr16325567e0c.9.1736755806340;
        Mon, 13 Jan 2025 00:10:06 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51c7fb9bcd9sm3456431e0c.6.2025.01.13.00.10.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 00:10:05 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4afeccfeda2so2434940137.1;
        Mon, 13 Jan 2025 00:10:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWrzMIe7FT6E34eUZXclr5Ll8zbkraUBnqltfVK9g0gDpFYYY7kZZyzsORHJt1QxHL68nm2gybPGCyOh3vX@vger.kernel.org, AJvYcCWx8LkVN49nLNolf9YwMyMl4cc7ePmJKWF2lhjH9P+OFBA+HWvLvjMvabu0oeZ0PCiWebp53tHp9L37lyVT/U/bLSs=@vger.kernel.org, AJvYcCXR1xX7wXAMm9pJFZ7hEer1EtO07bBjRkZm1SX/55AZUNT/YcVvr9ugpcfBQP6yTVFgYFd91ltDk9Q=@vger.kernel.org
X-Received: by 2002:a05:6102:94c:b0:4b2:5d65:2c7d with SMTP id
 ada2fe7eead31-4b3d0dd0ddfmr17697345137.8.1736755805482; Mon, 13 Jan 2025
 00:10:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103091900.428729-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250103091900.428729-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAHp75Vff+S6Cx4VqJ_TEGvbQNN_ZTV15fK-+B8A82qR9LsTEZw@mail.gmail.com>
In-Reply-To: <CAHp75Vff+S6Cx4VqJ_TEGvbQNN_ZTV15fK-+B8A82qR9LsTEZw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jan 2025 09:09:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU4a=Q43A3uHyFpQbiWiefBsGBYuzwCjOBDvA-UUaj-rw@mail.gmail.com>
X-Gm-Features: AbW1kvZ1RVr9uYRgWIqBP0cYgr_Czc6feTT0MyReS8eceUYTU_q41B6ssMkoyk0
Message-ID: <CAMuHMdU4a=Q43A3uHyFpQbiWiefBsGBYuzwCjOBDvA-UUaj-rw@mail.gmail.com>
Subject: Re: [PATCH v4 4/9] i2c: riic: Use BIT macro consistently
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Prabhakar <prabhakar.csengg@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Sun, Jan 12, 2025 at 3:25=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Fri, Jan 3, 2025 at 11:19=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Easier to read and ensures proper types.
>
> ensure

I think the original wording is fine, as it really means
"(it is) easier to read and (it) ensures proper types".

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

