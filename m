Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42E796624F0
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jan 2023 13:01:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234931AbjAIMB4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Jan 2023 07:01:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237036AbjAIMBx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Jan 2023 07:01:53 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41F2D1A208;
        Mon,  9 Jan 2023 04:01:52 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CDBCE61040;
        Mon,  9 Jan 2023 12:01:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE2F3C433EF;
        Mon,  9 Jan 2023 12:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673265711;
        bh=Nrk/6owQ0p+ioEIH7iwqXCCZyfHp9JUv51zfTdATZi8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HkYDJL2+OqGonEH/IHff0H1Z7dGFtu+mH00WhzCZrbQaVIythOBqU2fezehVxAOzp
         woy69vEzSDOzdD6+7SeevT6rhNDfMemyNUAO9YGlSDriOh5/ED+eCeQ+SdVYHSdCcV
         9HQaoHVdSRwNfUPJY8knWykyR8ZRU6H1fHCy53qkUTRiSB/LtI1qpCE2He5CXhSvNo
         YxgIiLZYDw1w88kxug1O/icR2aOuveRV70jzPqyJxA8D9WRI0pfeDbItn3OC+31QH3
         HGg6cmrkaVqD7inl2KfT783C2I+hYTSTzOKD9YXfGJEJk24P2G8LcnmHdRMQxbc8ts
         yXWuMFhDv86DA==
Date:   Mon, 9 Jan 2023 13:01:48 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Richard Fitzgerald <rf@opensource.cirrus.com>
Cc:     jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com,
        hdegoede@redhat.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v4] i2c: designware: Fix unbalanced suspended flag
Message-ID: <Y7wCLAJxuR38qJNI@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com,
        hdegoede@redhat.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20221219130145.883309-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JBU5uxWU65CS7Z/C"
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


--JBU5uxWU65CS7Z/C
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

Does this fix a bug when runtime resuming? This is not clear to me. I
tend to put it to for-next rather than for-current.


--JBU5uxWU65CS7Z/C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmO8AiwACgkQFA3kzBSg
KbawMBAAqK43llzqU7F9aIrgKISNw24bIA/bh53wAW7wgpKVCRoUWqCkv62Mwryd
oYvLfCYeVla73sCVRke/J09jAacioyX5/TI4ldGjNO0C03NNx4US3w8b9gBGAWuQ
K7/sboboKSO92DYok/eqiPBxvpN0QN5aaAr0le1W6sMMePmtx9WQOndiG1ZWS0R8
+ljPoR2xITfbJop5eWiaBZuRBqFS0es0ZQdigO2AZeqNnR5gk2dtl11cFb+szPwr
l/5DXnQt33ySIAHnOAK1+2+yUlkdgvucRYvECDtw4h5vEl43fwiF0nrWq7HClaSH
pQxbrH3F7FEEugU+hbZ/Nkzcip4iYuA/u7vjaHwTvI6P0R7R9kIYDrn6ifstSckq
vfiyczDkk/guj9zmCmjPUUDsYbWdge0rlFtENh7jCWoVBILXsROtz+wS7Wmh7lbw
znIu1TzcfF3UzdlZS3QHaHKowsNRvqusBv1f7Pokbgq+38REVItA38s5V1Tzj10M
3Ry0/ne2aYTzuYCVV3yK91HRe3ifTyHTpzAG6LL4mvMC9nckC4C6eyAsqBfKj9Jc
5x3U/Pzg40Cal/B0J6+DIFN20CfbCZqLdNfWhPBecf3owvimeVor/VyPE1QC9a8W
bL/tp0ZdTibwAuIC+iJrAFpuPyVqqN/LZOPR4+5xKrZhl7fNCM8=
=XQ3w
-----END PGP SIGNATURE-----

--JBU5uxWU65CS7Z/C--
