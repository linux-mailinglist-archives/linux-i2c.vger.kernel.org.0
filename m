Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87DF3704E91
	for <lists+linux-i2c@lfdr.de>; Tue, 16 May 2023 15:03:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233383AbjEPNDS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 May 2023 09:03:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233401AbjEPNDQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 May 2023 09:03:16 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36CEF4EED;
        Tue, 16 May 2023 06:02:46 -0700 (PDT)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 398454A9;
        Tue, 16 May 2023 15:02:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1684242150;
        bh=TlNdBKkLAEInokDFjqPTsQOhyqAowP6vdWV3DseKRdI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=F3jTIoCqLOBdBANGTURE8Lv4rZHMVH+exMuINBzmHL0WuJKXKceSIRHg1mu1duOJl
         AIa/708sqhAtsqNlybfXBoUtQ3AsizEdrakqpYdyou2gDHe8mNNZFBC/f13zR8FgI8
         fsEZZIhHBXlS/o0OU37q/DGcj79CxsxtG+4pFXmg=
Message-ID: <80f05939-1cc8-e435-138d-b2f519c3b407@ideasonboard.com>
Date:   Tue, 16 May 2023 16:02:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v13 6/8] media: i2c: add DS90UB960 driver
To:     Ludwig Zenz <lzenz@dh-electronics.com>
Cc:     Matti.Vaittinen@fi.rohmeurope.com, andriy.shevchenko@intel.com,
        andriy.shevchenko@linux.intel.com, broonie@kernel.org,
        devicetree@vger.kernel.org, hverkuil@xs4all.nl, khalasa@piap.pl,
        krzysztof.kozlowski+dt@linaro.org,
        laurent.pinchart+renesas@ideasonboard.com, lgirdwood@gmail.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, luca.ceresoli@bootlin.com,
        m.tretter@pengutronix.de, marex@denx.de, mchehab@kernel.org,
        mpagano@gentoo.org, peda@axentia.se, robh+dt@kernel.org,
        sakari.ailus@linux.intel.com, satish.nagireddy@getcruise.com,
        wsa@kernel.org
References: <20230426115114.156696-7-tomi.valkeinen@ideasonboard.com>
 <20230516123549.3120-1-lzenz@dh-electronics.com>
Content-Language: en-US
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230516123549.3120-1-lzenz@dh-electronics.com>
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

Hi,

On 16/05/2023 15:35, Ludwig Zenz wrote:
> On Wed, 26 Apr 2023 14:51:12 +0300, Tomi Valkeinen wrote:
> 
> [...]
> 
>>   +static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
>>   +					       struct v4l2_subdev_state *state)
>>   +{
>>   +	u8 fwd_ctl;
>>   +	struct {
>>   +		u32 num_streams;
>>   +		u8 pixel_dt;
>>   +		u8 meta_dt;
>>   +		u32 meta_lines;
>>   +		u32 tx_port;
>>   +	} rx_data[UB960_MAX_RX_NPORTS] = {};
>>   +	u8 vc_map[UB960_MAX_RX_NPORTS] = {};
>>   +	struct v4l2_subdev_route *route;
>>   +	unsigned int nport;
>>   +	int ret;
>>   +
>>   +	ret = ub960_validate_stream_vcs(priv);
>>   +	if (ret)
>>   +		return ret;
>>   +
>>   +	ub960_get_vc_maps(priv, state, vc_map);
>>   +
>>   +	for_each_active_route(&state->routing, route) {
>>   +		struct ub960_rxport *rxport;
>>   +		struct ub960_txport *txport;
>>   +		struct v4l2_mbus_framefmt *fmt;
>>   +		const struct ub960_format_info *ub960_fmt;
>>   +		unsigned int nport;
>>   +
>>   +		nport = ub960_pad_to_port(priv, route->sink_pad);
>>   +
>>   +		rxport = priv->rxports[nport];
>>   +		if (!rxport)
>>   +			return -EINVAL;
>>   +
>>   +		txport = priv->txports[ub960_pad_to_port(priv, route->source_pad)];
>>   +		if (!txport)
>>   +			return -EINVAL;
>>   +
>>   +		rx_data[nport].tx_port = ub960_pad_to_port(priv, route->source_pad);
>>   +
>>   +		rx_data[nport].num_streams++;
>>   +
>>   +		/* For the rest, we are only interested in parallel busses */
>>   +		if (rxport->rx_mode == RXPORT_MODE_CSI2_SYNC ||
>>   +		    rxport->rx_mode == RXPORT_MODE_CSI2_ASYNC)
>>   +			continue;
>>   +
>>   +		if (rx_data[nport].num_streams > 2)
>>   +			return -EPIPE;
>>   +
>>   +		fmt = v4l2_subdev_state_get_stream_format(state,
>>   +							  route->sink_pad,
>>   +							  route->sink_stream);
>>   +		if (!fmt)
>>   +			return -EPIPE;
>>   +
>>   +		ub960_fmt = ub960_find_format(fmt->code);
>>   +		if (!ub960_fmt)
>>   +			return -EPIPE;
>>   +
>>   +		if (ub960_fmt->meta) {
>>   +			if (fmt->height > 3) {
>>   +				dev_err(&priv->client->dev,
>>   +					"rx%u: unsupported metadata height %u\n",
>>   +					nport, fmt->height);
>>   +				return -EPIPE;
>>   +			}
>>   +
>>   +			rx_data[nport].meta_dt = ub960_fmt->datatype;
>>   +			rx_data[nport].meta_lines = fmt->height;
>>   +		} else {
>>   +			rx_data[nport].pixel_dt = ub960_fmt->datatype;
>>   +		}
>>   +	}
>>   +
>>   +	/* Configure RX ports */
>>   +
>>   +	fwd_ctl = 0;
> 
> Hello, I have only used the first RX port in my setup (ds90ub933 to ds90ub964). The logic for activating/deactivating the Rx ports did not work for me. My suggestion is:

Why doesn't it work? What happens?

  Tomi

