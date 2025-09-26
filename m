Return-Path: <linux-i2c+bounces-13213-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CCFBA4D79
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 20:09:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 953DF622757
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 18:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63DAC6ADD;
	Fri, 26 Sep 2025 18:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="QKXthnPb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1364278156
	for <linux-i2c@vger.kernel.org>; Fri, 26 Sep 2025 18:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758910084; cv=none; b=tcTGfgTqR92n9vpwtC03vlHLZ2ooDqQK5RctFMNAtsu6Wka7TmBQaOUub8tGxKm7tWEQJHcsBbhc+yg6USlt3mTz/PX8wIJAZfnyIyWPSNN0pTOluP5Rxf93OjddWkjt0vHNS39nTyxZbb8zbRIH0PfKuuMzfL+isYkT9/YmOTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758910084; c=relaxed/simple;
	bh=v+uXg6yTOOAS1Bt8kt+bYxc0L9NGhir2Ye9zUqyfTZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RdrNHW25Ux2CeRAMR6rXwTcWa9qxkfawDwJhPWjju1/1xPAQ5F7MMy1D/ZrIuwWCjO6mBkftdA58FYJHTXdoLUUuIlWtJMtry03YdPFcqqx8iv2tRzqJaQexue0PUDHbkXy3Ki4YR4gxcoFqzHcI7FXA8XLJPd+Ps/uZB5s/rvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=QKXthnPb; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=JwQ/
	f9MT81h8r6HJjsxb7bXaTh/TcOBJXUvCCBk2uRs=; b=QKXthnPbk5FvemhK0V2V
	1Sgt6DOkER8pd9s7dHnL1hb7cyfn7/B66uLktzI3QqSQ8ie9fAIHtsGKuOZpCB5l
	4E4nXKKg98VLDIhQpeA2S8oAZF6wkNBCMIn4AScXXvT8wxiSXJ7r3/uHz7RfpUKd
	6lv4HpgoRnj3L3prTAZyTlo1UYcBWU0kEQ45dIpsOx2QP2YtjPz7eql7x++v+chi
	/mBgTIdHatdxMbMRwGPRIu2HwhQ8ObDD8E2zMGgL+j4VGHdpJ/Ti0OamwiHsALnd
	eF2KSbvHjx3ZlCVqiebMT6xWc0ruZO+8yXK1yjI2j7I7AL8nlBU/XuA9Ho4XPa2O
	Ww==
Received: (qmail 2341102 invoked from network); 26 Sep 2025 20:07:55 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Sep 2025 20:07:55 +0200
X-UD-Smtp-Session: l3s3148p1@Nfc1Krg/cJsujnsI
Date: Fri, 26 Sep 2025 20:07:54 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Cezar Chiru <chiru.cezar.89@gmail.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] i2c: pcf8584: Remove debug macros from
 i2c-algo-pcf.c
Message-ID: <aNbWejNZLYGuNvCI@ninjato>
References: <aNUa-9HcQzyjZkvE@shikoro>
 <20250926154520.40583-1-chiru.cezar.89@gmail.com>
 <20250926154520.40583-2-chiru.cezar.89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q/SpaBrAtwiklvCU"
Content-Disposition: inline
In-Reply-To: <20250926154520.40583-2-chiru.cezar.89@gmail.com>


--q/SpaBrAtwiklvCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> -	DEBPROTO(printk(KERN_DEBUG "S "));
> +	printk(KERN_DEBUG "S ");

Now you print the former debug printouts unconditionally? Why is that?


--q/SpaBrAtwiklvCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjW1nYACgkQFA3kzBSg
KbYftg/9FtKnPzWZlBx+4cRBc43cvphkTyW3J6od0npjUVZtp2YLHpaa7pvo916S
l52SBqTy1D/UI17bpMrjWLTTF6ohLvDT+RNzpYNlvciOnu+dikMxyt9R9PNraddQ
u6GEWj/IEI/nKiEWzMqhfb9sW3X7dEnKWzCM4P+1L4OYhLhV4UkXbD1KiyCcPrVn
e+ScTppXyMGIjvsTlcGNwl/c//oXPjvRGdM/VqcLus9nrO8S733GxDRIH1VhuKpT
zJ8eFcHb0ZQbiNU/zYFvw9zaH1tYO53PibzYRNmLYt0rYxQDOZr0jvMiKORRreXv
h08rK6nkN8KLBUSPucEFM5LVOf0B8fst3JIPLOGFC6vvsZj8yDvMp5AxS1TuONEI
I/5qNxIbBVi5TaOPWrGHLjM+527lmjnDbX+6twAztDS9NDEICBzHvpNKrOT7uolC
mAkfJYscg3QVVv1fbWvX8QucVGI1Iu0LnGkrrnWPlHb/its/l2G0rTffSyRXb2Lk
2hsuskhSmNX1g67wTSeyih9RNvZ0RrVfBwdjsNvqH2cN7sw7grDQyOUhCoygRHQ5
li1OC1HospjORXx2YdahlSwimnRTXxxCNnmUD9F5kvzm02Y6Y4JYDHy5JCfQvRI0
pLgytxQeStJTjAPTNX2EXw8iqgpiymq2yz8V9M3OYKrFO28xRr8=
=rZHs
-----END PGP SIGNATURE-----

--q/SpaBrAtwiklvCU--

