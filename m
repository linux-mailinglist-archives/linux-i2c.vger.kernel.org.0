Return-Path: <linux-i2c+bounces-11749-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F73AF0257
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 19:57:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C5F01C06DC2
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 17:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16026280A51;
	Tue,  1 Jul 2025 17:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iUsIsFLR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2792B3596B;
	Tue,  1 Jul 2025 17:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751392662; cv=none; b=hieCgyydzGkjwPcD8uxGP22c05kiSoDYcvzKBR+6BnA9VJ2goKSQYjkhigzd7raXHIG9mOR96HX5cuMNKinC0oQTYft0fmBHTpnsSV7JCKmllFA4T+NNhCKDTBhys5KNXsSUSzxzUv2Ai2FNGushiQuXS/dKee+d+84raoi61/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751392662; c=relaxed/simple;
	bh=Xcj3t8dS0FcmInmyKWAR0WJhIMN9tZ31T0nM7EtTJpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CSXhZya4XURCXoKlKZ2QVG4sUG50x0Ww+OmXOfg7ZBKh8r6EG6kZklDtTW0FsRJNa4Cjk8TcBCwVmpOIDs9KM8w8bAmezXKn7pyvCN0UIdsUlm95N1H2EWBkHWLVdhNg6t51QM/bQfDB6ftINs+mThT6dPW7nHogvlT5g81PwLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iUsIsFLR; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ae360b6249fso750356066b.1;
        Tue, 01 Jul 2025 10:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751392659; x=1751997459; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXjfR544OdpbJ9besQg+JvGQxJKjojQewq85hiTyzvw=;
        b=iUsIsFLRo0peJdxeIvjPC8w2Xj21cg7MZDINLIla+fLfS+v6bxkabM0H5Q0Osishi6
         UUZ0SIUnGa3fiaE92Kz9bd1QGsNVTiEUW7FC0cJAcQn8H2dWljRcmYm342h5SyAc7WYD
         KqWdMNgAui9YjsBXz8kWTWXfusZPEsmVJ5W9YOuhJgjNMxn7LBHvK9uwRhHF2HBdkREW
         JyaWKNDQFmkjUI1gVZGrzA0IRQP8ikXGo0yg/a2ayPKPWvncq08QgBIqPIhK2Vu3qLtd
         iCvF63w9b454hh9W3pn+da87v1Icl0ZsNiR8NFKteNWoXUJAjGwMih5M48U+TeoxYK20
         GaDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751392659; x=1751997459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pXjfR544OdpbJ9besQg+JvGQxJKjojQewq85hiTyzvw=;
        b=sVQ6LM1uKdTcWsRpvmMhCSfsZwekWzdzyAEGqF8nx/+e43poG2GrBssYpijs4DPwMB
         QUNakoVVkmn225dhJ2Ah/fFMmeClmzouSEQzrdd1M2NfgHh4z4wniTIb26uWp7HYNR80
         ypL/jFPrpSJBTaX4+QSggho1PaEY6+PhbjvGuDan5G+d0fG8sUrkV40y3sNQujk6p2LG
         gLAELKO8H4/wwTSkqtFVN9qjeazgpAza5eA6DHLeS0JDX8JkVgZYLR3eu1KOMdf4BXWN
         aqK4V1f01Ywyx4jzW6BmXAgYQAc11bgj79buSnm5gZ3SXEEJo+AxxZTRyo1R7amZYLWL
         yTiw==
