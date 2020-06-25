Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02FA720A839
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jun 2020 00:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404242AbgFYW0W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Jun 2020 18:26:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:55618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403905AbgFYW0W (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 25 Jun 2020 18:26:22 -0400
Received: from localhost (p54b332a0.dip0.t-ipconnect.de [84.179.50.160])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7706620767;
        Thu, 25 Jun 2020 22:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593123981;
        bh=S1U8fm3RinMOZnK4GNXNOMX0hyikWzh9B/PbOPUG65M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AUyYaEdVBfVEMd9N9yuKAnXmb/69ZDgtwbqs47UiYNruPIjxgXKilN98rIL1gOIJj
         QEbufrTI5XUDT7gn3LeuAIfnbSffFNL5R1e/Nmq943u4vXcRStGxRoa2CdaB1Ja4wh
         EVCW7tYRszGlvoHTiOpwpbpDWtCyzvAxCrKdVUqk=
Date:   Fri, 26 Jun 2020 00:26:04 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Eddie James <eajames@linux.ibm.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        andy.shevchenko@gmail.com, joel@jms.id.au
Subject: Re: [PATCH v2 1/2] i2c: fsi: Fix the port number field in status
 register
Message-ID: <20200625222604.GA17905@kunai>
References: <20200609201555.11401-1-eajames@linux.ibm.com>
 <20200609201555.11401-2-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline
In-Reply-To: <20200609201555.11401-2-eajames@linux.ibm.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 09, 2020 at 03:15:54PM -0500, Eddie James wrote:
> The port number field in the status register was not correct, so fix it.
>=20
> Fixes: d6ffb6300116 ("i2c: Add FSI-attached I2C master algorithm")
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Applied to for-current, thanks!


--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl71JHYACgkQFA3kzBSg
KbZ78xAAsHf3FMK1Z6NjNDk7Cv6KLeu+HJLgR8G6J0GBLpY5XAkRo61ROEerVfrf
W+2+8xEVI/ODV9HeBaDQD3FNop5ui5PsdFt81yNrfTAylFSg1oWsSN/h67po6e42
070v/t1DRAR6gYrged1F+nd0eIQy4b+SP1kOlWPRkCb5tZli2WwlzXAq/k74jemY
5rBSamNVOltjj/9h4ZJrzO9a3mwc5kAyGDl2ZE/OELpxh1i/AHqMs1xQcccnxnhc
5QJ6El5AkgX1tKI8UtujDprYV4YeqwuAOx//OICcRc/NyqGr5pXNz1g+qxF7pQrE
uo6WYdyDtr40NNsHtyc6nk3xLK4pjYEdob6uu/BrMxHbKDG4mXJU8TkutNY0L7xN
x+kTOEXCy4Qa8fnwBljylRGEinMe9vAuhpkC+5cwIggcaWIJakwZ8XyBNiFaSqcI
+LnuC3oaVlQCHdM1t2XP2P/tbs7RCERxoP0Tm5K5AIMW1tisMtKntQBSlIosrX4T
3zIwvIqO8N2vzwoFdOtdpDUlg+727xWP9A4g/4dJYHfl6QVYsaC8I3BRDzPTRAt1
eWRKqZpqtefKWdcfoDaJmQaF/pYAR+7QCCVuk0Hn3NYebDOI+LUI/vMnxY9fnAF4
9H6kKyyOMMS7geKGY+IiCv5pp9la0RYuEY2nUNk/zj1w6CggSgQ=
=EG/2
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
