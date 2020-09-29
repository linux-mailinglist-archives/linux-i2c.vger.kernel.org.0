Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA5FA27D702
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Sep 2020 21:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728264AbgI2Tev (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 15:34:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:37034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727354AbgI2Tev (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 29 Sep 2020 15:34:51 -0400
Received: from localhost (p54b3311a.dip0.t-ipconnect.de [84.179.49.26])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D6C4820774;
        Tue, 29 Sep 2020 19:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601408090;
        bh=PsZPx3lxMNafplRHoMhViKeyg2/oibgfdPhUEMQxJCM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NyT3XLbtwlQhjBIna5DnIk5ZbQAjaGNqb5iFTcygpo7QgahOTpM3L5UdMb0nNb4/a
         Bu9JGJdg6midiahHa1nXvtsCMvfEp3X9TR8oKjqPT0VacAKo7Q2x/2+d9tmTmBz+M5
         Tn6yjy5/NfQaTNWGmJzc6jGBPURSza/UbaN6BBIc=
Date:   Tue, 29 Sep 2020 21:34:47 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] i2c: i801: Add support for Intel Alder Lake PCH-S
Message-ID: <20200929193447.GB2010@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
References: <20200924135217.797605-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="b5gNqxB1S1yM7hjW"
Content-Disposition: inline
In-Reply-To: <20200924135217.797605-1-jarkko.nikula@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--b5gNqxB1S1yM7hjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2020 at 04:52:17PM +0300, Jarkko Nikula wrote:
> Add PCI ID of SMBus controller on Intel Alder Lake PCH-S
>=20
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Applied to for-next, thanks!


--b5gNqxB1S1yM7hjW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9zjFcACgkQFA3kzBSg
KbYTKQ//UejtNEhWjesP5iNpHCQ6UCRiLlKpmr4aw/b2yaxudGf6w3Q1Xslmatyn
6vmWqL77sbf/vjySgTx5NdDs7eCy24HnQPDlntBQvC4niQ38+cOD4kqPfjL3CUK7
8F3XR4khSJ2M+NWEvXVFOrK+xQryQ2/ejJsMB1fVWMYqATjgaABfZW7ZE5hbIkTI
7L4HjQuOidH1XnjDdVAhs71tyKJeGHu8nJvT93uyOB9g1r0CLP7qHuAPn8afXrvK
ZKqub5nmk4OqnCN//S6boh+HQxMe0DFgtzOONaS2vOC3/tXaSYq2JzL2za+L3l4p
8516pFwnp+9HtWht38qLk0X7Jda8VLkNXJpKyyBLYSZ4SBav6uu1p6y0ldBMRK1S
c7Hie5r1f/RyvsM5EROYKP07qesS6DUuGtFs2m0mrGLL6Div+cqwbhGI/ga7QoSp
xwWc/L3JCB84A4T7x+bUaEGfkamRYS0DD2ugRHtMXpbSjtIIsWqrD0MgJqJdp9Dv
OaStzpV9oXV05eOm5cCgeUvEhH0N+5TVBfuiNwuzB0h7JXcuP7Li9UZdN5JOsCyv
dAvvLh1O+6BTFo0BM9JLZ/OV/bGD8+DkW9AFky3FywAIEJebuicsCB+zN05dT2sn
TkmD4Zp1fJawBd/lUzBHaMU8Mrx27hcXrrC2EJ0c7e25EbhXOi8=
=LvVd
-----END PGP SIGNATURE-----

--b5gNqxB1S1yM7hjW--
