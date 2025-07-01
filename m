Return-Path: <linux-i2c+bounces-11743-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1023AEFFC3
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 18:27:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11041188881A
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 16:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BD8927CCCD;
	Tue,  1 Jul 2025 16:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V3VyhwdT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEB71DE89A;
	Tue,  1 Jul 2025 16:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751387146; cv=none; b=PJm0RjpE11z6YTgGxbpgyEAGnDypxassDp+KPb3CCBmCPhwUaMWg7aYxxasLzMfAUsds5gIG9KPNipbXpSUuTb2F7LlljgbEsqRd6GQMmhJ9hSAGLwji6wOQxYn+axF9Tt5G3Bb93wwPAcYs+s3CFP7TCNpIh4PB6+EGnhs4M1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751387146; c=relaxed/simple;
	bh=ZUqpZFwfZJt5F5fCgCl/+TyIxH9HhSMeCYCIU8CIEkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=polFHdK2v9tASY8hdUCeKW+Jc7G3/mnY8XsP2ujmUISG4lwqHmM+SgB5Hqt56cTI4IwmDKuiE78Y/nhEW9yFKQzdtMnDyBf02RJsH+aLtk84WRWvMvW2eAx9eB+rUQWpay7pp9vlpqdkajWz75StrapS3FK4FZyaTu0zqdopdZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V3VyhwdT; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7d4495753a7so395036185a.0;
        Tue, 01 Jul 2025 09:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751387144; x=1751991944; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MwCrqmYe9TCJHuYWG2jCcUWVn5259lJARsV/a3PINFE=;
        b=V3VyhwdTLToEsXD1YWSqIQIEN6M3yFpJxlHafcEkdsyuTU9kSsPawgEKuYVZvt+63y
         AOkMQ4WeD95HEDyK1kzTWz++3vmfla148a7LUsMaMLO1aNT/lOnPACDhbx8hjueMLFsZ
         H7/fNbaqWg5132GcfBK14esSecPdDu6iMMQ2fgfdvxEbnETs5OR4+I7/TKEuwTcpnfho
         a+PnYguIWf1Evfd8NsDq7Qfl5337xSqEv/r/D32QT/N904G74urtm0eWHqsMHkRi7wrB
         oYA8vTYXRaKAaXfPIbD5z5ppixsWVnZZbgtQ94I+GloXToT31vjnJNqIpu2bCz2lA4Iv
         GoPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751387144; x=1751991944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MwCrqmYe9TCJHuYWG2jCcUWVn5259lJARsV/a3PINFE=;
        b=d3O1Q46y7GjYeFmuj+LvpbB4ZFa2pZQTC8AQVn3YmoKFwkFQYUIkrpV/OZt1XxlCqB
         njaQomCBFWAbsijnTMfA9K2zNmUbptriDmOmf/OXdRgqhaZOGUyFXPeS+s3y8kU3w1PU
         3zgrUSgLTlStJLGKMNMG7rRRWXzKIzlvbJzqtPMEKWwywP4f1d07qv8DJVtA1QsNhX2n
         SdM8oQmDifqxZ08RRMaV1wKGvXsHMpaMmemiC+zpkraTmE4Vps4Hn9SCuMV/L/SNmXWg
         BidniE91X97ZmOkwb+ke1rK5+O7goxvOgfkQsY++y84FWHGrtDPsosuj0/WLZHzy99d0
         xYPg==
