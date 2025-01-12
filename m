Return-Path: <linux-i2c+bounces-9034-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FEDA0AA12
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Jan 2025 15:34:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F57818869D4
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Jan 2025 14:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3F61B87D0;
	Sun, 12 Jan 2025 14:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JA8OqbEG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9451A2543;
	Sun, 12 Jan 2025 14:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736692467; cv=none; b=P+8JTLCcIqLn7j4ggD/0WLKcv1FAB7+DFn5mPoXSW42yYg+STzLswWZ0a3FJ74SoJA0w0IAXvA72LA6x12SsCKKhsyis4p/OQSeApw73bMxWhPKCR0R+7cwqpiwC80amuptsC19zfeogedZlVM4n7L13mYF3GTbYzFYJGCBp+3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736692467; c=relaxed/simple;
	bh=yXf/V47uPrvCebLA2XnhxXSDd6fT7SXWom9NCi1FuJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RqD5sQZIe2lfqcXK2oAv4im3ZSyq9QSCjAfNFMISBjLSofvekdv7NPrZoOPBGujWWFopDbHKxqbnpXIIja+UfHJJWk8HbtFp53zXoH9jBStuNKEcWp4SDjvf+0aao+jP31mzzjpDJLwZJzYTCz1x1UQ79flVUqKeI5us9J69LZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JA8OqbEG; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aaeecbb7309so649345866b.0;
        Sun, 12 Jan 2025 06:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736692464; x=1737297264; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXf/V47uPrvCebLA2XnhxXSDd6fT7SXWom9NCi1FuJI=;
        b=JA8OqbEGwn127FvTJx3xiLYD8jWu/sI5VotK0JxTSvgFmUmOiPc2sIZxHLJnVNiL0x
         RXhuNI1ncnqlWoboMzoIk8uXZu6MQ28LXw8TVP8Pc10mCtoWkhJlpKOVCzkk1sAlXmSt
         D6WctJlKv5tP4EYXQqoAONH6Be1hjtWu5HRFVADz/JBnx5vUPZruE6U6DiooamG7Qfe3
         bqcxKEyDI1DfxXmgXsjg8ZeEaFhCtXQB3gW9NI96k1CS9IEj6fPGZfo18hHrJzVrpF4B
         B+ExzLvn9RCytqpxIr079djDIHhMWcp8v5N7vlKvzjYyeJVzhcVOaqRfNHsyUgLk2wzN
         wGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736692464; x=1737297264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yXf/V47uPrvCebLA2XnhxXSDd6fT7SXWom9NCi1FuJI=;
        b=RzP5Ivq4ru/ygdOh1eEUbf8aXhnFNyZ77YuXqOGYVu2ctn0/KioDVhI93Oj/EXMc83
         yumkFRuqWCkp7WJYf0O9HgOHuLw5lV+alZWvRFJ5u1VbyFMIAA6fPkOD3FyI0TZgunKY
         M21Q5FLbPGjy/iBVibF58MG21DWdSKJexHGpA7cN5uhhVB/0CG6RdMFPUICvCo1eEgqE
         zq5pw7Q595+DYUB8f5vbspej3dlfjOD9dZfP/3WnavSS++mwMFdxCCJlVybg6NAesa9A
         h9o9OpieRMYY8DfZAMi3WEOT+D5RennZBz/4pstEz3CJ3vkzaRxAXctu3uoSbycYgPZP
         GsDg==
X-Forwarded-Encrypted: i=1; AJvYcCU7JRGOlrVKipGEdBY8saO4p5xNnxA/7fOVuJFzH/f65q40pn/7XwA2GeizvqQO9VN/Q3XoDx5XMe68aZVGNM4AYiU=@vger.kernel.org, AJvYcCV/5EQC3Q9oeLg1Kjf0PVpIs3Va8Lz2PZ0F4rMAVfPL6arg8bggieNoBej/GJejQVraW60MvDoppSY=@vger.kernel.org, AJvYcCVQlMzPvqoyqTvewEXFviuuB2MxyyJ5qThqy7UwuCiX1nhO6J81gZS/IQjHB2PEMtwxE0F/+iLLpPFi6Xbj@vger.kernel.org
X-Gm-Message-State: AOJu0YyaPX27M3NgoXH+9gkDQDimoO2jNR0YYN9i7VwhqV2lc5JNHf0y
	CGIvGIe7B4WBADvCaJUrKOAQybENKyRq95MMHAwCwPbkDTRMRH+AIw9Hrq6AWyMZQJ2UcmJztHV
	5/imY96X9tUDcxuUpmZ+uwH5yvHeZ7ZzF
X-Gm-Gg: ASbGnctGAq9tXsrlC7ne4nGSt3vKjUKDmXwqHAZK1KfoElL/IKn77DSHGX6gP89J0vG
	luwSn58cHaQkug2F9yAMJ6QgDunffh4axlgE06A==
X-Google-Smtp-Source: AGHT+IG2RIGnvEzN1TA0m46BvrbjbfJZy6ZRegk9eumZ8212xvMS5TGEb3h3x57K6CfXB9CWwZYIvRM+1a4cI6Sn7FU=
X-Received: by 2002:a17:907:971e:b0:aa6:18b6:310e with SMTP id
 a640c23a62f3a-ab2abc93dfbmr1298493566b.38.1736692463555; Sun, 12 Jan 2025
 06:34:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109211206.241385-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250109211206.241385-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 12 Jan 2025 16:33:47 +0200
X-Gm-Features: AbW1kvZLthzf7m4Ul8ZHd_Yc1deKkwEYuxnAAyC_odPSkW7wTRe1lmhOGQHyOFA
Message-ID: <CAHp75Vd2-7M=rej2k_067KosvvSZ+8ZVvwszhabmKzY7qw_KrQ@mail.gmail.com>
Subject: Re: [PATCH v5] i2c: riic: Introduce a separate variable for IRQ
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 11:12=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Refactor the IRQ handling in riic_i2c_probe by introducing a local variab=
le
> `irq` to store IRQ numbers instead of assigning them to `ret`. This chang=
e
> improves code readability and clarity.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Andi, perhaps you may apply this one to reduce potential confusion /
ambiguity with v5 numbering and Prabhakar can then be focused on the
rest.

--=20
With Best Regards,
Andy Shevchenko

