Return-Path: <linux-i2c+bounces-6859-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A238997C0D4
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 22:36:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4BD0BB21F7A
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 20:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 636741CB526;
	Wed, 18 Sep 2024 20:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ipDVaOhL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159681CB518;
	Wed, 18 Sep 2024 20:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726691782; cv=none; b=M3vPYL6VJybRYdWgwnmvKt7C2nL65j12OdargIo12mMi89vqM8CK2v90Hpkyf4P5cSom/LdA7WB/jJXj1S4hPk+vLyPuSKgSNXQCkyhDFTflGxSf+C0W5o3L5F++jR8KLiytmN39narwEtoYg3NMjNVND18p7j+fwX9WJn15u8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726691782; c=relaxed/simple;
	bh=EgCYCV4YQKaoczQpbXvAZ23VpQV+ciVf9YulnDCegFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rMe8RFszAu+QH6/W1UOjhDRsVJ+94IhH8BxChR47NT20IDaTwvov//ZAdERQUDpFxqKrmPaZKt/P2xHAu/z+R3u7zKxKQOHZ/qqE3qcPr5xrAl9uov1ZhsFrScLG6ghBqXsGjYsMTQ/VwHEgcVl3pf9bFnYIPaWP73twvBCUS8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ipDVaOhL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E85D8C4AF0B;
	Wed, 18 Sep 2024 20:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726691781;
	bh=EgCYCV4YQKaoczQpbXvAZ23VpQV+ciVf9YulnDCegFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ipDVaOhLfHJH+tCs1g83lZyNFgv04+MPQxEhF/JIvyyl80DIwxSnuDB+et1VhbThl
	 BmRkRDgVrV32hbNvVJq6PUWPZDN8gWfBzEwg+KpfOUgT3/t6LQaT7uE8qmb1k1ca4D
	 r3AYxI4g59Bm8vFiI+voehfZs2a9rQV+kauKAA3yN8sj/L6s+zFMDdcfZzTJBVWMuT
	 M4NfepkIkMBwalwzZ5dV0KoBusbtqxMPttwYbdRd64Ngim7UrTp/upv0plDwV+6MHL
	 /VPClCjTwq7CJWC9YhngfiXETilDVSn2Q9qwMUtMr3woRIL7I0QUfSI2Q5n7OEMrno
	 TmPN5w2u217Lg==
Date: Wed, 18 Sep 2024 22:36:17 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	tsbogend@alpha.franken.de, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 5/5] i2c: rtl9300: Add multiplexing support
Message-ID: <2wmlmymzxhf7ytpngbqgubka43rd4ytiwcffvwgaaf6gubvenz@w5gwxarev3r6>
References: <20240917232932.3641992-1-chris.packham@alliedtelesis.co.nz>
 <20240917232932.3641992-6-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917232932.3641992-6-chris.packham@alliedtelesis.co.nz>

Hi Chris,

...

> -module_platform_driver(rtl9300_i2c_driver);
> +static int rtl9300_i2c_select_chan(struct i2c_mux_core *muxc, u32 chan)
> +{
> +	struct i2c_adapter *adap = muxc->parent;
> +	struct rtl9300_i2c *i2c = i2c_get_adapdata(adap);
> +	int ret;
> +
> +	ret = rtl9300_i2c_config_io(i2c, chan);
> +	if (ret)
> +		return ret;
> +
> +	return 0;

return "rtl9300_i2c_config_io()"?

> +}

...

> +static int rtl9300_i2c_mux_probe_fw(struct rtl9300_i2c_chan *mux, struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct fwnode_handle *fwnode = dev_fwnode(dev);
> +	struct device_node *np = dev->of_node;
> +	struct device_node *adap_np;
> +	struct i2c_adapter *adap = NULL;
> +	struct fwnode_handle *child;
> +	unsigned int *chans;
> +	int i = 0;
> +
> +	if (!is_of_node(fwnode))
> +		return -EOPNOTSUPP;
> +
> +	if (!np)
> +		return -ENODEV;
> +
> +	adap_np = of_parse_phandle(np, "i2c-parent", 0);
> +	if (!adap_np) {
> +		dev_err(&pdev->dev, "Cannot parse i2c-parent\n");
> +		return -ENODEV;

return dev_err_probe(...)?

> +	}
> +	adap = of_find_i2c_adapter_by_node(adap_np);
> +	of_node_put(adap_np);

...

> +static int __init rtl9300_i2c_init(void)
> +{
> +	return platform_register_drivers(drivers, ARRAY_SIZE(drivers));
> +}
> +module_init(rtl9300_i2c_init);
> +
> +static void __exit rtl9300_i2c_exit(void)
> +{
> +	platform_unregister_drivers(drivers, ARRAY_SIZE(drivers));
> +}
> +module_exit(rtl9300_i2c_exit);

You could use module_platform_driver()

Thanks,
Andi

>  
>  MODULE_DESCRIPTION("RTL9300 I2C controller driver");
>  MODULE_LICENSE("GPL");
> -- 
> 2.46.1
> 

