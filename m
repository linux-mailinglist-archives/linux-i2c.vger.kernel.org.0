Return-Path: <linux-i2c+bounces-12141-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B46B19DB5
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Aug 2025 10:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A62823BB317
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Aug 2025 08:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0557823BD1B;
	Mon,  4 Aug 2025 08:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="jB+7rTtY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB1D1A727D;
	Mon,  4 Aug 2025 08:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754296542; cv=none; b=VL0iNz8aUYhs2YvAMO0xA2vjaFZRX/CfBnXyZjW/+aFG4XRqQrVnZErLJH3diZOiprznL0fHqaybpxYaZXEjerW5kqMTEhcMZT119DQBTtv3sL8zf3nivMlno3oLLa5j0pJiNwuVi1dZ1QIDK47tfivvtH2oRx9CLXXNYwVmpyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754296542; c=relaxed/simple;
	bh=KJeshaXOoAQplubsSIpUpYLy4IncQrHXn8wz9Seb5WE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P8wTjh7SIou0bkxP46t0afn9sxe5B/qqZ5OC9xy7OqOAc4nHra/kNE0AvSobljKl7xKwCcGiy10/oE+cBZbAVL5Y91Q4K93YldyXN5Gb/W9c304VOsqvthNIOvjmCqPuvbFJe/MO0ZhscY0lqRyO+qF94Ibl0mF8EO3FmvbGd2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=jB+7rTtY; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1754296538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qXpu2T5TC0A7tI6IVx2VQOvPx18dKgYJpmJq26AzfwQ=;
	b=jB+7rTtY9a+nNAhZ9xUtRD+4UiSyqCKNI74/YUb5OkKbWr1zRm3o3whQe6eZbpenKM6IsU
	uqpHyp6+mcehVgOnJL4gUNFO6Et8ULSqIY8U7t4zTMGMiCDmgTdxhruHXYfzD8yed6PewA
	5RdNyq/PKmQwELHMl8fx30bVoM60iNg=
From: Sven Eckelmann <sven@narfation.org>
To: Andi Shyti <andi.shyti@kernel.org>,
 Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jonas Jelonek <jelonek.jonas@gmail.com>,
 Harshal Gohel <hg@simonwunderlich.de>,
 Simon Wunderlich <sw@simonwunderlich.de>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v2 0/4] i2c: rtl9300: Fix multi-byte I2C operations
Date: Mon, 04 Aug 2025 10:35:35 +0200
Message-ID: <10701742.nUPlyArG6x@ripper>
In-Reply-To: <4152a424-13ea-4437-b9e9-f1b5561cca9e@alliedtelesis.co.nz>
References:
 <20250803-i2c-rtl9300-multi-byte-v2-0-9b7b759fe2b6@narfation.org>
 <4152a424-13ea-4437-b9e9-f1b5561cca9e@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2319187.iZASKD2KPV";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2319187.iZASKD2KPV
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
Date: Mon, 04 Aug 2025 10:35:35 +0200
Message-ID: <10701742.nUPlyArG6x@ripper>
MIME-Version: 1.0

On Monday, 4 August 2025 00:39:40 CEST Chris Packham wrote:
> For the series
> 
> Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Thank you.

> Note that I've only got the same simple eeprom devices that I did the 
> initial development on so I don't think I've really exercised the block 
> data paths but I can say the changes don't appear to have regressed 
> anything.

I can understand this problem quite well. We can all only try our best and 
then hope that someone with the actual HW can figure out the specific parts 
which we didn't had access to.


> Is you series intended to apply on top of Jonas's? I'm trying to apply 
> yours alone (for various reasons happens to be on top of net-next/main) 
> and I'm getting conflicts.


No, I prepare something for downstream testing (with Jonas' patch): 
https://github.com/openwrt/openwrt/pull/19577#discussion_r2248520949

> Conflict appears to be with 
> https://lore.kernel.org/all/20250615235248.529019-1-alexguo1023@gmail.com/

Thanks, I was not aware of this specific one. I don't exactly know the repo 
structure for I2C Host drivers. But 
git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git
i2c/i2c-host-fixes or i2c/i2c-host-next didn't had this patch. I've also 
checked linux-next and couldn't find the patch at the moment. 

I am guessing it is the best when I resent this patch as part of my patchset 
and modify my patches accordingly. The resent will then be done this evening 
(GMT+2). Preview can be found at
https://git.open-mesh.org/linux-merge.git/log/?h=b4/i2c-rtl9300-multi-byte

I've also checked linux-next and couldn't find the patch at the moment.

Kind regards,
	Sven
--nextPart2319187.iZASKD2KPV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCaJBw1wAKCRBND3cr0xT1
yy6oAP9hBdk7tfOPnA9EvlD4gzBeRBG+RUSnHvWWMyzmNxAhawEA7E9Yn6hsRlWA
ke+xS8IzJ0C11K6ritkLelvCob0tigk=
=oXed
-----END PGP SIGNATURE-----

--nextPart2319187.iZASKD2KPV--




