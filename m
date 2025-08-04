Return-Path: <linux-i2c+bounces-12152-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8DFB1AB95
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Aug 2025 01:52:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 528DD3B197E
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Aug 2025 23:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69642291C33;
	Mon,  4 Aug 2025 23:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jKLfG1lq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3279291C01;
	Mon,  4 Aug 2025 23:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754351522; cv=none; b=OnJXwmtOqTd+dJ0dqDtlPebSAeMkY6VYBo0fsQqysokb/anL8/eWlDz9aM7p9LNYpW+gGQ72XlMs9q/p8GsbAxVpLPPPub4ezkGsT5oWBHdU1NUlsyI2/Txvkh7weZdGcRPupZA4kf6ceGqZ2MGvgEHzuYCbe4phr7HI7hQ11g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754351522; c=relaxed/simple;
	bh=zrpGKuWeQK0S9TRd2/Kg7CrpjpN0Af6Bc1LVC3rkfJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XFrh+IN3JghX9kPYFrP1+LkoPyPKrhNvnjmVl235OWbW+fp0KIThv3YrgWpHueGO6oGUIDVP8WhqmbVzjIXAZytl5+QuLK4hon5+1oPmg93bMBaotI2lWOwpE+7uh1SPuLf6nCNVsGg9CqIIiGRRwjFu8NiMhpmpfy3QCM5oPnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jKLfG1lq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2B72432FD;
	Tue,  5 Aug 2025 01:51:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754351467;
	bh=zrpGKuWeQK0S9TRd2/Kg7CrpjpN0Af6Bc1LVC3rkfJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jKLfG1lqK2PPXLjLJhZ/Wty2yVy9+P3BkRh+DykETDA4LCFTUf911rSaO6qT+QKO7
	 wRdg/H2eRsEY6wy4MGWg5U57U5+Jrerp7zplL0nB707kdVUDUTwWAHa4Hphoow2+vz
	 YoO9D6fRkIKHNccFuia9pEsNbAUn8jx2Kons6sjM=
Date: Tue, 5 Aug 2025 02:51:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Frank Li <Frank.li@nxp.com>, Konrad Dybcio <konradybcio@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	=?utf-8?Q?Am=C3=A9lie?= Delaunay <amelie.delaunay@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	Viken Dadhaniya <quic_vdadhani@quicinc.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	imx@lists.linux.dev, linux-actions@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH RFC 2/6] dmaengine: Make of_dma_request_slave_channel
 pass a cookie to of_xlate
Message-ID: <20250804235140.GB12087@pendragon.ideasonboard.com>
References: <20250730-topic-dma_genise_cookie-v1-0-b505c1238f9f@oss.qualcomm.com>
 <20250730-topic-dma_genise_cookie-v1-2-b505c1238f9f@oss.qualcomm.com>
 <aIpKz495WI1SJTeB@lizhi-Precision-Tower-5810>
 <20250730180417.GC21430@pendragon.ideasonboard.com>
 <aIpmgpXME1BmThxU@lizhi-Precision-Tower-5810>
 <20250801120007.GB4906@pendragon.ideasonboard.com>
 <0c2cc631-21fd-41fd-9293-fd86dd09a2d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0c2cc631-21fd-41fd-9293-fd86dd09a2d2@oss.qualcomm.com>

