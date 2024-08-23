Return-Path: <linux-i2c+bounces-5734-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 701F995CBE2
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 13:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28F35284B99
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 11:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 434D3187FEF;
	Fri, 23 Aug 2024 11:59:49 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E96E187870;
	Fri, 23 Aug 2024 11:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724414389; cv=none; b=JJLNQDmR80jDGVlFdQqkYgwFhX6C5e+a2YZrf0eTDvc2+bWIG8lRTNz9C0osGGdDfjtSqyDaTmnKzl9XzKm7ozaHQUcJDwgYOWfEKhJ8AjS7fWuLv4AIEn/eWe05c2K21FX43revwQchSC8bC6AYIdosTZhPl1ZtEWTN3ncL2OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724414389; c=relaxed/simple;
	bh=/CPw1pDZrC6g/4GmnuKCceuMMGgwprttVSIiasmIHCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NXmQLI3v55pkVwoeoGUGZGR/iRmJ4PEQv9vgxiNmMfBCpAZuwh5Z4gjIUBasUPjAgRYf3Fpsw7jf6WpBKVg7CVsznQmdJqM1IAwnoq4BVcPL9cP+AZrb0olHM/ADX9mzyo+JOMFDRCZ0Zo+b0xvOVAHH6HuV5BxotDVWrFgS5Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e1161ee54f7so2110331276.2;
        Fri, 23 Aug 2024 04:59:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724414383; x=1725019183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MzZuOhd6IiwfDB2MD4HsU7/YgBssJRdCGAc62Roc+3s=;
        b=w/AUAFLaQvzL2dy2rqFNhVGqKcaEK/kAKeh+geXMEQ9WbzQHcX7BiNGW3Sqi2yMF7m
         e3zcVkqUhIs5MOMzjcwgxKqm5lHmXCISXslIEORPYqMBG4fYNIBmakUFnmmeveLzX7JZ
         r1W1rrxZPT2wj5l2qOgC+i7p9rPqTpIP1Bpzk2urm8GCA/6rhOoBhdQmhG2Eb9qiQZPQ
         iNCUvcvRvc0XBZnfLX2wZHrq3pOIqVK83mkJ+Zjwl3xDQ730qUiCu+HCIQWitwz3OpAJ
         PeHvpcO8R3VaaUoBR5mEA94GIzDZL9Q107EkDBumV5qNoC/9BpQTuieomb/hcaYwWF7J
         lcCA==
X-Forwarded-Encrypted: i=1; AJvYcCVQJMz02vub4AJJJS90LE1gtZzgCQkhtRlIpy5IdSNH3rC75eM9ts/ajA0LF5WzPo+7n9IgS4UOoPvL@vger.kernel.org, AJvYcCW29MKm3L4tWI1c4Yg4xuNoxlOzsJYxrnk8gEwAYt/Ff5FIwFj5jAfaX5aT9edLRAFo+H5zLgM2BLb4du6I@vger.kernel.org, AJvYcCXLmJ+okTzaiyfTJln677xFEwEtgW9MrUan6eEExwQusX7ay5Zi3vh7sg9I89Z2xzmq/BWfClxj+Oyu@vger.kernel.org, AJvYcCXtF9bPpPkQUbKx7cUIcsapMX7He6k+TBbjSnmOrGtWgp0BoRLAMWKP+ii2uIXwrGBdwgMcwb9G77y+3FKoGJU16xM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEz/U7OrxovWw38GZUxYHpcH2LUnf1pl57Objv0GTnxMfTsxih
	Zk5POjNX2stg9absri+6o6gVU66DhIG27cj9Y3KW5HciIrCEFJJXh/C00FOX
X-Google-Smtp-Source: AGHT+IG36/VvuCtY5jBhV3XKgyBM4ayDIVLcjNNPBaWoSxmajD8RvispiHO7s/+fZng4ajmD//hzlQ==
X-Received: by 2002:a05:6902:e0f:b0:e13:dc31:ea5c with SMTP id 3f1490d57ef6-e17a86802d0mr2220405276.52.1724414383049;
        Fri, 23 Aug 2024 04:59:43 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e178e4b3d38sm628803276.35.2024.08.23.04.59.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2024 04:59:42 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-699ac6dbf24so18732617b3.3;
        Fri, 23 Aug 2024 04:59:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUsubRnzu/Kr04BYaZunGN5d2ywXk0wLCn0NQJVJE3GatE1xgDQrBcRPG7SE2/55kVkiM1on/N/lljLMfDq@vger.kernel.org, AJvYcCWH64JOV+ZZg9mWxXLLgWTGDhUa46XaagnfWlyAOKfn0Kf059hWa6PJGBuS2+vdfQqdP+q/3aKODl6O@vger.kernel.org, AJvYcCX7Im41hwvtNwyfupzxvXRJNSSCinNVUxWxCI2UCaeWtJ+WD6jDJMdaovHWON7jlldfqK3ABhUgarBpeg4uduwwK+4=@vger.kernel.org, AJvYcCXOajhJm6139OBg7lgldNcmc0qb0wpI68zlWlSzeF8wPeTR9oGFCY623zJ7QvrfnXxs2nIVKIS78qXC@vger.kernel.org
X-Received: by 2002:a05:690c:fcb:b0:65f:d27d:3f6a with SMTP id
 00721157ae682-6c6249dd335mr24327327b3.7.1724414381983; Fri, 23 Aug 2024
 04:59:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240820101918.2384635-1-claudiu.beznea.uj@bp.renesas.com> <20240820101918.2384635-12-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240820101918.2384635-12-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Aug 2024 13:59:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUx4v6MYOv8cQ2mrKqDdk3+k5XhmfZnnW7vs+vX=1QTqA@mail.gmail.com>
Message-ID: <CAMuHMdUx4v6MYOv8cQ2mrKqDdk3+k5XhmfZnnW7vs+vX=1QTqA@mail.gmail.com>
Subject: Re: [PATCH v5 11/11] arm64: dts: renesas: rzg3s-smarc-som: Enable
 i2c1 node
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: chris.brandt@renesas.com, andi.shyti@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	p.zabel@pengutronix.de, wsa+renesas@sang-engineering.com, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 12:19=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev>=
 wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Enable i2c1 node.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.12.

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