X-Forwarded-Encrypted: i=1; AJvYcCUVy8txv5hM/+hSuI/nBkFn6sciUTOqmrIza6Z4MATGQRkWFZPHh6W7PFNMx62aS6WlENBSrOqzIqeG@vger.kernel.org, AJvYcCUYh/3YBv1eIHq8DRInHDBLAEmFMrOHWEueom13cLFsHpUWSBNjlr7B6a+L6qKXgil2tFStF96/ruPB@vger.kernel.org, AJvYcCUl/4+2LXagdrLUZ4u7f72e6Lw4rnyfO5dvFXvIj5SJV6GO9v66Gmgj5XJCgwld5BaBtigVz4Exz5csvw==@vger.kernel.org, AJvYcCVFajyBuFXmkHXMd12duyPWRVtLNot+iVJQ2/IPuCb0uJa6gCxkp4Xkk/ft5W0fJT69wnudFVsmiKLEeL8=@vger.kernel.org, AJvYcCVMM3qVPM93ghaLpM94wGg5djBKPtTjyghvV1y+wLFBTHwzMfa0QcrZJ3IT7iPcOPzh6XbhrlcJ@vger.kernel.org, AJvYcCVt3PauObtJgxRsytfRrfMRFYs7meOcw+YLXThV5ovyMad35OjbXCTm19HPF2x6XwLMSTY31TeHUin2@vger.kernel.org, AJvYcCWB9zAKg780CCcyghYnGyjDgwjPFyRtwiyVNldF8EJZDybh2g6wAI3sXIXtCCbbxCEM2rc5gx0I9QGd@vger.kernel.org, AJvYcCWTNg+wfy1z8mCD/919h9pxLk1WnuRvq7nQEHVTb+YIQlxIIMMcSaDFEScU+TWli8hRxmyvjL1rnjwj@vger.kernel.org, AJvYcCWTpf8edLOE12O7ljWgLR1PoBD5Q7pOH8XFMSO+qt2/9teyviBV2fMzn7mGHCIuU9DGKvZV4APecTn7DKhO@vger.kernel.org, AJvYcCWzLpehFBsFncirw4f3Yls10idYvrVYh6PTlarY
 FrlhboAOP9dq940VxmBDv6HlojJ4MnjRJgaw/EojpYg=@vger.kernel.org, AJvYcCX8hXB5mHBGjXE9tjVKBh1TE5C+51yE8VZwpkR2qotdZT0wmSKs2VYLJPSkhtwd3yf5cHdR46Uw8GncsOVa@vger.kernel.org, AJvYcCXDRYSqXJ9Ezu1RLo/SwxjSTIOa/G647ySbDPIqsfabcfI1xpy/1byYgi/ax+deLZwvzjkQxVtJO/8=@vger.kernel.org, AJvYcCXHNeWhtB4b5p5dsm0EflF1uQSI0DCPqiqflvwdZpVNDEoUPUnTeenoQg43EbD3X1JkuCC8J6x9j15Cq04v3L6T4yQ=@vger.kernel.org, AJvYcCXQAeJiMLfoDPN1XJ/5u6UnekWspCCP8LCUjucfOzv6fQofiveJmpcQjqKQVxTofwCIlK2J1vnSUX3y@vger.kernel.org, AJvYcCXrE5T3PSv+5HSh8qBMPdanjt4Q+ZYuWu0sb91nyrb0Nc90DWuATXDPnaGVQL53Hf582iw30kTfkbPqLQ==@vger.kernel.org, AJvYcCXrP5dOej6d3xvPVaf+mLWcS6a71IXhslX1x9UZphNsd6XgtvfbDD5VmpKc16cnh6EgdR7JjSx6YfxCpg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7MPPdXThqK15+abUr6j6KjvMcKc59g+Qv1fDXLHKI7HAX/iUd
	y++Eq+5rPUGBreX7Jh1RwPNwHTEc+XB0b29HZJbs5/hVVzXp8FYlul82NNbM3MO4aM2ph4eWdXx
	m50Vhz7xoDL74S+Ri/CTZZaS7IFVIswI=
X-Gm-Gg: ASbGnctGtb3rAmJjJkxzrhubY3ksEybJjyB+5oLMHM8qciye+1xs+zPjo2zIb48G12U
	PxQAG7NjFxDPU5bzK7Q3RFur/3s00DJBgthiyETtX3VTvj4o+HYi5OFKE+hDXqdACYbnOXOHVl+
	hj7YhjckPnuLlO204B0V1gG7mAj5AhXebUfjMnqmXLjHM=
