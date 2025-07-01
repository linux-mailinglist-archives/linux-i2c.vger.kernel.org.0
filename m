Return-Path: <linux-i2c+bounces-11740-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46096AEFE54
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 17:31:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 195691892418
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 15:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389F027A933;
	Tue,  1 Jul 2025 15:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FN15I14p"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E756427A101;
	Tue,  1 Jul 2025 15:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751383539; cv=none; b=F9UFmPMR0TXl5EHljuqMH07kpFvUUTTDFzgDaZkhVPRxOZwuH15lSghLhx+wndDjT4svFKSktWc/+qqOsa9MmxyE+XTah2ndXOYa9LNQkNdInB8AERbieKDa4bQ1FvcS1A2XE/cp5kjVmIGNtpPEl5SqMQ453yuib4PexZN1wkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751383539; c=relaxed/simple;
	bh=H69zG5gO7h9M6iKs5G+TtTbg5NtVZiozRw1J2ZHqQt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c6ZsG4xnp2WL/rSSR9LgsUxpE8vkzWdN7R/EwwCoz6d+/rHC+TQ0tqFyrSDA+rY+mJro3j3xEh5TVbf+vXaoGm/APW63phKh4tqFpa94kiLw1N5nLwYjTxKrn5a0ba5MTjG8Udg4dxyWZVpV6em0ObhUnq1hbW3HqPk9A5fiIgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FN15I14p; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6facf4d8e9eso33965006d6.1;
        Tue, 01 Jul 2025 08:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751383537; x=1751988337; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H69zG5gO7h9M6iKs5G+TtTbg5NtVZiozRw1J2ZHqQt8=;
        b=FN15I14pzIS50f6zmvi461CWhZpkE7pncsv7IITewV14SyAI6kNXp50jay0VmPOTTd
         j3jTX0pD2qU9aOff2tZt/76bIDazWeDH9J/KWX1TtHQLW4xX/16R+Y4fZNZsjG2MVZqO
         RNfiq95uVAfwyOd24LYO1Ix2gIwkC3+eUczjz8hkMgTLUbHjq0WPUcUMxqosOvv9Stam
         bpJb4lwhP2CKCyxBBYl9comPPwUElxo+njbuprrkbys6f7nwklsxsr3Rc6nDM8iHvrxs
         Se356pp6o4xutLFFQGXf+1omJIRext+W3joz+Ap+wKADlte3xCt/NoVz+mXIl5sjFgKe
         PWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751383537; x=1751988337;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H69zG5gO7h9M6iKs5G+TtTbg5NtVZiozRw1J2ZHqQt8=;
        b=M9jpwCuC8hfptiOpIQ+bPDmtVzQNlooSnBM4x0BkkjWq1Uwet8cg/uFyY+0lrwh7WO
         vPeiaIei4ZVt5tU/hUlbuc/gXngymaMFS1EusYnNXFcQ9Xri7xQnnCfG2tlGWmluOGJr
         HLWfl8gqQb9jYRn0emecGXJN5qtr+9QFx/WPCYusLaH8oUHuGneZLXNRaaxsGnh5T/eu
         symNotMIdL+OasQX7KKQbPy2uMRAXWkDVGzgqzKvmdag+pJ3Nw2L1aJIeyxIFRQS1gjh
         H4bTMhqI8ni03Bj9jzet1dmhoPVzqZTje1xqTXO+UBBCLLGyRScDvW/S+Kn+ICHH9AyR
         kU0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUg8G9na4cfivTc+s2Sjrz7/m3LzwKs/bTA5xN+1rIZhE+H7GzGRPk0+kb/yq+w2qrIFD95rmfRE4YD@vger.kernel.org, AJvYcCUjDhcVrj0pV5atMR9PKZx4JIrPvPOsugY5vcseaVv0dH2pjJfw1DuVJTtKntqekwDa3kFmZQIDovkS@vger.kernel.org, AJvYcCUxxOe1BbSftvWumOBOLz6bdkyP7Cq4g33nsF8xL0qW8wgAeopC7xDRiUOEnNXXPyXzSWbbvt6FqYKH@vger.kernel.org, AJvYcCVANU4I+G4gZlArL32aU1K+uMkg8KOLeJupU5OXozUXPTvpDnQifF35M01GEvkKMm3+75E0EHcqBweFLWNKjf0fx8U=@vger.kernel.org, AJvYcCVJNXGcr4wBqYVvQXkLymaGwi4K6zcBGTaidKdI/0G1b+LCcJYr5ddcXZI/AqKfDNWTR4vSAET5IQ+Qjms=@vger.kernel.org, AJvYcCVSEm7RuVCnkI+nmluD+p0RLQk4aKepZlV8etHWLmyLTFreABO4oVb6srMrTO5csAgjjZRhHViXL8MY1oAV@vger.kernel.org, AJvYcCW1GP1audEAFmDgUHI4Hbl42MjrYXp1EXFYI7YhB13PYxZy4h//Hc3OR2mYfWEPZjZgVpPVnrAdPefO@vger.kernel.org, AJvYcCW7BLTRgffeNC+R8bLpyqMjUNmL2GLpYetg7WhwBrAviMuJEOs0OxMentvVUC8ouVMF+3Svp+vg4KET@vger.kernel.org, AJvYcCWHPFcC1zd5UF6ge/XHDefUcyCOaqNHEwmNN4cBBhXr+XrKJh9A/0UmNn/7q9FWZp4FEVXftWpmND+QnA==@vger.kernel.org, AJvYcCX1gDCFbt24sIMrL1jP6ywg
 0Iye7Nb1wiyPWHkgEJqvFvHw6OiEnpQ52Xc2tpZa+mGPkX46b5fi2JY=@vger.kernel.org, AJvYcCX2KssI84V5pMGsjr94WSx9UUqFzzmrIroKvPHFN2ed77OXaCRssglvPXG9veAS5Ia0nUCkoodZUG1YNwdW@vger.kernel.org, AJvYcCXLlx0soRgl6Mitrb/LHF3gjG68SADUVxfaK1yFujlGNq5b1PoeCLvyxxFAXpoL7E7ybwE3Cl9+G5CHFw==@vger.kernel.org, AJvYcCXfiCAUzmc0bhcJUeIY+djeq0bfdREOAJ/Myk/1ZGRxorqkhR4M0ki4ZD/eiHDgXyhvbHAXDssm@vger.kernel.org, AJvYcCXg9tRXAKvYieCg30KWuQ2F0wy3zb9TB/tnj9jFRDjc4+aNmTk80+GDZ5+n5f6twcfIzQuHvUmnVJKY@vger.kernel.org, AJvYcCXj3RusA8Rb9XY/uQtVs5mapGgZG+NiFqkdNc2IcqKrhLpXVwyI8TPmrZwEWusrI0It6BS66HID5QPKHkc=@vger.kernel.org, AJvYcCXmfFEOOwER0WPdU4HmtlnDcTdeksQCUZEtgLJ+qZdtrdK6ePt5+SCqfKVcwSHq+SIFIIO4llJJWWYwcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPM1LXpZOgY/TqKT4K7vWF4oxg2/l8/w4OEJ0vRc0uORNIHJNE
	z034VnCZ6YFKNEZ2B9nypXZoZr05sZchPd+OPHOJZMgM2aFU2u+ugV9P
