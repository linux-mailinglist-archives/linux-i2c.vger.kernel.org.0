Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71808781EEA
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Aug 2023 19:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbjHTRGC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 20 Aug 2023 13:06:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbjHTRF6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 20 Aug 2023 13:05:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1E1DDB;
        Sun, 20 Aug 2023 10:01:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 87C9560A5F;
        Sun, 20 Aug 2023 17:01:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4479C433C7;
        Sun, 20 Aug 2023 17:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692550883;
        bh=GrmVmUCNHZLjAMLjKnEE1iUKm6LGfXEq1xM6/ekCLjE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eyEhTzLZC/w9QeySc9DAyHw/rlMO+Epjm5VXjxguvIL1kVrjLjq5LWbd+4ZkvuhdF
         JScrn78OBcwt38FNFHexVIDgVZORHvojH5ACXNU905mes2LfkI3ZJCE2sIgXzuVlRq
         DDIokqKKJw3hTiKmgvBxrFxJ1NPyUBIM6J1E/sUmpayL4GE0zdVKvtgY3N0fzTCCqK
         HOv/LeqnNLHAZZeLF3smn8G1lsis2xn78UXae1uaiRqrzMnfMPZAQAwphJu/yxwWUW
         PDaMZq4wQUaIadtZCySDfNXn81bzMvsbwXCwDUpNC+r5bCsvzxAm5Tk1rOdKKXu1SJ
         VdHMcRUuo8Lsw==
Date:   Sun, 20 Aug 2023 19:01:18 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Wentong Wu <wentong.wu@intel.com>
Cc:     gregkh@linuxfoundation.org, arnd@arndb.de, mka@chromium.org,
        oneukum@suse.com, lee@kernel.org, wsa@kernel.org,
        kfting@nuvoton.com, broonie@kernel.org, linus.walleij@linaro.org,
        maz@kernel.org, brgl@bgdev.pl, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        heikki.krogerus@linux.intel.com, andi.shyti@linux.intel.com,
        sakari.ailus@linux.intel.com, srinivas.pandruvada@intel.com,
        linux-drivers-review@eclists.intel.com, zhifeng.wang@intel.com
Subject: Re: [PATCH v9 2/4] i2c: Add support for Intel LJCA USB I2C driver
Message-ID: <20230820170118.vdhtror3cfizbkfh@intel.intel>
References: <1692225111-19216-1-git-send-email-wentong.wu@intel.com>
 <1692225111-19216-3-git-send-email-wentong.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1692225111-19216-3-git-send-email-wentong.wu@intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Weontong,

patch looks good, just few minor comments.

[...]

> +static u8 ljca_i2c_format_slave_addr(u8 slave_addr, u8 type)
> +{
> +	return (slave_addr << 1) | type;
> +}

this is used only once, you could eventually ger rid of it and
use explicitely in the start function.

[...]

> +static int ljca_i2c_start(struct ljca_i2c_dev *ljca_i2c, u8 slave_addr,
> +			  enum ljca_xfer_type type)
> +{
> +	struct ljca_i2c_rw_packet *w_packet =
> +			(struct ljca_i2c_rw_packet *)ljca_i2c->obuf;
> +	struct ljca_i2c_rw_packet *r_packet =
> +			(struct ljca_i2c_rw_packet *)ljca_i2c->ibuf;
> +	s16 rp_len;
> +	int ret;
> +
> +	memset(w_packet, 0, sizeof(*w_packet));

do you really need to set this to '0' as you are initializing the
header

> +	w_packet->id = ljca_i2c->i2c_info->id;
> +	w_packet->len = cpu_to_le16(sizeof(*w_packet->data));
> +	w_packet->data[0] = ljca_i2c_format_slave_addr(slave_addr, type);
> +
> +	ret = ljca_transfer(ljca_i2c->ljca, LJCA_I2C_START, w_packet,
> +			    struct_size(w_packet, data, 1), r_packet,
> +			    LJCA_I2C_BUF_SIZE);
> +	if (ret < 0)
> +		return ret;
> +	else if (ret < sizeof(*r_packet))
> +		return -EIO;
> +
> +	rp_len = le16_to_cpu(r_packet->len);
> +	if (rp_len < 0 || r_packet->id != w_packet->id) {
> +		dev_err(&ljca_i2c->adap.dev,
> +			"i2c start failed len: %d id: %d %d\n",
> +			rp_len, r_packet->id, w_packet->id);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ljca_i2c_stop(struct ljca_i2c_dev *ljca_i2c, u8 slave_addr)

the return value here is not used anywhere, what about making
this function void and printing a warning in case of failure?

[...]

> +static int ljca_i2c_probe(struct auxiliary_device *auxdev,
> +			  const struct auxiliary_device_id *aux_dev_id)
> +{

[...]

> +	ret = ljca_i2c_init(ljca_i2c, ljca_i2c->i2c_info->id);
> +	if (ret) {
> +		dev_err(&auxdev->dev, "i2c init failed id: %d\n",
> +			ljca_i2c->i2c_info->id);
> +		return -EIO;

please use dev_err_probe();

Andi
