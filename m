Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6950246E4B2
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 09:57:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233176AbhLIJAi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 04:00:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232038AbhLIJAi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Dec 2021 04:00:38 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 750A7C061746;
        Thu,  9 Dec 2021 00:57:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id B42ECCE245E;
        Thu,  9 Dec 2021 08:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FE2DC004DD;
        Thu,  9 Dec 2021 08:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639040221;
        bh=HUS9Ptxfx1asXriXFVwCYuojXtKlYmv3/KEbAbzET0s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LNK7id6T0M3fR3WbL33MKzfJGTaydjTX9Yii7StWqsEjMkHNxMddbLU3KCqdN330C
         iqvqvaMFVKSga6+n9NB6IqtoiZR8EH/flgdu93L052OBfNyVNL4dUyPNiAB8dwbmWD
         vboOOEco3u78aSMrvshsFXV2WjKJJ6hgvc6sBsU7rRxaaFpwkqWfCv8EHHzsWDrp2L
         y1/qh64t1+HGvTs1hTipMNrOzlXQNVQt92j+hWy2TNafd5vRJrPB3Cq4/MtnlI+GL1
         0fN4aiv61TlPYDDPlZK6I76FnsVgy9R6eGWy4JxrYRKB/BsOEHW7HxmkJ+NrrJPAVu
         zREt2HRf22KUw==
Date:   Thu, 9 Dec 2021 09:56:58 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     David Heidelberg <david@ixit.cz>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Stephen Warren <swarren@wwwdotorg.org>,
        ~okias/devicetree@lists.sr.ht, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: brcm,bcm2835-i2c: convert to YAML
 schema
Message-ID: <YbHE2nR2T+o9o8ji@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        David Heidelberg <david@ixit.cz>, Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Stephen Warren <swarren@wwwdotorg.org>,
        ~okias/devicetree@lists.sr.ht, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20211206184613.100809-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xJzInEz65zJn2DKF"
Content-Disposition: inline
In-Reply-To: <20211206184613.100809-1-david@ixit.cz>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--xJzInEz65zJn2DKF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 06, 2021 at 07:46:12PM +0100, David Heidelberg wrote:
> Switch the DT binding to a YAML schema to enable the DT validation.
>=20
> Signed-off-by: David Heidelberg <david@ixit.cz>

Applied to for-next, thanks!

David: Please quote only relevant parts of the messages when replying.
You quoted Florian's tags as well and so they ended up twice. Also, it
is easier to read, then.


--xJzInEz65zJn2DKF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGxxNoACgkQFA3kzBSg
Kbanow//U0RpDjbOB8K6jH1RIrbx00AN3tnq7Cu0C0YP/0CSQ5si9aoNbirxI46o
kjEV5NAgHxZKjo6wfz9ZMsenfqarDC40XRPs+JVsY2LaMWA6/i/8Lc2WPkpV8B4S
ulkhIqW59iC9cMEGGgfNTU9euvRzqtfMQYYXVCwqXA8P4rw0F+7CrmyU/MtCec0H
YxoHG/wiQyy4cMVN+NWYLA3pQVccb9QDO8DUBe4tKKhFUOYcchIZNA1u1MbYTA5X
TKcSYj0RGWz8Ut5yxHji1nJf9g7G8ajEnV7m/kWmx30o1A2Q2yRmYah18j/6YEG9
aQGVglG14ZcaE9vHxoQGMuy7KwTjX1ECyOg4EeQKMUQRi0tGM4MHd7Zy1+y5P5qG
qZwgtx0P4uGIKGk6o9rhHDr7D/OeTxl0eW6CFJXylqR9giFrzPkRxgUJIo4+KA19
eyZ4yGCPMIWC4HzCYPP3TfzYD6etk7d7b4i/1BYGS1AHqzXxVxiayO6wlSHAXdWz
hNMP05D7kpWpADnSzrmLywvb3LVXKEg32H+hVobZ8SHUHvsGN76SXFU6m2WNHGAb
rFPwYfiaa0WqGSx7ZmfmTGT2YoAoAk7NOz/F2/sfmaYIJbx+35BhV7TsOuxGVz/S
lwGMfZ2greQ1GfJxINEZNaKKHr5nuZa5Q64oS28mIItYaROkykI=
=oC/n
-----END PGP SIGNATURE-----

--xJzInEz65zJn2DKF--