X-Forwarded-Encrypted: i=1; AJvYcCUHQ/OyfIFrD+b08yZBhlRbcDZY7PkU0hf+HwnnIRV/NzShVI3WbfRxuf/n7AKhIZ6vw2jClEX1KhGD9Nd6nMc/bS0=@vger.kernel.org, AJvYcCUQKasfDe+rp3DwfSrtQ/ueJLBfFE/ekA7+wLOXrbTHwbkjZc6DBWE5qHlTHpoKkQonYxPnebsDZm2X@vger.kernel.org, AJvYcCUTtwMQXxOiku1W4DPoznOpC9GAHgze7aQxkD7Hhv4CnTwJPjcuJZ8uiKrjkLA7IwybLZAsyl1BVdr/@vger.kernel.org, AJvYcCUd3JZIEKW40w8Yxq+s7tETHdbkO6ZFHggwoI2kXl6azfEOOCgbfUTaxPUxaOtUHfS1oV7OrAAfgWFB@vger.kernel.org, AJvYcCVMu6p0Xj9ttwa4s+9GUymFzAICct63LcCjIIFSSLADQDPMME0APx6mZFiUv2UB+Uel5mj5SfhcyTKauw==@vger.kernel.org, AJvYcCVeBI+pPUT4Nn+ttTiR5Dkz3X52TEI0hmH+y5InBDyLXaozNVqXfIB/BOYjcIMq5RgCftOGMfnTpTeE@vger.kernel.org, AJvYcCWZM09PhLExxb8BbF43SbstG2tuyVMjw5m1LwIj5Y1f80QHnSkR9IIdewtPtfJgkKWs+L3YSA6PpYs=@vger.kernel.org, AJvYcCWZXg2Jz2+urxdnVTWy+xiSfCKCNjXc1b3eRwyhPpwUaHVfn69m5H1lgGguKTXT+//TcxP+8IoPpDGhZg==@vger.kernel.org, AJvYcCWaCOSTSRPZ4j0ioatChp/2r3ZzF670v7xKRaM+0uRWQgDAWOtzeJnzMa+aHlqyPrczUYGdz+C6lC3P62eK@vger.kernel.org, AJvYcCWt97SJoMr75UwejnOtHzs3
 HPHYKHSBJiye1THCLaD/CicDGlUvRe6XEuQYMLFbLcwSM05qDTvPry0meT67@vger.kernel.org, AJvYcCWw2O0e5YKiQmsX20BaCE+sq63vNbBtFLOBHzVHSabPxt00omU+ltiyfAMMm+U72j47zm4ZNqTDyepXel8=@vger.kernel.org, AJvYcCX6wIcpVo2H30Czq9L/WWZHQ4+CK9nntWKpFruy4k4/WWjfYNAIUOcsc8i5oR9wY0kK/y01V9nZbsNq@vger.kernel.org, AJvYcCX8isyPjbEqlX+ncRcW0i4zBx25Cxo2hQQm8sbOdsrjahW/FvvOdT/cGXiOUcb7p6wwKUpfqEcmLYJKwA==@vger.kernel.org, AJvYcCXZmS8nR/XEooGubYFQAQv3KRzuMiddPGhyTG4qvsf/7hisRCoUOambrJQcYMJF4zDtcVTAnMUTFWFU9W4=@vger.kernel.org, AJvYcCXnEAbBSVNl6iw5Jj6Be9UwqX2i9gOhLDYY7TiLMFF8btW36t7LLUknaTjsz5Q8urK+0eEikg2/4m5+@vger.kernel.org, AJvYcCXsUQAuhCc9ZXqG5nYlC1tSXwRxllGi92h43jp51KoAxZHJDC2gu2OvZ09ZsPlUjMUJ5KwhBjTb@vger.kernel.org
X-Gm-Message-State: AOJu0YwqLCXNyFyfh4/UXw2sSskVfZwqcJ95Ja7QgTGS9zoBx6Akd/Mc
	5lDQUqPcRTOSCFfPAHJW2y3vrapRW/daK5PmWSrvvxjb7dOTLMOfbMT5
X-Gm-Gg: ASbGnctj8faWoiIgfFIvgrprRXQi9O+Yh+cst0zqdVw4mNc1V962QZzUy9fKKegXMwM
	z9/3RxcQZC2MjO4HAM8uVk7XEM1/xQGrhfy+C3nkSMAuiiUdlmt+3uNE5Axxr0/IJ61pnZTsYg1
	sZAU2hgbsOiC6/AE2nyPhDFGzkvtsIZFj8OZ/7z+IsSdy4oGTseOvBiUAQnMve8+c3H/2LW2hOT
	7I9EcKNVvm9hYpyKXUoGhO3zw+zEUan5qb+mVJFYcpsgg54P6iQvcYh4PsfGqinxvtrTqIfb2nI
	Fas4VO0EBFTZoRSodESSv4RcBYTbiMILwKVKWvLC9ycHnFV29Q==
