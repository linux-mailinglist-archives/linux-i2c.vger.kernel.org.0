Return-Path: <linux-i2c+bounces-8686-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F32BB9FA3B9
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Dec 2024 05:13:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EF091688A2
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Dec 2024 04:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88BB4224FA;
	Sun, 22 Dec 2024 04:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ll6vGIFQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECB41426C;
	Sun, 22 Dec 2024 04:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734840802; cv=none; b=rPuAslSMNuHAFtTNTUIo4MluYQey6D++XYAQNHo4Q++MazEXT+padpHL/vC2Ju4OZRPOiM3E2/iBKGy4ntdUWWYKpsUNRljAjcbuh/pUlum0T9feXlvT9WdscM/STAn6QClvg1RAG+Ns0UjRLuoG5y/futaar8wdoB+VmNfaZFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734840802; c=relaxed/simple;
	bh=zd/nqd9g0QIs2BXAGtvonFWGrkUZBdX3isKRYOQbI98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=mPDQL5dhogNzQcRipEey362E4UA/DX+yj03vrs+mHV24a286ifxr6yHLCLFDEOtqCGBrmSe7sMUxNH/C4rofHICfpBpqoX6RgVtdX4WL2/dwswzAB0hHfcShrbE3RT026bKM68tN4gIvziholQG9HuaO25I8dOGXEOmjts/PuOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ll6vGIFQ; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5188311e61cso1050669e0c.2;
        Sat, 21 Dec 2024 20:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734840799; x=1735445599; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zd/nqd9g0QIs2BXAGtvonFWGrkUZBdX3isKRYOQbI98=;
        b=Ll6vGIFQv87m0UldDhwhB+jt3VsEPZyriUmtLQEakmMRJBhO3crzRp0czBCF78OrSM
         mnhnXHrvvSyMqliCQOi28DKfEqyKD5Vyn+xNXjIbpqErWWnQ2vnTgmak2Oh2hn9uR5Yt
         sAOXscH48Wgj+VHDSgNGS+QqJCZzXh8FI/77Vw9o97UKoLXmTmOseWwDlnRtxmi1WMjt
         I143BQzjPDEradbVNEBPrn8AwHmt3A45SMFLSgq864PtAGyGyJcGetQ6rMsciMAJgGtp
         3Qa7lNF+uZDQAGEwW5nUxcujMpyMZih0ktmclqIqyL8po7KohvcfgszY21b69H6V5nOD
         JVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734840799; x=1735445599;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zd/nqd9g0QIs2BXAGtvonFWGrkUZBdX3isKRYOQbI98=;
        b=Die2G7Be2Os9tR2pSaDFq/l6l3cNFiPwgWY5QetArTpyj3W/EdXIiYzUX01yev6OZA
         GI7+o+V9KwNZL1JnhH5bJtx/9ky00NG02hKbCukYGhDN5FkZrRTnTxMU+/b7bH82Dn8T
         2jPSeKNhr91IaH6euYpb4xioGeuVotX2lFCh1hNtTchjtcyTfMj6o+v363eZqoJMmUXH
         i0+YoztE1qgby1/43QuRSUFY4KvDWZh/bjNMMc3RQXCrOtbADG6NPYT5ROmk3hcpXUby
         VF4JthyXAzoQtmPiYFkWpNbpMP/u4v3vz8KykvGXWQkBWS3DHTwwmlyPPPK4p3NpYj9e
         BbRg==
X-Forwarded-Encrypted: i=1; AJvYcCU623uVYkg8qXIesgBs7MDqcGb9lXv3E53s6L7uOAKn8CALWyzuWbCsOvtRUXNvxfOQ58tSSta/nhgPNgwv@vger.kernel.org, AJvYcCUQdl57gYWt7FdBcJWqIrBnksk5oYXfQowthTcveCafgug6KgOMv21wJG1EkFGS1ltzZ4eXwBbhm12beLyDB9eC0jM=@vger.kernel.org, AJvYcCUnn1L/z5F7dZo8qWCoWSNtyBeeIs58pgDiXB7faH6Hb/xdwwLYYwr9dR2FMiFwXp+xi4OU3mVs7nI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOKhi9qMI8uptTbRcK5LaJkHBjCNbDib7oCxzI0y+GtGysYpdt
	KwlIIizNskxxZ6KKuhofF/TR1I0+mnS4zbdzg5AfMESMfRcKU7kNobWIg5hr49notxFnU/GiGrd
	ezPcRrHXXTSxQc88q+otV7fCnxrQ=
X-Gm-Gg: ASbGncsBObKsXHuIfWwZTl5wcFlugd63o1n7d812MjLpKuqTA+txZY2m84PMwaSkbwB
	wcwi69cV5qvk0APHNTKR0W9vv21Ug7wlDAGWNTNvjoZRaOjdOdIfL8mWK4Rxo1s/SeFcQRUFh
X-Google-Smtp-Source: AGHT+IEevcd843/DitBlrlbWRQHU0qzxTcU+2lZlwycjV73Dlfa/L6QMwqwpOLnZ35Z5lLuT2+HA7qj8Tnc9uXEuNTs=
X-Received: by 2002:a05:6122:8c0c:b0:518:9582:db90 with SMTP id
 71dfb90a1353d-51b75d6fb20mr7486815e0c.11.1734840799485; Sat, 21 Dec 2024
 20:13:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241218001618.488946-10-prabhakar.mahadev-lad.rj@bp.renesas.com> <Z2XewglpALJFE1Ay@ninjato>
In-Reply-To: <Z2XewglpALJFE1Ay@ninjato>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 22 Dec 2024 04:12:53 +0000
Message-ID: <CA+V-a8vB1c8Zp+zzoHp0zFpW8fjw-xq2=KPr=dyBUUZbOhBxJQ@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] i2c: riic: Implement bus recovery
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Prabhakar <prabhakar.csengg@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Wolfram Sang <wsa@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Fri, Dec 20, 2024 at 9:16=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Wed, Dec 18, 2024 at 12:16:18AM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Implement bus recovery by reinitializing the hardware to reset the bus
> > state and generating 9 clock cycles (and a stop condition) to release
> > the SDA line.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> I need to ask a high level question first: why don't you use the general
> scl_recovery algorithm? We have stuff like get/set_scl/sda as well as
> (un)prepare_recovery. Won't that do?
>
On the RZ/G2L and RZ/G3S there is a restriction for forcing the SDA/SCL sta=
tes:

=E2=97=8F Write:
0: Changes the RIICnSCL/RIICnSDA pin output to a low level.
1: Changes the RIICnSCL/RIICnSDA pin in a high-impedance state.
(High level output is achieved through an external pull-up resistor.)

So using the generic algorithm may be platform dependent as it would
only work on platforms which have external pull-up resistor on SDA/SCL
pins. So to overcome this and make recovery possible on the platforms
I choose the RIIC feature to output clock cycles as required.

Cheers,
Prabhakar

