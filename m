Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40978357457
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Apr 2021 20:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355357AbhDGS2v (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Apr 2021 14:28:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:35830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1355352AbhDGS2q (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 7 Apr 2021 14:28:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 87D8E611C0;
        Wed,  7 Apr 2021 18:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617820112;
        bh=uBe+uHm2ojJ6w+j5Hk2edkLNvXQ69gGVO6npmIXd/vU=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=PRLKYXOa612uyL6GPvxgiQA6uOq3T8+SAbf5Mg7VTcKvsWcYTFX+4F6R2f0CVcSRk
         EIehmKfpLeQdxyaxZEx/71PH1YLxnKRX8w0ofFsTxonLLyi/YpyO75/7ydI44LXCTo
         Hnf7hPMME2yy+9VaWA4qWP39wc6cDNBuUZm/ALVftkRt3eiOl5zXxSjNsi+dS57/iF
         CkABzFi41r4+HlSZhAYwsdWNOXCQH8ZSMTHSbP6yDddv4lTTs+1g9+i5jPD6m/IsQD
         yFYgFABl2PNd4N6om6nlOJoW7XVADCBOe8cAykyxafnBx25/dvHOXnjTXSlr3DIdrd
         emANa309ZIFbQ==
Date:   Wed, 7 Apr 2021 20:28:29 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Rob Herring <robh@kernel.org>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] i2c: imx: drop me as maintainer of binding docs
Message-ID: <20210407182829.GC1614@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh@kernel.org>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
References: <20210329192409.7313-1-wsa@kernel.org>
 <20210407181804.GA3993883@robh.at.kernel.org>
 <20210407182330.GB1614@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eHhjakXzOLJAF9wJ"
Content-Disposition: inline
In-Reply-To: <20210407182330.GB1614@kunai>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--eHhjakXzOLJAF9wJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Ok, I'll add you then and send out the patch in a few minutes.

I just noticed that Oleksej is already listed in MAINTAINERS for that
file. I will add him.


--eHhjakXzOLJAF9wJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBt+c0ACgkQFA3kzBSg
KbYw+Q/8DruL2KRSqaUDPKRg3/sc3yNIB1K3tuX+Kenu1pYSQcA3AsFNMsw8HisF
ZaWfEuCDuG9nKgviNTOZP5fa4WRdCLsCsDKAjnlMItSp1HTidVPyTqDEEedGvTg4
IwvOEXC5iFWVoKwQ4akaowOkBdZowUY+UQzw8CJAMFnxgdCmmaz4u9eCQ/W00+mD
McDMsTNm70Fkp01g3Z6oWW9aVvDy/c9OKbedfzNiQLBYhCBDbfK9Pz7/fKzStH3+
rCXOrXRvv0UawHZb4Cw0Yz8zlv3l9Efv1yd7mJIWxr1CWg3xjjKvWO3SYR2UriIW
jyY3Qym5uEoiFX6cDKAgZLLzc9//TkAm22AoULZs97DfnDU/OxD8sJbxXz03I01p
J3M7XMcn3pyaZDFt2HjW6UUpYbSg0SioZwKQpL3V4zF15sMA7955VAWAPCF7uCZr
kWlPuZWrIvxo90xxuQc7ChJpwCeoQZvFKAWNYRCTvPMGEoAzV/xC+OewqD4vIYOF
tG/sqXIEFDaoL3gd2ik+eczybWgVfyBtbEeK8/3TTFPo+2hy2MEOqV0KPiXAE9Un
vTsx2hWT8VtfB/easl17qYW+ECOUd27SgKwgM6zEP67cgc+UOfqetPkdUJTPslp5
KMzNaixqWYE9R3Ajnvh6HrAfgGV6TOL0jYMDt0QICBY5NmRmA7k=
=GZB6
-----END PGP SIGNATURE-----

--eHhjakXzOLJAF9wJ--
