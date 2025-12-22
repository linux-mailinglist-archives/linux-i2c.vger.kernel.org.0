Return-Path: <linux-i2c+bounces-14674-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ED32FCD5B37
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Dec 2025 12:02:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC43830181B3
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Dec 2025 10:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E44F3148D4;
	Mon, 22 Dec 2025 10:59:58 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC908238C0F
	for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 10:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766401198; cv=none; b=Cvkx6Lt4BI3ytOtRcTiy5Xho3YTICV11A73DUG2euaNMf3pukz1OwnHzSzSld8KnY/A/sXeO8YiObey98mq45YyRlZF0mHJEWlilmNkSZaGP559Ypa10PDpT9BsIdQ4jOYpjZ/0Ljd2rAfZa+/9wSRD6KaeYIVtnghnQSdaTX34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766401198; c=relaxed/simple;
	bh=hQz8inePYy4z7kE2ZTh8btcX7ZL/LHM5S3zx3idHlV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZUON7Y3sWsrYr6rXSvHlH5+aqWROra/09zDnlO90qtzLu03UKEH+bXJvxCU5eZihyEgygThvlp23Lz68bEeLTH66FYWg0zwDyUREyCRW+QLKwURInlnvWSItIZhV3Czm79LZR9qT4qhSNsx9MZR9vVbj6g4LqYWZYPjtwrdSLSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-55b22d3b2a6so2429739e0c.1
        for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 02:59:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766401196; x=1767005996;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iVlS5J1HzuVScBDeCBX0VxoypelfY5sXHRtDOTQInFQ=;
        b=qjAU9XILcD/tTFgsrw0dUHTmVNqSIj4/TyewuOfkBOErpklDLAs2dYblytWWSWc6oD
         U/PU5EipCZPgh1OritqKkgeEI1CdP939/I4wBtgeq4EOrgQyQXfSXsQ7w/gMtZL4NVSa
         1xhYVNxq2x2eySDMu4sAv6qFcMt9kqtUvRPQYoxnKkY47bT5rbWodXMYsoiUCAkNd90+
         tqyPq3BVhY08XmuFe66E6LDZT4gZ3C9DPHhL0xTvJGZE3Bgr5C5VYYpupsxF+jfJfQkq
         OSxdTcNOKElHtOsRgph0cmWd2PWizLMgolv1x2j39Rj82H0Ca8ou1X/zE0Ex8nzUyzde
         9xtw==
X-Forwarded-Encrypted: i=1; AJvYcCXgYmcpj0hbJXIufKm+jzlitEln7QaRo+jA3XJ5M7w/f4907FCh/3WJb1w+KVIguk520scNTEbHTVg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiMK9Pi2IXE+UE1wTDNZDSTB5hlDoq0pPm9Rkw78xIlKKi85jS
	G17L5mGfpUIqeX/yokXZzoc20zh5KtQ/1SSZ6I/eqDoMNNVubuJHhNgCtxwfnzG7
X-Gm-Gg: AY/fxX5L0ltHON7fa8JiNddkVILNGzhG3EhnmBXmYXlwVzGuAiNup/6RH5AUwOkC8fY
	B+fGyyTCzmBgopcvEmpQPChZ96crO/rAbssInLhR+lLr2i/hx8XtX+bReNTvgdn5T7js2YADRnx
	yq861eG1wzJmf/94DpohbwEkch/ojVUnvV1gVsh6lGPfRdcwYGOd38vf0uvjnH67GPJbDC+B0ct
	GG5X5HfDopUM8XM27qbsLnqYk5QtgNw85AB+rgshqEeB7PCwVk/e6NHhmyxdBqc9rcuC5th0fL7
	hVYHLGj4ECBBobMoP+nVC1LgFl/gmg32hcUZS23NLSuW8+OJ+0W5ZUFKoHO1qZFL8JzQPC+Bl6I
	7quHwt/DIwgWPlQWFQrtXr2s1hqiu1YKDC5rSVCc6/LugfLQhKaeqPlcLzeHXFfQh4L3DmwIswS
	PWwWD6LEO8L7N3OawluAa762DPt/QbHbOPqjsxvcDarvwGOQzEpmfv
X-Google-Smtp-Source: AGHT+IE+rbHB5RGu1ZH/3O9u4enQt7F6Q06/gcaBgdH8tGFRYCRFlu5eAcm4kjeXpCWQwDhGmEuhVQ==
X-Received: by 2002:a05:6122:1d42:b0:55e:82c3:e1fb with SMTP id 71dfb90a1353d-5615b931653mr3171464e0c.10.1766401195768;
        Mon, 22 Dec 2025 02:59:55 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5615d04b70fsm3316218e0c.4.2025.12.22.02.59.54
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 02:59:55 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-55b4dafb425so3127818e0c.1
        for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 02:59:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUQB5aDT2zbfTDfgM9zIsBP/+ZdfZV/6NGfM1BB4umqacEgtluDZo9u2I/P1sEp/v+JqiryqvLqiFY=@vger.kernel.org
X-Received: by 2002:a05:6122:6790:b0:559:7faf:a276 with SMTP id
 71dfb90a1353d-5614f7ae2d0mr3069797e0c.7.1766401194470; Mon, 22 Dec 2025
 02:59:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251210-rz-sdio-mux-v3-0-ca628db56d60@solid-run.com> <20251210-rz-sdio-mux-v3-1-ca628db56d60@solid-run.com>
In-Reply-To: <20251210-rz-sdio-mux-v3-1-ca628db56d60@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Dec 2025 11:59:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVqSPQ_rCY1mPxyAw1=WwK2VX9bxMKQQuVEe75u5hTvsg@mail.gmail.com>
X-Gm-Features: AQt7F2qvtAFJTZWBdh_71wFZZJPHL2v6ti7TTVpa1qQd7XzzszUS-LtvxMifYms
Message-ID: <CAMuHMdVqSPQ_rCY1mPxyAw1=WwK2VX9bxMKQQuVEe75u5hTvsg@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] phy: can-transceiver: rename temporary helper
 function to avoid conflict
To: Josua Mayer <josua@solid-run.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Peter Rosin <peda@axentia.se>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>, 
	Jon Nettleton <jon@solid-run.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-can@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Dec 2025 at 18:39, Josua Mayer <josua@solid-run.com> wrote:
> Rename the temporary devm_mux_state_get_optional function to avoid
> conflict with upcoming implementation in multiplexer subsystem.
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