X-Google-Smtp-Source: AGHT+IFi2mQZLuvuKUJ5Vmbx2bMFhgEtTB1rODdhMnUJkkTAqMfdBOcO66FNReafO5ChqP0c8B6r5Lro21q2uCkd3k4=
X-Received: by 2002:a17:907:1c18:b0:ae0:4410:47e3 with SMTP id
 a640c23a62f3a-ae3501a58a6mr1915225466b.51.1751392659068; Tue, 01 Jul 2025
 10:57:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pnd7c0s6ji2.fsf@axis.com> <ylr7cuxldwb24ccenen4khtyddzq3owgzzfblbohkdxb7p7eeo@qpuddn6wrz3x>
In-Reply-To: <ylr7cuxldwb24ccenen4khtyddzq3owgzzfblbohkdxb7p7eeo@qpuddn6wrz3x>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 1 Jul 2025 20:57:02 +0300
X-Gm-Features: Ac12FXyruF9twzstORuqQqTbcXFq7Oy0k32bhmiSfPFWKw8o7JRMkyPmwEAJIYk
Message-ID: <CAHp75Ve=Zas8=6YKoPeTRrvjCaTyyRAyJG1gBLripqZgQpfg7g@mail.gmail.com>
Subject: Re: [PATCH] Remove error prints for devm_add_action_or_reset()
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Waqar Hameed <waqar.hameed@axis.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Julien Panis <jpanis@baylibre.com>, William Breathitt Gray <wbg@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Peter Rosin <peda@axentia.se>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Cosmin Tanislav <cosmin.tanislav@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matteo Martelli <matteomartelli3@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Francesco Dolcini <francesco@dolcini.it>, 
	=?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>, Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>, 
	Mudit Sharma <muditsharma.info@gmail.com>, Gerald Loacker <gerald.loacker@wolfvision.net>, 
	Song Qiang <songqiang1304521@gmail.com>, Crt Mori <cmo@melexis.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Karol Gugala <kgugala@antmicro.com>, Mateusz Holenko <mholenko@antmicro.com>, 
	Gabriel Somlo <gsomlo@gmail.com>, Joel Stanley <joel@jms.id.au>, 
	Claudiu Manoil <claudiu.manoil@nxp.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Wei Fang <wei.fang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sebastian Reichel <sre@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Han Xu <han.xu@nxp.com>, 
	Haibo Chen <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, 
	Souradeep Chowdhury <quic_schowdhu@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, kernel@axis.com, linux-iio@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-input@vger.kernel.org, 
	linux-mmc@vger.kernel.org, imx@lists.linux.dev, netdev@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-usb@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 8:44=E2=80=AFPM Uwe Kleine-K=C3=B6nig <ukleinek@kern=
el.org> wrote:
> On Tue, Jul 01, 2025 at 05:03:33PM +0200, Waqar Hameed wrote:

...

> With that
>
>         ret =3D devm_add_action_or_reset(dev, meson_pwm_s4_put_clk,
>                                        meson->channels[i].clk);
>         if (ret)
>                 return dev_err_probe(dev, ret,
>                                      "Failed to add clk_put action\n");
>
> from drivers/pwm/pwm-meson.c is optimized to
>
>         ret =3D devm_add_action_or_reset(dev, meson_pwm_s4_put_clk,
>                                        meson->channels[i].clk);
>         if (ret)
>                 return ret;
>
> .
>
> I would prefer this approach, because a) there is no need to drop all
> dev_err_probe()s after devm_add_action_or_reset() and b) the
> dev_err_probe()s could stay for consistency in the error paths of a
> driver.

Why do we need a dev_err_probe() after devm_add_action*()? I would
expect that the original call (if needed) can spit out a message.


--=20
With Best Regards,
Andy Shevchenko

