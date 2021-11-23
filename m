Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50A12459F8C
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Nov 2021 10:52:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234440AbhKWJzR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Nov 2021 04:55:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:35002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234758AbhKWJzR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Nov 2021 04:55:17 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A2EE56102A;
        Tue, 23 Nov 2021 09:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637661129;
        bh=nXeQK+wC/HgwikMQdv5QEf2PMdDVm3vELzc76arqpeg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mUSpDOCuC2w/5yiHWQrGCYbkeXPUzSZcAu5FrFvXVGh2rZqi5xGN4coPIydZarxIP
         pUj+33dEjs942yRjSMS+nMEw/y0x9HBHNaTTQK8nyPxsEyaxSQcOzpXvFndccvKKp7
         Jjyff7gR0BdiEMGEmi8uku60QnOCuJg9fI5eRQFRGEJhVYE1ujg/dKucIpTH6c1WT8
         3FktLQH7ckWXadfuKIks9Sq6Hp7FvQTcspA6XoC6DmN4OBGv3AG3ILoECIhheVkxqf
         axAYrJKIrJMBtTdbw0bbdjXfOFTII7FeY3f8/HBBASE3YBCEwa/cUnpwpxiayC09hX
         5wy2mJgFh/HhA==
Date:   Tue, 23 Nov 2021 10:52:05 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc:     jie.deng@intel.com, viresh.kumar@linaro.org,
        conghui.chen@intel.com, mst@redhat.com,
        virtualization@lists.linux-foundation.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com
Subject: Re: [PATCH v2 1/2] i2c: virtio: disable timeout handling
Message-ID: <YZy5xVU4XHEaz+EL@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        jie.deng@intel.com, viresh.kumar@linaro.org, conghui.chen@intel.com,
        mst@redhat.com, virtualization@lists.linux-foundation.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com
References: <20211111160412.11980-1-vincent.whitchurch@axis.com>
 <20211111160412.11980-2-vincent.whitchurch@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uPPPiBj2NEws3UnS"
Content-Disposition: inline
In-Reply-To: <20211111160412.11980-2-vincent.whitchurch@axis.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--uPPPiBj2NEws3UnS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 11, 2021 at 05:04:11PM +0100, Vincent Whitchurch wrote:
> If a timeout is hit, it can result is incorrect data on the I2C bus
> and/or memory corruptions in the guest since the device can still be
> operating on the buffers it was given while the guest has freed them.
>=20
> Here is, for example, the start of a slub_debug splat which was
> triggered on the next transfer after one transfer was forced to timeout
> by setting a breakpoint in the backend (rust-vmm/vhost-device):
>=20
>  BUG kmalloc-1k (Not tainted): Poison overwritten
>  First byte 0x1 instead of 0x6b
>  Allocated in virtio_i2c_xfer+0x65/0x35c age=3D350 cpu=3D0 pid=3D29
>  	__kmalloc+0xc2/0x1c9
>  	virtio_i2c_xfer+0x65/0x35c
>  	__i2c_transfer+0x429/0x57d
>  	i2c_transfer+0x115/0x134
>  	i2cdev_ioctl_rdwr+0x16a/0x1de
>  	i2cdev_ioctl+0x247/0x2ed
>  	vfs_ioctl+0x21/0x30
>  	sys_ioctl+0xb18/0xb41
>  Freed in virtio_i2c_xfer+0x32e/0x35c age=3D244 cpu=3D0 pid=3D29
>  	kfree+0x1bd/0x1cc
>  	virtio_i2c_xfer+0x32e/0x35c
>  	__i2c_transfer+0x429/0x57d
>  	i2c_transfer+0x115/0x134
>  	i2cdev_ioctl_rdwr+0x16a/0x1de
>  	i2cdev_ioctl+0x247/0x2ed
>  	vfs_ioctl+0x21/0x30
>  	sys_ioctl+0xb18/0xb41
>=20
> There is no simple fix for this (the driver would have to always create
> bounce buffers and hold on to them until the device eventually returns
> the buffers), so just disable the timeout support for now.
>=20
> Fixes: 3cfc88380413d20f ("i2c: virtio: add a virtio i2c frontend driver")
> Acked-by: Jie Deng <jie.deng@intel.com>
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>

Applied to for-current, thanks!


--uPPPiBj2NEws3UnS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGcucUACgkQFA3kzBSg
Kbb2ShAAjJSfBop5u5IE7Y1iepi4GqCUPvUED8hSMq1i7Zx1AY9ap7plaz3A3seK
ud7DY1GgNin9+kQZaWvIBMAakP74PwsHVLOn+IkRpJLkA6IEfCQGCFnpQ6q7xzjp
0SZ3rSesp4MSih3/tbDixJPgejcUxEYg2aDskYFRGL2asYx6bUuCQXenFOsWl4N9
8/A4I9q5AM2R/dCqrYp5W056wEV4Xhf+6LzkND8ys/cx2uX+K9v2xHDqDrRk2Bkr
spDxOUJjrp3M5RLcqmkZNvB6fz3Wu4VrNp2FzFp+ULnD5I0EZeUCCEI2DeVCNbud
1AWDGVLBMVoLeRRcN3YrKCV+9T6yN5YapRwuQwWAz5h4kE1mcALfkrgZ75sMUaVF
xEZWi24JR2uIt/WcWhpJrgGutlC5daE0pX/NSGMnsf2wBZUbDShqdSeYkyPAx6hI
0oE8/jbGPr7qFzOsN1HhHL94u/7gW9eoAaZv61RXVIIvQxAh7jkg911EAZUoAwJJ
8eqqTMMQtHRCqWclPdrqoCzm8Iqy8NVtTgWLf/9bKQVbv6SjXtK3qSlaFx+kCNpk
gXNzRXpRSNKW17NdngWqbHh6gPy6gv7VGaWDbCDBcDhQVHj4iUhEAJMsQRBrx6Z1
ZUl4rZ8H3lg4PmGM2DWyYzGmGe7OlMGNpeuVpz7jh0F4TcFpwuc=
=K0uF
-----END PGP SIGNATURE-----

--uPPPiBj2NEws3UnS--
