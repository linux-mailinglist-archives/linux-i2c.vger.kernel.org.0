Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 031E8340400
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Mar 2021 11:55:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbhCRKzA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Mar 2021 06:55:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:48754 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230001AbhCRKyl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 18 Mar 2021 06:54:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 86F6B64EF6;
        Thu, 18 Mar 2021 10:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616064881;
        bh=AaEM6kJP7hYl/Mke2P2Zf6SgSWc43K5KRU+P44kGtJk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DEeKQ/L/pCvN40iSreXnykHkgcmRdDfUPUjn3Vrlc/C6rlfy23UyJLLJ2pTEWsMi4
         mqyJxRThSmECucH4YN73BIOjeMKJN6DWWpU5DnrgGl7PHS0aLtAY4mI65lD1iliSv0
         DCbA10pvEcEetKPM0dT4rCmUt5sB8CHK9txeQQZAChD1O+nRQbAVE7vNJsfdcpnmWx
         Vib3QdlK0m24VNW1HFjptkxw1/bIZuykKMiu9jfgHxRmCAG+hpWxGHRrKIaOd/cp7a
         w6RTUeQJf0BHYgYITgmyx0YixukXB6TC5EcSvw0uK2icig0j3de47U/AUc0+fvztoB
         NOdFWZ89ifMAQ==
Date:   Thu, 18 Mar 2021 11:54:38 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Alain Volmat <alain.volmat@foss.st.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        pierre-yves.mordret@foss.st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@foss.st.com
Subject: Re: [PATCH 2/5] i2c: stm32f7: support DT binding i2c-analog-filter
Message-ID: <20210318105438.GD974@ninjato>
References: <1612515104-838-1-git-send-email-alain.volmat@foss.st.com>
 <1612515104-838-3-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Ycz6tD7Th1CMF4v7"
Content-Disposition: inline
In-Reply-To: <1612515104-838-3-git-send-email-alain.volmat@foss.st.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Ycz6tD7Th1CMF4v7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 05, 2021 at 09:51:41AM +0100, Alain Volmat wrote:
> Replace driver internally coded enabling/disabling of the
> analog-filter with the DT binding "i2c-analog-filter".
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Applied to for-next, thanks!


--Ycz6tD7Th1CMF4v7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBTMW0ACgkQFA3kzBSg
KbYMUhAApnGraRQyJ1+nAaJK6wla8KeEgux9k6DBuHr4IjaugpnvcFRER8pYViNZ
KrJtn0fmcGRv4pGQH/n+pPjsWxWP1rPE0z7aMuYPyXkHgxedAhY6Odu256VYJpwB
0CKsAF+FFegY3SR6tEEFEGQfI4ofDSckfG/MSExbp2y27b78BRaV2gdHkY9FVPwK
OJgrDSrvtD1LtN2Kyqyy/KOmodfzByDkE+VB1zrh6Q5p3yWbplJkNPGTxipTEfSQ
S+JI0YPSrO5p4ksIKwvPsPPL5sVA3GcsweidVvTI/8Fs8DMNY86CtGykWEZTB9QS
kYfiLfP6cB8xBLYR33dH42cwHjGMtusSb/3dYgsi8BH7GzL8uoRyRMVVZz/gndAs
8WeV+9R3LjlpalH2OD46onM75X+ax4p8GUgX5bmU2bcKdFyOxomfrtbn0vmORIsc
VGix7yvYOOGPZ5WSQ2P3lB1HNj2kGq8tEzLwSvY+MI2pa5VwE4AoNi0OmebT13xe
KvTky6rExZlj8PUeKpiHaiWLI0FomYMgnU3OBaEnBm1g0kt1rRfCLL+98zQqbbuA
5MHg68bWeiffWybr9EMHNo5JUPNpDeDG9S0M65HokSNJM3cujRORuYyRClHrAM1O
lFbHsBqkRvy8hYOP1DxobEh3cfcfnpkzt+6OwcPYjnlI5aG4s58=
=+4F8
-----END PGP SIGNATURE-----

--Ycz6tD7Th1CMF4v7--
