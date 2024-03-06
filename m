Return-Path: <linux-i2c+bounces-2218-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80275873CAE
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 17:54:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FB831F21B87
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 16:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 957E6137923;
	Wed,  6 Mar 2024 16:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q2AJ3Oj+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4867A136995
	for <linux-i2c@vger.kernel.org>; Wed,  6 Mar 2024 16:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709744075; cv=none; b=iw1mjLyCozhCBZZJlmMmgKFGlNe4XkrkD0L0Fm805FVZxIkOs7peK+IOQa4duKRqiHn6K2FJQxvFYIvkR6lee0OpPfH+3kG6sXgElwplqsKPd1bOXEUDu22lzfhzdVu10AD71u2Fw/mATkl/qe1Ct2uGm2Eu3lGPHnUqZmy6I+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709744075; c=relaxed/simple;
	bh=BoA4clyJGdpKOSXO4fvBLqbIDSPr9DFImpz+/s60Eno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A9AwaEaYrJIA1xBFS/wTMw6mv1cej0UHuXSWRKyZcvjV4kdyTUgkPXHhQSd4wgInom7FXT+jPP256fsjJvROhVz9zA3R6EzzNmtou1DpdOZSFShMvUQHZrsY/c17VSgt4IAw5a68xN4OkyjG0V23lhbtxcCD5TrcxaboCnFUIHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q2AJ3Oj+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6559EC433C7;
	Wed,  6 Mar 2024 16:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709744074;
	bh=BoA4clyJGdpKOSXO4fvBLqbIDSPr9DFImpz+/s60Eno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q2AJ3Oj+jf2uT81tS54rIaH4ux8Uo3ZYpQrcyY+ZMo8K3lDAqOwgmhtsik2OEE35Q
	 IJSvLwmeEwZjwzsX+1K1bA4p+nxHsuEu/dDo14a3h2QqAxgSVK04EC/GgywSg7yen8
	 wIZu5mEptWg2NNhF0HZFsAL8ror94AdKZfsMOeY1o5bKWWak0eqXrWHUrvozwiThAZ
	 O/oddYWS2oJnYVh1Ukj+xI2jdbLINJB7vj15eDbfGly59j9vigTWap2tql1FWoxTqD
	 qxZcJEcEakz6fY5rvvj8jgSr6n54GNvEOzh8BxLcrylU7ejDWXU3KwGO+fCWRFh71a
	 1n1vExq+SSVNQ==
Date: Wed, 6 Mar 2024 17:54:31 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Hans Hu <HansHu-oc@zhaoxin.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	cobechen@zhaoxin.com, hanshu@zhaoxin.com
Subject: Re: [SPAM] Re: [PATCH v8 6/6] i2c: add zhaoxin i2c controller driver
Message-ID: <Zeifxys1OxWQrste@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Hans Hu <HansHu-oc@zhaoxin.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, cobechen@zhaoxin.com, hanshu@zhaoxin.com
References: <cover.1709014237.git.hanshu-oc@zhaoxin.com>
 <4e9c2c3a3940a00da67564c6e19f4771ab6dc67f.1709014237.git.hanshu-oc@zhaoxin.com>
 <ZeWZHSt-qm5wH3wn@ninjato>
 <7jopk32t6ygaxgo27ln2bsqhgsces5d2hxxri6g3la6datrlxd@llfdg36ldr4b>
 <c0eb2886-6250-4f67-8b17-c6ba953a42d3@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iFb6S1sCTNbTVjsu"
Content-Disposition: inline
In-Reply-To: <c0eb2886-6250-4f67-8b17-c6ba953a42d3@zhaoxin.com>


--iFb6S1sCTNbTVjsu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

> OK, the issues you mentioned will be fixed with a new series.

If you do this new series, please make sure you rebase it on top of
Andi's for-next tree. He just applied a fix for wmt, namely:

"[PATCH] i2c: wmt: Fix an error handling path in wmt_i2c_probe()"

Your new series should be on top of this patch to avoid merge conflicts.

Happy hacking,

   Wolfram


--iFb6S1sCTNbTVjsu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXon8AACgkQFA3kzBSg
KbZFmA/+I2cNXuBq5GjumuIByAK/jpP43+e5JiI03HlmRXt30wMUdhzUTrtenfP4
7vbmQ+8s3GQe80zyYmeymzK9JSHeCt/l9VlIBHC6qUOsNXYUHown6WuTRNDT4BKS
AtLwTB1KpMCKszXLrp9iCHJidCtr6R/yWh69lF/LPQ7eH2Equs7U2fP8BgSMe/CH
DqzgzmKuvMJuGYUBr9dUgbFqFvZHXfN1rUTjKlS22vsQMOylNsaSIAN4SMwkgh6x
RiOTOPANk1NPCjt9fCm5BK2kjfOninPiHGi8wYsQFqN9hNPqq1/yETk/Oj2E8mxi
A1x4UK0JHXqnlgVhytLwfSqPOcQZm3KftHxvp1rj7b87Pql+mjq6JxUJy0aaqMtZ
7KKVpMLVXJE6OuFX0YHEx8gVJldyJXfCbjfckDKgwJkqTlW77TIswVcaUbVG+FKm
AB4hgcuLrQJkU0WPZzRWL4yv1uA8OaNnlzFg8/p2ZFiN4zU4cl4H1429XWUyHS6V
4txKQLwKUnT2kz4gwLf4bEMaOKWiD10j61Tt42BFQOzJpwo2Y+ZJhuQQQUJAitmu
g02ZnC7sbvQDKehKgSja6kJUudnbZAKmwSbFn9YVQ0nQ2U0v5S5iz1cIs2CHKxhP
9qcAZYPRJHhswAwdmgL8tIp33v+O1EuzI8XDvOSW0oHcyDi5HQA=
=Q75/
-----END PGP SIGNATURE-----

--iFb6S1sCTNbTVjsu--

