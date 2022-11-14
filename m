Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 296856289DC
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Nov 2022 20:53:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237116AbiKNTxa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Nov 2022 14:53:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236900AbiKNTx2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Nov 2022 14:53:28 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44693B49;
        Mon, 14 Nov 2022 11:53:26 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D6C24B8121B;
        Mon, 14 Nov 2022 19:53:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D879AC433C1;
        Mon, 14 Nov 2022 19:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668455603;
        bh=USGNMT7eLqrliFumb6hvigVcUYCVRR/D6RMI4vwCgGk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ovVbA+b16cn1+LhsXZ392oeDpR88SLThXQzjLKlhIYAyISZ4GICcJZLI5iDKmr8TM
         7456lyOjZn4eE/RX6OAtWd9Zt7HeZyp8gvLpuDRJsacj1OAOeNq5QGQDnRe0CjAUxD
         pLlNLa484GnXMDy39eJeD2w53KPFpdwoNle8WfQOA9uI3DaUhwVZ6vMwyIUlF1Q0GB
         oXK0U+N/1EKk2BRNXjBjWV33E1WbjvouZzLo0JDz8n7wH9f/nR7qurhA2lj+u7kTXh
         ojEVysFDIgbVqhTn5eDVL8kv5NDUDIHNMYcvzb9OFALlt0rSz21PCsinwHqPhN+UfP
         mUcxihfUW2V6w==
Date:   Mon, 14 Nov 2022 20:53:20 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Angel Iglesias <ang.iglesiasg@gmail.com>
Cc:     linux-iio@vger.kernel.org,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org,
        Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jonathan Cameron <jic23@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 1/2] i2c: core: Introduce i2c_client_get_device_id
 helper function
Message-ID: <Y3KcsJbE2bxWBjqF@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>, linux-iio@vger.kernel.org,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-kernel@vger.kernel.org,
        Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jonathan Cameron <jic23@kernel.org>, linux-i2c@vger.kernel.org
References: <cover.1668361368.git.ang.iglesiasg@gmail.com>
 <a844cc7c85898b40abbdcb1f068338619c6010eb.1668361368.git.ang.iglesiasg@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wT/OxVyU1qtsOtS5"
Content-Disposition: inline
In-Reply-To: <a844cc7c85898b40abbdcb1f068338619c6010eb.1668361368.git.ang.iglesiasg@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wT/OxVyU1qtsOtS5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 13, 2022 at 06:46:30PM +0100, Angel Iglesias wrote:
> Introduces new helper function to aid in .probe_new() refactors. In order
> to use existing i2c_get_device_id() on the probe callback, the device
> match table needs to be accessible in that function, which would require
> bigger refactors in some drivers using the deprecated .probe callback.
>=20
> This issue was discussed in more detail in the IIO mailing list.
>=20
> Link: https://lore.kernel.org/all/20221023132302.911644-11-u.kleine-koeni=
g@pengutronix.de/
> Suggested-by: Nuno S=C3=A1 <noname.nuno@gmail.com>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Suggested-by: Jonathan Cameron <jic23@kernel.org>
> Signed-off-by: Angel Iglesias <ang.iglesiasg@gmail.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Immutable branch here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/client_devi=
ce_id_helper-immutable

I merged this branch also into i2c/for-mergewindow.

Thank you, everyone!


--wT/OxVyU1qtsOtS5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNynLAACgkQFA3kzBSg
KbZjbA/8C3D3AspW3MOT09t4afYUQB0G7EeVSJ2Ixv8xNLt0H0Xbp8mSBHn8E20f
09R95tXkKzEkU6Cn6ZmDTkcTHGd0knsyPGyy08CFXbdDsQM84+Tx+oVVzB/iqW9S
SRyRuf9PuF5esCejY4znIccqxN5LaUWWyY5rM4XnOvp2Mcu+V6bsS4EjDPj0zYGe
o829SfDNwiHjiA7Oqbz4sjbCTCeyYa3emwpZ8xG/LevoiVBh5SRJGaeWgm5W6MjN
C3uYOjj4MeY2J+AUHtBMMVzaujAaTN9O4fIXuWNJfIQG0mwfLAPfa3yZPsZ4hYB9
IINBlBM8AWwb74WPX7AEnSnDCuJTyFVtu8ChVqAKXmtVVrpjIhvlucEwNiBUA3et
pnZZRBeZ1opGrycM9pi4x0OMjYLBJqSGEXCWZcTKVLjQZ0lBM6o6qgRKNQcrpyvx
uW91mTy9fpqHxw00WmrOnUZCjSkDpVPOb557b0IHo93Rav5gdF16mPX56zfU4jD6
kQJRR4ktJb5uNQ6yMCM6vyD6ymSJ0tukIs8u2pSpsN/NfrzRIXfnDt8zT0jqVrEE
1V8zwmK5OzNXSPj0eR8ErGjm25s7adoes3Qzc7/V5WJmH/MTsB/xq/VvVRs3dd/Q
5ptOAvxgD+e11c2dSLR2iR4rFVOroLdWcaVy3a7k/Ov2AYWuHss=
=np0W
-----END PGP SIGNATURE-----

--wT/OxVyU1qtsOtS5--
