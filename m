Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA686709731
	for <lists+linux-i2c@lfdr.de>; Fri, 19 May 2023 14:19:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbjESMTu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 May 2023 08:19:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjESMTt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 May 2023 08:19:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC28E199;
        Fri, 19 May 2023 05:19:47 -0700 (PDT)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 08AEDAF3;
        Fri, 19 May 2023 14:19:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1684498771;
        bh=gU37gYT5LJCo87RVuye14TUUNZjM/v0Qd/6iCFvpPPo=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=s1nDjSOze+Tpni8CpAkhe/SkyL65XWaEolPMnwfTQi9U83jN6VCled2YJ3wKA8rCS
         2UUB31z2gz8JwOf19MgMZzlnynhtXsvdyh9PAQn6hQhwF03MswFI6cJDzo5WNB23zd
         Nt7iHfwl0wBesha3dJk7j8I281KNw2Uif0JOLjvA=
Message-ID: <e3c18904-4681-27be-827b-f64ebb036157@ideasonboard.com>
Date:   Fri, 19 May 2023 15:19:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v13 6/8] media: i2c: add DS90UB960 driver
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
References: <5abbcb606e4c4a49821be5d107d9ddfc@dh-electronics.com>
Content-Language: en-US
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <5abbcb606e4c4a49821be5d107d9ddfc@dh-electronics.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 16/05/2023 22:05, Ludwig Zenz wrote:
>> On 16/05/2023 16:32, Ludwig Zenz wrote:
>>>> Hi,
>>>>
>>>> On 16/05/2023 15:35, Ludwig Zenz wrote:
>>>>> On Wed, 26 Apr 2023 14:51:12 +0300, Tomi Valkeinen wrote:
>>>>>
>>>>> [...]
>>>>>
>>>>>>     +static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
>>>>>>     +                                         struct v4l2_subdev_state *state)
>>>>>>     +{
>>>>>>     +  u8 fwd_ctl;
>>>>>>     +  struct {
>>>>>>     +          u32 num_streams;
>>>>>>     +          u8 pixel_dt;
>>>>>>     +          u8 meta_dt;
>>>>>>     +          u32 meta_lines;
>>>>>>     +          u32 tx_port;
>>>>>>     +  } rx_data[UB960_MAX_RX_NPORTS] = {};
>>>>>>     +  u8 vc_map[UB960_MAX_RX_NPORTS] = {};
>>>>>>     +  struct v4l2_subdev_route *route;
>>>>>>     +  unsigned int nport;
>>>>>>     +  int ret;
>>>>>>     +
>>>>>>     +  ret = ub960_validate_stream_vcs(priv);
>>>>>>     +  if (ret)
>>>>>>     +          return ret;
>>>>>>     +
>>>>>>     +  ub960_get_vc_maps(priv, state, vc_map);
>>>>>>     +
>>>>>>     +  for_each_active_route(&state->routing, route) {
>>>>>>     +          struct ub960_rxport *rxport;
>>>>>>     +          struct ub960_txport *txport;
>>>>>>     +          struct v4l2_mbus_framefmt *fmt;
>>>>>>     +          const struct ub960_format_info *ub960_fmt;
>>>>>>     +          unsigned int nport;
>>>>>>     +
>>>>>>     +          nport = ub960_pad_to_port(priv, route->sink_pad);
>>>>>>     +
>>>>>>     +          rxport = priv->rxports[nport];
>>>>>>     +          if (!rxport)
>>>>>>     +                  return -EINVAL;
>>>>>>     +
>>>>>>     +          txport = priv->txports[ub960_pad_to_port(priv, route->source_pad)];
>>>>>>     +          if (!txport)
>>>>>>     +                  return -EINVAL;
>>>>>>     +
>>>>>>     +          rx_data[nport].tx_port = ub960_pad_to_port(priv, route->source_pad);
>>>>>>     +
>>>>>>     +          rx_data[nport].num_streams++;
>>>>>>     +
>>>>>>     +          /* For the rest, we are only interested in parallel busses */
>>>>>>     +          if (rxport->rx_mode == RXPORT_MODE_CSI2_SYNC ||
>>>>>>     +              rxport->rx_mode == RXPORT_MODE_CSI2_ASYNC)
>>>>>>     +                  continue;
>>>>>>     +
>>>>>>     +          if (rx_data[nport].num_streams > 2)
>>>>>>     +                  return -EPIPE;
>>>>>>     +
>>>>>>     +          fmt = v4l2_subdev_state_get_stream_format(state,
>>>>>>     +                                                    route->sink_pad,
>>>>>>     +                                                    route->sink_stream);
>>>>>>     +          if (!fmt)
>>>>>>     +                  return -EPIPE;
>>>>>>     +
>>>>>>     +          ub960_fmt = ub960_find_format(fmt->code);
>>>>>>     +          if (!ub960_fmt)
>>>>>>     +                  return -EPIPE;
>>>>>>     +
>>>>>>     +          if (ub960_fmt->meta) {
>>>>>>     +                  if (fmt->height > 3) {
>>>>>>     +                          dev_err(&priv->client->dev,
>>>>>>     +                                  "rx%u: unsupported metadata height %u\n",
>>>>>>     +                                  nport, fmt->height);
>>>>>>     +                          return -EPIPE;
>>>>>>     +                  }
>>>>>>     +
>>>>>>     +                  rx_data[nport].meta_dt = ub960_fmt->datatype;
>>>>>>     +                  rx_data[nport].meta_lines = fmt->height;
>>>>>>     +          } else {
>>>>>>     +                  rx_data[nport].pixel_dt = ub960_fmt->datatype;
>>>>>>     +          }
>>>>>>     +  }
>>>>>>     +
>>>>>>     +  /* Configure RX ports */
>>>>>>     +
>>>>>>     +  fwd_ctl = 0;
>>>>>
>>>>> Hello, I have only used the first RX port in my setup (ds90ub933 to ds90ub964). The logic for activating/deactivating the Rx ports did not work for me. My suggestion is:
>>>>>
>>>> Why doesn't it work? What happens?
>>>>
>>>>    Tomi
>>>
>>> Hello Tomi,
>>>
>>> the port rx0 which I need was disabled and the other ports rx1 to rx3 were enabled. In other words, the exact inverse of the required selection.
>>>
>>>>>>    +                /* Forwarding */
>>>>>>    +
>>>>>>    +                fwd_ctl |= BIT(4 + nport); /* forward disable */
>>> According to the data sheet, a set bit4-7 in fwd_ctl means that the channel is disabled. So the comment 'forward disable' is correct. While debugging, however, this code was only reached for the ports to be enabled but not for the ones which should be disabled.
> 
>> This is just a setup phase, where we initialize the registers for the ports we want to use. The forwarding is then enabled later, in ub960_enable_rx_port, and even later disabled in ub960_disable_rx_port.
> 
> Thank you for the clarification. I had misinterpreted the intention of the code here.
> 
>> This assumes that the forwarding is disabled in the registers by default (which it is in UB960).
>>
>> I need to try this on my HW to verify my understanding is correct, but looking at the code, it is indeed a bit buggy.
>>
>> At this setup phase we disable the forwarding for ports we'll use, and enable the forwarding for ports we don't use (which doesn't make sense).
>> Later, when the streaming is started for that port, we enable the forwarding. So here we should just always disable the forwarding for all ports.
>>
> 
> The unused Rx ports were not disabled in my tests. Disabling all ports here should also work for my setup.
> 
>> Saying "disable the forwarding" is perhaps a bit confusing here, as the the forwarding should already be disabled in the HW here anyway. But as we write the UB960_SR_FWD_CTL1, we need to set that bit.
>>
>> So. You should see the rx0 getting enabled (later, in ub960_enable_rx_port), and I'm curious why you don't see that.
> 
> I will have another look at that next week. It could well be that in the end only the enabled but unused ports are the problem.

This should fix the issue:

@ -2486,7 +2488,7 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
  
         /* Configure RX ports */
  
-       fwd_ctl = 0;
+       fwd_ctl = GENMASK(7, 4);
  
         for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
                 struct ub960_rxport *rxport = priv->rxports[nport];
@@ -2536,8 +2538,6 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
  
                 /* Forwarding */
  
-               fwd_ctl |= BIT(4 + nport); /* forward disable */
-
                 if (rx_data[nport].tx_port == 1)
                         fwd_ctl |= BIT(nport); /* forward to TX1 */
                 else


  Tomi


