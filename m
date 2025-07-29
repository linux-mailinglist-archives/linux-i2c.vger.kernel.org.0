Return-Path: <linux-i2c+bounces-12069-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4F7B14F06
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jul 2025 16:05:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F73918874EC
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jul 2025 14:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B611C5F06;
	Tue, 29 Jul 2025 14:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RyL2F7/H"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856C512B94;
	Tue, 29 Jul 2025 14:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753797947; cv=none; b=FD+1+bx8AwoFETq5koLsiHL1IaahuNFcP+k6SgFoRKdQOmEMP24yK5UBfLOZt9JsZr3E7FCaoXdu9aR7tamOZqBOQFGlMmd4Bu79QAXSHPqBqqAnSZxsEGl5MiFGT1se89+fYtjoe/wG8RTuGJbffMgig0qTpOw0kGsNb0SxkFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753797947; c=relaxed/simple;
	bh=kNhX9nMatP8g/CbICaKUoCj+mAKxEZssu+yPTV2mYxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ixwVZfRu2CEyp4LoiTUX+7PQiolP8qCuJydDTGJCKJCwiDmXEd/IV9hWbXkbiWmEOjfl8VCRlNdBiJniwApX3TCN4FshlHvxLO5KcEdYog3X6ibH0aJQyFRQde1OG0cct2EGDFZQGv15f8DfMSCG+WrHzXPPyFPKgMqLFnK9NTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RyL2F7/H; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b78127c5d1so1876373f8f.3;
        Tue, 29 Jul 2025 07:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753797943; x=1754402743; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rprcdj1nFAqXfdxmxGkMV6IQ2YBvlkL6JUKhxwsP4ag=;
        b=RyL2F7/HqDvkhEHPO7GBPiFxTTuwutWIx57RvEpWE83UXQQfwe/uobH5vf+3hIwsnK
         dOqQd/0yj/k7lp549ZEoCqMDds93A8bV3Eh6iDx0z0ASs4nXY2CNR54OtYgEShyZB6lG
         hbqclcvnzVSs1MTlBJLi5crXkrYRBJrK4U434ZSfCm+VZPdqBGUGKTt4HtKVBnEWVzyg
         3Uv/7GGKkk7N3rIc++JG6x+hTlMAUdTSWO1SwZnyNMPU0dydVHEgX0hDrzcNE0pL0+gh
         O+cXMBiQEsook7r47yvQvfTUYgPr3QUO2WYZBfe2W9el06deqB4nWRbmf+z6chpXQjyb
         5Drg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753797943; x=1754402743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rprcdj1nFAqXfdxmxGkMV6IQ2YBvlkL6JUKhxwsP4ag=;
        b=C1WJOo3vtHJ4NRT0hU3J8KZrI2JNZ1AhlHIbYlHyDvxVM4ZR23S1bbUXqx7AF3ucMQ
         cMpLMKtYmSrE5JO1iRbTz4IeVT/birl+NXiVeYi04PEARqNRyyoRRFqcdQgip8HWqdmy
         7EOKky9Y2f4txN8aZPFJbyF/3DuMo8oZ6akEkX38cvWZd9bh13+y3PeE0M3gVY11+fQe
         2zp2WTrNLjAkinBs46LBLbutUUVOp9GzfIewLfF668sWMqSk5OuoqEfHYssZHY5RmV6H
         rf6/H3ClAfx7YGe1GThdW5qCD7lle85pRVSZgH8GZs7vM83Uh57NLGg7m6QDppLfFQa8
         V1pg==
