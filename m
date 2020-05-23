Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 046021DF6B5
	for <lists+linux-i2c@lfdr.de>; Sat, 23 May 2020 12:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728006AbgEWKq3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 23 May 2020 06:46:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:59110 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725908AbgEWKq2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 23 May 2020 06:46:28 -0400
Received: from localhost (p5486c962.dip0.t-ipconnect.de [84.134.201.98])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4740E2071C;
        Sat, 23 May 2020 10:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590230788;
        bh=pbReTCTmAIHmTd4BJrQV3YAqM3Cg2azMISSPySR/VeE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dkhtftQ/UB2JXoW8P545devsy9L/piU0uizM9rj9bh9fsgUV27y1zesvuLCrCYqb4
         ex99CvspcJLpmfp36jRcZUNvzuJj2aH/KIqA2Z/lAWh3C3t7erD8w209kJPvzhrcrt
         JMWBvyOa/VKZvl4R9niA0/QJ2mgpf9oYRCZpAfFU=
Date:   Sat, 23 May 2020 12:46:25 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Alain Volmat <alain.volmat@st.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com
Subject: Re: [PATCH 1/4] i2c: smbus: add core function handling SMBus
 host-notify
Message-ID: <20200523104624.GB3459@ninjato>
References: <1588657871-14747-1-git-send-email-alain.volmat@st.com>
 <1588657871-14747-2-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WYTEVAkct0FjGQmd"
Content-Disposition: inline
In-Reply-To: <1588657871-14747-2-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--WYTEVAkct0FjGQmd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Adding Benjamin who mainly implemented this.

On Tue, May 05, 2020 at 07:51:08AM +0200, Alain Volmat wrote:
> SMBus Host-Notify protocol, from the adapter point of view
> consist of receiving a message from a client, including the
> client address and some other data.
>=20
> It can be simply handled by creating a new slave device
> and registering a callback performing the parsing of the
> message received from the client.
>=20
> This commit introduces two new core functions
>   * i2c_new_smbus_host_notify_device
>   * i2c_free_smbus_host_notify_device
> that take care of registration of the new slave device and
> callback and will call i2c_handle_smbus_host_notify once a
> Host-Notify event is received.

Yay, cool idea to use the slave interface. I like it a lot!

> +static int i2c_smbus_host_notify_cb(struct i2c_client *client,
> +				    enum i2c_slave_event event, u8 *val)
> +{
> +	struct i2c_smbus_host_notify_status *status =3D client->dev.platform_da=
ta;
> +	int ret;
> +
> +	switch (event) {
> +	case I2C_SLAVE_WRITE_REQUESTED:
> +		status->notify_start =3D true;
> +		break;
> +	case I2C_SLAVE_WRITE_RECEIVED:
> +		/* We only retrieve the first byte received (addr)
> +		 * since there is currently no way to retrieve the data
> +		 * parameter from the client.

Maybe s/no way/no support/ ? I still wonder if we couldn't add it
somehow. Once we find a device which needs this, of course.

> +		 */
> +		if (!status->notify_start)
> +			break;
> +		status->addr =3D *val;
> +		status->notify_start =3D false;
> +		break;
> +	case I2C_SLAVE_STOP:

What about setting 'notify_start' to false here as well? In the case of
an incomplete write?

> +		ret =3D i2c_handle_smbus_host_notify(client->adapter,
> +						   status->addr);
> +		if (ret < 0) {
> +			dev_warn(&client->adapter->dev, "failed to handle host_notify (%d)\n",
> +				ret);

I think we should rather add such error strings to the core if we think
they are needed. I am not convinced they are, though.

> +			return ret;
> +		}
> +		break;
> +	default:
> +		/* Only handle necessary events */
> +		break;
> +	}
> +
> +	return 0;
> +}
> +

Rest of the code looks good. Maybe we should compile all this only when
I2C_SLAVE is enabled?


--WYTEVAkct0FjGQmd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7I/wAACgkQFA3kzBSg
KbbXgQ/+LcMC7QayI4s8Dvz6JvDUJwv5Hb0sbJhWY6hZjTukOGuxIPjrqZ/TqNGN
FAqr4fNEgfEH2wJw2zvuMUlqkVhAgfnw5/DtOOzDGhmogXa8eyP8VCBA35wNkLv7
glMCNfuaWYvQMZv0Ftr8atBoONlIofe0s7yIABC0KginLoUqTMLIGOzM4+JWAQ9o
l4n8aoWdmZL1/TksIOhN6UK0uxup3MPvL3KGCFh8YwFRxvRvEZOcvxbcXjZstQd3
5Rf0BYf85c0vVOxXY0V7tNUVSZtcgkKr0yyrFtRwpI0EaFwx6lR9zrclPeNZQd9p
xHwp/i3DSUL69SPOgCgeaOglKUEZqNk8i8RzBDcGBtiih5illJH+6gXuYcS9GfR2
XJgUybgtl9dQwIcr4KkZraayA4SNBiXwNcjOn1CqunS3Xv21Ep8dW3HTkv6opO1f
u1j43ZN/51NATCPp/I6OdSQqpfMhpds4BPjrAm96ZygEVYHWqAdOOs/IK2Rvdnw5
0yQBdpeqWP+oFpL/W0uUcS+u5pMjQSL8SA9hxav4FuitaECBsgeFU+k7O28Qsv4g
9w6QKh7X9oEbbiG22YLNJ+/pGbijqMSRASEyYsu6wh3GsJ/RqIC1WnsGztdNwDtR
8GXDv+ja9iaSIc28HjfMszo/vbXSlU2MJ7SwWOG1H2sFxQO3ZNw=
=EXgv
-----END PGP SIGNATURE-----

--WYTEVAkct0FjGQmd--
