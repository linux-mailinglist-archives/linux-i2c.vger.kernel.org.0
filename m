Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EB614BB5CD
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Feb 2022 10:42:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233498AbiBRJmB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Feb 2022 04:42:01 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233543AbiBRJmA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Feb 2022 04:42:00 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AD9913E94
        for <linux-i2c@vger.kernel.org>; Fri, 18 Feb 2022 01:41:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6F40661CCF
        for <linux-i2c@vger.kernel.org>; Fri, 18 Feb 2022 09:41:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D69AFC340E9;
        Fri, 18 Feb 2022 09:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645177302;
        bh=/R8uF8dzNHAZmMu5YikqJCxQvPfMzmexkLQ/rRmy6yM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZYHHYLHElDT7oMVs7+wr9eCyorH11xsqoUXkpRu34fyljbXvzKyiVgYs6zck3aL2x
         wHTLc6ydwpGQZsFbVTFbET/w7N+GBnIOsWoWcgud9DfGURhe/kEDYD2cZox4sS5McK
         wh4XlbiJu0IR1kk+Ar9AT9ZHF4xgIZIPx74a5I0vht37OXzKYVrMbsZG8syvzw4QFO
         zui+a+PBljkCKd4W4f4EPEsiswpF9GIe6/vH6BN0Wml+sfuWWU1mJbyaa1JFc9xdXB
         PAgBnx7r83VwUM35SR+ANMfIkbOI4vqvTGs9zVqRSegD4ihNel1tZ08DeEIUkvVJTK
         kmLuO6A7O7RKw==
Date:   Fri, 18 Feb 2022 10:41:37 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Kamal Dasu <kdasu.kdev@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] i2c: brcmstb: fix support for DSL and CM variants
Message-ID: <Yg9p0S2IOoN+JSdx@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20220215072735.17335-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ONDGHLLX+Dwhp+xp"
Content-Disposition: inline
In-Reply-To: <20220215072735.17335-1-zajec5@gmail.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ONDGHLLX+Dwhp+xp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 08:27:35AM +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> DSL and CM (Cable Modem) support 8 B max transfer size and have a custom
> DT binding for that reason. This driver was checking for a wrong
> "compatible" however which resulted in an incorrect setup.
>=20
> Fixes: e2e5a2c61837 ("i2c: brcmstb: Adding support for CM and DSL SoCs")
> Cc: Kamal Dasu <kdasu.kdev@gmail.com>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Applied to for-current, thanks!


--ONDGHLLX+Dwhp+xp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIPadEACgkQFA3kzBSg
KbbhahAAgP93S+7PGhcPiSgcmwsj3QAT6M0MgFScgPZdxtfAQ3Zag4Zu2Yepq76j
ZYIREvSVP7Oi3xHSZ/84vrIegGn8MMFFWl/DEiWHilQKx/awQ/tJctVXH8VmNseU
SgsyEIGYqm7qOqSK14Kq7WuN170t3S/sPcj4OTJuoXY/SHcTS5OQYApG2WMFcvXK
Q4udFcfTxh4mOWOWQC0hq0cREBTaeD/QEU5yiw7D8s6hlopyP5W9tgYLO5D+ZsV2
buKE5InolvH+V+rVDvJ1Z4ZSRMO444XkZb5aSe+Dqa+TXHY4xUFfJ2QnmlzcCHVm
QbgyvgN8tOVsD9RqVBXLR2KfnFDzKqmaIbXiAGnGA3rbGLKT66wvCBDgy8Iw77LG
IEZm4FAofUXNaumJTbueVhG/lk8LfcUZgGp1FLDQG35bAHaD/m7echUzWas6T8K+
9xWTOrWSAOyZQSVAhLBz1Y9AhFzDfgugQU4f8bmEIw0HS7KFIeeg5h6QciMtBXRa
IU/Nr7luGDz8ujxZfcJUGGG8cWk/MoBcqRscxkBEp1ChFTN0IQI+WJlD9IxHqsqf
4j2qeZ2imMLR9lGQmXCRB/jn6GZScLq+EobJ6uYSep9QNrte+V8f/gu1PQi1SXha
BQ8daBnOmFq00uTy59yBINwHrevnT7q0mHJVRf+aNdHMUchaFOw=
=pHEE
-----END PGP SIGNATURE-----

--ONDGHLLX+Dwhp+xp--