X-Forwarded-Encrypted: i=1; AJvYcCUOmArNd2fdzKMgtXvQq3efgpozrbHTH8HTorC/8kPqHPPGAzR4amn7jay8BwPY24bug09V4irLD/of@vger.kernel.org, AJvYcCUTjbpK/jJhiawTm4V5k2UiW1cMu2DUfG8G0rFEDI2zuCVULuDD3HBz3JSKcpl+iz4jaAeKFjji/khV@vger.kernel.org, AJvYcCWYPU0frEtHsY1j2LeHm3I0SQLMdHK9pJDT6ygCtVxxligL4fg0qHpsslHlwdpnf0fAD+e7oElhvUUy@vger.kernel.org, AJvYcCWoT1ofLu3n7vNaBN3WDsykBFyXnBBApcDcZhhFAfuGopqtKXhYxUCww+aEtbdjU6ZhbkRvt1BIF2y222g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwYHZfdg8eldy4aOZFMZtxD1DMrQj35eZTsqCw/lauoJi5xEH9
	kLCOcQSMM7IBuQEKkMHrx2unmf/f8SKrWrGZblEL1AHFEXG6NVcP0JAi
X-Gm-Gg: ASbGncvOOykzPY9T9vVBqAXWXrCCaJ8ljo9KarfQJs6eUTfEYqhuQ8iozKGhWfrsoP8
	+Ft8Z65M+WI6zJsaT19daCNkGR6gKD1UbdfrYj+q/YyKk/riscgsWEV+ToZvA9rmL2gGfIp3H92
	inTxfLCeKAzt62I63AD/p94KE96Yhwo6DsWkjGXSGS0YbFzRI1TaaPI5nDjHgJ+elO7fu/+Y4Jv
	ghScmR21QcZJrXcDgODFnHGMo0LwiHVhjbrAKP5OtFbYReAMC91mevwuzm5O+tfwDphzMBEqwJq
	QuZkj5foQ6F2v48wYUrJNw2OruPE2DHXkxBLN4gsajWSXsHlU7vrOHYnNWO9dJzqWg3+4gs2+n3
	79pSSd7jf6nmZJapzemonsn4rCe57Uo02hj6FQ1ZxFSywjusqUxsyufOFN755FnGDdO4eMGHeU2
	UF679/UHGz
X-Google-Smtp-Source: AGHT+IFZaUQwrxBlhVbnkLnmd8kchOhU8OOpW0F01eP0B+ajXj5NJu3Ugnkm2hEXTQpWoTAzFJ9BtA==
X-Received: by 2002:a05:6000:1a8f:b0:3b7:907d:41c with SMTP id ffacd0b85a97d-3b7907d0696mr2189740f8f.35.1753797942493;
        Tue, 29 Jul 2025 07:05:42 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458705377dasm200207535e9.4.2025.07.29.07.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 07:05:41 -0700 (PDT)
Date: Tue, 29 Jul 2025 16:05:39 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, 
	Rajesh Gumasta <rgumasta@nvidia.com>, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	andi.shyti@kernel.org, ulf.hansson@linaro.org, kyarlagadda@nvidia.com, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-mmc@vger.kernel.org, andersson@kernel.org, sjg@chromium.org, nm@ti.com
Subject: Re: [PATCH V3 1/3] dt-binding: Add register-settings binding
Message-ID: <33wpprxurmuorivfp4crcyzjgkrnpb6t5oewhg6adw7uhyib32@7foqh5v6ujdv>
References: <20250725052225.23510-1-rgumasta@nvidia.com>
 <20250725052225.23510-2-rgumasta@nvidia.com>
 <1a6f4194-de77-4dca-b2e8-2b51a106d770@kernel.org>
 <dc4ed9fd-2da1-4d9b-b8f1-446ea0697385@nvidia.com>
 <a6268cd4-4a7e-498e-9787-bec959bb1475@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ed2rfe7qzgwvgvkr"
Content-Disposition: inline
In-Reply-To: <a6268cd4-4a7e-498e-9787-bec959bb1475@kernel.org>


--ed2rfe7qzgwvgvkr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH V3 1/3] dt-binding: Add register-settings binding
MIME-Version: 1.0

