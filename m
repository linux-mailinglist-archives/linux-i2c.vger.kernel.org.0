Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD5767050CF
	for <lists+linux-i2c@lfdr.de>; Tue, 16 May 2023 16:32:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233946AbjEPOcO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 May 2023 10:32:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233913AbjEPOcM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 May 2023 10:32:12 -0400
X-Greylist: delayed 3598 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 16 May 2023 07:32:02 PDT
Received: from mx2.securetransport.de (mx2.securetransport.de [IPv6:2a03:4000:13:6c7::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6BC2C2738;
        Tue, 16 May 2023 07:32:02 -0700 (PDT)
Received: from mail.dh-electronics.com (unknown [77.24.89.57])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx2.securetransport.de (Postfix) with ESMTPSA id 32C2E5EA7C;
        Tue, 16 May 2023 14:37:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
        s=dhelectronicscom; t=1684240622;
        bh=skp/axhNMcvbtQkJMBiWbGqy7uv3b/YrL4HOY83nmFg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References:From;
        b=J9G1+exx3Ap1T2ZF/zWX4gTsSvd1v/UswdOxtXxJ3oscDMJikayVQh1Osz5K2lcv2
         IUsN+slIxXQ79d9mCRC/ALlHqalgMAdiPgiVAAb26U4H92hTDiUJ5C+Ikyi0mOqyT9
         Y3SXTvwzIvbkpcovbPNcaKkuOhtNrU2N/Ll80bDTaGDA823UkBmz79aiZ9ATlyvb4a
         m7Dv+LQfu648ZIQkKv/oLQWdHeHMF8Ns8inh3ao3RPTj0GEPoaJzObraNfxSy2hEaS
         8YdmOJ+nKA4VQOuk9iOeG2tGnCWXinE3HreOJQw/X/ohwK7MXSllQegMoYniq4BOqL
         vwzVecHQTGGzw==
Received: from DHPWEX01.DH-ELECTRONICS.ORG (10.64.2.30) by
 DHPWEX01.DH-ELECTRONICS.ORG (10.64.2.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 16 May 2023 14:36:57 +0200
Received: from localhost.localdomain (172.16.51.22) by
 DHPWEX01.DH-ELECTRONICS.ORG (10.64.2.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26 via Frontend Transport; Tue, 16 May 2023 14:36:56 +0200
From:   Ludwig Zenz <lzenz@dh-electronics.com>
To:     <tomi.valkeinen@ideasonboard.com>
CC:     <Matti.Vaittinen@fi.rohmeurope.com>, <andriy.shevchenko@intel.com>,
        <andriy.shevchenko@linux.intel.com>, <broonie@kernel.org>,
        <devicetree@vger.kernel.org>, <hverkuil@xs4all.nl>,
        <khalasa@piap.pl>, <krzysztof.kozlowski+dt@linaro.org>,
        <laurent.pinchart+renesas@ideasonboard.com>, <lgirdwood@gmail.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <luca.ceresoli@bootlin.com>,
        <m.tretter@pengutronix.de>, <marex@denx.de>, <mchehab@kernel.org>,
        <mpagano@gentoo.org>, <peda@axentia.se>, <robh+dt@kernel.org>,
        <sakari.ailus@linux.intel.com>, <satish.nagireddy@getcruise.com>,
        <wsa@kernel.org>
Subject: Re: [PATCH v13 6/8] media: i2c: add DS90UB960 driver
Date:   Tue, 16 May 2023 14:35:49 +0200
Message-ID: <20230516123549.3120-1-lzenz@dh-electronics.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230426115114.156696-7-tomi.valkeinen@ideasonboard.com>
References: <20230426115114.156696-7-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
X-klartext: yes
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 26 Apr 2023 14:51:12 +0300, Tomi Valkeinen wrote:

[...]

>  +static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
>  +					       struct v4l2_subdev_state *state)
>  +{
>  +	u8 fwd_ctl;
>  +	struct {
>  +		u32 num_streams;
>  +		u8 pixel_dt;
>  +		u8 meta_dt;
>  +		u32 meta_lines;
>  +		u32 tx_port;
>  +	} rx_data[UB960_MAX_RX_NPORTS] = {};
>  +	u8 vc_map[UB960_MAX_RX_NPORTS] = {};
>  +	struct v4l2_subdev_route *route;
>  +	unsigned int nport;
>  +	int ret;
>  +
>  +	ret = ub960_validate_stream_vcs(priv);
>  +	if (ret)
>  +		return ret;
>  +
>  +	ub960_get_vc_maps(priv, state, vc_map);
>  +
>  +	for_each_active_route(&state->routing, route) {
>  +		struct ub960_rxport *rxport;
>  +		struct ub960_txport *txport;
>  +		struct v4l2_mbus_framefmt *fmt;
>  +		const struct ub960_format_info *ub960_fmt;
>  +		unsigned int nport;
>  +
>  +		nport = ub960_pad_to_port(priv, route->sink_pad);
>  +
>  +		rxport = priv->rxports[nport];
>  +		if (!rxport)
>  +			return -EINVAL;
>  +
>  +		txport = priv->txports[ub960_pad_to_port(priv, route->source_pad)];
>  +		if (!txport)
>  +			return -EINVAL;
>  +
>  +		rx_data[nport].tx_port = ub960_pad_to_port(priv, route->source_pad);
>  +
>  +		rx_data[nport].num_streams++;
>  +
>  +		/* For the rest, we are only interested in parallel busses */
>  +		if (rxport->rx_mode == RXPORT_MODE_CSI2_SYNC ||
>  +		    rxport->rx_mode == RXPORT_MODE_CSI2_ASYNC)
>  +			continue;
>  +
>  +		if (rx_data[nport].num_streams > 2)
>  +			return -EPIPE;
>  +
>  +		fmt = v4l2_subdev_state_get_stream_format(state,
>  +							  route->sink_pad,
>  +							  route->sink_stream);
>  +		if (!fmt)
>  +			return -EPIPE;
>  +
>  +		ub960_fmt = ub960_find_format(fmt->code);
>  +		if (!ub960_fmt)
>  +			return -EPIPE;
>  +
>  +		if (ub960_fmt->meta) {
>  +			if (fmt->height > 3) {
>  +				dev_err(&priv->client->dev,
>  +					"rx%u: unsupported metadata height %u\n",
>  +					nport, fmt->height);
>  +				return -EPIPE;
>  +			}
>  +
>  +			rx_data[nport].meta_dt = ub960_fmt->datatype;
>  +			rx_data[nport].meta_lines = fmt->height;
>  +		} else {
>  +			rx_data[nport].pixel_dt = ub960_fmt->datatype;
>  +		}
>  +	}
>  +
>  +	/* Configure RX ports */
>  +
>  +	fwd_ctl = 0;

Hello, I have only used the first RX port in my setup (ds90ub933 to ds90ub964). The logic for activating/deactivating the Rx ports did not work for me. My suggestion is:

-	fwd_ctl = 0;
+	fwd_ctl = 0xF0; /* Default: Disable forwarding for all RX ports */

>  +
>  +	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
>  +		struct ub960_rxport *rxport = priv->rxports[nport];
>  +		u8 vc = vc_map[nport];
>  +
>  +		if (rx_data[nport].num_streams == 0)
>  +			continue;
>  +
>  +		switch (rxport->rx_mode) {
>  +		case RXPORT_MODE_RAW10:
>  +			ub960_rxport_write(priv, nport, UB960_RR_RAW10_ID,
>  +				rx_data[nport].pixel_dt | (vc << UB960_RR_RAW10_ID_VC_SHIFT));
>  +
>  +			ub960_rxport_write(priv, rxport->nport,
>  +				UB960_RR_RAW_EMBED_DTYPE,
>  +				(rx_data[nport].meta_lines << UB960_RR_RAW_EMBED_DTYPE_LINES_SHIFT) |
>  +					rx_data[nport].meta_dt);
>  +
>  +			break;
>  +
>  +		case RXPORT_MODE_RAW12_HF:
>  +		case RXPORT_MODE_RAW12_LF:
>  +			/* Not implemented */
>  +			break;
>  +
>  +		case RXPORT_MODE_CSI2_SYNC:
>  +		case RXPORT_MODE_CSI2_ASYNC:
>  +			if (!priv->hw_data->is_ub9702) {
>  +				/* Map all VCs from this port to the same VC */
>  +				ub960_rxport_write(priv, nport, UB960_RR_CSI_VC_MAP,
>  +						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(3)) |
>  +						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(2)) |
>  +						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(1)) |
>  +						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(0)));
>  +			} else {
>  +				unsigned int i;
>  +
>  +				/* Map all VCs from this port to VC(nport) */
>  +				for (i = 0; i < 8; i++)
>  +					ub960_rxport_write(priv, nport,
>  +							   UB960_RR_VC_ID_MAP(i),
>  +							   nport);
>  +			}
>  +
>  +			break;
>  +		}
>  +
>  +		/* Forwarding */
>  +
>  +		fwd_ctl |= BIT(4 + nport); /* forward disable */

-		fwd_ctl |= BIT(4 + nport); /* forward disable */
+		fwd_ctl &= ~UB960_SR_FWD_CTL1_PORT_DIS(nport); /* clear disable
+								  forwarding */

According to the data sheet, the ds90ub960 and the ds90ub964 should be identical, so this change should fit both devices.

>  +		if (rx_data[nport].tx_port == 1)
>  +			fwd_ctl |= BIT(nport); /* forward to TX1 */
>  +		else
>  +			fwd_ctl &= ~BIT(nport); /* forward to TX0 */
>  +	}
>  +
>  +	ub960_write(priv, UB960_SR_FWD_CTL1, fwd_ctl);
>  +
>  +	return 0;
>  +}

[...]

Thanks and regards,
Ludwig Zenz
