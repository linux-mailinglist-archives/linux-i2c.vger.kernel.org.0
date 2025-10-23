Return-Path: <linux-i2c+bounces-13760-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9A5C023BB
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 17:49:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BD103A5AF3
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 15:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40BA122ACF3;
	Thu, 23 Oct 2025 15:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="h9Gt9+D8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B401B228CB0;
	Thu, 23 Oct 2025 15:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761234523; cv=none; b=DUIbP6uLeSevQDkTTwOkxlpcoM3Eqfld3r4AQOhc0/P7RjlvSVEgULTneH7gBHtdVC7yXguy5RVoG8poRItiz5m7ZD6GHnqsVjhZLqO6HRXRjuCFmlCjNQdbS8hfWFSxFJylWZzdlcYvoDEL6QrCatYNUbFh59J4p0txooNMpRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761234523; c=relaxed/simple;
	bh=c5OIwrk8ZYMRus5tNxvO/HZcrC4w4hxD32jLIzwnS4E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=B3CgqrtKbygaJ73tOd96iYp/AD4gu7x8Wgo7EJomEyiJ/MpJnSAq8MA7WicPRUcUi2eO+lbUoDNCSaKgxC2Lf+HDLenxq2BvD6d97i94qn9bKz8/8nLrpXKJOx6Yselo4FStavLHYUzv1VXlPliIzGQ4+/mra6ETASwpFTaZ6bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=h9Gt9+D8; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1892AC0C42F;
	Thu, 23 Oct 2025 15:48:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D426960703;
	Thu, 23 Oct 2025 15:48:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 10DE4102F2426;
	Thu, 23 Oct 2025 17:47:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761234515; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=c5OIwrk8ZYMRus5tNxvO/HZcrC4w4hxD32jLIzwnS4E=;
	b=h9Gt9+D8l2ZUFtDurQ3rHUOM/IhPtThzsjP+mR+mjk5AyxaUF93Z4ykKZEQtkJqay1AD1K
	sIZcj49FoFIFL78j+4y//Caq8uWZOfmRglEOU4aUkZkYq9czQUwcjjyrWn0KqptVZxF8BM
	G2f3UPyVQ2K4G7ln7m29ljbih+NvODUNsCNkGEAdDq4qtwEmS7yBe+WAgWCHK0te73pNNm
	OF2ATyCHjMJh48CF7+MgqUNCmXvheA24dqHYr70xHnpvQHuUiVDelup2TIFyQ0RpD+mw7X
	FxasBSnooBbZvMJZAHlWKT9tXo6yRXIIREu2VDg5LgqNfAKMvPPM1pwR7HD29Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Stephen Boyd <sboyd@kernel.org>,  David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Thomas Zimmermann
 <tzimmermann@suse.de>,  Andrzej Hajda <andrzej.hajda@intel.com>,  Robert
 Foss <rfoss@kernel.org>,  Vinod Koul <vkoul@kernel.org>,  Moritz Fischer
 <mdf@kernel.org>,  Xu Yilun <yilun.xu@intel.com>,  Bartosz Golaszewski
 <brgl@bgdev.pl>,  Guenter Roeck <linux@roeck-us.net>,  Andi Shyti
 <andi.shyti@kernel.org>,  Jonathan Cameron <jic23@kernel.org>,  Dmitry
 Torokhov <dmitry.torokhov@gmail.com>,  Georgi Djakov <djakov@kernel.org>,
  Thomas Gleixner <tglx@linutronix.de>,  Joerg Roedel <joro@8bytes.org>,
  Jassi Brar <jassisinghbrar@gmail.com>,  Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Lee Jones <lee@kernel.org>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Andrew Lunn
 <andrew+netdev@lunn.ch>,  "David S. Miller" <davem@davemloft.net>,  Eric
 Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo
 Abeni <pabeni@redhat.com>,  Johannes Berg <johannes@sipsolutions.net>,
  Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
  Manivannan Sadhasivam
 <mani@kernel.org>,  Bjorn Helgaas <bhelgaas@google.com>,  Kishon Vijay
 Abraham I <kishon@kernel.org>,  Sebastian Reichel <sre@kernel.org>,  Uwe
 =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,  Mark Brown
 <broonie@kernel.org>,
  Mathieu Poirier <mathieu.poirier@linaro.org>,  Philipp Zabel
 <p.zabel@pengutronix.de>,  Olivia Mackall <olivia@selenic.com>,  Herbert
 Xu <herbert@gondor.apana.org.au>,  Daniel Lezcano
 <daniel.lezcano@linaro.org>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-clk@vger.kernel.org,
  dri-devel@lists.freedesktop.org,  linux-fbdev@vger.kernel.org,
  dmaengine@vger.kernel.org,  linux-fpga@vger.kernel.org,
  linux-gpio@vger.kernel.org,  linux-hwmon@vger.kernel.org,
  linux-i2c@vger.kernel.org,  linux-iio@vger.kernel.org,
  linux-input@vger.kernel.org,  linux-pm@vger.kernel.org,
  iommu@lists.linux.dev,  linux-media@vger.kernel.org,
  linux-mtd@lists.infradead.org,  netdev@vger.kernel.org,
  linux-wireless@vger.kernel.org,  linux-pci@vger.kernel.org,
  linux-phy@lists.infradead.org,  linux-pwm@vger.kernel.org,
  linux-remoteproc@vger.kernel.org,  linux-crypto@vger.kernel.org,
  linux-sound@vger.kernel.org,  linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Remove extra blank lines
In-Reply-To: <20251023143957.2899600-1-robh@kernel.org> (Rob Herring's message
	of "Thu, 23 Oct 2025 09:37:56 -0500")
References: <20251023143957.2899600-1-robh@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 23 Oct 2025 17:47:55 +0200
Message-ID: <87h5vpr55g.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello,

On 23/10/2025 at 09:37:56 -05, "Rob Herring (Arm)" <robh@kernel.org> wrote:

> Generally at most 1 blank line is the standard style for DT schema
> files. Remove the few cases with more than 1 so that the yamllint check
> for this can be enabled.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com> # mtd

Thanks,
Miqu=C3=A8l

