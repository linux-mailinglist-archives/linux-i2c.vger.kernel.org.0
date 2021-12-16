Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C02B477E94
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Dec 2021 22:17:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234278AbhLPVRn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Dec 2021 16:17:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229818AbhLPVRm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Dec 2021 16:17:42 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A75FC061574
        for <linux-i2c@vger.kernel.org>; Thu, 16 Dec 2021 13:17:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3B781B80939
        for <linux-i2c@vger.kernel.org>; Thu, 16 Dec 2021 21:17:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61DEEC36AE2;
        Thu, 16 Dec 2021 21:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639689460;
        bh=d/2WgS3YzI18AwB4OeGalrJEfWWVojQMn8zB4VLZeEk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b5LI4xmnWGCBiRpVEfv/neBDO10vSh0fEkLBKX8PmdRfx+pfYsi6W0nagV7lZ8nPk
         zOgIXdnAIj/7rseMQWsgxoAeCpc8GYeiLjXhUfeLHVq71DBTMvcvnGjftDf5cGL9v+
         m1Sl8fw1m08hOGCHNgFtEIKtSOb7Zm4UJQWYtv+MqNjA8RJa20JCckZCWUqT/RbQKg
         iQnfy+dM5IWNbd8lwwCjpoXrCF680fsGsDDxRoyTSFOPR5n1rZOecr5s6BhPv0ICUi
         xRi8eoCeb9u4g/6Csk1/azoSmgQpFJw/wRiPBpmnP9TVqysBtKUfJJT48VFZpissx9
         JUIbvMg3CYmew==
Date:   Thu, 16 Dec 2021 22:17:37 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 3/6] i2c: designware-pci: Add a note about struct
 dw_scl_sda_cfg usage
Message-ID: <Ybus8Y4LkXFJf9im@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20211215151205.584264-1-jarkko.nikula@linux.intel.com>
 <20211215151205.584264-3-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3nVoOXNZMBRh7QUu"
Content-Disposition: inline
In-Reply-To: <20211215151205.584264-3-jarkko.nikula@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3nVoOXNZMBRh7QUu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 05:12:02PM +0200, Jarkko Nikula wrote:
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>=20
> Add a note about struct dw_scl_sda_cfg usage to discourage people
> of using this structure on new platforms. Instead they should try
> hard to put the needed information into firmware descriptions.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Applied to for-next, thanks!


--3nVoOXNZMBRh7QUu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmG7rPAACgkQFA3kzBSg
KbZ5+BAAnzcZtHSbqXxOOtV6rPFtLoAtjRxjTklJtzbrNzoJcpFRbyEMRCvJ4ei/
2iYvWATahDOE8+EMb0nqaGxRgmbuMXGVTkWn+AYkVpcKpX1J61MJrSDhFHXdOhpy
3c1Bquzx+9xbA5wSZmNi6Wi+eY3PkPTe8SXd25DRAGOLRw0ct8miIhoz5Kvf096z
KuMuX9ZglhC1j7SaBTAAyCe5tmRFDjqqo/wpbAwkJ7N4kdwVHijnb0VpvyBl0Uem
S3SnFlGeG7T5dljlqGDRF3ber1ZgfPQzfI8HpiUiI1PVeU5Ded1zEq3GAPiuxSOy
CzRF5a8qiUcCl/rXuP5dZTgZ5AP9Q7kmW3+d1hEI3wbXAZofK+sY8FAWP3TuZZYf
0Oj0FHmzs70iyWVBb2qcvWXfRvkrghMl6sI6ElJDRKzIyp2qOvS3cjrWhXC7k+F8
kkkEjj6HgCggUTfyx7vSTRTFI/xXbiHjGWx2T0yoozbEtSSBZA0RZP+YsISROPW6
17Kgnt5Y4Q68GhlSh1o6tsCa/nX2hWPCbfERLscQzIaMXjmFTNNXTIHD8Y8Ttoow
z7QFg0NuUi2Udds8Ajq8o03tr1rm35aMR+myKYGkT9Q7f7+33sQ1G53Cv0avFek8
WBUkcwWDF3O2qwhLh7rbqSmLAtnh6VghriaT1fq1jEc9mS349MI=
=B822
-----END PGP SIGNATURE-----

--3nVoOXNZMBRh7QUu--
