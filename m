Return-Path: <linux-i2c+bounces-8667-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7449F92F4
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 14:17:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1C8E16CC27
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 13:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E3632153EE;
	Fri, 20 Dec 2024 13:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VJA8JWcW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFA086349;
	Fri, 20 Dec 2024 13:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734700589; cv=none; b=DD9uIJsvQVtpF3bpAvfjlHsRuNvCgJveLNvtNOGYjH/2vDw4tLS18C33yRz49z664oCyjg+Yu3iBLvKGR67wfkk7Wxd4gfv+1URNS/V62sJVGeA90kX4tYA4N+Dk3qJW0Y48jirtV0OY034OZHKKqoODGfpB6sjZqnt9BnbBTOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734700589; c=relaxed/simple;
	bh=fcbMFdWZ9oZ+6cASJ3ukH0vsKnGZwM2cLwN4nCdwGB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qf1yy9szqyupVMUAfWsf3LTaAk2feBIRZdmtgY5Y0rbElUGnZVuogQRciYZwuo0ZUorVUxUaMvOD+3JJ5NdyevR8Le3DnTHkg123BJ+mycY6I9HUtCrVbiUZCQo4VPahiStBHhG2v/3lO4gibi57eaP9qQef6893jHydl72UrxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VJA8JWcW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21130C4CECD;
	Fri, 20 Dec 2024 13:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734700589;
	bh=fcbMFdWZ9oZ+6cASJ3ukH0vsKnGZwM2cLwN4nCdwGB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VJA8JWcW6wj/aeYHmdpmoU1S4cbHBPdj8dAQO9dWuZm8JVl4XxeMF8qzfC9Vsrwil
	 vygkmIBFN5FCILk4U4vx/luokf/YaYks3puux9yXw5NNmdiRYoF35opgsFbaD61Zex
	 gGQwv7GmVS+/R77b8xvjJrCyWeUD4fvt58zWJYzSyglEHpZClCx2SFsW0Zd5k3j36v
	 lLR+mMemkmpN0kZytjiNBBQZy+P24BEOBjIc54PI4wc7XqoEru9EGJT43Svm855SEX
	 VSqQLZHzAGRN9S/Y/Qo62seOYhx4vHfVSVgG8qBe5ikXVaXzFxj+4VPsWWwzEkNW8V
	 036lDY6x4svjA==
Date: Fri, 20 Dec 2024 13:16:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Fabien Parent <parent.f@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	vinod.koul@linaro.org, Fabien Parent <fabien.parent@linaro.org>
Subject: Re: [PATCH 2/9] rust: add abstraction for regmap
Message-ID: <8b85fbfa-ffb5-48d0-ba7b-0e26001ab3ae@sirena.org.uk>
References: <20241218-ncv6336-v1-0-b8d973747f7a@gmail.com>
 <20241218-ncv6336-v1-2-b8d973747f7a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lAMR5aRUK7y3jhHD"
Content-Disposition: inline
In-Reply-To: <20241218-ncv6336-v1-2-b8d973747f7a@gmail.com>
X-Cookie: Body by Nautilus, Brain by Mattel.


--lAMR5aRUK7y3jhHD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 18, 2024 at 03:36:32PM -0800, Fabien Parent wrote:

> The abstraction is bringing only a small subset of all the features
> provided by regmap by only supporting the most vital field from
> `struct regmap_config`.

I'm not so sure about that...

> +int rust_helper_regmap_field_write(struct regmap_field *field, unsigned int val)
> +{
> +	return regmap_field_write(field, val);
> +}

...this is wrapping the field API.  That's not very widely used at all,
and all the usages are in leaf drivers rather than frameworks.  Given
this and that the code is basically simple syntactic sugar rather than
any substantial logic I would suggest not wrapping this for Rust but
instead writing native Rust abstractions that do the same thing.  That
seems likely to be less work and give something that is more pleasant to
use in the Rust environment.

Indeed, it looks like the actual core regmap APIs aren't wrapped at all,
only the field ones?

> +//! ```ignore
> +//! regmap::define_regmap_field_descs!(FIELD_DESCS, {
> +//!     (pid, 0x3, READ, { value => raw([7:0], ro) }),
> +//!     (limconf, 0x16, RW, {
> +//!         rearm     => bit(0, rw),
> +//!         rststatus => bit(1, rw),
> +//!         tpwth     => enum([5:4], rw, {
> +//!             Temp83C  = 0x0,
> +//!             Temp94C  = 0x1,
> +//!             Temp105C  = 0x2,
> +//!             Temp116C  = 0x3,
> +//!         }),
> +//!     })
> +//! });

You might want to include some explanation as to what this does because
it's quite unclear.

> +//! fn probe(client: &mut i2c::Client) -> Result {
> +//!     let config = regmap::Config::<AccessOps>::new(8, 8)
> +//!         .with_max_register(0x16)
> +//!         .with_cache_type(regmap::CacheType::RbTree);

New code should use maple tree unless it's got a good reason.

> +    /// Use RbTree caching
> +    RbTree = bindings::regcache_type_REGCACHE_RBTREE,
> +    /// Use Flat caching
> +    Flat = bindings::regcache_type_REGCACHE_FLAT,
> +    /// Use Maple caching
> +    Maple = bindings::regcache_type_REGCACHE_MAPLE,

Maple Tree.

> +impl Regmap {
> +    #[cfg(CONFIG_REGMAP_I2C = "y")]

Built in only?

> +/// `raw` should be used when bits cannot be represented by any other field types. It provides
> +/// raw access to the register bits.
> +///
> +/// # Syntax
> +///
> +/// `raw(bits_range, access)`

Given how many register fields are just a number I'm not sure calling
them "raw" fields really conveys the right message, it sounds like this
is bypassing things that should be there rather than a perfectly normal
thing to do.

--lAMR5aRUK7y3jhHD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdlbiQACgkQJNaLcl1U
h9BZYQf/YWG6Ra0eYK7OmmDmcOPVNpFJekn/pwMDeRk0IqTqww4wjrKoT6K728BZ
RLor6g+fPM18bqUNbgqoJa2vDsTzv5PKrp3YPQ0cYfGKPABXm25fwvBup7nx+VML
cmi9Lm/h5ojqMPvFMDQf+ElF80JqWLC4mLPgMCd/ZST87Pg+qaMk+IPolTe8f1f7
qOiQJ35oxDMqKD4JBUeQfXTFKh3Qx7VeMXS4b7PZaec1ZbaAjnsA9Nue8T4boRnp
jivFsszBtu5KflBtVX04N8BzMw0KvA6dVE2Lx3ijsBXkwihIHldXjKg/RayRkScJ
k5RA2Br+WX+KDnU+xk5sR+ExExzQGg==
=k8x4
-----END PGP SIGNATURE-----

--lAMR5aRUK7y3jhHD--

