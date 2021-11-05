Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 682FA446AB1
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Nov 2021 22:47:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233230AbhKEVuG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Nov 2021 17:50:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:58260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231553AbhKEVuF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 5 Nov 2021 17:50:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA75160E05;
        Fri,  5 Nov 2021 21:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636148845;
        bh=TQs0+F04/oKVbMgAcjYQgO7ye1O8bHJYSXZeXUSAv9c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r2IMv+U5qcRAO1iEFR9rcNHnHZlqQoN8aW9FajqOhSK+E5XpvUkolfN8LwCzGxqgz
         vPlVLY1nODh99w7H/yD5STBeInuphVQywNZLzofvtX3nw++SQMDy0JPz+RbuiSvnvW
         wmLejAY99RIrax2QnPMK79F9VRvpFahTgeXEPWail5HZNmJoSVUesObrf/QGSd7CWb
         GmA9Y6NSMNyRKaNbin6mF8hkTqwA6SAE5l+oZK6ZlaP8J3oDla0dOdwXLzZl1Gl8XA
         V9I/ChMsQf78Pu3XrrKLbqnZ447NByHAZJnSBkW3B1ID8FXCyG7ztPXdjX71gUN61q
         m6kQbAlVQAtuw==
Date:   Fri, 5 Nov 2021 22:47:16 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Horatiu Vultur - M31836 <Horatiu.Vultur@microchip.com>
Cc:     Codrin Ciubotariu - M19940 <Codrin.Ciubotariu@microchip.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Nicolas Ferre - M43238 <Nicolas.Ferre@microchip.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        Ludovic Desroches - M43218 <Ludovic.Desroches@microchip.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] i2c: at91: Add support for programmable clock source
Message-ID: <YYWmZMc8eVq5SZYj@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Horatiu Vultur - M31836 <Horatiu.Vultur@microchip.com>,
        Codrin Ciubotariu - M19940 <Codrin.Ciubotariu@microchip.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Nicolas Ferre - M43238 <Nicolas.Ferre@microchip.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        Ludovic Desroches - M43218 <Ludovic.Desroches@microchip.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20211012140718.2138278-1-horatiu.vultur@microchip.com>
 <8a775c67-00a3-1dbe-daa3-09a537f482d8@microchip.com>
 <20211013114144.7j4scdaq2rjfmiwn@soft-dev3-1.localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FaPzQSzCwWwdczBx"
Content-Disposition: inline
In-Reply-To: <20211013114144.7j4scdaq2rjfmiwn@soft-dev3-1.localhost>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--FaPzQSzCwWwdczBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I think actually I will drop this patch series because apparently
> lan966x works fine also with the peripheral clock. So then no changes
> are required.

Not even patch 1/2?


--FaPzQSzCwWwdczBx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGFpmAACgkQFA3kzBSg
KbZAqxAAowoqz8CdQEFSo9FvrZdqjhMjxp+PhybAQqbhg0clVa6dBaddregADvq9
97zB/W53PXmFHLvnQLO7WkvlxTyvY/nJ23g+vYhNL8NYO5GOnAzQ0m4LANJeWYLW
Tn7iEQOrN84/Fo6gi5Pjsk+j6Hn//F3ytW1OqPxJOY1Jdu1A8Rjl0Sfa6PUJ7ijG
Wx/FqLBhMpR4Ejmhz+kOdGvGnF21xEtt6o8NTd2IBbVaqdqSH00bfDCz0W86fdRY
V8e9frIUe4M9fvBYk0j30K9TS7GbTug5AxHAPD7IOKLJSWL+7SH9xbRG4DxSBx4v
gSzPxeQ/Yt59CBUitlYt5Dbr3940B2qOkFc0pER+l8Xe9oir0CdYrW3FUJu6J7fL
0HvKRU5IBu41oVT36KkDVNpt5yGe2dd/IpCyjTcckI98nNh09TxvuFaxQUnSbNFf
1lPMe5F7494+nKTKPyv6TfgxZUFyfk170sjYBajEtxYps8dkvd1ydYRDlQhUlQkv
cQT18/M+hFaxzScKy/opfTnRDRtoeF9PLy4ltrjRuH8elTqgziySNTjj0E63ctoE
KDhdH6/FJTCQ3gSnZUUhEP7BnRIMO4Xb+gDCF46PDAoOFC/kUGCnFGE0psSimo0E
vU1aDlqXXRjauIOpZTbswbnGROtNr16uEmLuRAJtjrfUrUsxFVU=
=pkHS
-----END PGP SIGNATURE-----

--FaPzQSzCwWwdczBx--
