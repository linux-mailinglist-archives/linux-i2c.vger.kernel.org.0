Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67116657023
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Dec 2022 22:57:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbiL0V5Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Dec 2022 16:57:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbiL0V5Y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Dec 2022 16:57:24 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 073F4C758;
        Tue, 27 Dec 2022 13:57:22 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10573"; a="407027847"
X-IronPort-AV: E=Sophos;i="5.96,279,1665471600"; 
   d="scan'208";a="407027847"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2022 13:57:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10573"; a="721609669"
X-IronPort-AV: E=Sophos;i="5.96,279,1665471600"; 
   d="scan'208";a="721609669"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 27 Dec 2022 13:57:19 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pAHwj-000H8E-0y;
        Tue, 27 Dec 2022 23:57:17 +0200
Date:   Tue, 27 Dec 2022 23:57:17 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
        devicetree@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>, Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jianmin Lv <lvjianmin@loongson.cn>
Subject: Re: [PATCH V8 3/4] i2c: ls2x: Add driver for Loongson-2K/LS7A I2C
 controller
Message-ID: <Y6tqPenv3NBEl9qD@smile.fi.intel.com>
References: <cover.1671688961.git.zhoubinbin@loongson.cn>
 <9d3e4997519fd9ecebae6fd241148cc22d3fe04f.1671688961.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d3e4997519fd9ecebae6fd241148cc22d3fe04f.1671688961.git.zhoubinbin@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Dec 23, 2022 at 05:00:51PM +0800, Binbin Zhou wrote:
> This I2C module is integrated into the Loongson-2K SoCs and Loongson
> LS7A bridge chip.

...

> +static int ls2x_i2c_xfer_one(struct ls2x_i2c_priv *priv,
> +			     struct i2c_msg *msg, bool stop)
> +{
> +	int ret;
> +	bool is_read = msg->flags & I2C_M_RD;
> +
> +	/* Contains steps to send start condition and address */
> +	ret = ls2x_i2c_start(priv, msg);
> +	if (!ret) {
> +		if (is_read)
> +			ret = ls2x_i2c_rx(priv, msg->buf, msg->len);
> +		else
> +			ret = ls2x_i2c_tx(priv, msg->buf, msg->len);
> +
> +		if (!ret && stop)
> +			ret = ls2x_i2c_stop(priv);
> +	}
> +
> +	if (ret == -ENXIO)
> +		ls2x_i2c_stop(priv);
> +	else if (ret < 0)
> +		ls2x_i2c_init(priv);
> +
> +	return ret;
> +}

Still this code is odd from reader's perspective. It's in particular not clear
if the stop can be called twice in a row. I recommend to split it to two
functions and then do something like

_read_one()
{
	ret = start();
	if (ret)
		goto _stop; // Do we really need this?

		ret = rx();
		if (ret)
			goto _stop; // Do we need this?

		/* By setting this call the stop */
		if (stop)
			ret = -ENXIO;

	out_send_stop:
		if (ret == ...)
			return _stop();
		// I don't like above, so this error checking/setting parts
		// also can be rethought and refactored accordingly

		return ret;
}


	if (is_read)
		ret = _read_one();
	else
		ret = _write_one();

	if (ret)
		_init();

	return ret;


-- 
With Best Regards,
Andy Shevchenko


