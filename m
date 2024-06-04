Return-Path: <linux-i2c+bounces-3780-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 803618FAC8A
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 09:52:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C918B21B14
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 07:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A73E1420CA;
	Tue,  4 Jun 2024 07:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lmd+Glju"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3CB140E22
	for <linux-i2c@vger.kernel.org>; Tue,  4 Jun 2024 07:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717487556; cv=none; b=EMkNRDFqF1TEW458RCPMWz1tx/QCKWB/FmvgzU6VMg/zDkz0KO8AzHjCC12uItnYYz8bB8sw95Z0d2bPMZCKhVstTwwjLhOdHSW57kH3l7JtYn2Zyj0PDj++WS60h9ttNkWqCK8VjlnS7JW0cA3sbUtzTnGkqJ0ceP2crAVJHVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717487556; c=relaxed/simple;
	bh=7FwB3nh1ferhUN8F1AXZaJmUS/9xCv9OYccjoPM7BDg=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AwPxK+PP0EAFpNoaRjWnjoQJobDLuJIVyhCwoEhk06AG7e2ma1m8WD35jrs37X4D1aJLnQqNm+tRssCDm//+87wxYY26CWO7pc0dJwO4JrnJ5oTHJDv0hCffSZjDJsSNP6fphAWxAaQ5Y/lV/3lSH/l8d9WNc0bAeurE0lNV8vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lmd+Glju; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=7FwB
	3nh1ferhUN8F1AXZaJmUS/9xCv9OYccjoPM7BDg=; b=lmd+GljuCk2T/uoLtVq6
	vdhfRilml3TuNPNpb3hfMvYkbP6WJR01wbk64BFCSOtOAS6RGDUGY62XGZj01Xmv
	n5n0ttdRE1xjWA7c/sZICWiVhA9mzI4FgKfQgKNayR8tX1LVgTsIQ63EsYWLqDKV
	ww0DIipdtvxt2W4v4P0lB+26ZnxV2tXmOlhMIXwrl9wMjKkOLaBKVR0e1fz3fY3I
	oo5YknZEQlBtbsVgJfMY6Q9nY5OQPs3soST+kSKBcL8heiWUStJ28ZZQqwYD5X3d
	DnaObnx6fvQHuzJ7sXzzfopgRZYTQwpuYUpsLn/4AsnHTuYoxiXE6BcUXPleGfdJ
	aA==
Received: (qmail 2210011 invoked from network); 4 Jun 2024 09:52:32 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jun 2024 09:52:32 +0200
X-UD-Smtp-Session: l3s3148p1@s/10uwsabN0gAwDPXzLGAH1eNELjOc3g
Date: Tue, 4 Jun 2024 09:52:32 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>, 
	Paul Menzel <pmenzel@molgen.mpg.de>, Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: smbus: Log (LP)DDR5 type specific unimplemented
 message in `i2c_register_spd()`
Message-ID: <pdxpacfmgmyqltigevalitf2q3tdty5nud3wdyjgmjfswwkmg7@vuwuirl3vpmz>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>, Paul Menzel <pmenzel@molgen.mpg.de>, 
	Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240530183444.9312-2-pmenzel@molgen.mpg.de>
 <66acde9a-b453-465d-8b44-2bfc2164cdbb@t-8ch.de>
 <tdia472d4pow2osabef24y2ujkkquplfajxmmtk5pnxllsdxsz@wxzynz7llasr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oknbffertqzdv6fi"
Content-Disposition: inline
In-Reply-To: <tdia472d4pow2osabef24y2ujkkquplfajxmmtk5pnxllsdxsz@wxzynz7llasr>


--oknbffertqzdv6fi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Sadly, no cigar yet, we need the EEPROM support.

Things got better! This patch can be discarded then.

https://lore.kernel.org/all/20240604040237.1064024-1-linux@roeck-us.net/


--oknbffertqzdv6fi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZex8AACgkQFA3kzBSg
KbZbuhAAmQmch08GVo3n/SoI8jV6HEZTyurA4gvdABpzHap9TLOgD67x027iddH7
HOc5CGuzCK6Uyy8lHVDhIbpfucLgLVWdI+8TuNHHKpRJEuFmKMCP8Cv+vvjAsVeM
LjgQ175SeiC145RTHtEGyBVOgJE9Sy9W/B8VONDJqqWPUMSBZiB6e0TXJh92ojyj
HgKeKRgWqTk52W9C278W9Sb+yGlRniv8u+z4Bod2cX1gbBbagT3DBCw6e/LNgL50
jQOJMayOjYjqkU+Vbxh+y7lhk51R2moI1YoGNdZgXTOVIYxWu4BmQF9j0rzuYlsv
U+0+rDsQq365Mjbo/omS9BQP9B11reqlTLbZb5h022/lIi4LF2cMJMDvyzn7Z8/u
vrA/a2g5TkR7DIFLgek73DbqXBAi1RcdNgg+WMQwxCetdtnyMTvee+VA9xeHfmnv
KEY4Sq6TOqkOOTfbGIysrBnBe+cfEDymG0zKFYrsp523DYGT2+VW3S2kfETk9YVf
kNA3wgkemA9scJE+E9q+5zuBp7TrPefCz4xxfxDksmbe8ZJT6uIudi1TVWG4g9L/
4osKfPfMNMrhPX6W36C4LAVO3SKBOT+QmE8/XR9oaC9lkjyRyceaCaSY0eo7Y3ol
Px5v9wfJSzA/URCohXhNxT1g9fAb+K9xUWiL0kXgreXTCDMxWUM=
=ommU
-----END PGP SIGNATURE-----

--oknbffertqzdv6fi--

