Return-Path: <linux-i2c+bounces-962-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E10A881C8A9
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 12:00:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F7421C22084
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 11:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B67C6156C4;
	Fri, 22 Dec 2023 11:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="py0O6XrF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F6414F92
	for <linux-i2c@vger.kernel.org>; Fri, 22 Dec 2023 11:00:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6363AC433C8;
	Fri, 22 Dec 2023 11:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703242848;
	bh=4lsSVtRUlPIeuJJRVknr6W6pAvQF8MSxPbpZHR/zceA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=py0O6XrFEbF5kXQU8L75LARhrlyYuXUjihEnEqbHkUWLay705XzCdIJ/waRa5QS2l
	 YUHuCJRu9xskjs2Ufha9Bs/kg+SJlz3sJj+GODEelWMpTX8YnfmhT/Tkdduhfqj8bm
	 rz6Pa44NRebMVjTkrc4aBaKu+H7OLu/NakMfe8xiRwrPGjwQ7Bbbad4UyuZ95jO7dD
	 qCSMlIPcDdcFuoYuK0qonQi6dHqZF+oDRqXeoIr0YqROJd+QgOICMvmtI4oEKcbGg5
	 Oj9y2vy8axPhi1xJlZgcqKbAIahu+euBT2yEGRoK11BorLGnRtQS27NV9BE7INRQWr
	 FhzxuMa0GOUJw==
Date: Fri, 22 Dec 2023 12:00:44 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Hans Hu <HansHu-oc@zhaoxin.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
Subject: Re: [PATCH v3 07/12] i2c: wmt: create wmt_i2c_init for general init
Message-ID: <ZYVsXPFyZpSzjBeB@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Hans Hu <HansHu-oc@zhaoxin.com>, andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
References: <cover.1698889581.git.hanshu-oc@zhaoxin.com>
 <c3035b20e11b8c44eff7e9c4d4d69875313d0697.1698889581.git.hanshu-oc@zhaoxin.com>
 <ZYVkR8wSC7gc7kfO@shikoro>
 <dd5bad07-8cb8-4465-a5d2-2f5659dea53f@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ms3oK1ObAnb8yUmX"
Content-Disposition: inline
In-Reply-To: <dd5bad07-8cb8-4465-a5d2-2f5659dea53f@zhaoxin.com>


--Ms3oK1ObAnb8yUmX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> Thanks for your review, I will rebase this series on your last for-next
> branch.

Thanks, I pushed it now.


--Ms3oK1ObAnb8yUmX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWFbFwACgkQFA3kzBSg
Kba1aA//XC21dTv//hveMkMzil60mJ/5BdP7IVavQqXlIA+4X6mpJuTdM7mevAHL
pTn9fTrFUXakrh0C5hdfbeL6tCSqciPzW2VtIOeCR2vTCs9aDuz3ZN+hpiPn9ojX
XxttRpW8LsrwnPNOxwtvwJ6zhCWMIgUPxCFCtQyrmAD81qYjMiINj+o8qCVWU028
inEY2MnsyBgVOFA+J5EdoUmuyH/v6lQKx38uLHLe3NkGRwHISxfkMPz6x5Bwa2Cg
+c88UJ/5NZ4zj3l+fu4QSq1R8d445SlVqmEYwC/ywbkzlwUwIlSfvdyZBcsPnDay
bNym4m2PV2j7bObIwc3xE0Zu7JdZyk7dtS0BfAqEYIHiJL1YfyZLSLt69j8Y+Arl
RM12SV9GKm8RLZBF2yWd3zANaU8K6LqwbAE9nu6P4kp5uwN+plCgMZCnoBdk/sZU
n2R1c/b1a+lKN5ML2HrqnKW9JBOnHR96eWM7Av270MQLIvQ8RlUOS0HHE7cwzJxs
TPTqnzHVMQPd+GieJ09y5uC/0RJ3TUZwmYMqquordbd83GBIEk8alT+gW81+CA7z
VJ5G1U0TuzQ0Q33s8VLap1MHnNAOmVjUBheyLvM+i5b6Iz0PEI8ZjMQyLaaO9Fvh
fpBp9yI7DN4OP2bqfB60wHn8/bxvqh95CX+fkhT+1q3HRb21n2s=
=jXQu
-----END PGP SIGNATURE-----

--Ms3oK1ObAnb8yUmX--

