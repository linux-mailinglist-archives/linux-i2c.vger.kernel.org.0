Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6314A52FA6C
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 11:49:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235672AbiEUJsk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 05:48:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234199AbiEUJsi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 05:48:38 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AD588198A;
        Sat, 21 May 2022 02:48:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 419C3B81B1C;
        Sat, 21 May 2022 09:48:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCAECC385A5;
        Sat, 21 May 2022 09:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653126514;
        bh=srchwg0AIXyDnKVXefcoYDLalQsQhd+DPUVJTRX4wEU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kHYmbDAmXUqXDuLIplZTm219yE+xlDgmPXfjNN6o+nC+dQ5ecBRldxLyMhaUcXmpa
         +ZIz1I5jhPS+Ce1cVsZ3f5Th7R8vV0/3qUdqoHvEpRGASbb9W02xte9hn1KtX8iMJz
         YbdK0LD0BQQlb3lACKQduxAnMHl1WoM7BZ2F6aUt4r59+OMLUfoXF7Tx1cMpU1JCNo
         nDfmK2pDB6pPsUY3cB1jisZIcWzKkVQE7UpmhC/W3ZoEB3SuxuomHPGmWaYct2E/cp
         73ESzm5XFdkCLrKiBLgs/7l9CA0f3Qn86CYWHsVN+SFJFRcMqLv81RFmeFpM57Gh7b
         73v7XifcPTrAQ==
Date:   Sat, 21 May 2022 11:48:29 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Conor Dooley <conor.dooley@microchip.com>
Cc:     linux-i2c@vger.kernel.org, ben.dooks@codethink.co.uk,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        daire.mcnamara@microchip.com
Subject: Re: [PATCH v3] i2c: add support for microchip fpga i2c controllers
Message-ID: <Yoi1bV95l7+thgS5@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        linux-i2c@vger.kernel.org, ben.dooks@codethink.co.uk,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        daire.mcnamara@microchip.com
References: <20220516073331.3508505-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4/1BQIBLBjjxvj+u"
Content-Disposition: inline
In-Reply-To: <20220516073331.3508505-1-conor.dooley@microchip.com>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4/1BQIBLBjjxvj+u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Conor,

driver looks mostly good, but some comments:

> +/*
> + * mchp_corei2c_dev - I2C device context
> + * @base: pointer to register struct
> + * @msg: pointer to current message
> + * @msg_len: number of bytes transferred in msg
> + * @msg_err: error code for completed message
> + * @msg_complete: xfer completion object
> + * @dev: device reference
> + * @adapter: core i2c abstraction
> + * @i2c_clk: clock reference for i2c input clock
> + * @bus_clk_rate: current i2c bus clock rate
> + * @buf: ptr to msg buffer for easier use.
> + * @isr_status: cached copy of local ISR status.
> + * @lock: spinlock for IRQ synchronization.
> + */

This seems outdated, e.g. msg is not in the struct but addr is missing.
Also, proper kdoc header is missing?

> +struct mchp_corei2c_dev {
> +	void __iomem *base;
> +	size_t msg_len;

Maybe u16 to match the original type from struct i2c_msg?

> +	int msg_err;
> +	struct completion msg_complete;
> +	struct device *dev;
> +	struct i2c_adapter adapter;
> +	struct clk *i2c_clk;
> +	spinlock_t lock; /* IRQ synchronization */
> +	u32 bus_clk_rate;
> +	u32 msg_read;

This is initialized but never used?

> +	u32 isr_status;
> +	u8 *buf;
> +	u8 addr;
> +};
> +

...

> +static int mchp_corei2c_init(struct mchp_corei2c_dev *idev)
> +{
> +	u32 clk_rate = clk_get_rate(idev->i2c_clk);
> +	u32 divisor = clk_rate / idev->bus_clk_rate;

I don't see a protection against division by zero?

> +	int ret;
> +
> +	ret = mchp_corei2c_set_divisor(divisor, idev);
> +	if (ret)
> +		return ret;
> +
> +	mchp_corei2c_reset(idev);
> +
> +	return 0;
> +}
> +
> +static void mchp_corei2c_transfer(struct mchp_corei2c_dev *idev, u32 data)
> +{
> +	if (idev->msg_len > 0)
> +		writeb(data, idev->base + CORE_I2C_DATA);
> +}

Minor: this is very finegrained and only called once. I'd put it into
the calling function.

...

