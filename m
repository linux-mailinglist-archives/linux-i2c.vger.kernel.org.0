Return-Path: <linux-i2c+bounces-11758-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9235AF0D3D
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 09:54:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C8921C2356C
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 07:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C28231C9C;
	Wed,  2 Jul 2025 07:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WFmlGPHc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFF1200BA1;
	Wed,  2 Jul 2025 07:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751442862; cv=none; b=dB1c7XXXCXgl0UerEa1O3+p3bKMCDMvJNXZRSYqH/Ct4sAz1jYnPW2YdC01FYVxtJI3/1tfYRLqweQQl+vIM1nvK44xG9Hhi2s7Z7rtScjOQRVMj/gH4pA3aC1+1Ak/f4Z78EvUZE6O/kVxvZ32bS+pgga/rW9vFyWb0DAMh4+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751442862; c=relaxed/simple;
	bh=rUwUc12CwDq37/2slGik7dRlGZeOaTXSpDsb9W6K1i0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=seWro7qJbYup7GFHmBryUyfZyi21bjRG0TQ+CZ8891D2I9JMrh4nutDvxHDeSGNPrMSsQ+CmWda+BZKloUyPnBbpVUY8UdreAnrSj0KlCxoUkF7kJAqGUyO4dxrMY1LcI5h8kwPyXtaNGAJqyDGt8Uci5l6yvS078UflmaX12Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WFmlGPHc; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751442861; x=1782978861;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=rUwUc12CwDq37/2slGik7dRlGZeOaTXSpDsb9W6K1i0=;
  b=WFmlGPHcxwX2SUVmyW4anhqDN0rNuxfRwK7E9iwtDHAcNG7n7mt90SIG
   mK78cNLxHgzP3jnCF5zBRVkB5QsRJEhrlhQmctWpLYDy9hcKUJP6osqIO
   ITXwPhqMBGIlBPD2tkZ/cmVS0tyfS6Wjljwn5b5AqfAW4+OULwBzvS6Ia
   VNXeQvB+I9uTDKycbHdAlqDbmLW72LHH0o8b0E1KLE3EpPwUTagjbcNkJ
   sD5Z8b8zH7l+nmdMuJGYuhw04CIvNLIjNCFTwTpaY5NQuObmC41d0/3rr
   aJEMHOiMdpkSl/NH+LB91PDo5gtbLJgp6Ar6+xQVimIwHzbUkEPsv6fmh
   w==;
X-CSE-ConnectionGUID: erfliI1MQcScn6KMnows+g==
X-CSE-MsgGUID: 824dVOprSDmNoKTkDgl55Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64326060"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="64326060"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 00:54:18 -0700
X-CSE-ConnectionGUID: 98SccRJrQ5yvJqszW1ShBA==
X-CSE-MsgGUID: 52dATgF7Sy6tK3S06PLKug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="153636445"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 00:53:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uWsHv-0000000BrCM-1jUQ;
	Wed, 02 Jul 2025 10:53:51 +0300
Date: Wed, 2 Jul 2025 10:53:50 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Waqar Hameed <waqar.hameed@axis.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Julien Panis <jpanis@baylibre.com>,
	William Breathitt Gray <wbg@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Peter Rosin <peda@axentia.se>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Francesco Dolcini <francesco@dolcini.it>,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <jpaulo.silvagoncalves@gmail.com>,
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
Message-ID: <aGTljgePpiPJq2xj@smile.fi.intel.com>
References: <pnd7c0s6ji2.fsf@axis.com>
 <ylr7cuxldwb24ccenen4khtyddzq3owgzzfblbohkdxb7p7eeo@qpuddn6wrz3x>
 <CAHp75Ve=Zas8=6YKoPeTRrvjCaTyyRAyJG1gBLripqZgQpfg7g@mail.gmail.com>
 <zxtyk4vly2salnoy3lng2ni7pzu3wg6qnmucadnclfigrd2m2m@i6xcrmvh34r5>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <zxtyk4vly2salnoy3lng2ni7pzu3wg6qnmucadnclfigrd2m2m@i6xcrmvh34r5>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jul 02, 2025 at 08:10:28AM +0200, Uwe Kleine-König wrote:
> On Tue, Jul 01, 2025 at 08:57:02PM +0300, Andy Shevchenko wrote:
> > On Tue, Jul 1, 2025 at 8:44 PM Uwe Kleine-König <ukleinek@kernel.org> wrote:
> > > On Tue, Jul 01, 2025 at 05:03:33PM +0200, Waqar Hameed wrote:

...

> > > With that
> > >
> > >         ret = devm_add_action_or_reset(dev, meson_pwm_s4_put_clk,
> > >                                        meson->channels[i].clk);
> > >         if (ret)
> > >                 return dev_err_probe(dev, ret,
> > >                                      "Failed to add clk_put action\n");
> > >
> > > from drivers/pwm/pwm-meson.c is optimized to
> > >
> > >         ret = devm_add_action_or_reset(dev, meson_pwm_s4_put_clk,
> > >                                        meson->channels[i].clk);
> > >         if (ret)
> > >                 return ret;
> > >
> > > .
> > >
> > > I would prefer this approach, because a) there is no need to drop all
> > > dev_err_probe()s after devm_add_action_or_reset() and b) the
> > > dev_err_probe()s could stay for consistency in the error paths of a
> > > driver.
> > 
> > Why do we need a dev_err_probe() after devm_add_action*()? I would
> > expect that the original call (if needed) can spit out a message.
> 
> I'm not a big fan of API functions that emit an error message.

We do have that in devm_ioremap*() family. Just saying...

> In general the caller knows better what went wrong (here:
> devm_add_action_or_reset() doesn't know this to be about the clk_put
> action), so the error message can be more expressive.

I'm not sure I was clear about my suggestion. What I argued is something like
this

devm_foo_alloc()
{
	ret = foo_alloc();
	if (ret)
		return dev_err_probe();

	return devm_add_action_or_reset();
}

foo_alloc() in my example is left untouched.

> Also in general an API function doesn't know if a failure is fatal or if
> the consumer handles the failure just well and if the call is part of a
> driver's .probe() so it's unclear if dev_err_probe() can/should be used.
> (I admit that the last two probably don't apply to
> devm_add_action_or_reset() but that's not a good enough reason to
> make this function special. Every special case is a maintanance burden.)

devm_*() are only supposed to be called in the probe phase. So using
dev_err_probe() there (implementations) is natural thing to do, if required.
And see above, we have such cases already.

-- 
With Best Regards,
Andy Shevchenko



