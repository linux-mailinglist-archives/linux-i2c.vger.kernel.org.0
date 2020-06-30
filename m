Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC9120EEA8
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jun 2020 08:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730257AbgF3Gk6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Jun 2020 02:40:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:59894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730190AbgF3Gk5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 30 Jun 2020 02:40:57 -0400
Received: from localhost (p54b336a9.dip0.t-ipconnect.de [84.179.54.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7745D20759;
        Tue, 30 Jun 2020 06:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593499257;
        bh=RX90ObIhUmfx3K1A2GZuj3Lg7k384IJge1N8Jz6T0PI=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=aUX8D9fzGJti06YARU2Lq98HrOC60xHG8vez6U/y7A1phBsgbnyHcoNvhEIeNNp+b
         4o9wJS9INTSWmIOIiTZtAYM6fLElg8o/ChSSgeCzxRcELzhJka7CQoKgaq8jTD/Akk
         gTtVPoxw8EB4+y0yfJJb97P4YtrRSFsBkWvjv6iw=
Date:   Tue, 30 Jun 2020 08:40:50 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        robh+dt@kernel.org, mark.rutland@arm.com,
        pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com
Subject: Re: [PATCH 4/4] i2c: stm32f7: Add SMBus-specific protocols support
Message-ID: <20200630064050.GA996@ninjato>
References: <1588657871-14747-1-git-send-email-alain.volmat@st.com>
 <1588657871-14747-5-git-send-email-alain.volmat@st.com>
 <20200523110140.GD3459@ninjato>
 <20200526103938.GC14423@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="n8g4imXOkfNTN/H1"
Content-Disposition: inline
In-Reply-To: <20200526103938.GC14423@gnbcxd0016.gnb.st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alain,

> > So, as mentioned in the other review, I'd like to evaluate other
> > possibilities for the above:
> >=20
> > - One option is to enable it globally in probe(). Then you lose the
> >   possibility to have a device at address 0x08.
>=20
> I'd prefer avoid this solution to not lose the address 0x08.

Understandably.

> > - Enable it in probe() only if there is a generic binding "host-notify".
>=20
> Do you mean having the adapter walk through childs node and see if at lea=
st
> one of them have the host-notify property ? This mean that such solution
> wouldn't work for device relying on platform data rather than DT nodes.

I meant a generic binding for the host-controller. It could be seen as a
HW description if we need HostNotify on that bus or not.

Maybe it becomes more clear with the R-Car I2C controller as an example.
It only supports one slave address. If I want HostNotify there, I can't
use another slave backend. Now, it could be that I need the slave EEPROM
backend, although there is a HostNotify capable device on the bus. So, I
am leaning to have a generic "host-notify" binding for the host.

I consider platform_data legacy. If we use device_property, we should be
safe regarding all current and future HW descriptions, or?

> > - Let the core scan for a device with HOST_NOTIFY when registering an
> >   adapter and then call back into the driver somehow?
>=20
> You mean at adapter registration time only ? Not device probing time ?
> At probing time, we could have the core (i2c_device_probe) check for the =
flag
> HOST_NOTIFY and if setted call a dedicated host-notify reg callback ?

As said above, I am leaning to the generic property. In addition, it
doesn't feel right to me to add/remove the HostNotify feature at runtime
depending on the client devices. Imagine someone changes another slave
backend to address 0x08 and the HostNotify device comes later. Then, it
won't work all of a sudden.

It feels much safer to me to declare HostNotify as a feature of the IP
core which it either has or it has not, configurable at boot-time.

Makes sense?

Kind regards,

   Wolfram


--n8g4imXOkfNTN/H1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl763m0ACgkQFA3kzBSg
KbaoHA//ZP1N+SLlANCFN1u1vk5xwRz/j0YJbS8Spi7/Gx0c9+tDSJbPrSEe5BhQ
KyI8OB/LtPVhDlk4xAGXRDIOTq9Ul629zbLFyLt3rIjq5wDL/4JfhntZAOsTdEuA
Y9w1OQrh5tv6oYx3P/iKyQkCHOPTL9hvaWaRx9RMNF7Z8EuHeiQniozJSyM56E6w
bDEu05wsSIoJgt8MlAfpCeeU74FJn4aa9iu5muFTeL077BgFB8qQTrUIJlbCy7gR
uPF5vvB4nq35sVjgRTCs/Bj5foGuLpi/q2yK0zDAvMRCF6fDX0HNXHclrx505NnZ
iTgFOutoRxscMHQS7rA3CGxEI5Gb6+W1SNXwpmT6hlFqXQkmcwrrNmcDbMuPXsC9
StNMDE1HpxdpQ5quVQ6Y/pLdfYVDD2O9QHadsHg5ldxp+I0x3oe+x4Th+uXvtxaz
OtM+VDKbJ33pBwb5QHLOmse+KHcQFfoFJ+0l2XDcQ6+qOyLN/9eOI1A3lEnA6m+W
r6EhwIV4pzohjRXpV/SlW2m2cI2wZPluvnRuSuD811A9H67oTAHsFEEE/IN0GwP6
JCbX2TDa8zwglLHq+goqVyS1E9VtQkN35Igk0zhpSeJ04xJSdI1mU07SHR+stXCw
cWrMSoqsOKJdzlotxv37dr6q9VscBNd2thkdC8DP+VoufMX8aJ8=
=HRaX
-----END PGP SIGNATURE-----

--n8g4imXOkfNTN/H1--