> +static irqreturn_t mchp_corei2c_handle_isr(struct mchp_corei2c_dev *idev)
> +{
> +	u32 status = idev->isr_status;
> +	u8 ctrl;
> +
> +	if (!idev->buf)
> +		return IRQ_NONE;
> +
> +	switch (status) {
> +	case STATUS_M_START_SENT:
> +	case STATUS_M_REPEATED_START_SENT:
> +		ctrl = readb(idev->base + CORE_I2C_CTRL);
> +		ctrl &= ~CTRL_STA;
> +		writeb(idev->addr, idev->base + CORE_I2C_DATA);
> +		writeb(ctrl, idev->base + CORE_I2C_CTRL);
> +		if (idev->msg_len <= 0)

msg_len is unsigned, can't be < 0?

> +			goto finished;
> +		break;
> +	case STATUS_M_ARB_LOST:
> +		idev->msg_err = -EAGAIN;
> +		goto finished;
> +	case STATUS_M_SLAW_ACK:
> +	case STATUS_M_TX_DATA_ACK:
> +		if (idev->msg_len > 0)
> +			mchp_corei2c_fill_tx(idev);
> +		else
> +			goto last_byte;

IMO this is a bit too much of goto here. Can't we have a flag for
last_byte and handle it at the end of the handler?

> +		break;
> +	case STATUS_M_TX_DATA_NACK:
> +	case STATUS_M_SLAR_NACK:
> +	case STATUS_M_SLAW_NACK:
> +		idev->msg_err = -ENXIO;
> +		goto last_byte;
> +	case STATUS_M_SLAR_ACK:
> +		ctrl = readb(idev->base + CORE_I2C_CTRL);
> +		if (idev->msg_len == 1u) {
> +			ctrl &= ~CTRL_AA;
> +			writeb(ctrl, idev->base + CORE_I2C_CTRL);
> +		} else {
> +			ctrl |= CTRL_AA;
> +			writeb(ctrl, idev->base + CORE_I2C_CTRL);
> +		}
> +		if (idev->msg_len < 1u)
> +			goto last_byte;
> +		break;
> +	case STATUS_M_RX_DATA_ACKED:
> +		mchp_corei2c_empty_rx(idev);
> +		break;
> +	case STATUS_M_RX_DATA_NACKED:
> +		mchp_corei2c_empty_rx(idev);
> +		if (idev->msg_len == 0)
> +			goto last_byte;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return IRQ_HANDLED;
> +
> +last_byte:
> +	/* On the last byte to be transmitted, send STOP */
> +	mchp_corei2c_stop(idev);
> +finished:
> +	complete(&idev->msg_complete);
> +	return IRQ_HANDLED;
> +}

...

> +
> +static int mchp_corei2c_xfer_msg(struct mchp_corei2c_dev *idev,
> +				 struct i2c_msg *msg)
> +{
> +	u8 ctrl;
> +	unsigned long time_left;
> +
> +	if (msg->len == 0)
> +		return -EINVAL;

If your hardware cannot do zero length messages, you need to set up an
i2c_adapter_quirk struct with I2C_AQ_NO_ZERO_LEN.

> +
> +	idev->addr = i2c_8bit_addr_from_msg(msg);
> +	idev->msg_len = msg->len;
> +	idev->buf = msg->buf;
> +	idev->msg_err = 0;
> +	idev->msg_read = (msg->flags & I2C_M_RD);
> +
> +	reinit_completion(&idev->msg_complete);
> +
> +	mchp_corei2c_core_enable(idev);
> +
> +	ctrl = readb(idev->base + CORE_I2C_CTRL);
> +	ctrl |= CTRL_STA;
> +	writeb(ctrl, idev->base + CORE_I2C_CTRL);
> +
> +	time_left = wait_for_completion_timeout(&idev->msg_complete,
> +						MICROCHIP_I2C_TIMEOUT);

You should use adapter.timeout here, so it can be changed from
userspace.

> +	if (!time_left)
> +		return -ETIMEDOUT;
> +
> +	return idev->msg_err;
> +}
> +
> +static int mchp_corei2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
> +			     int num)
> +{
> +	struct mchp_corei2c_dev *idev = i2c_get_adapdata(adap);
> +	int i, ret;
> +
> +	for (i = 0; i < num; i++) {
> +		ret = mchp_corei2c_xfer_msg(idev, msgs++);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return num;
> +}
> +
> +static u32 mchp_corei2c_func(struct i2c_adapter *adap)
> +{
> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> +}

If you can't handle zero length messages, you need to mask
I2C_FUNC_SMBUS_QUICK out.

> +
> +static const struct i2c_algorithm mchp_corei2c_algo = {
> +	.master_xfer = mchp_corei2c_xfer,
> +	.functionality = mchp_corei2c_func,
> +};
> +
> +static int mchp_corei2c_probe(struct platform_device *pdev)
> +{
> +	struct mchp_corei2c_dev *idev = NULL;

Unneeded initialization.

> +	struct resource *res;
> +	int irq, ret;
> +	u32 val;
> +
> +	idev = devm_kzalloc(&pdev->dev, sizeof(*idev), GFP_KERNEL);
> +	if (!idev)
> +		return -ENOMEM;
> +
> +	idev->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(idev->base))
> +		return PTR_ERR(idev->base);
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return dev_err_probe(&pdev->dev, irq,
> +				     "missing interrupt resource\n");
> +
> +	idev->i2c_clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(idev->i2c_clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(idev->i2c_clk),
> +				     "missing clock\n");
> +
> +	idev->dev = &pdev->dev;
> +	init_completion(&idev->msg_complete);
> +	spin_lock_init(&idev->lock);
> +
> +	val = device_property_read_u32(idev->dev, "clock-frequency",
> +				       &idev->bus_clk_rate);

This functions returns an int. So, 'ret' please which is also more
readable.

> +	if (val) {

I think the missing check against 'division by zero' should go here.

> +		dev_info(&pdev->dev, "default to 100kHz\n");
> +		idev->bus_clk_rate = 100000;
> +	}
> +
> +	if (idev->bus_clk_rate > 400000)
> +		return dev_err_probe(&pdev->dev, -EINVAL,
> +				     "clock-frequency too high: %d\n",
> +				     idev->bus_clk_rate);
> +
> +	ret = devm_request_irq(&pdev->dev, irq, mchp_corei2c_isr, IRQF_SHARED,
> +			       pdev->name, idev);

Really SHARED?

> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to claim irq %d\n", irq);
> +
> +	ret = clk_prepare_enable(idev->i2c_clk);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to enable clock\n");
> +
> +	ret = mchp_corei2c_init(idev);
> +	if (ret) {
> +		clk_disable_unprepare(idev->i2c_clk);
> +		return dev_err_probe(&pdev->dev, ret, "failed to program clock divider\n");
> +	}
> +
> +	i2c_set_adapdata(&idev->adapter, idev);
> +	snprintf(idev->adapter.name, sizeof(idev->adapter.name),
> +		 "Microchip I2C hw bus");

Most people add something like the base address here to distinguish
multiple instances.

> +	idev->adapter.owner = THIS_MODULE;
> +	idev->adapter.algo = &mchp_corei2c_algo;
> +	idev->adapter.dev.parent = &pdev->dev;
> +	idev->adapter.dev.of_node = pdev->dev.of_node;
> +
> +	platform_set_drvdata(pdev, idev);
> +
> +	ret = i2c_add_adapter(&idev->adapter);
> +	if (ret) {
> +		clk_disable_unprepare(idev->i2c_clk);
> +		return ret;
> +	}
> +
> +	dev_info(&pdev->dev, "Microchip I2C Probe Complete\n");
> +
> +	return 0;
> +}

