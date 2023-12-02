Return-Path: <linux-i2c+bounces-582-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A64D801945
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Dec 2023 02:05:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20FBE1F21100
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Dec 2023 01:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DACC91385;
	Sat,  2 Dec 2023 01:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a0EPLaI4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ABD2D54
	for <linux-i2c@vger.kernel.org>; Fri,  1 Dec 2023 17:05:17 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2c9b7bd6fffso37418621fa.3
        for <linux-i2c@vger.kernel.org>; Fri, 01 Dec 2023 17:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701479114; x=1702083914; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2AjpI9QlzX4/sI/azrgjTOEsQmOURin+5qeGoAR1AD0=;
        b=a0EPLaI4cvYoLGFDQ4wvcxqtrXokdits6Y+5uJmSSo24pLxeqD2l4iozxuVZcEtOYu
         yc+wBGr5sHILyPmpARjWCgN/deb8JiUJkXVS7vj854HRShLiVSo6A9C333IdVg52/iHK
         tj4f/v4wfbttEjOrIldpymjz0oT+UtUkBlydA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701479114; x=1702083914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2AjpI9QlzX4/sI/azrgjTOEsQmOURin+5qeGoAR1AD0=;
        b=ucWlHl3zoaCygkiKeRvGJEiZDgowMa99gU0Bjgk4cBi/EU9WE9u2He7yZ09dGM6zVH
         a/SLuFIhkQzVjg0uvZHWMPxuraRbYVQD445pAAc2suEbaQYlDZnmtmBts+RZH93Dokrb
         iNEgD/9fexKE8xgdiJedUHnz64E47tPzrzDAGpmzs95ZFBifDxMJmvxnyxkSvA2c8YUJ
         UUkRqA83BUSc76GeUyzuH0J5FlFmJxibZ2XqGbgrRXLvOq69xmwx0M808nqVroZaZB+p
         kKCNqyQalQWhRymc9jL7Z1cPK/qCpvvA+gzvmqltE8F+MKnXM9MdjrcBZ2SbbJYmIH5W
         pV6w==
X-Gm-Message-State: AOJu0Yzsosi4n8CHSuU37iyAhpgX312VAuUS1VXP7EKyCu/NFpU0bF1X
	X7MPyQjW8MFkCFi1/ilICnic8tmOwUXsJZNe2AliMUk/
X-Google-Smtp-Source: AGHT+IH1MrfDPdCqNeVXZFk/Rq+YCIy6esr/zBep1W+LUJSC/Rl5DVzJaYmyM+vmYUwMy4dmQESMyA==
X-Received: by 2002:a2e:b951:0:b0:2c9:d863:2c30 with SMTP id 17-20020a2eb951000000b002c9d8632c30mr1133125ljs.89.1701479114683;
        Fri, 01 Dec 2023 17:05:14 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id zh20-20020a170906881400b00a1a6793f5e5sm81901ejb.125.2023.12.01.17.05.13
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 17:05:13 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40b51e26a7aso12495e9.1
        for <linux-i2c@vger.kernel.org>; Fri, 01 Dec 2023 17:05:13 -0800 (PST)
X-Received: by 2002:a7b:c4c6:0:b0:40b:3d89:ba70 with SMTP id
 g6-20020a7bc4c6000000b0040b3d89ba70mr237236wmk.7.1701478730440; Fri, 01 Dec
 2023 16:58:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128084236.157152-1-wenst@chromium.org> <20231128084236.157152-5-wenst@chromium.org>
In-Reply-To: <20231128084236.157152-5-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 1 Dec 2023 16:58:34 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W01gfxV6RN2o6CVS7jjf8qgKP-jUy9Bp94d2hWzVC48A@mail.gmail.com>
Message-ID: <CAD=FV=W01gfxV6RN2o6CVS7jjf8qgKP-jUy9Bp94d2hWzVC48A@mail.gmail.com>
Subject: Re: [RFC PATCH v3 4/5] arm64: dts: mediatek: mt8173-elm-hana: Mark
 touchscreens and trackpads as fail
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	andriy.shevchenko@linux.intel.com, Jiri Kosina <jikos@kernel.org>, 
	linus.walleij@linaro.org, broonie@kernel.org, gregkh@linuxfoundation.org, 
	hdegoede@redhat.com, james.clark@arm.com, james@equiv.tech, 
	keescook@chromium.org, rafael@kernel.org, tglx@linutronix.de, 
	Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 28, 2023 at 12:45=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> @@ -44,6 +46,7 @@ trackpad2: trackpad@2c {
>                 reg =3D <0x2c>;
>                 hid-descr-addr =3D <0x0020>;
>                 wakeup-source;
> +               status =3D "fail-needs-probe";

While doing this, you could also remove the hack where the trackpad
IRQ pinctrl is listed under i2c4.

