Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C62D86AA06F
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Mar 2023 21:03:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231694AbjCCUDB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Mar 2023 15:03:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231738AbjCCUCl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Mar 2023 15:02:41 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 292C362303;
        Fri,  3 Mar 2023 12:02:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id A460ECE2241;
        Fri,  3 Mar 2023 20:02:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A50DC433D2;
        Fri,  3 Mar 2023 20:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677873724;
        bh=L5veKLAxH2SUFYKMyMXRUHXlUXhf/n2cOJOJQB4SYck=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TmpJJXCTQg248QFTtu7cCyrNF914FevhEChpqBLFPXBIIBu0x4VjUhTq4wlwBwiw1
         yGsV/lMtIyfp+Kgu0AQqiM86kUyEubDhK8FFLrQ0ZbewQMshi6tZxh/SODqgaq/mIo
         lS/Qsdi6PesMY8EzT2JKmf1L9ICtzJT7d5/iKbNJBPkwd5257/Om8Z4rKbJnQblHyj
         a4pP0GVkiYHhVXJ1lxrELnw3XyH8+JwKbDmqA1Av1rkx5TJwp2N2c1OvycI5movyOX
         vfL1J31KazvMphJxS8i50iJYWErZ6mZeH/bKbWwGUtn6BHHy64bQTpefFTJBmdfIPZ
         KOWnfhygn88Tw==
Date:   Fri, 3 Mar 2023 21:02:00 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Dan Carpenter <error27@gmail.com>
Cc:     Nick Hawkins <nick.hawkins@hpe.com>, Joel Stanley <joel@jms.id.au>,
        linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] i2c: gxp: fix an error code in probe
Message-ID: <ZAJSOKO8zA2dfmS1@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Dan Carpenter <error27@gmail.com>,
        Nick Hawkins <nick.hawkins@hpe.com>, Joel Stanley <joel@jms.id.au>,
        linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <Y/yAqRlSTN5VygUy@kili>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WP4VIKkpydrzWAv6"
Content-Disposition: inline
In-Reply-To: <Y/yAqRlSTN5VygUy@kili>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--WP4VIKkpydrzWAv6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2023 at 01:06:33PM +0300, Dan Carpenter wrote:
> This is passing IS_ERR() instead of PTR_ERR() so instead of an error
> code it prints and returns the number 1.
>=20
> Fixes: 4a55ed6f89f5 ("i2c: Add GXP SoC I2C Controller")
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied to for-current, thanks!


--WP4VIKkpydrzWAv6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQCUjgACgkQFA3kzBSg
KbblBw/9HOzZHQwYBPTM4F+97X3QI5IzhpSHSqxaoByOCxbkmCvuQjj4SnOoxxxQ
LBM+87aJlWo9qL206Y8QfV7R+tNeWP5PPxOxjaFL39wzNxmKam5vY6T4LMXvJTBu
ne2f/cuWVPwi1Q1Cx6DIq/UgL88zWjvD8cCcFaKVxHW+U0jjE+o1Gvk0IdlOKiDf
Y2xTiYlGXniOlXeC09t9Dg5hnHqCR6IqQM66cOPtWmyyL4UIi7qua9ClZDLSyZ6F
p4M9mcYIoXdKB7g1tjdai3DXSg5uGA4yyDa/1GBDdua0a3JeIt8bkdfijlasgZIY
myVhT3N/pko0rJmmUkrU2uqAp/bDB3w6O1u75nW/p4D9qEX5cYeIE5xegYnzh7sK
fJI8WfQQfLXwRDJLjgUE53RTPIL/2xU/BuaMvnsKyT9b+UZLmlrJzIYnIQQeuu98
iXHXEl328fsFOzBLV89QL7N1DXc10EkL0vTZGWpxtD6y0sDeZUf6OEF4KhMDAGpN
HeVk02xZnb3rI410fIRzBdxN8/3PN14QVTXPVMEh0Fs2+BY0NJil94aJFYJ3Nvom
w2MWSLq128vkPOZ04N9D47AZ6wIwQbFYgNHvX7YtEq7JxDkBeUs1UnDXElrXOfQE
TymUXyEQpziBIrvI+dQpjofR2KK1MIP+upwbDxNj26F/m2wAB5M=
=MWnx
-----END PGP SIGNATURE-----

--WP4VIKkpydrzWAv6--
