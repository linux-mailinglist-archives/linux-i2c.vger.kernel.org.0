Return-Path: <linux-i2c+bounces-879-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FBC818DB7
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 18:15:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F78A286299
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 17:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E87328BE;
	Tue, 19 Dec 2023 17:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lB4sf3Ab"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E13C31A71
	for <linux-i2c@vger.kernel.org>; Tue, 19 Dec 2023 17:15:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0835EC433CA;
	Tue, 19 Dec 2023 17:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703006103;
	bh=3RNCh4FuLOdiuY50xSoF0bFgs7iqSss1AKXgt3Wqwi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lB4sf3AbE9mtekgSdKtL/Ho6CvKCy/bEjLUMkBlA7RCzXs5Zylvfkqp+m7IFRyleU
	 rfVMFezLJwo8fTT1+AxALWpYGEPPWZPSg1rsNBCYcopvFuUzYEKi9NRgC85TAab7pD
	 KiX7KcIAqaDVg2ivIHXcI91X4uObFVsRZGHyuJ8VSSlb50wJ1MDI4vCA7W/EaitsMe
	 DVseUybIGWIakJtZdmU8QhfVeiB61uvhUWn6AzPPKTlyOGnEsrKMF6EFnDsAw/6A5Q
	 YHfUyqIBEDdN9mNB8+DQTkj2pEOciBcPSuj2q4i+ZzQc4xHELkLG7wSorypfyiFoBq
	 +OdwB3vHOP8VQ==
Date: Tue, 19 Dec 2023 18:15:00 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Yang Yingliang <yangyingliang@huaweicloud.com>
Cc: linux-i2c@vger.kernel.org, agross@kernel.org, andersson@kernel.org,
	konrad.dybcio@linaro.org, andi.shyti@kernel.org,
	neil.armstrong@linaro.org, yangyingliang@huawei.com
Subject: Re: [PATCH] i2c: qcom-geni: fix missing clk_disable_unprepare() and
 geni_se_resources_off()
Message-ID: <ZYHPlBdlqWWrGa+f@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Yang Yingliang <yangyingliang@huaweicloud.com>,
	linux-i2c@vger.kernel.org, agross@kernel.org, andersson@kernel.org,
	konrad.dybcio@linaro.org, andi.shyti@kernel.org,
	neil.armstrong@linaro.org, yangyingliang@huawei.com
References: <20231130014324.2483816-1-yangyingliang@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FEER8h621Uf2ujP+"
Content-Disposition: inline
In-Reply-To: <20231130014324.2483816-1-yangyingliang@huaweicloud.com>


--FEER8h621Uf2ujP+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 09:43:24AM +0800, Yang Yingliang wrote:
> From: Yang Yingliang <yangyingliang@huawei.com>
>=20
> Add missing clk_disable_unprepare() and geni_se_resources_off() in the er=
ror
> path in geni_i2c_probe().
>=20
> Fixes: 14d02fbadb5d ("i2c: qcom-geni: add desc struct to prepare support =
for I2C Master Hub variant")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Applied to for-current, thanks!


--FEER8h621Uf2ujP+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWBz5MACgkQFA3kzBSg
Kbb+cA//eR20B1iWnPJsh7K2v66jxy+lnbpdJnNEjbpP+Yea2dTm4U/deidwZa5K
96UWoK5p/4LtZlCIh6Qv0rb90KcnHfr7EHxpnqH3zZ7rLt+MJjqi2/+wULDDgKGL
M4vitl+KPlIChd27CeIxRZEhbfv5q0E9cQ/8dB8GC8DUneH2mmytZmysjItDd9Sd
3QJGXXMrTCYpVNRSLm7O3JIulSfhMIp00nnq1V6QonS0r9CEknqE/F2U5mIIJLog
6AZ3LGKr53Rm7DPAtV1lam9J0dtXikWoKvdLFgHbGrOhTM6zc6PjUTMQj+yOMCg0
jzkZfJntASAosGO5PM1DfdAQrtm6VKpIMb+asOkVij+JaqzI/d8Prz8TAKQbzOr8
+89AXog7MVTL0Mv/4hRyWp0CpnyCnW1Tzq9i2L/j81nGlCyR661816+dp5L7vcIO
x/rboExBE77n9y6HlDPBhuJbRImC2Bd2jtXkeg7+ZVZoKmNx1KiTF3vdSgO4hSd3
ZCDIaeKwSV7i+BWvU8JPxx2AZHOuCv36I5IBgqhIVZBGt0i0iVGRtbQFC2QX7BKy
LcUVi4iBz67pwSaqBALYaFcc8KGkagZC4KW7U3hkDa2nKjDNR4+J9lNqZ5B2Qcoy
L+IPpiQcutKcb86I17myIrkx75LRDea31elU6pAddiPjo73Givg=
=ghmD
-----END PGP SIGNATURE-----

--FEER8h621Uf2ujP+--