On Tue, Jul 29, 2025 at 11:28:43AM +0200, Krzysztof Kozlowski wrote:
> On 29/07/2025 11:15, Jon Hunter wrote:
> >=20
> > On 25/07/2025 07:47, Krzysztof Kozlowski wrote:
> >> On 25/07/2025 07:22, Rajesh Gumasta wrote:
> >>> +description: |
> >>> +  Register Settings provides a generic way to specify register confi=
gurations
> >>> +  for any hardware controllers. Settings are specified under a "reg-=
settings"
> >>> +  sub-node under the controller device tree node. It allows defining=
 both
> >>> +  default and operating mode specific register settings in the devic=
e tree.
> >>> +
> >>> +properties:
> >>> +  reg-settings:
> >>> +    type: object
> >>> +    description: |
> >>> +      Container node for register settings configurations. Each chil=
d node
> >>> +      represents a specific configuration mode or operating conditio=
n.
> >>> +
> >>> +    additionalProperties:
> >>> +      type: object
> >>
> >> I don't understand what does this binding bring. It is empty.
> >=20
> >=20
> > Yes this is very much similar to the pinctrl.yaml that defines a=20
> > top-level object that can then be used by different devices and those=
=20
>=20
> No, it is not similar. pinctrl.yaml defines common properties and common
> schema for class of devices - pin controllers.
>=20
> There is nothing common here, nothing defined except that you have
> unspecified children nodes.

This is supposed to be very generic and it needs to be by its nature.

> > devices can then define the properties they need. So the examples for=
=20
> > I2C and MMC really demonstrate how this would be used in the subsequent=
=20
> > patches. Obviously we are open to any ideas on how if there are better=
=20
> > or preferred ways to do this.
>=20
> I don't see this part addressing comments from Rob - you need more users
> of this. Adding fake (empty, no-op) common schema is not solving it.

Bjorn, Simon and Nishanth are Cc'ed on this series since they expressed
interest in this kind of functionality, so I expect that we'll see other
users of this eventually.

However, we do have to get the ball rolling and propose something that
we think can work for a number of cases, so that's what this is.

Thierry

--ed2rfe7qzgwvgvkr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmiI1S8ACgkQ3SOs138+
s6FRUQ/9HORCi3QODo+X7pa+WYsYlZ4zhuhvsmDsbJ1x3dcsqHz6YrlvSurSgn6T
1mmDUYaA+QnkOpyIBsQ76zMyqoxwX8TD3ogtAZGjZX8ZjXmtQMRD5XnTjG7UhA3t
K0jfAZzCMmp/s/+2DtFreHPUS3a2/BkgD92EG49HItgTW88H/e1FW5CQkH9ur/Wd
Uu27xy7U5YmaNRS0sYra/B58UPJ3mMHJ1lqjjSOQUlfn9rbjFTyXFuLPVLBOkBag
y5+DoKASAdHON67N2gXZl3qeDdvE9+vyUmsuphZwm0Fp5ekW3nPrTx7jXFHehLbd
7vBNf80oRV9+QuUUaKWbCvrZelk537jvzEanBzVK8QE73QVJGT4Bxr33StW7Pans
24YOfLjfhbN9S2NCxqarCZ72LJUManEREX4dY6+N+tnszuj1DOV4KmXjX1XSXp5m
cR3W7StSdSNkMO7n43MMqu++bn1bkv1jCwE1/HC9eSKIbiGNbPv7/3kERzIlb/cl
zrI3pefPk5sDcheI/A1FzSA/7RDoi4iSY73+ur+jAvJCPqF3juwVE4AJnNKnaI/j
/HIn0Su0wiKjaXuYuCM4k8KxZsJyAj1p3bj46K3Tiu1ALrLPOWIaPZHcsd8q2HAb
FbYs8TwIPYxzSklfYhVSguF7faO23hhXRku4wg28M6vfLQhEsRA=
=gNJZ
-----END PGP SIGNATURE-----

--ed2rfe7qzgwvgvkr--

