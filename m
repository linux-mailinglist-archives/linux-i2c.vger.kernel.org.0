Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 419E1693A38
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Feb 2023 22:14:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbjBLVO3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Feb 2023 16:14:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjBLVO3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Feb 2023 16:14:29 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B5C2A254;
        Sun, 12 Feb 2023 13:14:28 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B2994B80DA0;
        Sun, 12 Feb 2023 21:14:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4639C433EF;
        Sun, 12 Feb 2023 21:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676236465;
        bh=I188z32N+WIDJgWGIzK2pS6xx1UvPFQePimfGPEMjBs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gaC/2Ma8RZDfm5sRSF2OSsGHXB8flfgJuAPpV9bnvurx88WY6+NFZmTiXR/SSrU2V
         Co2kIMz/wRGercmP55GiN+vThmkBV0aIfbI7DWTj7D8Tzm6uwsCKn2+x5wr9w+NCSQ
         eJlbWXSJwcbJ8hPE0GOmNBWpGOIStZV/vskI6EvdlNirDNYPewWGv3B/Z5nDI4y3i9
         p2pHqEyOpAbNb5ohlF2DuVGtXstfUTOCmVPCwWs2HQEgb5Znc10VPcUKCE5QLAaVLL
         p9BGakhWhHGTXV1lBSSQ9KzvzGM44nnCizSnfnbklVcW3pCoriTY4nkMv3PbcpMHCD
         j+AX1Q2y8ci9w==
Date:   Sun, 12 Feb 2023 22:14:22 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     ye.xingchen@zte.com.cn
Cc:     michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: xiic: Use devm_platform_get_and_ioremap_resource()
Message-ID: <Y+lWrijnACGg3/Mo@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, ye.xingchen@zte.com.cn,
        michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <202301281453121890132@zte.com.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ta/r8DwciCrDGg78"
Content-Disposition: inline
In-Reply-To: <202301281453121890132@zte.com.cn>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ta/r8DwciCrDGg78
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 28, 2023 at 02:53:12PM +0800, ye.xingchen@zte.com.cn wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
>=20
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
>=20
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

Could you kindly rebase this to i2c/for-next or i2c/for-mergewindow? An
earlier series for xiic has been applied there. Thanks!


--ta/r8DwciCrDGg78
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPpVq4ACgkQFA3kzBSg
KbagIBAAth9RzObTd6wfFr+VSdDusxRXYRuWut2c/6VXOtD4lv3r1DRpfs6+P40r
cMksNjRleD+6Lu4BR26mhCgte8Cw9xl83lgrht67D0B+kcyBoe6Ozd0TUcASocoT
xghSgGKyJQ9o8TKOzePOUblTbcYz1UIO/C3wb05KKtfjsPEqb6gVlV+M1gW6nsvL
gp5JNqYrToGVzItGJwyYulOGUcuVNLtg/aqtZoybcxscvemYA+f6xkS0aHS6umw3
CCbD5IVrR4qhbRm/HbwoF5W/udazipbnZp6q+szCXKGI+mvbfDF6MDawtToXUYT9
pfsdHyU/bfIqZ4/4jUmgEtppnZvjXuLJVvFNaYlLyj7wibl7OWnWZ39GwQIxzJMt
NjkQV62kNthbbuhKjRAiVI7hgIVv1E5TvpumRqrQvqlxCRo4cKPScZRE5B1BZJ+/
Lqn0CXsuM584I3Id3ltNMKaRhnH2uvctpGdqkBIURW5pZOWpKowTGdXrplqH1itw
pvfPsmJhjdkO1gkzlefdcLyrVR5qMxP56Cacu3Qh1R4qBT/rhPFqbuLeDw9qY7dx
6/57vyvc1gKYsnWLVh4P1kJH62e8I4q5Sfp3gBvrajQjZauyP3vcnzXrwLcSCnz5
NW7OLviFc9b26Acg+/tp3yzNoRpU2LfzUhGbE9ZO7xe45bEKMYs=
=3cFn
-----END PGP SIGNATURE-----

--ta/r8DwciCrDGg78--