Rest looks good, Thank you for the submission.

All the best,

   Wolfram


--4/1BQIBLBjjxvj+u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKItWoACgkQFA3kzBSg
KbZO8xAAtYMhV/kN9jcoPj0n0ikzTYPqhObXRqnQmf0BXVn1sIpBI19MgNkfE9Xz
vrRLFWI6eD72TZ8ZA2OuHP8HuBt63QqRIc7jBestGrRfR+TApZUaC+PvLS38pj/O
iahcaXwcw7QIpvshr5O6k3sJXqBdQGjcMQS5Jxr2gmEj5UrE56YEOwGCrMtwjuws
SBzExhStfgV/2GDqdY/erGgCPrmQ3KRI0noDXKqzTaWpHfBOWZBkQFHJvuVDuBFc
4UM+rSo/kN4wJWd5um5UGDBG768T+0quVpnhYtlafKTI5iGkGlmtxQQKPCvd3D/V
Rx9rib3a+Lwh0tLRsNerldRn/Cy/n5vHR+MNngoFraLL6aGwTEkFmi85GuWBIdlf
TccFOzLKBfgzh6rViOJ/enhrUWGwHYh9rM03PbVwmhogSasVNI+WbJTMff3N6zkJ
VyI0nm9Q3hHeXtGx05kfFhvZ+YuBcklOa8c3ZTqdHiyEIc5upnNJGtds0OD0uTU4
+GKCob7a2EieMXSesKEIvEKcAPfFmJ6lJ8ygM2FraeQplQxKNN1wO42JXZiaRkvI
BmUGdI7gtfzycw1PaUaiJX1ZXOb0WfN//jlzEnuxO2j0dPlo6DP8h8PNwe6os71I
B81J0kEI2rX+O/g3tVCrv8Ls0+xywjswsvL8FaTzmWsUJMjSYcg=
=tYE4
-----END PGP SIGNATURE-----

--4/1BQIBLBjjxvj+u--
