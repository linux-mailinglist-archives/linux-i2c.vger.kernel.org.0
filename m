Return-Path: <linux-i2c+bounces-11990-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E5AB0D594
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Jul 2025 11:16:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2F0F1885955
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Jul 2025 09:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B1A2DC34C;
	Tue, 22 Jul 2025 09:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AC/2QcXX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32D22D239F;
	Tue, 22 Jul 2025 09:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753175694; cv=none; b=r+m1Lii+LJE92uCbrSkQpMUTYzqjBZ2FdHhBStKls3ZKNd2K2M8jaffaC7R7/GYdEizZUeuR4TUEKf5ZR1FF4r8T+bbX9JZasa/Kig6p3Akxxn3NBALbUfoq4EGWxq8KCJ8aGlGlUNv9tXmYFQ0sQHY7vJ0NwHsVrSIebzaDEHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753175694; c=relaxed/simple;
	bh=cacMjn5/p/M8y3JTVH1h91zknzrPaScjzMmXin+dy3M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AWGebMDKIpKeqjt+0S3SCL6nfMxUM5Bg3AfKy7ugH1iS4dGs/6oxVPvesacSri0sSZGD8WUbbmVO69eyeDw0qvVhOJ22Flf8QcDrAyp4R2qL9PK6c5KpVX340g747LMsDVhWNHZHhyaeCO77F3oA1smuTcIHhhOA8wsCNDSXj5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AC/2QcXX; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2180D43352;
	Tue, 22 Jul 2025 09:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753175684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y9hR42QpuegsrOqNZrIg+mtU4sgDTD0im7FtvEt+1js=;
	b=AC/2QcXXFQdFdcZZ3ah5NtQEdVzZS5Fv72MsSYFPI44WtrzCCNbhClR8o9ajNNaElOpejA
	oHhKfLcvkhD4+j+nIlnVyl2DIB+y+iXeStU/n0cNedk3uXbuUJSxRPM4gjIEkEeCeAS+mP
	bwWiSHmokEgwNg41kcbxL3pGydQ2GfVCvtQW84gAAWbWn8+9DY8ev+lPF2TIpusZLYQqvy
	9ZYKrPzk6s2+HTLLV9GFZh7rCfAlw1SdhZvM7cC1r7cBiD4YQt2FJrDhRX81+2EDgumC3R
	bLR/0icnlUHT81dL1J8Xtg/LdepwKyjPglRRCF3IkDE6hVCrYBOStabbFwCOwA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,  Peng Fan
 <peng.fan@oss.nxp.com>,  Carlos Song <carlos.song@nxp.com>,  Ulf Hansson
 <ulf.hansson@linaro.org>,  Stephen Boyd <sboyd@kernel.org>,
  "imx@lists.linux.dev" <imx@lists.linux.dev>,  "rafael@kernel.org"
 <rafael@kernel.org>,  "mturquette@baylibre.com" <mturquette@baylibre.com>,
  Frank Li <frank.li@nxp.com>,  "linux-i2c@vger.kernel.org"
 <linux-i2c@vger.kernel.org>,  "dakr@kernel.org" <dakr@kernel.org>,
  "festevam@gmail.com" <festevam@gmail.com>,  "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>,  "pavel@kernel.org" <pavel@kernel.org>,
  Bough Chen <haibo.chen@nxp.com>,  "len.brown@intel.com"
 <len.brown@intel.com>,  Andi Shyti <andi.shyti@kernel.org>,
  "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
  "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
  "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,  Aisheng Dong
 <aisheng.dong@nxp.com>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
  "kernel@pengutronix.de" <kernel@pengutronix.de>,  "shawnguo@kernel.org"
 <shawnguo@kernel.org>,  Jun Li <jun.li@nxp.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: Dead lock with clock global prepare_lock mutex and device's
 power.runtime_status
