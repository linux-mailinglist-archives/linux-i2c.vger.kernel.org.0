Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2471A462065
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 20:24:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231840AbhK2T14 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 14:27:56 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:46308 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351964AbhK2TZ4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 14:25:56 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E5DD5B815CF;
        Mon, 29 Nov 2021 19:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F090EC53FC7;
        Mon, 29 Nov 2021 19:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638213755;
        bh=Y5NwSlQVKu/RjuujNCewGKGidAPlSFDXVTVyAhtaMd4=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=rP23YM30IC0YD3XcoytOUD3nAaBxVfg9sYjCOZfzb8zunQm8ShvGTG7V8Uvl21RZ2
         Rtalf+oKhumJ6V0JtMg8w6h8MX4opoA/WJjDnBmKZnRrfEVqYufEewICYKJQKKXTEO
         +DvO8fzn4CsyDezm+73FMLG6t+IIzG1H5mnXI091jdYsOBDks/YCOqWaHJpKbvAx40
         kFBtHb48AAMNmcbHjj3Ho2cL4ObwUglELMdgRg/rVxCWIlgkcyN0a54CiicB46tpAW
         4M9fxbNtupmVZRYkGTcyRZeZsUrMGe1hMmjVmsD/S6dHwNJEH25zKtBoh6FOJX259s
         xRlhjNUjcuJJw==
Date:   Mon, 29 Nov 2021 20:22:32 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Quan Nguyen <quan@os.amperecomputing.com>,
        Corey Minyard <minyard@acm.org>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        openipmi-developer@lists.sourceforge.net,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>
Subject: Re: [PATCH v5 1/3] i2c: aspeed: Add slave_enable() to toggle slave
 mode
Message-ID: <YaUoeFZn6zLNoGed@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Quan Nguyen <quan@os.amperecomputing.com>,
        Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        openipmi-developer@lists.sourceforge.net,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>
References: <20210714033833.11640-1-quan@os.amperecomputing.com>
 <20210714033833.11640-2-quan@os.amperecomputing.com>
 <YRTQP9sX0hkTJMTx@shikoro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="d1UpdctGHU2n/12Q"
Content-Disposition: inline
In-Reply-To: <YRTQP9sX0hkTJMTx@shikoro>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--d1UpdctGHU2n/12Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I still wonder if we can't get the SSIF BMC driver upstream...

> @all: Plus, I neither like the API (because it doesn't look generic to
> me but mostly handling one issue needed here) nor do I fully understand
> the use case. Normally, when a read is requested and the backend needs
> time to deliver the data, the hardware should stretch the SCL clock
> until some data register is finally written to. If it doesn't do it for
> whatever reason, this is a quirky hardware in my book and needs handling
> in the driver only. So, what is special with this HW? Can't we solve it
> differently?

... for that, it would be great if somebody could answer my questions
here :)

Happy hacking,

   Wolfram


--d1UpdctGHU2n/12Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGlKHgACgkQFA3kzBSg
Kbaj7Q/+K++8yheJLiYAr0liA2UQdfCq+XezGICIbZAVxxsZK8n1//zZg7zn5/im
iUQ/roCf08jiF7YOvNDErnCyJTNpVvm9JHvNlYf/TvB9zv7Lwxu3ysMUFaiV00dT
c6MskoCbxYPdDEz3UtYJ6eJE4qaU0prhazQlYqJvJu1W/cN41e23eHWfiRvSPg65
ui/7bC0mCLia8VUl2OUs6MGedop+JiqmvaKm5cmoZf7Idi5wxyOVbpQ3955ys1Y/
4FWtD1YvJubfqZW0WBRDzFiesE5QY+ryqVcu4AdbwdT9jdik4t9vz0yJsgpPOQ/+
2AAnfuvzWdSvQL5+2aGITnOrT2qJDDePA87OaE0egYKyyUfX533Y8Yit1Fc5OQeh
hgTvVOzuBsaJVcJTEka49RpzuCha9SeOs8oOV1tOx7rO7tL7kLmKmUmWyj1cRm35
C15QuoyRZ83+l2v+x27L+leKiWlTabVV1/D+gfVSmt1GD/qKoc/h0Lxss1x1VGcW
YVopBoNqawQLVsX7EhordVwZNjBuU473rFfYxWPW+DDi34WaFIOlf2b0XN8gNymU
F8tQo20t7Nd2KvwhmTDUT7j5nXbEJbS3/TqeSMpOQi3kjskHWr78o267qqe0kIzT
xNkLGxWkdF71AbdjUMUJu+pxli9ABhL0OqxhZ4imhrRZBIKo0wQ=
=qfX/
-----END PGP SIGNATURE-----

--d1UpdctGHU2n/12Q--
