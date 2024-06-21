Return-Path: <linux-i2c+bounces-4170-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E99BE911C60
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 09:03:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7284F1F22B38
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 07:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1AB0167D98;
	Fri, 21 Jun 2024 07:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UYmWNYpL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC5014038F
	for <linux-i2c@vger.kernel.org>; Fri, 21 Jun 2024 07:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718953412; cv=none; b=eDCY5a6Dg1ejoH0T3cHeqDgIFAFgbxMuIpwka/7X1JU3fch0Sjp4zZjWPVBjXkKfLlwgqxo2kd2eNJX0zZh0K2Hs5HKCUqSdi0EH/xYrIrJFGw9bxF97//std0gz1p9H0mVFaQbLEH7yEPExJP/gF5qAzlBsfPGj485V0NTcZrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718953412; c=relaxed/simple;
	bh=9YpIG0vywBEXYfiYSjXWZS4SaYwJoaD6O61rlDfXZsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWK7RnPTBfyIPQB+NRGaiCECfpwlRJQCvWyF7DFtntu3JakpGHpHiYs297QFijMfDUuVAdHrl2gRgEXemU3IjgmTP2r6BxxuxkHHo/x9j6bs1ebfSEdv0wk9wJt84YijWDm54m/GEepjUXPb8I0S/+JIuRC7AfjaF4SKYuTZMeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UYmWNYpL; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=9YpI
	G0vywBEXYfiYSjXWZS4SaYwJoaD6O61rlDfXZsM=; b=UYmWNYpLsZ/h0ty/oCAx
	o/NDwZnqSRD58/nLMBxymgT9cutC7ytVfIb5EqWhTaTO6IxkclIIvuz3PscTm9yN
	modIlTDV0sTggUrKuzFI1tdYWBFQX6zR8IswIYzVt9iPHlXwdE7SE/soJbgsZs/5
	1gIDQ+zny8w2/kMRguBwikKsv1VPgj2Yy8C7wJEasGr/qP0RpUVQdcWsZFqT0qjv
	tturjHksnliHbJXdqtObeSEcKo1PvNf23mQwKlSJFp0+c/f9r0qt+YDrTmGKO8W4
	qhFxkHkqe1oKUQaV80rlpUQTXH4zw6bhpO+ef8ktxrI5u8ynJ74Da7D2e5Q8taAv
	pg==
Received: (qmail 1271058 invoked from network); 21 Jun 2024 09:03:27 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jun 2024 09:03:27 +0200
X-UD-Smtp-Session: l3s3148p1@Uvc6B2Eb7tUgAwDPXzjQABqqX1QYyOSW
Date: Fri, 21 Jun 2024 09:03:27 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Easwar Hariharan <eahariha@linux.microsoft.com>, 
	linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/6] docs: i2c: summary: document 'local' and 'remote'
 targets
Message-ID: <o5sbb2yqwzm3p2elxgoq6atgbw62e7jwzim6trjswbbozkptc2@4yzoaqanmrfn>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Easwar Hariharan <eahariha@linux.microsoft.com>, 
	linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240614081239.7128-8-wsa+renesas@sang-engineering.com>
 <20240614081239.7128-13-wsa+renesas@sang-engineering.com>
 <4zxr4rlqnjqbqh3oxmd2ufqi6uk4pxa3tniuya5pgjtqi6tswc@utq4r2zt6z6b>
 <ed75fyc2xcsnwubq42eposf6ayt5aj2jmqz6mthugk6vm2zpi4@qqwlmuwayoo5>
 <y34k2k25xdr5z4v7oejp4da237s4o5qym5npihyydwlbsdh75c@vhmfl7sw3pbm>
 <7d5f800f-fc65-4fbf-adad-616d51501c62@linux.microsoft.com>
 <boehtgry7j7ulhrw7tenkmzxujahmxfn25imvb7zw2ibtmebbk@u3jryw4v2y7h>
 <cu2mkl42byhce6eytcnw7yseogbnypgtrkoirlezakwg35egdg@vjjye4ca7yey>
 <cbwamjer2rupkmyze6atgpkrszajcbhw2udb23ldl73ne3m6qr@jjs7q3codtx5>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5mhnob3uxzg2llob"
Content-Disposition: inline
In-Reply-To: <cbwamjer2rupkmyze6atgpkrszajcbhw2udb23ldl73ne3m6qr@jjs7q3codtx5>


--5mhnob3uxzg2llob
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > The refactoring only affects "master/slave" not "adapter/client". We are
> >=20
> > aligned here, aren't we?
>=20
> Yes, of course. And I'm not really asking for the totality of the
> "client"'s to be replaced, rather than, when replacing slave, to
> choose "target" over "client" whenever possible(*).

Okay, phew, seems we got it now :) I'll send out v4 today and probably
send it to Linus this week. I want this base work to be upstream ASAP,
so we can base further work on it.

Thanks for your input and cooperation, Easwar and Andi!


--5mhnob3uxzg2llob
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZ1Jb8ACgkQFA3kzBSg
KbaPXg//QldHT5fYSnWzc0KZgm0U6+CGlWXYHzQgIvHzGmo4NjKL0OnEsD2hTNly
j9eainm2OTjb1+3YrKclLIlx+paQJxVpU6TVBRa9b/CJX+j1Ub/JZu+AcO2lW6xg
dx1Iq9LQlKxFzfyzyqRy7r2UorQwvnDWWdw0DaKdhUDufJxK5jIiR0s/BMlrgsyr
K6EoIxHgJDESmRd3xzKo5rgC0vcD83Iwts1RAihuUrh6c8Wjz+xPgyhECtbH09rZ
kkvRuzwYuWas+0CX/WQNpK2S49HZTmpI5PcTmn3WAIrStfW0jmFfofkpVBvOj0Wz
T+ZKTZegE/GrUP5UBEHHkim8fjeLYj4lT8JCR8R1fOp6GVrvVlzj5VBmuAMOcPmG
OOV9gUpfOmZpSbVdr8amMcbwpZ+epwZiRZnernj9klT0EgUfFZt5tb6oLWZSb0LF
rAGL3V7txa+396EzIiLLseBJv6AxVBVqHj/yCpy+D7vRCe00QcPi2bkzEe/wLEvE
jaoZuGhNrXTGKVifwMNY8/JG2Fwrq+OYzy2f+WBNzGE5qCC0a6K3/U0vqQ2tUB7i
hg50MqNQ3ha7+F5TCA2aSHsIsVDb/mzliLw+4WBv8+1CPue92jep0FXlw05gOGDx
EEgb3Rl7Gf4ywPwvsDnnUVmvG/q12F3kqHn/nYjD21ePaN5n0Ag=
=x9EZ
-----END PGP SIGNATURE-----

--5mhnob3uxzg2llob--

