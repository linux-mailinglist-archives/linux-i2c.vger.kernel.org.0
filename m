Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A8C2168EDC
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Feb 2020 13:34:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727297AbgBVMeD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Feb 2020 07:34:03 -0500
Received: from sauhun.de ([88.99.104.3]:53574 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726763AbgBVMeD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 22 Feb 2020 07:34:03 -0500
Received: from localhost (p5486C6B7.dip0.t-ipconnect.de [84.134.198.183])
        by pokefinder.org (Postfix) with ESMTPSA id 2BC192C07F9;
        Sat, 22 Feb 2020 13:34:01 +0100 (CET)
Date:   Sat, 22 Feb 2020 13:34:00 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Alain Volmat <alain.volmat@st.com>
Cc:     pierre-yves.mordret@st.com, alexandre.torgue@st.com,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com
Subject: Re: [PATCHv2] i2c: i2c-stm32f7: allow controller to be wakeup-source
Message-ID: <20200222123400.GF1716@kunai>
References: <1580752328-26009-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Il7n/DHsA0sMLmDu"
Content-Disposition: inline
In-Reply-To: <1580752328-26009-1-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Il7n/DHsA0sMLmDu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2020 at 06:52:08PM +0100, Alain Volmat wrote:
> Allow the i2c-stm32f7 controller to become a wakeup-source
> of the system. In such case, when a slave is registered to the
> I2C controller, receiving a I2C message targeting that registered
> slave address wakes up the suspended system.
>=20
> In order to be able to wake-up, the I2C controller DT node
> must have the property wakeup-source defined and a slave
> must be registered.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@st.com>

Applied to for-next, thanks!


--Il7n/DHsA0sMLmDu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5RH7QACgkQFA3kzBSg
KbbVzBAAqGtkUF4TZxt4ODn2bDGGVNG9F6i9rjjyI5ug25RWTB+ROjLWYiY/bhb5
aD74gBZY53Ec+Oux/YKTbTXPLdDZDWJch34GZSa/qGJzgOjWOOp0CzNN0pX+pxBW
VBhyTL9JP0UIMXypSoTc/1toTIrw6GBmT7j+/l1egUQWERrqzyEnkO0AG9hsSdy+
9NWnRmF4E4BqvBvguJWv5LxKut+fk4cimN1r09kc8Fu/D+2O0rsOwk6h2PWPEtWw
jxBQDQm6j7tChzipyzmUOQmNv9uG2fNxoIqdgl77y9b3bpRPRi6zjHlEpYU4Q9PP
frijrpx432VHOdR83b9Als8S6XV6rK0MffKtiw6dBwnljkwPsPmnrKAePHwBFW6j
mftKGaSEBFaiA1NfUJQJFvQovtUhJtHnQ4FafWoAv9UdfJEs/P/styAj7xMQ6Z/i
0q2c57ntHfCoXxBNTRGuiG+jw35avYfWH5yfvjQhUr2H6bDXWU5SLcnuhPraWSWV
3JqQuz8eGCig/FP96ZUsb3o1PIsNsQjFIZT81H9Gqc8FvS6wf1SEqvUHClVMvz1w
XY/hFcwAifYIOVKTIjoEYB7xdyV9Pql9d2gKeCwCzMVIQ02ULc+QDdgWJa0Cffjl
L57oZYPgRksiZPh0hS7QdyMaf2WA1vFNLIA8+sJ80xHBtEGop+A=
=+Wcg
-----END PGP SIGNATURE-----

--Il7n/DHsA0sMLmDu--
