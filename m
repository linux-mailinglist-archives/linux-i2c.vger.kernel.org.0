Return-Path: <linux-i2c+bounces-1972-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB2A8670C1
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 11:25:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F8A51F289BA
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 10:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CABD558ABF;
	Mon, 26 Feb 2024 10:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EGyUF2Yx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B0E58ABD;
	Mon, 26 Feb 2024 10:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708942110; cv=none; b=MT2pCWooWqtSpTWKY19IrWRbRQqXiClbds78XNFFRYLIMrq/WREEdaoVD7k1cT29KG3Kxsd2m7ibd/iUiaNcacgrauzfQOO301SUZ4g3yjCaJ2Q18/0qzSuMTtrwkPcIiBRUZzEEjPfurqxNqx/ZuCo6UoGM8ezBu45WqHbs0Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708942110; c=relaxed/simple;
	bh=TfgcSNSKFYSQfL8EY/ScOd5VbPJoZVWAaTWe+zodz7s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D3r2FCxmMZNeVmnCfV9bASLxEgh9+KQLGigF23M0QtljoOFbEz4EnKQuMRCxXHTb9+g/Bw90qGEnSKtCwhucYY8Ka7+oNnP+hz6z8pbekOpbX0M9Z7e0qOf3kK62h3o0vaGeAEmmSsJdc8ouHtb/17C5B6bNfWDOoMv5vvQaTz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EGyUF2Yx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B40D2C433C7;
	Mon, 26 Feb 2024 10:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708942110;
	bh=TfgcSNSKFYSQfL8EY/ScOd5VbPJoZVWAaTWe+zodz7s=;
	h=Date:From:To:Cc:Subject:From;
	b=EGyUF2Yx0jx/47MnKEIV1YbpWeiy9khQZuYd2onoel+TX4B7kcAL25k7iGZOBEc3y
	 1t0J+4K79AAUQ0gexZmSp+Tf6Iu/WBc4AOiYarl0zZOB83gtLh2xO2oBirskyWxsew
	 RIumZ/kpH8ymun2/yZf/W1RsLUXOEDiUQXMBkTwQTmzl0hGVlpWfLd5C3LxsWbOOkP
	 B9M4XBWi9Yu0unbAlJpO4716HirRBtzOyfZGJgw6c6rc7mk7Y7xjqbx4+/3pE1NaUZ
	 KVi8vnT19tDC83Xcu/TGqu5rDeCXukinflyLU5nXcvoPBUDghD9tMBmHLCbVpYNK46
	 yjxOF12ukbmJQ==
Date: Mon, 26 Feb 2024 11:08:27 +0100
From: Wolfram Sang <wsa@kernel.org>
To: linux-i2c@vger.kernel.org, devicetree-spec@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: dtschema: i2c: messy situation about timeouts
Message-ID: <ZdxjGwvGXlDGkYs0@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree-spec@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xZIGOEhcG+EUssnZ"
Content-Disposition: inline


--xZIGOEhcG+EUssnZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey guys,

we have quite a messy situation regarding I2C timeouts in the dtschema.
Partly because I was too busy to pay detailed attention, partly because
reviewing dtschema changes happen on Github which I totally missed. No
complaining, though, here are my observations and suggestions to get it
straight. Comments are more than welcome.

- "i2c-transfer-timeout-us"

Description says "Number of microseconds to wait before considering an
I2C transfer has failed."

To me, this binding is very descriptive and makes sense. We should keep
it. Sadly, it is the newest one and we already have others.


- "i2c-scl-has-clk-low-timeout"

AFAIU this binding tells that the controller can do clock stretching.
But what for? I don't see why this is important for clients. If
anything, then it would be interesting if the *client* can do clock
stretching and if the controller can actually handle that. But no need
to describe it in DT, we have this as an adapter quirk already
'I2C_AQ_NO_CLK_STRETCH'. Two controllers use it, but no client checks
for it so far. Coming back to this binding, it is also unused in the
kernel.

Suggestion: let's remove it


- "i2c-scl-clk-low-timeout-us"

The description says "Number of microseconds the clock line needs to be
pulled down in order to force a waiting state." What does "forcing a
waiting state" mean here? I don't understand this description.

It is used in the i2c-mpc driver. The use case is simply to put it into
the 'struct i2c_adapter.timeout' member. That timeout is used to
determine if a transfer failed. So, to me, "i2c-transfer-timeout-us"
makes a lot more sense to use here.

Suggestion: let's remove this binding and conver i2c-mpc to
"i2c-transfer-timeout-us". Yes, not nice to have two deprecated
bindings, but things happened.


So, these are my thoughts about the current situation. I might have
missed something, so if you have anything to add, I am all ears.
Comments really welcome!

Happy hacking,

   Wolfram


--xZIGOEhcG+EUssnZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXcYxcACgkQFA3kzBSg
KbazcA/9FdG/a6oj1Ahq2MW9uT2iS/32c248QKavvuk4+DakyDmNwkCGgz+LJkeU
gkpWjCyrEBJqIZEuOjmTJ6fW9gRercffLeu7a9Cq/U6XN4foGudN38y9ou5sfikq
uCyCKbVok919aiPczJbnm4IhyG+wp4+isxXZWpLd7zUQezgGC/4RCi1ifwW7LQ6d
3Caobc5O5na6En9+xeEDyKf1iC0ymU3hVaXKIrIGEts9SKtGfCht//HvCuLs2pWg
YAv+pUFSCFUBn1zGzj31CO3RKAFkVZSn0IWBqdqub6/oFh6+GsKCQ6ZdkFgQQtmL
O3Mtaw9SjBw48e9frh2rpbdZHJO1+ovSOu7JG3YyZ516dtaVCLa+Ze0oePQi3H6C
zbpDi2azM8kqW9zVqZhYVLd2TyT4xS6jfaYmoUY3eDSzH/U/cMEq4+bot8ZQXMBG
yJRLV4l84PpHD+Duf3/kEG8I+/yMom6VHBNQKexuMOZjUpYJSYWoQd5Cs3VYR/oD
97kkm1xnNBteKA7qaFkcFIEQ/mjfY4bctLiyNusfgKSjzrKu/5uRlqyIboDAMEO7
3roJyes3F18Vt5wB8x3cIhuF0qCk6dx/ZRPSEeT9QX2AIw0kRKi091O5SQmDTlpq
c3BXsgELnazLw4fYYTJqEzNOa4jHazYIp6Jqo3HfXRczcL6uefM=
=9Gr2
-----END PGP SIGNATURE-----

--xZIGOEhcG+EUssnZ--

