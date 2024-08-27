Return-Path: <linux-i2c+bounces-5824-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE6896020D
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Aug 2024 08:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D32728378E
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Aug 2024 06:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C238B1448E0;
	Tue, 27 Aug 2024 06:39:21 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4363413D53F;
	Tue, 27 Aug 2024 06:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724740761; cv=none; b=g4+7ttij1v34V1Op4GErryVAOiQbKlmRKMnil8PdiB0psTkmTQTDtWp9hMs7bfhYBVVp/6wuxZ/2d3rW9ZcCgJZprGpK9iRxG9tKlujIH7XZeaW5ymoTp/Wj+Jj1KlUTtxTpFxJorjWInFsdtuNCgcCNQpKgd0lc0Iq4hWvXQIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724740761; c=relaxed/simple;
	bh=kw+SmGbNgU/Y7Ultd3TRCIDvjLA02UIU6oeUdCnjbAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AbfwJO/xSJjmWWFJsRA+8OJkN3CM4yBNPsnQsC+2AvstVhncRhAWSSdlzH64pBoR+23BuLy0Ps93NVU1h3bsl6YaS8cfZvOtvXu1ajwdFPfIfzr68raA5csW8+mNUz/rZqpMaFghJLXOGezajCVXxALyy/vAvDU1Dwk7R9CsAfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6cf6d1a2148so9492207b3.3;
        Mon, 26 Aug 2024 23:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724740757; x=1725345557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KGZ1SOA396NzpzsyvzdR1JE9oP9KWAqRS+PYDvwpUmk=;
        b=Eh2N57MfpCJ6FHeqmS1F2iYZT10xwKkmNScxYBF6HIz7ZlOwdPjE/zkb9ihfmSqYck
         pRs3QxW1XFm/Hc5ouhHRoErYi+/kFh5LzqH0e6A6NE2BstMt7uW3yDriWAxYrWL0IbOq
         n5ihXn0X++zmXfZs8CqfSFu7xVeDzA71xryt9X1/n69ssL97aKxOICuLglV/KWBL+toN
         IRMCHIX7VKb3n++C1X5iHW5P7hvyNRvPXiSYMB0A3He+45Z7HExY+MmY8DEZv4pXzKMH
         qsHEuWi+tWV0JyvaM9hv5BaVmVTu/1l1yJVDYbudlWh2lTDo+eaeF/w45mLqj+xaPvOK
         D+2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUA8mL3YhccSfr7ZtpI/Qx5A46aWXqDU6dmsjKFdDSgHB+5e25BrHpviIwMqtiTCFHJnrmgXH183z0p5Q==@vger.kernel.org, AJvYcCUrE5x4R36WpNqA61atf9CB3UuwWaQiN7KJV0IqJXsy71q41VI0fg6a7sZmF2SPqe0nPQ3JclHDkZo=@vger.kernel.org, AJvYcCWGHUqbcW0RwlCSE1BkFmPwtFKdvZCKTE/i4b5GVlTDGgrzfJZb+OqXeJkvyFrttNKKg6rA++RUiuzjeN5cwVVtAO4=@vger.kernel.org, AJvYcCXNB1Z304FD0d63sevP2xmHxDRVHyy+qU5L/AedHGQoSg6VHrzdHIPoeTiVo7Vznbr2CGsxR4GopvpmVSSg@vger.kernel.org
X-Gm-Message-State: AOJu0YwjDb1blniTuChc4S/DJY2D7IlL1WBcEdv+O6qlmqHYkIMCqlz7
	A3pT9YTWMiRFbf8KFtpewqZJygQS0DK2A94GzpO/97/FLdxZZ5mfaYsXMsnB
X-Google-Smtp-Source: AGHT+IGSGJGo9EYq8UwOLeR7HNY9lgHHLu6aRq0fNm2UcjnllzrOncfhlYU6EHq/THHLlb3MnG6e6w==
X-Received: by 2002:a05:690c:4b08:b0:6be:2044:935b with SMTP id 00721157ae682-6cfba8726cdmr23225287b3.25.1724740756855;
        Mon, 26 Aug 2024 23:39:16 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39d3a9df2sm17952847b3.103.2024.08.26.23.39.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 23:39:16 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6b59a67ba12so46965687b3.1;
        Mon, 26 Aug 2024 23:39:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZD2ht3JNYB5HhrWvZiAlUhFYX0xtOsCdep2+ndvcuhDxEM1RXNqhR8Q4lJz30Liio/5erlZFTAcsCvyj4@vger.kernel.org, AJvYcCWTfEX2caGBQhaak5S5nwP9ZkArjgFCPl6NIcBRL/lMNLva/HbMXxvbNhGFjJsaFX1ddRzXUZAyJUl2g9JNmnWDpEk=@vger.kernel.org, AJvYcCWrU+3GwFK7c2Awsjs7Z+1bLuvXEM6O9U/+VGMPbcVBgCQMUWTohTWjA68+5E8u55Au2c7y+AleFel7xA==@vger.kernel.org, AJvYcCWvWL0yHs97szEltq9fek56tEzqfe03XplHjPzvRt0b5f1PFxvXCw+439mTcwBAelryr54VgY97PaI=@vger.kernel.org
X-Received: by 2002:a05:690c:38b:b0:6c7:a120:e10f with SMTP id
 00721157ae682-6cfbbbd4c68mr20021307b3.29.1724740755948; Mon, 26 Aug 2024
 23:39:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240827034841.4121-1-rongqianfeng@vivo.com> <20240827034841.4121-2-rongqianfeng@vivo.com>
In-Reply-To: <20240827034841.4121-2-rongqianfeng@vivo.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Aug 2024 08:39:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWNJJ6q88MA+bgimmYVLyO6gp7MomLkhNRwLTLdMkkFYQ@mail.gmail.com>
Message-ID: <CAMuHMdWNJJ6q88MA+bgimmYVLyO6gp7MomLkhNRwLTLdMkkFYQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] i2c: emev2: Use devm_clk_get_enabled() helpers
To: Rong Qianfeng <rongqianfeng@vivo.com>
Cc: andriy.shevchenko@intel.com, biju.das.jz@bp.renesas.com, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, linux-renesas-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2024 at 5:49=E2=80=AFAM Rong Qianfeng <rongqianfeng@vivo.co=
m> wrote:
> The devm_clk_get_enabled() helpers:
>     - call devm_clk_get()
>     - call clk_prepare_enable() and register what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
>
> This simplifies the code and avoids the calls to clk_disable_unprepare().
>
> While at it, no need to save clk pointer, drop sclk from struct
> em_i2c_device.
>
> Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>

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

