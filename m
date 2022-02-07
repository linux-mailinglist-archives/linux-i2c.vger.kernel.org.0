Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBB8F4ABF6F
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 14:25:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386951AbiBGNTi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 08:19:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1448045AbiBGNDO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 08:03:14 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62E32C043188;
        Mon,  7 Feb 2022 05:03:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 20C39B8112E;
        Mon,  7 Feb 2022 13:03:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D32CC340EF;
        Mon,  7 Feb 2022 13:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644238991;
        bh=3fdvgWMdmk/LpdvMUDXaIyajFOvzUUp8bUnAjxNG7W0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jaU088b4m3B+rV+eJmQvTITIh98MRbu1x3hz1cjjRncsb81J/kIHzfozneivLbK0u
         UyhS9Ee2puYHT7pqat/bBm8gfoS6Qpg3OX/MiuAW/+VbZvO9plXdwXlFdmq9Rq7vKC
         iCend3YdLyj8Zy7eZeesVy69w742TRhLSI1DCesCdg7gkTs5wl51h9Xy2tmNJ5ftEn
         QGKf2iXbIqb84dQHMUcpZoVmPpRG89IKI3+5H2cd6top00CLeQo1QxhNIVeJtFdUtK
         0q6yBbCU8OccaXDrWcSg9Dlmd8jVFOLYUY7E4jq7wDVRvEmeVK7t9NiQgOrsrIlDvZ
         8XMjvAd7NQoqQ==
Date:   Mon, 7 Feb 2022 14:03:08 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Terry Bowman <terry.bowman@amd.com>, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, linux-i2c@vger.kernel.org,
        andy.shevchenko@gmail.com, rafael.j.wysocki@intel.com,
        linux-kernel@vger.kernel.org, wim@linux-watchdog.org,
        rrichter@amd.com, thomas.lendacky@amd.com, sudheesh.mavila@amd.com,
        Nehal-bakulchandra.Shah@amd.com, Basavaraj.Natikar@amd.com,
        Shyam-sundar.S-k@amd.com, Mario.Limonciello@amd.com
Subject: Re: [PATCH v4 0/4] Watchdog: sp5100_tco: Replace cd6h/cd7h port I/O
 accesses with MMIO accesses
Message-ID: <YgEYjOwoxtbkBdfq@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Terry Bowman <terry.bowman@amd.com>, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, linux-i2c@vger.kernel.org,
        andy.shevchenko@gmail.com, rafael.j.wysocki@intel.com,
        linux-kernel@vger.kernel.org, wim@linux-watchdog.org,
        rrichter@amd.com, thomas.lendacky@amd.com, sudheesh.mavila@amd.com,
        Nehal-bakulchandra.Shah@amd.com, Basavaraj.Natikar@amd.com,
        Shyam-sundar.S-k@amd.com, Mario.Limonciello@amd.com
References: <20220130191225.303115-1-terry.bowman@amd.com>
 <20220207134416.72c22504@endymion.delvare>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uE7U7PhPAYtL4Nla"
Content-Disposition: inline
In-Reply-To: <20220207134416.72c22504@endymion.delvare>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--uE7U7PhPAYtL4Nla
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Confirmed. I reviewed the 4 patches of this version of the series and
> I'm fine with them. I also tested the result successfully on my laptop.
>=20
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> Tested-by: Jean Delvare <jdelvare@suse.de>

Does that mean you are happy with the i2c-piix4 changes as well?


--uE7U7PhPAYtL4Nla
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIBGIwACgkQFA3kzBSg
KbZwOBAAn5+NGZNzWvSTjotYTqK77pdmgqkcSCKwLYSeAH3ZJrldCI2nVyDp2G3d
ouQV9vMsY/xxkXhTA59QMx4dNJUCcKHvPLNu//6S2cbRERpIUbQLAZ/pWcsgvkp7
UFsBvGcRgUP8kh2QPt/aE6kjLphLNAV2QGGLe3pQxNDmCg8Z2Py5qiYaxCwIKKob
/qNqTLWIAdn4UOyCK/W7fVy3YXCescjXg3oJn57jAB/89v9A5DGCpkwJzothv8Pa
XgwX4oa2aDWiwFRNT8fkIKlcVuGfl8UBye3HTxCnVsvL3QtZYHw2dTl4oNHO8USR
Jch1ou9X8AOubwV4AOjiHsnqfW7sJ4sA0vYuuM5uCr799xPlM4kVj0eh6sLAgEFh
k3etXfI5bNme29ngQT0+Ae0Du0B1WWTfXR6Wr/TTs74GiEK36Ba5PGBTU0Y6szdi
ac5luk/vKMamNfGc56d20LhljXx6a4PL9zsrZfV5H7jnrEQKd8dNbXl3G2Xjxx8w
j7DR7v4e3ZVsPs+cjTWrBcBgReF9p9hk0xnvPqFf4OKQc/YBJuKH30dd3VR/ErUr
W9fofT28RFJxeuWAM1nNCtIDwwVtm03t+zZZytyLrelaGQIK75/mE2x899YEa1eU
V98GzT7Y4cr1n6/H0ee/0j06UQf28VMFt3QN5uAO+8WxmJ+T91I=
=keYh
-----END PGP SIGNATURE-----

--uE7U7PhPAYtL4Nla--
