Return-Path: <linux-i2c+bounces-10007-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B454CA6EC63
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Mar 2025 10:24:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8106B1890B74
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Mar 2025 09:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2FF91EB9F4;
	Tue, 25 Mar 2025 09:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="TNZotc1l"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAC319B5B4
	for <linux-i2c@vger.kernel.org>; Tue, 25 Mar 2025 09:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742894648; cv=none; b=YvBQ1ZD2WgCQaH5eEiK1n9s8U6zxkjWdmYIvV5lyzMBFJR5hhk7PcKA5pggcdsfcc+GPEbLVeIDifJpoKZbBOzfE0maNOrsHBUKzaXsPcyY1nvWcnx7jLVRdIV4l9vK7/l+StrNGDrN3lzDlI2rXuYRZ4rNW2w8pRaZuyTDXRRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742894648; c=relaxed/simple;
	bh=WKSdyyWdbOrrB2GtMXBa3yozgKmGzqntr0g9P6Fuj0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a+SuJ/TRI6gTXiz7Ygm3UGCtr2GcsC6yB85+V4rsYRjJIvjUKVhWTQDeXKpqoyO6JtvjNHKd2zKfoHHsMx1GJIdFLVZ5lwGvMXm0Rel/V5YCDFwthO88d7+ezX9pLg8wIboKQyKJMLiifITcwETFSxzi+7KRjrHSD2EowOZYzB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=TNZotc1l; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=M2XC
	jN8ZzB8SWx2S8eg0fINVA/TLJBMOOUyiFYmczRE=; b=TNZotc1l21HpNgiHMcjw
	kA6m+17/ldkX7TCKYgobUoEry2Duy+052aO76l2UckjkmgCs5sdVxln6PmVd9LIr
	/O3jxBw09RSZeZRlyvqa0BuWLr3u2zaOZxNfA74la2RxLpWn14mnc7WujZmX5Wb6
	wwM0WaTJ3hDZSM4j9CRTN1ZojTno4vPyNAjDk1hkO4rlPX/Ue57eFYjcGSiawIbD
	nUpvPInXaOQr94JvLsAMUTm8fNX1BZY+2uyz960TXho9NBdLDU0idHYbcgxERSyc
	/d/kgPmDK6x9e8DwCREDKaJHGMm7VD+z4jACJqgicNNaHrOUqcGjLvC5HWkm4HEm
	mQ==
Received: (qmail 2971569 invoked from network); 25 Mar 2025 10:24:02 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Mar 2025 10:24:02 +0100
X-UD-Smtp-Session: l3s3148p1@biAASCcx/N4gAwDPXyTHAJp038nK7dx+
Date: Tue, 25 Mar 2025 10:24:01 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: tglx@linutronix.de, maz@kernel.org, linux-kernel@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 19/57] irqdomain: i2c: Switch to
 irq_domain_create_linear()
Message-ID: <Z-J2MYLduKQG_hMN@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>, tglx@linutronix.de,
	maz@kernel.org, linux-kernel@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>,
	linux-i2c@vger.kernel.org
References: <20250319092951.37667-1-jirislaby@kernel.org>
 <20250319092951.37667-20-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5lHTfxxyxduE7jo5"
Content-Disposition: inline
In-Reply-To: <20250319092951.37667-20-jirislaby@kernel.org>


--5lHTfxxyxduE7jo5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	data->irq = irq_domain_create_linear(of_fwnode_handle(client->dev.of_node),
> +					     data->chip->nchans,
> +					     &irq_domain_simple_ops, data);

Waiting for v3 here because of the suggested switch to dev_fwnode().


--5lHTfxxyxduE7jo5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfidi0ACgkQFA3kzBSg
KbYCng/+OYOcM/oJ5CdKuJYVo3ZPnr4K0F3yC2hSjh8NgMJIGa/dGhovGlBYF53j
zqALsQeAsbi5nMLAoVW8qLL0ldZEYevKndyUi13NLxXzTZTA6VlihbTPEqTNUNPY
v6/UG4AYriJHj3fkMPWdxrma8lCyho5d4RwTXp/4rUAzLgssMVT44vJHvABL0bSf
QjIPkBzhs3eyLnWcAxrB6UjwnrnJo6f0LHUWXW0ylE1nxRdJQb5+vcWE16nqqDoP
WDdyxSwGb4RNmR+ys1RzZY8k1lmAbOeLGXKirwGCk71VzKugOdjV6WBt5ro2Yzro
/C0YXdTlRkA1RrzvRxJgVLCwF1pK0Fn3Trp/RJe+BNVpQoAiCQcR5K8ODlQs7p6M
FrqkmcR+YBuNjW+ca3NZUgGvJZ0/fBdpBc+0IvNUw1owfezXsCEJwQRhksyCYzKS
bfoP3jnN8u6HRD9guy/wVsIVywlxKf1/uaEUhV7sLJONTz41OqZOTt7gmricK4HN
MnI5fk05TU7P1UxVY0SkxIoaON4t0/AkAH3JZ7XhDVkUsuBPuRebDZlsMe9nV5sw
lwMPCmBdmtwEdLid0UNiAbjOu3+YOwq2o3KfRmBEhWGdDDIrL+wqG6JPDS4xv+1b
mXxFyEZ8uT7SyslHmtYQOKn2Dz7HWq9dTMYLBBxBu06W7LJvN2U=
=YqdK
-----END PGP SIGNATURE-----

--5lHTfxxyxduE7jo5--

