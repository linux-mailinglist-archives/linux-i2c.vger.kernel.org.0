Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB87746E49D
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 09:51:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232838AbhLIIys (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 03:54:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232177AbhLIIyr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Dec 2021 03:54:47 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F36EBC061746;
        Thu,  9 Dec 2021 00:51:13 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 85C74B82361;
        Thu,  9 Dec 2021 08:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C8A3C004DD;
        Thu,  9 Dec 2021 08:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639039871;
        bh=PFw5JNdpaWY2OuAZ+jMV5B80awe6cfgQIRBi4sl+9qA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cvZfnHgDKCiu3OO4yMcS4Pkp8vqz+JkE8XRat3X7OQN6Ah+KWucrqhkRbqbBpYNCM
         enrcJME30V+lnDoF7fTJVqfunoRhCavie2MKnnnoXEuieXqNcuTnJ338HN+Jz/f+0m
         7hPC9nhx3r9XZAuxcGZ+bkMYi5A+oxtyORhpKWsNM07ObAtcMWwoUjnvsrXHc8NPtQ
         8/BmYB3Z8BbR818mJhIER1m8c4cE+TvdpY+6qe1ZhcIF0jXdl3oZRo0Ba2ZPZiiz52
         iScZFVXxQFC/4mN3FX8kmJ5rvXxuatvLeuQb0bz6731gYUBxb28ByhZvTAcMHx89Yz
         LADhKNF/PPokw==
Date:   Thu, 9 Dec 2021 09:51:07 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc:     Conghui Chen <conghui.chen@intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>, kernel@axis.com,
        Jie Deng <jie.deng@intel.com>,
        "Michael S. Tsirkin" <mst@redhat.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: virtio: fix completion handling
Message-ID: <YbHDe+YLH+NZkrC0@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        Conghui Chen <conghui.chen@intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>, kernel@axis.com,
        Jie Deng <jie.deng@intel.com>,
        "Michael S. Tsirkin" <mst@redhat.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20211202153215.31796-1-vincent.whitchurch@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ge0jWUKZVg17/s2k"
Content-Disposition: inline
In-Reply-To: <20211202153215.31796-1-vincent.whitchurch@axis.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ge0jWUKZVg17/s2k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 02, 2021 at 04:32:14PM +0100, Vincent Whitchurch wrote:
> The driver currently assumes that the notify callback is only received
> when the device is done with all the queued buffers.
>=20
> However, this is not true, since the notify callback could be called
> without any of the queued buffers being completed (for example, with
> virtio-pci and shared interrupts) or with only some of the buffers being
> completed (since the driver makes them available to the device in
> multiple separate virtqueue_add_sgs() calls).
>=20
> This can lead to incorrect data on the I2C bus or memory corruption in
> the guest if the device operates on buffers which are have been freed by
> the driver.  (The WARN_ON in the driver is also triggered.)
>=20
>  BUG kmalloc-128 (Tainted: G        W        ): Poison overwritten
>  First byte 0x0 instead of 0x6b
>  Allocated in i2cdev_ioctl_rdwr+0x9d/0x1de age=3D243 cpu=3D0 pid=3D28
>  	memdup_user+0x2e/0xbd
>  	i2cdev_ioctl_rdwr+0x9d/0x1de
>  	i2cdev_ioctl+0x247/0x2ed
>  	vfs_ioctl+0x21/0x30
>  	sys_ioctl+0xb18/0xb41
>  Freed in i2cdev_ioctl_rdwr+0x1bb/0x1de age=3D68 cpu=3D0 pid=3D28
>  	kfree+0x1bd/0x1cc
>  	i2cdev_ioctl_rdwr+0x1bb/0x1de
>  	i2cdev_ioctl+0x247/0x2ed
>  	vfs_ioctl+0x21/0x30
>  	sys_ioctl+0xb18/0xb41
>=20
> Fix this by calling virtio_get_buf() from the notify handler like other
> virtio drivers and by actually waiting for all the buffers to be
> completed.
>=20
> Fixes: 3cfc88380413d20f ("i2c: virtio: add a virtio i2c frontend driver")
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>

Applied to for-current, thanks!


--ge0jWUKZVg17/s2k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGxw3sACgkQFA3kzBSg
KbZ56Q//SQjmtTthjdX/3a2BmHjSwbNESk51bmpkZ9Hyfy+niTnbTYs8EK9ED0jq
T4Z/al1dGBVnqnfs9m28ZNv6YuoxMqBlPfXWFQcpuCbVTMvcgYGW5MR1kYv0txbu
GM/pTQYmdIS6sTawSfHwyHKl5oAKgFWaTL3j1soih6aeyZ4ha6cfoL8dlt62hwmR
LzSsMzuocxUws0TBZpaGkzMFsd5eFC7+wgQBpn3/rUxCp3j2IqBc5IS/QF8A8Lft
0VxOudfwAFdY/hplnYEV3pObTyyAl5Y/8zAGMUF3l19MhLPjT0g5S0yNJCq2o/m/
yVUqmDg4Il1kjQolTANxLEnlDdbtePPKGwPbY1ldhj2Ry18QXFzmsfZqQB8xwG9I
YrxMI9oh3chLtqfgyWofYOkHGFMmYvhSO8yFOHT02jsU47k4My0eoOS2i4KyIjfM
L2Ifug4+x6DdgdAHd3ygdEWfEpi6/5ozGFn4WO6uQS7vnIMtDPjZDABUnwra1guF
twolE4AADmKiDg+n5AKnY2lQ+Z1eJf46H4QzHK0bmhWJHoF7NiXRu65ynZug+m5x
XpfBzx3hiuSB1ZdWEzeTgxdWnDgZ8fwsDfVlxWMmzpRVC6sdSDLtG841gWgPVlWS
hP1cWvVUhsa9/sEmI/iZpUA+FntKNiSuJFR7Xlq/kG1/Jig68qA=
=pFLx
-----END PGP SIGNATURE-----

--ge0jWUKZVg17/s2k--