In-Reply-To: <CAGb2v64PfUiKjrJyhcthuLt6FXQS6VoaShYZ3A3WO__3pu4O+w@mail.gmail.com>
	(Chen-Yu Tsai's message of "Tue, 8 Jul 2025 01:28:08 +0800")
References: <VI2PR04MB11147CCEFE4204B852807AAF2E841A@VI2PR04MB11147.eurprd04.prod.outlook.com>
	<20250707105816.GF11488@nxa18884-linux>
	<20250707-careful-pragmatic-quail-e1a2d8-mkl@pengutronix.de>
	<CAGb2v64PfUiKjrJyhcthuLt6FXQS6VoaShYZ3A3WO__3pu4O+w@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Tue, 22 Jul 2025 11:14:41 +0200
Message-ID: <87pldsd1tq.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejgeehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjeegfedtfeelvdeigedvjeelgfelgeejhffgueelvefgtdejheduffehvdehgeeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvkedprhgtphhtthhopeifvghnsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhklhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepphgvnhhgrdhfrghnsehoshhsrdhngihprdgtohhmpdhrtghpthhtoheptggrrhhlohhsrdhsohhnghesnhigphdrtghomhdprhgtphhtthhopehulhhfrdhhrghnshhsohhnsehlihhnrghrohdro
 hhrghdprhgtphhtthhopehssghohigusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com

Hello,

Thanks Chen-Yu for the heads up!

On 08/07/2025 at 01:28:08 +08, Chen-Yu Tsai <wens@kernel.org> wrote:

> Hi,
>
> On Mon, Jul 7, 2025 at 7:05=E2=80=AFPM Marc Kleine-Budde <mkl@pengutronix=
.de> wrote:
>>
>> On 07.07.2025 18:58:16, Peng Fan wrote:
>> > On Tue, Jul 01, 2025 at 03:16:08AM +0000, Carlos Song wrote:
>> > >Hi, All:
>> > >
>> > >We met the dead lock issue recently and think it should be common iss=
ue and not sure how to fix it.
>> > >
>> > >We use gpio-gate-clock clock provider (drivers/clk/clk-gpio.c), gpio =
is one of i2c gpio expander (drivers/gpio/gpio-pcf857x.c). Our i2c driver e=
nable run time pm (drivers/i2c/busses/i2c-imx-lpi2c.c [1]). System random b=
locked when at reboot.
>> > >
>> > >The dead lock happen as below call stacks
>> > >
>> > >Task 117                                                Task 120
>> > >
>> > >schedule()
>> > >clk_prepare_lock()--> wait prepare_lock(mutex_lock)     schedule() wa=
it for power.runtime_status exit RPM_SUSPENDING
>> > >                           ^^^^ A                       ^^^^ B
>> > >clk_bulk_unprepare()                                    rpm_resume()
>> > >lpi2c_runtime_suspend()                                 pm_runtime_re=
sume_and_get()
>> > >...                                                     lpi2c_imx_xfe=
r()
>> > >                                                        ...
>> > >rpm_suspend() set RPM_SUSPENDING                        pcf857x_set();
>> > >                           ^^^^ B                       ...
>> > >                                                        clk_prepare_l=
ock() --> hold prepare_lock
>> > >                                                        ^^^^ A
>> > >                                                        ...
>> > >
>> >
>> > This is a common issue that clk use a big prepare lock which is easy
>> > to trigger dead lock with runtime pm. I recalled that pengutronix rais=
ed
>> > this, but could not find the information.
>>
>> Alexander Stein stumbled over this issue some time ago:
>>
>> | https://lore.kernel.org/all/20230421-kinfolk-glancing-e185fd9c47b4-mkl=
@pengutronix.de/
>>
>> I encountered it too, while trying to add a clock provider driver for a
>> SPI attached CAN controller which uses runtime pm.
>
> Miquel from Bootlin posted a more formal description of the problem and
> some possible solutions last year [1].
>
> [1] https://lore.kernel.org/all/20240527181928.4fc6b5f0@xps-13/

I also sent an RFC in April:
https://lore.kernel.org/all/20250326-cross-lock-dep-v1-0-3199e49e8652@bootl=
in.com/

I haven't got the energy yet to process the interesting feedback from
Rafael and Stephen. But getting a broader audience and maybe more
feedback will certainly help!

Thanks,
Miqu=C3=A8l

