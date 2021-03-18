Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F5AA34045C
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Mar 2021 12:16:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230397AbhCRLQJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Mar 2021 07:16:09 -0400
Received: from www.zeus03.de ([194.117.254.33]:46644 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230151AbhCRLPs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 18 Mar 2021 07:15:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=D7W2V9Us1sReimH9cESJilgZHJcv
        2HAGoAn2jgmkeIA=; b=MjTijZjmBfF/drrsGnnGWAMWFTXN/89IVdRwvNQw24CM
        L/j9YWqd7GciYnCTNt0ur6WL9Hw/YMSLztLX6SHJekfAVc7Rii+FINzMoOzu1UcI
        s9vSwsUq68X8YKk3ACVOS3rDeTeSAhJLb+grGTehseDoG2yeeBdjA5R9MSLztKk=
Received: (qmail 388438 invoked from network); 18 Mar 2021 12:15:46 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Mar 2021 12:15:46 +0100
X-UD-Smtp-Session: l3s3148p1@ScCUuM29tLwgARa4RaSzAQBVtUgvoxMO
Date:   Thu, 18 Mar 2021 12:15:46 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     syzbot+ffb0b3ffa6cfbc7d7b3f@syzkaller.appspotmail.com
Subject: Re: [PATCH] i2c: bail out early when RDWR parameters are wrong
Message-ID: <20210318111546.GL974@ninjato>
References: <20210312115734.14022-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NPWyolIJAVLYbHY6"
Content-Disposition: inline
In-Reply-To: <20210312115734.14022-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--NPWyolIJAVLYbHY6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 12, 2021 at 12:57:34PM +0100, Wolfram Sang wrote:
> The buggy parameters currently get caught later, but emit a noisy WARN.
> Userspace should not be able to trigger this, so add similar checks much
> earlier. Also avoids some unneeded code paths, of course. Apply kernel
> coding stlye to a comment while here.
>=20
> Reported-by: syzbot+ffb0b3ffa6cfbc7d7b3f@syzkaller.appspotmail.com
> Tested-by: syzbot+ffb0b3ffa6cfbc7d7b3f@syzkaller.appspotmail.com
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--NPWyolIJAVLYbHY6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBTNmIACgkQFA3kzBSg
KbZCiA//Z6gdpfX9h1AOHOe+qg3eJsFvYhLakl0YKLLKELrKATZFkITM0saHgvMz
0zYQz/2awDVhUOUIijXVRW54uHaJdRmp4lF3FoS8d1zw5FWx1t/zIBfx5YCJIV9U
bpdrAZ0u616McrWV5yxaVnaFE/qVV1BFAoTa4ga/m+aJOfpfcIm8kThPEUypIFq8
GHepWN01HfL9pok1WeErmN2cw7Qdbzqg75JZQAsvDYxMZnum7LQcwEcEelLjVg1+
wVUyCG4D8rJtD1bgRMZHHpjOReD/vCOoU5qZSAwrDVcwADUE64H+pNcd0N1+j28X
chZGHKbGe4yulX4au3hpqdPszQ2Zx4xoqje5UD2rcDUdS7hcukkr6vfEuPzRD+KS
oLhQhFbLDII/v3y5zDLAsBNd1l12XMNLMy0Ark3WF1fpv/y8AX78aLpug9S/iKow
pwjB9XbDrm5Wq9j+/O2pIlxl74ERu7naz6ZBIRiCuyhm6fj1tdUWcFbKOmyT2poj
HwH9VXQ6ETm1+d3wUd+GkqnBiDp/IueGRaSCKqWeIpnvt7byjwv7ZFVP39t41S2M
d60azNtoWLBP8xbmZJJwjn6UFFRGYjMwd11y6nC1O2HgtJi+EGQOX7iSaMyY4wkL
XSIDCEz+fcHtJaIqKF3VAWGk2mbRgdirvVo/6MNVZIjIW6Bz/VQ=
=OoJ6
-----END PGP SIGNATURE-----

--NPWyolIJAVLYbHY6--
