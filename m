Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6C37662528
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jan 2023 13:12:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237115AbjAIMMQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Jan 2023 07:12:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237134AbjAIMLn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Jan 2023 07:11:43 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A43ACFA;
        Mon,  9 Jan 2023 04:11:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 31EA6B80D9C;
        Mon,  9 Jan 2023 12:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7765DC433D2;
        Mon,  9 Jan 2023 12:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673266299;
        bh=Unf0gzP83EJpypS4KgHmajl2Qxt7LUxaefchvEPy7dQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s+9Kz1KTSPaQ8yrXIlkkFUAxjzxoFKL9Ye8RyYnP/80dqogZbemgyg6+Fwgv8ZfsD
         KXY23nMv0B+2K9TAeBH3Bybs6vNB2XLt39Y8K6fdvV6C3TnLpTSKMSlie85HrvDFso
         +QWKuj+d07j569TSNOJOg8LaBB8UnwRMRbBA7eb7F+9HMHppkibSvN9v5Wm8T9SLSi
         0jK80XnNZMR98n/qsnDAPcjmDX5xqUosHxU4EjswfH12PGTH/hhbhrB+65f8qVR7Kw
         b7da8hp/k5c4ix4j5lSCs9VI51+rSO8jtq+v4esuKEsr7Dl3GFifVGuDOMngWiGkSI
         u79eDc0f0SwnQ==
Date:   Mon, 9 Jan 2023 13:11:37 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Richard Fitzgerald <rf@opensource.cirrus.com>
Cc:     jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com,
        hdegoede@redhat.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v4] i2c: designware: Fix unbalanced suspended flag
Message-ID: <Y7wEeb5sVPnfcBOh@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com,
        hdegoede@redhat.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20221219130145.883309-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wrXYatYmwDYYMlSh"
Content-Disposition: inline
In-Reply-To: <20221219130145.883309-1-rf@opensource.cirrus.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wrXYatYmwDYYMlSh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 19, 2022 at 01:01:45PM +0000, Richard Fitzgerald wrote:
> Ensure that i2c_mark_adapter_suspended() is always balanced by a call to
> i2c_mark_adapter_resumed().
>=20
> dw_i2c_plat_resume() must always be called, so that
> i2c_mark_adapter_resumed() is called. This is not compatible with
> DPM_FLAG_MAY_SKIP_RESUME, so remove the flag.
>=20
> Since the controller is always resumed on system resume the
> dw_i2c_plat_complete() callback is redundant and has been removed.
>=20
> The unbalanced suspended flag was introduced by commit c57813b8b288
> ("i2c: designware: Lock the adapter while setting the suspended flag")
>=20
> Before that commit, the system and runtime PM used the same functions. The
> DPM_FLAG_MAY_SKIP_RESUME was used to skip the system resume if the driver
> had been in runtime-suspend. If system resume was skipped, the suspended
> flag would be cleared by the next runtime resume. The check of the
> suspended flag was _after_ the call to pm_runtime_get_sync() in
> i2c_dw_xfer(). So either a system resume or a runtime resume would clear
> the flag before it was checked.
>=20
> Having introduced the unbalanced suspended flag with that commit, a furth=
er
> commit 80704a84a9f8
> ("i2c: designware: Use the i2c_mark_adapter_suspended/resumed() helpers")
>=20
> changed from using a local suspended flag to using the
> i2c_mark_adapter_suspended/resumed() functions. These use a flag that is
> checked by I2C core code before issuing the transfer to the bus driver, so
> there was no opportunity for the bus driver to runtime resume itself befo=
re
> the flag check.
>=20
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Fixes: c57813b8b288 ("i2c: designware: Lock the adapter while setting the=
 suspended flag")
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Applied to for-current, thanks!


--wrXYatYmwDYYMlSh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmO8BHkACgkQFA3kzBSg
KbaFZA/+NDWCeEaTI3RC0yZAjIunJWul2UysSCvoSK7i79m1npf3IAvSpiICKyot
mUrs+gNXRE7JtwpnTElBvUKlX3AI5P9Vz8haOOd6D0K9Hn03+RksIbE669uN7Kji
My7cfj7uoNvXd4JcMe7cs0JDwTz1V+RjknpyIYfzbXBsAxleIaodf9oTuiIAVIA6
LvCO4oV85R1nMt/anfGO2d8RkMp8GWJQXVT2uujA0E/5fRijiHpA9X+lYUg5rdOU
kyjSzjN12MHYVTUrj5G7De+VYAL+zku89PzEYG4ZYO0FZkfemaHepy8a7rO37nz5
CC52GWMO9e3YqBHj1yYQsNM/TTsZEKojyFYZwlIYZ+JsdgrJOGSg9yQ6BJF97ERP
pWnIqtts8bd11iMFiFnFOwt3670VI0xiwnqCxHb09LNsSmeSbg1YnthEL8v1Z2OB
TpTj5FcZj5IyrYWgy90NRjeHhrCRrzDY3kn0/F0HG4wceOZt5JH2E7dzzYWvREob
YyhwNEp9qNvQOGt10qs86ib5AerncmJaCf766OQVaAl0i/Mwpr2Qn27CFxYWM9UC
KL0BMID/MUMP2BLY5sHnYmhoSD+qsTtIF3sQsDzSaGIsyaoWulTzVEDZ2eBKv3pX
UGAF13iW/1JpPMlb/wJkgjn2PVm5FGNoOdA+nGS8ldQIb0ZXbf8=
=iDks
-----END PGP SIGNATURE-----

--wrXYatYmwDYYMlSh--