On Sat, Aug 02, 2025 at 02:37:54PM +0200, Konrad Dybcio wrote:
> On 8/1/25 2:00 PM, Laurent Pinchart wrote:
> > On Wed, Jul 30, 2025 at 02:37:54PM -0400, Frank Li wrote:
> >> On Wed, Jul 30, 2025 at 09:04:17PM +0300, Laurent Pinchart wrote:
> >>> On Wed, Jul 30, 2025 at 12:39:43PM -0400, Frank Li wrote:
> >>>> On Wed, Jul 30, 2025 at 11:33:29AM +0200, Konrad Dybcio wrote:
> >>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>
> >>>>> The DMA subsystem attempts to make it theoretically possible to pair
> >>>>> any DMA block with any user. While that's convenient from a
> >>>>> codebase sanity perspective, some blocks are more intertwined.
> >>>>>
> >>>>> One such case is the Qualcomm GENI, where each wrapper contains a
> >>>>> number of Serial Engine instances, each one of which can be programmed
> >>>>> to support a different protocol (such as I2C, I3C, SPI, UART, etc.).
> >>>>>
> >>>>> The GPI DMA it's designed together with, needs to receive the ID of the
> >>>>> protocol that's in use, to adjust its behavior accordingly. Currently,
> >>>>> that's done through passing that ID through device tree, with each
> >>>>> Serial Engine expressed NUM_PROTOCOL times, resulting in terrible
> >>>>> dt-bindings that are full of useless copypasta.
> >>>>>
> >>>>> In a step to cut down on that, let the DMA user give the engine driver
> >>>>> a hint at request time.
> >>>>>
> >>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>> ---
> 
> [...]
> 
> >>>>> diff --git a/include/linux/of_dma.h b/include/linux/of_dma.h
> >>>>> index fd706cdf255c61c82ce30ef9a2c44930bef34bc8..9f9bc4207b85d48d73c25aad4b362e7c84c01756 100644
> >>>>> --- a/include/linux/of_dma.h
> >>>>> +++ b/include/linux/of_dma.h
> >>>>> @@ -19,7 +19,7 @@ struct of_dma {
> >>>>>  	struct list_head	of_dma_controllers;
> >>>>>  	struct device_node	*of_node;
> >>>>>  	struct dma_chan		*(*of_dma_xlate)
> >>>>> -				(struct of_phandle_args *, struct of_dma *);
> >>>>> +				(struct of_phandle_args *, struct of_dma *, void *);
> >>>>
> >>>> I suggest pass down more informaiton, like client's dev point. So we can
> >>>> auto create device link between client's dev and dma chan's device.
> >>>
> >>> Is .of_dma_xlate() really the right place to do that ? If you want to
> >>> create a device link for PM reasons, isn't it better created when the
> >>> channel is requested ? It should also be removed when the channel is
> >>> freed.
> >>
> >> I remember just need record client device pointer here.
> >>
> >>>>
> >>>> DMA Engineer device
> >>>>    DMA chan device
> >>>>        consumer clients' device.
> >>>>
> >>>> If consumer device runtime pm suspend can auto trigger DMA chan's device's
> >>>> runtime pm function.
> >>>>
> >>>> It will simplifly DMA engine's run time pm manage. Currently many DMA run
> >>>> time pm implement as, runtime_pm_get() when alloc and runtime_pm_put() at
> >>>> free channel.  But many devices request dma channel at probe, which make
> >>>> dma engine work at always 'on' state.
> >>>>
> >>>> But ideally, dma chan should be resume only when it is used to transfer.
> >>>
> >>> This is exactly what I was going to mention after reading the last
> >>> paragraph. Is there anything that prevents a DMA engine driver to
> >>> perform a rutime PM get() when a transfer is submitted
> >>
> >> DMA description is a queue, It is hard to track each descriptor submit and
> >> finished. espcially cycle buffer case.
> >>
> >> And according to dma engine API defination, submit a descriptor not
> >> neccessary to turn on clock, maybe just pure software operation, such as
> >> enqueue it to a software list.
> >>
> >> Many driver call dmaengine_submit() in irq context,  submit new descriptor
> >> when previous descriptor finished. runtime_pm_get() can NOT be called in
> >> atomic context.
> >>
> >> And some driver submit many descripor advance. Only issue_transfer() is
> >> actually trigger hardware to start transfer.
> >>
> >> Some client use cycle descripor, such audio devices.  Some audio devices
> >> have not free descriptor at their run time suspend function, just disable
> >> audio devices's clocks.  Audio devices run time suspend, which means no
> >> one use this dma channel, dma channel can auto suspend if built device link
> >> between audio device and dma chan devices.
> >>
> >> Some DMA client have not devices, such as memory to memory. for this kind
> >> case, it need keep chan always on.
> >>
> >> issue_transfer() can be call in atomic context. but trigger hardware transfer
> >> need clock and runtime_pm_get() can't be called in atomic context.
> >>
> >> Most case issue_transfer() is call in irq handle, which means device should
> >> already be in runtime resume statue.  DMA engine can safely access their
> >> register if using device link.
> > 
> > You have good points there, in particular the fact the issue_transfer()
> > can be called in interrupt context.
> > 
> > For me this calls for new DMA engine operations to "start/stop" the DMA
> > engine (better names are likely needed) from a client perspective.
> > 
> >>> and a put() when
> >>> it completes ? (Logically speaking, the actual implementation would
> >>> likely be a bit different in drivers, but the result would be similar.)
> 
> So.. do you folks want me to alter the patch in any way?

I think the runtime PM issue is orthogonal to the problem this series
addresses. It can be addressed separately.

That being said, I'm not a big fan of passing a void pointer to
.of_xlate() to carry device-specific information, in a device-specific
format. This seems prone to mismatch between clients and DMA engines.
.of_xlate() also seems the wrong place to do this. It would be cleaner
if we could use another operation, such as dmaengine_slave_config() for
instance.

-- 
Regards,

Laurent Pinchart

