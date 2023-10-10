Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D402E7C03F4
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Oct 2023 20:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233829AbjJJS6S (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Oct 2023 14:58:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233674AbjJJS6R (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Oct 2023 14:58:17 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D925893;
        Tue, 10 Oct 2023 11:58:12 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB77BC433C7;
        Tue, 10 Oct 2023 18:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696964292;
        bh=ys7zX7Uip/yjApTsNB1scMMUo0/posh8yamGRtSA3Rk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RL4dxfBVLsK8NR+QUwqeE0N3UhwgMYm3mO7m3Dp8BQWAw8W4AZQZ1poygrgqOOx9O
         h+UnoxTFJxS5d7DmytOI2Q/1bOZ4Dd5JxKkHQ48C+HAMIuXrQunpDezF45lYwaaD3s
         rTjziqWRLQvaTI1HMp4rPIyp8jkVUyD/7P4SUErRgqCujcgYJ9VyxF+E3XJua0C2+W
         JFsgB/icYYc50GwjKPfNghwS7rCzxdtdf7f01hmFeWgLTmtPdUDQZuD2AXIfQY0HLR
         FtjPdK31QgJUjRJbFx5n6DzT6JKGSQjnb6UXStsmfNf0m+g86ds2DJrZjWFYyM4Yr1
         hzK4RluUVpXWg==
Date:   Tue, 10 Oct 2023 20:58:06 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Lakshmi Yadlapati <lakshmiy@us.ibm.com>, sumit.semwal@linaro.org,
        christian.koenig@amd.com, jdelvare@suse.com, joel@jms.id.au,
        andrew@aj.id.au, eajames@linux.ibm.com, ninad@linux.ibm.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-hwmon@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1 0/2] [PATCH] hwmon: (pmbus/max31785) Add minimum delay
 between bus accesses
Message-ID: <ZSWevlHzu6kVcGWA@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Lakshmi Yadlapati <lakshmiy@us.ibm.com>, sumit.semwal@linaro.org,
        christian.koenig@amd.com, jdelvare@suse.com, joel@jms.id.au,
        andrew@aj.id.au, eajames@linux.ibm.com, ninad@linux.ibm.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-hwmon@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20231009211420.3454026-1-lakshmiy@us.ibm.com>
 <ZSUaDIfWmEn5edrE@shikoro>
 <1284830f-025e-4e25-8ed0-50a6cc00d223@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1djJUpxMrj0Eh3vK"
Content-Disposition: inline
In-Reply-To: <1284830f-025e-4e25-8ed0-50a6cc00d223@roeck-us.net>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--1djJUpxMrj0Eh3vK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

> > > Reference to Andrew's previous proposal:
> > > https://lore.kernel.org/all/20200914122811.3295678-1-andrew@aj.id.au/
> >=20
> > I do totally agree with Guenter's comment[1], though. This just affects
> > a few drivers and this patch is way too intrusive for the I2C core. The
> > later suggested prepare_device() callback[2] sounds better to me. I
> > still haven't fully understood why this all cannot be handled in the
> > driver's probe. Could someone give me a small summary about that?
> >=20
>=20
> Lots of PMBus devices have the same problem, we have always handled
> it in PMBus drivers by implementing local wait code, and your references
> point that out.

I am confused now. Reading your reply:

"I am not sure if an implementation in the i2c core is desirable. It
looks quite invasive to me, and it won't solve the problem for all
devices since it isn't always a simple "wait <n> microseconds between
accesses". For example, some devices may require a wait after a write
but not after a read, or a wait only after certain commands (such as
commands writing to an EEPROM)."

I get the impression you don't prefer to have a generic mechanism in the
I2C core. This I share. Your response now sounds like you do support
that idea now?

> What other summary are you looking for ?

What the actual problem is with these devices. The cover letter only
mentions "issues with small command turn-around times". More details
would be nice. Is it between transfers? Or even between messages within
one transfer? Has it been tried to lower the bus frequency? Stuff like
this.

> On a side note, if anyone plans to implement the prepare_device() callbac=
k,
> please make sure that it covers all requirements. It would be unfortunate
> if such a callback was implemented if that would still require per-driver
> code (besides the callback).

Is there a list of that somewhere? Or does it mean going through all the
drivers and see what they currently do?

Regards,

   Wolfram


--1djJUpxMrj0Eh3vK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUlnroACgkQFA3kzBSg
Kbbh1hAAobbv+zDV1isP1VmO8awucHkYyvQ8LVnS+Uk1vKJZJjDR7UZHJhnm0VDK
iTZBj9bnFfwoGzSEA5qmsb6EClU/NE9e0I/zrAvLK8Qhl5qB7vE6iwCe7VwZCacK
ckl9b7lW/4rB/d/Rp4c8dhpaMIiOV/iimgEAbQJlud+ojwZWTOIWJ0mE+1OlO+as
m9tyYspGMUIa3APMfaL7hmuNTQC8alEenf/rrPcbHhUKEfu9MmS1fWbXgMgJHgse
IeTBCDf0lurUO/NdnCGxgfG5aQHZ37EwdaDETzxtob0uWgc2IsUAx//CIxG3VN0J
13j3QnOwNW3GRmiwiHJgP5Ij896pNaffOKdWz79gSmqKbjaJZ7Tj4FC1IPq9cWLZ
zf/P0yvysvHC1w8mFFQ3oCJum+VPsK7y9AK/yzxDxSXEq10jUdLCPPoZ4+smhtls
DcfND9JE2WSpH8Gz0iaeEn629LZlT852KPLFLA6M5sBtHc0w4beT99EL1f3bxn+9
GSBWEjh5/IHX3YKfWwnjeuDme3OVxc4+eUOmV59i4xjvYo4t9N5qcGy7CucuOFEo
bz5AcKVQNEIwC3liRRZLzy4dQLHEVlRMuNsk1Rk+BbtTdLygSYmqTVH96j2r5v41
JuspoeQn8WmdTyD/LnkoZYtqxR6F+HynPJXs4/IgHMRzBW/D0ks=
=9HLu
-----END PGP SIGNATURE-----

--1djJUpxMrj0Eh3vK--
