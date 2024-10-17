Return-Path: <linux-i2c+bounces-7463-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8BA9A2FB8
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 23:22:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB8E2B25B63
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 21:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A227E176FA7;
	Thu, 17 Oct 2024 21:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bk/UAIex"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C901991C3
	for <linux-i2c@vger.kernel.org>; Thu, 17 Oct 2024 21:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729200119; cv=none; b=NI5kXjvV93i97ep8XdPdBe53jbccEbfAZ/yc6bD96ZrUTTXYerwiGzq/2oupf05EeqE4tg8QHt56CeYNfWnZQmJCjTmL7g+/nbhJpWstMlPWv2DNMY7tf0WYq+q0Ri1TXmUNr2krT5+4KpoUmFSDaw0m6Wqw0Yu5q246MxS+k+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729200119; c=relaxed/simple;
	bh=wQydXNcWdpTBzZQKKEPkKWCSlf0fQmLAmN+bYKHMIS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cZ7PGU+PJlAc4oeUqUKkw+2B3L9O5o3y45yQySK6KvzTIlo1OoXGIwQS+1Xt/30PWaReI6dt2vLaWBdsmAbF1yjuJoVJoVIN86TOG/w0OgAerk0SCxAJFOQ2KnQbTnAjdWPqI3acs4g+K8TMI2lze2Qgs6wxO97II8ako1xmJtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bk/UAIex; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb498a92f6so18014191fa.1
        for <linux-i2c@vger.kernel.org>; Thu, 17 Oct 2024 14:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729200112; x=1729804912; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwSGZxm0nPOCcXElvwF4s1O3dQZtjR+E7hVy6q0TNNI=;
        b=bk/UAIexPBX39zACZDJJCLuu7bFs3SynxGcu0mfAztrn6SXKVZRJd0ELgqPhaVKXJ2
         oTZUIUtfPM/Sqx8krqZR9tW5iQ5dVymm8w97IOSl+LZeATWSkL4Q+DEKNA2ADx+8vQWK
         rMLtrHJeZ5NWqG0wwDqK401L5oAmyAk3fbqcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729200112; x=1729804912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zwSGZxm0nPOCcXElvwF4s1O3dQZtjR+E7hVy6q0TNNI=;
        b=qOMxN0M2zdXs/t/NTWMILv5L32YlV/WiidY4L89YcrufV/doJI39kxWHbGYL7YqkYM
         00mRV77BRG6dLftjIcK86jerqAvz4bvspB8FZh+voYMdJnD7AYHOaIPdlWg2RwKmgo4y
         rbrbev/HZ3jX50ZFGsqYIYu/m3FtqGJlsvkx75Bfe5y0Tou4dU5nWpy02Vlaxk0a5XvU
         gSKgTGnN+xEcigtBTuQmYM7LChPWmNWQWB7xYwLFYK8N3ex4wM11OOwOvVgU2D3a386U
         u0Gq4N8xPXpVDYxPiVZrMI+7nslP3MnhIq5hp4KXoQnyKvxpzzGo7rqhWZ+w8Ixslgk+
         OuwA==
X-Forwarded-Encrypted: i=1; AJvYcCXFLsGx8pR33AoVnQUL6HOFZG/AQGykhRClSp8/6pN9rjQvOEBXJZgVEQsnTp4NN25inpWeH2qR0XQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv8OMhQ0t9w5kvlYEhYjlzQ2Aj1X8GQTID9Zyk+9JxLkL8rG/O
	0dOw3+DI0Y5lHvEIFZRoCMqqQ23kLQF3d6Higr4QDquKbGUzj5Z2sgXKWtmqWb5PHUFn+/XDN9W
	7poOa
X-Google-Smtp-Source: AGHT+IEmnMdmDNnb6EzKAGFpst50WMCOg0Mefd6TLkQIGSBN8g/70xZkcUmhYP/J2OiJ0YRSYn3U7g==
X-Received: by 2002:a05:651c:1546:b0:2fb:5060:7037 with SMTP id 38308e7fff4ca-2fb8320d2e6mr18341fa.41.1729200111600;
        Thu, 17 Oct 2024 14:21:51 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb80a08ddasm329911fa.109.2024.10.17.14.21.51
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 14:21:51 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fb498a92f6so18014021fa.1
        for <linux-i2c@vger.kernel.org>; Thu, 17 Oct 2024 14:21:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWoXy3lX+kv4vH1ZRQuh9es0QGJ3WeuHugIN4mj4zGLgSlpPaBkJGl9c0X2Mrs0hEDDa4WBcsyYtIg=@vger.kernel.org
X-Received: by 2002:a05:6512:308b:b0:539:f754:ae15 with SMTP id
 2adb3069b0e04-53a15445ebfmr181364e87.41.1729199768852; Thu, 17 Oct 2024
 14:16:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017094222.1014936-1-wenst@chromium.org> <20241017094222.1014936-8-wenst@chromium.org>
In-Reply-To: <20241017094222.1014936-8-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 17 Oct 2024 14:15:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X-YzEGEc+tp-uB6vdPMEC-V9M=Gb60H69=_XY9w4R8nw@mail.gmail.com>
Message-ID: <CAD=FV=X-YzEGEc+tp-uB6vdPMEC-V9M=Gb60H69=_XY9w4R8nw@mail.gmail.com>
Subject: Re: [PATCH v9 7/7] arm64: dts: mediatek: mt8173-elm-hana: Mark
 touchscreens and trackpads as fail
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 17, 2024 at 2:42=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> Instead of having them all available, mark them all as "fail-needs-probe"
> and have the implementation try to probe which one is present.
>
> Also remove the shared resource workaround by moving the pinctrl entry
> for the trackpad interrupt line back into the individual trackpad nodes.

It could be worth noting in the description that it's a really bad
idea to pick this patch if you don't also have the patch
("platform/chrome: Introduce device tree hardware prober").


> @@ -35,6 +37,7 @@ touchscreen@40 {
>                 hid-descr-addr =3D <0x0001>;
>                 interrupt-parent =3D <&pio>;
>                 interrupts =3D <88 IRQ_TYPE_LEVEL_LOW>;
> +               status =3D "fail-needs-probe";

It's a little weird that there's no pinctrl definition for the
touchscreens but there is one for the trackpad, but that predates your
patch and is unlikely to be a big deal.

>         };
>  };
>
> @@ -47,6 +50,8 @@ &i2c4 {
>         trackpad2: trackpad@2c {
>                 compatible =3D "hid-over-i2c";
>                 interrupts-extended =3D <&pio 117 IRQ_TYPE_LEVEL_LOW>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&trackpad_irq>;
>                 reg =3D <0x2c>;

I should have noticed before, but officially the order above is
slightly off. According to:

https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

The "reg" property should be higher (right after compatible). It's not
a new problem with your patch but since you're inserting a new
property you might as well match the new dts style.


In any case, nothing is a huge deal.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

