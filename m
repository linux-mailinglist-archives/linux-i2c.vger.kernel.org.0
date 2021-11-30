Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEEF4463090
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Nov 2021 11:03:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240739AbhK3KGm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Nov 2021 05:06:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240736AbhK3KGc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Nov 2021 05:06:32 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98E75C06175B;
        Tue, 30 Nov 2021 02:03:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id A22F1CE185A;
        Tue, 30 Nov 2021 10:03:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B4CFC53FC7;
        Tue, 30 Nov 2021 10:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638266582;
        bh=/x0GGzKFVt0Dy7r4zIhS59DKhLpLSCOv6TfyEvgAn/E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aiu3DAfh8MthxvWAwRpRhPEHK7GTD+ROtg4Dm6dvj0giFP+oAyQUQur5meks8hFGP
         xuoAtkqMJU7VwQOPbx31xQwgPdJ0+dqObWX30klV/fxaYpUJd1uxc3uuXN6efBS6t8
         qUf7xqXNNwIEhUchAaROr2KK0DqSjkUkxLr6cn1oBAjecy1FeMXbdsY5XGuDJKWubv
         cMOhPNvXlMq/NAdBslnbglXQvN8JZYemEbx+uDKiEVgmQ57wjqZJK+6hGy4YJ/CNNc
         vT+Yp2G1ct1I++ZlivOFy/AFf8+7eG88Vfgh17aIeLPuf6VzqN/6CGaw+a2S2Ch+im
         4/FQP9oDaLUdg==
Date:   Tue, 30 Nov 2021 11:02:59 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Quan Nguyen <quan@os.amperecomputing.com>
Cc:     Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
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
Message-ID: <YaX2021qO696FG1D@ninjato>
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
 <YaUoeFZn6zLNoGed@kunai>
 <b8ee3be7-c0f6-d1fd-1ba1-13066b329ee3@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GLgFZVkdCWguog1a"
Content-Disposition: inline
In-Reply-To: <b8ee3be7-c0f6-d1fd-1ba1-13066b329ee3@os.amperecomputing.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--GLgFZVkdCWguog1a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

> Thanks Wolfram to help bring this up,

Sure thing! It would be sad to see this work bitrot.

> This driver was tested with Aspeed ast2500 and we have tried many way to
> avoid using slave_enable() to toggle slave mode but there is no progress.

I see. I also can't help you there. I have neither experience with nor
access to this HW.

> Our expectation is still to have this driver upstream'ed and I'm thinking
> about testing this driver on other HW and re-post the driver.

That sounds like a good plan.

> I have to admit that you are all right with the above comments. The fact =
is
> we still not be able to find any way to solve this differently. We don't =
own
> this HW and dont know what happen on this particular issue. The SCL clock
> stretching on this HW does not work as expected and the slave_enable() is
> the only solution for now. I hope if someone could help with the issue as
> well.

=46rom this distance, it looks like HW access and a logic analyzer might
be helpful in understanding the behaviour. Pity that you don't own the
HW.

Good luck nonetheless!

   Wolfram


--GLgFZVkdCWguog1a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGl9tAACgkQFA3kzBSg
Kba4dA/+LQ+TgyjbUYOZOjpRRji7agnQYuqCWgQAJb0L8O9WQWEaoPwlAYP2DpHP
WdVIVnuLhRvwWKSI2yNAJRZURY4fbvrSAXFoeyY1DrxxLVj7GB4Ku9dKGUQEu8vk
SufpI4wpozucy32ZHAY8sDlquSILlCHEchyb8851rfbBWKBhQfKwNtO+vwEYqcy6
UqEp1wxYUV0WpXCDiGXb3m+qViyb84t54YzBSHzKvBFYyRi1S94BESgQ3W2XVRPA
BGwy+uhgF32jeBFs6wdv+zCpq+NBmAZg/czXt2naPF6HkNjG4ZTMgROmqoery36M
VEuhlE6us23UVcCDujArrFcH1+qhhTYSAOxZZ9qDSWYmsxxF0k/fHi55bszcCoyE
Ba3OFUe8TKMfYARMkjpRtN60aLtq/E7M+X1/774Q2BUvvS9UVUMs5jK7umQsuJ/3
7BZIFiXT1RKExUKxD5dHVyCXnO6AoF1t3aNZlqlgo9IDmWhQeyfqM+oHwBjqINYD
hmLL3djjgpe9DksOXDFu17ywiSB33+OvfWhO502tbDrv+QxIbsIR4G+wffxcUG+b
Ts8pgy7y+6cdNxLvrpUv+SjzATHxRmwWuTGNr8hlgxtckDybKKkWeEmQLdIlrVYg
Y24ut60ocJP+alOr+eP2bqQDyNqx+ARwSFBP6FKA+04ASyeNrro=
=qe3w
-----END PGP SIGNATURE-----

--GLgFZVkdCWguog1a--
