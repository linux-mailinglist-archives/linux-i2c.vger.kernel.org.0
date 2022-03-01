Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03C214C8F24
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Mar 2022 16:32:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbiCAPdZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Mar 2022 10:33:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233573AbiCAPdZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Mar 2022 10:33:25 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 407DB1402C
        for <linux-i2c@vger.kernel.org>; Tue,  1 Mar 2022 07:32:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id F0011B81B44
        for <linux-i2c@vger.kernel.org>; Tue,  1 Mar 2022 15:32:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3C69C340EE;
        Tue,  1 Mar 2022 15:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646148761;
        bh=KEFlnxgivF8datMQwz+YarwZxZzVoc2am8ETyJwdvRE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eZaND1tCtVBbls4efI5yrU206qLKqbQ5A4HRVDcx7oTJjvtMZQW29Z1vaOncwJ+u9
         5WlvTw5txgTEoiKp8fF2PucxyTLQMkAfvCLsyaBiFEe7fmvfuGmQiUPBK74P9qUowh
         t2U36JCJAekYmlJNxixk0rG6gwq2wPAvgXGOaeuSf+CrTiSiYWJZvNP038Umi093CR
         QsaANRN2pcE4oYDAucYUFVFm45orVY21KraxPsXffTB8N+Ke0z2HfR7+qyGBL9cmQE
         rmuvy9tZkbBudtkn9T8lDZVA3w9DC1d1dyiGd/AulREY0AX07eeOrxb7+UbRJh0ZQf
         Fk5QMYfvPqcNA==
Date:   Tue, 1 Mar 2022 16:32:36 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: designware: Lock the adapter while setting the
 suspended flag
Message-ID: <Yh48lAgASIr3kM0x@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org
References: <20220223134839.731138-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="L6GehsqYeO4hfCpf"
Content-Disposition: inline
In-Reply-To: <20220223134839.731138-1-hdegoede@redhat.com>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--L6GehsqYeO4hfCpf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 23, 2022 at 02:48:38PM +0100, Hans de Goede wrote:
> Lock the adapter while setting the suspended flag, to ensure that other
> locked code always sees the change immediately, rather then possibly using
> a stale value.
>=20
> This involves splitting the suspend/resume callbacks into separate runtime
> and normal suspend/resume calls. This is necessary because i2c_dw_xfer()
> will get called by the i2c-core with the adapter locked and it in turn
> calls the runtime-resume callback through pm_runtime_get_sync().
>=20
> So the runtime versions of the suspend/resume callbacks cannot take
> the adapter-lock. Note this patch simply makes the runtime suspend/resume
> callbacks not deal with the suspended flag at all. During runtime the
> pm_runtime_get_sync() from i2c_dw_xfer() will always ensure that the
> adapter is resumed when necessary.
>=20
> The suspended flag check is only necessary to check proper suspend/resume
> ordering during normal suspend/resume which makes the pm_runtime_get_sync=
()
> call a no-op.
>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied to for-next, thanks! We can still backport if we find out we
really need it...

--L6GehsqYeO4hfCpf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIePJMACgkQFA3kzBSg
Kbbi7BAAnKp0cUJYUsDGU4KTAwOkUC0wTpcqQabnXn/WoLG602yFkGZv2c0BuamM
GQpGd0VhiSbGUBSJrVjZz2Z9qQ3smsZeRO8C/vAe7ozzFCOA8U10VjGwNsulx4DI
ld7D+9V8G23MZu6MF/iSXbwoVrIBoXO7UxEUEgpVPyJkbYTdB6kdaC/bokS6c6BU
Fl0Seb8sQILcKCKk2KfkGzKiG4ZUGP1tDyZ8uD4j1E+mdsPZk9DyhsAqmNirdHtG
c7eIc6sHyldlvvYKv+3cHcQhtCx/YgfNqJNrAPhoTzvLuao6/5opYmgGi6jDRrk1
YFBhNQVxGpkxjqDYlkMPFvgRFFT9RvVOMJEi2jI9n7ZhRwV0doUiELYl9cnNgFAR
DNA47uRB7JpzbKnBrtjFPhw7Z4rzPnIe8ukFpyGeQX7+6NPZYAu9lbu5mfgHrpty
lOSHe93CdWm+kSFn0Mgzaz8EU8iZWYnGbcGTc+V6ChmyZKZzQcvgiTPYjVIfcSK/
supN+2ZdDqc36NPT72DfbTvvJS2fJYfON+Iq1IQIIQBAZRw/Z95ayB1oaWeZLzf+
PSPMRyDwB1EI27Vwpx9v3UK/ainZbb92//UoeEodPsBfeZJ1BLp0YNpDTJ4cmEGa
l8ud3cfkiDs6iCLEQdIrso35V0nrpmlWIjGII0aGGlNHtbw6OJg=
=w/3u
-----END PGP SIGNATURE-----

--L6GehsqYeO4hfCpf--
