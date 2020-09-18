Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A21CA2707BB
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Sep 2020 23:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgIRVFZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Sep 2020 17:05:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:58598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726118AbgIRVFZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 18 Sep 2020 17:05:25 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 027BB221EC;
        Fri, 18 Sep 2020 21:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600463124;
        bh=7cgh47dCTmIGdDQYLT5Tov7SoTaWYADEFV0D+Nr8bbQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IivkW76TqJLXKr6U85qqJXH/YKWDoKakHRBY+YhDP+JtmKQhk8YlTZhM0LhUfPpBr
         hieTKrLdzKn/IyEoL1tMCDuXkzbHL5E0pRXeWO8suq6VzbKI7cDwOW1wZUhDmhXq+Q
         c8haJJIrZCV8ucjjDLQLefuynQTmlIXpd8Zul5Rg=
Date:   Fri, 18 Sep 2020 23:05:21 +0200
From:   <wsa@kernel.org>
To:     Alain Volmat <alain.volmat@st.com>
Cc:     <pierre-yves.mordret@st.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
Subject: Re: [PATCH 2/2] i2c: stm32: name slave slot to ease maintenance
Message-ID: <20200918210521.GE52206@kunai>
Mail-Followup-To: <wsa@kernel.org>, Alain Volmat <alain.volmat@st.com>,
        <pierre-yves.mordret@st.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
References: <1600161101-9941-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hwvH6HDNit2nSK4j"
Content-Disposition: inline
In-Reply-To: <1600161101-9941-1-git-send-email-alain.volmat@st.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--hwvH6HDNit2nSK4j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2020 at 11:11:41AM +0200, Alain Volmat wrote:
> Name slave slots in order to ease code maintenance.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@st.com>

Applied to for-next, thanks!


--hwvH6HDNit2nSK4j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9lIREACgkQFA3kzBSg
KbYO0w/+J0A3k4a2RFdBlcuEnHguUJrDtmQC9hRAky9iwKk1Ul92aLcW5XIjofsM
dJwHm5Tj4x2sKU5kf1RVVCmSpDzO1kuWX2jvMuiJ5EMhHaJZ3ZAuD0awqyemyl4G
26weBY9EiWOABw98JWE+JCT070AZwDUKZRZX1MdZSqAkGXXt9c5vhDFlQ/9KtvWh
r40WAUp2eKnfftg2c3yy3/0BMRnptsICSgs9Di/K6/WLP3Hiak2g6oRtQeTgd6ie
aZ6t3TPjU7kDQ71870KTMFULMCSfUDTvYgqr4brFw2oK4Im3KRw5wfaIfVaRg5gV
N8Fj2YWODe+gBsiwt3GOt2WztQG7+YxyJsTB46sI41Oz6ZDniH+duHi0EfsokSWp
eTG3RlSc/Y+l0K6Zx+BNPzzs+9keKn4JFOLINkyYBD6Lb1OEfrAL6um9PXQ1Hyzv
/If0f25ImJFwVI9lorR18wNGn8p8q/XAaFRi3bWHfad2V5CO//NFlAPC/SG7xjTE
4r58Fp+PmpYA4diMjaniWP9a8y8YvzdYl+zY4isb4ZJim+0hGzKaMSbG/w1oA1Qw
jgRQwmT5RAYiw+ZgL+YmO2Q1OhJKLYUXN0K75Pkb97cohhtnm9TS2/MlzQIAsp8b
w2/I/pQdL6vAwEgtChdqN2DaH5e0hPgYt5skihD7poFRHL/ULVo=
=bnfc
-----END PGP SIGNATURE-----

--hwvH6HDNit2nSK4j--
