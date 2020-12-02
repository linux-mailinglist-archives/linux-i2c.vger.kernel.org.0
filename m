Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 992C32CC7A4
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 21:23:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726787AbgLBUWj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 15:22:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:32828 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726112AbgLBUWj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Dec 2020 15:22:39 -0500
Date:   Wed, 2 Dec 2020 21:21:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1606940518;
        bh=ueg/zJjTxGAs8U1nROVdU9HzadqSPknnRlyTBb1+clo=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=S8XoSdf3EQvNz0AYe11wyF6oKwZSpXcmejsw102NNC39pH1hjo02oGwo2AH6tgeUy
         7CEUqv/ELQUKvoDeRuY/HX6ux3I1jqYQAsHTzr3SoKk1fNGh776F+hFiwKew6M2Qwr
         nZGihllXocPhQr5YBeQEnLe1k37+Xdw5rU9gMCvxhVk3S7LdKzKLgJ3YHKNHIBx2B3
         YJ0eZVpZzejuiq9U0mE2D3KX7YyKYoTyjj7YRoeE+VkbxHqQOkjaZA/gswJdC7iBNJ
         6gOlRjocDoURXg3hdAMINRYlv5FCyHvloK1+A6/z5J1DO4ZOF/fbgPsCX8OOx6eigI
         7/NQpkMPVUO/g==
From:   Wolfram Sang <wsa@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Caleb Connolly <caleb@connolly.tech>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] i2c: geni: sdm845: dont perform DMA for OnePlus 6
 devices
Message-ID: <20201202202154.GA33335@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Caleb Connolly <caleb@connolly.tech>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201112161920.2671430-1-caleb@connolly.tech>
 <20201112161920.2671430-6-caleb@connolly.tech>
 <20201122034709.GA95182@builder.lan>
 <72a37c8c-12e4-eb51-2644-3436d19cf314@connolly.tech>
 <20201202153949.GI874@kunai>
 <X8fChCDbfLfdNoZL@builder.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline
In-Reply-To: <X8fChCDbfLfdNoZL@builder.lan>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> With Doug's recent fixes in the DMA handling and the introduction of
> proper iommu configuration, which Caleb tested [1], I think we're good
> without this on the OnePlus. Caleb, please confirm.

Yes, he confirmed already. I missed it was private only.

Thanks for your heads up, too!


--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/H914ACgkQFA3kzBSg
KbaiHhAAgD1IlhFStyErta5vzS6wC5zsEuphCcHRQgsNUkwfJi4/38j4T60Eei7h
DxZig4jnpnsOsSzE9rRB8g5eUCKvU9UaGNt0P7k76omvcLzsHiqyyxjQbLbZO5hr
18szai4x5NYzHb3wJtroHTva+3vne8MFag9CipuizaA5CjXXg9XFG0XI8oF4U5nw
JhHfCBefOzBPcyZrG3WK4t7Ml1GTPRfYC+qcx+tTeicFJ1+M/uwss3+xHdvUE4Iy
cr+YNy00NEDaOY8OUYaaOEoOw5oc7sS2atkRzQQcuzhbbcMHlm4Eqgo4fXE1aEQx
d4TMR+2GuGyiFFfHjVfgzRdM0WqKa3XIESzeZSydb2uRwxVfBKsqEGLTUqmPBYxN
KZsJgOPCyFOoI5XAQeF/TbOzUtN6wSdAd6En4SRUysVS9POhmlJMsNizit7pGhB5
Ewe6hJQ/mv1lqa0ZHjQfswHYsUwm73xcvDWwqFO7HIIGuI+6GtBu9HupOxwbnHeJ
k2S2kgiSfN+3dEBY+2Zx+5T4qBRzsH12cMu+mnmRmH3wxO5vUIcLEPo/wWlNjgdn
q0aGrsd6tKLpf5i3GtR8RB7wqgyoDQq7+HJAR5rTlvhfrgHcQ3yNnk5w57YLAqaW
wrgI/zcdKISZcYjvRESIGnp4AaUI3wUYzmwnSUmlr7lN1skdL80=
=qnQn
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
