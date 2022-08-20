Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 857B759ABC1
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Aug 2022 08:35:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244095AbiHTGaJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 20 Aug 2022 02:30:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbiHTGaJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 20 Aug 2022 02:30:09 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16671B07D5;
        Fri, 19 Aug 2022 23:30:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8DB20B816D8;
        Sat, 20 Aug 2022 06:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93670C433D6;
        Sat, 20 Aug 2022 06:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660977005;
        bh=exw9SaJCeUBSW+rAlqqy1BP9+7K2rYOmxA+Xh9R+Nq0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b5NT79YbNyPjFdB4bBd8t4YdMnsd1MPYnXk/VkXf0a87BMDe8xt9nONiAGBoQpO+x
         gWkIHPzAUqqRUw4iLgLeIoCBY8nuG5L8EQYRzfiDFG0cRnhHaU/PIF1zgYwyRJ2aml
         dlg2Z/ZuvyGKYVkiqA4mbt1Y7f/LTRn00JkPUwnugRVvb++KVf+oJRdPmePwAHP+v2
         x7WT9nhLq/ONVNJrvWTW8EoddcY+x0VHIk/SWujf1slF7cI/QYrMeVbSxawDu2uP8z
         0CQJRssrI7/0yOdvo1umy0pJozI5fe+MI0nhA56yBt6qgkqCd3jQzMDGBKgzxqpW+b
         uTqfzavu573qA==
Date:   Sat, 20 Aug 2022 08:30:01 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jan Dabros <jsd@semihalf.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, rrangel@chromium.org,
        mw@semihalf.com, upstream@semihalf.com
Subject: Re: [PATCH v2] i2c: designware: Introduce semaphore reservation
 timer to AMDPSP driver
Message-ID: <YwB/aWRxyemPay58@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jan Dabros <jsd@semihalf.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rrangel@chromium.org, mw@semihalf.com, upstream@semihalf.com
References: <20220812071526.414285-1-jsd@semihalf.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tK4/di2mPXFHr9ge"
Content-Disposition: inline
In-Reply-To: <20220812071526.414285-1-jsd@semihalf.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--tK4/di2mPXFHr9ge
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 12, 2022 at 09:15:26AM +0200, Jan Dabros wrote:
> In order to optimize performance, limit amount of back and forth
> transactions between x86 and PSP. This is done by introduction of
> semaphore reservation period - that is window in which x86 isn't
> releasing the bus immediately after each I2C transaction.
>=20
> In order to protect PSP from being starved while waiting for
> arbitration, after a programmed time bus is automatically released by a
> deferred function.
>=20
> Signed-off-by: Jan Dabros <jsd@semihalf.com>

Fixed this checkpatch check:

CHECK: Blank lines aren't necessary after an open brace '{'
#60: FILE: drivers/i2c/busses/i2c-designware-amdpsp.c:265:

and applied to for-next, thanks!


--tK4/di2mPXFHr9ge
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMAf2kACgkQFA3kzBSg
KbYzCQ//VDhWJ7L1FK7lI9PMNeLt++3U7DLDOvK9Uf9aKHfEBwItpIahAiPW3TMv
dk/kMaQ5sylz71wLuGPUJs/6dgpqh15GgkCEoGQXGzBdx/NcHny4Injov6kSm8Yp
OKDDlEiBk92uWg0w+CVTbxE2uZQLJAFWuW/rTCeYzhAwvPiC+HtoEVEaU75hdvA2
hLShevvFllZfclONwxF0dg5uVBPukQ4HJowSMG2qzo7IdLdBjqIcF7drD2/o57rR
ldtnKk0ozrn1s/qmnsZKtLJdf22BEpxtdKhSfxTkN/hOIZ6V+bBlO841sPlOM/Xl
SpT+iqapG7G0sP2gOY0SyGI/b1Pk4bbMs0Gx3EOmedFy8FANKlBvh1Xl6jMfkizy
gvSJmuZ0VeSa+HSr3LNdAhEVGIYAF7EsQykaUt+GHRG2cUr39/RFlW59eYIEe4RO
fVoJdFS+zDu/K5xOsSsevgcOORc2OTtjiEl8aAeCAogOmiHmeQCoESlswe2S4Yih
NxX3ANwuR+CD5mLVIJkPoBmeVyLA+pvoiKHTQWkD0g6iO0ecs13t+GY6TaEzHN/t
qsHBdec/LDxmyBOHrLIKekJ4/G8rpFsQAvSymQA95OsQWV9lapp0VEACOd3ADCmL
ba/Fq6IyTAm2TPHz8qnidAtr7+EvsnfvQA2fkWCBtMaO17oFymY=
=P1Al
-----END PGP SIGNATURE-----

--tK4/di2mPXFHr9ge--
