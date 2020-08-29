Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1729D2568C5
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Aug 2020 17:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728375AbgH2PnA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Aug 2020 11:43:00 -0400
Received: from www.zeus03.de ([194.117.254.33]:50444 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728310AbgH2Pmp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 29 Aug 2020 11:42:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=QRt6dEaMbGnJ0I0zwqHmdWo/bsdV
        fejP/Z/SxqeD6HI=; b=cX+OA6xd/0aJcVe3m8fWvRSz8tP+JVWEo252DAevO5d4
        mlv/bVdvbBLM8acW9JHFNezKnqRwq4nmxx99e8WfP7v7mL/2klhCz8sOSJK2G5UN
        q77Qp53kbC1w25ECg2+9dkN2bPaxDGCPCbOu6R5HnkLDnQ19Z2/+9VABzAiFXKE=
Received: (qmail 1579558 invoked from network); 29 Aug 2020 17:41:44 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Aug 2020 17:41:44 +0200
X-UD-Smtp-Session: l3s3148p1@ji2uAQauoNMgAwDPXyCvAPl6zFnMyE11
Date:   Sat, 29 Aug 2020 17:41:40 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Daniel Stodden <daniel.stodden@gmail.com>,
        Jean Delvare <jdelvare@suse.de>
Subject: Re: [RFC PATCH i2c-tools] tools: i2ctransfer: add check for returned
 length from driver
Message-ID: <20200829154140.GA4665@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org,
        Daniel Stodden <daniel.stodden@gmail.com>,
        Jean Delvare <jdelvare@suse.de>
References: <20200806145658.1476-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Content-Disposition: inline
In-Reply-To: <20200806145658.1476-1-wsa+renesas@sang-engineering.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 06, 2020 at 04:56:58PM +0200, Wolfram Sang wrote:
> Emit a warning if the bus master driver in the kernel did not set the
> message length correctly with I2C_M_RECV_LEN. This can be determined
> from the returned value in the buffer.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied.


--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9KdzAACgkQFA3kzBSg
KbZLQQ/9FtJnJtg3assKr4pTQJFMiiYjqpsxZX69XkH/e24B5r8C1D0XmkbcJo3z
TjsBMUM/EDcnmG1QySk+2wQXC3m4HvDC6PhJHgF+LAa/GrlH9YU8y2hzR8oBp7xw
BXmitxbT9EUDfi8xeHYDnRXPAqsJJse3w1irC2j9qwlwxWRWWN4HktIydFY+3kVo
c08zAevIFv4jM+gbYkSvlZlM6KhNd+GDe1jaqjxcnhmflQiEBkOob4kLZF8eb8tx
oAhZwOJ9tqRtYn1s5Fgu9Vxs0N8eYMEU12F8+7LrzMlcza2pnMsKRhFmyVc8rSHc
7lOa77a5rJK/n9xiG7JuPc0iciDY8smqFhLGDOwb1B4CeswHKpY2DKLY0MoS7GGv
CCkdkkt916IPGMWtsWO0GnFH412G8/YzNAanujXXI+zmGWRauOPuXbCr90jcTMyF
wwO+CcqWEiUS3HPDlEt8+5qOiAP+UM/dEKb1WrI/49IWIWgFSGA/4AdCyMujfx4i
PdJ4dhc2n9t24zH/2sjxn+awdRf2z5t5ZeDl0japfW2RvE5Lml1/lBJegwac/zfs
swYE6VHkbYwwCw4Y0Fvb4w02ZJh7EejAF66SK5DST/6cqFH+iFFg8pkF/Zg6h3F/
zpbs8na+0NgOB6ObkoMf6vCQVqbTdqigpOphdqmuXgCCjfpPU1c=
=Y0sM
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--