X-Gm-Gg: ASbGnctzJRCDDV0wwJ7EhRy5fPGb66Racp3VykfLMV3ReqGzwKWjbYBOXrHmI/gOiOm
	xgZs1/d2kIm9AQiKniGW6Wf/drY8fKqihQogGHkiyINrMd1SOqtGrPUFDlVtW5OFbRbPpdvBV03
	MUvaPdNn5THzzpvYFlVMID0rIjDh2duzdO5W2WoWFuPFiQlgjZ0erhfK4nU5NbKQKtxCDHoZ4Ne
	TGVzPU0Q0Zw8FffPG1Az7bw4u3Dm4PMwZeD9bKKdjakGZ4iY3Sp9Szu/Sy+ZCcCs1fQn4p6DoX3
	j80+L2TqU5rYwrK1yM2KxzDK/qU51mFHiDW+toGKLT1Nx+8hfqMUmQ8Iitlj
X-Google-Smtp-Source: AGHT+IFGwV5rgzZNlThD3qZhxiETqJeu0UK36HZAls92ncvO2dh0OxLl48BruxfcxiFAUDT+MVUh3g==
X-Received: by 2002:a05:6214:d08:b0:6e8:fbb7:675b with SMTP id 6a1803df08f44-7000291854amr270803556d6.32.1751383536220;
        Tue, 01 Jul 2025 08:25:36 -0700 (PDT)
Received: from geday ([2804:7f2:800b:517d::dead:c001])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771acfe6sm85521916d6.31.2025.07.01.08.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 08:25:35 -0700 (PDT)
Date: Tue, 1 Jul 2025 12:25:12 -0300
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
Message-ID: <aGP92Aqcxt-x78nu@geday>
References: <pnd7c0s6ji2.fsf@axis.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pnd7c0s6ji2.fsf@axis.com>

On Tue, Jul 01, 2025 at 05:03:33PM +0200, Waqar Hameed wrote:
> When `devm_add_action_or_reset()` fails, it is due to a failed memory
> allocation and will thus return `-ENOMEM`. `dev_err_probe()` doesn't do
> anything when error is `-ENOMEM`. Therefore, remove the useless call to
> `dev_err_probe()` when `devm_add_action_or_reset()` fails, and just
> return the value instead.

Hi Waqar,

thank you for the patch. However I personally advise you to split the
patches per-file and remember to then precede each individual patch
subject with the proper subsystem and driver touched.

While this looks like a nit-pick, it really isn't, and my suggestion
will make reviewing much more easier and you'll get your Reviewed-by's
and Acked-by's much more smoothly.

The cover-letter should probably be preceded by "treewide" instead of
a specific subsystem.

Thank you,
Geraldo Nascimento

