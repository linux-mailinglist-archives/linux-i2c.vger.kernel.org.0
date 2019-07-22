Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B2BD6FE22
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2019 12:54:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728628AbfGVKyo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Jul 2019 06:54:44 -0400
Received: from ns.iliad.fr ([212.27.33.1]:49240 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728619AbfGVKyn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Jul 2019 06:54:43 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 88EBE20720;
        Mon, 22 Jul 2019 12:54:41 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 7551A2005B;
        Mon, 22 Jul 2019 12:54:41 +0200 (CEST)
Subject: Re: [RFC v2] DT-based tuner/demod init
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
To:     linux-media <linux-media@vger.kernel.org>,
        I2C <linux-i2c@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
        Brad Love <brad@nextdimension.cc>,
        Antti Palosaari <crope@iki.fi>,
        Olli Salonen <olli.salonen@iki.fi>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Simon Horman <horms+renesas@verge.net.au>,
        Peter Korsgaard <peter@korsgaard.com>,
        Peter Rosin <peda@axentia.se>, DT <devicetree@vger.kernel.org>
References: <6d38f9b1-a8cd-803d-b330-f92f7bcf08ca@free.fr>
Message-ID: <7c7f05bc-26e6-7671-a5e2-265775744096@free.fr>
Date:   Mon, 22 Jul 2019 12:54:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6d38f9b1-a8cd-803d-b330-f92f7bcf08ca@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Mon Jul 22 12:54:41 2019 +0200 (CEST)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/07/2019 18:21, Marc Gonzalez wrote:

> This is a follow-up RFC to my first request for comments:
> "[RFC] SW connection between DVB Transport Stream demuxer and I2C-based frontend"
> https://www.spinics.net/lists/arm-kernel/msg739972.html
> 
> Background: my SoC provides a "Transport Stream Interface" on-chip
> (for which I wrote a small driver, tsif.c) as well as a tuner/demod combo
> (si2141/si2168) on the board.
> 
> My original goal was: being able to link the tuner/demod from the device tree,
> instead of hard-coding them in the TSIF driver.
> 
> (Please see the resulting code at the end of this message)

Below is an analysis of the proposed driver, after a few exchanges with Mauro
on IRC.


> diff --git a/drivers/media/platform/tsif.c b/drivers/media/platform/tsif.c
> new file mode 100644
> index 000000000000..b136f334e9c6
> --- /dev/null
> +++ b/drivers/media/platform/tsif.c
> @@ -0,0 +1,185 @@
> +#include <linux/clk.h>
> +#include <linux/interrupt.h>
> +#include <linux/platform_device.h>
> +#include <media/dvb_frontend.h>
> +#include <media/dvb_demux.h>
> +#include <media/dmxdev.h>
> +
> +/* TSIF register offsets */
> +#define TSIF_STS_CTL	0x0	/* status and control */
> +#define TSIF_DATA_PORT	0x100
> +
> +/* TSIF_STS_CTL bits */
> +#define ENABLE_IRQ	BIT(28)
> +#define TSIF_STOP	BIT(3)
> +#define TSIF_START	BIT(0)
> +
> +struct tsif {
> +	void __iomem *base;
> +	struct clk *clk;
> +	int ref_count; /*** TODO: use atomic_t ??? or refcount_t ??? or kref ??? ***/
> +	u32 buf[48];
> +	struct dvb_frontend *fe;
> +	/*** DO I NEED ALL 4 ***/
> +	//struct dmx_frontend dmx_frontend;
> +	struct dvb_adapter dvb_adapter;
> +	struct dvb_demux dvb_demux;
> +	struct dmxdev dmxdev;
> +};
> +
> +static int start_tsif(struct dvb_demux_feed *feed)
> +{
> +	struct tsif *tsif = feed->demux->priv;
> +	printk("%s: feed PID=%u\n", __func__, feed->pid);
> +
> +	if (tsif->ref_count++ == 0) {
> +		u32 val = TSIF_START | ENABLE_IRQ | BIT(29);
> +		writel_relaxed(val, tsif->base + TSIF_STS_CTL);
> +	}
> +
> +	return 0;
> +}
> +
> +static int stop_tsif(struct dvb_demux_feed *feed)
> +{
> +	struct tsif *tsif = feed->demux->priv;
> +	printk("%s: feed PID=%u\n", __func__, feed->pid);
> +
> +	if (--tsif->ref_count == 0) {
> +		writel_relaxed(TSIF_STOP, tsif->base + TSIF_STS_CTL);
> +	}
> +
> +	return 0;
> +}
> +
> +static irqreturn_t tsif_isr(int irq, void *arg)
> +{
> +	int i;
> +	u32 status;
> +	struct tsif *tsif = arg;
> +
> +	status = readl_relaxed(tsif->base + TSIF_STS_CTL);
> +	writel_relaxed(status, tsif->base + TSIF_STS_CTL);
> +
> +	for (i = 0; i < 48; ++i)
> +		tsif->buf[i] = readl_relaxed(tsif->base + TSIF_DATA_PORT);
> +
> +	dvb_dmx_swfilter_packets(&tsif->dvb_demux, (void *)tsif->buf, 1);
> +
> +	return IRQ_HANDLED;
> +}

What may not be apparent here is that (in this mode) the HW generates
one interrupt for *every* *single* TS packet (i.e. 1504 bits). And it
can buffer only a single packet. Pretty hard real-time constraints...

Since I'm dealing with 25 Mbps streams (French DVB-T2 multiplex)
25*10e6 / 1504 = 16600 packets per second -- i.e. 60 µs between IRQs

Even after:

1) moving the ISR to its own dedicated core,
2) moving dvb_dmx_swfilter_packets() to a work_queue,
3) removing interrupt masking from DVB functions,
4) using large SW buffers (1024 TS packets)

I still drop a few packets here and there (~1 per minute).

Conclusion: it seems this HW mode cannot work reliably on the types
of streams I'm interested in. Thus, there's no point in supporting it
in the final driver. I need to test "advanced" mode.

Regards.
