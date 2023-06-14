Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DCFB72F832
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jun 2023 10:47:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233697AbjFNIrl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Jun 2023 04:47:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbjFNIrk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Jun 2023 04:47:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 254211BE3;
        Wed, 14 Jun 2023 01:47:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AEC0B634FF;
        Wed, 14 Jun 2023 08:47:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A82FC433C0;
        Wed, 14 Jun 2023 08:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686732459;
        bh=EonwKTfvGBWUrWdkjSl/Hvyv/pxtwYTpGoA5Jhcqmcc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eV6KXAXup4egROqTSse9iEDQHwGF5LWq65xhk3wTj+kP6IQShwIVOraRODAoPhZlS
         /1j/Nh3IO7MA/VFbJeYYHdaBoOJarRzRy1WifxlCw5V/CjAAW2i7KC10fZJWeq5z4R
         ehITcxS9mh9oS1vWRUmEDX4y+6lp10gAR83ybtedyH5D7rfReCaBPf8Zrt14LUUMLN
         Z+fUJ0k4qg2g+6MO0UucnDtYJoPOrl6vykqjDm8BBW6PRzUf5r7ThdRS3ZKdNL/GWo
         Zmtwfzvrmc3Ms7xJKa/Hg2oIV991LAd/mS14+WPJ0057ctvSwpIsnP9lx3qYpyrrSP
         bkyYJsFPcVPDQ==
Date:   Wed, 14 Jun 2023 10:47:35 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Mario Limonciello <mario.limonciello@amd.com>,
        heikki.krogerus@linux.intel.com, ajayg@nvidia.com,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Evan.Quan@amd.com, Lijo.Lazar@amd.com,
        Sanket.Goswami@amd.com
Subject: Re: [PATCH v2] usb: typec: ucsi: Mark dGPUs as DEVICE scope
Message-ID: <ZIl+pyKgFdQuYCKm@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>,
        heikki.krogerus@linux.intel.com, ajayg@nvidia.com,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Evan.Quan@amd.com, Lijo.Lazar@amd.com,
        Sanket.Goswami@amd.com
References: <20230518161150.92959-1-mario.limonciello@amd.com>
 <20230614001621.iyxi2khz4hmcbl3x@intel.intel>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="N3hmTNEv+0p6gy+q"
Content-Disposition: inline
In-Reply-To: <20230614001621.iyxi2khz4hmcbl3x@intel.intel>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--N3hmTNEv+0p6gy+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 14, 2023 at 02:16:21AM +0200, Andi Shyti wrote:
> Hi Mario,
>=20
> On Thu, May 18, 2023 at 11:11:50AM -0500, Mario Limonciello wrote:
> > power_supply_is_system_supplied() checks whether any power
> > supplies are present that aren't batteries to decide whether
> > the system is running on DC or AC.  Downstream drivers use
> > this to make performance decisions.
> >=20
> > Navi dGPUs include an UCSI function that has been exported
> > since commit 17631e8ca2d3 ("i2c: designware: Add driver
> > support for AMD NAVI GPU").
> >=20
> > This UCSI function registers a power supply since commit
> > 992a60ed0d5e ("usb: typec: ucsi: register with power_supply class")
> > but this is not a system power supply.
> >=20
> > As the power supply for a dGPU is only for powering devices connected
> > to dGPU, create a device property to indicate that the UCSI endpoint
> > is only for the scope of `POWER_SUPPLY_SCOPE_DEVICE`.
> >=20
> > Link: https://lore.kernel.org/lkml/20230516182541.5836-2-mario.limoncie=
llo@amd.com/
> > Reviewed-by: Evan Quan <evan.quan@amd.com>
> > Tested-by: Evan Quan <evan.quan@amd.com>
> > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>=20
> Acked-by: Andi Shyti <andi.shyti@kernel.org>=20

Applied to for-next, thanks!


--N3hmTNEv+0p6gy+q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSJfqcACgkQFA3kzBSg
KbYnohAArgvNkEGbXn5NtNA8ohC3nHYuc6qKRmlC8yFTsp0TaIQhjD6lhJwkisLD
KE3tIXJI00g8S5lpM85jo9SlsZCOWdaWZ6bhGRu0alVxt7KLhFp+ot6fe+W/W5S3
vYgamUpjQakE6tX61qmUlrD/YJq6kzz3990W/rfrMwexK3AfPQcli01MO2ugK9oq
sxHK68s7GoaQ7oAPCE0HlKBl7wx3JlF0lTHyyiQSPTjkznbZOHcFi0Bt0Fm3fzHR
MqJEDDNpGYFXxozK2th0lskKIHXtag9W/nnJef7tgF7Sx2BjQv0J2VfQj2eUOWcY
jh1+NQeik95us167/EhmOmSna+wi58VyM1DblI1TOKFbkQOk1kgtezQg3kX29Mcl
TzLhsXZ0Dh33+ggQl1xVDRYGDnuRGlU7Rm18YOPOZ9/FBlk/EKOdDhmUV7dCo1K8
jeLruBAMXdMlOrMBJkHimRrXnjSA7ldplLfmzgVxnm0jK3Ma/uF8aSHleKqaHwiZ
izKOJzt7SKvdzjnsbfKpZn42eX8qnhWa/MidSPbA/cI5zjPmN2ht2Xe4pIG5wcEs
PMO9T5ZHr20QF7u9QpODvnHbSp+pY5og6NxUwPCt80n8IDIl8RlySSbUmsfoZF3h
Ewamf98QQf0OUEQHzuyacGhUBNdRWiQFAC1XQsMJTBJCd8tBJJ4=
=w58G
-----END PGP SIGNATURE-----

--N3hmTNEv+0p6gy+q--
