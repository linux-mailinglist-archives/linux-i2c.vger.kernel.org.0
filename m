Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 423AB62112
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2019 17:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732052AbfGHPD5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Jul 2019 11:03:57 -0400
Received: from ns.iliad.fr ([212.27.33.1]:58226 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730192AbfGHPD5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 8 Jul 2019 11:03:57 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 3788B1FF8E;
        Mon,  8 Jul 2019 17:03:55 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 1D49020DD5;
        Mon,  8 Jul 2019 17:03:55 +0200 (CEST)
Subject: Re: [RFC] SW connection between DVB Transport Stream demuxer and
 I2C-based frontend
To:     Enrico Weigelt <lkml@metux.net>, I2C <linux-i2c@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        GPIO <linux-gpio@vger.kernel.org>
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
        Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <5e35b4fb-646d-6428-f372-ee47d7352cd6@free.fr>
 <b6abf5a2-3151-29e5-8eb7-c960580fd4ea@metux.net>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <79b9bd5e-be05-daa8-0d16-d84a383138a7@free.fr>
Date:   Mon, 8 Jul 2019 17:03:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b6abf5a2-3151-29e5-8eb7-c960580fd4ea@metux.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Mon Jul  8 17:03:55 2019 +0200 (CEST)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 08/07/2019 16:44, Enrico Weigelt wrote:

> On 08.07.19 13:08, Marc Gonzalez wrote:
> 
>> The tuner (si2157) is not on the i2c5 bus, instead it is on a private
>> i2c bus *behind* si2168, which routes requests to the proper client.
> 
> Should the si2168 make up its own i2c controller ?

It does AFAIU ;-)

https://elixir.bootlin.com/linux/latest/source/drivers/media/dvb-frontends/si2168.c#L780

	/* create mux i2c adapter for tuner */
	dev->muxc = i2c_mux_alloc(client->adapter, &client->dev, 1, 0, I2C_MUX_LOCKED, si2168_select, si2168_deselect);

	ret = i2c_mux_add_adapter(dev->muxc, 0, 0, 0);

	/* this is the new internal i2c bus */
	struct i2c_adapter *si2168_bus = dev->muxc->adapter[0];


One problem is that since the internal bus is "created" (declared?) at run-time,
it doesn't seem possible to define it (or its client) in DT.

Regards.
