Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C306A3B7061
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jun 2021 12:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232788AbhF2KKB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Jun 2021 06:10:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:47730 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232420AbhF2KKA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 29 Jun 2021 06:10:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7FD2261DC6;
        Tue, 29 Jun 2021 10:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624961253;
        bh=hBu3TVaxzr1OtOhEnLxnl/WDurfyVHcGEvbTE8Q+8sU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EQ6BA91R2vkfMyzmH75oYpQiRJ6xssmL9TEr7h/QoD44bLDhEGwcpL2hUh/OixVPr
         LCKQupp86LtLLFrX/gTfY8bLKZFK9HWk6ntodrCUJPRoefq2w4TfrvP/DdBu3cQ7Vk
         UT8fb4GH2k5p1P8v/8ApyuWcstSsUFfwKLyhUdCb4Dfmg5BnCdkpoVPr8G9aUPRa+m
         jggs1h0FVCERNDPMnt611/zv/v8JAPI1qZ73z+lP3AncLhQySd4hwu3e1e4hI2T4Io
         MaqmjhXr3paNd0HOA2RqpO6oWsWZ5A2BOQzxjxA8ZU3P80a1Cth2namVh9GxXRRFrX
         6umqxi8ikU1IA==
Date:   Tue, 29 Jun 2021 12:07:30 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jie Deng <jie.deng@intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, jasowang@redhat.com,
        andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
        arnd@arndb.de, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com, Sergey.Semin@baikalelectronics.ru,
        rppt@kernel.org, loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com, viresh.kumar@linaro.org,
        stefanha@redhat.com, pbonzini@redhat.com
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <YNrw4rxihFLuqLtY@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jie Deng <jie.deng@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, jasowang@redhat.com,
        andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
        arnd@arndb.de, kblaiech@mellanox.com, jarkko.nikula@linux.intel.com,
        Sergey.Semin@baikalelectronics.ru, rppt@kernel.org,
        loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com, viresh.kumar@linaro.org,
        stefanha@redhat.com, pbonzini@redhat.com
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="A4hLuA+K1dh/nKMu"
Content-Disposition: inline
In-Reply-To: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--A4hLuA+K1dh/nKMu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

so some minor comments left:

> +		if (!msgs[i].len)
> +			break;

I hope this can extended in the future to allow zero-length messages. If
this is impossible we need to set an adapter quirk instead.

> +		err = virtqueue_add_sgs(vq, sgs, outcnt, incnt, &reqs[i], GFP_KERNEL);
> +		if (err < 0) {
> +			pr_err("failed to add msg[%d] to virtqueue.\n", i);

Is it really helpful for the user to know that msg5 failed? We don't
even say which transfer.

> +static u32 virtio_i2c_func(struct i2c_adapter *adap)
> +{
> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;

You are not emulating I2C_FUNC_SMBUS_QUICK, so you need to mask it out.

> +	snprintf(vi->adap.name, sizeof(vi->adap.name), "Virtio I2C Adapter");

Is there something to add so you can distinguish multiple instances?
Most people want that.

> +	vi->adap.class = I2C_CLASS_DEPRECATED;
> +	vi->adap.algo = &virtio_algorithm;
> +	vi->adap.dev.parent = &vdev->dev;
> +	vi->adap.timeout = HZ / 10;

Why so short? HZ is the kinda default value.

> +	i2c_set_adapdata(&vi->adap, vi);
> +
> +	/* Setup ACPI node for controlled devices which will be probed through ACPI */
> +	ACPI_COMPANION_SET(&vi->adap.dev, ACPI_COMPANION(pdev));
> +
> +	ret = i2c_add_adapter(&vi->adap);
> +	if (ret) {
> +		virtio_i2c_del_vqs(vdev);
> +		dev_err(&vdev->dev, "failed to add virtio-i2c adapter.\n");

Won't the driver core print that for us?

> +	}
> +
> +	return ret;
> +}
> +

> +/* The bit 0 of the @virtio_i2c_out_hdr.@flags, used to group the requests */
> +#define VIRTIO_I2C_FLAGS_FAIL_NEXT	0x00000001

BIT(0)?

Happy hacking,

   Wolfram


--A4hLuA+K1dh/nKMu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDa8N0ACgkQFA3kzBSg
KbbPvhAAk6mml6Q2KA+40wjOlgNPqkMUfubuHQg71AwGqTWjPvqGe2UEUrcCptxl
6AASCDXIOrbWpeYVxhCVBgMCM7T1mqqO9Q3jzc8bwiJFw4m3m6uMPyjdrYe9STX0
p2ksFX3jD9lBddRBwL7oM0bZSayceBuDnxQ8xvJPTI3PyVsnPVirqTv5rIAiDmuV
X2H+k5uAuDThsUM8fTioKZoYeAmO+3RccULlbjey1ML1+vBNT7LmWOhprJLL3S4W
JpGaqPKS2kCGEt2LFls3GYeG6QcXyj4l9qwoJxgWrVVY71Ky+7cbwc+nVb28EpAc
d1Mo0ObhN1NuLzRTrpCrCO0k+Pi5SGhDZTwv5LQOmEY0KFaowaKCw9gevi3j0p/t
Tf0FetbAIk7N8k4GOzk8HhXVEOV20y3zLUp4OLytn9ueQcrCOqkvnUPWpRxxsHid
/1ZRcC1l87rPtQqTX1tGFSGJvHvj3uOHwLo6Wjp/2pxYmjvEgUdajdQGSfBNEtXP
JwuUpybOFBqZ5tDv91zGKnQeYZ+MD6/i5hQFeig/TSugL10hGiDtsUmpG0ennXND
okhQjIpN35kWXWzEGAGWYzHL6SAT0fXoXvk4wYQTQYbvvW/wi7S5a1ob9HEzJV5X
r7sfPKN86zwtRjMZ24A9nXNQ6iebZhEK3/QFRC2rdjFv76Kj+XI=
=Fg/m
-----END PGP SIGNATURE-----

--A4hLuA+K1dh/nKMu--
