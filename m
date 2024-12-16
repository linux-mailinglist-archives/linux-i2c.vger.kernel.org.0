Return-Path: <linux-i2c+bounces-8530-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED48F9F35BA
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 17:21:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2E8816B209
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 16:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17BBB192B70;
	Mon, 16 Dec 2024 16:18:53 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5234A126C0D;
	Mon, 16 Dec 2024 16:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734365932; cv=none; b=KQz3iJESwqnihfVGCpyUmYrjnkvgnXY/pflIIXEbDnGZ7TDVcwjNXJKq2k5+qxZ/KTl7v95c79Jidc+yt2qUCwZFc8aQDSj8HEQtV1Khb9hakVcryxYknGYowuJulDuZj3Lz148osfoQt5AnMS/lCSPrHY6hALnWpmZCA5DPa20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734365932; c=relaxed/simple;
	bh=DFVom/mUUn4cKfuOjBv5QRt9gL1H9BVCAFezOHy5L9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TSvePdKJU+IObBq3lsch6IsxuA8xAp247uFdpjBUoGWtPaJTxcpBA03Nob1We3xDxqyjcD9flLwOAmXLwwjxSLGmb8JEPLgmVSY/pzhJJvHqDmPgN7vuS9WLzpOXM3jQM0oUVoI4TRxy9HSv0kbEWrPljg6kHlkatQYyO5IvIiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7b6fc5bf609so218911585a.1;
        Mon, 16 Dec 2024 08:18:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734365929; x=1734970729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7jVOv/RJFmZr++8LAtPXlGOR5u7HaFI3nOW5oYBGeEM=;
        b=sN8MjUacz+Mq79Z9kfHsR2Lykymjv66awmMGvJMP2EnIKaK3LafYtrAF48yuSA1jFQ
         L667OCdFJhfa7k5CJYbTMp/GUpkuX/IRZFvNkNcDIKmwPIS7ZxsSXBMR7i2An83bfIOG
         6KdeJ28YeP703ujCcshxIEkGRtlXnTM7XqBGuqyI80wpAcdCvtpRrC/VL+u2RlXKAS7N
         GtCvsuzyOtvFdAUcyTvf95t30ndreMCmMmEQGLswIL4Gt+JtI9dmULUakWYPSKGPvAu/
         6mNCd9GpNpP0OWYaMgI+mQc3PdnZyxvA9xo5M7b1HTtFPvzK+pG+WyVqfIiort0gLJaX
         Y8rQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5RQgOE18a+vqUU2063uJ8fOjPCSAILkkSB7MRgwOBRfnJB7u7Tnsy7qfA/F3Yp3SoZt5zVUZeOBA2@vger.kernel.org, AJvYcCVDP97d4Ro5hjyCsx9XPvrDz27wpaIr8ltiQGx5xofjp48cAay91iKkAYRm70hJGiUuEfCVCsd3BA7wRvEygnc1bVc=@vger.kernel.org, AJvYcCXOx9stccObw5RS+AIMBQe9RFWnA6o+081J4PzBY8TYgOj8+9JZuv5rw2jWbpIXkuLbNC0rci9v3eQW@vger.kernel.org
X-Gm-Message-State: AOJu0YxUzPnGyDs02zczZuxOsA5T+C7uQXpfukZ/tt1w41YQUcnqcs7L
	K1YpBiFmmnGBi5brG4bGmUHKRIkhM7Yi9YF4b9SZgda5oRDndDdpiPIXe/ee
X-Gm-Gg: ASbGncuzrI8OF4wsoesEpRdyrgKwfrarhu+ILqarbGaVNY0bTKp0iupPrEuWTqb92az
	b6ozytr/LpZtM3mE00Cr6qkfhpOPwesxKeIXftgmIlYn6jnn88qF+En3TJimrtqusfQVfiUE9UW
	Qk23wKgKgcLKAVcW/43bzb89eg03aQRyIeHqOaN/EYhx4PqbHyen1LZcylrV5dbdA+alqmD1KJX
	vvZqe+YU9wuK7h9rNXuiB8Xktd3BFdfnjN+hNlns3zBcwhhDZt5/VjnBFnbdUHrxMBDBBe8b1cf
	VyfUB11iCCpws5EEZGbNUdI=
X-Google-Smtp-Source: AGHT+IG8tYK65fWaJS18OBo6nVjcDbJBTv0fxwbTry3u33iMRtPPbhrIoO7idpj0y5leCCMbY/ZqDg==
X-Received: by 2002:a05:620a:2b44:b0:7b6:d870:ca2d with SMTP id af79cd13be357-7b6fbecb849mr2439504085a.13.1734365929436;
        Mon, 16 Dec 2024 08:18:49 -0800 (PST)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com. [209.85.222.170])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b7047aa3bfsm237704585a.11.2024.12.16.08.18.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 08:18:48 -0800 (PST)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7b15467f383so400166085a.3;
        Mon, 16 Dec 2024 08:18:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV6LtVfUj79LUruR8/kxugCmD9lCsS3DsZL/Gzpku+nPpmmGPAmcs1yWn1IrFbgOtuU+YJIU6r/mrE7@vger.kernel.org, AJvYcCVoWxUeyYKXzNHsArtDraLnAjn1MiralJMNQPnL4HDJGAMzp+AY2w2RrtgOMJvbRbdVC+qknp2GKXDr@vger.kernel.org, AJvYcCWWAle4HMnsWttxX2chakIRP6gwPBy2sLvuZzTYT4IAkFSrSGPNzpmnTL8qkj7fWoipCeGU+uLJfsVHrnEDD93IeSQ=@vger.kernel.org
X-Received: by 2002:ad4:5f8a:0:b0:6d8:8a60:ef24 with SMTP id
 6a1803df08f44-6dc8ca41df3mr255302746d6.9.1734365928433; Mon, 16 Dec 2024
 08:18:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216120029.143944-1-biju.das.jz@bp.renesas.com> <20241216120029.143944-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241216120029.143944-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Dec 2024 17:18:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV4O=-9nM82=bTMo1TKzkB3TXw8Vk9Zra7ivWsvPfygTw@mail.gmail.com>
Message-ID: <CAMuHMdV4O=-9nM82=bTMo1TKzkB3TXw8Vk9Zra7ivWsvPfygTw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: i2c: renesas,riic: Document the
 R9A09G047 support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chris Brandt <chris.brandt@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 1:01=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Document support for the I2C Bus Interface (RIIC) found in the Renesas
> RZ/G3E (R9A09G047) SoC. This IP is compatible with Renesas RZ/V2H
> (R9A09G057) RIIC IP.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

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

