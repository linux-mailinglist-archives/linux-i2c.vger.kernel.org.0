Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B722560A69
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jun 2022 21:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbiF2Thn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jun 2022 15:37:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiF2Thm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jun 2022 15:37:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CD8C2A974
        for <linux-i2c@vger.kernel.org>; Wed, 29 Jun 2022 12:37:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9B8BB6207B
        for <linux-i2c@vger.kernel.org>; Wed, 29 Jun 2022 19:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F77CC34114;
        Wed, 29 Jun 2022 19:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656531461;
        bh=fSuv51qtKlgkQ+F6mU/Bw5DnaXdbb+IjuQToftn94W8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PBfwJjVzMK5lm2h6U6DQ+Rg45u2rE3L6eOIS/yYRJLtXvlAK4qikU7PQ+jqx1c2g3
         fiChmO3sZUO80TWvKWuONPyZ0RhkskhKim5kIiGXn1YLJPOIYqIulCZDF3zpnjdVFm
         PgvxkAtIG5ZTCvcaw2PyIS3PQB3JpukiH04A0CR2mTfWvDBODLjGhf1P5P7MMNXhTM
         eWpUzv4Cxlt9H8WGZglXyjJT61j0GDnozdQlRtogq/zJyv5youlj5IM2XsPXd409pX
         qpj9Vj1TuCceI+4KGWdLmSqR6ZNmWP/G28P8uFmOYz9lE5kvJA/oglQ+ZPZSHf1Zy/
         4deqfxOHuGdEg==
Date:   Wed, 29 Jun 2022 21:37:36 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Yi Zhang <yi.zhang@redhat.com>,
        Terry Bowman <terry.bowman@amd.com>
Subject: Re: [PATCH v2] i2c: piix4: Fix a memory leak in the EFCH MMIO support
Message-ID: <YryqAEfeLpKf9iBf@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Yi Zhang <yi.zhang@redhat.com>, Terry Bowman <terry.bowman@amd.com>
References: <20220622083743.65e057dd@endymion.delvare>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jNtlQxFZmARviAGK"
Content-Disposition: inline
In-Reply-To: <20220622083743.65e057dd@endymion.delvare>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jNtlQxFZmARviAGK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 22, 2022 at 08:37:43AM +0200, Jean Delvare wrote:
> The recently added support for EFCH MMIO regions introduced a memory
> leak in that code path. The leak is caused by the fact that
> release_resource() merely removes the resource from the tree but does
> not free its memory. We need to call release_mem_region() instead,
> which does free the memory. As a nice side effect, this brings back
> some symmetry between the legacy and MMIO paths.
>=20
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Reported-by: Yi Zhang <yi.zhang@redhat.com>
> Tested-by: Yi Zhang <yi.zhang@redhat.com>
> Fixes: 7c148722d074 ("i2c: piix4: Add EFCH MMIO support to region request=
 and release")
> Cc: Terry Bowman <terry.bowman@amd.com>

Applied to for-current with Terry's tags given to v1, thanks!


--jNtlQxFZmARviAGK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmK8qgAACgkQFA3kzBSg
KbZOFxAAo760+LCUQnHHi1wJA0cDueBECRLkCkfUZP1dd8gghhAcTz7OVXMcCBtJ
1PuvXCtBdp5ATVxT7UjgNONjgES08a4lBrVD/gOsp1iSPkQnkrYCojHTSSSERHVO
UeCbub7A+hfYPkImkOa7ffG2n97JzHQW9jAtIVAQ+LpTcc5fWW6aYzMDsijpzPiX
2nDcIVdKjhlZeBVnbdI0tJBkoJ4JR9URQt+lnlS43bS951ETqrzb4w7EtMAcJNNU
vh+COQq5a+Gd4vbsQRRwLt6iYI3NydrAKTq/seBz3IPWsPgmusCdBihiKV1Dx/dR
t3pQkxgoANwmXUQYxJlpHmjbzAYegeNUNn0nDJT9ZMpH8kF5zhf/d5HFbRrHeQ1Z
2NSN722gXK8561RayxTvRMjukca77hy0qYnD40sZNkSWyCKz2BHS971o24a4BMrc
ycPfrP3mHltBTWnbTE3EVPLEN/GxPD9JeqvS0ltlDdVMT794PlQNLnolpmzD6tvy
R9pqOEcusyPXBBcN15QnaJ+gvGvV50YpghuhhDSjU0GoHb/a1fbHD/M7tvFWMg59
HbxWWoCbW5j2lYbg0XSc/PkVJE4oQVifK5ubMU0t7kRGOkTrJV6pyk3mI5FwZxq2
k6WnNS6w0Ecz/hG8uAukE9jy6a8CQxLEEEC/9FZfO8Xf4IXdSsI=
=NdU/
-----END PGP SIGNATURE-----

--jNtlQxFZmARviAGK--
