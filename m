Return-Path: <linux-i2c+bounces-2334-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEA98790D5
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Mar 2024 10:24:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E21BB22BB6
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Mar 2024 09:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 498897828B;
	Tue, 12 Mar 2024 09:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eW4gS9y3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D2C78262;
	Tue, 12 Mar 2024 09:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710235241; cv=none; b=Jk6RNPQ2eIJMUjye9G/HDaT5koRc6/37wCk4LFfeogHg8/GDtZquR0PYRKUxsVfQwCD9jh1cz71IuVd56fPxe1UQKqUR1wSE1dOhmuusSWyHiE/AO/XwvDczKnpp+ksUKGL1cmICAZn80qHBAnkXUK5L2gmoaFJDeQO5TT3LaRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710235241; c=relaxed/simple;
	bh=zxkiu9aVl8Thl9uVJ1JoV9B0j7ibOXaq9f6g5nQEndM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ag0FLqJVls6gu15xSy421QxoahnltJrxOBus+m7cyEbE8lE365llTt8RyJpIdkWP7lcLIgSNPoYyImLTI52cuhdJsplJMJQYBBP1hU960mVO32eHwL0Vt+ShCUvN65LkLIHxV7pBDXz5Db6TY3FofUVAvNT4LtVqbFdSF2GFvgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eW4gS9y3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A19DC433C7;
	Tue, 12 Mar 2024 09:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710235240;
	bh=zxkiu9aVl8Thl9uVJ1JoV9B0j7ibOXaq9f6g5nQEndM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eW4gS9y3c6ESVgdHCwyPh8dT4j7jVE5Ns+Y/Jp2Wot7zMcCeUx039VarVhmkSNaCI
	 vh9kFGjlbX6e+wHvJBaykGLQzjL+n0j2RbCStymyE8Ct2uPLt9aUl+x10x4X5PXjJF
	 UllMPXed667HVZAB56aCHxQXZPrLeVXIjZgbFsIeeTxs0pUQwGHBW1xtpHppk8zTVB
	 xsJ3NFVXQJ23Wo22FCw2ODnh1vv8TKkLajwcBlQg6TQT/zrfQ4u5locg8ajB5aDHbb
	 QowO/OXolXhjulJI4IMXEnfyghJaciZmhI/Stfa0RBri+MU20SkF11LQv2N4SMK9lH
	 KghG9PGxE4Bmg==
Date: Tue, 12 Mar 2024 10:20:37 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: konrad.dybcio@linaro.org, andersson@kernel.org, vkoul@kernel.org,
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	quic_vdadhani@quicinc.com
Subject: Re: [PATCH v3] i2c: i2c-qcom-geni: Parse Error correctly in i2c GSI
 mode
Message-ID: <ZfAeZbV0cXGR_Lkn@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, konrad.dybcio@linaro.org,
	andersson@kernel.org, vkoul@kernel.org,
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	quic_vdadhani@quicinc.com
References: <20240307205539.217204-1-quic_msavaliy@quicinc.com>
 <170993858923.2618408.4667207790973009000.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ewTupQRwbxuX6vVW"
Content-Disposition: inline
In-Reply-To: <170993858923.2618408.4667207790973009000.b4-ty@kernel.org>


--ewTupQRwbxuX6vVW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> On Fri, 08 Mar 2024 02:25:39 +0530, Mukesh Kumar Savaliya wrote:
> > I2C driver currently reports "DMA txn failed" error even though it's
> > NACK OR BUS_PROTO OR ARB_LOST. Detect NACK error when no device ACKs
> > on the bus instead of generic transfer failure which doesn't give any
> > specific clue.
> >=20
> > Make Changes inside i2c driver callback handler function
> > i2c_gpi_cb_result() to parse these errors and make sure GSI driver
> > stores the error status during error interrupt.
> >=20
> > [...]
>=20
> Applied to i2c/i2c-host on
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Because this patch touches a file in the DMA realm, we should have an
ack here from one of the maintainers. So they know and are okay with us
changing something in their area.

$ scripts/get_maintainer.pl -f drivers/dma/qcom/gpi.c
Bjorn Andersson <andersson@kernel.org>
Konrad Dybcio <konrad.dybcio@linaro.org>
Vinod Koul <vkoul@kernel.org>
linux-arm-msm@vger.kernel.org
dmaengine@vger.kernel.org
linux-kernel@vger.kernel.org


--ewTupQRwbxuX6vVW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXwHmIACgkQFA3kzBSg
KbYXUg//WE/vhqWVUyvCYAfe5NQpcr7VSpWQXTelvzhJov7fHX3qVMD5ZAzW9CSk
Vh6iDgfKCb5JRNrKSvjyPsLvv5Ld2gDglF7+wyVZYh9ZhVpp8ncad6fLuXI3cul5
mz7QRQ+R92BypzyAXEqE1jHIMgx3n4CDMBYrcJ3QLisUWzp8hPBmyTW7L/JMY3Xg
Shyf+55Ncf80CXmvL3u1k/KbpGc01KFNMKSI7I0LU/NoJ2ckiVn+eVbpsWQX0JOz
Ijso7riZWp8ltziANFSBxW0KiGpLlwnHuZUfb7gBPZ5SBNx+PVhX1SsKiw41szko
JzC0F9WTMmt5FTj2GX7AcidnhpJP/Y4oQP23Nkt5DCkuTwNx3zwqauutshYpjl8x
/KUyTCyE3eCgF6BzSt6/tWYOz7se4QTGGtAj6y/bnw3txppPOtPFoLP7b/8XPink
/oQSho2ipuxF3A1o9YjDidV5YZCdbo/aByH0WTXuALJVWbAIgw4/4iMN3zqd30nH
2jETRKrPj+AC529yh5Q/zUo1cHpNLLwIc+TblAfy0I3vL/aUiRNQssPETln5QxdW
vkciPDnGD6Ut8gM7uMSbUcsiSItdisAqbDKdR8UoSXdl6YiHIRxh081r0ZanFB8E
TGzku1i6hOgZ4L0F61zHREFxRRv+w/okp5LSv+FgHav0hKPiC0o=
=Wqz8
-----END PGP SIGNATURE-----

--ewTupQRwbxuX6vVW--

