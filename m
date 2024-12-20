Return-Path: <linux-i2c+bounces-8669-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3712F9F94DE
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 15:50:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B00C1882E87
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 14:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 759B221882F;
	Fri, 20 Dec 2024 14:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lH89QGYO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171271A83ED;
	Fri, 20 Dec 2024 14:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734706238; cv=none; b=iKKpMIkz7VabMGxIQjsPxjaAdq1EFYYyzSDkJC/TazYjyKf2oSR/GR6nfJBxlc8mgUkeXqVA71HfSQlEGJheXymHENWx9zgqyLtMBxfQg/P6HnsSyiZDCMZURquE5vLhCRpqwgJkqEc5BHAJcXsVtLykJDcpWx/T3gf3fSRjoWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734706238; c=relaxed/simple;
	bh=r4c9d0v9wioCTU7ey9H7aITQFI6J4PXM19WbW0iAJRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sBBRfU7UZeiLHH/yo4Vxye2ClbJoTjUx+jcReTj9ZIsEvh8ompQ7X+99aikELr4VMmgQxQw3cqPMUEUwwrmNfYi5m2qw0r7nkXfB2OOKpYiZZWziAq5iSYJ0jfbhBe7WVLAkoTvwjP6dh6BbDHx6PvIi28jTCfp8qBjQHQCkVWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lH89QGYO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92934C4CECD;
	Fri, 20 Dec 2024 14:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734706237;
	bh=r4c9d0v9wioCTU7ey9H7aITQFI6J4PXM19WbW0iAJRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lH89QGYON78vWWKew3aBc6aS76RBHQ6Eo55t6gNL8zMlXuiiekw5166maaKt/BY3o
	 qc358gsjbRmvCTg2k3s+uLizOntidV3nSYUw30xUh19xCE+B+XHRt1g4kJbmzaMlpU
	 sD61Fer7f433UMA0txVKBGki5PT5kcg0dbTow57qrFwABUGOJCPTmFQaDaUZxrMdRo
	 p0qcYkjsmQDEmc+GD/ndMzbP9hF/f2qb7UnkQCR9Swc+j8tT3UnRs+m6LEHGfS7bfC
	 V47kg3qPCgYOltXp/WQ36/oNEUAdrGM35rJTf11Q+VpIZy0tQEnhjmIWj8eoVzFGT4
	 4s++K1uw+o3QA==
Date: Fri, 20 Dec 2024 14:50:29 +0000
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
Subject: Re: [PATCH 8/9] regulator: add driver for ncv6336 regulator
Message-ID: <32b34f2d-21eb-48e6-9383-f2090ad05900@sirena.org.uk>
References: <20241218-ncv6336-v1-0-b8d973747f7a@gmail.com>
 <20241218-ncv6336-v1-8-b8d973747f7a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Heke4tG6+xlLnnGL"
Content-Disposition: inline
In-Reply-To: <20241218-ncv6336-v1-8-b8d973747f7a@gmail.com>
X-Cookie: Body by Nautilus, Brain by Mattel.


--Heke4tG6+xlLnnGL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 18, 2024 at 03:36:38PM -0800, Fabien Parent wrote:

> +regmap::define_regmap_field_descs!(FIELD_DESCS, {
> +    (pid, 0x3, READ, { value => raw([7:0], ro) }),

Looking at this it appears that the whole thing with only exposing
regmap fields is actually a deliberate attempt to elide whole register
access.  This doesn't seem like a good idea, it's quite common to want
to operate on a register as a whole.  For example there's the very
common case where we're updating multiple fields at once, we don't want
to do a separate read/modify/write cycle for each field.

As I mentioned in review of the regmap patch I'd expect that fields
would be layered on the underlying register access interface, and I'd
expect that we'd always be able to work with the registers.

> +static NCV6336_DESC: Desc = Desc::new::<Ncv6336>(c_str!("ncv6336"), Type::Voltage)
> +    .with_owner(&THIS_MODULE)
> +    .with_of_match(c_str!("buck"))
> +    .with_active_discharge(
> +        pgood::addr(),
> +        pgood::dischg::mask(),
> +        pgood::dischg::mask(),
> +        0,
> +    )

I'm not sure these sequences of unnamed arguments are great for
legibility.

> +#[vtable]
> +impl Driver for Ncv6336 {
> +    type Data = Arc<Mutex<Ncv6336RegulatorData>>;
> +
> +    fn list_voltage(reg: &mut Device<Self::Data>, selector: u32) -> Result<i32> {
> +        reg.list_voltage_linear(selector)
> +    }
> +
> +    fn enable(reg: &mut Device<Self::Data>) -> Result {
> +        reg.enable_regmap()
> +    }
> +
> +    fn disable(reg: &mut Device<Self::Data>) -> Result {
> +        reg.disable_regmap()
> +    }
> +
> +    fn is_enabled(reg: &mut Device<Self::Data>) -> Result<bool> {
> +        reg.is_enabled_regmap()
> +    }

I can't help but feel that this isn't a great way to deal with the ops
table - AIUI we're mapping the C functions to rust, then bouncing those
wrapped functions back to the C API.  All of this with no abstraction of
the whole fact that this is a data driven way of specifying the regmap.
It feels like we're loosing a lot of the point of having these data
driven helpers, for most devices where we're data driven it looks like
it would be actively worse to write in rust.

As with the regmap fields I'd really expect to see this handled in a
much more directly rust native manner for drivers, in this case I'd
expect that to wind up with us reusing the C ops but handled by the
support code rather than directly by each driver.  Drivers doing
complicated things might want to peer in and work with the ops (eg, some
devices need a special write sequence but the read side uses helpers)
but it shouldn't be the default.

> +    fn get_status(reg: &mut Device<Self::Data>) -> Result<Status> {
> +        if !Self::is_enabled(reg)? {
> +            return Ok(Status::Off);
> +        }
> +
> +        Ok(Self::get_mode(reg).into())
> +    }

This is buggy, it's just returning the values configured by the driver
not status from the hardware.  If the hardware doesn't report status
don't implement this operation.

--Heke4tG6+xlLnnGL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdlhDQACgkQJNaLcl1U
h9BJpgf9GSdV5m3bch32XmJ/oBqT7jdpUNJo/k4LTiDybvbwHAm9jC9UFqITlbqc
RF77c4F+MKX+pXO946MFThkUY/W/mXUyl6msByX+K45DRullW/J3SZtXSE8KsrRo
aPPhKrgEO6zISqr4a8LqaW9oZBiIVXzhElp1ScS8z8VvwVd9McYJmx/D8lIQ/oCj
8Bvm81jj8gyifw0cbOdoNG8HMD1ZD4MuODP+qIQ2+ijKsFynNFNhMP1UbCFN/ISg
00kWhzzBBuMpECh0cuyvR8hpumPizWQcY5N/91NyG6dL0D80TXZUHww4M+d/o19y
lfsZZ/YVRkXBkCe4KO+xmll3BUGrtw==
=b36A
-----END PGP SIGNATURE-----

--Heke4tG6+xlLnnGL--

