Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D537705011
	for <lists+linux-i2c@lfdr.de>; Tue, 16 May 2023 15:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232931AbjEPN7G (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 May 2023 09:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232324AbjEPN7G (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 May 2023 09:59:06 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB30F1711;
        Tue, 16 May 2023 06:59:04 -0700 (PDT)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C38EC496;
        Tue, 16 May 2023 15:58:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1684245531;
        bh=gEsB0fM6tfxewDDdl3+BOaZexrT5+eQ7tC+wPa1JWRw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=djN2Trpe15eh46x7+13ZWImiBtHULSwhNVucLkofotQ0kvA7zZIzRc1Wpt2iGA2ey
         PGUcOKEmw79drgPwMm7gG0kZ9tldicjQdvsUu0FriTt0qp4S9GUOyKB0Z8O3qEuzs+
         qcw5gL9NN2Q39PbGiqNNOBFiXriY4TbhPE0ONv/I=
Message-ID: <ed622265-326e-b150-1c18-c028c04da6e0@ideasonboard.com>
Date:   Tue, 16 May 2023 16:58:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v13 6/8] media: i2c: add DS90UB960 driver
Content-Language: en-US
To:     Ludwig Zenz <lzenz@dh-electronics.com>
Cc:     "Matti.Vaittinen@fi.rohmeurope.com" 
        <Matti.Vaittinen@fi.rohmeurope.com>,
        "andriy.shevchenko@intel.com" <andriy.shevchenko@intel.com>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
        "khalasa@piap.pl" <khalasa@piap.pl>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
        "m.tretter@pengutronix.de" <m.tretter@pengutronix.de>,
        "marex@denx.de" <marex@denx.de>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "mpagano@gentoo.org" <mpagano@gentoo.org>,
        "peda@axentia.se" <peda@axentia.se>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "satish.nagireddy@getcruise.com" <satish.nagireddy@getcruise.com>,
        "wsa@kernel.org" <wsa@kernel.org>
References: <e13dade162f74a3e812f9331b83928f0@dh-electronics.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <e13dade162f74a3e812f9331b83928f0@dh-electronics.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 16/05/2023 16:32, Ludwig Zenz wrote:
>> Hi,
>>
>> On 16/05/2023 15:35, Ludwig Zenz wrote:
>>> On Wed, 26 Apr 2023 14:51:12 +0300, Tomi Valkeinen wrote:
>>>
>>> [...]
>>>
>>>>    +static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
>>>>    +                                         struct v4l2_subdev_state *state)
>>>>    +{
>>>>    +  u8 fwd_ctl;
>>>>    +  struct {
>>>>    +          u32 num_streams;
>>>>    +          u8 pixel_dt;
>>>>    +          u8 meta_dt;
>>>>    +          u32 meta_lines;
>>>>    +          u32 tx_port;
>>>>    +  } rx_data[UB960_MAX_RX_NPORTS] = {};
>>>>    +  u8 vc_map[UB960_MAX_RX_NPORTS] = {};
>>>>    +  struct v4l2_subdev_route *route;
>>>>    +  unsigned int nport;
>>>>    +  int ret;
>>>>    +
>>>>    +  ret = ub960_validate_stream_vcs(priv);
>>>>    +  if (ret)
>>>>    +          return ret;
>>>>    +
>>>>    +  ub960_get_vc_maps(priv, state, vc_map);
>>>>    +
>>>>    +  for_each_active_route(&state->routing, route) {
>>>>    +          struct ub960_rxport *rxport;
>>>>    +          struct ub960_txport *txport;
>>>>    +          struct v4l2_mbus_framefmt *fmt;
>>>>    +          const struct ub960_format_info *ub960_fmt;
>>>>    +          unsigned int nport;
>>>>    +
>>>>    +          nport = ub960_pad_to_port(priv, route->sink_pad);
>>>>    +
>>>>    +          rxport = priv->rxports[nport];
>>>>    +          if (!rxport)
>>>>    +                  return -EINVAL;
>>>>    +
>>>>    +          txport = priv->txports[ub960_pad_to_port(priv, route->source_pad)];
>>>>    +          if (!txport)
>>>>    +                  return -EINVAL;
>>>>    +
>>>>    +          rx_data[nport].tx_port = ub960_pad_to_port(priv, route->source_pad);
>>>>    +
>>>>    +          rx_data[nport].num_streams++;
>>>>    +
>>>>    +          /* For the rest, we are only interested in parallel busses */
>>>>    +          if (rxport->rx_mode == RXPORT_MODE_CSI2_SYNC ||
>>>>    +              rxport->rx_mode == RXPORT_MODE_CSI2_ASYNC)
>>>>    +                  continue;
>>>>    +
>>>>    +          if (rx_data[nport].num_streams > 2)
>>>>    +                  return -EPIPE;
>>>>    +
>>>>    +          fmt = v4l2_subdev_state_get_stream_format(state,
>>>>    +                                                    route->sink_pad,
>>>>    +                                                    route->sink_stream);
>>>>    +          if (!fmt)
>>>>    +                  return -EPIPE;
>>>>    +
>>>>    +          ub960_fmt = ub960_find_format(fmt->code);
>>>>    +          if (!ub960_fmt)
>>>>    +                  return -EPIPE;
>>>>    +
>>>>    +          if (ub960_fmt->meta) {
>>>>    +                  if (fmt->height > 3) {
>>>>    +                          dev_err(&priv->client->dev,
>>>>    +                                  "rx%u: unsupported metadata height %u\n",
>>>>    +                                  nport, fmt->height);
>>>>    +                          return -EPIPE;
>>>>    +                  }
>>>>    +
>>>>    +                  rx_data[nport].meta_dt = ub960_fmt->datatype;
>>>>    +                  rx_data[nport].meta_lines = fmt->height;
>>>>    +          } else {
>>>>    +                  rx_data[nport].pixel_dt = ub960_fmt->datatype;
>>>>    +          }
>>>>    +  }
>>>>    +
>>>>    +  /* Configure RX ports */
>>>>    +
>>>>    +  fwd_ctl = 0;
>>>
>>> Hello, I have only used the first RX port in my setup (ds90ub933 to ds90ub964). The logic for activating/deactivating the Rx ports did not work for me. My suggestion is:
>>
>> Why doesn't it work? What happens?
>>
>>   Tomi
> 
> Hello Tomi,
> 
> the port rx0 which I need was disabled and the other ports rx1 to rx3 were enabled. In other words, the exact inverse of the required selection.
> 
>>>>   +		/* Forwarding */
>>>>   +
>>>>   +		fwd_ctl |= BIT(4 + nport); /* forward disable */
> According to the data sheet, a set bit4-7 in fwd_ctl means that the channel is disabled. So the comment 'forward disable' is correct. While debugging, however, this code was only reached for the ports to be enabled but not for the ones which should be disabled.

This is just a setup phase, where we initialize the registers for the 
ports we want to use. The forwarding is then enabled later, in 
ub960_enable_rx_port, and even later disabled in ub960_disable_rx_port.

This assumes that the forwarding is disabled in the registers by default 
(which it is in UB960).

I need to try this on my HW to verify my understanding is correct, but 
looking at the code, it is indeed a bit buggy.

At this setup phase we disable the forwarding for ports we'll use, and 
enable the forwarding for ports we don't use (which doesn't make sense). 
Later, when the streaming is started for that port, we enable the 
forwarding. So here we should just always disable the forwarding for all 
ports.

Saying "disable the forwarding" is perhaps a bit confusing here, as the 
the forwarding should already be disabled in the HW here anyway. But as 
we write the UB960_SR_FWD_CTL1, we need to set that bit.

So. You should see the rx0 getting enabled (later, in 
ub960_enable_rx_port), and I'm curious why you don't see that.

  Tomi