X-Google-Smtp-Source: AGHT+IFaquJkOuj7GD/t4hRYC7j2CE8mxqIujMtOYOepN4kjeXyf+EKHtvQBv03/JpyXmxYQUG4sHA==
X-Received: by 2002:a05:620a:1a1a:b0:7c5:95e6:ce1d with SMTP id af79cd13be357-7d4438566f9mr2476294085a.0.1751387143543;
        Tue, 01 Jul 2025 09:25:43 -0700 (PDT)
Received: from geday ([2804:7f2:800b:55e2::dead:c001])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd772e4305sm86349236d6.66.2025.07.01.09.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 09:25:43 -0700 (PDT)
Date: Tue, 1 Jul 2025 13:25:19 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Waqar Hameed <waqar.hameed@axis.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
	Julien Panis <jpanis@baylibre.com>,
	William Breathitt Gray <wbg@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Peter Rosin <peda@axentia.se>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Francesco Dolcini <francesco@dolcini.it>,
	=?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>,
	Mudit Sharma <muditsharma.info@gmail.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Song Qiang <songqiang1304521@gmail.com>, Crt Mori <cmo@melexis.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Karol Gugala <kgugala@antmicro.com>,
	Mateusz Holenko <mholenko@antmicro.com>,
	Gabriel Somlo <gsomlo@gmail.com>, Joel Stanley <joel@jms.id.au>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Wei Fang <wei.fang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sebastian Reichel <sre@kernel.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Han Xu <han.xu@nxp.com>, Haibo Chen <haibo.chen@nxp.com>,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	Mark Brown <broonie@kernel.org>, Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, kernel@axis.com,
	linux-iio@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-input@vger.kernel.org,
	linux-mmc@vger.kernel.org, imx@lists.linux.dev,
	netdev@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-spi@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH] Remove error prints for devm_add_action_or_reset()
Message-ID: <aGQL72Ssa4RHShIp@geday>
References: <pnd7c0s6ji2.fsf@axis.com>
 <aGP92Aqcxt-x78nu@geday>
 <pndsejf6g5k.fsf@axis.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pndsejf6g5k.fsf@axis.com>

On Tue, Jul 01, 2025 at 06:15:51PM +0200, Waqar Hameed wrote:
> On Tue, Jul 01, 2025 at 12:25 -0300 Geraldo Nascimento <geraldogabriel@gmail.com> wrote:
> 
> > [Some people who received this message don't often get email from geraldogabriel@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > On Tue, Jul 01, 2025 at 05:03:33PM +0200, Waqar Hameed wrote:
> >> When `devm_add_action_or_reset()` fails, it is due to a failed memory
> >> allocation and will thus return `-ENOMEM`. `dev_err_probe()` doesn't do
> >> anything when error is `-ENOMEM`. Therefore, remove the useless call to
> >> `dev_err_probe()` when `devm_add_action_or_reset()` fails, and just
> >> return the value instead.
> >
> > Hi Waqar,
> >
> > thank you for the patch. However I personally advise you to split the
> > patches per-file and remember to then precede each individual patch
> > subject with the proper subsystem and driver touched.
> >
> > While this looks like a nit-pick, it really isn't, and my suggestion
> > will make reviewing much more easier and you'll get your Reviewed-by's
> > and Acked-by's much more smoothly.
> >
> > The cover-letter should probably be preceded by "treewide" instead of
> > a specific subsystem.
> 
> Thank you for the suggestion Geraldo! I will do that (as also answered
> to David).

You're welcome Waqar! Note that David's suggestion is even smarter than
mine: instead of patch-bombing lots of maintainers with changes unrelated
to their subsystems through a treewide change, he suggests you split the
patch into one series per subsystem. This is indeed advisable.

Thanks,
Geraldo Nascimento

